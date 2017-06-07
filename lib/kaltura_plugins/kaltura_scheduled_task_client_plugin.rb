# ===================================================================================================
#                           _  __     _ _
#                          | |/ /__ _| | |_ _  _ _ _ __ _
#                          | ' </ _` | |  _| || | '_/ _` |
#                          |_|\_\__,_|_|\__|\_,_|_| \__,_|
#
# This file is part of the Kaltura Collaborative Media Suite which allows users
# to do with audio, video, and animation what Wiki platfroms allow them to do with
# text.
#
# Copyright (C) 2006-2017  Kaltura Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http:#www.gnu.org/licenses/>.
#
# @ignore
# ===================================================================================================
require 'kaltura_client.rb'

module Kaltura

	class KalturaDeleteFlavorsLogicType
		KEEP_LIST_DELETE_OTHERS = 1
		DELETE_LIST = 2
		DELETE_KEEP_SMALLEST = 3
	end

	class KalturaScheduledTaskAddOrRemoveType
		ADD = 1
		REMOVE = 2
		MOVE = 3
	end

	class KalturaScheduledTaskProfileStatus
		DISABLED = 1
		ACTIVE = 2
		DELETED = 3
		SUSPENDED = 4
		DRY_RUN_ONLY = 5
	end

	class KalturaObjectFilterEngineType
		ENTRY = "1"
	end

	class KalturaObjectTaskType
		DISTRIBUTE = "scheduledTaskContentDistribution.Distribute"
		DISPATCH_EVENT_NOTIFICATION = "scheduledTaskEventNotification.DispatchEventNotification"
		EXECUTE_METADATA_XSLT = "scheduledTaskMetadata.ExecuteMetadataXslt"
		DELETE_ENTRY = "1"
		MODIFY_CATEGORIES = "2"
		DELETE_ENTRY_FLAVORS = "3"
		CONVERT_ENTRY_FLAVORS = "4"
		DELETE_LOCAL_CONTENT = "5"
		STORAGE_EXPORT = "6"
		MODIFY_ENTRY = "7"
		MAIL_NOTIFICATION = "8"
	end

	class KalturaScheduledTaskProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		LAST_EXECUTION_STARTED_AT_ASC = "+lastExecutionStartedAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		LAST_EXECUTION_STARTED_AT_DESC = "-lastExecutionStartedAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaObjectTask < KalturaObjectBase
		attr_accessor :type
		attr_accessor :stop_processing_on_error

		def stop_processing_on_error=(val)
			@stop_processing_on_error = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['stopProcessingOnError'] != nil
				self.stop_processing_on_error = xml_element.elements['stopProcessingOnError'].text
			end
		end

	end

	class KalturaScheduledTaskProfile < KalturaObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :name
		attr_accessor :system_name
		attr_accessor :description
		attr_accessor :status
		# The type of engine to use to list objects using the given "objectFilter"
		attr_accessor :object_filter_engine_type
		# A filter object (inherits KalturaFilter) that is used to list objects for scheduled tasks
		attr_accessor :object_filter
		# A list of tasks to execute on the founded objects
		attr_accessor :object_tasks
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :last_execution_started_at
		# The maximum number of result count allowed to be processed by this profile per execution
		attr_accessor :max_total_count_allowed

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def last_execution_started_at=(val)
			@last_execution_started_at = val.to_i
		end
		def max_total_count_allowed=(val)
			@max_total_count_allowed = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['systemName'] != nil
				self.system_name = xml_element.elements['systemName'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['objectFilterEngineType'] != nil
				self.object_filter_engine_type = xml_element.elements['objectFilterEngineType'].text
			end
			if xml_element.elements['objectFilter'] != nil
				self.object_filter = KalturaClientBase.object_from_xml(xml_element.elements['objectFilter'], 'KalturaFilter')
			end
			if xml_element.elements['objectTasks'] != nil
				self.object_tasks = KalturaClientBase.object_from_xml(xml_element.elements['objectTasks'], 'KalturaObjectTask')
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['lastExecutionStartedAt'] != nil
				self.last_execution_started_at = xml_element.elements['lastExecutionStartedAt'].text
			end
			if xml_element.elements['maxTotalCountAllowed'] != nil
				self.max_total_count_allowed = xml_element.elements['maxTotalCountAllowed'].text
			end
		end

	end

	class KalturaConvertEntryFlavorsObjectTask < KalturaObjectTask
		# Comma separated list of flavor param ids to convert
		attr_accessor :flavor_params_ids
		# Should reconvert when flavor already exists?
		attr_accessor :reconvert

		def reconvert=(val)
			@reconvert = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['flavorParamsIds'] != nil
				self.flavor_params_ids = xml_element.elements['flavorParamsIds'].text
			end
			if xml_element.elements['reconvert'] != nil
				self.reconvert = xml_element.elements['reconvert'].text
			end
		end

	end

	class KalturaDeleteEntryFlavorsObjectTask < KalturaObjectTask
		# The logic to use to choose the flavors for deletion
		attr_accessor :delete_type
		# Comma separated list of flavor param ids to delete or keep
		attr_accessor :flavor_params_ids

		def delete_type=(val)
			@delete_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['deleteType'] != nil
				self.delete_type = xml_element.elements['deleteType'].text
			end
			if xml_element.elements['flavorParamsIds'] != nil
				self.flavor_params_ids = xml_element.elements['flavorParamsIds'].text
			end
		end

	end

	class KalturaDeleteEntryObjectTask < KalturaObjectTask


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeleteLocalContentObjectTask < KalturaObjectTask


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMailNotificationObjectTask < KalturaObjectTask
		# The mail to send the notification to
		attr_accessor :mail_address
		# The message to send in the notification mail
		attr_accessor :message
		# Send the mail to each user
		attr_accessor :send_to_users

		def send_to_users=(val)
			@send_to_users = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['mailAddress'] != nil
				self.mail_address = xml_element.elements['mailAddress'].text
			end
			if xml_element.elements['message'] != nil
				self.message = xml_element.elements['message'].text
			end
			if xml_element.elements['sendToUsers'] != nil
				self.send_to_users = xml_element.elements['sendToUsers'].text
			end
		end

	end

	class KalturaModifyCategoriesObjectTask < KalturaObjectTask
		# Should the object task add or remove categories?
		attr_accessor :add_remove_type
		# The list of category ids to add or remove
		attr_accessor :category_ids

		def add_remove_type=(val)
			@add_remove_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['addRemoveType'] != nil
				self.add_remove_type = xml_element.elements['addRemoveType'].text
			end
			if xml_element.elements['categoryIds'] != nil
				self.category_ids = KalturaClientBase.object_from_xml(xml_element.elements['categoryIds'], 'KalturaIntegerValue')
			end
		end

	end

	class KalturaModifyEntryObjectTask < KalturaObjectTask
		# The input metadata profile id
		attr_accessor :input_metadata_profile_id
		# array of {input metadata xpath location,entry field} objects
		attr_accessor :input_metadata
		# The output metadata profile id
		attr_accessor :output_metadata_profile_id
		# array of {output metadata xpath location,entry field} objects
		attr_accessor :output_metadata
		# The input user id to set on the entry
		attr_accessor :input_user_id
		# The input entitled users edit to set on the entry
		attr_accessor :input_entitled_users_edit
		# The input entitled users publish to set on the entry
		attr_accessor :input_entitled_users_publish

		def input_metadata_profile_id=(val)
			@input_metadata_profile_id = val.to_i
		end
		def output_metadata_profile_id=(val)
			@output_metadata_profile_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['inputMetadataProfileId'] != nil
				self.input_metadata_profile_id = xml_element.elements['inputMetadataProfileId'].text
			end
			if xml_element.elements['inputMetadata'] != nil
				self.input_metadata = KalturaClientBase.object_from_xml(xml_element.elements['inputMetadata'], 'KalturaKeyValue')
			end
			if xml_element.elements['outputMetadataProfileId'] != nil
				self.output_metadata_profile_id = xml_element.elements['outputMetadataProfileId'].text
			end
			if xml_element.elements['outputMetadata'] != nil
				self.output_metadata = KalturaClientBase.object_from_xml(xml_element.elements['outputMetadata'], 'KalturaKeyValue')
			end
			if xml_element.elements['inputUserId'] != nil
				self.input_user_id = xml_element.elements['inputUserId'].text
			end
			if xml_element.elements['inputEntitledUsersEdit'] != nil
				self.input_entitled_users_edit = xml_element.elements['inputEntitledUsersEdit'].text
			end
			if xml_element.elements['inputEntitledUsersPublish'] != nil
				self.input_entitled_users_publish = xml_element.elements['inputEntitledUsersPublish'].text
			end
		end

	end

	class KalturaScheduledTaskJobData < KalturaJobData
		attr_accessor :max_results
		attr_accessor :results_file_path
		attr_accessor :reference_time

		def max_results=(val)
			@max_results = val.to_i
		end
		def reference_time=(val)
			@reference_time = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['maxResults'] != nil
				self.max_results = xml_element.elements['maxResults'].text
			end
			if xml_element.elements['resultsFilePath'] != nil
				self.results_file_path = xml_element.elements['resultsFilePath'].text
			end
			if xml_element.elements['referenceTime'] != nil
				self.reference_time = xml_element.elements['referenceTime'].text
			end
		end

	end

	class KalturaScheduledTaskProfileBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :system_name_equal
		attr_accessor :system_name_in
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :last_execution_started_at_greater_than_or_equal
		attr_accessor :last_execution_started_at_less_than_or_equal

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end
		def created_at_greater_than_or_equal=(val)
			@created_at_greater_than_or_equal = val.to_i
		end
		def created_at_less_than_or_equal=(val)
			@created_at_less_than_or_equal = val.to_i
		end
		def updated_at_greater_than_or_equal=(val)
			@updated_at_greater_than_or_equal = val.to_i
		end
		def updated_at_less_than_or_equal=(val)
			@updated_at_less_than_or_equal = val.to_i
		end
		def last_execution_started_at_greater_than_or_equal=(val)
			@last_execution_started_at_greater_than_or_equal = val.to_i
		end
		def last_execution_started_at_less_than_or_equal=(val)
			@last_execution_started_at_less_than_or_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['partnerIdEqual'] != nil
				self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			end
			if xml_element.elements['partnerIdIn'] != nil
				self.partner_id_in = xml_element.elements['partnerIdIn'].text
			end
			if xml_element.elements['systemNameEqual'] != nil
				self.system_name_equal = xml_element.elements['systemNameEqual'].text
			end
			if xml_element.elements['systemNameIn'] != nil
				self.system_name_in = xml_element.elements['systemNameIn'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['createdAtGreaterThanOrEqual'] != nil
				self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['createdAtLessThanOrEqual'] != nil
				self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			end
			if xml_element.elements['updatedAtGreaterThanOrEqual'] != nil
				self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['updatedAtLessThanOrEqual'] != nil
				self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			end
			if xml_element.elements['lastExecutionStartedAtGreaterThanOrEqual'] != nil
				self.last_execution_started_at_greater_than_or_equal = xml_element.elements['lastExecutionStartedAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['lastExecutionStartedAtLessThanOrEqual'] != nil
				self.last_execution_started_at_less_than_or_equal = xml_element.elements['lastExecutionStartedAtLessThanOrEqual'].text
			end
		end

	end

	class KalturaScheduledTaskProfileListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaScheduledTaskProfile')
			end
		end

	end

	class KalturaStorageExportObjectTask < KalturaObjectTask
		# Storage profile id
		attr_accessor :storage_id


		def from_xml(xml_element)
			super
			if xml_element.elements['storageId'] != nil
				self.storage_id = xml_element.elements['storageId'].text
			end
		end

	end

	class KalturaScheduledTaskProfileFilter < KalturaScheduledTaskProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Schedule task service lets you create and manage scheduled task profiles
	class KalturaScheduledTaskProfileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add a new scheduled task profile
		# @return [KalturaScheduledTaskProfile]
		def add(scheduled_task_profile)
			kparams = {}
			client.add_param(kparams, 'scheduledTaskProfile', scheduled_task_profile)
			client.queue_service_action_call('scheduledtask_scheduledtaskprofile', 'add', 'KalturaScheduledTaskProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete a scheduled task profile
		# @return []
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('scheduledtask_scheduledtaskprofile', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a scheduled task profile by id
		# @return [KalturaScheduledTaskProfile]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('scheduledtask_scheduledtaskprofile', 'get', 'KalturaScheduledTaskProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return [KalturaObjectListResponse]
		def get_dry_run_results(request_id)
			kparams = {}
			client.add_param(kparams, 'requestId', request_id)
			client.queue_service_action_call('scheduledtask_scheduledtaskprofile', 'getDryRunResults', 'KalturaObjectListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List scheduled task profiles
		# @return [KalturaScheduledTaskProfileListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('scheduledtask_scheduledtaskprofile', 'list', 'KalturaScheduledTaskProfileListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return [int]
		def request_dry_run(scheduled_task_profile_id, max_results=500)
			kparams = {}
			client.add_param(kparams, 'scheduledTaskProfileId', scheduled_task_profile_id)
			client.add_param(kparams, 'maxResults', max_results)
			client.queue_service_action_call('scheduledtask_scheduledtaskprofile', 'requestDryRun', 'int', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing scheduled task profile
		# @return [KalturaScheduledTaskProfile]
		def update(id, scheduled_task_profile)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'scheduledTaskProfile', scheduled_task_profile)
			client.queue_service_action_call('scheduledtask_scheduledtaskprofile', 'update', 'KalturaScheduledTaskProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :scheduled_task_profile_service
		def scheduled_task_profile_service
			if (@scheduled_task_profile_service == nil)
				@scheduled_task_profile_service = KalturaScheduledTaskProfileService.new(self)
			end
			return @scheduled_task_profile_service
		end
		
	end

end
