document.addEventListener("DOMContentLoaded", function() {
    const feedbackForm = document.getElementById('feedback');
    const feedbackButton = document.getElementById('feedback-button');
    const alertBox = document.getElementById('alert-box');

    feedbackForm.addEventListener('submit', function(event) {
        event.preventDefault();

        const feedbackText = document.getElementById('feedback-text').value;
        const email = document.getElementById('email').value;
        const discordName = document.getElementById('discord-name').value;

        if (!feedbackText || !email || !discordName) {
            alert('Lütfen tüm alanları doldurun.');
            return;
        }

        // Webhook URL
        const webhookUrl = 'https://discord.com/api/webhooks/1261891121739730955/yOQ_djvOpQ4My3BK9flfJtB_sp6j7ov2QXDzWMKAzrtKuynS-DE2bbFVx45tKS7HzbsG';

        // Webhook payload
        const payload = {
            username: 'BloxHook Bot',
            embeds: [
                {
                    title: "Yeni Feedback",
                    color: 3447003, // Blue color
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
                // Show alert box after 20 seconds
                setTimeout(function() {
                    alertBox.classList.remove('hidden');
                    feedbackForm.reset();
                    setTimeout(function() {
                        alertBox.classList.add('hidden');
                    }, 3000); // Hide alert box after 3 seconds
                }, 20000); // Wait for 20 seconds before showing alert
            } else {
                alert('Feedback gönderilirken bir hata oluştu.');
            }
        }).catch(error => {
            alert('Feedback gönderilirken bir hata oluştu.');
            console.error('Error:', error);
        });
    });
});
