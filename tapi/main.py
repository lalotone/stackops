from fastapi import FastAPI, HTTPException
import uvicorn
from socket import gethostname


app = FastAPI()


@app.get("/foo")
async def root():
    return {"hostname": gethostname(), "endpoint": "/foo"}


@app.get("/bar")
async def root():
    return {"hostname": gethostname(), "endpoint": "/bar"}

@app.get("/fail")
async def fail():
    raise HTTPException(status_code=500, detail="Internal server error")

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8080)