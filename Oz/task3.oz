
local  X Y Z in 

   Y = 300
   Z = 30
   X = Y*Z
   {Show X}
   
end

%3B)
%The program can print Y because the thread waits until Y is assigned
%It's useful so that we don't have to be much careful with threading
%Assigns the value of X to Y