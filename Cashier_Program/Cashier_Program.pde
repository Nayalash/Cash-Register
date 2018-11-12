/*
Program: Cashier Register Program     
 Author: Nayalash Mohammad
 Date: 30-Oct-2018
 Revision Date: 09-Nov-2018
 
 Program Description: This is a Cashier Program, focusing on a simple UI. It will ask the User Items/Prices/Cash Given and 
 display SubTotal, Total, Tax and Change Due based on  CASH OUT AMOUNT. 
 
 Controls:  
 Press 0 to end the program. 
 Press 9 to "CASH OUT".
 Press 8 to go to the next customer.
 
 */

//define variables that will store the images
PImage logo;
PImage cash;
PImage end;
PImage next;

//define the variables that will ask for strings
String itemName;
//define variables that will ask for number datatypes
Float itemPrice;
Float transaction;
int currentItemCounter;
boolean continueAddingItems = true;

String items[] = new String[1000]; //crete an array and set the items in the array to a maximum of 1000 items
//total cost variable
double total = 0;
//helps with making the text always display below item list
int counter = 1;

//setup

void setup() {
  //size of screen
  size(1000, 650);
  //load the images from a directory
  logo = loadImage("cashlogoNEW.jpg");
  cash = loadImage("cashbutton.png");
  end = loadImage("endbutton.png");
  next = loadImage("nextbutton.png");
}

//draw
void draw() {
  //spawn the images on an exact x and y
  image(logo, 780, 20);
  image(cash, 770, 180); 
  image(end, 770, 280);
  image(next, 770, 380);


  //starting the program {main boolean} 
  if (continueAddingItems) {
    counter = 1;
    background(255, 0, 0);//color of the background

    //call the array to excute addItem() function
    items[currentItemCounter] = addItem();
    currentItemCounter++;
    textSize(20);//font size

    //when adding items is done display the receipt
    for (String item : items) {
      if (item != null) {
        text(item, 25, 50 * counter);
        counter++;
      }
    }

    //initate custom yes, no, cancel option using the JOPTION PANE
    int option = getOption("Would you like to add another item?");
    continueAddingItems = option==0 ? true : false;//0 = to the cancel value
  } else {
    //display the receipt
    text("SubTotal : " + String.valueOf(String.format("%.2f", total)), 20, 50 * (counter + 1));
    text("Tax : " + String.format("%.2f", total * .13), 20, 50*(counter + 2));
    text("TOTAL WITH TAX : " + String.format("%.2f", total * .13 + total), 20, 50 * (counter + 3));
  }
}

// initiate the image procedure prompt 

//quits the program
void keyPressed() {
  if (key == '0') {
    exit();
  }

  //Transaction
  if (key == '9') {
    transaction = getFloat("Type Cash Given");
    text("Change : " + String.format("%.2f", transaction-(total * .13 + total)), 20, 50 * (counter + 5));
    text("Cash Given : " + String.valueOf(String.format("%.2f", transaction)), 20, 50 * (counter + 4));
  }
  //displays how to restart the program using keyboard shortcuts
  if (key == '8') {
    text("Press 0 than Press CTRL + R", 20, 50 * (counter + 6));
  }
}

//main method: that ask the Item and price and displays it like a receipt
String addItem() {
  itemName =getString("Type Name of Item");
  itemPrice =getFloat("Type Price of Item");
  total += itemPrice;
  return "Item: " +itemName + "  " + "Price: " +String.format("%.2f", itemPrice);
}
