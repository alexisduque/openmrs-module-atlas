/**
 * The contents of this file are subject to the OpenMRS Public License
 * Version 1.0 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://license.openmrs.org
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * Copyright (C) OpenMRS, LLC.  All Rights Reserved.
 */
package org.openmrs.module.atlas;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.api.APIException;
import org.openmrs.api.context.Context;
import org.openmrs.scheduler.tasks.AbstractTask;


/**
 *
 */
public class PostAtlasDataQueueTask extends AbstractTask {
	// Logger
	private Log log = LogFactory.getLog(this.getClass());
	private AtlasDataProcessor processor = null;
	
	/**
	 * Default Constructor 
	 * 
	 */
	public PostAtlasDataQueueTask() {
		if (processor == null)
			processor = new AtlasDataProcessor();
		
	}


	/**
     * @see org.openmrs.scheduler.tasks.AbstractTask#execute()
     */
    @Override
    public void execute() {
		log.debug("Posting atlas data ... ");
		try {
			processor.postAtlasData(processor.getAtlasData());
		} catch (APIException e) {
			log.error("Error running PostAtlasDataQueueTask", e);
			throw e;
		}
	}
	
	/**
	 * Clean up any resources here
	 *
	 */
	public void shutdown() {
		log.debug("Shutting down PostAtlasDataQueueTask task ...");
		processor = null;
	}
}