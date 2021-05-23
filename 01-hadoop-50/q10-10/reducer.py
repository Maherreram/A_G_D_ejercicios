import sys
#
import pandas as pd
df = pd.DataFrame(columns=['col1', 'col2'], index=range(30))
total = 0

for row in sys.stdin:
  col1, col2 = row.rstrip().split('\t')
  df.iloc[total] = [col1, col2]
  col1 = int(col1)
  total += 1
  
df.sort_values(by='col1', ascending = True)
df['col2'] = df['col2'].str.rsplit(',').sort_values(ascending=False)
result1 = df.explode('col2')#.sort_values(by=['col1'], ascending=True)
result = result1.groupby('col2')['col1'].apply(lambda tags: ','.join(tags)).to_frame().reset_index()


for index, row in result.iterrows():
  sys.stdout.write("{}\t{}\n".format(row['col2'], row['col1']))
#
