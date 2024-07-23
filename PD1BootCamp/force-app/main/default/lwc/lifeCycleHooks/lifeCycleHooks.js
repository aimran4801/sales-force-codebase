import { LightningElement } from 'lwc';

export default class LifeCycleHooks extends LightningElement {
    
    constructor(){
        super();
        console.log('Constructor');
    }

    connectedCallback(){
        console.log('conncectedCallBack');
    }

    renderedCallback(){
        console.log('renderedCallback');
    }

    errorCallback(error,stack){

    }

    disconnectedCallback(){
        
    }
}