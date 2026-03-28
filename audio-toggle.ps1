$configPath = "C:\Program Files\EqualizerAPO\config\config.txt"

$current = Get-Content $configPath -ErrorAction SilentlyContinue

if ($current -match "swap.txt") {
    Set-Content -Path $configPath -Value "Include: normal.txt"
} else {
    Set-Content -Path $configPath -Value "Include: swap.txt"
}