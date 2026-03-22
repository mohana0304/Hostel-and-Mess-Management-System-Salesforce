public with sharing class ComplaintController {

    @AuraEnabled
    public static void submitComplaint(String type, String desc) {
        Complaint__c comp = new Complaint__c();
        comp.Complaint_Type__c = type;
        comp.Description__c = desc;
        comp.Status__c = 'New';
        insert comp;
    }

    @AuraEnabled
    public static List<Complaint__c> getComplaints() {
        return [SELECT Id, Complaint_Type__c, Status__c FROM Complaint__c];
    }
}