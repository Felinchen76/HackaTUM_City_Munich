import requests

URL = "http://localhost:5000/add_user"


payload = {
    "name": "Max",
    "surname": "Mustermann",
    "telegram_id": "maxmustermann",
    "password": "securepassword123"
}

headers = {
    "Content-Type": "application/json"
}

def send_post_request():
    try:
        response = requests.post(URL, json=payload, headers=headers)

        if response.status_code == 200:
            print("Erfolg! Antwort vom Server:")
            print(response.json())
        elif response.status_code == 415:
            print("Fehler: Unsupported Media Type. Content-Type prüfen.")
        elif response.status_code == 400:
            print("Fehler: Ungültige JSON-Daten.")
        else:
            print(f"Fehler: Status-Code {response.status_code}")
            print("Antwort:", response.text)
    except requests.exceptions.RequestException as e:
        print("Fehler bei der Anfrage:", e)

if __name__ == "__main__":
    send_post_request()
