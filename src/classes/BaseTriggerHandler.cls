/**
* Copyright (c) 2015, innovativeSaaS.com
* This software may be modified and distributed under the terms of the MIT license.
*
* @description Base Trigger handler must be extended by all the trigger handlers.
* @author innovativeSaaS.com
* @since 2015
* @api 35.0
*/

public with sharing abstract class BaseTriggerHandler implements IBaseTriggerHandler {
	private TriggerDTO triggerDTO;

	/**
	* @description BaseTriggerHandler constructor
	*/
	public BaseTriggerHandler() {
		triggerDTO = new TriggerDTO(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap, Trigger.size);
	}

	/**
	* @description handle method to identify trigger context and direct to the appropriate method to execute
	*/
	public void handle() {
		if (Trigger.isBefore) {
			if (Trigger.isInsert) {
				beforeInsert(this.triggerDTO);
			} else if (Trigger.isUpdate) {
				beforeUpdate(this.triggerDTO);
			} else if (Trigger.isDelete) {
				beforeDelete(this.triggerDTO);
			} else if (Trigger.isUndelete) {
				beforeUnDelete(this.triggerDTO);
			}
		} else if (Trigger.isAfter) {
			if (Trigger.isInsert) {
				afterInsert(this.triggerDTO);
			} else if (Trigger.isUpdate) {
				afterUpdate(this.triggerDTO);
			} else if (Trigger.isDelete) {
				afterDelete(this.triggerDTO);
			} else if (Trigger.isUndelete) {
				afterUnDelete(this.triggerDTO);
			}
		}
	}

	/**
	* @description Before insert processing of trigger. Override this method for each trigger.
	* @param triggerDTO trigger Data transfer object
	*/
	public virtual void beforeInsert(TriggerDTO triggerDTO) {

	}

	/**
	* @description After insert processing of trigger. Override this method for each trigger.
	* @param triggerDTO trigger Data transfer object
	*/
	public virtual void afterInsert(TriggerDTO triggerDTO) {

	}

	/**
	* @description Before update processing of trigger. Override this method for each trigger.
	* @param triggerDTO trigger Data transfer object
	*/
	public virtual void beforeUpdate(TriggerDTO triggerDTO) {

	}

	/**
	* @description After update processing of trigger. Override this method for each trigger.
	* @param triggerDTO trigger Data transfer object
	*/
	public virtual void afterUpdate(TriggerDTO triggerDTO) {

	}

	/**
	* @description Before delete processing of trigger. Override this method for each trigger.
	* @param triggerDTO trigger Data transfer object
	*/
	public virtual void beforeDelete(TriggerDTO triggerDTO) {

	}

	/**
	* @description After delete processing of trigger. Override this method for each trigger.
	* @param triggerDTO trigger Data transfer object
	*/
	public virtual void afterDelete(TriggerDTO triggerDTO) {

	}

	/**
	* @description Before undelete processing of trigger. Override this method for each trigger.
	* @param triggerDTO trigger Data transfer object
	*/
	public virtual void beforeUnDelete(TriggerDTO triggerDTO) {

	}

	/**
	* @description after undelete processing of trigger. Override this method for each trigger.
	* @param triggerDTO trigger Data transfer object
	*/
	public virtual void afterUnDelete(TriggerDTO triggerDTO) {

	}

	/**
	* Copyright (c) 2015, innovativeSaaS.com
	* This software may be modified and distributed under the terms of the MIT license.
	*
	* @description Base Trigger handler Interface.
	* @author innovativeSaaS.com
	* @since 2015
	* @api 35.0
	*/
	public interface IBaseTriggerHandler {

		/**
		* @description handle method to identify trigger context and direct to the appropriate method to execute
		*/
		void handle();

		/**
		* @description method for before insert processing of trigger.
		* @param triggerDTO trigger Data transfer object
		*/
		void beforeInsert(TriggerDTO triggerDTO);

		/**
		* @description method for after insert processing of trigger.
		* @param triggerDTO trigger Data transfer object
		*/
		void afterInsert(TriggerDTO triggerDTO);

		/**
		* @description method for before update processing of trigger.
		* @param triggerDTO trigger Data transfer object
		*/
		void beforeUpdate(TriggerDTO triggerDTO);

		/**
		* @description method for after update processing of trigger.
		* @param triggerDTO trigger Data transfer object
		*/
		void afterUpdate(TriggerDTO triggerDTO);

		/**
		* @description method for before delete processing of trigger.
		* @param triggerDTO trigger Data transfer object
		*/
		void beforeDelete(TriggerDTO triggerDTO);

		/**
		* @description method for after delete processing of trigger.
		* @param triggerDTO trigger Data transfer object
		*/
		void afterDelete(TriggerDTO triggerDTO);

		/**
		* @description method for before undelete processing of trigger.
		* @param triggerDTO trigger Data transfer object
		*/
		void beforeUnDelete(TriggerDTO triggerDTO);

		/**
		* @description method for after undelete processing of trigger.
		* @param triggerDTO trigger Data transfer object
		*/
		void afterUnDelete(TriggerDTO triggerDTO);
	}

}