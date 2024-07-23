trigger OpportunityTrigger on Opportunity (after update , after insert) {
   List<task> tList1 =new List<task>();
    Group oppTaskOwner = [Select Id, Name from Group where developerName = 'Order_Fulfillment_Queue' and Type = 'Queue 'limit 1];
     for(Opportunity o1:Trigger.New){
        if(o1.StageName =='Closed Won') {
          
            tList1.add(new Task(Subject ='Task created for opty', Status ='Completed', whatId =o1.Id,ownerId =oppTaskOwner.Id));
           
        }
    }
    if(tList1.size()>0){
        insert tList1;
    }
}