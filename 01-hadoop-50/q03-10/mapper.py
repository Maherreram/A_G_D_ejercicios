import sys
#
for row in sys.stdin:
  key, val = row.split(",")
  #sys.stdout.write(val.rstrip() + "\t" + key.rstrip() +"\n")
  sys.stdout.write("{}\t{}\n".format(val.rstrip(), key.rstrip()))
#
