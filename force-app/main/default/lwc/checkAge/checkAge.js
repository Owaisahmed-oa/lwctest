import { LightningElement } from 'lwc';
import getAllEmployees from '@Salesforce/apex/shareEmployee.getAllEmployees'

export default class CheckAge extends LightningElement {
    age=0;
    adult=false;
    emps=[];

    

       callAllEmployees=()=>{
    getAllEmployees().then(result =>{
        this.emps = result;
        console.log('All Employees',result)
    }).catch(err=>{
console.log('Error in calling employees');
    });
   }

    enterAge=(e)=>{
        this.age = e.target.value;
    }

    checkAge=()=>{
        if(this.age>=18){
            this.adult=true;
        }else{
            this.adult=false;
        }
    }

    number1=0;
    number2=0;

    enterNumber1=(e)=>{
        this.number1=e.target.value;
        console.log(this.number1);
    }
      enterNumber2=(e)=>{
        this.number2=e.target.value;
        console.log(this.number2);
    }

    addNumbers=()=>{
        let sum = Number(this.number1) + Number(this.number2);
        alert(sum);
    }

}