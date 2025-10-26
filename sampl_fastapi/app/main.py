from fastapi import FastAPI
from prometheus_client import Counter, make_asgi_app
from starlette.responses import JSONResponse
import socket

app = FastAPI(title="demo-app")

@app.get("/health")
def health():
    return JSONResponse({"status": "ok"})

PURCHASES = Counter("app_purchases_total", "Total number of purchases")

@app.post("/purchase")
def purchase():
    PURCHASES.inc()
    return {"ok": True}

@app.get("/whoami")
def whoami():
    return {"hostname": socket.gethostname()}

metrics_app = make_asgi_app()
app.mount("/metrics", metrics_app)
