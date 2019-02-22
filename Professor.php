<html>
<body>
<?php

$link = mysql_connect('mariadb', 'cs332a27', 'ofoofege');
if (!$link) {
die('Could not connect:'. mysql_error());
}
echo 'Connected successfully<p>';

mysql_select_db("cs332a27",$link);

$SSN = $_POST["professorSSN"];

$result = mysql_query(
        "
SELECT Title, Classroom, Meeting_days, Start_time, End_time
FROM Section, Professor
WHERE Instructor = SSN AND SSN = '$SSN'",$link);

for($i=0; $i<mysql_numrows($result); $i++)
{
echo "Title: ", mysql_result($result,$i,"Title"), "<br>";
echo "Classroom: ", mysql_result($result,$i,"Classroom"), "<br>";
echo "Meeting_days: ", mysql_result($result,$i,"Meeting_days"), "<br>";
echo "Start_time: ", mysql_result($result,$i,"Start_time"), "<br>";
echo "End_time:", mysql_result($result,$i,"End_time"), "<br>";
}
mysql_close($link);
?>
</body>
</html>
