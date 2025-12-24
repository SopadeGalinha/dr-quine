# Grace
FT = 'Grace_kid.py'
S = ['# Grace', 'FT = {!r}', 'S = {!r}', 'M = lambda: open(FT, "w").write(chr(10).join(S).format(FT, S))', 'M()']
M = lambda: open(FT, "w").write(chr(10).join(S).format(FT, S))
M()