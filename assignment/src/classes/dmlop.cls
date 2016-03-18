public with sharing class dmlop {
public void logError()
 {
  List<Lead> leadList = new List<Lead>();
  lead leadRef;
  for(Integer i=0;i<100;i++) 
  {
      leadRef = new Lead(Uniquen__c = 101 +i ,LastName='mehra'+i , Company='ST' , 
                        status='Open - Not Contacted');
   leadList.add(leadRef);
  }
   
  try
  {
   insert leadList; 
   
  }catch(Exception e){
   e.getMessage();
   Logs__c le = new Logs__c();
   le.Error__c=e.getMessage();
   insert le;
   System.debug(le);
  }
  /*List<Lead> l1 = new List<Lead>([select LastName from Lead where LastName like 'aggarwal%']);
  System.debug(l1);*/
 }
 
 public void createdate_account(){
 Account[] acc = [SELECT  Id, Name FROM Account Where Active__c='No' And CreatedDate = LAST_N_DAYS:90];
try {
delete acc;
} catch (DmlException e) {
}
 }


public void Assert_LineItem(){
Asset a = new Asset(name='Acme ', accountid='0012800000O4RBp', contactid='0032800000GddEr' , LineItemId__c='shun');
  try 
  {
   insert(a);
   Asset a2  = [select name from asset where LineItemId__c='shun'];
   System.debug(a);
  } 
  catch (DmlException e) 
  {
  }
}