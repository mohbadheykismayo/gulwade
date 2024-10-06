<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="seeresults.aspx.cs" Inherits="gulwade_voting_system.seeresults" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="assets/bootstrap.min.css" rel="stylesheet" />
      <style>
  .user-card {
  display: inline-block;
  margin: 10px;
}

.user-details {
  text-align: center;
}

.user-image {
  width: 60px; /* Adjust the size as needed */
  height: 60px; /* Adjust the size as needed */
  border-radius: 50%;
}

.progress-bar-card {
  margin: 10px;
}

.progress-bar-container {
  width: 100%;
  background-color: #e0e0e0; /* Background color of the progress bar container */
  border-radius: 5px;
  overflow: hidden;

}

.progress-bar {
  height: 30px; /* Adjust the height as needed */
  line-height: 30px; /* Adjust the line height as needed */
  color: #fff; /* Text color of the progress bar */
  text-align: center;
  background-color: #4caf50; /* Background color of the progress bar */
  transition: width 1s ease; /* Animation transition property */
  width: 0%; /* Set initial width to 0% */
}

/* Add fadeIn class for the initial animation */
.fadeIn {
  opacity: 1 !important;
  animation: fadeIn 1s;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

body{
/*    background: radial-gradient(circle, rgba(238,174,202,1) 7%, rgba(26,190,242,1) 73%);*/

background-image: linear-gradient(
  55deg,
  hsl(240deg 100% 34%) 0%,
  hsl(225deg 100% 41%) 6%,
  hsl(220deg 100% 46%) 10%,
  hsl(216deg 100% 50%) 14%,
  hsl(212deg 100% 50%) 17%,
  hsl(208deg 100% 50%) 20%,
  hsl(204deg 100% 50%) 24%,
  hsl(198deg 100% 47%) 29%,
  hsl(189deg 100% 42%) 36%,
  hsl(177deg 100% 39%) 44%,
  hsl(164deg 100% 41%) 54%,
  hsl(152deg 100% 44%) 67%,
  hsl(141deg 100% 46%) 82%,
  hsl(127deg 95% 49%) 100%
);
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
             <asp:Label ID="Label2" runat="server" Visible="false" ></asp:Label>
<div class="container-fluid py-5" style="background-color: #f0f8ff;">
    <!-- Header -->
    <div class="text-center mb-5">
        <h1 class="display-5" style="color: #007bff;">📊 Student Voting Results</h1>
        <p class="lead" style="color: #343a40;">Live results from the latest student elections</p>
    </div>

    <!-- Row for Statistics -->
    <div class="row g-4 text-center">
        <!-- Positions Card -->
        <div class="col-12 col-md-3">
            <div class="card shadow border-0" style="background: linear-gradient(135deg, #0066cc, #00cc99); border-radius: 20px;">
                <div class="card-body">
                    <h3 class="fw-bold mb-3" style="color: #fff;"><i class="fas fa-user-tie"></i> Positions</h3>
                    <p style="color: #eaf6ff;">Number of Positions</p>
                    <span class="text-white display-4">2</span>
                </div>
            </div>
        </div>
        
        <!-- Candidates Card -->
        <div class="col-12 col-md-3">
            <div class="card shadow border-0" style="background: linear-gradient(135deg, #3399ff, #33cc99); border-radius: 20px;">
                <div class="card-body">
                    <h3 class="fw-bold mb-3" style="color: #fff;"><i class="fas fa-users"></i> Tartamayaasha</h3>
                    <p style="color: #eaf6ff;">Number of Candidates</p>
                    <span class="text-white display-4" id="candi">A</span>
                </div>
            </div>
        </div>

        <!-- Voters Card -->
        <div class="col-12 col-md-3">
            <div class="card shadow border-0" style="background: linear-gradient(135deg, #66ccff, #00cc66); border-radius: 20px;">
                <div class="card-body">
                    <h3 class="fw-bold mb-3" style="color: #fff;"><i class="fas fa-vote-yea"></i> Codadka Guud</h3>
                    <p style="color: #eaf6ff;">Number of Voters</p>
                    <span class="text-white display-4" id="voters">A</span>
                </div>
            </div>
        </div>

        <!-- Votes Card -->
        <div class="col-12 col-md-3">
            <div class="card shadow border-0" style="background: linear-gradient(135deg, #3399ff, #00cc66); border-radius: 20px;">
                <div class="card-body">
                    <h3 class="fw-bold mb-3" style="color: #fff;"><i class="fas fa-ballot"></i> Inta Codeyse</h3>
                    <p style="color: #eaf6ff;">Total Votes</p>
                    <span class="text-white display-4" id="votees">A</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Row for Progress Bars (Voting Results) -->
    <div class="row mt-5">
        <div class="col-md-5 offset-md-1">
            <h4 class="fw-bold text-dark mb-3">Gudoomiyaha</h4>
            <div id="progressBarsContainer" class="user-container">
                <!-- Progress bars dynamically added here -->
            </div>
        </div>

        <div class="col-md-5">
            <h4 class="fw-bold text-dark mb-3">G.Kuxigeenka</h4>
            <div id="progressBarsContainer1" class="user-container">
                <!-- Progress bars dynamically added here -->
            </div>
        </div>
    </div>

    <!-- Print Button -->
    <div class="text-center mt-4">
        <button onclick="printPage()" id="printButton" class="btn btn-success btn-lg px-5">
            <i class="fas fa-print"></i> Print Results
        </button>
    </div>

    <!-- Row for Signatures -->
    <div class="row mt-5 p-2 text-dark">
        <div class="col-md-5 text-center">
            <hr />
            <p class="fw-bold">Election Office Signature</p>
        </div>
        <div class="col-md-2"></div>
        <div class="col-md-5 text-center">
            <hr />
            <p class="fw-bold">Election Chairperson Signature</p>
        </div>
    </div>
</div>

    </form>
    
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script>

        //function updateProgressBar() {
        //    $.ajax({
        //        type: "POST",
        //        url: "admin.aspx/candi11",
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: function (response) {
        //            var data = JSON.parse(response.d);
        //            updateProgressBarUI(data.labels, data.counts);
        //        },
        //        error: function (error) {
        //            console.error('Error fetching data:', error);
        //        }
        //    });
        //}

        //function updateProgressBarUI(labels, counts) {
        //    // Clear existing progress bars
        //    $("#progressBarsContainer").empty();

        //    // Combine labels and counts into an array of objects for sorting
        //    var dataArr = [];
        //    for (var i = 0; i < labels.length; i++) {
        //        dataArr.push({ label: labels[i], count: counts[i] });
        //    }

        //    // Sort the array based on count in descending order
        //    dataArr.sort(function (a, b) {
        //        return b.count - a.count;
        //    });

        //    for (var i = 0; i < dataArr.length; i++) {
        //        var userName = dataArr[i].label;
        //        var voteCount = dataArr[i].count;

        //        var progressBarId = "progressBarUser" + (i + 1);

        //        // Calculate percentage
        //        var percentage = ((voteCount / counts.reduce((a, b) => a + b, 0)) * 100).toFixed(2);

        //        // Create a container div for each progress bar with a label
        //        var progressContainerHtml = '<div class="progress-container">' +
        //            '<div class="progress-label">' + userName + '</div>' +
        //            '<div id="' + progressBarId + '" class="progress-bar" role="progressbar" style="width: ' + percentage + '%;" aria-valuenow="' + voteCount + '" aria-valuemin="0" aria-valuemax="100">' + percentage + '% (' + voteCount + ' votes)</div>' +
        //            '</div>';

        //        $("#progressBarsContainer").append(progressContainerHtml);
        //    }
        //}

        //setInterval(updateProgressBar, 5000);




        // Initialize a variable to store the current data




        var currentData;



        function updateProgressBar() {


            $.ajax({
                type: "POST",
                url: "admin.aspx/candi11",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var data = JSON.parse(response.d);
                    updateProgressBarUI(data);

                },
                error: function (error) {
                    console.error('Error fetching data:', error);

                }
            });
        }


        function updateProgressBarUI(data) {
            // Store the current data for later use
            currentData = data;

            // Clear existing user cards and progress bars
            $("#progressBarsContainer").empty();

            // Combine labels, counts, and image URLs into an array of objects for sorting
            var dataArr = [];
            for (var i = 0; i < data.labels.length; i++) {
                dataArr.push({
                    label: data.labels[i],
                    count: data.counts[i],
                    imageUrl: data.imageUrls[i]
                });
            }

            // Sort the array based on count in descending order
            dataArr.sort(function (a, b) {
                return b.count - a.count;
            });

            for (var i = 0; i < dataArr.length; i++) {
                var userName = dataArr[i].label;
                var voteCount = dataArr[i].count;
                var imageUrl = dataArr[i].imageUrl;

                // Calculate percentage
                var percentage = ((voteCount / data.counts.reduce((a, b) => a + b, 0)) * 100).toFixed(2);

                // Create a user card with image and name
                var userCardHtml = '<div class="user-card">' +
                    '<div class="user-details">' +
                    '<img class="user-image" src="' + imageUrl + '" alt="User Image">' +
                    '<div><strong class="text-dark">' + userName + '</strong></div>' +
                    '<div><strong class="text-dark">(' + voteCount + '  votes)</strong></div>' +
                    '</div>' +
                    '</div>';

                $("#progressBarsContainer").append(userCardHtml);

                // Create a separate card for the progress bar with animation class
                var progressBarCardHtml = '<div class="progress-bar-card">' +
                    '<div class="progress-bar-container ">' +
                    '<div id="progressBarUser' + (i + 1) + '" class="progress-bar animated" role="progressbar" style="width: 0%;" aria-valuenow="' + voteCount + '" aria-valuemin="0" aria-valuemax="100">' + '0.00% (' + voteCount + ' votes)</div>' +
                    '</div>' +

                    '</div>';

                $("#progressBarsContainer").append(progressBarCardHtml);

                // Animate the progress bar width
                (function (i, percentage, voteCount) {
                    $("#progressBarUser" + (i + 1)).animate({
                        width: percentage + "%"
                    }, 1000);

                    // Animate the percentage text
                    $({ countNum: 0 }).animate({
                        countNum: percentage
                    }, {
                        duration: 1000,
                        step: function () {
                            $("#progressBarUser" + (i + 1)).text(this.countNum.toFixed(2) + "% (" + voteCount + " votes)");
                        }
                    });
                })(i, parseFloat(percentage), voteCount);
            }

            // Add animation class after a short delay to trigger the animation
            setTimeout(function () {
                $(".progress-bar").addClass("fadeIn");
            }, 1000);
        }

        $(document).ready(function () {
            // Call the updateProgressBar function every 1000 milliseconds (1 second)
            setInterval(updateProgressBar, 5000);
        });








        var currentData1;

        // Function to update the progress bar based on the new data
        function updateProgressBar1() {
            $.ajax({
                type: "POST",
                url: "admin.aspx/candi1111",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log('Data received from server:', response);
                    var data = JSON.parse(response.d);
                    console.log('Parsed data for xigeen:', data);
                    updateProgressBarUI1(data);
                },
                error: function (error) {
                    console.error('Error fetching data:', error);
                }
            });
        }

        function updateProgressBarUI1(data) {
            // Store the current data for later use
            currentData1 = data;

            // Clear existing user cards and progress bars
            $("#progressBarsContainer1").empty();

            // Combine labels, counts, and image URLs into an array of objects for sorting
            var dataArr = [];
            for (var i = 0; i < data.labels.length; i++) {
                dataArr.push({
                    label: data.labels[i],
                    count: data.counts[i],
                    imageUrl: data.imageUrls[i]
                });
            }

            // Sort the array based on count in descending order
            dataArr.sort(function (a, b) {
                return b.count - a.count;
            });

            for (var i = 0; i < dataArr.length; i++) {
                var userName = dataArr[i].label;
                var voteCount = dataArr[i].count;
                var imageUrl = dataArr[i].imageUrl;

                // Calculate percentage
                var percentage = ((voteCount / data.counts.reduce((a, b) => a + b, 0)) * 100).toFixed(2);

                // Create a user card with image and name
                var userCardHtml = '<div class="user-card">' +
                    '<div class="user-details">' +
                    '<img class="user-image" src="' + imageUrl + '" alt="User Image">' +
                    '<div><strong class="text-dark">' + userName + '</strong></div>' +
                    '<div><strong class="text-dark">(' + voteCount + '  votes)</strong></div>' +
                    '</div>' +
                    '</div>';

                $("#progressBarsContainer1").append(userCardHtml);

                // Create a separate card for the progress bar with animation class
                var progressBarCardHtml = '<div class="progress-bar-card">' +
                    '<div class="progress-bar-container">' +
                    '<div id="progressBarUser1' + (i + 1) + '" class="progress-bar animated" role="progressbar" style="width: 0%;" aria-valuenow="' + voteCount + '" aria-valuemin="0" aria-valuemax="100">' + '0.00% (' + voteCount + ' votes)</div>' +
                    '</div>' +
                    '</div>';

                $("#progressBarsContainer1").append(progressBarCardHtml);

                // Animate the progress bar width
                (function (i, percentage, voteCount) {
                    $("#progressBarUser1" + (i + 1)).animate({
                        width: percentage + "%"
                    }, 1000);

                    // Animate the percentage text
                    $({ countNum: 0 }).animate({
                        countNum: percentage
                    }, {
                        duration: 1000,
                        step: function () {
                            $("#progressBarUser1" + (i + 1)).text(this.countNum.toFixed(2) + "% (" + voteCount + " votes)");
                        }
                    });
                })(i, parseFloat(percentage), voteCount);
            }

            // Add animation class after a short delay to trigger the animation
            setTimeout(function () {
                $(".progress-bar").addClass("fadeIn");
            }, 1000);
        }

        $(document).ready(function () {
            // Call the updateProgressBar function every 1000 milliseconds (1 second)
            setInterval(updateProgressBar1, 5000);
        });






        $(document).ready(function () {
            $.ajax({
                url: 'admin.aspx/candi',
                data: {},
                dataType: 'json',
                type: 'POST',
                contentType: 'application/json',
                success: function (response) {
                    // Assuming your response structure
                    var rowCount = response.d;

                    // Update the element where you want to display the count
                    $("#votees").text(rowCount);


                },
                error: function (response) {
                    alert(response.responseText);
                }
            });

        });

        //var myChart; // Define a global variable to store the Chart.js instance

        //$(document).ready(function () {
        //    $.ajax({
        //        url: 'admin.aspx/candi1',
        //        data: {},
        //        dataType: 'json',
        //        type: 'POST',
        //        contentType: 'application/json',
        //        success: function (response) {
        //            var counts = JSON.parse(response.d);
        //            createOrUpdateChart(counts);
        //        },
        //        error: function (response) {
        //            alert(response.responseText);
        //        }
        //    });

        //});

        //function createOrUpdateChart(counts) {
        //    var ctx = document.getElementById('myChart').getContext('2d');

        //    if (myChart) {
        //        // If the chart object already exists, destroy it before creating a new one
        //        myChart.destroy();
        //    }

        //    // Calculate the total votes
        //    var totalVotes = counts.cand1 + counts.cand2 + counts.cand3;

        //    // Calculate the percentages
        //    var percentageCand1 = ((counts.cand1 / totalVotes) * 100).toFixed(2);
        //    var percentageCand2 = ((counts.cand2 / totalVotes) * 100).toFixed(2);
        //    var percentageCand3 = ((counts.cand3 / totalVotes) * 100).toFixed(2);

        //    // Create a new chart
        //    myChart = new Chart(ctx, {
        //        type: 'bar',
        //        data: {
        //            labels: ['Mohamed Badhey', 'Abdukadir muhyadin ', 'carab'],
        //            datasets: [{
        //                label: 'Number of Votes',
        //                data: [counts.cand1, counts.cand2, counts.cand3],
        //                backgroundColor: ['rgba(75, 192, 192, 0.2)', 'rgba(255, 99, 132, 0.2)'],
        //                borderColor: ['rgba(75, 192, 192, 1)', 'rgba(255, 99, 132, 1)'],
        //                borderWidth: 1
        //            }]
        //        },
        //        options: {
        //            scales: {
        //                y: {
        //                    beginAtZero: true,
        //                    ticks: {
        //                        stepSize: 1,
        //                        precision: 0
        //                    }
        //                }
        //            },
        //            plugins: {
        //                datalabels: {
        //                    formatter: function (value, context) {
        //                        return context.dataset.data[context.dataIndex] + ' (' + (context.dataset.data[context.dataIndex] / totalVotes * 100).toFixed(2) + '%)';
        //                    },
        //                    anchor: 'end',
        //                    align: 'end',
        //                    display: true
        //                }
        //            },
        //            layout: {
        //                padding: {
        //                    left: 5,
        //                    right: 5,
        //                    top: 5,
        //                    bottom: 5
        //                }
        //            }
        //        }
        //    });

        //    // Display the percentages in the headers
        //    $("#percentageCand1").text(percentageCand1 + '%');
        //    $("#percentageCand2").text(percentageCand2 + '%');
        //    $("#percentageCand3").text(percentageCand3 + '%');
        //}

        //var myChart;

        //$(document).ready(function () {
        //    $.ajax({
        //        url: 'admin.aspx/candi1',
        //        data: {},
        //        dataType: 'json',
        //        type: 'POST',
        //        contentType: 'application/json',
        //        success: function (response) {
        //            console.log('AJAX request successful:', response);
        //            var responseObject = JSON.parse(response.d);

        //            // Access labels and counts directly
        //            var labels = responseObject.labels;
        //            var counts = responseObject.counts;

        //            console.log(labels);
        //            console.log(counts);
        //            createOrUpdateChart(labels, counts);
        //        },
        //        error: function (response) {
        //            alert(response.responseText);
        //        }
        //    });
        //});

        //function createOrUpdateChart(labels, counts) {
        //    var ctx = document.getElementById('myChart').getContext('2d');

        //    if (myChart) {
        //        // If the chart object already exists, destroy it before creating a new one
        //        myChart.destroy();
        //    }

        //    // Calculate total votes
        //    var totalVotes = counts.reduce((acc, count) => acc + count, 0);

        //    // Calculate percentages and create an array of objects with label, count, and percentage
        //    var dataWithPercentages = labels.map((label, index) => ({
        //        label: label,
        //        count: counts[index],
        //        percentage: ((counts[index] / totalVotes) * 100).toFixed(2),
        //    }));

        //    // Sort the array based on percentages in descending order
        //    dataWithPercentages.sort((a, b) => b.percentage - a.percentage);

        //    // Create a new chart
        //    myChart = new Chart(ctx, {
        //        type: 'bar',
        //        data: {
        //            labels: dataWithPercentages.map(item => item.label),
        //            datasets: [{
        //                label: 'Number of Votes',
        //                data: dataWithPercentages.map(item => item.count),
        //                backgroundColor: ['rgba(75, 192, 192, 0.2)', 'rgba(255, 99, 132, 0.2)', 'rgba(255, 206, 86, 0.2)'],
        //                borderColor: ['rgba(75, 192, 192, 1)', 'rgba(255, 99, 132, 1)', 'rgba(255, 206, 86, 1)'],
        //                borderWidth: 1
        //            }]
        //        },
        //        options: {
        //            scales: {
        //                y: {
        //                    beginAtZero: true,
        //                    ticks: {
        //                        stepSize: 1,
        //                        precision: 0
        //                    }
        //                }
        //            },
        //            plugins: {
        //                datalabels: {
        //                    anchor: 'end',
        //                    align: 'end',
        //                    display: 'auto',
        //                    formatter: function (value, context) {
        //                        // Update the HTML element with the name and percentage
        //                        var elementId = "resultCand" + (context.dataIndex + 1);
        //                        $("#" + elementId).text(dataWithPercentages[context.dataIndex].label + ': ' + dataWithPercentages[context.dataIndex].percentage + '%');

        //                        // Return an empty string to hide the labels on the chart
        //                        return '';
        //                    }
        //                }
        //            },
        //            layout: {
        //                padding: {
        //                    left: 5,
        //                    right: 5,
        //                    top: 5,
        //                    bottom: 5
        //                }
        //            }
        //        }
        //    });

        //    // Display the percentages in separate spans
        //    for (var i = 0; i < dataWithPercentages.length; i++) {
        //        var percentage = dataWithPercentages[i].percentage;
        //        $("#percentageCand" + (i + 1)).text(dataWithPercentages[i].label + ': ' + percentage + '%');
        //    }
        //}









        //var myChart2; // Define a global variable to store the Chart.js instance

        ////$(document).ready(function () {
        ////    $.ajax({
        ////        url: 'admin.aspx/xigeen',
        ////        data: {},
        ////        dataType: 'json',
        ////        type: 'POST',
        ////        contentType: 'application/json',
        ////        success: function (response) {

        ////            var counts2 = JSON.parse(response.d);

        ////            createOrUpdateChart2(counts2);
        ////        },
        ////        error: function (response) {
        ////            alert(response.responseText);
        ////        }
        ////    });

        ////});











        ////function createOrUpdateChart2(counts2) {
        ////    var ctx = document.getElementById('myChart2').getContext('2d');

        ////    if (myChart2) {
        ////        // If the chart object already exists, destroy it before creating a new one
        ////        myChart2.destroy();
        ////    }

        ////    // Calculate the total votes
        ////    var totalVotes = counts2.cand1 + counts2.cand2 + counts2.cand3;

        ////    // Calculate the percentages
        ////    var percentageCand4 = ((counts2.cand1 / totalVotes) * 100).toFixed(2);
        ////    var percentageCand5 = ((counts2.cand2 / totalVotes) * 100).toFixed(2);
        ////    var percentageCand6 = ((counts2.cand3 / totalVotes) * 100).toFixed(2);

        ////    // Create a new chart
        ////    myChart2 = new Chart(ctx, {
        ////        type: 'bar',
        ////        data: {
        ////            labels: ['farah', 'Ali ', 'abdi'],
        ////            datasets: [{
        ////                label: 'Number of Votes',
        ////                data: [counts2.cand1, counts2.cand2, counts2.cand3],
        ////                backgroundColor: ['rgba(75, 192, 192, 0.2)', 'rgba(255, 99, 132, 0.2)'],
        ////                borderColor: ['rgba(75, 192, 192, 1)', 'rgba(255, 99, 132, 1)'],
        ////                borderWidth: 1
        ////            }]
        ////        },
        ////        options: {
        ////            scales: {
        ////                y: {
        ////                    beginAtZero: true,
        ////                    ticks: {
        ////                        stepSize: 1,
        ////                        precision: 0
        ////                    }
        ////                }
        ////            },
        ////            plugins: {
        ////                datalabels: {
        ////                    formatter: function (value, context) {
        ////                        return context.dataset.data[context.dataIndex] + ' (' + (context.dataset.data[context.dataIndex] / totalVotes * 100).toFixed(2) + '%)';
        ////                    },
        ////                    anchor: 'end',
        ////                    align: 'end',
        ////                    display: true
        ////                }
        ////            },
        ////            layout: {
        ////                padding: {
        ////                    left: 5,
        ////                    right: 5,
        ////                    top: 5,
        ////                    bottom: 5
        ////                }
        ////            }
        ////        }
        ////    });

        ////    // Display the percentages in the headers
        ////    $("#percentageCand4").text(percentageCand4 + '%');
        ////    $("#percentageCand5").text(percentageCand5 + '%');
        ////    $("#percentageCand6").text(percentageCand6 + '%');
        ////}

        //$(document).ready(function () {
        //    $.ajax({
        //        url: 'admin.aspx/candi11',
        //        data: {},
        //        dataType: 'json',
        //        type: 'POST',
        //        contentType: 'application/json',
        //        success: function (response) {
        //            console.log('AJAX request successful222:', response);
        //            var responseObject1 = JSON.parse(response.d);

        //            // Access labels and counts directly
        //            var labels1 = responseObject1.labels;
        //            var counts1= responseObject1.counts;

        //            console.log(labels1);
        //            console.log(counts1);
        //            createOrUpdateChart2(labels1, counts1);
        //        },
        //        error: function (response) {
        //            alert(response.responseText);
        //        }
        //    });
        //});

        //function createOrUpdateChart2(labels1, counts1) {
        //    var ctx = document.getElementById('myChart2').getContext('2d');

        //    if (myChart2) {
        //        // If the chart object already exists, destroy it before creating a new one
        //        myChart2.destroy();
        //    }

        //    // Calculate total votes
        //    var totalVotes = counts1.reduce((acc, count) => acc + count, 0);

        //    // Calculate percentages and create an array of objects with label, count, and percentage
        //    var dataWithPercentages = labels1.map((label, index) => ({
        //        label: label,
        //        count: counts1[index],
        //        percentage: ((counts1[index] / totalVotes) * 100).toFixed(2),
        //    }));

        //    // Sort the array based on percentages in descending order
        //    dataWithPercentages.sort((a, b) => b.percentage - a.percentage);

        //    // Create a new chart
        //    myChart2 = new Chart(ctx, {
        //        type: 'bar',
        //        data: {
        //            labels: dataWithPercentages.map(item => item.label),
        //            datasets: [{
        //                label: 'Number of Votes',
        //                data: dataWithPercentages.map(item => item.count),
        //                backgroundColor: ['rgba(75, 192, 192, 0.2)', 'rgba(255, 99, 132, 0.2)', 'rgba(255, 206, 86, 0.2)'],
        //                borderColor: ['rgba(75, 192, 192, 1)', 'rgba(255, 99, 132, 1)', 'rgba(255, 206, 86, 1)'],
        //                borderWidth: 1
        //            }]
        //        },
        //        options: {
        //            scales: {
        //                y: {
        //                    beginAtZero: true,
        //                    ticks: {
        //                        stepSize: 1,
        //                        precision: 0
        //                    }
        //                }
        //            },
        //            plugins: {
        //                datalabels: {
        //                    anchor: 'end',
        //                    align: 'end',
        //                    display: 'auto',
        //                    formatter: function (value, context) {
        //                        // Update the HTML element with the name and percentage
        //                        var elementId = "resultCand" + (context.dataIndex + 1);
        //                        $("#" + elementId).text(dataWithPercentages[context.dataIndex].label + ': ' + dataWithPercentages[context.dataIndex].percentage + '%');

        //                        // Return an empty string to hide the labels on the chart
        //                        return '';
        //                    }
        //                }
        //            },
        //            layout: {
        //                padding: {
        //                    left: 5,
        //                    right: 5,
        //                    top: 5,
        //                    bottom: 5
        //                }
        //            }
        //        }
        //    });
        //    // Display the percentages in separate spans
        //    // Display the percentages in separate spans
        //    for (var i = 0; i < dataWithPercentages.length; i++) {
        //        var percentage = dataWithPercentages[i].percentage;
        //        // Update the HTML element with the name and percentage
        //        var elementId = "percentageCand1" + (i + 4); // Adjust the index to match your HTML IDs
        //        $("#" + elementId).text(dataWithPercentages[i].label + ': ' + percentage + '%');
        //    }


        //}





        $(document).ready(function () {
            // Function to fetch and update the data
            function fetchData() {
                $.ajax({
                    url: 'admin.aspx/candi',
                    data: {},
                    dataType: "json",
                    type: 'POST',
                    contentType: "application/json",
                    success: function (response) {
                        // Assuming your response structure
                        var rowCount = response.d;

                        // Update the element where you want to display the count
                        $("#votees").text(rowCount);
                    },
                    error: function (response) {
                        alert(response.responseText);
                    }
                });
            }

            // Initial fetch
            fetchData();

            // Update data every 5 seconds
            setInterval(fetchData, 5000);
        });


        $(document).ready(function () {
            $.ajax({
                url: 'admin.aspx/candidates',
                data: {},
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {




                    // Assuming your response structure
                    var candi = response.d;

                    // Update the element where you want to display the count
                    $("#candi").text(candi);
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });

        });












        $(document).ready(function () {
            $.ajax({
                url: 'admin.aspx/voters',
                data: {},
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {




                    // Assuming your response structure
                    var candi = response.d;

                    // Update the element where you want to display the count
                    $("#voters").text(candi);
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });

        });












        $(document).ready(function () {
            $.ajax({
                url: 'admin.aspx/voters',
                data: {},
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {




                    // Assuming your response structure
                    var voterrs = response.d;

                    // Update the element where you want to display the count
                    $("#voters").text(voterrs);
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        });

        function printPage() {
            // Hide the print button
            document.getElementById('printButton').style.display = 'none';

            // Perform the printing operation
            window.print();

            // Show the print button after printing is done (you can adjust the delay if needed)
            setTimeout(function () {
                document.getElementById('printButton').style.display = 'block';
            }, 1000);
        }
    </script>
</body>
</html>
