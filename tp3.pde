// https://youtu.be/gyfJOYBRhl8
PImage referencia;
int squareSize = 40;
int circleSize = 15;
boolean[][] whiteSquareColors; // Arreglo para el estado actual de los colores de los cuadrados blancos
boolean applyRelief = false; // Variable para controlar la aplicación del relieve

void setup() {
  size(800, 400);
  referencia = loadImage("referencia.png");

  // Inicializar el arreglo de colores de los cuadrados blancos
  whiteSquareColors = new boolean[20][10];
  saveOriginalSquareColors(); 
}

void draw() {
  
  image(referencia, 0, 0, width/2, height);
  
  //la grilla de cuadrados y círculos en la mitad derecha de la pantalla
   int leftWidth = width / 2;

  for (int i = 0; i < 20; i++) {
    for (int j = 0; j < 10; j++) {
      int x = leftWidth + i * squareSize + squareSize / 2;
      int y = j * squareSize + squareSize / 2;

      if ((i + j) % 2 == 1) { // Solo para cuadrados negros (i + j impar)
        // Cuadrado negro
        fill(#2E2B2B);
        rect(leftWidth + i * squareSize, j * squareSize, squareSize, squareSize);

        // Círculo blanco en el centro del cuadrado negro
        fill(255);
        ellipse(x, y, circleSize, circleSize);

        // Aplicar relieve solo a los círculos blancos en cuadrados negros
        if (applyRelief) {
          float distance = dist(mouseX, mouseY, x, y);
          float circleDiameter = map(distance, 0, 200, circleSize, 0); // Mapa de distancia a tamaño del círculo
          fill(#FC3636);
          ellipse(x, y, circleDiameter, circleDiameter);
        }
      } else {
        // Cuadrado blanco
        if (whiteSquareColors[i][j]) {
          fill(random(255), random(255), random(255)); // Cambiar a color aleatorio
        } else {
          fill(255); // Mantener blanco original
        }
        rect(leftWidth + i * squareSize, j * squareSize, squareSize, squareSize);

        // Círculo negro en el centro del cuadrado blanco
        fill(#2E2B2B);
        ellipse(x, y, circleSize, circleSize);
      }
    }
  }
  
  // Dibujo de los botones
  drawButtons();
}

void drawButtons() {
  // Botón para cambiar color aleatorio de los cuadrados blancos
  fill(200);
  rect(width - 220, 10, 100, 30);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Cambiar Color", width - 160, 25);
  
  // Botón para restaurar color original de los cuadrados blancos
  fill(200);
  rect(width - 110, 10, 100, 30);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Restaurar Color", width - 55, 25);
}

void changeSquareColors() {
  // Cambiar el estado de los colores de los cuadrados blancos a aleatorio
  for (int i = 0; i < 20; i++) {
    for (int j = 0; j < 10; j++) {
      if ((i + j) % 2 == 0) {
        whiteSquareColors[i][j] = true; // Cambiar a color aleatorio
      }
    }
  }
}

void restoreSquareColors() {
  // Restaurar el estado original de los colores de los cuadrados blancos
  for (int i = 0; i < 20; i++) {
    for (int j = 0; j < 10; j++) {
      if ((i + j) % 2 == 0) {
        whiteSquareColors[i][j] = false; // Mantener blanco original
      }
    }
  }
}

void saveOriginalSquareColors() {
  // Guarda el estado original de los colores de los cuadrados blancos
  for (int i = 0; i < 20; i++) {
    for (int j = 0; j < 10; j++) {
      whiteSquareColors[i][j] = false; // Inicialmente todos blancos
    }
  }
}

void mouseClicked() {
  // el clic sea en alguno de los botones
  if (mouseX > width - 220 && mouseX < width - 120 && mouseY > 10 && mouseY < 40) {
    // Botón Cambiar Color
    changeSquareColors();
  } else if (mouseX > width - 110 && mouseX < width - 10 && mouseY > 10 && mouseY < 40) {
    // Botón Restaurar Color
    restoreSquareColors();
  }
}

void keyPressed() {
  // Verificar que la tecla 'r' se presione en la mitad derecha de la pantalla
  int leftWidth = width / 2;
  if (key == 'r' && mouseX > leftWidth && mouseX < width) {
    restoreSquareColors();
  } else if (key == ENTER) {
    applyRelief = !applyRelief; // Alternar estado de la variable de relieve
  }
}
