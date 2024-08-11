<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Nomination Verification</title>
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
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
      text-align: center;
      color: #333;
    }
    p{
      color:#00008b;
      font-size: 18px;
    }
  </style>
</head>
<body>

<div class="container">
  <h1>Nomination Verification</h1>
<br>
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

  // Function to verify details against the student database
  function verifyDetails($usn, $conn) {
    $sql = "SELECT * FROM student WHERE username = '$usn'";
    $result = $conn->query($sql);
    return $result->num_rows > 0;
  }

  // Fetch nominations data for verification
  $sql = "SELECT * FROM nominations";
  $result = $conn->query($sql);

  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      $proposer_usn = $row['proposer_usn'];
      $candidate_usn = $row['candidate_usn'];

      // Verify proposer and candidate details
      $proposer_verified = verifyDetails($proposer_usn, $conn);
      $candidate_verified = verifyDetails($candidate_usn, $conn);

      // Update the nominations table with verification status
      $updateSql = "UPDATE nominations 
                    SET proposer_verified = '$proposer_verified', candidate_verified = '$candidate_verified'
                    WHERE proposer_usn = '$proposer_usn' AND candidate_usn = '$candidate_usn'";

      if ($conn->query($updateSql) === TRUE) {
        echo "<p>Verification updated for proposer: $proposer_usn, candidate: $candidate_usn</p>";

        // Check if both proposer and candidate are verified and not already in verified_nominations
        if ($proposer_verified && $candidate_verified) {
          $checkDuplicateSql = "SELECT * FROM verified_nominations 
                                WHERE proposer_usn = '$proposer_usn' AND candidate_usn = '$candidate_usn'";

          $duplicateResult = $conn->query($checkDuplicateSql);

          if ($duplicateResult->num_rows == 0) {
            $insertSql = "INSERT INTO verified_nominations (proposer_name, proposer_usn, candidate_name, candidate_usn, candidate_year, candidate_department, candidate_college)
                          SELECT proposer_name, proposer_usn, candidate_name, candidate_usn, candidate_year, candidate_department, candidate_college
                          FROM nominations
                          WHERE proposer_usn = '$proposer_usn' AND candidate_usn = '$candidate_usn'";

            if ($conn->query($insertSql) === TRUE) {
              echo "<p>Verified nomination inserted into verified_nominations table.</p>";
            } else {
              echo "<p>Error inserting into verified_nominations: " . $conn->error . "</p>";
            }
          } else {
            echo "<p>Nomination already exists in verified_nominations table.</p>";
          }
        }
      } else {
        echo "<p>Error updating verification: " . $conn->error . "</p>";
      }
    }
  } else {
    echo "<p>No nominations found for verification.</p>";
  }
  ?>
</div>

</body>
</html>
