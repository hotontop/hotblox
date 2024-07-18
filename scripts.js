document.addEventListener('DOMContentLoaded', function() {
    const feedbackForm = document.getElementById('feedback-form');
    const alertBox = document.getElementById('alert-box');
    const themeToggle = document.getElementById('theme-toggle');

    feedbackForm.addEventListener('submit', function(event) {
        event.preventDefault();

        const email = document.getElementById('email').value;
        const discordName = document.getElementById('discord-name').value;
        const feedbackText = document.getElementById('feedback-text').value;

        const payload = JSON.stringify({
            username: "Feedback Bot",
            content: `Email: ${email}\nDiscord Name: ${discordName}\nFeedback: ${feedbackText}`
        });

        fetch('https://discord.com/api/webhooks/1261891121739730955/yOQ_djvOpQ4My3BK9flfJtB_sp6j7ov2QXDzWMKAzrtKuynS-DE2bbFVx45tKS7HzbsG', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: payload
        })
        .then(response => {
            if (response.ok) {
                alertBox.classList.remove('hidden');
                setTimeout(() => {
                    alertBox.classList.add('hidden');
                }, 3000);
                feedbackForm.reset();
            } else {
                alert('Error sending feedback.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Error sending feedback.');
        });
    });

    themeToggle.addEventListener('click', function() {
        document.body.classList.toggle('light-theme');
    });
});
