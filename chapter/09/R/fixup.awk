# grab the first begin{tikzpicture}
/begin{tikzpic/ && !num  {num=FNR;line=$0;} 

# out the repair script
END{
    print num " i\\"
    print "\\"line
    print ""
    print "$ a\\"
    print "\\\\end{tikzpicture}"
    print ""
}
