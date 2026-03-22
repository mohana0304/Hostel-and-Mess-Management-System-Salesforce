trigger ComplaintTrigger on Complaint__c (before insert) {

    for(Complaint__c c : Trigger.new){
        c.Status__c = 'Pending';
    }
}