trigger ContactTrigger on Contact (before insert, before update) {
    for(Contact c:Trigger.New){
        if('FirstName' ==null && 'Email' ==null){
            c.addError('FirstName & Email are mandatory to assign');
            
        }
    }

}