/**
* Copyright (c) 2015, innovativeSaaS.com
* This software may be modified and distributed under the terms of the MIT license.
*
* @description Sample Class to help with file header
* @author innovativeSaaS.com
* @since 2015
* @api 35.0
*/
public with sharing class TriggerDTO {
	public List<SObject> newList { get; private set;}
	public List<SObject> oldList { get; private set;}
	public Map<Id, SObject> newMap { get; private set;}
	public Map<Id, SObject> oldMap { get; private set;}
	public Schema.DescribeSObjectResult sObjectDescribe {get; private set;}
	public Integer recordCount { get; private set;}

	/**
	* @description Trigger DTO Constructor
	* @param objectName the name of the object to look up
	* @param fieldName the name of the field to look up
	* @return the describe field result for the given field
	*
	* @example
	* TriggerDTO tDTO = new TriggerDTO(newList, oldList, newMap, oldMap, recordCount);
	*/
	public triggerDTO(List<SObject> newList, List<SObject> oldList, Map<Id, SObject> newMap, Map<Id, SObject> oldMap, Integer recordCount) {
		this.newList = newList;
		this.oldList = oldList;
		this.newMap = newMap;
		this.oldMap = oldMap;
		this.recordCount = recordCount;
		this.sObjectDescribe = newList.isEmpty() ? oldList.getSObjectType().getDescribe() : newList.getSObjectType().getDescribe();
	}
}