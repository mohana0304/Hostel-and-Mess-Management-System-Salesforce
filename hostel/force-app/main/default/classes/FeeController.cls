public with sharing class FeeController {

    @AuraEnabled
    public static Decimal getPendingFee(Id studentId){

        AggregateResult result = [
            SELECT SUM(Amount__c) total 
            FROM Fee_Payment__c 
            WHERE Student__c = :studentId
        ];

        Decimal paid = (Decimal)result.get('total');

        Decimal totalFee = 5000; // example

        return totalFee - (paid == null ? 0 : paid);
    }
}