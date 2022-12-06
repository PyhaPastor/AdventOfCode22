#$DB=(get-content .\day4\example.txt)
#$DB=(Get-Content .\day4\input.txt)
$DB="2-8,3-7"
#$DB="2-4,6-8"
#$DB="5-7,7-9"
#create an array of 100 numbers (integers)
#$numbers=1..100

$a=0
$b=0

foreach ($pairs in $DB)
{
    #split array into pairs, delimiter is ","
    $splitpair=$pairs -split (",")
    #$splitpair[0]
    #$splitpair[1]
    $range1=$splitpair[0] -split ("-")
    $range2=$splitpair[1] -split ("-")
    #$a=$a+2
    #$b=$b+2
    #$range1
    #$difference=($range1[1]-$range1[0]) #needs to be re-done when proper cycle introduced
    #write-host "difference is $difference"

    #write-host "first of pair:"
    $elf1=($range1[0]..$range1[1])
    #$elf1
    #write-host "second of pair:"
    $elf2=($range2[0]..$range2[1])
    #$elf2

    $comp1=((Compare-Object $elf1 $elf2 -ExcludeDifferent -IncludeEqual).InputObject).Count
    #this is where things start to fail
    if (($comp1 -match $elf1.Count) -or ($comp1 -match $elf2.Count))
    {
        $a++
        #write-host "Total overlap! from $splitpair"
    }
    if ($comp1 -gt 0)
    {
        $b++
        #write-host "found at least one overlap from pair $splitpair"
    }
    #Compare-Object $elf2 $elf1 -IncludeEqual
}
Write-Host "Total of full overlaps: $a"
Write-Host "Total of any overlaps within pairs: $b"