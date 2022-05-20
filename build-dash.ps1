#script to update dash
$psTime = (get-date).year - (get-date "1/1/2009").year #years mvp
$todayDay = (get-date).DayOfWeek

$d = [datetime]::ParseExact(
    '201809222130',
    'yyyyMMddHHmm',
    [System.Globalization.CultureInfo]::InvariantCulture
)

$exactTime = Get-Date $d -UFormat %R

$data = Get-Content -Raw ./template.md
$data = $data.replace("{psTime}", $psTime)
$data = $data.replace("{todayDay}", $todayDay)
$data = $data.replace("{exactTime}", $exactTime)

$data | Set-Content -Encoding utf8 ./DASHBOARD.md