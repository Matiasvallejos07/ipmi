PImage Fondo,Fondo2, Imagen1, imagen2, imagen3;
PFont fuente;
int pantalla = 0;

void setup() {
  size(640, 480);
  Fondo = loadImage("Fondo.jpg");
  Fondo2= loadImage("Fondo2.jpg");
  fuente = createFont("Impact.vlw", 48);
  textFont(fuente);
  textSize(24);
  textAlign(LEFT, TOP);
  Imagen1 = loadImage("Imagen1.jpg");
  imagen2 = loadImage("imagen2.jpg");
  imagen3 = loadImage("imagen3.jpg");
}

void draw() {

  if (pantalla == 0) {
    image(Fondo, 0, 0, width, height);

    push();
    rect(0, height/2, width, height/5);
    fill(0);
    text(" La Naranja Mecanica es una historia de Anthony Burgess", 0, height/2 + 10);
    pop();

    push();
    rect(width/2, height - height/10, width/5, height/5);
    fill(0);
    text(" EMPEZAR", width/2, height - height/10 + 10);
    pop();
  }
  if (pantalla == 1) {
    image(Imagen1, 0, 0, width, height);

    text("Sus personajes principales, son: ", 0, 0);
    text("Alex Delarge un pandillero adolescente : ", 0, 48);
  }
  if (pantalla == 2) {
    push();
    image(imagen3, 0, 0, width, height);
    fill(#FC8D1C);
    text("su grupo llamado los durgos que son\nGeorgie, Pete y Dim (el lerdo) ", 0, 0);
    pop();
  }
  if (pantalla == 3) {
    push();
    image(imagen2, 0, 0, width, height);
    fill(#DBD8D4);
    text("En 1971 el director Stanley Kubrick la llevo al cine\ny se convirtio en una cinta muy polemica\nsiendo su trabajo mas arriesgado y revindicativo\n para el director ", 0, 0);
    pop();
  }
  if (pantalla == 4) {
    push();
    background(0);
    image(Fondo2, 0, 0, width, height);
    fill(0);
    text("Muchas Gracias por mirar hasta el final \nsaludos!!", 0, 0);
    pop();
  }
}
void mouseClicked() {
  pantalla++;
  if (pantalla > 4) {
    pantalla = 0;
  }
}
