<?php
include('includes/header.php');
?>

<div class="user_details column">
    <a href="<?php echo $userLoggedIn; ?>"><img src="<?php echo $user['profile_pic'] ?>"></a>
    <div class="user_details_left_right">
        <a href="<?php echo $userLoggedIn; ?>">
            <?php echo $user['first_name']." ".$user["last_name"] ?>
        </a>
        <br>
        <?php 
        echo "Posts: ".$user['num_posts']."<br>";
        echo "Likes: ".$user['num_likes'];
        ?>
    </div>
</div>


<div class="main_column column" id="main_column">
    <h4>Friend Requests</h4>
    
    <?php
    
    $query = mysqli_query($con,"SELECT * FROM friend_requests WHERE user_to='$userLoggedIn'");
    if(mysqli_num_rows($query) == 0){
        echo "You have no friend requests at this time!";
    }else{
        while($row = mysqli_fetch_array($query)){
            $user_from = $row['user_from'];
            $user_from_obj = new User($con,$user_from);
            
            echo $user_from_obj->getFirstAndLastName() . " Sent you a friend request!";
            
            if(isset($_POST['accept_request'.$user_from])){
                $add_friend_query = mysqli_query($con,"UPDATE users SET friend_array=CONCAT(friend_array,'$user_from,') WHERE username='$userLoggedIn'");
                $add_friend_query = mysqli_query($con,"UPDATE users SET friend_array=CONCAT(friend_array,'$userLoggedIn,') WHERE username='$user_from'");
                
                $delete_query = mysqli_query($con,"DELETE FROM friend_requests WHERE user_from='$user_from' AND user_to='$userLoggedIn'");
                
                echo "You are now friends!";
                header("Location: requests.php");
                
            }
            
            if(isset($_POST['ignore_request'.$user_from])){
                $delete_query = mysqli_query($con,"DELETE FROM friend_requests WHERE user_from='$user_from' AND user_to='$userLoggedIn'");
                
                echo "Request ignored";
                header("Location: requests.php");
            }
            ?>
            <form action="requests.php" method="post">
                <input type="submit" name="accept_request<?php echo $user_from;?>" id="accept_button" value="Accept">
                <input type="submit" name="ignore_request<?php echo $user_from;?>" id="ignore_button" value="Ignore">
            </form>
            
            <?php
        }
    }
    
    ?>
    

    
</div>