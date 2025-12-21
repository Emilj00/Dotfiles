from flask import Flask, request
import requests

app = Flask(__name__)

# API keys
RADARR_API_KEY = "bcda059f2cb0457e829f625aee9c02bb"
SONARR_API_KEY = "bc626351696e48ec84d577bbbea9b392"

# Target URLs
RADARR_TARGET = "http://radarr:7878/api/v3/indexer/testall"
SONARR_TARGET = "http://sonarr:8989/api/v3/indexer/testall"

@app.route("/webhook", methods=["POST"])
def webhook():
    # Forward to Radarr
    r_radarr = requests.post(RADARR_TARGET, headers={"X-Api-Key": RADARR_API_KEY})
    
    # Forward to Sonarr
    r_sonarr = requests.post(SONARR_TARGET, headers={"X-Api-Key": SONARR_API_KEY})
    
    # Combine responses
    response_text = f"Radarr: {r_radarr.status_code} {r_radarr.text}\nSonarr: {r_sonarr.status_code} {r_sonarr.text}"
    
    return response_text, 200

app.run(host="0.0.0.0", port=9000)
