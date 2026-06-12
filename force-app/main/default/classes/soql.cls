public class soql {
    public static void getContact(){
        List<Contact> contacts = [SELECT LastName FROM Contact];
        System.debug(contacts);
    }
    public static void addContact(){
        Contact c = new Contact();
        c.FirstName = 'Person A';
        c.LastName = 'Person B';
        c.Email = 'personab@gmail.com';
        insert c;
        System.debug(c);
    }
    public static void updateContact(){
        Contact p = [SELECT LastName,Email from Contact where LastName='Person B' LIMIT 1];
        p.Email='personab@yahoo.com';
        update p;
        System.debug(p);
    }
    public static void deleteContact(){
        Contact p = [SELECT LastName,Email from Contact where LastName='Person B' Limit 1];
        delete p;
    }
    public static void addAccounts(){
        
        Account a = new Account();
        a.Name = 'Microsoft';
        a.AnnualRevenue = 500000;
        insert a;
        
         Account b = new Account();
        b.Name = 'TCS';
        b.AnnualRevenue = 300000;
        insert b;
        
         Account c = new Account();
        c.Name = 'Apple';
        c.AnnualRevenue = 800000;
        insert c;
        
         Account d = new Account();
        d.Name = 'Amazon';
        d.AnnualRevenue = 900000;
        insert d;
        
         Account e = new Account();
        e.Name = 'Tesla';
        e.AnnualRevenue = 1500000;
        insert e; 
    }
    public static void updateAccount(){
        Account apple = [Select Name,AnnualRevenue From Account where Name='Apple' Limit 1];
        apple.AnnualRevenue=1200000;
        update apple;
        System.debug(apple);
    }
    public static void getAccount(){
        List<Account> accounts = [Select Name,AnnualRevenue From Account where AnnualRevenue>250000];
        for(account a:accounts){
            System.debug(a);      
        }
        
        System.debug(accounts);
    }
}