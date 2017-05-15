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
require File.dirname(__FILE__) + '/kaltura_event_notification_client_plugin.rb'

module Kaltura

	class KalturaBusinessProcessAbortNotificationTemplateOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaBusinessProcessNotificationTemplateOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaBusinessProcessProvider
		ACTIVITI = "activitiBusinessProcessNotification.Activiti"
	end

	class KalturaBusinessProcessServerOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaBusinessProcessServerStatus
		DISABLED = "1"
		ENABLED = "2"
		DELETED = "3"
	end

	class KalturaBusinessProcessSignalNotificationTemplateOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaBusinessProcessStartNotificationTemplateOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaBusinessProcessCase < KalturaObjectBase
		attr_accessor :id
		attr_accessor :business_process_id
		attr_accessor :business_process_start_notification_template_id
		attr_accessor :suspended
		attr_accessor :activity_id

		def business_process_start_notification_template_id=(val)
			@business_process_start_notification_template_id = val.to_i
		end
		def suspended=(val)
			@suspended = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['businessProcessId'] != nil
				self.business_process_id = xml_element.elements['businessProcessId'].text
			end
			if xml_element.elements['businessProcessStartNotificationTemplateId'] != nil
				self.business_process_start_notification_template_id = xml_element.elements['businessProcessStartNotificationTemplateId'].text
			end
			if xml_element.elements['suspended'] != nil
				self.suspended = xml_element.elements['suspended'].text
			end
			if xml_element.elements['activityId'] != nil
				self.activity_id = xml_element.elements['activityId'].text
			end
		end

	end

	class KalturaBusinessProcessServer < KalturaObjectBase
		# Auto generated identifier
		attr_accessor :id
		# Server creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Server update date as Unix timestamp (In seconds)
		attr_accessor :updated_at
		attr_accessor :partner_id
		attr_accessor :name
		attr_accessor :system_name
		attr_accessor :description
		attr_accessor :status
		# The type of the server, this is auto filled by the derived server object
		attr_accessor :type
		# The dc of the server
		attr_accessor :dc

		def id=(val)
			@id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def dc=(val)
			@dc = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
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
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['dc'] != nil
				self.dc = xml_element.elements['dc'].text
			end
		end

	end

	class KalturaBusinessProcessNotificationTemplate < KalturaEventNotificationTemplate
		# Define the integrated BPM server id
		attr_accessor :server_id
		# Define the integrated BPM process id
		attr_accessor :process_id
		# Code to load the main triggering object
		attr_accessor :main_object_code

		def server_id=(val)
			@server_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['serverId'] != nil
				self.server_id = xml_element.elements['serverId'].text
			end
			if xml_element.elements['processId'] != nil
				self.process_id = xml_element.elements['processId'].text
			end
			if xml_element.elements['mainObjectCode'] != nil
				self.main_object_code = xml_element.elements['mainObjectCode'].text
			end
		end

	end

	class KalturaBusinessProcessServerBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :id_not_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :status_equal
		attr_accessor :status_not_equal
		attr_accessor :status_in
		attr_accessor :status_not_in
		attr_accessor :type_equal
		attr_accessor :type_in
		attr_accessor :dc_equal
		attr_accessor :dc_eq_or_null

		def id_equal=(val)
			@id_equal = val.to_i
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
		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
		end
		def dc_equal=(val)
			@dc_equal = val.to_i
		end
		def dc_eq_or_null=(val)
			@dc_eq_or_null = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['idNotIn'] != nil
				self.id_not_in = xml_element.elements['idNotIn'].text
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
			if xml_element.elements['partnerIdEqual'] != nil
				self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			end
			if xml_element.elements['partnerIdIn'] != nil
				self.partner_id_in = xml_element.elements['partnerIdIn'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusNotEqual'] != nil
				self.status_not_equal = xml_element.elements['statusNotEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['statusNotIn'] != nil
				self.status_not_in = xml_element.elements['statusNotIn'].text
			end
			if xml_element.elements['typeEqual'] != nil
				self.type_equal = xml_element.elements['typeEqual'].text
			end
			if xml_element.elements['typeIn'] != nil
				self.type_in = xml_element.elements['typeIn'].text
			end
			if xml_element.elements['dcEqual'] != nil
				self.dc_equal = xml_element.elements['dcEqual'].text
			end
			if xml_element.elements['dcEqOrNull'] != nil
				self.dc_eq_or_null = xml_element.elements['dcEqOrNull'].text
			end
		end

	end

	class KalturaBusinessProcessServerListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaBusinessProcessServer')
			end
		end

	end

	class KalturaBusinessProcessAbortNotificationTemplate < KalturaBusinessProcessNotificationTemplate


		def from_xml(xml_element)
			super
		end

	end

	class KalturaBusinessProcessNotificationDispatchJobData < KalturaEventNotificationDispatchJobData
		attr_accessor :server
		attr_accessor :case_id


		def from_xml(xml_element)
			super
			if xml_element.elements['server'] != nil
				self.server = KalturaClientBase.object_from_xml(xml_element.elements['server'], 'KalturaBusinessProcessServer')
			end
			if xml_element.elements['caseId'] != nil
				self.case_id = xml_element.elements['caseId'].text
			end
		end

	end

	class KalturaBusinessProcessServerFilter < KalturaBusinessProcessServerBaseFilter
		attr_accessor :current_dc_or_external
		attr_accessor :current_dc

		def current_dc_or_external=(val)
			@current_dc_or_external = val.to_i
		end
		def current_dc=(val)
			@current_dc = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['currentDcOrExternal'] != nil
				self.current_dc_or_external = xml_element.elements['currentDcOrExternal'].text
			end
			if xml_element.elements['currentDc'] != nil
				self.current_dc = xml_element.elements['currentDc'].text
			end
		end

	end

	class KalturaBusinessProcessSignalNotificationTemplate < KalturaBusinessProcessNotificationTemplate
		# Define the message to be sent
		attr_accessor :message
		# Define the event that waiting to the signal
		attr_accessor :event_id


		def from_xml(xml_element)
			super
			if xml_element.elements['message'] != nil
				self.message = xml_element.elements['message'].text
			end
			if xml_element.elements['eventId'] != nil
				self.event_id = xml_element.elements['eventId'].text
			end
		end

	end

	class KalturaBusinessProcessStartNotificationTemplate < KalturaBusinessProcessNotificationTemplate
		# Abort the process automatically if the triggering object deleted
		attr_accessor :abort_on_deletion

		def abort_on_deletion=(val)
			@abort_on_deletion = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['abortOnDeletion'] != nil
				self.abort_on_deletion = xml_element.elements['abortOnDeletion'].text
			end
		end

	end

	class KalturaBusinessProcessNotificationTemplateBaseFilter < KalturaEventNotificationTemplateFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaBusinessProcessNotificationTemplateFilter < KalturaBusinessProcessNotificationTemplateBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaBusinessProcessAbortNotificationTemplateBaseFilter < KalturaBusinessProcessNotificationTemplateFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaBusinessProcessSignalNotificationTemplateBaseFilter < KalturaBusinessProcessNotificationTemplateFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaBusinessProcessStartNotificationTemplateBaseFilter < KalturaBusinessProcessNotificationTemplateFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaBusinessProcessAbortNotificationTemplateFilter < KalturaBusinessProcessAbortNotificationTemplateBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaBusinessProcessSignalNotificationTemplateFilter < KalturaBusinessProcessSignalNotificationTemplateBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaBusinessProcessStartNotificationTemplateFilter < KalturaBusinessProcessStartNotificationTemplateBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Business-process case service lets you get information about processes
	class KalturaBusinessProcessCaseService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Abort business-process case
		# @return []
		def abort(object_type, object_id, business_process_start_notification_template_id)
			kparams = {}
			client.add_param(kparams, 'objectType', object_type)
			client.add_param(kparams, 'objectId', object_id)
			client.add_param(kparams, 'businessProcessStartNotificationTemplateId', business_process_start_notification_template_id)
			client.queue_service_action_call('businessprocessnotification_businessprocesscase', 'abort', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# list business-process cases
		# @return [array]
		def list(object_type, object_id)
			kparams = {}
			client.add_param(kparams, 'objectType', object_type)
			client.add_param(kparams, 'objectId', object_id)
			client.queue_service_action_call('businessprocessnotification_businessprocesscase', 'list', 'KalturaBusinessProcessCase', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Server business-process case diagram
		# @return [file]
		def serve_diagram(object_type, object_id, business_process_start_notification_template_id)
			kparams = {}
			client.add_param(kparams, 'objectType', object_type)
			client.add_param(kparams, 'objectId', object_id)
			client.add_param(kparams, 'businessProcessStartNotificationTemplateId', business_process_start_notification_template_id)
			client.queue_service_action_call('businessprocessnotification_businessprocesscase', 'serveDiagram', 'file', kparams)
			return client.get_serve_url()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :business_process_case_service
		def business_process_case_service
			if (@business_process_case_service == nil)
				@business_process_case_service = KalturaBusinessProcessCaseService.new(self)
			end
			return @business_process_case_service
		end
		
	end

end
