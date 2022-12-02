$PointsTotal=0
Write-Host "Points at start: $PointsTotal"
$winner=@('A Y','B Z','C X')
$loser=@('A Z','B X','C Y')
$draw=@('A X','B Y','C Z')
$part2="true"

if ($part2 = "true")
{
    $winner=@('A Z','B Z','C Z')
    $loser=@('A X','B X','C X')
    $draw=@('A Y','B Y','C Y')
}

$array=(get-content .\day2\input.txt)

foreach ($line in $array)
{
$splitarray=$line.Split(" ")
$op=$splitarray[0]
$you=$splitarray[1]
write-host "---"
write-host "received value: $op and $you" 

#calculate points by played hand:
if ($splitarray[1] -eq 'X')
    {
        $Points=1
        if ($part2 -eq "true" )
        {
            if ($splitarray[0] -eq 'A')
            {
                Write-Host "went with scissors with intent to lose"
                $points= 3
            }
            if ($splitarray[0] -eq 'B')
            {
                Write-Host "went with rock with intent to lose"
                $points= 1
            }
            if ($splitarray[0] -eq 'C')
            {
                Write-Host "went with paper with intent to lose"
                $points= 2
            }
        }
    }
    if ($splitarray[1] -eq 'Y')
    {
        $Points=2
        if ($part2 -eq "true" )
        {
            if ($splitarray[0] -eq 'A')
            {
                Write-Host "went with rock with intent to draw"
                $points= 1
            }
            if ($splitarray[0] -eq 'B')
            {
                Write-Host "went with paper with intent to draw"
                $points= 2
            }
            if ($splitarray[0] -eq 'C')
            {
                Write-Host "went with scissors with intent to draw"
                $points= 3
            }
        }
    }
    if ($splitarray[1] -eq 'Z')
    {
        $Points=3
        if ($part2 -eq "true" )
        {
            if ($splitarray[0] -eq 'A')
            {
                Write-Host "went with paper with intent to win"
                $points= 2
            }
            if ($splitarray[0] -eq 'B')
            {
                Write-Host "went with scissors with intent to win"
                $points= 3
            }
            if ($splitarray[0] -eq 'C')
            {
                Write-Host "went with rock with intent to win"
                $points= 1
            }
        }
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