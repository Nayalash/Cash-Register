String itemName =getString("Type__ Name of Item");
int itemPrice =getInt("Type__ Price of Item in 00.00 format");


void setup() {
  size(1000, 500);
}


void draw() {
  background(0);
  textSize(50);
  text(itemName, 25, 50);
  text(itemPrice, 200, 50);
}
