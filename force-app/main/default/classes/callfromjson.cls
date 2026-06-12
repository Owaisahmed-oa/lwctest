public with sharing class callfromjson {
    @AuraEnabled(cacheable=true)
    public static List<Object> getTodos(){
        HttpRequest req = new HttpRequest();
        req.setEndPoint('https://jsonplaceholder.typicode.com/todos');
        req.setMethod('GET');
        
        Http ht = new Http();
        HttpResponse res=ht.send(req);
        
        if(res.getStatusCode()==200){ 
            System.debug('Call was succesful'); 
            List<Object> todos = (List<Object>)JSON.deserializeUntyped(res.getBody());
            System.debug(todos);
            return todos;
        }
        else{
            System.debug('Failed to call API');
            return new List<Object>();
        }
    }
}