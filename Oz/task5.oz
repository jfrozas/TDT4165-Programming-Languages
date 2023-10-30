local Circle in
   proc {Circle R} Diam Area Circ Pi in
      Pi = 355.0/113.0
      Diam = R*2.0
      Area = Pi*R*R
      Circ = Pi*Diam
      {System.showInfo "The Diameter is: "#Diam}
      {System.showInfo "The Area is: "#Area}
      {System.showInfo "The Circumference is: "#Circ}
   end
   {Circle 4.0}
end