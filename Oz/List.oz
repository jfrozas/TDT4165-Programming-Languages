declare fun {Length List} Len in
     case List of Head|Tail then
         Len = 1+{Length Tail}
     else
	0
     end
end
{Show {Length [1 2 3 4]}}


declare fun {Take List Count}
    if Count > 0 then
        case List of Head | Tail then
            Head|{Take Tail Count-1}
        [] nil then
            nil
        end
    else
        nil
    end

end
{Show {Take [0 1 2 3 4 5 6] 3}}


declare fun {Drop List Count}
   case List of nil then nil
   else
      if Count > 0 then
         {Drop List.2 Count-1}
      else
         List
      end
   end
end
{Show {Drop [0 1 2 3 4 5 6] 3}}


declare fun {Append List1 List2}
        case List1 of Head | Tail then
            Head | {Append Tail List2}
        else
            List2
    end

end
{Show {Append [0 1 2 3] [4 5 6]}}


declare fun {Member List Element}
        case List of Head | Tail then
            if Head == Element then
                true
            else
                {Member Tail Element}
            end
	else
            false
	end
end
{Show {Member [0 1 2 3 4 5 6] 9}}


declare fun {Position List Element}
        case List of Head | Tail then
            if Head == Element then
                0
            else
                1 + {Position Tail Element}
            end
	end
end
{Show {Position [0 1 2 7 4 3 6] 0}} %Positions start at 0


declare fun {Push List Element}
	   case List of Head | Tail then
	      Element | List
	   else
	      Element | nil
	   end
end
{Show {Push [1 3 5 7] 9}}


declare fun {Peek List}
	   case List of Head | Tail then
	      Head
	   else
	      nil
	   end
end
{Show {Peek [1 3 5 7]}}

declare fun {Pop List}
	   case List of Head | Tail then
	      Head | Tail - 1
	   else
	      nil
	   end
end
%{Show {Pop [1 3 5 7]}}