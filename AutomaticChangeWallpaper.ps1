$wallpaperPath = Join-Path $PSScriptRoot "Images"
$hour = (Get-Date).Hour

# Get wallpaper according to actual date
if ($hour -ge 6 -and $hour -lt 11) {
    $image = "$wallpaperPath\morning.png"
} elseif ($hour -ge 11 -and $hour -lt 18) {
    $image = "$wallpaperPath\day.png"
} elseif ($hour -ge 18 -and $hour -lt 22) {
    $image = "$wallpaperPath\night.png"
} else {
    $image = "$wallpaperPath\late_night.png"
}

Add-Type -TypeDefinition @"
using System.Runtime.InteropServices;

public class Wallpaper {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

[Wallpaper]::SystemParametersInfo(20, 0, $image, 3)
