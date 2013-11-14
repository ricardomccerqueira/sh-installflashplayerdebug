curl http://fpdownload.macromedia.com/pub/flashplayer/updaters/11/flashplayer_11_plugin_debug.dmg > flashplayer_11_plugin_debug.dmg

hdiutil attach -mountpoint ./flashplayer flashplayer_11_plugin_debug.dmg

cp -R flashplayer/Install\ Adobe\ Flash\ Player\ Debugger.app/ ./installer.app

hdiutil detach ./flashplayer

open ./installer.app
wait

sudo echo 'ErrorReportingEnable=1
TraceOutputFileEnable=1' > /Library/Application\ Support/Macromedia/mm.cfg
~/Library/Preferences/Macromedia/Flash\ Player/Logs/

if [ ! -d ~/Library/Preferences/Macromedia/ ]; then
    mkdir ~/Library/Preferences/Macromedia/
fi

if [ ! -d ~/Library/Preferences/Macromedia/Flash\ Player/ ]; then
    mkdir ~/Library/Preferences/Macromedia/Flash\ Player/
fi

if [ ! -d ~/Library/Preferences/Macromedia/Flash\ Player/Logs/ ]; then
    mkdir ~/Library/Preferences/Macromedia/Flash\ Player/Logs/
fi

echo '' > ~/Library/Preferences/Macromedia/Flash\ Player/Logs/flashlog.txt

shortcut="alias flashLog='tail -f /Users/ricardomccerqueira/Library/Preferences/Macromedia/Flash\ Player/Logs/flashlog.txt'";

if [ -f ~/.bash_profile ]; then
echo $shortcut >> ~/.bash_profile
else
echo $shortcut > ~/.bash_profile
fi