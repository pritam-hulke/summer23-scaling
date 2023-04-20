public class ContactTriggerHandler {
    public static void updateAccountContactCountOninstOrUndel(List<Contact> newContact){
        Boolean Status = true;
        try{
            Set<Id> accountIds = new Set<Id>();
        	for(contact con : newContact){
            	accountIds.add(con.AccountId);
        	}
            List<Account> accUpdate = [SELECT ID, Number_Of_Contacts__c FROM Account where ID IN :accountIds];
            List<Contact> conCount = [SELECT ID, AccountId FROM Contact where AccountId IN :accountIds];
            
            for(Account acc : accUpdate){
                acc.Number_Of_Contacts__c = conCount.size();
            }
            if(!accUpdate.isEmpty()){
                Status = false;
                update accUpdate;
            }   
        }catch(exception e){
            System.debug('ERROR : '+e.getMessage() +'\n Line Number : '+e.getLineNumber());
        }
    }
    public static void updateAccountContactCountOnDel(List<Contact> oldContact){
        Boolean Status = true;
        try{
            Set<Id> accountIds = new Set<Id>();
        	for(contact con : oldContact){
            	accountIds.add(con.AccountId);
        	}
            List<Account> accUpdate = [SELECT ID, Number_Of_Contacts__c FROM Account where ID IN :accountIds];
            List<Contact> conCount = [SELECT ID, AccountId FROM Contact where AccountId IN :accountIds];
            
            for(Account acc : accUpdate){
                acc.Number_Of_Contacts__c = conCount.size();
            }
            if(!accUpdate.isEmpty()){
                Status = false;
                update accUpdate;
            }   
        }catch(exception e){
            System.debug('ERROR : '+e.getMessage() +'\n Line Number : '+e.getLineNumber());
        }
    }
    public static void updateAccountContactCountOnUpdate(List<Contact> newContact, Map<Id,Contact> mapContact){
        try{
            Set<Id> accountIds = new Set<Id>();
            Set<Id> oldAccountIds = new Set<Id>();
        	for(contact con : newContact){
                if(con.AccountId != mapContact.get(con.Id).AccountId){
                    accountIds.add(con.AccountId);
                    oldAccountIds.add(mapContact.get(con.Id).AccountId);
                }
        	}
            if(!accountIds.isEmpty()){
                List<Account> accUpdate = [SELECT ID, Number_Of_Contacts__c FROM Account where ID IN :accountIds];
            	List<Contact> conCount = [SELECT ID, AccountId FROM Contact where AccountId IN :accountIds];
            	for(Account acc : accUpdate){
                	acc.Number_Of_Contacts__c = conCount.size();
            	}
            	if(!accUpdate.isEmpty()){
                	update accUpdate;
            	} 
            }
            System.debug(accountIds.size());
            System.debug(oldAccountIds.size());
            if(!oldAccountIds.isEmpty()){
                System.debug(oldAccountIds.size());
                List<Account> oldAccUpdate = [SELECT ID, Number_Of_Contacts__c FROM Account where ID IN :oldAccountIds];
                System.debug(oldAccUpdate.size());
            	List<Contact> oldconCount = [SELECT ID, AccountId FROM Contact where AccountId IN :oldAccountIds];
                System.debug(oldconCount.size());
            	for(Account acc : oldAccUpdate){
                	acc.Number_Of_Contacts__c = oldconCount.size();
                    System.debug(oldconCount.size());
            	}
            	if(!oldAccUpdate.isEmpty()){
                update oldAccUpdate;
               
            	}
            }
        }catch(exception e){
            System.debug('ERROR : '+e.getMessage() +'\n Line Number : '+e.getLineNumber());
        }
    }
}