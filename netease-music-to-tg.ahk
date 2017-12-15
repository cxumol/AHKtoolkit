#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

^#t::
for i,m in RxMatches(Clipboard, "O)id=(\d+)")   ; i is 1..n, m is a Match object	v0
{	v := "http://music.163.com/song?" . m.Value
	Send %v%
	Send {Enter}
}
return

RxMatches(Haystack, Needle) {
	Result := [] ;new MatchCollection()
	start = 1
	loop
	{
		if(!RegexMatch(haystack, needle, M, start)) 
			break
		Result.Insert(M)
		start := M.Pos + M.Len
	}
	return Result
}
