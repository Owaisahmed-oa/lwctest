public class conditions {
        public static void marks(){
        Integer marks = 95;
        if(marks>90){
            System.debug('A grade');
        }
        else{
            System.debug('B grade'); 
        }
    }
    public static void andOr(){
        Integer a=20;
        Integer b=40;
        Integer c=80;
        Integer d=90;
        
        if(a>b && a>c && a>d){
            System.debug('a is greater');
        }
        else if(b>a && b>c && b>d){
            System.debug('b is greater');
        }
        else if(c>a && c>b && c>d){
            System.debug('c is greater');
        }
        else{
            System.debug('d is greater');
        }
    }
}