/**
* Copyright (c) 2015, innovativeSaaS.com
* This software may be modified and distributed under the terms of the MIT license.
*
* @description App constant file. All constants used in the app.
* @author innovativeSaaS.com
* @since 2015
* @api 35.0
*/
public with sharing class AppConstants {
	public static final Integer DEFAULT_QUERY_LIMIT = 1000;

	/**
	* ENUM Constants
	*/

	public enum SharingMode {
		WITH_SHARING,
		WITHOUT_SHARING
	}

	public enum OperationMode {
		ALL_OR_NONE,
		PARTIAL
	}
}