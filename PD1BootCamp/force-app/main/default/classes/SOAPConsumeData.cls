public with sharing class SOAPConsumeData {
    /*
        <result>
            <user>
                <userName>Imran</userName>
                <active>true</active>
            </user>
            <user>
                <userName>Abdul</userName>
                <active>true</active>
            </user>
        </result>
    */
    public static void parseXMLData(){
        String response ='<?xml version="1.0" encoding="UTF-8"?><result><user><userName>Imran</userName><active>true</active></user><user><userName>Abdul</userName><active>true</active></user></result>';
        Dom.Document doc = new Dom.Document();
        doc.load(response);
        Dom.XmlNode rootElement = doc.getRootElement();
        for(Dom.XmlNode child: rootElement.getChildElements()){
            for(Dom.XmlNode child2: child.getChildElements()){
                System.debug('key: '+ child2.getName());
                System.debug('value: '+ child2.getText());
            }
        }
    }
}