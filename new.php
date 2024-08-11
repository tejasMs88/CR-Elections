<?php
// Assuming you have obtained the selected department and year from the URL parameters
$selectedDepartment = isset($_GET['dept']) ? $_GET['dept'] : '';
$selectedYear = isset($_GET['year']) ? $_GET['year'] : '';

// Department mapping
$deptMapping = [
    'CSE' => 1,
    'ISE' => 2,
    'EC' => 3,
    'MECH' => 4,
    // Add mappings for other departments.
];

// Year mapping
$yearMapping = [
    '1st YEAR' => 1,
    '2nd YEAR' => 2,
    '3rd YEAR' => 3,
    '4th YEAR' => 4,
    // Add mappings for other years.
];

// Check if the selected department and year are valid
if (!isset($deptMapping[$selectedDepartment])) {
    die("Invalid department: $selectedDepartment");
}
if (!isset($yearMapping[$selectedYear])) {
    die("Invalid year: $selectedYear");
}

// Perform database connection
$servername = "localhost";
$username = "root";
$password = "";
$database = "cr_";

$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch candidates data from the database based on department and year
$selectedDeptID = $deptMapping[$selectedDepartment];
$selectedYearID = $yearMapping[$selectedYear];

$sql = "SELECT candidate_name,proposer_name, no_of_votes FROM verified_nominations WHERE candidate_department = '$selectedDeptID' AND candidate_year = '$selectedYearID'";
$result = $conn->query($sql);

// Check if there are candidates
$candidates = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $candidates[] = $row;
    }
}

// Close the database connection
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Candidates for <?php echo "$selectedDepartment $selectedYear"; ?></title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 50px;
            color: black;
            font-size: 24px;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }
     
        

        .candidate-info {
      
            border: 2px solid #00008b;
            text-align: center;
            width: 300px;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 5px 5px 7px 0px #0000003f;
            margin-bottom: 20px;
        }

        .candidate-name {
            font-size: 20px;
            color: #00008b;
            margin-bottom: 10px;
        }
.proposer-name{
    font-size: 20px;
            color: #00008b;
            margin-bottom: 10px;
}
        .votes {
            font-size: 20px;
            color: #00008b;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<h1 style="color:#00008b; margin-top:150px;">Candidates for <?php echo "$selectedDepartment $selectedYear"; ?></h1>

<div class="container">
    <?php
    // Loop through candidates and display their information
    foreach ($candidates as $candidate) {
        echo "<div class='candidate-info'>
                <div class='candidate-name'><a style='color:black;'>Candidate:  </a>{$candidate['candidate_name']}</div>
                <div class='proposer-name'><a style='color:black;'>Proposer: </a> {$candidate['proposer_name']}</div>
           
                <div class='votes'><a style='color:black;'>Votes:</a> {$candidate['no_of_votes']}</div>
              </div>";
    }
    ?>
</div>

</body>
</html>