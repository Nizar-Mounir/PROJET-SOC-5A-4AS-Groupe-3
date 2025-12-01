$TOKEN = Get-Content -Path "hec-token" -ErrorAction Stop

$HEC = "https://100.101.252.55:8088/services/collector"

$TEST_FILE = "test_files/test_kerberoasting.json"
$TEST_ID = "test_kerberoasting_01"

if ([string]::IsNullOrWhiteSpace($TOKEN)) {
    Write-Host "[ERROR] hec-token file is empty or missing."
    exit 1
}

if (!(Test-Path $TEST_FILE)) {
    Write-Host "[ERROR] Test file $TEST_FILE not found."
    exit 1
}

Write-Host "[+] Sending test $TEST_ID to Splunk..."

curl.exe -k $HEC `
    -H "Authorization: Splunk $TOKEN" `
    -H "Content-Type: application/json" `
    --data "@$TEST_FILE"

Write-Host "`n[+] Test sent. Now wait for your Splunk rule to trigger."

