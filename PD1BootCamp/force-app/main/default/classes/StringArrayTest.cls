public class StringArrayTest {
    public static List<String> generateStringArray(integer n){
     	list<String> s1 =new list<String>();
        for(integer i=0;i<n;i++){
            s1.add('Test ' +i);
            System.debug(s1[i]);  
        }
    	return s1;
    }
}