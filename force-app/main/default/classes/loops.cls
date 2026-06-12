public class loops {
	public static void forr(){
        for(Integer i =0 ; i<11 ; i= i+1){
            System.debug(i);
        }
    }
    
    public static void forList(){
        List<Integer> nums = new List<Integer>{10,20,30,40,50,60};
        for (Integer num: nums){
            
            if(num>45){
                System.debug(num + ' is greater');
            }
            else{
            	System.debug(num +   ' is smaller');
            }
        }
    }
}