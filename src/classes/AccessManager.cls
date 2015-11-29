/**
* Copyright (c) 2015, innovativeSaaS.com
* This software may be modified and distributed under the terms of the MIT license.
*
* @description Access manager validates you access levels
* @author innovativeSaaS.com
* @since 2015
* @api 35.0
*/
public with sharing class AccessManager implements IAccessManager {
	private Map<String, Schema.SObjectType> schemaMap;
	private Schema.SObjectType sObjectSchema;
	private Map<String, Schema.SObjectField> fieldMap;

	/**
	* @description constructor
	* @param sObjectName the name of the object
	*/
	public AccessManager(String sObjectName) {
		schemaMap = Schema.getGlobalDescribe();
		sObjectSchema = schemaMap.get(sObjectName);
		fieldMap = sObjectSchema.getDescribe().fields.getMap();
	}

	/**
	* @description Checks if the user has access to create a record
	* @param sObjectName the name of the object to check access
	* @return boolean true if the user has access
	*/
	public Boolean canCreateRecord() {
		return sObjectSchema.getDescribe().isCreateable();
	}

	/**
	* @description Checks if the user has access to read a record
	* @param sObjectName the name of the object to check access
	* @return boolean true if the user has access
	*/
	public Boolean canReadRecord() {
		return sObjectSchema.getDescribe().isAccessible();
	}

	/**
	* @description Checks if the user has access to update a record
	* @param sObjectName the name of the object to check access
	* @return boolean true if the user has access
	*/
	public Boolean canUpdateRecord() {
		return sObjectSchema.getDescribe().isUpdateable();
	}

	/**
	* @description Checks if the user has access to delete a record
	* @return boolean true if the user has access
	*/
	public Boolean canDeleteRecord() {
		return sObjectSchema.getDescribe().isDeletable();
	}

	/**
	* @description Checks if the user has access to view the field on the object
	* @param fieldName the name of the field to check access
	* @return boolean true if the user has access
	*/
	public Boolean canViewField(String fieldName) {
		if (fieldMap.containsKey(fieldName)) {
			return fieldMap.get(fieldName).getDescribe().isAccessible();
		}
		return false;
	}

	/**
	* @description Checks if the user has access to update the field on the object
	* @param fieldName the name of the field to check access
	* @return boolean true if the user has access
	*/
	public Boolean canUpdateField(String fieldName) {
		if (fieldMap.containsKey(fieldName)) {
			return fieldMap.get(fieldName).getDescribe().isUpdateable();
		}
		return false;
	}

	/**
	* @description Checks if the user has access to create the field on the object
	* @param fieldName the name of the field to check access
	* @return boolean true if the user has access
	*/
	public Boolean canCreateField(String fieldName) {
		if (fieldMap.containsKey(fieldName)) {
			return fieldMap.get(fieldName).getDescribe().isCreateable();
		}
		return false;
	}

	/**
	* @description gets the list of all fields the user can view in an object
	* @return List of field names
	*/
	public List<String> getViewableFields() {
		List<String> viewableFields = new List<String>();
		for (String key : fieldMap.keySet()) {
			if (fieldMap.get(key).getDescribe().isAccessible()) {
				viewableFields.add(key);
			}
		}
		return viewableFields;
	}

	/**
	* @description gets the list of all fields the user can update in an object
	* @return List of field names
	*/
	public List<String> getUpdateableFields() {
		List<String> updateableFields = new List<String>();
		for (String key : fieldMap.keySet()) {
			if (fieldMap.get(key).getDescribe().isUpdateable()) {
				updateableFields.add(key);
			}
		}
		return updateableFields;
	}

	/**
	* @description gets the list of all fields the user can create in an object
	* @return List of field names
	*/
	public List<String> getCreatableFields() {
		List<String> createableFields = new List<String>();
		for (String key : fieldMap.keySet()) {
			if (fieldMap.get(key).getDescribe().isCreateable()) {
				createableFields.add(key);
			}
		}
		return createableFields;
	}

	public interface IAccessManager {

		/**
		* @description Checks if the user has access to create a record
		* @return boolean true if the user has access
		*/
		Boolean canCreateRecord();

		/**
		* @description Checks if the user has access to read a record
		* @return boolean true if the user has access
		*/
		Boolean canReadRecord();

		/**
		* @description Checks if the user has access to update a record
		* @return boolean true if the user has access
		*/
		Boolean canUpdateRecord();

		/**
		* @description Checks if the user has access to delete a record
		* @return boolean true if the user has access
		*/
		Boolean canDeleteRecord();

		/**
		* @description Checks if the user has access to view the field on the object
		* @param fieldName the name of the field to check access
		* @return boolean true if the user has access
		*/
		Boolean canViewField(String fieldName);

		/**
		* @description Checks if the user has access to update the field on the object
		* @param fieldName the name of the field to check access
		* @return boolean true if the user has access
		*/
		Boolean canUpdateField(String fieldName);

		/**
		* @description Checks if the user has access to create the field on the object
		* @param fieldName the name of the field to check access
		* @return boolean true if the user has access
		*/
		Boolean canCreateField(String fieldName);

		/**
		* @description gets the list of all fields the user can view in an object
		* @return List of field names
		*/
		List<String> getViewableFields();

		/**
		* @description gets the list of all fields the user can update in an object
		* @return List of field names
		*/
		List<String> getUpdateableFields();

		/**
		* @description gets the list of all fields the user can create in an object
		* @return List of field names
		*/
		List<String> getCreatableFields();
	}
}