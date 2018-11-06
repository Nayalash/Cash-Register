String itemName;
Float itemPrice;

int currentItemCounter;
boolean continueAddingItems = true;

String items[] = new String[1000]; //because impossible to have un limited
double total = 0;
int counter = 1;

void setup() {
  size(1000, 500);
}

void draw() {
  if (continueAddingItems) {
    counter = 1;
    background(255, 0, 0);

    items[currentItemCounter] = addItem();
    currentItemCounter++;
    textSize(50);
    for (String item : items) {
      if (item != null) {
        text(item, 25, 50 * counter);
        counter++;
      }
    }
    int option = getOption("Would you like to add another item?");
    continueAddingItems = option==0 ? true : false;
  } else {
    text("SubTotal : " + String.valueOf(total), 100, 50 * (counter + 1));
    text("TOTAL WITH TAX : " + String.valueOf((total * 0.13) + total), 100, 50 * (counter + 2));
  }
}

String addItem() {
  itemName =getString("Type Name of Item");
  itemPrice =getFloat("Type Price of Item");
  total += itemPrice;
  return itemName + itemPrice;
}
