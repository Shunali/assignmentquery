@isTest

public class TestclassDomain
{

 static testmethod void testContactTrigger_one()
    {
    Account a =new Account();
      a.Name='Admin';
      a.Domain__c='gmail.com';
      insert a;
        System.assertEquals(a.name, 'Admin');    
       Contact c =new Contact();
       c.LastName= 'Sonu';  
       c.Email='Ab@gmail.com';
       c.MobilePhone= '2234234';
       insert c;   
       System.assertEquals(c.Lastname, 'Sonu');  
            
    }

 static testmethod void testContactTrigger_two()
    {
   List<Account> AccList =new List <Account>();
      Account ac=new Account(name='abc',Domain__c='yahoo.com');
      AccList.add(ac);
      insert AccList;
      Contact c =new Contact();
      c.LastName= 'Sonu';  
      c.Email='Ab@yahoo.com';
      c.MobilePhone= '2234234';
      insert c;   
       System.assertEquals(c.Lastname, 'Sonu');  
            
    }
 static testmethod void testContactTrigger_three()
    {
   List<Account> AccList =new List <Account>();
      Account ac=new Account(name='abc',Domain__c='yahoo.com');
      AccList.add(ac);
      insert AccList;
      Contact c =new Contact();
      c.LastName= 'Sonu';  
      c.Email='Ab@gmail.com';
      insert c;   
       System.assertEquals(c.Lastname, 'Sonu');  
            
    }
    
     static testmethod void testContactTrigger_four()
    {
   List<Account> AccList =new List <Account>();
      Account ac=new Account(name='abc',Domain__c='gmail.com');
      AccList.add(ac);
      insert AccList;
      Contact c =new Contact();
      c.LastName= 'Sonu';  
      c.Email=' ';
      insert c;   
       System.assertEquals(c.Lastname, 'Sonu');  
            
    }

}