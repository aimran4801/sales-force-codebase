@RestResource(urlMapping='/campaignData/')
global with sharing class RESTExposeCampaign {
   
    @HttpGet
    global static List<Campaign> getList(){
        List<Campaign> campList = [Select Id, Name, IsActive, ActualCost, Description from Campaign];
        return campList;
    }

    @HttpPost
    global static String insertCampaign(String name, Boolean isActive){
        Campaign camp = new Campaign();
        camp.Name = name;
        camp.IsActive = isActive;
        insert camp;

        return camp.Id;
    }
}