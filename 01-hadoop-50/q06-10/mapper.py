import sys
#
for row in sys.stdin:
  col1, col2, col3 = row.split("   ")
  sys.stdout.write("{}\t{}\n".format(col1.rstrip(), col3.rstrip()))
#

