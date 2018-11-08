/*
Program: Cashier Register Program     
 Author: Nayalash Mohammad
 Date: 30-Oct-2018
 Revision Date: 09-Nov-2018
 
 Program Description: This is a Cashier Program, foucusing on a simple UI. It will ask the User Items/Prices/Cash Given and 
 display SubTotal, Total, Tax and Change Due based on  CASH OUT AMOUNT. 
 
 Controls:  
 Press 0 to end the program. 
 Press 9 to "CASH OUT".
 Press 8 to go to the next customer.
 
 */

PImage logo;
PImage cash;
PImage end;
PImage next;
String itemName;
Float itemPrice;
Float transaction;
int currentItemCounter;
boolean continueAddingItems = true;

String items[] = new String[1000]; //because impossible to have unlimited
double total = 0;
int counter = 1;

void setup() {
  size(1000, 500);
  logo = loadImage("cashlogoNEW.jpg");
  cash = loadImage("cashbutton.png");
  end = loadImage("endbutton.png");
  next = loadImage("nextbutton.png");
}

void draw() {
  image(logo, 780, 20);
  image(cash, 770, 180); 
  image(end, 770, 280);
  image(next, 770, 380);



  if (continueAddingItems) {
    counter = 1;
    background(255, 0, 0);

    items[currentItemCounter] = addItem();
    currentItemCounter++;
    textSize(20);
    for (String item : items) {
      if (item != null) {
        text(item, 25, 50 * counter);
        counter++;
      }
    }
    int option = getOption("Would you like to add another item?");
    continueAddingItems = option==0 ? true : false;
  } else {
    text("SubTotal : " + String.valueOf(String.format("%.2f", total)), 20, 50 * (counter + 1));
    text("Tax : " + String.format("%.2f", total * .13), 20, 50*(counter + 2));
    text("TOTAL WITH TAX : " + String.format("%.2f", total * .13 + total), 20, 50 * (counter + 3));
  }
}

void keyPressed() {
  if (key == '0') {
    exit();
  }

  if (key == '9') {
    transaction = getFloat("Type Cash Given");
    text("Change : " + String.format("%.2f", transaction-(total * .13 + total)), 20, 50 * (counter + 4));
  }
  
  if (key == '8') {
    text("Press 0 than Press CTRL + R", 20, 50 * (counter + 5));
  }
}

String addItem() {
  itemName =getString("Type Name of Item");
  itemPrice =getFloat("Type Price of Item");
  total += itemPrice;
  return "Item: " +itemName + "  " + "Price: " +String.format("%.2f", itemPrice);
}
