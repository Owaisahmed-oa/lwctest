public with sharing class CheckEmployee {
    @AuraEnabled(cacheable=true)
    public static boolean findEmployee(String EmployeeName){
        List<Employee__c> emp = [SELECT Name FROM Employee__c where Name=:EmployeeName];
        if(emp.isEmpty()){
            System.debug('Employee not Found');
            return false;
        }
        else{
            System.debug('Employee Found');
            return true;
        }
    }
}