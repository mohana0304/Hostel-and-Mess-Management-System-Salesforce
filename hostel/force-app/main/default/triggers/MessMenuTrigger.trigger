trigger MessMenuTrigger on Mess_Menu__c (after insert, after update) {

    List<String> emails = new List<String>();

    for(Student__c stu : [SELECT Email__c FROM Student__c WHERE Email__c != NULL]){
        emails.add(stu.Email__c);
    }

    List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();

    for(Mess_Menu__c menu : Trigger.new){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(emails);
        mail.setSubject('Mess Menu Updated');
        mail.setPlainTextBody('New Menu: ' + menu.Food_Items__c);
        mailList.add(mail);
    }

    Messaging.sendEmail(mailList);
}