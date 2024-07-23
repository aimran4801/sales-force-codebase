trigger AddRelatedRecord on Account (after insert, after update) {
    if(Trigger.isExecuting){
        
        if(trigger.isInsert && trigger.isAfter){
            AddRelatedRecordHandler.relatedContact(Trigger.new);
        }
        
        if(trigger.isUpdate && trigger.isAfter){
            AddRelatedRecordHandler.sendData(Trigger.new);
        }
        
        if(trigger.isAfter && (Trigger.isUpdate && Trigger.isInsert)){
            AddRelatedRecordHandler.updateRecordType(trigger.new);
        }        
    }    
}