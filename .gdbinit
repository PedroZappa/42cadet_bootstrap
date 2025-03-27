# Allow gdb to load any file in the computer
set auto-load safe-path /

### Commands
# Custom Commands
define rfr
	refresh
end

# Valgrind integration
define mchk
	monitor leak_check full reachable any
end

