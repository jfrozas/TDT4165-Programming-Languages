{Show 'TASK 1'}
%TASK1
declare QuadraticEquation RealSol X1 X2 RealSola X1a X2a in

proc {QuadraticEquation A B C ?RealSol ?X1 ?X2}
   if B*B-4.0*A*C>=0.0 then
      RealSol=true

      X1 = (~B+{Float.sqrt (B*B-4.0*A*C)})/(2.0*A)
      X2 = (~B-{Float.sqrt (B*B-4.0*A*C)})/(2.0*A)
   else
      RealSol=false

   end
end

{QuadraticEquation 2.0 1.0 ~1.0 RealSol X1 X2}

{System.show RealSol}
{System.show X1}
{System.show X2}

{QuadraticEquation 2.0 1.0 2.0 RealSola X1a X2a}

{System.show RealSola}
{System.show X1a}
{System.show X2a}



{Show 'TASK 2'}
%TASK2

declare Sum in

fun {Sum List}
   case List of Head | Tail then
      Head + {Sum Tail}
   [] nil then
      0
   end
end

{Show {Sum [0 1 2 1 8]}}
{Show {Sum nil}}


{Show 'TASK 3'}
%TASK3
declare RightFold Length Sum in
fun {RightFold List Op U}
   case List of Head | Tail then
      {Op Head {RightFold Tail Op U}}
   [] nil then
      U
   end
end

fun {Length List}
   {RightFold List fun {$ _ Y} 1 + Y end 0}
end

fun {Sum List}
   {RightFold List fun {$ X Y} X + Y end 0}
end

{System.showInfo {Length [1 2 3 4]}}
{System.showInfo {Sum [1 2 3 4]}}


{Show 'TASK 4'}
%TASK4
declare Quadratic in
fun {Quadratic A B C}
   fun {$ X}
      A * X * X + B * X + C
   end
end

{System.show {{Quadratic 3 2 1} 2}}


{Show 'TASK 5'}
%TASK5
declare LazyNumberGenerator in
fun {LazyNumberGenerator StartValue}
   StartValue | fun {$} {LazyNumberGenerator StartValue + 1} end
end

{Show{{{{{{LazyNumberGenerator 0}.2}.2}.2}.2}.2}.1}


{Show 'TASK 6'}
%TASK6
declare Sum Aux in

fun {Sum List}
   {Aux List 0}
end

fun {Aux List Counter}
   case List of H|T then
      {Aux T H+Counter}
   else
      Counter
   end
end

{Show {Sum [0 1 2 3 1 7 1]}}


    
