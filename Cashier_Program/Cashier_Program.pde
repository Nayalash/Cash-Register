/*
Program: Cashier Register Program     
 Author: Nayalash Mohammad
 Date: 30-Oct-2018
 Revision Date: 09-Nov-2018
 
 Program Description: This is a Cashier Program, foucusing on a simple UI. It will ask the User Items/Prices/Cash Given and display SubTotal, Total, Tax and Change Due. 
 
 Controls:  
 Press 0 to end the program. 
 Press 9 to "CASH OUT".
 Press 8 to go to the next customer.
 
 */
 
//Declare all Image variables (Global)
PImage logo;
PImage cash;
PImage end;
PImage next;

//Declare all Global Variables
String itemName;
Float itemPrice;
int currentItemCounter;
boolean continueAddingItems = true;
String items[] = new String[1000]; //Setting a max limit for max items, as it is impossible to have unlimited spawning values in an array.
double total = 0;
int counter = 1;

//setup
void setup() {
  size(1000, 500);//screen size
  logo = loadImage("cashlogoNEW.jpg");
  cash = loadImage("cashbutton.png");
  end = loadImage("endbutton.png");
  next = loadImage("nextbutton.png");
}

//draw (GRAPHICAL OUTPUT)
void draw() {
  //Spawn Images to The Graphical Output
  image(logo, 780, 20);
  image(cash, 770, 180); 
  image(end, 770, 280);
  image(next, 770, 380);

  //If 0 is pressed program will stop

  if (keyPressed) {
    if (key == '0') {
      exit();
    }
  }

  if (continueAddingItems) {
    counter = 1;
    background(255, 0, 0); //background color

    items[currentItemCounter] = addItem();
    currentItemCounter++;
    textSize(20);
    for (String item : items) {
      if (item != null) {
        text(item, 25, 50 * counter);
        counter++;
      }
    }
    int option = getOption("Would you like to add another item?"); //ADDING ANOTHER ITEM
    continueAddingItems = option==0 ? true : false;
  } else { //Displaying The SUB TOTAL, TOTAL and TAX
    text("SubTotal : " + String.valueOf(String.format("%.2f", total)), 20, 50 * (counter + 1));
    text("Tax : " + String.format("%.2f", total * .13), 20, 50*(counter + 2));
    text("TOTAL WITH TAX : " + String.format("%.2f", total * .13 + total), 20, 50 * (counter + 3));
  }
}

//Defining the function that will retrieve user input and diplay it graphically.
String addItem() {
  itemName =getString("Type Name of Item");
  itemPrice =getFloat("Type Price of Item");
  total += itemPrice;
  return "Item: " +itemName + "  " + "Price: " +String.format("%.2f", itemPrice);
}
