/**
* Copyright (c) 2015, innovativeSaaS.com
* This software may be modified and distributed under the terms of the MIT license.
*
* @description Base DAO class. All Data transaction should go through DAO layer.
* @author innovativeSaaS.com
* @since 2015
* @api 35.0
*/
public with sharing abstract class BaseDAO {
	private Map<Id, SObject> allRecords;
	private AccessManager.IAccessManager accessManager;

	public AppConstants.SharingMode sharingMode {
		get;
		set {
			sharingMode = AppConstants.SharingMode.WITH_SHARING;
		}
	}

	public Boolean operationMode {
		get;
		set {
			operationMode = true;
		}
	}

	public Integer recordLimit {
		get;
		set {
			recordLimit = AppConstants.DEFAULT_QUERY_LIMIT;
		}
	}

	public BaseDAO(String sObjectName) {
		accessManager = new AccessManager(sObjectName);
	}

	public Map<Id, SObject> getAllRecords(List<String> fields, String sObjectName) {
		return null;

	}

	public Map<Id, SObject> getAllRecordsByCondition(List<String> fields,
	                                                 String sObjectName,
	                                                 String filterCriteria,
	                                                 List<String> filterCriteriaFields) {

		return null;
	}

	public Database.SaveResult[] insertRecord(Map<String, String> recordMap, String sObjectName) {
		return null;
	}

	public Database.SaveResult[] insertRecord(SObject record) {
		return null;
	}

	public Database.SaveResult[] insertRecords(List<SObject> records) {
		return null;
	}

	public Database.SaveResult[] updateRecords(SObject record, Map<String, String> updatedValueMap) {
		return null;
	}

	public Database.SaveResult[] updateRecords(List<SObject> records) {
		return null;
	}

	public Database.UpsertResult[] upsertRecords(SObject record,
	                                             Schema.SObjectField externalIdField,
	                                             Map<String, String> updatedValueMap) {
		return null;
	}

	public Database.UpsertResult[] upsertRecords(SObject record,
	                                             Schema.SObjectField externalIdField) {
		try {
			if (!record.isEmpty()) {
				return Database.upsert(record, externalIdField, operationMode);
			}
			//throw exception no records to upsert
			return null;
		} catch (Exception ex) {
			ExceptionHandler.handle(ex);
		}
	}

	public Database.UpsertResult[] upsertRecords(List<SObject> records, Schema.SObjectField externalIdField ) {
		try {
			if (!records.isEmpty()) {
				return Database.upsert(records, externalIdField, operationMode);
			}
			//throw exception no records to upsert
			return null;
		} catch (Exception ex) {
			ExceptionHandler.handle(ex);
		}
	}

	public Database.DeleteResult[] deleteRecords(List<SObject> records) {
		try {
			if (!records.isEmpty()) {
				return Database.delete(records, operationMode);
			}
		} catch (Exception ex) {
			ExceptionHandler.handle(ex);
		}
	}

	public Database.DeleteResult[] deleteRecords(List<Id> records) {
		return null;
	}
}