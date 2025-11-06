# Zomato: Structured Query Language

Private repo for the Zomato SQL analysis referenced on my CV.

**Purpose**: Demonstrate SQL analysis on a Zomato-style dataset (restaurant listings + reviews).

## How to run (local)
```bash
python -m venv venv
source venv/bin/activate  # or venv\Scripts\activate on Windows
pip install -r requirements.txt
python scripts/load_data_sqlite.py --csv data/zomato_sample.csv --db zomato.db
python scripts/run_queries.py --db zomato.db --outdir outputs
```
