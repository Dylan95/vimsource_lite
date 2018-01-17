


"If code between s:spinlock_get() and s:spinlock_release() causes vim to quit, the lockfile will be left undeleted, and this will prevent other vim instances from running. so be very carefull, it must not crash vim!
function s:spinlock_get(filename)
	return("until lockfile " . a:filename . ".lock; do sleep 0.001; done")
endfunction
function s:spinlock_release(filename)
	return("rm -f " . a:filename . ".lock")
endfunction
