//Main 

#insert("importers.sps")
#insert("MakeNozle.sps")
#insert("CheckArea.sps")


// Fix Parameters
float S1_diameter = 40
float S1_thickness = 0.6
float hight = 20
float St_length = 14
float St_width = 0.6
float St_hight =20
float decline =1.5     // Erfahrungswert1
float Narrowing = 0.7  // Erfahrungswert2



// Open Parameters to the Customer 

open int Form {
  name = "Which From you like to choose"
  descr = "Form"
  value = 1
  min = 1
  max = 2
} 
open int Colors {
  name = "How many colors you like"
  descr = "Colors"
  value = 4
  min = 1
  max = 4
}
open int Diameter4 {
  name = "Diameter of forth solid"
  descr = "diameter"
  value = 8
  min = 4
  max = Narrowing*8
}
open int Diameter3 {
  name = "Diameter of third solid"
  descr = "diameter"
  value = 16
  max = Diameter4 + (16-8)*Narrowing
  min = Diameter4+4
}
open int Diameter2 {
  name = "Diameter of second solid"
  descr = "diameter"
  value = 26
  max = Diameter3 + (26-16)*Narrowing
  min = Diameter3+4
 
}
open int Diameter1 {
  name = "Diameter of first solid"
  descr = "diameter"
  value = 36
  max = Diameter2 + (40-26)*Narrowing
  min = Diameter2+4
}

open float elongation{
  name = "modify object in form of an elongation"
  descr= "modify"
  value = 1
  max = 1
  min = 0
}


// Store in Array to make it compact 
int Diameters[] = [Diameter1, Diameter2, Diameter3, Diameter4]

//Diameters=CheckArea(Diameters,Colors)

//Make Adapter 
 //make rgb(250 ,0 , 0 )>>Adapter()


//Make Nozzle 
solid Nozzle = MakeNozle(Form, Colors, hight, decline, Diameters, elongation)



