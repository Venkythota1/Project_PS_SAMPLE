from fastapi import FastAPI
from kubernetes import client, config

app = FastAPI()

@app.get("/pods")
def list_pods():
    try:
        config.load_kube_config()
        v1 = client.CoreV1Api()
        pods = v1.list_pod_for_all_namespaces(watch=False)
        return {"pods": [pod.metadata.name for pod in pods.items]}
    except Exception as e:
        return {"error": str(e)}