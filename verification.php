<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Nomination Verification Details</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
  

    .container {
      background-color: white;
            border: 2px solid #00008b;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 5px 5px 7px 0px #0000003f;
   margin-top:-100px;
            text-align: center;
         
    }

    h1 {
      text-align: center;
      color: #00008b;
      font-size: 30px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      font-size: 15px;
  
    }

    th, td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: left;
    
    }

    th {
      background-color: #f2f2f2;
      color:#00008b;
    }

    .verify-btn {
      background-color: #4caf50;
      color: #fff;
      padding: 5px 10px;
      text-decoration: none;
      border-radius: 4px;
    }
  </style>
</head>
<body>

<div class="container">
  <h1>Nomination Verification Details</h1>
  <table>
    <tr>
      <th>Proposer USN</th>
      <th>Candidate USN</th>
      <th>Proposer Verified</th>
      <th>Candidate Verified</th>
      <th>Action</th>
    </tr>

    <?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "cr_";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
    }

    // Fetch verification details
    $sql = "SELECT proposer_usn, candidate_usn, proposer_verified, candidate_verified FROM nominations";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row['proposer_usn'] . "</td>";
        echo "<td>" . $row['candidate_usn'] . "</td>";
        echo "<td>" . ($row['proposer_verified'] ? 'Yes' : 'No') . "</td>";
        echo "<td>" . ($row['candidate_verified'] ? 'Yes' : 'No') . "</td>";
        
        // Add the verification button/link based on candidate verification status
        if (!$row['candidate_verified']) {
          echo "<td><a class='verify-btn' href='verify.php?proposer_usn={$row['proposer_usn']}&candidate_usn={$row['candidate_usn']}'>Verify</a></td>";
        } else {
          echo "<td>No action</td>";
        }
        
        echo "</tr>";
      }
    } else {
      echo "<tr><td colspan='5'>No verification details found.</td></tr>";
    }

    // Close the connection
    $conn->close();
    ?>
  </table>
</div>

</body>
</html>
