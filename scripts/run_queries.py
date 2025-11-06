import argparse
import sqlite3
import os
import pandas as pd

parser = argparse.ArgumentParser()
parser.add_argument('--db', required=True)
parser.add_argument('--outdir', default='outputs')
args = parser.parse_args()

os.makedirs(args.outdir, exist_ok=True)
conn = sqlite3.connect(args.db)
with open('sql/queries.sql', 'r') as f:
    raw = f.read()

queries = [q.strip() for q in raw.split(';') if q.strip()]
for i, q in enumerate(queries, start=1):
    try:
        df = pd.read_sql_query(q, conn)
        outpath = os.path.join(args.outdir, f'query_{i:02d}.csv')
        df.to_csv(outpath, index=False)
        print('Wrote', outpath)
    except Exception as e:
        print('Skipping query', i, 'error:', e)

conn.close()
