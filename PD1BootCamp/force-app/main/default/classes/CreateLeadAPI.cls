@RESTResource (urlMapping ='/CreateLead/')
global class CreateLeadAPI 
{
	@HTTPPost
    global static string LeadCreate()
    {
    	string fName, lName, comp;
        string fieldName, fieldValue;
        RestRequest req =RestContext.request;
        RestResponse res =RestContext.response;
        string jsonBody =req.requestBody.toString();
        JSONParser parser =JSON.createParser(jsonBody);
        while(parser.nextToken()!=null)
        {
            if(parser.getCurrentToken()!=JSONToken.END_OBJECT)
            {
                fieldName =parser.getCurrentName();
                fieldValue =parser.getText();
                
                if(fieldName =='FirstName')
                {
                    fName = fieldValue;
                }
                if(fieldName =='LastName')
                {
                    lName = fieldValue;
                }
                if(fieldName =='Company')
                {
                    comp = fieldValue;
                }
            }
            
        }
      	lead l =new lead(FirstName =fName, LastName =lName, Company =comp);
        insert l;
        return l.id;
    }
}