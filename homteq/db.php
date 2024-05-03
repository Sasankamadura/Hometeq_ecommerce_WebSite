<?php

$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';
$dbname = 'productdb';

$connection  = mysqli_connect($dbhost,$dbuser,$dbpass,$dbname);

if ($connection){
    //echo 'Connection ok';
}else {
    echo'Error';
};

?>