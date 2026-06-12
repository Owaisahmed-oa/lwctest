import { LightningElement } from 'lwc';
import getTodos from '@salesforce/apex/callfromjson.getTodos';
export default class Todolist extends LightningElement {

    todos = [];

    connectedCallback(){
        getTodos().then(result =>{
            this.todos = result;
            console.log('Todos List', result);   
        }).catch(err=>{
            console.log('Error in calling todos'); 
        })
    }
}