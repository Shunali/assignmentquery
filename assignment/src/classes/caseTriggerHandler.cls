public class caseTriggerHandler{

 public void onBeforeInsert( list<Case> objc)
    {
       system.debug(objc);
        for (Case createdCase : objc) {
              system.debug(objc);
            Id newAccountId;  
            system.debug('-->'+createdCase.SuppliedEmail+'isBLANK-->\n'+String.ISBLANK(createdCase.SuppliedEmail));
            String mail=String.valueOf(createdCase.SuppliedEmail);
            String mail12= createdCase.SuppliedEmail;
            system.debug('-->'+mail+'####'+ mail12 +'Empty-->@@@'+ String.isEmpty(mail));
            if(String.isEmpty(mail)==false ) {
                Contact[] contactsMatched = [Select Id,AccountId,email from Contact where email =:createdCase.SuppliedEmail LIMIT 1];
                   system.debug(contactsMatched +'%%%%');
                if (contactsMatched.size()>0) {
                    createdCase.ContactId = contactsMatched[0].Id;
                    createdCase.ContactId = contactsMatched[0].AccountId;
                } else {
                 system.debug('###');
                    if (createdCase.SuppliedCompany!=null) {
                        Account[] accountsMatched = [Select Id from Account where Name =:createdCase.SuppliedCompany LIMIT 1];
                        if (accountsMatched.size()>0) {                         
                            newAccountId= accountsMatched[0].Id;
                            createdCase.AccountId= newAccountId;
                        } else {
                    
                            Account createdAccount = new Account(); 
                            createdAccount.Name = createdCase.SuppliedCompany; 
                            insert createdAccount;
                            newAccountId = createdAccount.Id;
                            createdCase.AccountId = createdAccount.Id;
                        }
                    }                    
                
                    Contact theContact = new Contact();
                    theContact.AccountId = newAccountId;
                    theContact.Email = createdCase.SuppliedEmail;
                    insert theContact;
                    createdCase.ContactId = theContact.Id;                      
                }           
            }       
        }       
    }   
    


}