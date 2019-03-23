<?php
include("includes/header.php");
include("includes/form_handlers/settings_handler.php");

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


<div class="main_column column">
    <h4>Account Settings</h4>
    <?php
    echo "<img src='".$user['profile_pic']."' id='small_profile_pic'>";
    ?>
    <br>
    <a href="upload.php">Upload a new profile picture</a><br><br><br>
    
    Modify the values and click 'update Details'
    
    <?php
    $user_data_query = mysqli_query($con,"SELECT * FROM users WHERE username='$userLoggedIn'");
    $row = mysqli_fetch_array($user_data_query);
    
    $first_name = $row['first_name'];
    $last_name = $row['last_name'];
    $email = $row['email'];
    ?>
    
    <form action="settings.php" method="post">
        First Name: <input type="text" name="first_name" value="<?php echo $first_name; ?>" id="settings_input"><br>
        Last Name: <input type="text" name="last_name" value="<?php echo $last_name; ?>" id="settings_input"><br>
        Email: <input type="text" name="email" value="<?php echo $email; ?>" id="settings_input"><br>
        <?php echo $message; ?>
        <input type="submit" name="update_details" value="Update Details" class="info settings_submit"><br>
    </form>
    
    <h4>Change Password</h4>
    <form action="settings.php" method="post">
        Old Password: <input type="password" name="old_password" id="settings_input" ><br>
        New Password: <input type="password" name="new_password_1" id="settings_input"  ><br>
        New Password Again: <input type="password" name="new_password_2" id="settings_input"><br>
        <?php echo $password_message; ?>
        <input type="submit" name="update_password" value="Update Password" class="info settings_submit">
    </form>
    
    <h4>Close Account</h4>
    <form action="settings.php" method="post">
        <input type="submit" name="close_account" value="Close Account" class="danger settings_submit">
    </form>
    
</div>



</div>
</body>
</html>