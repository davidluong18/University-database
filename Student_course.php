<html>
<body>

<?php

$link = mysql_connect('mariadb','cs332a27','ofoofege');

if(!$link){
    die('Could not connect'.mysql_error());
}
echo 'Connected successfully<p>';

mysql_select_db("cs332a27", $link);

$Course = $_POST["sCourse"];

$result = mysql_query(
    "Select Sec_num, Meeting_days, Classroom, Start_time, End_time, COUNT(Enrollment.Student) as enroll
    From Section, Enrollment
    Where C_num = '$Course' AND Course = '$Course' AND Sec_num = Section
    Group by Sec_num"
, $link);

for($i = 0; $i < mysql_numrows($result); $i++){
    echo "Section: ", mysql_result($result, $i, "Sec_num") , "<br>";
    echo "Classroom: ", mysql_result($result, $i, "Classroom") ,  "<br>";
    echo "Meeting days: ", mysql_result($result, $i, "Meeting_days") ,  "<br>";
    echo "Start time: ", mysql_result($result, $i, "Start_time") ,  "<br>";
    echo "End time: ", mysql_result($result, $i, "End_time") ,  "<br>";
    echo "Number enrolled: ", mysql_result($result, $i, "enroll") , "<br>";
}

mysql_close($link);

?>

</body>
</html>
