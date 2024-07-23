public with sharing class LeadController {

    @AuraEnabled(cacheable=true)
    public static List<lead> leadListData(){
        List<lead> leadData = [Select Id, Name, Company, Status from lead];
        return leadData;
    }
}