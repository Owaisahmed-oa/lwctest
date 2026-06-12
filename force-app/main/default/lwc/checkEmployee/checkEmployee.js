import { LightningElement } from 'lwc';
import findEmployee from '@salesforce/apex/CheckEmployee.findEmployee';

export default class CheckEmployee extends LightningElement {
    
    empName='';
    exist=false;

    writeName=(e)=>{
        this.empName=e.target.value;
    }

    checkEmployeeExists=()=>{
        findEmployee({EmployeeName:this.empName}).then(result=>{
            if (result) {
                this.exist=true;
            } else {
                this.exist=false;
            }
        })
    }
}