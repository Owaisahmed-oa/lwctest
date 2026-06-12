import { LightningElement } from 'lwc';
import getAllAssets from '@salesforce/apex/shareAsset.getAllAssets';

export default class CallAssets extends LightningElement {
    assets=[];
    connectedCallback(){
        getAllAssets().then(result=>{
            this.assets = result;
            console.log('All Assets',result)
        }).catch(err=>{
            console.log('Error in calling assets');
        });
    }
    
}