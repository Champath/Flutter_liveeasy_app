# liveeasy_app - login page and roleselection

LiveEasy App is a Flutter-based mobile application designed to simplify user authentication through phone number verification, leveraging Firebase Authentication. The app is intuitive, with a clean user interface and well-defined workflows for seamless navigation.

- Create a new flutter project and use these files as this repository consists of only needed files.

- To integrate firebase with your flutter app, create a new project in firebase console and follow the instructions in SDK setup.

- Important Note : Starting September 2024, to improve the security and service quality of Phone Authentication, Firebase projects must be linked to a Cloud Billing account to enable and use the SMS Service.

- Therefore to use Phone authentication your project must be linked to a Cloud Billing. To test your app for free you can add testing phone numbers and assign verification code to those numbers. 

# Pages in the app

1. Language Selection Page

 - Implements a Dropdown Button for language selection.
 - Only the Implementation of UI (The language will not change).

2. Phone Number Form Page

 - Integrated with INTL_phone_field for standardized phone number input.
 - Automatically formats phone numbers based on the selected country.

3. Otp Verification Page

 - Firebase Authentication for secure OTP generation and verification.
 - Uses PinInput for a modern and intuitive OTP entry interface.

4. Role Section Page
 
 - Features Radio Buttons for users to select their role (e.g Shipper/Transporter)

# Screenshots

![InShot_20241120_095836700](https://github.com/user-attachments/assets/52e06005-9d32-463f-9aa1-3fbc6e45c0dd)

# Test the app

Feel free to test the app by downloading the provided APK , installing it on your device. If any issues are found while testing the app, please report them.  
Please use only the following phone numbers   
Apk Link -> https://github.com/Champath/Flutter_liveeasy_app/raw/refs/heads/main/Output-test.apk 

Phone NumberㅤㅤㅤㅤVerification Code   

+91 98765 43210ㅤㅤㅤ ㅤ123456  
+1 655-633-3361ㅤㅤㅤ ㅤ636363	   
+91 99429 94247ㅤㅤㅤ ㅤ994247




