# Remove some Windows app that prevent sysprep
Get-AppxPackage -AllUsers | Where-Object {$_.name -eq "Microsoft.Copilot" -or $_.name -eq "Microsoft.BingSearch" -or $_.name -eq "Microsoft.WidgetsPlatformRuntime" -or $_.name -eq "Microsoft.MicrosoftOfficeHub"} | Remove-Appxpackage -AllUsers

