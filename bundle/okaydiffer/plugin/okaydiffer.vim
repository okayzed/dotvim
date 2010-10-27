" :OkDiffRange: Diff the current selection and the short term register
" :OkDiffGit: Find all git conflicts and diff them
" Currently mapped to \od (visual mode does range, normal does git conflicts)

if exists("g:loaded_okaydiff") || &cp
  finish
endif
let g:loaded_YourAppName= 017 " your version number
let s:keepcpo           = &cpo
set cpo&vim

let s:DiffStart = ">>>>>>"
let s:DiffEnd = "<<<<<<"

fun! s:SetupDiffWin()
  " open a new window and put the results in it
  botright new
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal syntax=diff
  setlocal noswapfile
  setlocal nobuflisted
endfunction

fun! s:OkayDiffRange(line1, line2)
python << EOF
import vim
import difflib
d = difflib.Differ()

otxt = vim.eval("@\"").strip("\n") # contents of the temporal buffer
orig_seq = otxt.split('\n')

# contents of visual range
line1 = int(vim.eval("a:line1")) - 1
line2 = int(vim.eval("a:line2"))
new_seq = vim.current.buffer[line1:line2]
result = list(d.compare(orig_seq, new_seq))

vim.command("call s:SetupDiffWin()")
vim.current.buffer.append(result)
EOF
endfunction

fun! s:OkayDiffGit()
python << EOF
import vim
import difflib
import sys

class GitMergeReader:
  def __init__(self):
    self.conflicts = []
    self.gc = None

  def read_lines(self, lines):
    line_num = 0
    for line in lines:
      line_num += 1
      if self.gc is None:
        self.new_conflict(line_num)
      self.gc = self.gc.read_line(line)

  def new_conflict(self, line_num):
    self.gc = GitConflict(line_num)
    self.conflicts.append(self.gc)

  def has_conflicts(self):
    if len(self.conflicts) > 0:
      return self.conflicts[0].conflict

class GitConflict:
  def __init__(self, line_num):
    self.head   = []
    self.branch = []
    self.desc   = []
    self.conflict = False

    self.offset = line_num

    self.in_head   = False
    self.in_branch = False

  def read_line(self, line):
    finished_conflict = False
    if line.startswith("<<<<<<<"):
      self.in_branch    = False
      self.in_head      = True
      self.conflict     = True
      self.head_desc(line)
    elif line.startswith("======="):
      self.in_head      = False
      self.in_branch    = True
    elif line.startswith(">>>>>>>"):
      self.in_branch    = False
      self.in_head      = False
      self.branch_desc(line)
      finished_conflict = True
    else:
      if self.in_head:
        self.read_head(line)
      elif self.in_branch:
        self.read_branch(line)

    self.offset += 1
    if not finished_conflict:
      return self

  def read_branch(self, line):
    self.branch.append(line)

  def read_head(self, line):
    self.head.append(line)

  def head_desc(self, line):
    desc = "%s:%s" % (line.strip(), self.offset) 
    self.desc.append(desc)

  def branch_desc(self, line):
    desc = "%s:%s" % (line.strip(), self.offset) 
    self.desc.append(desc)

  def diff_lines(self):
    if self.conflict:
      d = difflib.Differ()
      results =  d.compare(self.head, self.branch)
      return self.desc + list(results)
    else:
      return None

lines = vim.current.buffer[:]

gmr = GitMergeReader()
gmr.read_lines(lines)

if gmr.has_conflicts():
  vim.command("call s:SetupDiffWin()")

  for conflict in gmr.conflicts:
    # open a new window and put the results in it
    diff_lines = conflict.diff_lines()
    if diff_lines is not None:
      vim.current.buffer.append(diff_lines)
EOF
endfunction

command! -range OkDiffRange call <SID>OkayDiffRange(<line1>, <line2>)
command! OkDiffGit call <SID>OkayDiffGit()
vmap <Leader>od :OkDiffRange<CR>
nmap <Leader>od :OkDiffGit<CR>
