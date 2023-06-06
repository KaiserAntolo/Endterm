


<div id="chartContainer">
    <canvas id="barChart"></canvas>
</div>

<script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


    
    var chartLabels = ['Label 1', 'Label 2', 'Label 3', 'Label 4'];
    var chartData = [10, 20, 30, 15];

    
    var ctx = document.getElementById('barChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: chartLabels,
            datasets: [{
                label: 'Chart Title',
                data: chartData,
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>




