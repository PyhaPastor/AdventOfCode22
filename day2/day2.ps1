#$test=@('C Z')
#$splitarray=$test.Split(" ")
#write-host $splitarray
#$op=$splitarray[0]
#$you=$splitarray[1]
#write-host "Op went with $op"
#write-host "You went with $you"
$PointsTotal=0
Write-Host "Points at start: $PointsTotal"
$winner=@('A Y','B Z','C X')
$loser=@('A Z','B X','C Y')
$draw=@('A X','B Y','C Z')


$array=(get-content .\day2\input.txt)

foreach ($line in $array)
{
$splitarray=$line.Split(" ")
$op=$splitarray[0]
$you=$splitarray[1]
#write-host "Points at Start :$PointsTotal"
write-host "---"
write-host "received value: $op and $you" 

#calculate points by played hand:
if ($splitarray[1] -eq 'X')
    {
        $Points=1
    }
    if ($splitarray[1] -eq 'Y')
    {
        $Points=2
    }
    if ($splitarray[1] -eq 'Z')
    {
        $Points=3
    }   
write-host "Points acquired from hand: $Points"

if (Compare-Object $line $winner -IncludeEqual | Where-Object -Property SideIndicator -eq ==)
{
    $PointsTotal= $PointsTotal + $Points + 6
    $status='Won'
}

if (Compare-Object $line $loser -IncludeEqual | Where-Object -Property SideIndicator -eq ==)
{
    $PointsTotal=$PointsTotal+$Points
    $status='Lost'
}
if (Compare-Object $line $draw -IncludeEqual | Where-Object -Property SideIndicator -eq ==)
{
    $PointsTotal=$PointsTotal+$Points+3  
    $status='Draw'
}
Write-Host $status
Write-Host "Points in total AFTER game: $PointsTotal"
}