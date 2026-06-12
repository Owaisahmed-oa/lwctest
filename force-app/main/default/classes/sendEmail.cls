public class sendEmail {
    public static void sendEmailToAdmin(){
        
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        mail.setToAddresses(new String[]{'fahadosm47@gmail.com'});
        
        mail.setSubject('This is a test email');
        
        mail.setPlainTextBody('This is line one' + '\n' +'This is line two');
        
        emails.add(mail);
        
        Messaging.sendEmail(emails);
    }
}