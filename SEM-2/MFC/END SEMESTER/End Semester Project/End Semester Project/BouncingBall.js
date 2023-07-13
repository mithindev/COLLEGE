<html>
  <head>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
    <style>
      canvas {
        width: 80%;
        height: 80%;
      }
    </style>
  </head>
  <body>
    <canvas id="myChart"></canvas>
    <script>
      const e = 0.9;
      const ux = 1;
      const uy = 15 / e;
      const g = 9.8;
      let t = 0;
      const x = [0];
      const y = [0];
      let tf = 2 * uy / g;
      let dt = tf / 20;
      
      while (uy > 0.01) {
        const xref = x[x.length - 1];
        uy = uy * e;
        tf = 2 * uy / g;
        dt = tf / 20;
        t = 0;
      
        while (t < tf) {
          t += dt;
          if ((uy - 0.5 * g * t) * t > -0.000001) {
            x.push(ux * t + xref);
            y.push((uy - 0.5 * g * t) * t);
            if (y[y.length - 1] < 0) {
              y[y.length - 1] = 0;
            }
          }
        }
      }
      
      const ctx = document.getElementById('myChart').getContext('2d');
      const chart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: x,
          datasets: [{
            label: 'Projectile motion',
            data: y,
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderColor: 'rgba(255, 99, 132, 1)',
            borderWidth: 1
          }]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
          }
        }
      });
    </script>
  </body>
</html>