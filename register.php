<?php
require_once("config/config.php");
require_once("includes/form_handlers/register_handler.php");
require_once("includes/form_handlers/login_handler.php");

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Welcome To Swirlfeed</title>
    <script src="assets/js/jquery-3.2.1.js" defer></script>
    <script src="assets/js/register.js" defer></script>
    <?php if(isset($_POST['register_button'])){ ?>
    <script src="assets/js/regneeded.js" defer></script>
    <?php } ?>
    <link rel="stylesheet" type="text/css" href="assets/css/register_style.css">
</head>

<body>

    <div class="wrapper">
        <div class="login_box">

            <div class="login_header">
                <h1>Swirlfeed</h1>
                Login or Signup below.
            </div>

            <div id="first">
                <form action="register.php" method="post">
                    <input type="email" name="log_email" placeholder="Email" value="<?php if(isset($_SESSION['log_email'])) echo $_SESSION['log_email']; ?>" required>
                    <br>
                    <input type="password" name="log_password" placeholder="Password">
                    <br>
                    <?php if(in_array("Email or Password is wrong<br>",$error_array)) echo "Email or Password is wrong<br>"; ?>
                    <input type="submit" name="login_button" value="Login">
                    <br>
                    <a href="#" id="signup" class="signup">Need an account? Register here!</a>

                </form>
            </div>

            <div id="second">
                <form action="register.php" method="post">
                    <input type="text" name="reg_fname" placeholder="First Name" value="<?php if(isset($_SESSION['reg_fname']))echo $_SESSION['reg_fname'] ?>" required>
                    <br>
                    <?php if(in_array("Your first name should be between 2 and 25 characters <br>",$error_array)) echo "Your first name should be between 2 and 25 characters <br>"; ?>

                    <input type="text" name="reg_lname" placeholder="Last Name" value="<?php if(isset($_SESSION['reg_lname'])) echo $_SESSION['reg_lname'] ?>" required>
                    <br>
                    <?php if(in_array("Your last name should be between 2 and 25 characters <br>",$error_array)) echo "Your last name should be between 2 and 25 characters <br>"; ?>

                    <input type="email" name="reg_email" placeholder="Email" value="<?php if(isset($_SESSION['reg_email'])) echo $_SESSION['reg_email'] ?>" required>
                    <br>
                    <input type="email" name="reg_email2" placeholder="Confirm Email" value="<?php if(isset($_SESSION['reg_email2'])) echo $_SESSION['reg_email2'] ?>" required>
                    <br>
                    <?php if(in_array("Email already exists <br>",$error_array)) echo "Email already exists <br>";
              else if(in_array("Email validation failed <br>",$error_array)) echo "Email validation failed <br>";
              else if(in_array("Emails dont match <br>",$error_array)) echo "Emails dont match <br>";
        ?>

                    <input type="password" name="reg_password" placeholder="Password" required>
                    <br>
                    <input type="password" name="reg_password2" placeholder="Confirm Password" required>
                    <br>
                    <?php if(in_array("Passwods dont match <br>",$error_array)) echo "Passwods dont match <br>";
              else if(in_array("Password must contains numbers and english letters only <br>",$error_array)) echo "Password must contains numbers and english letters only <br>";
              else if(in_array("password must be between 2 and 30 characters <br>",$error_array)) echo "password must be between 2 and 30 characters <br>";
        ?>

                    <input type="submit" name="register_button" value="Register">
                    <br>

                    <?php if(in_array("<span style='color:#14C800;'> All set! please login.</span><br>",$error_array)) echo "<span style='color:#14C800;'> All set! please login.</span><br>"; ?>

                    <a href="#" id="signin" class="signin">Already have an account? Sign in here!</a>
                </form>
            </div>
        </div>
    </div>

</body>

</html>
