<?php
session_start();

include ("db.php"); //include db.php file to connect to DB

$pagename="Make your home smart"; //create and populate variable called $pagename
echo "<link rel=stylesheet type=text/css href=mystylesheet.css>";
echo "<title>".$pagename."</title>";
echo "<body>";
include ("headfile.html");
include ("detectlogin.php");
echo "<h4>".$pagename."</h4>";
//create a $SQL variable and populate it with a SQL statement that retrieves product details
$SQL="SELECT prodName,prodId, prodPicNameSmall, prodDescripShort FROM product";
//run SQL query for connected DB or exit and display error message
$exeSQL=mysqli_query($connection, $SQL) or die (mysqli_error($connection));
echo "<table style='border: 0px'>";
//create an array of records (2 dimensional variable) called $arrayp.
//populate it with the records retrieved by the SQL query previously executed. 
//Iterate through the array i.e while the end of the array has not been reached, run through it
while ($arrayp = mysqli_fetch_array($exeSQL)) {
    echo "<tr>";
    echo "<td style='border: 0px'>";
    echo "<img src=images/" . $arrayp['prodPicNameSmall'] . " height=200 width=200>";
    echo "</td>";
    echo "<td style='border: 0px'>";
    echo "<p><h5>" . $arrayp['prodName'] . "</h5>";
    echo '<p>' . $arrayp['prodDescripShort'] . '</p>';
    echo '<form action="prodbuy.php" method="post">';
    echo '<input type="hidden" name="SelectedID" value="' . $arrayp['prodId'] . '">';
    echo '<input type="submit" value="More">';
    echo '</form>';
    echo "</td>";
    echo "</tr>";
}
echo "</table>";
include ("footfile.html");
echo "</body>";
?>

