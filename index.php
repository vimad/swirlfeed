<?php 
include('includes/header.php'); 

if(isset($_POST['post']))
{
    $uploadOk = 1;
    $imageName = $_FILES['fileToUpload']['name'];
    $errorMessage = "";
    
    if($imageName != ""){
        $targetDir = "assets/images/posts/";
        $imageName = $targetDir. uniqid() . basename($imageName);
        $imageFileType = pathinfo($imageName,PATHINFO_EXTENSION);
        
        if($_FILES['fileToUpload']['size']>10000000){
            $errorMessage = "Sorry your file is too large";
            $uploadOk = 0;
        }
        
        if(strtolower($imageFileType) != "jpeg" && strtolower($imageFileType) != "png" && strtolower($imageFileType) != "jpg"){
            $errorMessage = "Sorry only jpeg, jpg or png files allowed... ";
            $uploadOk = 0;
        }
        
        if($uploadOk){
            if(move_uploaded_file($_FILES['fileToUpload']['tmp_name'],$imageName)){
                
            }else{
                $uploadOk = 0;
            }
        }
    }
    
    if($uploadOk){
        $post = new Post($con,$userLoggedIn);
        $post->submitPost($_POST['post_text'],'none',$imageName);
    }else{
        echo "<div style='text-align:center;' class='alert alert-danger'>
            $errorMessage
        </div>";
    }
    
    
}

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
    <form action="index.php" method="post" class="post_form" enctype="multipart/form-data">
       <input type="file" name="fileToUpload" id="fileToUpload">
        <textarea name="post_text" id="post_text" cols="30" rows="10" placeholder="Got something to say?"></textarea>
        <input type="submit" name="post" id="post_button" value="Post">
        <hr>
    </form>
    
    <?php
        //$post = new Post($con,$userLoggedIn);
        //$post->loadPostsFriends();
    ?>
    <div class="posts_area"></div>
    <img id="loading" src="assets/images/icons/loading.gif">
    
</div>

<div class="user_details column">
   <h4>Popular</h4>
    <div class="trends">
        <?php
        $query = mysqli_query($con,"SELECT * FROM trends ORDER BY hits DESC LIMIT 9");
        foreach($query as $row ){
            $word = $row['title'];
            $word_dot = strlen($word) >= 14 ? "...":"";
            
            $trimmed_word = str_split($word,14);
            $trimmed_word = $trimmed_word[0];
            
            echo "<div style='padding:1px'>";
            echo $trimmed_word . $word_dot;
            echo "<br></div>";
        }
        
        ?>
    </div>
</div>

<script>
    var userLoggedIn = "<?php echo $userLoggedIn ?>";
</script>
<script src="assets/js/postloader.js" defer></script>

</div>

</body>

</html>
