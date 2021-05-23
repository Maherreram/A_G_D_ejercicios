import sys
#
key_ant = None
val_ant = 0
val_max = 0
for row in sys.stdin:
  key_pres, val_pres = row.split("\t")
  val_pres = float(val_pres)

  if key_pres == key_ant:
    val_max = val_pres

  else:
    if key_ant is not None:
      sys.stdout.write("{}\t{}\t{}\n".format(key_ant, val_max, val_ant))
         
    key_ant = key_pres
    val_ant = val_pres
    val_max = val_pres
sys.stdout.write("{}\t{}\t{}\n".format(key_ant, val_max, val_ant))
#
