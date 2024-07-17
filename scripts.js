document.addEventListener("DOMContentLoaded", function() {
    const feedbackForm = document.getElementById('feedback-form');
    const feedbackButton = document.getElementById('feedback-button');
    const alertBox = document.getElementById('alert-box');
    const themeToggle = document.getElementById('theme-toggle');
    let lastFeedbackTime = 0;

    feedbackForm.addEventListener('submit', function(event) {
        event.preventDefault();

        const feedbackText = document.getElementById('feedback-text').value;
        const email = document.getElementById('email').value;
        const discordName = document.getElementById('discord-name').value;

        if (!feedbackText || !email || !discordName) {
            alert('Lütfen tüm alanları doldurun.');
            return;
        }

        // Check if 20 seconds have passed since the last feedback
        const currentTime = Date.now();
        if (currentTime - lastFeedbackTime < 20000) {
            alert('Lütfen 20 saniye bekleyin.');
            return;
        }

        // Webhook URL
        const webhookUrl = 'YOUR_DISCORD_WEBHOOK_URL';

        // Webhook payload
        const payload = {
            username: 'BloxHook Bot',
            embeds: [
                {
                    title: "Yeni Feedback",
                    color: 15158332, // Red color
                    fields: [
                        {
                            name: "E-posta",
                            value: email,
                            inline: true
                        },
                        {
                            name: "Discord İsmi",
                            value: discordName,
                            inline: true
                        },
                        {
                            name: "Mesaj",
                            value: feedbackText
                        }
                    ]
                }
            ]
        };

        // Send feedback to webhook
        fetch(webhookUrl, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(payload)
        }).then(response => {
            if (response.ok) {
                // Update the last feedback time
                lastFeedbackTime = Date.now();

                // Show alert box
                alertBox.classList.remove('hidden');
                feedbackForm.reset();
                setTimeout(function() {
                    alertBox.classList.add('hidden');
                }, 3000); // Hide alert box after 3 seconds
            } else {
                alert('Feedback gönderilemedi.');
            }
        }).catch(error => {
            alert('Feedback gönderilemedi.');
        });
    });

    themeToggle.addEventListener('click', function() {
        document.body.classList.toggle('light-theme');
    });
});
