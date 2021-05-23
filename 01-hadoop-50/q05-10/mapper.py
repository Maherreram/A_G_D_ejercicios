import sys
#
for row in sys.stdin:
  for camp in row:
    año, mes, dia = row.split("-")
    #sys.stdout.write(val.rstrip() + "\t" + key.rstrip() +"\n")
  sys.stdout.write("{}\t1\n".format(mes.rstrip()))
#
