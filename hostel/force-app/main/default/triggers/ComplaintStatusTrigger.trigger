trigger ComplaintStatusTrigger on Complaint__c (after update) {

    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();

    for(Complaint__c c : Trigger.new){

        if(c.Status__c == 'Resolved'){

            Student__c stu = [SELECT Email__c FROM Student__c WHERE Id = :c.Student__c];

            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new List<String>{stu.Email__c});
            mail.setSubject('Complaint Resolved');
            mail.setPlainTextBody('Your complaint has been resolved.');

            mails.add(mail);
        }
    }

    Messaging.sendEmail(mails);
}