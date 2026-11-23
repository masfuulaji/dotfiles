function ConvertTo-Base3 {
    param([int]$Value, [int]$Digits)
    $trits = @()
    $v = $Value
    for ($i = 0; $i -lt $Digits; $i++) {
        $trits = @($v % 3) + $trits
        $v = [math]::Floor($v / 3)
    }
    return ($trits -join "")
}

$now = Get-Date
$h = ConvertTo-Base3 -Value $now.Hour -Digits 3
$m = ConvertTo-Base3 -Value $now.Minute -Digits 4
$s = ConvertTo-Base3 -Value $now.Second -Digits 4

Write-Output "$h`:$m`:$s"
