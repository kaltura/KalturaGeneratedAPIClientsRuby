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

module Kaltura

	class KalturaAuditTrailChangeXmlNodeType
		CHANGED = 1
		ADDED = 2
		REMOVED = 3
	end

	class KalturaAuditTrailContext
		CLIENT = -1
		SCRIPT = 0
		PS2 = 1
		API_V3 = 2
	end

	class KalturaAuditTrailFileSyncType
		FILE = 1
		LINK = 2
		URL = 3
	end

	class KalturaAuditTrailStatus
		PENDING = 1
		READY = 2
		FAILED = 3
	end

	class KalturaAuditTrailAction
		CHANGED = "CHANGED"
		CONTENT_VIEWED = "CONTENT_VIEWED"
		COPIED = "COPIED"
		CREATED = "CREATED"
		DELETED = "DELETED"
		FILE_SYNC_CREATED = "FILE_SYNC_CREATED"
		RELATION_ADDED = "RELATION_ADDED"
		RELATION_REMOVED = "RELATION_REMOVED"
		VIEWED = "VIEWED"
	end

	class KalturaAuditTrailObjectType
		BATCH_JOB = "BatchJob"
		EMAIL_INGESTION_PROFILE = "EmailIngestionProfile"
		FILE_SYNC = "FileSync"
		KSHOW_KUSER = "KshowKuser"
		METADATA = "Metadata"
		METADATA_PROFILE = "MetadataProfile"
		PARTNER = "Partner"
		PERMISSION = "Permission"
		REACH_PROFILE = "ReachProfile"
		UPLOAD_TOKEN = "UploadToken"
		USER_LOGIN_DATA = "UserLoginData"
		USER_ROLE = "UserRole"
		ACCESS_CONTROL = "accessControl"
		CATEGORY = "category"
		CATEGORY_ENTRY = "categoryEntry"
		CONVERSION_PROFILE_2 = "conversionProfile2"
		ENTRY = "entry"
		FLAVOR_ASSET = "flavorAsset"
		FLAVOR_PARAMS = "flavorParams"
		FLAVOR_PARAMS_CONVERSION_PROFILE = "flavorParamsConversionProfile"
		FLAVOR_PARAMS_OUTPUT = "flavorParamsOutput"
		KSHOW = "kshow"
		KUSER = "kuser"
		MEDIA_INFO = "mediaInfo"
		MODERATION = "moderation"
		ROUGHCUT = "roughcutEntry"
		SYNDICATION = "syndicationFeed"
		THUMBNAIL_ASSET = "thumbAsset"
		THUMBNAIL_PARAMS = "thumbParams"
		THUMBNAIL_PARAMS_OUTPUT = "thumbParamsOutput"
		UI_CONF = "uiConf"
		WIDGET = "widget"
	end

	class KalturaAuditTrailOrderBy
		CREATED_AT_ASC = "+createdAt"
		PARSED_AT_ASC = "+parsedAt"
		CREATED_AT_DESC = "-createdAt"
		PARSED_AT_DESC = "-parsedAt"
	end

	class KalturaAuditTrailInfo < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAuditTrail < KalturaObjectBase
		attr_accessor :id
		attr_accessor :created_at
		# Indicates when the data was parsed
		attr_accessor :parsed_at
		attr_accessor :status
		attr_accessor :audit_object_type
		attr_accessor :object_id
		attr_accessor :related_object_id
		attr_accessor :related_object_type
		attr_accessor :entry_id
		attr_accessor :master_partner_id
		attr_accessor :partner_id
		attr_accessor :request_id
		attr_accessor :user_id
		attr_accessor :action
		attr_accessor :data
		attr_accessor :ks
		attr_accessor :context
		# The API service and action that called and caused this audit
		attr_accessor :entry_point
		attr_accessor :server_name
		attr_accessor :ip_address
		attr_accessor :user_agent
		attr_accessor :client_tag
		attr_accessor :description
		attr_accessor :error_description

		def id=(val)
			@id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def parsed_at=(val)
			@parsed_at = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def master_partner_id=(val)
			@master_partner_id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def context=(val)
			@context = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['parsedAt'] != nil
				self.parsed_at = xml_element.elements['parsedAt'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['auditObjectType'] != nil
				self.audit_object_type = xml_element.elements['auditObjectType'].text
			end
			if xml_element.elements['objectId'] != nil
				self.object_id = xml_element.elements['objectId'].text
			end
			if xml_element.elements['relatedObjectId'] != nil
				self.related_object_id = xml_element.elements['relatedObjectId'].text
			end
			if xml_element.elements['relatedObjectType'] != nil
				self.related_object_type = xml_element.elements['relatedObjectType'].text
			end
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['masterPartnerId'] != nil
				self.master_partner_id = xml_element.elements['masterPartnerId'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['requestId'] != nil
				self.request_id = xml_element.elements['requestId'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['action'] != nil
				self.action = xml_element.elements['action'].text
			end
			if xml_element.elements['data'] != nil
				self.data = KalturaClientBase.object_from_xml(xml_element.elements['data'], 'KalturaAuditTrailInfo')
			end
			if xml_element.elements['ks'] != nil
				self.ks = xml_element.elements['ks'].text
			end
			if xml_element.elements['context'] != nil
				self.context = xml_element.elements['context'].text
			end
			if xml_element.elements['entryPoint'] != nil
				self.entry_point = xml_element.elements['entryPoint'].text
			end
			if xml_element.elements['serverName'] != nil
				self.server_name = xml_element.elements['serverName'].text
			end
			if xml_element.elements['ipAddress'] != nil
				self.ip_address = xml_element.elements['ipAddress'].text
			end
			if xml_element.elements['userAgent'] != nil
				self.user_agent = xml_element.elements['userAgent'].text
			end
			if xml_element.elements['clientTag'] != nil
				self.client_tag = xml_element.elements['clientTag'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['errorDescription'] != nil
				self.error_description = xml_element.elements['errorDescription'].text
			end
		end

	end

	class KalturaAuditTrailChangeItem < KalturaObjectBase
		attr_accessor :descriptor
		attr_accessor :old_value
		attr_accessor :new_value


		def from_xml(xml_element)
			super
			if xml_element.elements['descriptor'] != nil
				self.descriptor = xml_element.elements['descriptor'].text
			end
			if xml_element.elements['oldValue'] != nil
				self.old_value = xml_element.elements['oldValue'].text
			end
			if xml_element.elements['newValue'] != nil
				self.new_value = xml_element.elements['newValue'].text
			end
		end

	end

	class KalturaAuditTrailChangeInfo < KalturaAuditTrailInfo
		attr_accessor :changed_items


		def from_xml(xml_element)
			super
			if xml_element.elements['changedItems'] != nil
				self.changed_items = KalturaClientBase.object_from_xml(xml_element.elements['changedItems'], 'KalturaAuditTrailChangeItem')
			end
		end

	end

	class KalturaAuditTrailChangeXmlNode < KalturaAuditTrailChangeItem
		attr_accessor :type

		def type=(val)
			@type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
		end

	end

	class KalturaAuditTrailFileSyncCreateInfo < KalturaAuditTrailInfo
		attr_accessor :version
		attr_accessor :object_sub_type
		attr_accessor :dc
		attr_accessor :original
		attr_accessor :file_type

		def object_sub_type=(val)
			@object_sub_type = val.to_i
		end
		def dc=(val)
			@dc = val.to_i
		end
		def original=(val)
			@original = to_b(val)
		end
		def file_type=(val)
			@file_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['version'] != nil
				self.version = xml_element.elements['version'].text
			end
			if xml_element.elements['objectSubType'] != nil
				self.object_sub_type = xml_element.elements['objectSubType'].text
			end
			if xml_element.elements['dc'] != nil
				self.dc = xml_element.elements['dc'].text
			end
			if xml_element.elements['original'] != nil
				self.original = xml_element.elements['original'].text
			end
			if xml_element.elements['fileType'] != nil
				self.file_type = xml_element.elements['fileType'].text
			end
		end

	end

	class KalturaAuditTrailListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaAuditTrail')
			end
		end

	end

	class KalturaAuditTrailTextInfo < KalturaAuditTrailInfo
		attr_accessor :info


		def from_xml(xml_element)
			super
			if xml_element.elements['info'] != nil
				self.info = xml_element.elements['info'].text
			end
		end

	end

	class KalturaAuditTrailBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :parsed_at_greater_than_or_equal
		attr_accessor :parsed_at_less_than_or_equal
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :audit_object_type_equal
		attr_accessor :audit_object_type_in
		attr_accessor :object_id_equal
		attr_accessor :object_id_in
		attr_accessor :related_object_id_equal
		attr_accessor :related_object_id_in
		attr_accessor :related_object_type_equal
		attr_accessor :related_object_type_in
		attr_accessor :entry_id_equal
		attr_accessor :entry_id_in
		attr_accessor :master_partner_id_equal
		attr_accessor :master_partner_id_in
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :request_id_equal
		attr_accessor :request_id_in
		attr_accessor :user_id_equal
		attr_accessor :user_id_in
		attr_accessor :action_equal
		attr_accessor :action_in
		attr_accessor :ks_equal
		attr_accessor :context_equal
		attr_accessor :context_in
		attr_accessor :entry_point_equal
		attr_accessor :entry_point_in
		attr_accessor :server_name_equal
		attr_accessor :server_name_in
		attr_accessor :ip_address_equal
		attr_accessor :ip_address_in
		attr_accessor :client_tag_equal

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def created_at_greater_than_or_equal=(val)
			@created_at_greater_than_or_equal = val.to_i
		end
		def created_at_less_than_or_equal=(val)
			@created_at_less_than_or_equal = val.to_i
		end
		def parsed_at_greater_than_or_equal=(val)
			@parsed_at_greater_than_or_equal = val.to_i
		end
		def parsed_at_less_than_or_equal=(val)
			@parsed_at_less_than_or_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end
		def master_partner_id_equal=(val)
			@master_partner_id_equal = val.to_i
		end
		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
		end
		def context_equal=(val)
			@context_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['createdAtGreaterThanOrEqual'] != nil
				self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['createdAtLessThanOrEqual'] != nil
				self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			end
			if xml_element.elements['parsedAtGreaterThanOrEqual'] != nil
				self.parsed_at_greater_than_or_equal = xml_element.elements['parsedAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['parsedAtLessThanOrEqual'] != nil
				self.parsed_at_less_than_or_equal = xml_element.elements['parsedAtLessThanOrEqual'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['auditObjectTypeEqual'] != nil
				self.audit_object_type_equal = xml_element.elements['auditObjectTypeEqual'].text
			end
			if xml_element.elements['auditObjectTypeIn'] != nil
				self.audit_object_type_in = xml_element.elements['auditObjectTypeIn'].text
			end
			if xml_element.elements['objectIdEqual'] != nil
				self.object_id_equal = xml_element.elements['objectIdEqual'].text
			end
			if xml_element.elements['objectIdIn'] != nil
				self.object_id_in = xml_element.elements['objectIdIn'].text
			end
			if xml_element.elements['relatedObjectIdEqual'] != nil
				self.related_object_id_equal = xml_element.elements['relatedObjectIdEqual'].text
			end
			if xml_element.elements['relatedObjectIdIn'] != nil
				self.related_object_id_in = xml_element.elements['relatedObjectIdIn'].text
			end
			if xml_element.elements['relatedObjectTypeEqual'] != nil
				self.related_object_type_equal = xml_element.elements['relatedObjectTypeEqual'].text
			end
			if xml_element.elements['relatedObjectTypeIn'] != nil
				self.related_object_type_in = xml_element.elements['relatedObjectTypeIn'].text
			end
			if xml_element.elements['entryIdEqual'] != nil
				self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			end
			if xml_element.elements['entryIdIn'] != nil
				self.entry_id_in = xml_element.elements['entryIdIn'].text
			end
			if xml_element.elements['masterPartnerIdEqual'] != nil
				self.master_partner_id_equal = xml_element.elements['masterPartnerIdEqual'].text
			end
			if xml_element.elements['masterPartnerIdIn'] != nil
				self.master_partner_id_in = xml_element.elements['masterPartnerIdIn'].text
			end
			if xml_element.elements['partnerIdEqual'] != nil
				self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			end
			if xml_element.elements['partnerIdIn'] != nil
				self.partner_id_in = xml_element.elements['partnerIdIn'].text
			end
			if xml_element.elements['requestIdEqual'] != nil
				self.request_id_equal = xml_element.elements['requestIdEqual'].text
			end
			if xml_element.elements['requestIdIn'] != nil
				self.request_id_in = xml_element.elements['requestIdIn'].text
			end
			if xml_element.elements['userIdEqual'] != nil
				self.user_id_equal = xml_element.elements['userIdEqual'].text
			end
			if xml_element.elements['userIdIn'] != nil
				self.user_id_in = xml_element.elements['userIdIn'].text
			end
			if xml_element.elements['actionEqual'] != nil
				self.action_equal = xml_element.elements['actionEqual'].text
			end
			if xml_element.elements['actionIn'] != nil
				self.action_in = xml_element.elements['actionIn'].text
			end
			if xml_element.elements['ksEqual'] != nil
				self.ks_equal = xml_element.elements['ksEqual'].text
			end
			if xml_element.elements['contextEqual'] != nil
				self.context_equal = xml_element.elements['contextEqual'].text
			end
			if xml_element.elements['contextIn'] != nil
				self.context_in = xml_element.elements['contextIn'].text
			end
			if xml_element.elements['entryPointEqual'] != nil
				self.entry_point_equal = xml_element.elements['entryPointEqual'].text
			end
			if xml_element.elements['entryPointIn'] != nil
				self.entry_point_in = xml_element.elements['entryPointIn'].text
			end
			if xml_element.elements['serverNameEqual'] != nil
				self.server_name_equal = xml_element.elements['serverNameEqual'].text
			end
			if xml_element.elements['serverNameIn'] != nil
				self.server_name_in = xml_element.elements['serverNameIn'].text
			end
			if xml_element.elements['ipAddressEqual'] != nil
				self.ip_address_equal = xml_element.elements['ipAddressEqual'].text
			end
			if xml_element.elements['ipAddressIn'] != nil
				self.ip_address_in = xml_element.elements['ipAddressIn'].text
			end
			if xml_element.elements['clientTagEqual'] != nil
				self.client_tag_equal = xml_element.elements['clientTagEqual'].text
			end
		end

	end

	class KalturaAuditTrailFilter < KalturaAuditTrailBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# The Audit Trail service allows you to keep track of changes made to various Kaltura objects. 
	#  This service is disabled by default.
	class KalturaAuditTrailService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Allows you to add an audit trail object and audit trail content associated with Kaltura object
		# @return [KalturaAuditTrail]
		def add(audit_trail)
			kparams = {}
			client.add_param(kparams, 'auditTrail', audit_trail)
			client.queue_service_action_call('audit_audittrail', 'add', 'KalturaAuditTrail', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve an audit trail object by id
		# @return [KalturaAuditTrail]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('audit_audittrail', 'get', 'KalturaAuditTrail', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List audit trail objects by filter and pager
		# @return [KalturaAuditTrailListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('audit_audittrail', 'list', 'KalturaAuditTrailListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :audit_trail_service
		def audit_trail_service
			if (@audit_trail_service == nil)
				@audit_trail_service = KalturaAuditTrailService.new(self)
			end
			return @audit_trail_service
		end
		
	end

end
