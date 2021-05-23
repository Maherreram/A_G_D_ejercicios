import sys
#
curkey = None
total = 0
for row in sys.stdin:
  key, val = row.split("\t")
  val = int(val)

  if key == curkey:
    total += val
  else:
    if curkey is not None:
      sys.stdout.write("{},{}\n".format(curkey, total))
    
    curkey = key
    total = val
sys.stdout.write("{},{}\n".format(curkey, total))
#

