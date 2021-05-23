import sys
#
import sys
suma = 0
curkey = None
total = 1

for row in sys.stdin:
  col1, col3 = row.split("\t")
  col3 = int(col3)

  if col1 == curkey:
    suma += col3
    total += 1 
  else:
      if curkey is not None:
          sys.stdout.write("{}\t{}\t{}\n".format(curkey, float(suma), (suma/total)))
          suma=0
      curkey = col1
      total = 1
      suma = col3

sys.stdout.write("{}\t{}\t{}\n".format(curkey, float(suma), (suma/total)))
#
