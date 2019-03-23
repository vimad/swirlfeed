<?php 
include('includes/header.php'); 

$message_obj = new Message($con,$userLoggedIn);

if(isset($_GET['profile_username'])){
    $username = $_GET['profile_username'];
    $user_detail_query = mysqli_query($con,"SELECT * FROM users WHERE username='$username'");
    $user_array = mysqli_fetch_array($user_detail_query);
    
    $num_friends = (substr_count($user_array['friend_array'],",")) - 1;
}

if(isset($_POST['remove_friend'])){
    $user = new User($con,$userLoggedIn);
    $user->removeFriend($username);
}

if(isset($_POST['add_friend'])){
    $user = new User($con,$userLoggedIn);
    $user->sendRequest($username);
}

if(isset($_POST['respond_request'])){
    header("Location: requests.php");
}

if(isset($_POST['post_message'])){
    if(isset($_POST['message_body'])){
        $body = mysqli_real_escape_string($con,$_POST['message_body']);
        $date = date("Y-m-d H:i:s");
        $message_obj->sendMessage($username,$body,$date);
    }
    $link = '#profileTabs a[href="#messages_div"]';
    echo "<script>
        $(function(){
            $('".$link."').tab('show');
        });
    </script>";
}

?>

<style>
    .wrapper {
        margin-left: 0px;
        padding-left: 0px;
    }

</style>

<div class="profile_left">
    <img src="<?php echo $user_array['profile_pic'] ?>">

    <div class="profile_info">
        <p>
            <?php echo "Posts: ".$user_array['num_posts']; ?>
        </p>
        <p>
            <?php echo "Likes: ".$user_array['num_likes']; ?>
        </p>
        <p>
            <?php echo "Friends: ".$num_friends; ?>
        </p>
    </div>

    <form action="profile.php?profile_username=<?php echo $username; ?>" method="post">
        <?php
        $profile_user_obj = new User($con,$username);
        
        if($profile_user_obj->isClosed()){
            header("Location: user_closed.php");
        }
        
        $logged_in_user_obj = new User($con,$userLoggedIn);
        
        if($userLoggedIn != $username){
            if($logged_in_user_obj->isFriend($username)){
                echo '<input type="submit" name="remove_friend" class="danger" value="Remove Friend"><br>';
            }
            else if($logged_in_user_obj->didReceiveRequest($username)){
                echo '<input type="submit" name="respond_request" class="warning" value="Respond To Request"><br>';
            }
            else if($logged_in_user_obj->didSendRequest($username)){
                echo '<input type="submit" name="" class="default" value="Request sent"><br>';
            }
            else
                echo '<input type="submit" name="add_friend" class="success" value="Add Friend"><br>';
        }
        
        ?>
        
    </form>
    <br>
    <input type="submit" class="deep_blue" data-toggle="modal" data-target="#post_form" value="Post Something">
    
    <?php
    if($userLoggedIn != $username){
        echo '<div class="profile_info_bottom">';
        echo $logged_in_user_obj->getMutualFriends($username)." Mutual Friends";
        echo "</div>";
    }
    ?>
 
</div>


<div class="profile_main_column column">
   
   <ul class="nav nav-tabs" role="tablist" id="profileTabs">
       <li role="presentation" class="active"><a href="#newsfeed_div" aria-controls="newsfeed_div" role="tab" data-toggle="tab">Newsfeeds</a></li>
<!--       <li role="presentation"><a href="#about_div" aria-controls="about_div" role="tab" data-toggle="tab">About</a></li>-->
       <li role="presentation"><a href="#messages_div" aria-controls="messages_div" role="tab" data-toggle="tab">Messages</a></li>
   </ul>
   
   <div role="presentation" class="tab-content">
       <div role="tabpanel" class="tab-pane fade in active" id="newsfeed_div">
           <div class="posts_area"></div>
           <img id="loading" src="assets/images/icons/loading.gif">
       </div>
       
<!--
       <div role="tabpanel" class="tab-pane fade" id="about_div">
           
       </div>
-->
       
       <div role="tabpanel" class="tab-pane fade" id="messages_div">
            <?php

                echo "<h4>You and <a href='profile.php?profile_username=".$username."'>".$profile_user_obj->getFirstAndLastName() ."</a></h4><hr><br>";
                echo "<div class='loaded_messages' id='scroll_messages'>";
                echo $message_obj->getMessages($username);
                echo "</div>";
            
            ?>

            <div class="message_post">
                <form action="" method="post">
                    <textarea name='message_body' id='message_textarea' placeholder='Write your message ...'></textarea>
                    <input type='submit' name='post_message' class='info' id='message_submit' value='Send'>
                </form>
            </div>

            <script>
                var div = document.getElementById("scroll_messages");
                div.scrollTop = div.scrollHeight;
            </script>
       </div>
       
   </div>
   
    
</div>



<div class="modal fade" id="post_form" tabindex="-1" role="dialog" aria-labelledby="postModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
           
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="postModalLabel">Post something!</h4>
            </div>
            
            <div class="modal-body">
                <p>This will appear on the user's profile page and also their newsfeed for your friends to see!</p>
                
                <form action="" class="profile_post" method="post">
                    <div class="form_group">
                        <textarea name="post_body" class="form_control" style="width:100%;"></textarea>
                        <input type="hidden" name="user_from" value="<?php echo $userLoggedIn; ?>" >
                        <input type="hidden" name="user_to" value="<?php echo $username; ?>" >
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" name="post_button" id="submit_profile_post">Post</button>
            </div>
        </div>
    </div>
    
<script>
    var userLoggedIn = "<?php echo $userLoggedIn ?>";
    var profileUsername = "<?php echo $username; ?>";
</script>
<script src="assets/js/profilepostloader.js" defer></script>

</div>

</div>

</body>

</html>
