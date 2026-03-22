public with sharing class StudentController {

    @AuraEnabled
    public static void addStudent(String name, String email, String phone) {
        Student__c stu = new Student__c();
        stu.Name = name;
        stu.Email__c = email;
        stu.Phone__c = phone;
        stu.Status__c = 'Active';
        insert stu;
    }

    @AuraEnabled
    public static List<Student__c> getStudents() {
        return [SELECT Id, Name, Email__c, Phone__c FROM Student__c];
    }
}