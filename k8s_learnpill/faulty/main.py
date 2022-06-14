from typing import Union
from fastapi import FastAPI, HTTPException

app = FastAPI()

@app.get("/")
def read_root():
    raise HTTPException(status_code=500, detail="API crash expected") 
