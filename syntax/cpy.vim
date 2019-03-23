" Vim syntax file
" Language:	Python
" Maintainer:	Zvezdan Petkovic <zpetkovic@acm.org>
" Last Change:	2016 Oct 29
" Credits:	Neil Schemenauer <nas@cpy.ca>
"		Dmitry Vasiliev
"
"		This version is a major rewrite by Zvezdan Petkovic.
"
"		- introduced highlighting of doctests
"		- updated keywords, built-ins, and exceptions
"		- corrected regular expressions for
"
"		  * functions
"		  * decorators
"		  * strings
"		  * escapes
"		  * numbers
"		  * space error
"
"		- corrected synchronization
"		- more highlighting is ON by default, except
"		- space error highlighting is OFF by default
"
" Optional highlighting can be controlled using these variables.
"
"   let cpy_no_builtin_highlight = 1
"   let cpy_no_doctest_code_highlight = 1
"   let cpy_no_doctest_highlight = 1
"   let cpy_no_exception_highlight = 1
"   let cpy_no_number_highlight = 1
"   let cpy_space_error_highlight = 1
"
" All the options above can be switched on together.
"
"   let cpy_highlight_all = 1
"

" quit when a syntax file was already loaded.
if exists("b:current_syntax")
  finish
endif

" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim

if exists("cpy_no_doctest_highlight")
  let cpy_no_doctest_code_highlight = 1
endif

if exists("cpy_highlight_all")
  if exists("cpy_no_builtin_highlight")
    unlet cpy_no_builtin_highlight
  endif
  if exists("cpy_no_doctest_code_highlight")
    unlet cpy_no_doctest_code_highlight
  endif
  if exists("cpy_no_doctest_highlight")
    unlet cpy_no_doctest_highlight
  endif
  if exists("cpy_no_exception_highlight")
    unlet cpy_no_exception_highlight
  endif
  if exists("cpy_no_number_highlight")
    unlet cpy_no_number_highlight
  endif
  let cpy_space_error_highlight = 1
endif

" Keep Python keywords in alphabetical order inside groups for easy
" comparison with the table in the 'Python Language Reference'
" https://docs.cpy.org/2/reference/lexical_analysis.html#keywords,
" https://docs.cpy.org/3/reference/lexical_analysis.html#keywords.
" Groups are in the order presented in NAMING CONVENTIONS in syntax.txt.
" Exceptions come last at the end of each group (class and def below).
"
" Keywords 'with' and 'as' are new in Python 2.6
" (use 'from __future__ import with_statement' in Python 2.5).
"
" Some compromises had to be made to support both Python 3 and 2.
" We include Python 3 features, but when a definition is duplicated,
" the last definition takes precedence.
"
" - 'False', 'None', and 'True' are keywords in Python 3 but they are
"   built-ins in 2 and will be highlighted as built-ins below.
" - 'exec' is a built-in in Python 3 and will be highlighted as
"   built-in below.
" - 'nonlocal' is a keyword in Python 3 and will be highlighted.
" - 'print' is a built-in in Python 3 and will be highlighted as
"   built-in below (use 'from __future__ import print_function' in 2)
" - async and await were added in Python 3.5 and are soft keywords.
"
syn keyword cpyStatement	False None True true false
syn keyword cpyStatement	as assert break continue del exec global
syn keyword cpyStatement	lambda nonlocal pass return with yield
syn keyword cpyInclude       print read known
syn keyword cpyStatement	class def nextgroup=cpyFunction skipwhite
syn keyword cpyStatement	auto public private
syn keyword cpyConditional	elif else if
syn keyword cpyRepeat	for while
syn keyword cpyOperator	and in is not or
syn keyword cpyException	except finally raise try
syn keyword cpyInclude	from import
syn keyword cpyAsync		async await

" Decorators (new in Python 2.4)
" A dot must be allowed because of @MyClass.myfunc decorators.
syn match   cpyDecorator	"@" display contained
syn match   cpyDecoratorName	"@\s*\h\%(\w\|\.\)*" display contains=cpyDecorator

