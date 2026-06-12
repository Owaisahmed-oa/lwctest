public class assetManagement {
    //To add new employees
    public static void newEmployees(){
        
        Employee__c employee1 = new Employee__c();
        employee1.Name = 'John doe';
        insert employee1;
        
        Employee__c employee2 = new Employee__c();
        employee2.Name = 'Jack Sparrow';
        insert employee2;
        
        Employee__c employee3 = new Employee__c();
        employee3.Name = 'James Cameron';
        insert employee3;
        
        Employee__c employee4 = new Employee__c();
        employee4.Name = 'John Nolan';
        insert employee4;
        
        System.debug(employee1);
        System.debug(employee2);
        System.debug(employee3);
        System.debug(employee4);
    }
    
    //To add new assets
    public static void newAssets(){
        
        Talent__c asset1 = new Talent__c();
        asset1.Name = 'Acer Laptop';
        asset1.AssetStatus__c='New';
        asset1.AssetType__c='Laptop';
        insert asset1;
        
        Talent__c asset2 = new Talent__c();
        asset2.Name = 'HP Laptop';
        asset2.AssetStatus__c='Used';
        asset2.AssetType__c='Laptop';
        insert asset2;
        
        Talent__c asset3 = new Talent__c();
        asset3.Name = 'Samsung Monitor';
        asset3.AssetStatus__c='New';
        asset3.AssetType__c='Monitor';
        insert asset3;
        
        Talent__c asset4 = new Talent__c();
        asset4.Name = 'Apple Mouse';
        asset4.AssetStatus__c='Used';
        asset4.AssetType__c='Mouse';
        insert asset4;
        
        Talent__c asset5 = new Talent__c();
        asset5.Name = 'Oneplus Headphones';
        asset5.AssetStatus__c='New';
        asset5.AssetType__c='Headphones';
        insert asset5;
    }
    
    //To add new employees with parameters CREATE
    public static void addNewEmployees(String name){
        Employee__c e = new Employee__c();
        e.Name=name;
        insert e;
        System.debug(e);
    }
    
    //To add new assets with parameters CREATE
    public static void addNewAssets(String name, String status, String assettype){
 		Talent__c asset = new Talent__c();
        asset.Name = name;
        asset.AssetStatus__c=status;
        asset.AssetType__c=assettype;
        insert asset;
    }
    
    
    //To get all employees READ
    public static void getAllEmployees(){
        List<Employee__c> emps =  [Select id,Name From Employee__c];
        for(Employee__c e:emps){
            System.debug(e);
        }
    }
    
    //To get all assets READ
       public static void getAllAssets(){
        List<Talent__c> assets =  [Select id,Name From Talent__c];
        for(Talent__c a:assets){
            System.debug(a);
        }
    }
    
    //To assign an asset to the employee
    public static void assignAsset(id assetId,id employeeId){
        List<Talent__c> a = [Select id,Name,isAssigned__c,EmployeeName__c,AssetStatus__c from Talent__c where id=:assetId]; 
        if(a.isEmpty()){
            System.debug('Asset not found');
            return;
        }
        else{
             System.debug('Asset Exists');
        }
        
        List<Employee__c> e = [Select id,Name from Employee__c where id=:employeeId]; 
        if(e.isEmpty()){
            System.debug('Employee not found');
            return;
        }
        else{
             System.debug('Employee Exists');
        }
        
        //Talent__c ab = new Talent__c();
            //ab=a[0];
        
        if(a[0].isAssigned__c == true){
            System.debug('Asset is assigned to other employee');
            return;
        }
        else{
            System.debug('Asset is not assigned to anyone');
        }
        
        if(a[0].AssetStatus__c == 'Broken' || a[0].AssetStatus__c == 'In Service'){
            System.debug('Asset not assignable');
            return;
        }
        
        //Assign the asset to employee UPDATE
        
        a[0].EmployeeName__c=employeeId;
        a[0].isAssigned__c=true;
		Update a[0];       
        System.debug('The Asset ' + a[0].Name + ' is assigned to '+e[0].Name);
    } 
    
    //To unAssign an asset to the employee
    public static void unAssignAsset(id assetId){
        List<Talent__c> b = [Select id,Name,isAssigned__c,EmployeeName__c,AssetStatus__c from Talent__c where id=:assetId]; 
         if(b.isEmpty()){
            System.debug('Asset not found');
            return;
        }
        else{
             System.debug('Asset Exists');
        }
        
          if(b[0].isAssigned__c == false){
            System.debug('Asset is not assigned');
            return;
        }
        else{
            System.debug('Asset is assigned');
        }
        //UPDATE
        b[0].EmployeeName__c=null;
        b[0].isAssigned__c=false;
        Update b[0];
        System.debug('Asset is unassigned');
    }
    
    //To change asset status UPDATE
    public static void changeAssetStatus(id assetId, String AssetStatus){
         List<Talent__c> c = [Select id,Name,isAssigned__c,EmployeeName__c,AssetStatus__c from Talent__c where id=:assetId]; 
         if(c.isEmpty()){
            System.debug('Asset not found');
            return;
        }
        else{
             System.debug('Asset Exists');
        }
       	c[0].AssetStatus__c=AssetStatus;
        update c[0];
    }
    
    //Get Available Assets
    public static void getAvailableAssets(){
    	List<Talent__c> gaa = [Select id,Name,isAssigned__c,EmployeeName__c,AssetStatus__c from Talent__c where isAssigned__c = False and AssetStatus__c !='Broken']; 
  		for(Talent__c a:gaa){
            System.debug(a);
        }
    }
    //Get Employee Assets
    public static void getEmployeeAssets(Id employeeId){
    	List<Talent__c> gea = [Select id,Name,isAssigned__c,EmployeeName__c,AssetStatus__c from Talent__c where EmployeeName__c=:employeeId]; 
        System.debug(gea);
    }
    
    //Mark Asset Broken
    public static void markAssetBroken(Id assetId){
    	List<Talent__c> mab = [Select id,Name,isAssigned__c,EmployeeName__c,AssetStatus__c from Talent__c where id=:assetId]; 
        mab[0].AssetStatus__c = 'Broken';
        Update mab[0];
    }
    
    //Delete Asset
     public static void deleteAsset(Id assetId){
    	List<Talent__c> da = [Select id,Name,isAssigned__c,EmployeeName__c,AssetStatus__c from Talent__c where id=:assetId]; 
        Delete da;
    }
}