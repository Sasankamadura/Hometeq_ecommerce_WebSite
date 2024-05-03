<?php
session_start();

include("db.php");
$pagename="Smart Basket"; //Create and populate a variable called $pagename
echo "<link rel=stylesheet type=text/css href=mystylesheet.css>"; //Call in stylesheet
echo "<title>".$pagename."</title>"; //display name of the page as window title
echo "<body>";
include ("headfile.html"); //include header layout file 
include ("detectlogin.php");
echo "<h4>".$pagename."</h4>"; //display name of the page on the web page


//create a new cell in the basket session array. Index this cell with the new product id.
//Inside the cell store the required product quantity 

if (isset($_POST['h_prodid']))
{
    $newprodid = $_POST['h_prodid'];

    $reququantity = $_POST['p_quantity'];


    //Display id of selected product
    echo "<p>Id of selected product: ".$newprodid;
    //Display quantity of selected product  
    echo "<br>Quantity of selected product: ".$reququantity;


	$_SESSION['basket'][$newprodid]=$reququantity;

echo "<p>1 item added";
}
else {
    echo "Basket unchanged";
}

$total = 0;



echo "<p><table id='baskettable'>";
echo "<tr>";
echo "<th>Product Name</th><th>Price</th><th>Quantity</th><th>Subtotal</th><th>Remove roduct</th>";
echo "</tr>";


if (isset($_SESSION['basket'])){
    
    foreach($_SESSION['basket'] as $newprodid => $reququantity){

        $sql = "SELECT * FROM product WHERE prodid = '$newprodid'";

        $exeSQL = mysqli_query($connection,$sql)or die (mysql_error($connection));

        $res = mysqli_fetch_assoc($exeSQL);

        echo "<tr>";
        echo "<td>".$res['prodName']."</td>";
        echo "<td>&pound".number_format($res['prodPrice'],2)."</td>";
        echo "<td style='text-align:center;'>".$reququantity."</td>";
        $subtotal=$res['prodPrice'] * $reququantity;
        echo "<td>&pound".number_format($subtotal,2)."</td>";

        echo "<form action=basket.php method=post>";
        echo "<td>";
        echo "<input type=submit value='Remove' id='submitbtn'>";
        echo "</td>";
        echo "<input type=hidden name=del_prodid value=".$res['prodid'].">";
        echo "</form>";
        echo "</tr>";
        //increase total by adding the subtotal to the current total
        $total=$total+$subtotal;
 }
}
//else display empty basket message
else 
{
echo "<p>Empty basket";
}

// Display total
echo "<tr>";
echo "<td colspan=4>TOTAL</td>";
echo "<td>&pound".number_format($total,3)."</td>";
echo "</tr>";
echo "</table></p>";

echo "<br><p><a href='clearbasket.php'>CLEAR BASKET</a></p>";

if (isset($_SESSION['userid'])) 
{
echo "<br><p><a href=checkout.php>CHECKOUT</a></p>";
}
else
{
echo "<br><p>New homteq customers: <a href='signup.php'>Sign up</a></p>";
echo "<p>Returning homteq customers: <a href='login.php'>Login</a></p>";
}


//if the value of the product id to be deleted (which was posted through the hidden field) is set
if (isset($_POST['del_prodid']))
{
//capture the posted product id and assign it to a local variable $delprodid
$delprodid=$_POST['del_prodid'];
//unset the cell of the session for this posted product id variable
unset ($_SESSION['basket'][$delprodid]);
//display a "1 item removed from the basket" message
echo "<p>1 item removed";
}

//echo "<br><p>New homteq customers: <a href='signup.php'>Sign up</a></p>";
//echo "<p>Returning homteq customers: <a href='login.php'>Login</a></p>";

include("footfile.html"); //include head layout
echo "</body>";
?>
