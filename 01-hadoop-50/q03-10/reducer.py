import sys
#
for row in sys.stdin:
  key, val = row.split("\t")
  #sys.stdout.write(val.rstrip() + "," + key.rstrip() +"\n")
  sys.stdout.write("{},{}\n".format(val.rstrip(), key.rstrip()))
#
