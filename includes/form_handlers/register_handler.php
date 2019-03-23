<?php

global $error_array;

$fname = "";
$lname = "";
$em = "";
$em2 = "";
$password = "";
$password2 = "";
$date = "";
$error_array = array();

if(isset($_POST['register_button']))
{
    $fname = strip_tags($_POST['reg_fname']);
    $fname = str_replace(' ','',$fname);
    $fname = ucfirst(strtolower($fname));
    $_SESSION['reg_fname'] = $fname;
    
    $lname = strip_tags($_POST['reg_lname']);
    $lname = str_replace(' ','',$lname);
    $lname = ucfirst(strtolower($lname));
    $_SESSION['reg_lname'] = $lname;
    
    $em = strip_tags($_POST['reg_email']);
    $em = str_replace(' ','',$em);
    $_SESSION['reg_email'] = $em;
    
    $em2 = strip_tags($_POST['reg_email2']);
    $em2 = str_replace(' ','',$em2);
    $_SESSION['reg_email2'] = $em2;
    
    $password = strip_tags($_POST['reg_password']);
    $password2 = strip_tags($_POST['reg_password2']);
    
    $date = date("Y-m-d");
    
    //email validation
    if($em == $em2)
    {
        if(filter_var($em,FILTER_VALIDATE_EMAIL))
        {
            $em = filter_var($em,FILTER_VALIDATE_EMAIL);
            
            $e_check = mysqli_query($con,"SELECT email FROM users WHERE email='$em'");
            $num_rows = mysqli_num_rows($e_check);
            
            if($num_rows>0)
            {
                $error_array[] = "Email already exists <br>";
            }
            
        }else
        {
            $error_array[] = "Email validation failed <br>";
        }
        
    }else
    {
        $error_array[] = "Emails dont match <br>";
    }
    
    //other validations
    if(strlen($fname)>25 || strlen($fname)<2)
    {
        $error_array[] = "Your first name should be between 2 and 25 characters <br>";
    }
    
    if(strlen($lname)>25 || strlen($lname)<2)
    {
        $error_array[] = "Your last name should be between 2 and 25 characters <br>";
    }
    
    if($password != $password2)
    {
        $error_array[] = "Passwods dont match <br>";
    }
    else
    {
        if(preg_match('/[^A-Za-z0-9]/',$password))
        {
            $error_array[] = "Password must contains numbers and english letters only <br>";
        }
    }
    
    if(strlen($password)>30 || strlen($password)<2)
    {
        $error_array[] = "password must be between 2 and 30 characters <br>";
    }
    
    if(empty($error_array))
    {
        $password = md5($password);
        
        $username = strtolower($fname)."_".strtolower($lname);
        $check_username_query = mysqli_query($con,"SELECT username FROM users WHERE username='$username'");
        
        $i=0;
        while(mysqli_num_rows($check_username_query) !=0)
        {
            $i++;
            $username = strtolower($fname)."_".strtolower($lname)."_".$i;
            $check_username_query = mysqli_query($con,"SELECT username FROM users WHERE username='$username'");
        }
        
        $rand = rand(1,4);
        switch($rand)
        {
            case 1:
                $profile_pic = "assets/images/profile_pics/defaults/head_deep_blue.png";
                break;
            case 2:
                $profile_pic = "assets/images/profile_pics/defaults/head_alizarin.png";
                break;
            case 3:
                $profile_pic = "assets/images/profile_pics/defaults/head_amethyst.png";
                break;
            case 4:
                $profile_pic = "assets/images/profile_pics/defaults/head_belize_hole.png";
                break;
            default:
                $profile_pic = "assets/images/profile_pics/defaults/head_green_sea.png";
        }
        
        $query = mysqli_query($con,"INSERT INTO users VALUES('','$fname','$lname','$username','$em','$password','$date','$profile_pic','0','0','no',',')");
        
        $error_array[] = "<span style='color:#14C800;'> All set! please login.</span><br>";
        
        $_SESSION['reg_fname'] ="";
        $_SESSION['reg_lname'] ="";
        $_SESSION['reg_email'] ="";
        $_SESSION['reg_email2']="";
    }   
}

?>