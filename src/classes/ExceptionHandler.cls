/**
* Copyright (c) 2015, innovativeSaaS.com
* This software may be modified and distributed under the terms of the MIT license.
*
* @description Custom Exception Handler Class
* @author innovativeSaaS.com
* @since 2015
* @api 35.0
*/
public with sharing class ExceptionHandler {
	Logger logger;
	public ExceptionHandler() {
		logger = logger.getLogger('ExceptionHandler');
	}

	public class TriggerException extends Exception {

	}

	public handle(Exception ex) {

	}

}