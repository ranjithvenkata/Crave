    <?php 

    include 'connect.php'; 

    $sql = "SELECT * FROM food_profile";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
            
            echo "<tr><td>" . $row['id']."</td><td>".$row['name']."</td></tr>"; 
        }
    }
    
    ?>