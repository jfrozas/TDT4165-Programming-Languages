local PrintGreater in 
   proc {PrintGreater N1 N2}
      if N1 > N2 then
        {System.showInfo N1}
      else
        {System.showInfo N2}
      end
   end
   %{PrintGreater 100 150}
end