" Python 3.5 introduced the use of the same symbol for matrix multiplication:
" https://www.cpy.org/dev/peps/pep-0465/.  We now have to exclude the
" symbol from highlighting when used in that context.
" Single line multiplication.
syn match   cpyMatrixMultiply
      \ "\%(\w\|[])]\)\s*@"
      \ contains=ALLBUT,cpyDecoratorName,cpyDecorator,cpyFunction,cpyDoctestValue
      \ transparent
" Multiplication continued on the next line after backslash.
syn match   cpyMatrixMultiply
      \ "[^\\]\\\s*\n\%(\s*\.\.\.\s\)\=\s\+@"
      \ contains=ALLBUT,cpyDecoratorName,cpyDecorator,cpyFunction,cpyDoctestValue
      \ transparent
" Multiplication in a parenthesized expression over multiple lines with @ at
" the start of each continued line; very similar to decorators and complex.
syn match   cpyMatrixMultiply
      \ "^\s*\%(\%(>>>\|\.\.\.\)\s\+\)\=\zs\%(\h\|\%(\h\|[[(]\).\{-}\%(\w\|[])]\)\)\s*\n\%(\s*\.\.\.\s\)\=\s\+@\%(.\{-}\n\%(\s*\.\.\.\s\)\=\s\+@\)*"
      \ contains=ALLBUT,cpyDecoratorName,cpyDecorator,cpyFunction,cpyDoctestValue
      \ transparent

syn match   cpyFunction	"\h\w*" display contained

syn match   cpyInclude	"#.*$" contains=cpyTodo,@Spell
syn match   cpyComment	"//.*$" contains=cpyTodo,@Spell
syn match   cpyComment	"/\*.*\*/$" contains=cpyTodo,@Spell
syn keyword cpyTodo		FIXME NOTE NOTES TODO XXX contained

