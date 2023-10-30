%Task 1

%Implement fun {Lex Input}
declare
fun {Lex Input}
    {String.tokens Input & }
end
 
%{System.showInfo "\na)"}
%{System.show {Lex "1 2 + 3 *"}}


%Implement Tokenize
declare
fun {Tokenize Lexemes} Toke in
   case Lexemes of Head | Tail then %List of Lexemes
      case Head of "+" then Toke = operator(type:plus)  %Check the tail for
            [] "-" then Toke = operator(type:minus)     %The specific tokens
            [] "*" then Toke = operator(type:multiply)  %Return the type of the token (Command or operator)
            [] "/" then Toke = operator(type:divide)
	         [] "p" then Toke = command(print)
            [] "d" then Toke = command(duplicate)
            [] "i" then Toke = command(flip)
            [] "c" then Toke = command(delete)
      else
	 Toke = number({String.toFloat Head})   %If not found, its a number
      end
      Toke | {Tokenize Tail}  %Rec call
   else nil  %End of list
   end
end

declare
fun {Interpret Tokens}
   fun {Interpret Stack Tokens}
      case Tokens
      of nil then
         Stack   %If all tokens found, return stack
      [] number(Number)|T then  %If found a number, rec call Interpret with number put in the stack
         {Interpret number(Number)|Stack T}
      [] operator(type:Operator)|T then  %If called an operator, peroform interpret,making the correspondant op 
         if Operator == plus then      %with the two first numbers of the stack
            First|Second|Rest = Stack in
            {Interpret number(First.1 + Second.1)|Rest T}
         elseif Operator == minus then
            First|Second|Rest = Stack in
            {Interpret number(First.1 - Second.1)|Rest T}
         elseif Operator == multiply then
            First|Second|Rest = Stack in
            {Interpret number(First.1 * Second.1)|Rest T}
         elseif Operator == divide then
            First|Second|Rest = Stack in
            {Interpret number(First.1 / Second.1)|Rest T}
	 end
      [] command(C)|T then  %If callend a command, perform the command and call Interpret
	 if C == print then
            {Show Stack}  %Prints the stack
            {Interpret Stack T}
         elseif C == duplicate then
            {Interpret Stack.1|Stack T}  %Duplicates the first element of stack by adding it (Stack.1)
         elseif C == flip then
            First|Rest = Stack in
            {Interpret number(~First.1)|Rest T}  %Inverses the sign of the first element by using (~First1)
         elseif C == delete then
            First|Rest = Stack in  %Delete Stack
	    {Interpret nil nil}
	    
         end
      end
   end
   in {Interpret nil Tokens}
end


{System.show {Interpret {Tokenize {Lex "1 2 3 " }}}}
{System.show {Interpret {Tokenize {Lex "1 2 3 +" }}}}
{System.show {Interpret {Tokenize {Lex "1 2 p 3 +"}}}}
{System.show {Interpret {Tokenize {Lex "1 2 3 + d"}}}}
{System.show {Interpret {Tokenize {Lex "1 2 3 + i"}}}}
{System.show {Interpret {Tokenize {Lex "1 2 3 + c"}}}}

