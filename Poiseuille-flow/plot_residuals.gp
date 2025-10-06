set border lw 4
set logscale y
set title "Residuals" font "Arial,22"
set ylabel "Residual" font "Arial,18"
set xlabel "Iteration" font "Arial,18"
set key width 1

# Use PowerShell to extract columns from the log
plot "< powershell -Command \"Get-Content log | ForEach-Object { if ($_ -match 'Solving for Ux') { ($_ -split ' ')[8] -replace ',' } }\"" title 'Ux' with lines lw 4,\
     "< powershell -Command \"Get-Content log | ForEach-Object { if ($_ -match 'Solving for Uy') { ($_ -split ' ')[8] -replace ',' } }\"" title 'Uy' with lines lw 4,\
     "< powershell -Command \"Get-Content log | ForEach-Object { if ($_ -match 'Solving for Uz') { ($_ -split ' ')[8] -replace ',' } }\"" title 'Uz' with lines lw 4,\
     "< powershell -Command \"Get-Content log | ForEach-Object { if ($_ -match 'Solving for p') { ($_ -split ' ')[8] -replace ',' } }\"" title 'p' with lines lw 4,\
     "< powershell -Command \"Get-Content log | ForEach-Object { if ($_ -match 'Solving for k') { ($_ -split ' ')[8] -replace ',' } }\"" title 'k' with lines lw 4,\
     "< powershell -Command \"Get-Content log | ForEach-Object { if ($_ -match 'Solving for epsilon') { ($_ -split ' ')[8] -replace ',' } }\"" title 'epsilon' with lines lw 4

pause -1
