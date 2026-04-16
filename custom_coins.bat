@echo off
echo Installing custom KubeJS scripts...
echo.

:: Check if kubejs folder exists
if not exist "kubejs\startup_scripts" (
    echo ERROR: kubejs\startup_scripts folder not found!
    echo Make sure you placed this bat file in your ATMons instance folder.
    pause
    exit
)

:: Write custom_coins.js directly from this script
(
echo StartupEvents.registry^('item', event =^> {
echo     event.create^('kubejs:custom_coin_pouch'^)
echo         .texture^('cobblemon:item/relic_coin_pouch'^)
echo         .displayName^('Coin Pouch'^)
echo }^)
echo.
echo StartupEvents.registry^('block', event =^> {
echo     event.create^('kubejs:custom_coin_sack'^)
echo         .displayName^('Coin Sack'^)
echo         .texture^('up', 'cobblemon:block/building_blocks/relic_coin_sack_top'^)
echo         .texture^('down', 'cobblemon:block/building_blocks/relic_coin_sack_bottom'^)
echo         .texture^('north', 'cobblemon:block/building_blocks/relic_coin_sack_front'^)
echo         .texture^('south', 'cobblemon:block/building_blocks/relic_coin_sack_side'^)
echo         .texture^('east', 'cobblemon:block/building_blocks/relic_coin_sack_side'^)
echo         .texture^('west', 'cobblemon:block/building_blocks/relic_coin_sack_side'^)
echo }^)
) > "kubejs\startup_scripts\custom_coins.js"

if %errorlevel%==0 (
    echo SUCCESS! custom_coins.js installed correctly.
    echo Please fully restart Minecraft before joining the server.
) else (
    echo ERROR: Something went wrong, file was not copied.
)

echo.
pause
