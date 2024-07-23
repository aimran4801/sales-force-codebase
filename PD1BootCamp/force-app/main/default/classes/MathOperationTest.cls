@isTest
public class MathOperationTest {
	
    @isTest
    public static void additionTest(){
        Integer a=20;
        Integer b=30;
        Integer result =a+b;
        //MathOperation obj= new MathOperation();
        //Integer output =obj.addition(a, b);
        Integer output =MathOperation.addition(a, b);
        system.assertEquals(result, output);
        
    }
    @isTest
    public static void multiplyTest(){
        Integer a=3;
        Integer b=4;
        Integer result=a*b;
        Integer output =MathOperation.multiply(a, b);
        system.assertEquals(result, output);
    }
}