" Triple-quoted strings can contain doctests.
syn region  cpyString matchgroup=cpyQuotes
      \ start=+[uU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=cpyEscape,@Spell
syn region  cpyString matchgroup=cpyTripleQuotes
      \ start=+[uU]\=\z('''\|"""\)+ end="\z1" keepend
      \ contains=cpyEscape,cpySpaceError,cpyDoctest,@Spell
syn region  cpyRawString matchgroup=cpyQuotes
      \ start=+[uU]\=[rR]\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=@Spell
syn region  cpyRawString matchgroup=cpyTripleQuotes
      \ start=+[uU]\=[rR]\z('''\|"""\)+ end="\z1" keepend
      \ contains=cpySpaceError,cpyDoctest,@Spell

syn match   cpyEscape	+\\[abfnrtv'"\\]+ contained
syn match   cpyEscape	"\\\o\{1,3}" contained
syn match   cpyEscape	"\\x\x\{2}" contained
syn match   cpyEscape	"\%(\\u\x\{4}\|\\U\x\{8}\)" contained
" Python allows case-insensitive Unicode IDs: http://www.unicode.org/charts/
syn match   cpyEscape	"\\N{\a\+\%(\s\a\+\)*}" contained
syn match   cpyEscape	"\\$"

" It is very important to understand all details before changing the
" regular expressions below or their order.
" The word boundaries are *not* the floating-point number boundaries
" because of a possible leading or trailing decimal point.
" The expressions below ensure that all valid number literals are
" highlighted, and invalid number literals are not.  For example,
"
" - a decimal point in '4.' at the end of a line is highlighted,
" - a second dot in 1.0.0 is not highlighted,
" - 08 is not highlighted,
" - 08e0 or 08j are highlighted,
"
" and so on, as specified in the 'Python Language Reference'.
" https://docs.cpy.org/2/reference/lexical_analysis.html#numeric-literals
" https://docs.cpy.org/3/reference/lexical_analysis.html#numeric-literals
if !exists("cpy_no_number_highlight")
  " numbers (including longs and complex)
  syn match   cpyNumber	"\<0[oO]\=\o\+[Ll]\=\>"
  syn match   cpyNumber	"\<0[xX]\x\+[Ll]\=\>"
  syn match   cpyNumber	"\<0[bB][01]\+[Ll]\=\>"
  syn match   cpyNumber	"\<\%([1-9]\d*\|0\)[Ll]\=\>"
  syn match   cpyNumber	"\<\d\+[jJ]\>"
  syn match   cpyNumber	"\<\d\+[eE][+-]\=\d\+[jJ]\=\>"
  syn match   cpyNumber
	\ "\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
  syn match   cpyNumber
	\ "\%(^\|\W\)\zs\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"
endif

" Group the built-ins in the order in the 'Python Library Reference' for
" easier comparison.
" https://docs.cpy.org/2/library/constants.html
" https://docs.cpy.org/3/library/constants.html
" http://docs.cpy.org/2/library/functions.html
" http://docs.cpy.org/3/library/functions.html
" http://docs.cpy.org/2/library/functions.html#non-essential-built-in-functions
" http://docs.cpy.org/3/library/functions.html#non-essential-built-in-functions
" Python built-in functions are in alphabetical order.
if 0 && !exists("cpy_no_builtin_highlight")
  " built-in constants
  " 'False', 'True', and 'None' are also reserved words in Python 3
  syn keyword cpyBuiltin	False True None
  syn keyword cpyBuiltin	NotImplemented Ellipsis __debug__
  " built-in functions
  syn keyword cpyBuiltin	abs all any bin bool bytearray callable chr
  syn keyword cpyBuiltin	classmethod compile complex delattr dict dir
  syn keyword cpyBuiltin	divmod enumerate eval filter float format
  syn keyword cpyBuiltin	frozenset getattr globals hasattr hash
  syn keyword cpyBuiltin	help hex id input int isinstance
  syn keyword cpyBuiltin	issubclass iter len list locals map max
  syn keyword cpyBuiltin	memoryview min next object oct open ord pow
  syn keyword cpyBuiltin	property range repr reversed round set
  syn keyword cpyBuiltin	setattr slice sorted staticmethod str
  syn keyword cpyBuiltin	sum super tuple type vars zip __import__
  " Python 2 only
  syn keyword cpyBuiltin	basestring cmp execfile file
  syn keyword cpyBuiltin	long raw_input reduce reload unichr
  syn keyword cpyBuiltin	unicode xrange
  " Python 3 only
  syn keyword cpyBuiltin	ascii bytes exec
  " non-essential built-in functions; Python 2 only
  syn keyword cpyBuiltin	apply buffer coerce intern
  " avoid highlighting attributes as builtins
  syn match   cpyAttribute	/\.\h\w*/hs=s+1
	\ contains=ALLBUT,cpyBuiltin,cpyFunction,cpyAsync
	\ transparent
endif

" From the 'Python Library Reference' class hierarchy at the bottom.
" http://docs.cpy.org/2/library/exceptions.html
" http://docs.cpy.org/3/library/exceptions.html
if !exists("cpy_no_exception_highlight")
  " builtin base exceptions (used mostly as base classes for other exceptions)
  syn keyword cpyExceptions	BaseException Exception
  syn keyword cpyExceptions	ArithmeticError BufferError
  syn keyword cpyExceptions	LookupError
  " builtin base exceptions removed in Python 3
  syn keyword cpyExceptions	EnvironmentError StandardError
  " builtin exceptions (actually raised)
  syn keyword cpyExceptions	AssertionError AttributeError
  syn keyword cpyExceptions	EOFError FloatingPointError GeneratorExit
  syn keyword cpyExceptions	ImportError IndentationError
  syn keyword cpyExceptions	IndexError KeyError KeyboardInterrupt
  syn keyword cpyExceptions	MemoryError NameError NotImplementedError
  syn keyword cpyExceptions	OSError OverflowError ReferenceError
  syn keyword cpyExceptions	RuntimeError StopIteration SyntaxError
  syn keyword cpyExceptions	SystemError SystemExit TabError TypeError
  syn keyword cpyExceptions	UnboundLocalError UnicodeError
  syn keyword cpyExceptions	UnicodeDecodeError UnicodeEncodeError
  syn keyword cpyExceptions	UnicodeTranslateError ValueError
  syn keyword cpyExceptions	ZeroDivisionError
  " builtin OS exceptions in Python 3
  syn keyword cpyExceptions	BlockingIOError BrokenPipeError
  syn keyword cpyExceptions	ChildProcessError ConnectionAbortedError
  syn keyword cpyExceptions	ConnectionError ConnectionRefusedError
  syn keyword cpyExceptions	ConnectionResetError FileExistsError
  syn keyword cpyExceptions	FileNotFoundError InterruptedError
  syn keyword cpyExceptions	IsADirectoryError NotADirectoryError
  syn keyword cpyExceptions	PermissionError ProcessLookupError
  syn keyword cpyExceptions	RecursionError StopAsyncIteration
  syn keyword cpyExceptions	TimeoutError
  " builtin exceptions deprecated/removed in Python 3
  syn keyword cpyExceptions	IOError VMSError WindowsError
  " builtin warnings
  syn keyword cpyExceptions	BytesWarning DeprecationWarning FutureWarning
  syn keyword cpyExceptions	ImportWarning PendingDeprecationWarning
  syn keyword cpyExceptions	RuntimeWarning SyntaxWarning UnicodeWarning
  syn keyword cpyExceptions	UserWarning Warning
  " builtin warnings in Python 3
  syn keyword cpyExceptions	ResourceWarning
endif

if exists("cpy_space_error_highlight")
  " trailing whitespace
  syn match   cpySpaceError	display excludenl "\s\+$"
  " mixed tabs and spaces
  syn match   cpySpaceError	display " \+\t"
  syn match   cpySpaceError	display "\t\+ "
endif

" Do not spell doctests inside strings.
" Notice that the end of a string, either ''', or """, will end the contained
" doctest too.  Thus, we do *not* need to have it as an end pattern.
if !exists("cpy_no_doctest_highlight")
  if !exists("cpy_no_doctest_code_highlight")
    syn region cpyDoctest
	  \ start="^\s*>>>\s" end="^\s*$"
	  \ contained contains=ALLBUT,cpyDoctest,cpyFunction,@Spell
    syn region cpyDoctestValue
	  \ start=+^\s*\%(>>>\s\|\.\.\.\s\|"""\|'''\)\@!\S\++ end="$"
	  \ contained
  else
    syn region cpyDoctest
	  \ start="^\s*>>>" end="^\s*$"
	  \ contained contains=@NoSpell
  endif
endif

" Sync at the beginning of class, function, or method definition.
syn sync match cpySync grouphere NONE "^\%(def\|class\)\s\+\h\w*\s*[(:]"

" The default highlight links.  Can be overridden later.
hi def link cpyStatement		Statement
hi def link cpyConditional		Conditional
hi def link cpyRepeat		Repeat
hi def link cpyOperator		Operator
hi def link cpyException		Exception
hi def link cpyInclude		Include
hi def link cpyAsync			Statement
hi def link cpyDecorator		Define
hi def link cpyDecoratorName		Function
hi def link cpyFunction		Function
hi def link cpyComment		Comment
hi def link cpyTodo			Todo
hi def link cpyString		String
hi def link cpyRawString		String
hi def link cpyQuotes		String
hi def link cpyTripleQuotes		cpyQuotes
hi def link cpyEscape		Special
if !exists("cpy_no_number_highlight")
  hi def link cpyNumber		Number
endif
if !exists("cpy_no_builtin_highlight")
  hi def link cpyBuiltin		Function
endif
if !exists("cpy_no_exception_highlight")
  hi def link cpyExceptions		Structure
endif
if exists("cpy_space_error_highlight")
  hi def link cpySpaceError		Error
endif
if !exists("cpy_no_doctest_highlight")
  hi def link cpyDoctest		Special
  hi def link cpyDoctestValue	Define
endif

let b:current_syntax = "cpy"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set sw=2 sts=2 ts=8 noet:
