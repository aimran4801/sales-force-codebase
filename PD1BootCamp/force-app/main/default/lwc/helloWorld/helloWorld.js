import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
  getName;
  contactBDay;

  message ='Salesforce Developer';
  count = 4;
  
  handleClick(event){
    alert('Hello, I am enrolled in SaasGuru BootCamp!: '+ this.getName + ' <> ' + this.contactBDay);
  }
  handleChange(event){
    if(event.target.name == 'input1'){
      this.getName = event.target.value;
    }if(event.target.name == 'input2'){
      this.contactBDay = event.target.value;
    }
  }
}