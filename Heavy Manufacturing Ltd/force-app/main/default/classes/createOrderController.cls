public with sharing class createOrderController {

    @AuraEnabled
    public static Order getAndCreateWROrder(Id caseId) {
        Id repairOrderRecordTypeId = Schema.SObjectType.Order.getRecordTypeInfosByName().get('Repair Order').getRecordTypeId();
        Id replacementOrderRecordTypeId = Schema.SObjectType.Order.getRecordTypeInfosByName().get('Replacement Order').getRecordTypeId();
        Id refundOrderRecordTypeId = Schema.SObjectType.Order.getRecordTypeInfosByName().get('Refund Order').getRecordTypeId();
        Case caseObject = [Select Id, AccountId, Reason, Status From Case where Id=: caseId];
        Id accId = caseObject.AccountId;
        Account acc = [SELECT Id, shippingstreet, billingstreet,shippingcity,billingcity,shippingstate,billingstate,shippingPostalCode, billingPostalCode,ShippingCountry,BillingCountry FROM Account where Id=: accId];
        Order ord = new Order();
        ord.EffectiveDate = System.today();
        ord.AccountId = caseObject.AccountId;
        ord.Type = caseObject.Reason;
        ord.Status = 'Draft';
        ord.Billing_Address__c = acc.billingstreet + ', ' + acc.billingcity + ', ' + acc.billingstate + ', ' + acc.billingPostalCode + ', ' + acc.BillingCountry;
        ord.Shipping_Address__c = acc.shippingstreet + ', ' + acc.shippingcity + ', ' + acc.shippingstate + ', ' + acc.shippingPostalCode + ', ' + acc.ShippingCountry;
        ord.caseId__c = caseObject.Id;
        if(caseObject.Reason == 'Warranty Repair' || caseObject.Reason == 'Charged Repair'){
            ord.recordTypeId = repairOrderRecordTypeId;
        }else if(caseObject.Reason == 'Replacement'){
            ord.recordTypeId = replacementOrderRecordTypeId;
        }else if(caseObject.Reason == 'Refund'){
            ord.recordTypeId = refundOrderRecordTypeId;
        }else{
        }
        
        insert ord;
        return ord;
    }

    /**
    public static void getDetails(Id caseId){
        Case caseObj = [SELECT Id, AccountId FROM Case WHERE Id=:caseId];
        Id accId = caseObj.AccountId;
        Account acc = [SELECT Id,BillingStreet, BillingCity, BillingCountry, BillingPostalCode, BillingState FROM Account WHERE Id=:accId];
        
        Order ord = new Order();
        ord.BillingStreet = acc.BillingStreet;
        ord.BillingCity = acc.BillingCity;
        ord.BillingCountry = acc.BillingCountry;
    }
    */
}