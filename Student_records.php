<html>
<body>

<?php

$link = mysql_connect('mariadb','cs332a27','ofoofege');

if(!$link){
    die('Could not connect'.mysql_error());
}
echo 'Connected successfully<p>';

mysql_select_db("cs332a27", $link);

$CWID = $_POST["studentId"];

$result = mysql_query(
    "
    Select Course, Grade
    From Enrollment
    Where Student = '$CWID'
    ", $link);

for($i = 0; $i < mysql_numrows($result); $i++){
    echo "Course: ", mysql_result($result, $i, "Course") , "<br>";
    echo "Grade: ", mysql_result($result, $i, "Grade") , "<br>";
}
mysql_close($link);
?>
</body>
</html>
