import { LightningElement } from 'lwc';

export default class ArrayDetails extends LightningElement {
    //SaasGuru student : name, Email ,title

    saasGuruStudents =[
        {
            Name:'Imran',
            Email:'imran@gmail.com',
            Title:'Salesforce Developer'
        },
        {
            Name:'Abdul',
            Email:'abdul@gmail.com',
            Title:'System Testing'
        },
        {
            Name:'zille',
            Email:'zille@gmail.com',
            Title:'Developer'
        },
    ];
}