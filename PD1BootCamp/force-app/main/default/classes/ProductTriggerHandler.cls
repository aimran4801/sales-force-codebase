public class ProductTriggerHandler {
    
    public static void changingProductFamily(List<Product2> newList){
        for(Product2 product: newList){
        	if(product.IsActive == true){
        		product.Family = 'Activated Product';
        	}else{
        		product.Family = 'Deactivated Product';
        	}
        }
    }
}