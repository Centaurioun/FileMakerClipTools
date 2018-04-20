-- fmClip - Clipboard FM Objects to XML
-- version 4.0, Daniel A. Shockley, Erik Shagdar

-- 4.0 - 2018-04-04 ( dshockley/eshagdar ): load fmObjectTranslator code by reference instead of embedded.
-- 3.9.2 - 2017-08-09 ( eshagdar ): renamed 'Clipboard FileMaker Objects to XML' to 'fmClip - Clipboard FM Objects to XML' to match other handler name pattern
-- 1.8 - "clipboard convert" now ADDs the other data, not replace clipboard
-- 1.7 - handles UTF-8 properly now
-- 1.3 - put the actual conversion code into a handler with script object
-- 1.2 - cleaned up for use in Script menu
-- 1.1 - added ability to determine which FM class is in clipboard



on run
	
	set objTrans to run script alias (((((path to me as text) & "::") as alias) as string) & "fmObjectTranslator.applescript")
	(* If you need a self-contained script, copy the code from fmObjectTranslator into this script and use the following instead of the run script step above:
			set objTrans to fmObjectTranslator_Instantiate({})
	*)
	
	set shouldPrettify of objTrans to true
	set shouldSimpleFormat of objTrans to true
	set debugMode of objTrans to true
	
	set clipboardType to checkClipboardForObjects({}) of objTrans
	
	if clipboardType is false then
		display dialog "The clipboard did not contain any FileMaker objects."
		return false
	end if
	
	clipboardConvertToXML({}) of objTrans
	
	return true
	
end run











