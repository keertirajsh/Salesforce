trigger AccountTriggerEx8 on Account (before delete) {
    if(Trigger.isBefore && Trigger.isDelete){
        List<Contact> conList=[Select Id,AccountId from Contact where AccountId IN:Trigger.oldMap.Keyset()];
        if(!conList.isEmpty()){
            for(Contact con:conList){
                con.AccountId=null;
            }
        }
        update conList;
    }

}