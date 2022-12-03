$DB=(Get-Content .\day3\input.txt)
$priority=0
$total=0

#Call function according to part of task ('part1' or 'part2')
#part1
part2
function part1()
{
    foreach ($backpack in $DB)
    {
        #$backpack="CrZsJsPPZsGzwwsLwLmpwMDw" #for testing purposes
        $bp_half=($backpack.Length)/2 #counts string length, divides into 2
        $1half=$backpack.Substring(0,$bp_half) #returns with 0-half of the string
        $2half=$backpack.Substring($bp_half) #returns with the value starting from the second half of string
        $contents= ($1half.ToCharArray()) | Where-Object {($2half.ToCharArray()) -ccontains $_}| Select-Object -first 1 #last part might be sketchy - might miss out on MORE than 1 matches per backpack.
        #https://stackoverflow.com/questions/3494115/what-does-mean-in-powershell
        $priority=(calc($contents))
        $total=$total+$priority
        Write-Host "Priority calculated in total: $total"
    }
}

function part2()
{
$2total=0
$a=0
$b=1
$c=2

while ($c -lt ($DB.length)) #cycles until end of array
    {
        $check1=($DB[$a].ToCharArray()) | Where-Object {($DB[$b].ToCharArray()) -ccontains $_}
        $check2=($DB[$b].ToCharArray()) | Where-Object {($DB[$c].ToCharArray()) -ccontains $_}

        $per3= $check1 | Where-Object {$check2 -ccontains $_} | Select-Object -first 1 # same idea as line 19
        $2prio=(calc($per3))
        Write-Host "calculated priority for group: $2prio"
        $2total=$2total+(calc($per3))
        write-host "Total calculated (for groups) so far: $2total"
        $a=$a+3 #move the selected array values forward by 3
        $b=$b+3
        $c=$c+3
    }
}


function calc($letter,$result) #Calculates Priority value for letter
{
    if($letter -cmatch "[a-z]")
    {
        $result=([byte][char]"$letter")-96
    }
        if($letter -cmatch "[A-Z]")
    {
        $result=([byte][char]"$letter")-38
    }
    return $result
}