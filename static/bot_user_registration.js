const chatBox = document.getElementById('chat');
const userInput = document.getElementById('user-input');
const confirmation = document.getElementById('confirmation');
const profileSummary = document.getElementById('profile-summary');

let registrationData = {
    name: '',
    interests: '',
    contact_method: '',
    phone_number: '',
    telegram_id: '',
    password: ''
};

function appendMessage(sender, message) {
    const messageElement = document.createElement('div');
    messageElement.className = sender;
    messageElement.innerText = message;
    chatBox.appendChild(messageElement);
    chatBox.scrollTop = chatBox.scrollHeight;
}

function initializeChat() {
    // Begrüßungsnachricht
    appendMessage('bot', 'Hallo! Schön, dich kennenzulernen! 😊\nWie lautet dein Vorname?');
}

async function sendMessage() {
    const userMessage = userInput.value;
    userInput.value = '';
    appendMessage('user', userMessage);

    const response = await fetch('/chat', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ user_input: userMessage })
    });

    const data = await response.json();
    appendMessage('bot', data.response);
}

async function confirmProfile() {
    const validation = validateData(registrationData);
    if (!validation.valid) {
        appendMessage('bot', validation.message);
        return;
    }
    await sendRegistrationData(registrationData);
    appendMessage('bot', 'Vielen Dank für deine Registrierung!');
    confirmation.style.display = 'none';
}

async function sendRegistrationData(data) {
    const response = await fetch('/register', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    });

    const result = await response.json();
    console.log(result.message);
}

function validateData(data) {
    //TODO: Validierungslogik hier hinzufügen
    return { valid: true };
}

// Initialisiere den Chat bei Seitenlade
window.onload = initializeChat;
