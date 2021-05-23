import sys
#
for row in sys.stdin:
  lista = row.split(",")
  campos_1 = lista[3]
  campos_2 = lista[4]
  sys.stdout.write(campos_1 + "\t" + campos_2 + "\n")
#
