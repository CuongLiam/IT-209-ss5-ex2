param($file)
$content = Get-Content $file
if ($content -match 'pick') {
    $content = $content -replace 'pick (.+) fix typo', 'squash $1 fix typo'
    $content = $content -replace 'pick (.+) adds utility functions', 'squash $1 adds utility functions'
    $content = $content -replace 'pick (.+) add temp file for debug', 'drop $1 add temp file for debug'
} else {
    $content = 'feat: hoan thien module authentication'
}
$content | Set-Content $file
