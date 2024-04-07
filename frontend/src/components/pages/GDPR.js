import React from 'react';
import './GDPR.css'; // Assuming you have a CSS file for styling

function GDPRPage() {
    return (
        <div className="gdpr-container">
            <h1>Privacy Policy for StudyHub</h1>
            <p>Welcome to StudyHub, accessible from our web platform.
                At StudyHub, the privacy and security of our users are of paramount importance.
                This Privacy Policy document details the types of information we collect and record, as well as how we utilize it.
                This policy is crafted to inform you about our practices regarding the collection,
                use, and disclosure of personal information you might provide through our services.</p>

            <h2>General Data Protection Regulation (GDPR)</h2>
            <p>StudyHub is the Data Controller of your information.
                The nature of personal information we collect and the method of collection depend on how you interact with our services.
                We process your personal data under the following legal bases:</p>
            <ul>
                <li>Performance of a contract with you or provision of requested services.</li>
                <li>Your explicit consent for a specific use of your personal data.</li>
                <li>Processing necessary for StudyHub's legitimate interests.</li>
                <li>Compliance with legal obligations.</li>
            </ul>

            <h2>Data Collection and Usage</h2>
            <p>To offer our services and improve your experience, we collect the following types of personal information:</p>
            <ul>
                <li>Full Name and an Email for account creation and management.</li>
                <li>Language Preferences (optional) for a personalized platform experience.</li>
                <li>Profile Images to personalize your account. Note: images remain on our servers unless manually deleted.</li>
                <li>Password, securely stored using bcrypt hashing for enhanced security.</li>
                <li>Questions or problems uploaded to the system are stored in the server database.</li>
            </ul>

            <h2>Legal Basis for Processing Personal Data Under General Data Protection Regulation (GDPR)</h2>
            <p>If you are from the European Economic Area (EEA), StudyHub legal basis for collecting and using the personal information described in this Privacy Policy depends on the Personal Data we collect and the specific context in which we collect it.</p>

            <h2> </h2>
            <p>Should you wish to delete your account or remove personal information from our systems, contact support@studyhub.live. We will assist you through the process, ensuring your data is managed according to your preferences and legal standards.</p>

            <p>By using StudyHub, you consent to the collection and use of your information as outlined in this Privacy Policy. If you do not agree with these terms, please refrain from using our services.</p>
        </div>
    );
}

export default GDPRPage;
