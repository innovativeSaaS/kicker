/**
* Copyright (c) 2015, innovativeSaaS.com
* This software may be modified and distributed under the terms of the MIT license.
*
* @description Logger Class for logging
* @author innovativeSaaS.com
* @since 2015
* @api 35.0
*/
public with sharing class Logger {
	public static Logger logger = null;
	//should be set from custom meta data.
	public static Boolean isLoggerOn = true;
	private static String LOG_PREFIX = '>>> ';

	private Logger() {
	}

	public Logger getLogger(String className) {
		if (logger == null) {
			logger = new Logger();
			logger.info('Entering Class ' + className);
		}
		return logger;
	}

	public void exception(Exception ex) {
		if (isLoggerOn) {
			String message = ex.getMessage();
			System.debug(LoggingLevel.ERROR, LOG_PREFIX + message);
		}
	}

	public void error(String message) {
		if (isLoggerOn) {
			System.debug(LoggingLevel.ERROR, LOG_PREFIX + message);
		}
	}

	public void warn(String message) {
		if (isLoggerOn) {
			System.debug(LoggingLevel.WARN, LOG_PREFIX + message);
		}
	}
	public void info(String message) {
		if (isLoggerOn) {
			System.debug(LoggingLevel.INFO, LOG_PREFIX + message);
		}
	}

	public void debug(String message) {
		if (isLoggerOn) {
			System.debug(LoggingLevel.DEBUG, LOG_PREFIX + message)
		}
	}

	public void fine(String message) {
		if (isLoggerOn) {
			System.debug(LoggingLevel.FINE, LOG_PREFIX + message)
		}
	}

	public void finer(String message) {
		if (isLoggerOn) {
			System.debug(LoggingLevel.FINER, LOG_PREFIX + message)
		}
	}

	public void finest(String message) {
		if (isLoggerOn) {
			System.debug(LoggingLevel.FINEST, LOG_PREFIX + message)
		}
	}

	public void flush() {
		//TODO implement flush method.
	}

}