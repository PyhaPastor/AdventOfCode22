$DB = Get-Content "day1.txt"
$var1=0
$var2=0
$array2=@([int])
foreach ($line in $DB)
{
    $integer=[int]$line
    if ($integer -gt 0)
    {
        $var1=$integer+$var1
    }
    else
    {
        $array2 += $var1
        $var1=[int]0
    }   
}
Write-Host "------------------ Part 1 ------------------"
Write-Host "Elf carriying the most calories:"
Write-Host ($array2 | Sort-Object -descending | Select-Object -Skip 1 -First 1)
Write-Host "------------------ Part 2 ------------------"
Write-Host "Top 3 elves:"
$top3=($array2 | Sort-Object -descending | Select-Object -Skip 1 -First 3)
Write-Host $top3

foreach ($amount in $top3)
{
    $var2=[int]$amount+$var2
}
Write-Host "And they are carriying a total of (calories):"
$var2