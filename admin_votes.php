<?php
session_start();

if (!isset($_SESSION['admin_username'])) {
    header("Location: admin_login.php");
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $selected_department = $_POST["department"];

    // Fetch and display information based on the selected department
    // You need to implement the logic to retrieve votes data for the selected department

    // Example SQL query to get votes for a candidate in a specific department
    $sql_votes = "SELECT candidate_id, COUNT(*) as vote_count FROM votes 
                  JOIN student ON votes.student_id = student.student_id
                  WHERE student.dept_id = '$selected_department'
                  GROUP BY candidate_id";

    // Execute the query and display results (modify as per your database structure)
    $result_votes = $conn->query($sql_votes);

    if ($result_votes->num_rows > 0) {
        echo "<h3>Votes for Candidates in Department: $selected_department</h3>";
        while ($row = $result_votes->fetch_assoc()) {
            echo "Candidate ID: " . $row['candidate_id'] . ", Votes: " . $row['vote_count'] . "<br>";
        }
    } else {
        echo "No votes available for the selected department.";
    }
}
?>