<?php
session_start();

include ("headfile.html"); //include header layout file 
include ("detectlogin.php");

include('db.php');

$id = $_POST['SelectedID'];


$sql = "SELECT * FROM product WHERE prodid = '$id'";

$exeSQL = mysqli_query($connection,$sql);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel=stylesheet type=text/css href=mystylesheet.css>

    <title>A smart buy for a smart home</title>
    <style>
        
    </style>
</head>
<body>
    <?php

    $res = mysqli_fetch_assoc($exeSQL);
    
            echo '<div>';
                echo '<h2>'.$res['prodName'].'</h2>';
                echo '<p>'.$res['prodDescripShort'].'</p>';
                echo '<img src="Images/'.$res['prodPicNameLarge'].'" alt="" width="250px" >';
                echo '<p>'.$res['prodDescripLong'].'</p>';
                echo '<h3>Qualtity : ' .$res['prodQuantity'].'</h3>';
                echo '<h3><p>Price : '.$res['prodPrice'].'</p></h3>';
                echo 'Number to be purchased: ';
                echo "<form action=basket.php method=post>";
                echo "<select name=p_quantity>";
                for ($i=1; $i<=$res['prodQuantity']; $i++)
                    {
                    echo "<option value=".$i.">".$i."</option>";
                                }
                    echo "</select>";
                echo "<input type=submit name='submitbtn' value='ADD TO BASKET' id='submitbtn'>";
                        //pass the product id to the next page basket.php as a hidden value
                echo "<input type=hidden name=h_prodid value=".$id.">";
                echo '</form>';
                echo '</div>';?>
</body>
</html>

<?php

include("footfile.html"); //include head layout
?>

