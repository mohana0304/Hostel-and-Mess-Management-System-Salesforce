public with sharing class ReportController {

    @AuraEnabled
    public static Integer totalStudents(){
        return [SELECT COUNT() FROM Student__c];
    }

    @AuraEnabled
    public static Integer pendingComplaints(){
        return [SELECT COUNT() FROM Complaint__c WHERE Status__c = 'Pending'];
    }
}