$DB=(get-content .\day4\example.txt)
$i=0
#create an array of 100 numbers (integers)
$numbers=1..100

foreach ($pairs in $DB)
{
    #split array into pairs, delimiter is ","
    $splitpair=$pairs -split (",")
    #$splitpair[0]
    #$splitpair[1]
    $range1=$splitpair[0] -split ("-")
    #$range1
    $difference=($range1[1]-$range1[0])
    $difference

    while ($i -lt $difference)
    {
        $range2 += $range1[$i]
        $i++
        write-host "numbers array is $range2"
    }

}