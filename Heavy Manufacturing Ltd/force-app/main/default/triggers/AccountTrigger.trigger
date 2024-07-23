trigger AccountTrigger on Account (before update,after update) 
{
    Case c=new Case();
    Id accid;
    for (Account updatedAccount : Trigger.new) 
    {
        Account oldAccount = Trigger.oldMap.get(updatedAccount.Id);
        if (updatedAccount.Status__c != oldAccount.Status__c && oldAccount.Status__c == 'Verification Initiated' && 
            updatedAccount.Status__c == 'Verification Completed')
        {       			
            for(Account ac:Trigger.new)
            { accid= ac.Id;}
            c.AccountId=accid;
            c.Reason='Sales Order';
            c.Origin='Internal';
            //c.CreatedDate=Date.today();
            c.Severity__c='High';
            c.Status='New';
            c.Subject='New Customer Order';
        }
        if(oldAccount.Region__c =='Sydney')
        {
            List<Group> caseid=[Select Id from Group where Type = 'Queue' AND DeveloperNAME = 'Sydney_Case_Queue' limit 1];
            if(caseid.size()>0)
            {
                accid=caseid[0].id;	
                c.OwnerId=accid;
            }
            
        	}
        if(oldAccount.Region__c=='Brisbane')
         {
            List<Group> caseid=[Select Id from Group where Type = 'Queue' AND DeveloperNAME = 'Brisbane_Case_Queue' limit 1];
            if(caseid.size()>0)
            {
                accid=caseid[0].id;	
                c.OwnerId=accid;
            }
         }
         if(oldAccount.Region__c=='Adelaide')
         {
       		 List<Group> caseid=[Select Id from Group where Type = 'Queue' AND DeveloperNAME = 'Adelaide_Case_Queue' limit 1];
           	 if(caseid.size()>0)
             {	
                accid=caseid[0].id;	
                c.OwnerId=accid;
            }
         }
         if(oldAccount.Region__c=='Melbourne')
         {
             List<Group> caseid=[Select Id from Group where Type = 'Queue' AND DeveloperNAME = 'Melbourne_Case_Queue' limit 1];
         	 if(caseid.size()>0)
             {	
                accid=caseid[0].id;	
                c.OwnerId=accid;
            }
         } 
    }
    insert c; 
}