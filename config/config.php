<?php
ob_start();
session_start();

$timezone = date_default_timezone_set("Asia/Colombo");

$con = mysqli_connect("localhost","root","vin","social");
if(mysqli_connect_errno())
{
    die("The database connection failed.");
}

?>