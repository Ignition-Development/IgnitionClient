<?php
require("../../../require/page.php");
$userdb = $cpconn->query("SELECT * FROM users WHERE discord_id = '" . mysqli_real_escape_string($cpconn, $_SESSION["user"]->id) . "'")->fetch_array();

$usrid = $userdb['id'];
$coins = $userdb['coins'];
$idlemins = $userdb['minutes_idle'];
$lastseen = $userdb['last_seen'];

$idlecheck = $lastseen + 60;

$currenttime = new DateTime();
$currenttimestamp = $currenttime->getTimestamp();


if ($idlecheck <= $currenttimestamp)
{
    $data1 = $coins + 1;
    $data2 = $idlemins + 1;
    try {  
        $cpconn->query("UPDATE `users` SET `coins` = '$data1' WHERE `users`.`id` = $usrid;");
        $cpconn->query("UPDATE `users` SET `minutes_idle` = '$data2' WHERE `users`.`id` = $usrid;");
        $cpconn->query("UPDATE `users` SET `last_seen` = '$currenttimestamp' WHERE `users`.`id` = $usrid;");
        header('location:afk.php');
    }   
            //catch block  
    catch (Exception $e) {  
        //code to print exception caught in the block  
        echo $e;
    }  

}
else
{
    echo "Dont try to abuse to get coins";
}
?>