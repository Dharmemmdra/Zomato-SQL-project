import argparse
import pandas as pd
import sqlite3

parser = argparse.ArgumentParser()
parser.add_argument('--csv', required=True)
parser.add_argument('--db', default='zomato.db')
args = parser.parse_args()

df = pd.read_csv(args.csv)
df.columns = [c.strip() for c in df.columns]

conn = sqlite3.connect(args.db)
df.to_sql('zomato', conn, if_exists='replace', index=False)

with open('sql/create_zomato_table.sql', 'r') as f:
    sql = f.read()
for line in sql.splitlines():
    if line.strip().upper().startswith('CREATE INDEX'):
        conn.execute(line)
conn.commit()
conn.close()
print('Loaded', len(df), 'rows into', args.db)
