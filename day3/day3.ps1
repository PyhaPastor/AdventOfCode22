#$DB=(Get-Content .\day3\example.txt)
$DB=(Get-Content .\day3\input.txt)
$priority=0
$total=0

foreach ($backpack in $DB)
{
#$backpack="CrZsJsPPZsGzwwsLwLmpwMDw" #for testing purposes
$bp_half=($backpack.Length)/2 #counts string length, divides into 2
$1half=$backpack.Substring(0,$bp_half) #returns with 0-half of the string
$2half=$backpack.Substring($bp_half) #returns with the value starting from the second half of string
#$1half #prints out 1st half (for debug)
#$2half #prints out 2nd half (for debug)
$contents= ($1half.ToCharArray()) | Where-Object {($2half.ToCharArray()) -ccontains $_}| Select-Object -first 1 #last part might be sketchy - might miss out on MORE matches.
#$contents


#$value=[byte][char]"$contents" #fails when UPPERCASE

#calculate priority:

if($contents -cmatch "[a-z]")
    {
    $priority=([byte][char]"$contents")-96
    }
    if($contents -cmatch "[A-Z]")
    {
    $priority=([byte][char]"$contents")-38
    }

$total=$priority+$total
}
Write-Host "Priority calculated in total: $total"