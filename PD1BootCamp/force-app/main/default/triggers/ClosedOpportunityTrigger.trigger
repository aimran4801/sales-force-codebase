trigger ClosedOpportunityTrigger on Opportunity (after insert, after update){
  list<Task> tList =new List<Task>();
    for(Opportunity o: Trigger.new){
        if(o.StageName =='Closed Won'){
             tList.add(new Task(Subject ='Follow up Test Task', WhatId =o.Id));  
        }
    }
    if(tList.size()>0){
        insert tList;
    }
}