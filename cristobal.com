<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>echa por mi ti Cintya</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background: linear-gradient(to right, #43cea2, #185a9d);
      color: white;
      text-align: center;
      padding: 30px;
    }

    .tabla {
      display: inline-block;
      background-color: rgba(255, 255, 255, 0.2);
      border-radius: 10px;
      padding: 15px;
      margin: 10px;
      text-align: left;
      min-width: 180px;
    }

    .fila {
      padding: 3px 0;
    }

    h1 {
      text-shadow: 2px 2px 5px rgba(0,0,0,0.5);
    }

    footer {
      margin-top: 30px;
      font-size: 14px;
      opacity: 0.8;
    }
  </style>
</head>
<body>
<<div class="calculadora">
  <input type="text" id="display" disabled placeholder="0">
  <div class="botones">
    <!-- Fila 1 -->
    <button onclick="agregarNumero('7')">7</button>
    <button onclick="agregarNumero('8')">8</button>
    <button onclick="agregarNumero('9')">9</button>
    <button class="operador" onclick="agregarOperacion('/')">Div</button>

    <!-- Fila 2 -->
    <button onclick="agregarNumero('4')">4</button>
    <button onclick="agregarNumero('5')">5</button>
    <button onclick="agregarNumero('6')">6</button>
    <button class="operador" onclick="agregarOperacion('*')">Mult</button>

    <!-- Fila 3 -->
    <button onclick="agregarNumero('1')">1</button>
    <button onclick="agregarNumero('2')">2</button>
    <button onclick="agregarNumero('3')">3</button>
    <button class="operador" onclick="agregarOperacion('-')">-</button>

    <!-- Fila 4 -->
    <button onclick="agregarNumero('0')">0</button>
    <button onclick="agregarNumero('.')">.</button>
    <button class="operador" onclick="calcular()">=</button>
    <button class="operador" onclick="agregarOperacion('+')">+</button>

    <!-- Fila 5: Borrar -->
    <button onclick="borrarTodo()" class="borrar">Borrar</button>
  </div>
</div>

<style>
.calculadora {
  background-color: rgba(0,0,0,0.85);
  padding: 30px;
  border-radius: 40px;
  box-shadow: 0px 0px 30px rgba(0,0,0,0.7);
  display: inline-block;
}

input {
  width: 100%;
  padding: 20px;
  font-size: 26px;
  border: none;
  border-radius: 25px;
  margin-bottom: 15px;
  text-align: right;
  background-color: #222;
  color: white;
}

.botones {
  display: grid;
  grid-template-columns: repeat(4, 70px);
  grid-gap: 12px;
  justify-content: center;
}

button {
  padding: 20px;
  font-size: 20px;
  border-radius: 25px;
  border: none;
  cursor: pointer;
  background-color: #ffffff;
  color: #333;
  font-weight: bold;
  transition: transform 0.1s;
}

button:hover {
  background-color: #ddd;
  transform: scale(1.05);
}

.operador {
  background-color: #f39c12;
  color: white;
}

.operador:hover {
  background-color: #e67e22;
  transform: scale(1.05);
}

.borrar {
  grid-column: span 4;
  background-color: #e74c3c;
  color: white;
}

.borrar:hover {
  background-color: #c0392b;
  transform: scale(1.05);
}
</style>

<script>
let display = document.getElementById('display');

function agregarNumero(num) {
  display.value += num;
}

function agregarOperacion(op) {
  display.value += op;
}

function calcular() {
  try {
    display.value = eval(display.value);
  } catch {
    display.value = "Error";
  }
}

function borrarTodo() {
  display.value = '';
}
</script>


<style>
.calculadora {
  background-color: rgba(0,0,0,0.85);
  padding: 30px;
  border-radius: 40px;
  box-shadow: 0px 0px 30px rgba(0,0,0,0.7);
  display: inline-block;
}

input {
  width: 100%;
  padding: 20px;
  font-size: 26px;
  border: none;
  border-radius: 25px;
  margin-bottom: 15px;
  text-align: right;
  background-color: #222;
  color: white;
}

.botones {
  display: grid;
  grid-template-columns: repeat(4, 70px);
  grid-gap: 12px;
  justify-content: center;
}

button {
  padding: 20px;
  font-size: 20px;
  border-radius: 25px;
  border: none;
  cursor: pointer;
  background-color: #ffffff;
  color: #333;
  font-weight: bold;
  transition: transform 0.1s;
}

button:hover {
  background-color: #ddd;
  transform: scale(1.05);
}

.operador {
  background-color: #f39c12;
  color: white;
}

.operador:hover {
  background-color: #e67e22;
  transform: scale(1.05);
}

.borrar {
  grid-column: span 4;
  background-color: #e74c3c;
  color: white;
}

.borrar:hover {
  background-color: #c0392b;
  transform: scale(1.05);
}
</style>

<script>
let display = document.getElementById('display');

function agregarNumero(num) {
  display.value += num;
}

function agregarOperacion(op) {
  display.value += op;
}

function calcular() {
  try {
    display.value = eval(display.value);
  } catch {
    display.value = "Error";
  }
}

function borrarTodo() {
  display.value = '';
}
</script>


  <h1>Bienvenido a Cristóbal</h1>
  <p><strong>echa por mi ti Cintya</strong></p>

  <h2>Tablas de multiplicar del 1 al 12</h2>

  <div id="tablasContainer"></div>

  <footer>
    <p>echa por mi ti Cintya</p>
  </footer>

  <script>
    // Contenedor donde se mostrarán todas las tablas
    const contenedor = document.getElementById('tablasContainer');

    // Generar tablas del 1 al 12
    for (let n = 1; n <= 12; n++) {
      let tablaHTML = `<div class="tabla"><strong>Tabla del ${n}</strong><br>`;
      for (let i = 1; i <= 12; i++) {
        tablaHTML += `<div class="fila">${n} x ${i
