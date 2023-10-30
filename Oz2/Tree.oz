%Task 2 

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
            [] "*" then Toke = operator(type:multiply)
            [] "/" then Toke = operator(type:divide)
      else
	 Toke = number({String.toFloat Head})   %If not found, its a number
      end
      Toke | {Tokenize Tail}  %Rec call
   else nil  %End of list
   end
end

fun {ExpressionTree Tokens}
   fun {ExpressionTreeInternal Tokens ExpressionStack}
      case Tokens
      of nil then
         ExpressionStack.1  %If not more tokens, return stack (all op done)
      [] number(Number)|T then
         {ExpressionTreeInternal T Number|ExpressionStack}    %Found number, put it on ExpressionStack
      [] operator(type:Operator)|T then  %
         if Operator == plus then  %If found an operator, take the two first expres in Expression stack
            First|Second|Rest = ExpressionStack in  %and add the op (Exp1 Exp2)
            {ExpressionTreeInternal T "(plus "#First#" "#Second#")"|Rest}  %Here plus
         elseif Operator == minus then    %Using "#First#" to add the First value as a string, found it here
            First|Second|Rest = ExpressionStack in  %https://www.info.ucl.ac.be/~pvr/MemoireFrancoisFonteyn.pdf
            {ExpressionTreeInternal T "(minus "#First#" "#Second#")"|Rest} %Here minus
         elseif Operator == multiply then
            First|Second|Rest = ExpressionStack in
            {ExpressionTreeInternal T "(multiply "#First#" "#Second#")"|Rest}  %Here multiply
         elseif Operator == divide then
            First|Second|Rest = ExpressionStack in
            {ExpressionTreeInternal T "(divide "#First#" "#Second#")"|Rest}  %Here divide
         end
      end
   end
   in {ExpressionTreeInternal Tokens nil}
end

{System.showInfo {ExpressionTree{Tokenize {Lex "3 10 9 "}}}}
{System.showInfo {ExpressionTree{Tokenize {Lex "3 10 9 +"}}}}
{System.showInfo {ExpressionTree{Tokenize {Lex "3 10 9 * - 7 +"}}}}