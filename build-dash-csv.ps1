#script to update dash
$psTime = (get-date).year - (get-date "1/1/2009").year #years mvp
$todayDay = (get-date).DayOfWeek

$d = [datetime]::ParseExact(
    '201809222130',
    'yyyyMMddHHmm',
    [System.Globalization.CultureInfo]::InvariantCulture
)

$exactTime = Get-Date $d -UFormat %R
$Header = 'humidity','temp','gas','timestamp','ts'
$csvData = ConvertFrom-Csv -Header $Header ./data_cap/study_bme_1.csv -AsHashtable




$data = Get-Content -Raw ./template-BME.md
$data = $data.replace("{psTime}", $psTime)
$data = $data.replace("{todayDay}", $todayDay)
$data = $data.replace("{exactTime}", $exactTime)
$data = $data.replace("{csv}", $csvData)
$data | Set-Content -Encoding utf8 ./BME-DASHBOARD.md