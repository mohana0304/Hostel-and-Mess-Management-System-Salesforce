public with sharing class ComplaintApprovalController {

    @AuraEnabled
    public static void approveComplaint(Id complaintId){

        Complaint__c comp = [
            SELECT Id, Status__c 
            FROM Complaint__c 
            WHERE Id = :complaintId
        ];

        comp.Status__c = 'Approved';
        update comp;
    }

    @AuraEnabled
    public static void resolveComplaint(Id complaintId){

        Complaint__c comp = [
            SELECT Id, Status__c 
            FROM Complaint__c 
            WHERE Id = :complaintId
        ];

        comp.Status__c = 'Resolved';
        update comp;
    }
}