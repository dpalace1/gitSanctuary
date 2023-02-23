public with sharing class SendEmailController {
    @AuraEnabled
    public static void sendEmailToUser(String username, String emailAddress, String emailMessage) {
        // Look up user by username
        User user = [SELECT Id, Email FROM User WHERE Username = :username LIMIT 1];
        
        // If user not found, throw an error
        if (user == null) {
            throw new AuraHandledException('User not found with username: ' + username);
        }
        
        // Create email message and send it
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new List<String>{emailAddress});
        email.setPlainTextBody(emailMessage);
        //email.setSaveAsActivity(false);
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{email});
    }
}

/*
This Lightning Web Component (SendEmail) has a simple HTML template with input fields for the username, email address, and email message. 

When the user clicks the "Send Email" button, the sendEmail() method is called, which calls an Apex controller method called sendEmailToUser.

The sendEmailToUser Apex method looks up the user by username, creates an email message, and sends it to the specified email address. 

If the user is not found, an AuraHandledException is thrown.

If the email is sent successfully, a success message is displayed using a ShowToastEvent. If an error occurs
*/