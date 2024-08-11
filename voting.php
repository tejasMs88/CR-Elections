<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Your existing CSS styles here */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        h1 {
            margin-top:150px;
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

        .bubble {
            text-align: center;
            width: 200px;
            padding: 20px;
            background-color: white;
            border: 2px solid #00008b;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            font-size: 18px;
            color: #00008b;
        }

        .vote-button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 60px;
            height: 50px;
        }

    
        .already-voted-card {
    text-align: center;
    width: 500px;
    padding: 20px;
    background-color: white;
    border: 2px solid #00008b;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin: auto;

    font-size: 18px;
    margin-top: 100px;
  color: #00008b;
}
.logout-btn {
            margin-top:150px;  
            background-color: #004792;
            color: #fff;
            text-decoration: none;
            border: 3px solid white;
            border-radius: 5px;
            cursor: pointer;
   margin-left: 1400px;
            font-size: 16px;
        }
    </style>
    

</head>
<body>

<a href="logout.php"><button class="logout-btn">Logout</button></a>
   
    <?php
// Start the session to access session variables
function hasUserVoted($conn, $username) {
    $sql_check_vote = "SELECT COUNT(*) AS vote_count FROM votes WHERE student_id = '$username'";
    $result_check_vote = $conn->query($sql_check_vote);
    if ($result_check_vote && $result_check_vote->num_rows > 0) {
        $row = $result_check_vote->fetch_assoc();
        return $row['vote_count'] > 0;
    }

    return false;
}
// Function to check if the voting window is valid
function isValidVotingWindow($conn, $department) {
    $sql_voting_window = "SELECT * FROM voting_session WHERE dept_id = '$department'";
    $result_voting_window = $conn->query($sql_voting_window);
    

    // Add error handling as needed
    if ($result_voting_window->num_rows > 0) {
        $voting_window = $result_voting_window->fetch_assoc();
        $votingEnd = strtotime($voting_window['voting_end']);
        // Check if the keys exist before accessing them
        if (isset($voting_window['voting_start']) && isset($voting_window['voting_end'])) {
            $start_time = strtotime($voting_window['voting_start']);
            $end_time = strtotime($voting_window['voting_end']);
            $current_time = time();

          

            if ($current_time >= $start_time && $current_time <= $end_time) {
                return true;
            } else {
                echo "Voting window is closed for your department.<br>";
                return false;
            }
        } else {
            echo "Keys 'start_time' or 'end_time' are missing in the voting window data.<br>";
            return false;
        }
    } else {
        echo "No voting window data found for your department.<br>";
        return false;
    }
}
function markUserAsVoted($conn, $username) {
    $sql_mark_voted = "UPDATE student SET voted = 1 WHERE username = '$username'";
    $conn->query($sql_mark_voted);
}
date_default_timezone_set('Asia/Kolkata'); // Set your desired time zone

session_start();

// Database connection parameters
$servername = "localhost";
$username = "root";
$password = "";
$database = "cr_";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get the authenticated user's username
$username = $_SESSION['username'];

// Check if the user has already voted
if (hasUserVoted($conn, $username)) {
    echo '<div class="already-voted-card">
    <h3 style="color:#00008b";>You Have Already Voted</h3>
    <br>
    <p>Thank you for participating in the voting process!!!</p>
  </div>';
} else {
    echo '<h1>Candidates List</h1>';
    // Fetch department and year from the student table
    $sql_user_info = "SELECT dept_id, st_year FROM student WHERE username = '$username'";
    $result_user_info = $conn->query($sql_user_info);

    if ($result_user_info->num_rows > 0) {
        $user_info = $result_user_info->fetch_assoc();
        $department = $user_info['dept_id'];
        $year = $user_info['st_year'];

        if (isValidVotingWindow($conn, $department)) {
        // Fetch candidates from the candidates table based on department and year
        $sql_candidates = "SELECT * FROM verified_nominations WHERE candidate_department = '$department' AND candidate_year = '$year'";
        $result_candidates = $conn->query($sql_candidates);

        if ($result_candidates->num_rows > 0) {
            while ($row = $result_candidates->fetch_assoc()) {
                // Display candidate information and vote button
                echo '<div class="container">
                        <div class="bubble">' . $row['candidate_name'] . '</div>
                        <form method="post" action="">
                            <input type="hidden" name="candidate_id" value="' . $row['candidate_id'] . '">
                            <button type="submit" name="vote_button" class="vote-button" style="width:60px;height:50px">Vote</button>
                        </form>
                      </div>';
            }
        } else {
            echo "No candidates available for your department and year";
        }
    } else {
        echo "Voting is not currently open for your department.";
    }
    } else {
        echo "Error fetching user information";
    }


// Process vote button submission
if (isset($_POST['vote_button'])) {
    // Get the candidate ID from the form submission
    $candidateId = $_POST['candidate_id'];

    // Check if the user has already voted (double-check)
    if (hasUserVoted($conn, $username)) {
        echo "You have already voted.";
    } else {
        // Update the no_of_votes column for the selected candidate
        $sql_update_votes = "UPDATE verified_nominations SET no_of_votes = no_of_votes + 1 WHERE candidate_id = '$candidateId'";
        if ($conn->query($sql_update_votes) === TRUE) {
            // Insert a record into the votes table to track the vote
            $sql_insert_vote = "INSERT INTO votes (student_id, candidate_id) VALUES ((SELECT student_id FROM student WHERE username = '$username'), '$candidateId')";
            $conn->query($sql_insert_vote);

           
            // Mark the user as voted to prevent multiple votes
            markUserAsVoted($conn, $username);
            header("Location: thank.php");
          exit();
        } else {
            echo "Error updating votes: " . $conn->error;
        }
    }
}
// Close the database connection
$conn->close();

// Function to check if the user has voted


// Function to mark the user as voted



} 
?>
<div id="countdown"></div>

</body>
</html>

