public with sharing class query2 {
  public void  record_Contact()
  {
List<Contact> record = [SELECT Id, Email FROM Contact];
System.debug(record);
  
  }
  
  public void map_User()
  {
  Map<Id,User> B = new Map<Id,User>([SELECT Id,name FROM User where isActive= true ]);
System.debug(B);
  
  }
  
  public void map_Account()
  {
  
  list <Account> Acc= [SELECT name,Id FROM Account];
Map<Id,Account>m1 = new Map<Id,Account> (Acc);
system.debug(m1);

list<Account> a1=[select id, name From Account];
Map<String, Id> map1 = new Map<String, Id> {};
    for(Account a:a1){
        map1.put(a.name,a.id);}
system.debug(map1);
  }
  
  
  public void pick_Account()
  {
  list <Account> Acc1=[select Id,name from account where Enrollment_Year__c includes ('2010')];
   system.debug(Acc1);
   
    list <Account> Acc2=[select Id,name from account where Enrollment_Year__c includes ('2013','2014')];
   system.debug(Acc2);
    }
    
    public void account_State()
    {
    list <Account> Acc= [Select Name FROM Account where BillingState NOT IN ('Maharashtra','Kerala')
    ORDER BY Name DESC NULLS LAST limit 10000];
	system.debug(Acc);
    }
    
    public void opportunity_delete()
    {
    list <opportunity> Acc=[select id ,name from opportunity where (amount>10000) and  (isDeleted=true) order by CreatedDate ASC limit 100 offset 50];
    system.debug(Acc);
    }
    
    public void fiscalYear()
    {
   List<AggregateResult> ref =new List<AggregateResult>([select sum(amount) from Opportunity where closeDate=THIS_FISCAL_YEAR]);
      Map<Date, List<AggregateResult>> newMap = new Map<Date,List<AggregateResult>>();
      list<opportunity> cDate = [select closeDate from Opportunity where closeDate=THIS_FISCAL_YEAR];
      newMap.put((cDate.get(1)).closeDate, ref);
      system.debug(newMap);
    }
    
     public void count_leadSource()
    {
    list<AggregateResult>leadList= new  list <AggregateResult>([select count(id) from lead group by leadsource having count(leadsource)>10]);  
    system.debug(leadList);
    
    }
    
    public void LeadRecord_leadSource()
    {
     List<AggregateResult> arLeadByStatusBySource = [select status,leadsource,count(name) from Lead group by status,leadsource];
system.debug(arLeadByStatusBySource);
List<AggregateResult> arLeadByStatus = [select status from Lead group by status];
system.debug(arLeadByStatus);
Map<String,Map<String,Integer>> mapLeadByStatusBySource = new Map<String,Map<String,Integer>>{};


for(AggregateResult eachArrSt:arLeadByStatus) {
        Map<String,Integer> innerMap = new Map<String,Integer>{};
    for(AggregateResult eachAggRes : arLeadByStatusBySource){
        if(((String)eachArrSt.get('Status'))==((String)eachAggRes.get('Status'))){
        innerMap.put((String)eachAggRes.get('LeadSource'),(Integer)eachAggRes.get('expr0'));
        }
         mapLeadByStatusBySource.put(arLeadByStatus.get('Status'),innerMap);
         
         System.debug(mapLeadByStatusBySource);
    }
    
    public void contact_to_acc(){
    List <Contact > contact1 = new List<Contact>([select name,contact.account.name from Contact where contact.account.industry='media' and contact.account.Active__c ='yes']);
    System.debug(contact1);
    }
  
     public void c_to_a(){
    List <C__c > contactList = new List<C__c>([Select name,c.Quantity__r.name, c.Item__r.name From C__c c where name ='John']);
    System.debug(contactList);
    }  
    
    public void account_to_contact(){
    List<Account >accountList= new List <Account>([select id,name,(select name from contacts where firstname ='john') from account where id IN(select accountid from contact where firstname= 'john')]);
    system.debug(accountList);
    }
     public void account_to_oppor()
     {
     list <Account>accountlist = new  List<account> ([select name ,(select name from opportunities where stagename ='Closed Won') from account where id in (select accountid from opportunity where stagename ='Closed Won')]);
     
     System.debug(accountlist);
     }
     
     public void a_to_c()
     {
     list <A>  Alist = new  List<A> ([select id , name ,(select name from C__r where name ='John') from A__c where id in (select item__c from C__c where name ='John'))]);
     System.debug(accountlist);
     }
}