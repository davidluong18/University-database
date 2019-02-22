<html>
<body>
<?php

$link = mysql_connect('mariadb', 'cs332a27', 'ofoofege');
if (!$link) {
die('Could not connect:'. mysql_error());
}
echo 'Connected successfully<p>';

mysql_select_db("cs332a27",$link);

$course = $_POST["courses"];

$section = $_POST["sections"];

$result = mysql_query(
        "
SELECT Grade, COUNT(Grade) as gradeCount
FROM Enrollment
WHERE Course = '$course' and Section = '$section'
Group by Grade
",$link);

for($i=0; $i<mysql_numrows($result); $i++)
{
echo "Grade: ", mysql_result($result,$i,"Grade"), "<br>";
echo "Count: ", mysql_result($result,$i,"gradeCount"), "<br>";
}
mysql_close($link);
?>
</body>
</html>
