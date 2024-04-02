function passwordResetEmailTemplate(token) {
    const resetPasswordUrl = `http://localhost:3000/reset-password/${token}`;
    const supportEmail = "support@studyhub.live";
    return `
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Password Reset</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');
            body {
                font-family: 'Poppins', Arial, sans-serif;
                margin: 0;
                padding: 0;
                color: #333;
                background-color: #f4f4f4;
            }
            .container {
                max-width: 600px;
                margin: 0 auto;
                background-color: #ffffff;
                border: 1px solid #dddddd;
                border-radius: 8px;
                overflow: hidden;
            }
            .header {
                background-color: #40e0d0; 
                color: #ffffff;
                padding: 20px 40px;
                text-align: center;
            }
            .content {
                padding: 40px;
                line-height: 1.6;
            }
            .footer {
                background-color: #eeeeee;
                color: #777777;
                font-size: 12px;
                text-align: center;
                padding: 20px;
            }
            .button {
                background-color: #40e0d0;
                color: #ffffff;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 5px;
                font-weight: 600;
                display: inline-block;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>Studyhub</h1>
            </div>
            <div class="content">
                <p>Hello,</p>
                <p>You recently requested to reset your password for your Studyhub account. Please click the button below to set a new password:</p>
                <!-- Ensure the URL and token are dynamically generated in your backend -->
                <a style="color:#fff" href="${resetPasswordUrl}" class="button">Reset Password</a>
                <p>This link is valid for 15 minutes. If you did not create an account with Studyhub, please ignore this email or contact us.</p>
            </div>
            <div class="footer">
                <p>If you have any questions, feel free to <a href="mailto:${supportEmail}">contact our support team</a>.</p>
                <p>&copy; 2023 Studyhub. All rights reserved.</p>
            </div>
        </div>
    </body>
    </html>
    `;
}

module.exports = {
    passwordResetEmailTemplate,
};
