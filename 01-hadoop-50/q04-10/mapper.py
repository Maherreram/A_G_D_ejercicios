import sys
#
for row in sys.stdin:
  col1, col2, col3 = row.split("   ")
  #sys.stdout.write(val.rstrip() + "\t" + key.rstrip() +"\n")
  sys.stdout.write("{}\t1\n".format(col1.rstrip()))
#

