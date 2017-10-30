on run argv
	tell application "Apple Configurator 2"
		quit
	end tell
	tell application "iTunes"
		activate
		delay 30
		set textToType to item 1 of argv
		tell application "System Events" to tell process "iTunes" to keystroke tab
		tell application "System Events" to tell process "iTunes" to keystroke tab
		tell application "System Events" to tell process "iTunes" to keystroke tab
		tell application "System Events" to tell process "iTunes" to keystroke tab
		tell application "System Events" to tell process "iTunes" to keystroke tab
		tell application "System Events" to tell process "iTunes" to keystroke textToType
		tell application "System Events" to tell process "iTunes" to keystroke return
		delay 5
		quit
		
		
	end tell
	
end run
