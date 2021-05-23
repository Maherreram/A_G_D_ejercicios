import sys
#
for row in sys.stdin:
  col1, col2 = row.rstrip().split('\t') #col1, col2, col3
  sys.stdout.write(col1.rstrip()+'\t'+col2.rstrip()+'\t\n')
#
        