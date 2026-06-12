public with sharing class shareAsset {
	@AuraEnabled(cacheable=true)
    public static List<Talent__c> getAllAssets(){
        List<Talent__c> assets = [Select Name,AssetType__c,AssetStatus__c From Talent__c];
        System.debug(assets);
        return assets;
    }
}