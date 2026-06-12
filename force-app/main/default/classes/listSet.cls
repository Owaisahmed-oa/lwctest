public class listSet {
		public static void listNums(){
        List<Integer> nums = new List<Integer>();
        nums.add(25);
        nums.add(39);
        nums.add(48);
        nums.add(39);
        nums.add(25);
        System.debug(nums);
        
        Set<Integer> sets = new Set<Integer>();
        sets.add(25);
        sets.add(39);
        sets.add(48);
        sets.add(39);
        sets.add(25);
        System.debug(sets);
    }
    public static void listNames(){
        List<String> names = new List<String>();
        names.add('Fatir');
        names.add('Malik');
        names.add('Haroon');
        names.add('Fahad');
        names.add('Owais');
        System.debug(names);
        
        Set<String> name = new Set<String>();
        name.add('Fahad');
        name.add('Malik');
        name.add('Owais');
        name.add('Fahad');
        name.add('Owais');
        System.debug(name);
     }
    public static void listDecimal(){
        List<Decimal> percent = new List<Decimal>();
        percent.add(95.5);
        percent.add(82.5);
        percent.add(68.2);
        percent.add(81.1);
        percent.add(76.9);
        System.debug(percent);
        
        Set<Decimal> percentage = new Set<Decimal>();
        percentage.add(95.5);
        percentage.add(82.5);
        percentage.add(68.2);
        percentage.add(82.5);
        percentage.add(95.5);
        System.debug(percentage);
    }
}