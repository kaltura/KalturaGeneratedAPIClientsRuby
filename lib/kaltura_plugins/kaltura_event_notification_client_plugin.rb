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

	class KalturaEventNotificationTemplateStatus
		DISABLED = 1
		ACTIVE = 2
		DELETED = 3
	end

	class KalturaEventNotificationEventObjectType
		AD_CUE_POINT = "adCuePointEventNotifications.AdCuePoint"
		ANNOTATION = "annotationEventNotifications.Annotation"
		ATTACHMENT_ASSET = "attachmentAssetEventNotifications.AttachmentAsset"
		CAPTION_ASSET = "captionAssetEventNotifications.CaptionAsset"
		CODE_CUE_POINT = "codeCuePointEventNotifications.CodeCuePoint"
		DISTRIBUTION_PROFILE = "contentDistributionEventNotifications.DistributionProfile"
		ENTRY_DISTRIBUTION = "contentDistributionEventNotifications.EntryDistribution"
		CUE_POINT = "cuePointEventNotifications.CuePoint"
		DROP_FOLDER = "dropFolderEventNotifications.DropFolder"
		DROP_FOLDER_FILE = "dropFolderEventNotifications.DropFolderFile"
		METADATA = "metadataEventNotifications.Metadata"
		TRANSCRIPT_ASSET = "transcriptAssetEventNotifications.TranscriptAsset"
		ENTRY = "1"
		CATEGORY = "2"
		ASSET = "3"
		FLAVORASSET = "4"
		THUMBASSET = "5"
		KUSER = "8"
		ACCESSCONTROL = "9"
		BATCHJOB = "10"
		BULKUPLOADRESULT = "11"
		CATEGORYKUSER = "12"
		CONVERSIONPROFILE2 = "14"
		FLAVORPARAMS = "15"
		FLAVORPARAMSCONVERSIONPROFILE = "16"
		FLAVORPARAMSOUTPUT = "17"
		GENERICSYNDICATIONFEED = "18"
		KUSERTOUSERROLE = "19"
		PARTNER = "20"
		PERMISSION = "21"
		PERMISSIONITEM = "22"
		PERMISSIONTOPERMISSIONITEM = "23"
		SCHEDULER = "24"
		SCHEDULERCONFIG = "25"
		SCHEDULERSTATUS = "26"
		SCHEDULERWORKER = "27"
		STORAGEPROFILE = "28"
		SYNDICATIONFEED = "29"
		THUMBPARAMS = "31"
		THUMBPARAMSOUTPUT = "32"
		UPLOADTOKEN = "33"
		USERLOGINDATA = "34"
		USERROLE = "35"
		WIDGET = "36"
		CATEGORYENTRY = "37"
	end

	class KalturaEventNotificationEventType
		INTEGRATION_JOB_CLOSED = "integrationEventNotifications.INTEGRATION_JOB_CLOSED"
		BATCH_JOB_STATUS = "1"
		OBJECT_ADDED = "2"
		OBJECT_CHANGED = "3"
		OBJECT_COPIED = "4"
		OBJECT_CREATED = "5"
		OBJECT_DATA_CHANGED = "6"
		OBJECT_DELETED = "7"
		OBJECT_ERASED = "8"
		OBJECT_READY_FOR_REPLACMENT = "9"
		OBJECT_SAVED = "10"
		OBJECT_UPDATED = "11"
		OBJECT_REPLACED = "12"
		OBJECT_READY_FOR_INDEX = "13"
	end

	class KalturaEventNotificationTemplateOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaEventNotificationTemplateType
		BPM_ABORT = "businessProcessNotification.BusinessProcessAbort"
		BPM_SIGNAL = "businessProcessNotification.BusinessProcessSignal"
		BPM_START = "businessProcessNotification.BusinessProcessStart"
		EMAIL = "emailNotification.Email"
		HTTP = "httpNotification.Http"
		PUSH = "pushNotification.Push"
	end

	class KalturaEventNotificationParameter < KalturaObjectBase
		# The key in the subject and body to be replaced with the dynamic value
		attr_accessor :key
		attr_accessor :description
		# The dynamic value to be placed in the final output
		attr_accessor :value


		def from_xml(xml_element)
			super
			if xml_element.elements['key'] != nil
				self.key = xml_element.elements['key'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['value'] != nil
				self.value = KalturaClientBase.object_from_xml(xml_element.elements['value'], 'KalturaStringValue')
			end
		end

	end

	class KalturaEventNotificationTemplate < KalturaObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :name
		attr_accessor :system_name
		attr_accessor :description
		attr_accessor :type
		attr_accessor :status
		attr_accessor :created_at
		attr_accessor :updated_at
		# Define that the template could be dispatched manually from the API
		attr_accessor :manual_dispatch_enabled
		# Define that the template could be dispatched automatically by the system
		attr_accessor :automatic_dispatch_enabled
		# Define the event that should trigger this notification
		attr_accessor :event_type
		# Define the object that raied the event that should trigger this notification
		attr_accessor :event_object_type
		# Define the conditions that cause this notification to be triggered
		attr_accessor :event_conditions
		# Define the content dynamic parameters
		attr_accessor :content_parameters
		# Define the content dynamic parameters
		attr_accessor :user_parameters

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
		def manual_dispatch_enabled=(val)
			@manual_dispatch_enabled = to_b(val)
		end
		def automatic_dispatch_enabled=(val)
			@automatic_dispatch_enabled = to_b(val)
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
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['manualDispatchEnabled'] != nil
				self.manual_dispatch_enabled = xml_element.elements['manualDispatchEnabled'].text
			end
			if xml_element.elements['automaticDispatchEnabled'] != nil
				self.automatic_dispatch_enabled = xml_element.elements['automaticDispatchEnabled'].text
			end
			if xml_element.elements['eventType'] != nil
				self.event_type = xml_element.elements['eventType'].text
			end
			if xml_element.elements['eventObjectType'] != nil
				self.event_object_type = xml_element.elements['eventObjectType'].text
			end
			if xml_element.elements['eventConditions'] != nil
				self.event_conditions = KalturaClientBase.object_from_xml(xml_element.elements['eventConditions'], 'KalturaCondition')
			end
			if xml_element.elements['contentParameters'] != nil
				self.content_parameters = KalturaClientBase.object_from_xml(xml_element.elements['contentParameters'], 'KalturaEventNotificationParameter')
			end
			if xml_element.elements['userParameters'] != nil
				self.user_parameters = KalturaClientBase.object_from_xml(xml_element.elements['userParameters'], 'KalturaEventNotificationParameter')
			end
		end

	end

	class KalturaEventFieldCondition < KalturaCondition
		# The field to be evaluated at runtime
		attr_accessor :field


		def from_xml(xml_element)
			super
			if xml_element.elements['field'] != nil
				self.field = KalturaClientBase.object_from_xml(xml_element.elements['field'], 'KalturaBooleanField')
			end
		end

	end

	class KalturaEventNotificationArrayParameter < KalturaEventNotificationParameter
		attr_accessor :values
		# Used to restrict the values to close list
		attr_accessor :allowed_values


		def from_xml(xml_element)
			super
			if xml_element.elements['values'] != nil
				self.values = KalturaClientBase.object_from_xml(xml_element.elements['values'], 'KalturaString')
			end
			if xml_element.elements['allowedValues'] != nil
				self.allowed_values = KalturaClientBase.object_from_xml(xml_element.elements['allowedValues'], 'KalturaStringValue')
			end
		end

	end

	class KalturaEventNotificationDispatchJobData < KalturaJobData
		attr_accessor :template_id
		# Define the content dynamic parameters
		attr_accessor :content_parameters

		def template_id=(val)
			@template_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['templateId'] != nil
				self.template_id = xml_element.elements['templateId'].text
			end
			if xml_element.elements['contentParameters'] != nil
				self.content_parameters = KalturaClientBase.object_from_xml(xml_element.elements['contentParameters'], 'KalturaKeyValue')
			end
		end

	end

	class KalturaEventNotificationScope < KalturaScope
		attr_accessor :object_id
		attr_accessor :scope_object_type


		def from_xml(xml_element)
			super
			if xml_element.elements['objectId'] != nil
				self.object_id = xml_element.elements['objectId'].text
			end
			if xml_element.elements['scopeObjectType'] != nil
				self.scope_object_type = xml_element.elements['scopeObjectType'].text
			end
		end

	end

	class KalturaEventNotificationTemplateBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :system_name_equal
		attr_accessor :system_name_in
		attr_accessor :type_equal
		attr_accessor :type_in
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal

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
			if xml_element.elements['typeEqual'] != nil
				self.type_equal = xml_element.elements['typeEqual'].text
			end
			if xml_element.elements['typeIn'] != nil
				self.type_in = xml_element.elements['typeIn'].text
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
		end

	end

	class KalturaEventNotificationTemplateListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaEventNotificationTemplate')
			end
		end

	end

	class KalturaEventObjectChangedCondition < KalturaCondition
		# Comma seperated column names to be tested
		attr_accessor :modified_columns


		def from_xml(xml_element)
			super
			if xml_element.elements['modifiedColumns'] != nil
				self.modified_columns = xml_element.elements['modifiedColumns'].text
			end
		end

	end

	class KalturaEventNotificationTemplateFilter < KalturaEventNotificationTemplateBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Event notification template service lets you create and manage event notification templates
	class KalturaEventNotificationTemplateService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# This action allows for the creation of new backend event types in the system. This action requires access to the Kaltura server Admin Console. If you're looking to register to existing event types, please use the clone action instead.
		# @return [KalturaEventNotificationTemplate]
		def add(event_notification_template)
			kparams = {}
			client.add_param(kparams, 'eventNotificationTemplate', event_notification_template)
			client.queue_service_action_call('eventnotification_eventnotificationtemplate', 'add', 'KalturaEventNotificationTemplate', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# This action allows registering to various backend event. Use this action to create notifications that will react to events such as new video was uploaded or metadata field was updated. To see the list of available event types, call the listTemplates action.
		# @return [KalturaEventNotificationTemplate]
		def clone(id, event_notification_template=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'eventNotificationTemplate', event_notification_template)
			client.queue_service_action_call('eventnotification_eventnotificationtemplate', 'clone', 'KalturaEventNotificationTemplate', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete an event notification template object
		# @return []
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('eventnotification_eventnotificationtemplate', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Dispatch event notification object by id
		# @return [int]
		def dispatch(id, scope)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'scope', scope)
			client.queue_service_action_call('eventnotification_eventnotificationtemplate', 'dispatch', 'int', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve an event notification template object by id
		# @return [KalturaEventNotificationTemplate]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('eventnotification_eventnotificationtemplate', 'get', 'KalturaEventNotificationTemplate', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# list event notification template objects
		# @return [KalturaEventNotificationTemplateListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('eventnotification_eventnotificationtemplate', 'list', 'KalturaEventNotificationTemplateListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return [KalturaEventNotificationTemplateListResponse]
		def list_by_partner(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('eventnotification_eventnotificationtemplate', 'listByPartner', 'KalturaEventNotificationTemplateListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Action lists the template partner event notification templates.
		# @return [KalturaEventNotificationTemplateListResponse]
		def list_templates(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('eventnotification_eventnotificationtemplate', 'listTemplates', 'KalturaEventNotificationTemplateListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Register to a queue from which event messages will be provided according to given template. Queue will be created if not already exists
		# @return [KalturaPushNotificationData]
		def register(notification_template_system_name, push_notification_params)
			kparams = {}
			client.add_param(kparams, 'notificationTemplateSystemName', notification_template_system_name)
			client.add_param(kparams, 'pushNotificationParams', push_notification_params)
			client.queue_service_action_call('eventnotification_eventnotificationtemplate', 'register', 'KalturaPushNotificationData', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Clear queue messages
		# @return []
		def send_command(notification_template_system_name, push_notification_params, command)
			kparams = {}
			client.add_param(kparams, 'notificationTemplateSystemName', notification_template_system_name)
			client.add_param(kparams, 'pushNotificationParams', push_notification_params)
			client.add_param(kparams, 'command', command)
			client.queue_service_action_call('eventnotification_eventnotificationtemplate', 'sendCommand', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing event notification template object
		# @return [KalturaEventNotificationTemplate]
		def update(id, event_notification_template)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'eventNotificationTemplate', event_notification_template)
			client.queue_service_action_call('eventnotification_eventnotificationtemplate', 'update', 'KalturaEventNotificationTemplate', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update event notification template status by id
		# @return [KalturaEventNotificationTemplate]
		def update_status(id, status)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'status', status)
			client.queue_service_action_call('eventnotification_eventnotificationtemplate', 'updateStatus', 'KalturaEventNotificationTemplate', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :event_notification_template_service
		def event_notification_template_service
			if (@event_notification_template_service == nil)
				@event_notification_template_service = KalturaEventNotificationTemplateService.new(self)
			end
			return @event_notification_template_service
		end
		
	end

end
