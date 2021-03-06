#script to update dash
$psTime = (get-date).year - (get-date "1/1/2009").year #years mvp
$todayDay = (get-date).DayOfWeek

$d = [datetime]::ParseExact(
    '201809222130',
    'yyyyMMddHHmm',
    [System.Globalization.CultureInfo]::InvariantCulture
)

$exactTime = Get-Date $d -UFormat %R

$dataGen = Get-Content -Raw ./BME.json
$dataJSON = ConvertFrom-json $dataGen -AsHashtable
$data = Get-Content -Raw ./template-BME.md
$data = $data.replace("{psTime}", $psTime)
$data = $data.replace("{todayDay}", $todayDay)
$data = $data.replace("{exactTime}", $dataJSON["tim"])
$data = $data.replace("{tempC}", $dataJSON["centigrade"])
$data = $data.replace("{tempF}",  $dataJSON["farenheit"])

$data = $data.replace("{humidity}",  $dataJSON["humidity"])
$data | Set-Content -Encoding utf8 ./BME-DASHBOARD.md