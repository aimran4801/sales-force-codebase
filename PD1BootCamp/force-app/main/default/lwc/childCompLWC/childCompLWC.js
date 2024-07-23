import { LightningElement } from 'lwc';

export default class ChildCompLWC extends LightningElement {
    message;

    handleChange(event){
        this.message = event.target.value;
        
        const passEvent = new CustomEvent("getgreetings",{
            detail: this.message
        });
        this.dispatchEvent(passEvent); 
    }

    // handleChange(event){
    //     this.message = event.target.value;

    //     this.dispatchEvent(new CustomEvent("getgreetings",{
    //         detail: this.message
    //     })
    //   );
    // }
}