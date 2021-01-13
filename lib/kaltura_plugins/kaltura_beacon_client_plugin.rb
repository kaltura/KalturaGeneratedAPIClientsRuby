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
# Copyright (C) 2006-2021  Kaltura Inc.
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
require File.dirname(__FILE__) + '/kaltura_elastic_search_client_plugin.rb'

module Kaltura

	class KalturaBeaconIndexType
		LOG = "Log"
		STATE = "State"
	end

	class KalturaBeaconObjectTypes
		SCHEDULE_RESOURCE_BEACON = "1"
		ENTRY_SERVER_NODE_BEACON = "2"
		SERVER_NODE_BEACON = "3"
		ENTRY_BEACON = "4"
	end

	class KalturaBeaconOrderBy
		OBJECT_ID_ASC = "+objectId"
		UPDATED_AT_ASC = "+updatedAt"
		OBJECT_ID_DESC = "-objectId"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaBeaconScheduledResourceFieldName
		EVENT_TYPE = "event_type"
		IS_LOG = "is_log"
		OBJECT_ID = "object_id"
		RECORDING = "recording"
		RESOURCE_NAME = "resource_name"
		STATUS = "status"
		UPDATED_AT = "updated_at"
	end

	class KalturaBeaconScheduledResourceOrderByFieldName
		STATUS = "app_status"
		RECORDING = "recording_phase"
		RESOURCE_NAME = "resource_Name"
		UPDATED_AT = "updated_at"
	end

	class KalturaBeacon < KalturaObjectBase
		# Beacon id
		attr_accessor :id
		# Beacon indexType
		attr_accessor :index_type
		# Beacon update date as Unix timestamp (In seconds)
		attr_accessor :updated_at
		# The object which this beacon belongs to
		attr_accessor :related_object_type
		attr_accessor :event_type
		attr_accessor :object_id
		attr_accessor :private_data
		attr_accessor :raw_data

		def updated_at=(val)
			@updated_at = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['indexType'] != nil
				self.index_type = xml_element.elements['indexType'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['relatedObjectType'] != nil
				self.related_object_type = xml_element.elements['relatedObjectType'].text
			end
			if xml_element.elements['eventType'] != nil
				self.event_type = xml_element.elements['eventType'].text
			end
			if xml_element.elements['objectId'] != nil
				self.object_id = xml_element.elements['objectId'].text
			end
			if xml_element.elements['privateData'] != nil
				self.private_data = xml_element.elements['privateData'].text
			end
			if xml_element.elements['rawData'] != nil
				self.raw_data = xml_element.elements['rawData'].text
			end
		end

	end

	class KalturaBeaconSearchParams < KalturaObjectBase
		attr_accessor :object_id


		def from_xml(xml_element)
			super
			if xml_element.elements['objectId'] != nil
				self.object_id = xml_element.elements['objectId'].text
			end
		end

	end

	class KalturaBeaconSearchScheduledResourceOrderByItem < KalturaESearchOrderByItem
		attr_accessor :sort_field


		def from_xml(xml_element)
			super
			if xml_element.elements['sortField'] != nil
				self.sort_field = xml_element.elements['sortField'].text
			end
		end

	end

	class KalturaBeaconSearchScheduledResourceOrderBy < KalturaObjectBase
		attr_accessor :order_items


		def from_xml(xml_element)
			super
			if xml_element.elements['orderItems'] != nil
				self.order_items = KalturaClientBase.object_from_xml(xml_element.elements['orderItems'], 'KalturaBeaconSearchScheduledResourceOrderByItem')
			end
		end

	end

	class KalturaBeaconBaseFilter < KalturaFilter
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :related_object_type_in
		attr_accessor :related_object_type_equal
		attr_accessor :event_type_in
		attr_accessor :object_id_in

		def updated_at_greater_than_or_equal=(val)
			@updated_at_greater_than_or_equal = val.to_i
		end
		def updated_at_less_than_or_equal=(val)
			@updated_at_less_than_or_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['updatedAtGreaterThanOrEqual'] != nil
				self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['updatedAtLessThanOrEqual'] != nil
				self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			end
			if xml_element.elements['relatedObjectTypeIn'] != nil
				self.related_object_type_in = xml_element.elements['relatedObjectTypeIn'].text
			end
			if xml_element.elements['relatedObjectTypeEqual'] != nil
				self.related_object_type_equal = xml_element.elements['relatedObjectTypeEqual'].text
			end
			if xml_element.elements['eventTypeIn'] != nil
				self.event_type_in = xml_element.elements['eventTypeIn'].text
			end
			if xml_element.elements['objectIdIn'] != nil
				self.object_id_in = xml_element.elements['objectIdIn'].text
			end
		end

	end

	class KalturaBeaconEnhanceFilter < KalturaFilter
		attr_accessor :external_elastic_query_object
		attr_accessor :index_type_equal


		def from_xml(xml_element)
			super
			if xml_element.elements['externalElasticQueryObject'] != nil
				self.external_elastic_query_object = xml_element.elements['externalElasticQueryObject'].text
			end
			if xml_element.elements['indexTypeEqual'] != nil
				self.index_type_equal = xml_element.elements['indexTypeEqual'].text
			end
		end

	end

	class KalturaBeaconListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaBeacon')
			end
		end

	end

	class KalturaBeaconScheduledResourceOperator < KalturaBeaconScheduledResourceBaseItem
		attr_accessor :operator
		attr_accessor :search_items

		def operator=(val)
			@operator = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['operator'] != nil
				self.operator = xml_element.elements['operator'].text
			end
			if xml_element.elements['searchItems'] != nil
				self.search_items = KalturaClientBase.object_from_xml(xml_element.elements['searchItems'], 'KalturaBeaconScheduledResourceBaseItem')
			end
		end

	end

	class KalturaBeaconScheduledResourceSearchParams < KalturaBeaconSearchParams
		attr_accessor :search_operator
		attr_accessor :order_by


		def from_xml(xml_element)
			super
			if xml_element.elements['searchOperator'] != nil
				self.search_operator = KalturaClientBase.object_from_xml(xml_element.elements['searchOperator'], 'KalturaBeaconScheduledResourceOperator')
			end
			if xml_element.elements['orderBy'] != nil
				self.order_by = KalturaClientBase.object_from_xml(xml_element.elements['orderBy'], 'KalturaBeaconSearchScheduledResourceOrderBy')
			end
		end

	end

	class KalturaBeaconFilter < KalturaBeaconBaseFilter
		attr_accessor :index_type_equal


		def from_xml(xml_element)
			super
			if xml_element.elements['indexTypeEqual'] != nil
				self.index_type_equal = xml_element.elements['indexTypeEqual'].text
			end
		end

	end

	class KalturaBeaconScheduledResourceItem < KalturaBeaconAbstractScheduledResourceItem
		attr_accessor :field_name


		def from_xml(xml_element)
			super
			if xml_element.elements['fieldName'] != nil
				self.field_name = xml_element.elements['fieldName'].text
			end
		end

	end


	# Sending beacons on objects
	class KalturaBeaconService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# @return [bool]
		def add(beacon, should_log=0)
			kparams = {}
			client.add_param(kparams, 'beacon', beacon)
			client.add_param(kparams, 'shouldLog', should_log)
			client.queue_service_action_call('beacon_beacon', 'add', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return [KalturaBeaconListResponse]
		def enhance_search(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('beacon_beacon', 'enhanceSearch', 'KalturaBeaconListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return [KalturaBeaconListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('beacon_beacon', 'list', 'KalturaBeaconListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return [KalturaBeaconListResponse]
		def search_scheduled_resource(search_params, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'searchParams', search_params)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('beacon_beacon', 'searchScheduledResource', 'KalturaBeaconListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :beacon_service
		def beacon_service
			if (@beacon_service == nil)
				@beacon_service = KalturaBeaconService.new(self)
			end
			return @beacon_service
		end
		
	end

end
