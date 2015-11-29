/**
* Copyright (c) 2015, innovativeSaaS.com
* This software may be modified and distributed under the terms of the MIT license.
*
* @description App configuration data class.
* @author innovativeSaaS.com
* @since 2015
* @api 35.0
*/
public with sharing class AppConfiguration {
	private static AppConfiguration appConfig = null;

	private AppConfiguration() {
		if (appConfig == null) {
			appConfig = new AppConfiguration();
		}
		return appConfig;
	}

	public static AppConfiguration getAppConfiguration() {
		if (appConfig == null) {
			appConfig = new AppConfiguration();
		}
		return appConfig;
	}

}