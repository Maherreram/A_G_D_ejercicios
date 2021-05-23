import sys
#
for row in sys.stdin:
  col1, col2, col3 = row.rstrip().split('   ') #col1, col2, col3
  sys.stdout.write(col1.rstrip()+'\t'+col2.rstrip()+'\t'+col3.rstrip()+'\t1\n')
#
