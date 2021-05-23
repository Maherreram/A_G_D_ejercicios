import sys
#
import pandas as pd
df = pd.DataFrame(columns=['col1', 'col2', 'col3'], index=range(40))
total = 0

for row in sys.stdin:
  col1, col2, col3, col4 = row.rstrip().split('\t')
  col3 = int(col3)
  df.iloc[total] = [col1, col2, col3]
  total += 1
  

result = df.sort_values(by='col3', ascending=True).head(6)


for index, row in result.iterrows():
  sys.stdout.write("{}\t{}\t{}\n".format(row['col1'], row['col2'], row['col3']))
#
