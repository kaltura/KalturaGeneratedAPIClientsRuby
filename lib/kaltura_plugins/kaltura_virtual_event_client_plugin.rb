# ===================================================================================================
#                           _  __     _ _
#                          | |/ /__ _| | |_ _  _ _ _ __ _
#                          | ' </ _` | |  _| || | '_/ _` |
#                          |_|\_\__,_|_|\__|\_,_|_| \__,_|
#
# This file is part of the Kaltura Collaborative Media Suite which allows users
# to do with audio, video, and animation what Wiki platforms allow them to do with
# text.
#
# Copyright (C) 2006-2023  Kaltura Inc.
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
require File.dirname(__FILE__) + '/kaltura_schedule_client_plugin.rb'

module Kaltura

	class KalturaVirtualEventStatus
		ACTIVE = 2
		DELETED = 3
	end

	class KalturaVirtualScheduleEventSubType
		AGENDA = 1
		REGISTRATION = 2
		MAIN_EVENT = 3
	end

	class KalturaVirtualEventOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaVirtualEvent < KalturaObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :name
		attr_accessor :description
		attr_accessor :status
		attr_accessor :tags
		attr_accessor :attendees_group_ids
		attr_accessor :admins_group_ids
		attr_accessor :registration_schedule_event_id
		attr_accessor :agenda_schedule_event_id
		attr_accessor :main_event_schedule_event_id
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :deletion_due_date
		# JSON-Schema of the Registration Form
		attr_accessor :registration_form_schema

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def registration_schedule_event_id=(val)
			@registration_schedule_event_id = val.to_i
		end
		def agenda_schedule_event_id=(val)
			@agenda_schedule_event_id = val.to_i
		end
		def main_event_schedule_event_id=(val)
			@main_event_schedule_event_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def deletion_due_date=(val)
			@deletion_due_date = val.to_i
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
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['attendeesGroupIds'] != nil
				self.attendees_group_ids = xml_element.elements['attendeesGroupIds'].text
			end
			if xml_element.elements['adminsGroupIds'] != nil
				self.admins_group_ids = xml_element.elements['adminsGroupIds'].text
			end
			if xml_element.elements['registrationScheduleEventId'] != nil
				self.registration_schedule_event_id = xml_element.elements['registrationScheduleEventId'].text
			end
			if xml_element.elements['agendaScheduleEventId'] != nil
				self.agenda_schedule_event_id = xml_element.elements['agendaScheduleEventId'].text
			end
			if xml_element.elements['mainEventScheduleEventId'] != nil
				self.main_event_schedule_event_id = xml_element.elements['mainEventScheduleEventId'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['deletionDueDate'] != nil
				self.deletion_due_date = xml_element.elements['deletionDueDate'].text
			end
			if xml_element.elements['registrationFormSchema'] != nil
				self.registration_form_schema = xml_element.elements['registrationFormSchema'].text
			end
		end

	end

	class KalturaVirtualEventBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :id_not_in
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
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
			if xml_element.elements['idNotIn'] != nil
				self.id_not_in = xml_element.elements['idNotIn'].text
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

	class KalturaVirtualEventListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaVirtualEvent')
			end
		end

	end

	class KalturaVirtualScheduleEvent < KalturaScheduleEvent
		# The ID of the virtual event connected to this Schedule Event
		attr_accessor :virtual_event_id
		# The type of the Virtual Schedule Event
		attr_accessor :virtual_schedule_event_sub_type

		def virtual_event_id=(val)
			@virtual_event_id = val.to_i
		end
		def virtual_schedule_event_sub_type=(val)
			@virtual_schedule_event_sub_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['virtualEventId'] != nil
				self.virtual_event_id = xml_element.elements['virtualEventId'].text
			end
			if xml_element.elements['virtualScheduleEventSubType'] != nil
				self.virtual_schedule_event_sub_type = xml_element.elements['virtualScheduleEventSubType'].text
			end
		end

	end

	class KalturaVirtualEventFilter < KalturaVirtualEventBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaVirtualScheduleEventBaseFilter < KalturaScheduleEventFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaVirtualScheduleEventFilter < KalturaVirtualScheduleEventBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	class KalturaVirtualEventService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add a new virtual event
		# @return [KalturaVirtualEvent]
		def add(virtual_event)
			kparams = {}
			client.add_param(kparams, 'virtualEvent', virtual_event)
			client.queue_service_action_call('virtualevent_virtualevent', 'add', 'KalturaVirtualEvent', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete a virtual event
		# @return []
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('virtualevent_virtualevent', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a virtual event by id
		# @return [KalturaVirtualEvent]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('virtualevent_virtualevent', 'get', 'KalturaVirtualEvent', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List virtual events
		# @return [KalturaVirtualEventListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('virtualevent_virtualevent', 'list', 'KalturaVirtualEventListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing virtual event
		# @return [KalturaVirtualEvent]
		def update(id, virtual_event)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'virtualEvent', virtual_event)
			client.queue_service_action_call('virtualevent_virtualevent', 'update', 'KalturaVirtualEvent', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :virtual_event_service
		def virtual_event_service
			if (@virtual_event_service == nil)
				@virtual_event_service = KalturaVirtualEventService.new(self)
			end
			return @virtual_event_service
		end
		
	end

end
