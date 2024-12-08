<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="adminnavbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #F5F5F5;
        }

        .dashboard {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            grid-template-rows: 1fr 1fr 1fr;
            gap: 10px;
            padding-left : 250px;
        }

        .cell {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .yellow { background-color: #FFEB3B; }
        .red { background-color: #F44336; color: white; }
        .green { background-color: #4CAF50; color: white; }
        .blue { background-color: #2196F3; color: white; }
        .orange { background-color: #FF9800; color: white; }
        canvas { width: 100%; max-height: 200px; }
    </style>
</head>
<body>
    <div class="dashboard">
        <!-- Farmers -->
        <div class="cell yellow">
            <h3>Farmers Registered</h3>
            <canvas id="farmersChart"></canvas>
        </div>

        <!-- Empty Cell -->
        <div class="cell"></div>

        <!-- Users -->
        <div class="cell red">
            <h3>Users Registered</h3>
            <canvas id="usersChart"></canvas>
        </div>

        <!-- Empty Cell -->
        <div class="cell"></div>

        <!-- Products -->
        <div class="cell green">
            <h3>Products Registered</h3>
            <canvas id="productsChart"></canvas>
        </div>
 	<!-- Empty Cell -->
        <div class="cell"></div>
        <!-- Feedback -->
        <div class="cell blue">
            <h3>Feedback Registered</h3>
            <canvas id="feedbackChart"></canvas>
        </div>

        <!-- Empty Cell -->
        <div class="cell"></div>

        <!-- Income -->
        <div class="cell orange">
            <h3>Income (Quarterly)</h3>
            <canvas id="incomeChart"></canvas>
        </div>
    </div>

    <script>
        // Farmers Data
        new Chart(document.getElementById('farmersChart'), {
            type: 'doughnut',
            data: {
                labels: ['Active', 'Inactive'],
                datasets: [{
                    data: [<%= 50 %>, <%=40 %>],
                    backgroundColor: ['#4CAF50', '#F44336']
                }]
            }
        });

        // Users Data
        new Chart(document.getElementById('usersChart'), {
            type: 'bar',
            data: {
                labels: ['Current Month', 'Past Month', 'Total'],
                datasets: [{
                    label: 'Users',
                    data: [<%= 20 %>, <%= 45 %>, <%= 76 %>],
                    backgroundColor: ['#FFC107', '#2196F3', '#FF9800']
                }]
            }
        });

        // Products Data
        new Chart(document.getElementById('productsChart'), {
            type: 'pie',
            data: {
                labels: ['Agricultural', 'Diary', 'Waste'],
                datasets: [{
                    data: [
                        <%= 89 %>, 
                        <%=87 %>, 
                        <%= 54 %>, 
                        
                    ],
                    backgroundColor: ['#FF5722', '#009688', '#FFEB3B', '#9C27B0']
                }]
            }
        });

        // Feedback Data
        new Chart(document.getElementById('feedbackChart'), {
            type: 'polarArea',
            data: {
                labels: ['Positive', 'Negative', 'Neutral'],
                datasets: [{
                    data: [
                        <%= 234 %>, 
                        <%= 43 %>, 
                        <%= 76 %>
                    ],
                    backgroundColor: ['#4CAF50', '#F44336', '#FFC107']
                }]
            }
        });

        // Income Data
        new Chart(document.getElementById('incomeChart'), {
            type: 'line',
            data: {
                labels: ['Q1', 'Q2', 'Q3', 'Q4'],
                datasets: [{
                    label: 'Income',
                    data: [
                        <%= 5678 %>, 
                        <%= 456 %>, 
                        <%= 67654%>, 
                        <%= 765456 %>
                    ],
                    backgroundColor: 'rgba(255, 152, 0, 0.2)',
                    borderColor: '#FF9800',
                    borderWidth: 2
                }]
            }
        });
    </script>
</body>
</html>
