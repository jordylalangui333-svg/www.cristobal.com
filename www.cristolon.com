<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reloj y Partidos Barcelona</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            background: #0b1c2d; /* fondo azul */
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
        }

        #reloj {
            display: flex;
            font-size: 70px;
            margin-bottom: 40px;
        }

        .tiempo {
            margin: 0 10px;
        }

        #partidos {
            background: #1c3b5a;
            padding: 20px;
            border-radius: 12px;
            width: 380px;
            text-align: center;
            font-size: 19px;
        }

        .partido {
            margin-top: 12px;
        }
    </style>
</head>
<body>

    <!-- Reloj en el centro -->
    <div id="reloj">
        <div id="horas" class="tiempo">00</div> :
        <div id="minutos" class="tiempo">00</div> :
        <div id="segundos" class="tiempo">00</div>
    </div>

    <!-- Próximos partidos en hora de Ecuador -->
    <div id="partidos">
        <strong>Próximos partidos (hora Ecuador)</strong>

        <div class="partido">
            ⚽ Espanyol vs Barcelona<br>
            🏆 LaLiga · Visitante<br>
            🕒 15:00 (03/01/2026)
        </div>

        <div class="partido">
            ⚽ Barcelona vs Athletic Club<br>
            🏆 LaLiga · Local<br>
            🕒 14:00 (07/01/2026)
        </div>

        <div class="partido">
            ⚽ Real Sociedad vs Barcelona<br>
            🏆 LaLiga · Visitante<br>
            🕒 15:00 (18/01/2026)
        </div>
    </div>

    <script>
        // Función para actualizar el reloj en tiempo real en hora de Ecuador
        function actualizarHoraEcuador() {
            const ahora = new Date();
            const partes = new Intl.DateTimeFormat("es-EC", {
                timeZone: "America/Guayaquil",
                hour: "2-digit",
                minute: "2-digit",
                second: "2-digit",
                hour12: false
            }).formatToParts(ahora);

            const h = partes.find(p => p.type === "hour").value;
            const m = partes.find(p => p.type === "minute").value;
            const s = partes.find(p => p.type === "second").value;

            document.getElementById("horas").textContent = h;
            document.getElementById("minutos").textContent = m;
            document.getElementById("segundos").textContent = s;
        }

        setInterval(actualizarHoraEcuador, 1000);
        actualizarHoraEcuador();
    </script>

</body>
</html>
