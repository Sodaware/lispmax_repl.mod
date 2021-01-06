' ------------------------------------------------------------------------------
' -- sodaware.lispmax_repl
' --
' -- A repl for LispMax.
' --
' -- This file is part of lispmax (https://www.sodaware.net/lispmax/)
' -- Copyright (c) 2017-2021 Phil Newton
' --
' -- This library is free software; you can redistribute it and/or modify
' -- it under the terms of the GNU Lesser General Public License as
' -- published by the Free Software Foundation; either version 3 of the
' -- License, or (at your option) any later version.
' --
' -- This library is distributed in the hope that it will be useful,
' -- but WITHOUT ANY WARRANTY; without even the implied warranty of
' -- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
' -- GNU Lesser General Public License for more details.
' --
' -- You should have received a copy of the GNU Lesser General Public
' -- License along with this library (see the file COPYING for more
' -- details); If not, see <http://www.gnu.org/licenses/>.
' ------------------------------------------------------------------------------


SuperStrict

Module sodaware.lispmax_repl

Import sodaware.console_color
Import sodaware.lispmax

Type Lispmax_REPL

	Field _lisp:LispMax

	Method addFunction(name:String, fn:LispMax_Atom)
		Self.getEnvironment().set(Self.getLisp().makeSymbol(name), fn)
	End Method

	Method getLisp:LispMax()
		Return Self._lisp
	End Method

	Method getEnvironment:LispMax_Environment()
		Return Self._lisp._environment
	End Method

	Method run()

		Local content:String

		' REPL
		Repeat

			content = Input("> ")
			If content = "exit" Then End

			content = content + "~0"

			?Not Debug
			Try
				Local expression:LispMax_Atom = Self._lisp.parseExpression(content)
				WriteC "=> "
				Self._lisp.printExpression( Self._lisp.evaluateExpression(expression, Self._lisp._environment))
				WriteC "~n"
			Catch e:Lispmax_SyntaxErrorException
				PrintC "%rSyntax error: %n" + e.ToString()
			Catch e:Lispmax_ArgumentException
				PrintC "%rArgument error: %n" + e.ToString()
			Catch e:Lispmax_UnexpectedTypeException
				PrintC "%rUnexpected type error: %n" + e.ToString()
			Catch e:Lispmax_UnboundSymbolException
				PrintC "%rUnbound symbol: %n" + e.ToString()
			Catch e:Object
				PrintC "%rUnkown error: %n" + e.toString()		
			End Try
			?Debug
				Local expression:LispMax_Atom = Self._lisp.parseExpression(content)
				WriteC "=> "
				Self._lisp.printExpression( Self._lisp.evaluateExpression(expression, Self._lisp._environment))
				WriteC "~n"
			?

		Until content = ""

	End Method

	Method New()
		Self._lisp	= New LispMax
		Self._lisp.initializeEnvironment()
	End Method

End Type

