# Jimmy Session Startup Script
# Run this first thing each session: .\LOAD_CONTEXT.ps1

Write-Host "`n=== JIMMY SESSION START ===" -ForegroundColor Cyan
Write-Host "Current date: $(Get-Date -Format 'dddd, MMMM dd, yyyy')`n" -ForegroundColor Gray

Write-Host "📋 STEP 1: Ask Haley to read context files" -ForegroundColor Yellow
Write-Host "   Ask me to read: Instructions.md and Product.md" -ForegroundColor White
Write-Host "   (This loads the full project context and builds knowledge)`n"

Write-Host "📂 Files in workspace:" -ForegroundColor Yellow
Get-ChildItem -Path "." -Depth 1 | Where-Object { $_.PSIsContainer -or $_.Extension -eq ".md" } | ForEach-Object { Write-Host "   $($_.Name)" }

if (Test-Path "docs/DAILY_START.md") {
    Write-Host "`n📅 Today's task list:" -ForegroundColor Yellow
    Get-Content "docs/DAILY_START.md" | Select-Object -First 20
} else {
    Write-Host "`n⚠️  docs/DAILY_START.md not found yet — will create during setup" -ForegroundColor Gray
}

Write-Host "`n✓ Ready to start. Open VS Code at c:\Arkiv\Jimmy\JimmyCode\" -ForegroundColor Green
Write-Host "✓ Then ask me (Haley): 'Read Instructions.md and Product.md please'`n" -ForegroundColor Green
