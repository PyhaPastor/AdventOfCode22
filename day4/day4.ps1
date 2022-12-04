$DB=(get-content .\day4\example.txt)


foreach ($pairs in $DB)
{
    $splitpair=$pairs -split (",")
    $splitpair[0,1]

}