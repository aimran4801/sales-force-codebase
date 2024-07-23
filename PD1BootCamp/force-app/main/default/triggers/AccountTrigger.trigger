trigger AccountTrigger on Account (before update) {
    for(Account a:Trigger.New){
        if(a.Active__c =='No'){
            List<Opportunity> opList =[Select id, StageName from Opportunity where Accountid= :a.Id ];
            for(Opportunity o:opList){
                if(o.StageName !='Closed Won' && o.StageName !='Closed Lost'){
                    a.addError('Account cannot be deactivated as it has open opportunities');
                }
            }
        }
    }

}