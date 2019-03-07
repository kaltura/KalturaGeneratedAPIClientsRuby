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
# Copyright (C) 2006-2019  Kaltura Inc.
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
require 'kaltura_enums.rb'

module Kaltura

	class KalturaListResponse < KalturaObjectBase
		attr_accessor :total_count

		def total_count=(val)
			@total_count = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['totalCount'] != nil
				self.total_count = xml_element.elements['totalCount'].text
			end
		end

	end

	class KalturaBaseRestriction < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAccessControl < KalturaObjectBase
		# The id of the Access Control Profile
		attr_accessor :id
		attr_accessor :partner_id
		# The name of the Access Control Profile
		attr_accessor :name
		# System name of the Access Control Profile
		attr_accessor :system_name
		# The description of the Access Control Profile
		attr_accessor :description
		# Creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# True if this Conversion Profile is the default
		attr_accessor :is_default
		# Array of Access Control Restrictions
		attr_accessor :restrictions
		# Indicates that the access control profile is new and should be handled using KalturaAccessControlProfile object and accessControlProfile service
		attr_accessor :contains_unsuported_restrictions

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def is_default=(val)
			@is_default = val.to_i
		end
		def contains_unsuported_restrictions=(val)
			@contains_unsuported_restrictions = to_b(val)
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
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['isDefault'] != nil
				self.is_default = xml_element.elements['isDefault'].text
			end
			if xml_element.elements['restrictions'] != nil
				self.restrictions = KalturaClientBase.object_from_xml(xml_element.elements['restrictions'], 'KalturaBaseRestriction')
			end
			if xml_element.elements['containsUnsuportedRestrictions'] != nil
				self.contains_unsuported_restrictions = xml_element.elements['containsUnsuportedRestrictions'].text
			end
		end

	end

	class KalturaContextTypeHolder < KalturaObjectBase
		# The type of the condition context
		attr_accessor :type


		def from_xml(xml_element)
			super
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
		end

	end

	class KalturaAccessControlContextTypeHolder < KalturaContextTypeHolder


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAccessControlMessage < KalturaObjectBase
		attr_accessor :message
		attr_accessor :code


		def from_xml(xml_element)
			super
			if xml_element.elements['message'] != nil
				self.message = xml_element.elements['message'].text
			end
			if xml_element.elements['code'] != nil
				self.code = xml_element.elements['code'].text
			end
		end

	end

	class KalturaRuleAction < KalturaObjectBase
		# The type of the action
		attr_accessor :type


		def from_xml(xml_element)
			super
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
		end

	end

	class KalturaCondition < KalturaObjectBase
		# The type of the access control condition
		attr_accessor :type
		attr_accessor :description
		attr_accessor :not

		def not=(val)
			@not = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['not'] != nil
				self.not = xml_element.elements['not'].text
			end
		end

	end

	class KalturaRule < KalturaObjectBase
		# Short Rule Description
		attr_accessor :description
		# Rule Custom Data to allow saving rule specific information
		attr_accessor :rule_data
		# Message to be thrown to the player in case the rule is fulfilled
		attr_accessor :message
		# Code to be thrown to the player in case the rule is fulfilled
		attr_accessor :code
		# Actions to be performed by the player in case the rule is fulfilled
		attr_accessor :actions
		# Conditions to validate the rule
		attr_accessor :conditions
		# Indicates what contexts should be tested by this rule
		attr_accessor :contexts
		# Indicates that this rule is enough and no need to continue checking the rest of the rules
		attr_accessor :stop_processing
		# Indicates if we should force ks validation for admin ks users as well
		attr_accessor :force_admin_validation

		def stop_processing=(val)
			@stop_processing = to_b(val)
		end
		def force_admin_validation=(val)
			@force_admin_validation = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['ruleData'] != nil
				self.rule_data = xml_element.elements['ruleData'].text
			end
			if xml_element.elements['message'] != nil
				self.message = xml_element.elements['message'].text
			end
			if xml_element.elements['code'] != nil
				self.code = xml_element.elements['code'].text
			end
			if xml_element.elements['actions'] != nil
				self.actions = KalturaClientBase.object_from_xml(xml_element.elements['actions'], 'KalturaRuleAction')
			end
			if xml_element.elements['conditions'] != nil
				self.conditions = KalturaClientBase.object_from_xml(xml_element.elements['conditions'], 'KalturaCondition')
			end
			if xml_element.elements['contexts'] != nil
				self.contexts = KalturaClientBase.object_from_xml(xml_element.elements['contexts'], 'KalturaContextTypeHolder')
			end
			if xml_element.elements['stopProcessing'] != nil
				self.stop_processing = xml_element.elements['stopProcessing'].text
			end
			if xml_element.elements['forceAdminValidation'] != nil
				self.force_admin_validation = xml_element.elements['forceAdminValidation'].text
			end
		end

	end

	class KalturaAccessControlProfile < KalturaObjectBase
		# The id of the Access Control Profile
		attr_accessor :id
		attr_accessor :partner_id
		# The name of the Access Control Profile
		attr_accessor :name
		# System name of the Access Control Profile
		attr_accessor :system_name
		# The description of the Access Control Profile
		attr_accessor :description
		# Creation time as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Update time as Unix timestamp (In seconds)
		attr_accessor :updated_at
		# True if this access control profile is the partner default
		attr_accessor :is_default
		# Array of access control rules
		attr_accessor :rules

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def is_default=(val)
			@is_default = val.to_i
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
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['isDefault'] != nil
				self.is_default = xml_element.elements['isDefault'].text
			end
			if xml_element.elements['rules'] != nil
				self.rules = KalturaClientBase.object_from_xml(xml_element.elements['rules'], 'KalturaRule')
			end
		end

	end

	# A key value pair representation to return an array of key-value pairs (associative array)
	class KalturaKeyValue < KalturaObjectBase
		attr_accessor :key
		attr_accessor :value


		def from_xml(xml_element)
			super
			if xml_element.elements['key'] != nil
				self.key = xml_element.elements['key'].text
			end
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	class KalturaAccessControlScope < KalturaObjectBase
		# URL to be used to test domain conditions.
		attr_accessor :referrer
		# IP to be used to test geographic location conditions.
		attr_accessor :ip
		# Kaltura session to be used to test session and user conditions.
		attr_accessor :ks
		# Browser or client application to be used to test agent conditions.
		attr_accessor :user_agent
		# Unix timestamp (In seconds) to be used to test entry scheduling, keep null to use now.
		attr_accessor :time
		# Indicates what contexts should be tested. No contexts means any context.
		attr_accessor :contexts
		# Array of hashes to pass to the access control profile scope
		attr_accessor :hashes

		def time=(val)
			@time = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['referrer'] != nil
				self.referrer = xml_element.elements['referrer'].text
			end
			if xml_element.elements['ip'] != nil
				self.ip = xml_element.elements['ip'].text
			end
			if xml_element.elements['ks'] != nil
				self.ks = xml_element.elements['ks'].text
			end
			if xml_element.elements['userAgent'] != nil
				self.user_agent = xml_element.elements['userAgent'].text
			end
			if xml_element.elements['time'] != nil
				self.time = xml_element.elements['time'].text
			end
			if xml_element.elements['contexts'] != nil
				self.contexts = KalturaClientBase.object_from_xml(xml_element.elements['contexts'], 'KalturaAccessControlContextTypeHolder')
			end
			if xml_element.elements['hashes'] != nil
				self.hashes = KalturaClientBase.object_from_xml(xml_element.elements['hashes'], 'KalturaKeyValue')
			end
		end

	end

	class KalturaReportFilter < KalturaObjectBase
		# The dimension whose values should be filtered
		attr_accessor :dimension
		# The (comma separated) values to include in the filter
		attr_accessor :values


		def from_xml(xml_element)
			super
			if xml_element.elements['dimension'] != nil
				self.dimension = xml_element.elements['dimension'].text
			end
			if xml_element.elements['values'] != nil
				self.values = xml_element.elements['values'].text
			end
		end

	end

	class KalturaAnalyticsFilter < KalturaObjectBase
		# Query start time (in local time) MM/dd/yyyy HH:mi
		attr_accessor :from_time
		# Query end time (in local time) MM/dd/yyyy HH:mi
		attr_accessor :to_time
		# Comma separated metrics list
		attr_accessor :metrics
		# Timezone offset from UTC (in minutes)
		attr_accessor :utc_offset
		# Comma separated dimensions list
		attr_accessor :dimensions
		# Array of filters
		attr_accessor :filters
		# Query order by metric/dimension
		attr_accessor :order_by

		def utc_offset=(val)
			@utc_offset = val.to_f
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['from_time'] != nil
				self.from_time = xml_element.elements['from_time'].text
			end
			if xml_element.elements['to_time'] != nil
				self.to_time = xml_element.elements['to_time'].text
			end
			if xml_element.elements['metrics'] != nil
				self.metrics = xml_element.elements['metrics'].text
			end
			if xml_element.elements['utcOffset'] != nil
				self.utc_offset = xml_element.elements['utcOffset'].text
			end
			if xml_element.elements['dimensions'] != nil
				self.dimensions = xml_element.elements['dimensions'].text
			end
			if xml_element.elements['filters'] != nil
				self.filters = KalturaClientBase.object_from_xml(xml_element.elements['filters'], 'KalturaReportFilter')
			end
			if xml_element.elements['orderBy'] != nil
				self.order_by = xml_element.elements['orderBy'].text
			end
		end

	end

	class KalturaApiExceptionArg < KalturaObjectBase
		attr_accessor :name
		attr_accessor :value


		def from_xml(xml_element)
			super
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	class KalturaAppToken < KalturaObjectBase
		# The id of the application token
		attr_accessor :id
		# The application token
		attr_accessor :token
		attr_accessor :partner_id
		# Creation time as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Update time as Unix timestamp (In seconds)
		attr_accessor :updated_at
		# Application token status
		attr_accessor :status
		# Expiry time of current token (unix timestamp in seconds)
		attr_accessor :expiry
		# Type of KS (Kaltura Session) that created using the current token
		attr_accessor :session_type
		# User id of KS (Kaltura Session) that created using the current token
		attr_accessor :session_user_id
		# Expiry duration of KS (Kaltura Session) that created using the current token (in seconds)
		attr_accessor :session_duration
		# Comma separated privileges to be applied on KS (Kaltura Session) that created using the current token
		attr_accessor :session_privileges
		attr_accessor :hash_type
		attr_accessor :description

		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def expiry=(val)
			@expiry = val.to_i
		end
		def session_type=(val)
			@session_type = val.to_i
		end
		def session_duration=(val)
			@session_duration = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['token'] != nil
				self.token = xml_element.elements['token'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['expiry'] != nil
				self.expiry = xml_element.elements['expiry'].text
			end
			if xml_element.elements['sessionType'] != nil
				self.session_type = xml_element.elements['sessionType'].text
			end
			if xml_element.elements['sessionUserId'] != nil
				self.session_user_id = xml_element.elements['sessionUserId'].text
			end
			if xml_element.elements['sessionDuration'] != nil
				self.session_duration = xml_element.elements['sessionDuration'].text
			end
			if xml_element.elements['sessionPrivileges'] != nil
				self.session_privileges = xml_element.elements['sessionPrivileges'].text
			end
			if xml_element.elements['hashType'] != nil
				self.hash_type = xml_element.elements['hashType'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
		end

	end

	class KalturaAsset < KalturaObjectBase
		# The ID of the Flavor Asset
		attr_accessor :id
		# The entry ID of the Flavor Asset
		attr_accessor :entry_id
		attr_accessor :partner_id
		# The version of the Flavor Asset
		attr_accessor :version
		# The size (in KBytes) of the Flavor Asset
		attr_accessor :size
		# Tags used to identify the Flavor Asset in various scenarios
		attr_accessor :tags
		# The file extension
		attr_accessor :file_ext
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :deleted_at
		# System description, error message, warnings and failure cause.
		attr_accessor :description
		# Partner private data
		attr_accessor :partner_data
		# Partner friendly description
		attr_accessor :partner_description
		# Comma separated list of source flavor params ids
		attr_accessor :actual_source_asset_params_ids

		def partner_id=(val)
			@partner_id = val.to_i
		end
		def version=(val)
			@version = val.to_i
		end
		def size=(val)
			@size = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def deleted_at=(val)
			@deleted_at = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['version'] != nil
				self.version = xml_element.elements['version'].text
			end
			if xml_element.elements['size'] != nil
				self.size = xml_element.elements['size'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['fileExt'] != nil
				self.file_ext = xml_element.elements['fileExt'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['deletedAt'] != nil
				self.deleted_at = xml_element.elements['deletedAt'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['partnerData'] != nil
				self.partner_data = xml_element.elements['partnerData'].text
			end
			if xml_element.elements['partnerDescription'] != nil
				self.partner_description = xml_element.elements['partnerDescription'].text
			end
			if xml_element.elements['actualSourceAssetParamsIds'] != nil
				self.actual_source_asset_params_ids = xml_element.elements['actualSourceAssetParamsIds'].text
			end
		end

	end

	# A string representation to return an array of strings
	class KalturaString < KalturaObjectBase
		attr_accessor :value


		def from_xml(xml_element)
			super
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	class KalturaAssetParams < KalturaObjectBase
		# The id of the Flavor Params
		attr_accessor :id
		attr_accessor :partner_id
		# The name of the Flavor Params
		attr_accessor :name
		# System name of the Flavor Params
		attr_accessor :system_name
		# The description of the Flavor Params
		attr_accessor :description
		# Creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# True if those Flavor Params are part of system defaults
		attr_accessor :is_system_default
		# The Flavor Params tags are used to identify the flavor for different usage (e.g. web, hd, mobile)
		attr_accessor :tags
		# Array of partner permisison names that required for using this asset params
		attr_accessor :required_permissions
		# Id of remote storage profile that used to get the source, zero indicates Kaltura data center
		attr_accessor :source_remote_storage_profile_id
		# Comma seperated ids of remote storage profiles that the flavor distributed to, the distribution done by the conversion engine
		attr_accessor :remote_storage_profile_ids
		# Media parser type to be used for post-conversion validation
		attr_accessor :media_parser_type
		# Comma seperated ids of source flavor params this flavor is created from
		attr_accessor :source_asset_params_ids

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def is_system_default=(val)
			@is_system_default = val.to_i
		end
		def source_remote_storage_profile_id=(val)
			@source_remote_storage_profile_id = val.to_i
		end
		def remote_storage_profile_ids=(val)
			@remote_storage_profile_ids = val.to_i
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
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['isSystemDefault'] != nil
				self.is_system_default = xml_element.elements['isSystemDefault'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['requiredPermissions'] != nil
				self.required_permissions = KalturaClientBase.object_from_xml(xml_element.elements['requiredPermissions'], 'KalturaString')
			end
			if xml_element.elements['sourceRemoteStorageProfileId'] != nil
				self.source_remote_storage_profile_id = xml_element.elements['sourceRemoteStorageProfileId'].text
			end
			if xml_element.elements['remoteStorageProfileIds'] != nil
				self.remote_storage_profile_ids = xml_element.elements['remoteStorageProfileIds'].text
			end
			if xml_element.elements['mediaParserType'] != nil
				self.media_parser_type = xml_element.elements['mediaParserType'].text
			end
			if xml_element.elements['sourceAssetParamsIds'] != nil
				self.source_asset_params_ids = xml_element.elements['sourceAssetParamsIds'].text
			end
		end

	end

	# Used to ingest entry object, as single resource or list of resources accompanied by asset params ids.
	class KalturaResource < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	# Is a unified way to add content to Kaltura whether it's an uploaded file, webcam recording, imported URL or existing file sync.
	class KalturaContentResource < KalturaResource


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAssetParamsResourceContainer < KalturaResource
		# The content resource to associate with asset params
		attr_accessor :resource
		# The asset params to associate with the reaource
		attr_accessor :asset_params_id

		def asset_params_id=(val)
			@asset_params_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['resource'] != nil
				self.resource = KalturaClientBase.object_from_xml(xml_element.elements['resource'], 'KalturaContentResource')
			end
			if xml_element.elements['assetParamsId'] != nil
				self.asset_params_id = xml_element.elements['assetParamsId'].text
			end
		end

	end

	class KalturaAssetServeOptions < KalturaObjectBase
		attr_accessor :download
		attr_accessor :referrer

		def download=(val)
			@download = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['download'] != nil
				self.download = xml_element.elements['download'].text
			end
			if xml_element.elements['referrer'] != nil
				self.referrer = xml_element.elements['referrer'].text
			end
		end

	end

	# Base class to all operation attributes types
	class KalturaOperationAttributes < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	class KalturaBaseEntry < KalturaObjectBase
		# Auto generated 10 characters alphanumeric string
		attr_accessor :id
		# Entry name (Min 1 chars)
		attr_accessor :name
		# Entry description
		attr_accessor :description
		attr_accessor :partner_id
		# The ID of the user who is the owner of this entry
		attr_accessor :user_id
		# The ID of the user who created this entry
		attr_accessor :creator_id
		# Entry tags
		attr_accessor :tags
		# Entry admin tags can be updated only by administrators
		attr_accessor :admin_tags
		# Comma separated list of full names of categories to which this entry belongs. Only categories that don't have entitlement (privacy context) are listed, to retrieve the full list of categories, use the categoryEntry.list action.
		attr_accessor :categories
		# Comma separated list of ids of categories to which this entry belongs. Only categories that don't have entitlement (privacy context) are listed, to retrieve the full list of categories, use the categoryEntry.list action.
		attr_accessor :categories_ids
		attr_accessor :status
		# Entry moderation status
		attr_accessor :moderation_status
		# Number of moderation requests waiting for this entry
		attr_accessor :moderation_count
		# The type of the entry, this is auto filled by the derived entry object
		attr_accessor :type
		# Entry creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Entry update date as Unix timestamp (In seconds)
		attr_accessor :updated_at
		# The calculated average rank. rank = totalRank / votes
		attr_accessor :rank
		# The sum of all rank values submitted to the baseEntry.anonymousRank action
		attr_accessor :total_rank
		# A count of all requests made to the baseEntry.anonymousRank action
		attr_accessor :votes
		attr_accessor :group_id
		# Can be used to store various partner related data as a string
		attr_accessor :partner_data
		# Download URL for the entry
		attr_accessor :download_url
		# Indexed search text for full text search
		attr_accessor :search_text
		# License type used for this entry
		attr_accessor :license_type
		# Version of the entry data
		attr_accessor :version
		# Thumbnail URL
		attr_accessor :thumbnail_url
		# The Access Control ID assigned to this entry (null when not set, send -1 to remove)
		attr_accessor :access_control_id
		# Entry scheduling start date (null when not set, send -1 to remove)
		attr_accessor :start_date
		# Entry scheduling end date (null when not set, send -1 to remove)
		attr_accessor :end_date
		# Entry external reference id
		attr_accessor :reference_id
		# ID of temporary entry that will replace this entry when it's approved and ready for replacement
		attr_accessor :replacing_entry_id
		# ID of the entry that will be replaced when the replacement approved and this entry is ready
		attr_accessor :replaced_entry_id
		# Status of the replacement readiness and approval
		attr_accessor :replacement_status
		# Can be used to store various partner related data as a numeric value
		attr_accessor :partner_sort_value
		# Override the default ingestion profile
		attr_accessor :conversion_profile_id
		# IF not empty, points to an entry ID the should replace this current entry's id.
		attr_accessor :redirect_entry_id
		# ID of source root entry, used for clipped, skipped and cropped entries that created from another entry
		attr_accessor :root_entry_id
		# ID of source root entry, used for defining entires association
		attr_accessor :parent_entry_id
		# clipping, skipping and cropping attributes that used to create this entry
		attr_accessor :operation_attributes
		# list of user ids that are entitled to edit the entry (no server enforcement) The difference between entitledUsersEdit, entitledUsersPublish and entitledUsersView is applicative only
		attr_accessor :entitled_users_edit
		# list of user ids that are entitled to publish the entry (no server enforcement) The difference between entitledUsersEdit, entitledUsersPublish and entitledUsersView is applicative only
		attr_accessor :entitled_users_publish
		# list of user ids that are entitled to view the entry (no server enforcement) The difference between entitledUsersEdit, entitledUsersPublish and entitledUsersView is applicative only
		attr_accessor :entitled_users_view
		# Comma seperated string of the capabilities of the entry. Any capability needed can be added to this list.
		attr_accessor :capabilities
		# Template entry id
		attr_accessor :template_entry_id
		# should we display this entry in search
		attr_accessor :display_in_search

		def partner_id=(val)
			@partner_id = val.to_i
		end
		def moderation_status=(val)
			@moderation_status = val.to_i
		end
		def moderation_count=(val)
			@moderation_count = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def rank=(val)
			@rank = val.to_f
		end
		def total_rank=(val)
			@total_rank = val.to_i
		end
		def votes=(val)
			@votes = val.to_i
		end
		def group_id=(val)
			@group_id = val.to_i
		end
		def license_type=(val)
			@license_type = val.to_i
		end
		def version=(val)
			@version = val.to_i
		end
		def access_control_id=(val)
			@access_control_id = val.to_i
		end
		def start_date=(val)
			@start_date = val.to_i
		end
		def end_date=(val)
			@end_date = val.to_i
		end
		def partner_sort_value=(val)
			@partner_sort_value = val.to_i
		end
		def conversion_profile_id=(val)
			@conversion_profile_id = val.to_i
		end
		def display_in_search=(val)
			@display_in_search = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['creatorId'] != nil
				self.creator_id = xml_element.elements['creatorId'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['adminTags'] != nil
				self.admin_tags = xml_element.elements['adminTags'].text
			end
			if xml_element.elements['categories'] != nil
				self.categories = xml_element.elements['categories'].text
			end
			if xml_element.elements['categoriesIds'] != nil
				self.categories_ids = xml_element.elements['categoriesIds'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['moderationStatus'] != nil
				self.moderation_status = xml_element.elements['moderationStatus'].text
			end
			if xml_element.elements['moderationCount'] != nil
				self.moderation_count = xml_element.elements['moderationCount'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['rank'] != nil
				self.rank = xml_element.elements['rank'].text
			end
			if xml_element.elements['totalRank'] != nil
				self.total_rank = xml_element.elements['totalRank'].text
			end
			if xml_element.elements['votes'] != nil
				self.votes = xml_element.elements['votes'].text
			end
			if xml_element.elements['groupId'] != nil
				self.group_id = xml_element.elements['groupId'].text
			end
			if xml_element.elements['partnerData'] != nil
				self.partner_data = xml_element.elements['partnerData'].text
			end
			if xml_element.elements['downloadUrl'] != nil
				self.download_url = xml_element.elements['downloadUrl'].text
			end
			if xml_element.elements['searchText'] != nil
				self.search_text = xml_element.elements['searchText'].text
			end
			if xml_element.elements['licenseType'] != nil
				self.license_type = xml_element.elements['licenseType'].text
			end
			if xml_element.elements['version'] != nil
				self.version = xml_element.elements['version'].text
			end
			if xml_element.elements['thumbnailUrl'] != nil
				self.thumbnail_url = xml_element.elements['thumbnailUrl'].text
			end
			if xml_element.elements['accessControlId'] != nil
				self.access_control_id = xml_element.elements['accessControlId'].text
			end
			if xml_element.elements['startDate'] != nil
				self.start_date = xml_element.elements['startDate'].text
			end
			if xml_element.elements['endDate'] != nil
				self.end_date = xml_element.elements['endDate'].text
			end
			if xml_element.elements['referenceId'] != nil
				self.reference_id = xml_element.elements['referenceId'].text
			end
			if xml_element.elements['replacingEntryId'] != nil
				self.replacing_entry_id = xml_element.elements['replacingEntryId'].text
			end
			if xml_element.elements['replacedEntryId'] != nil
				self.replaced_entry_id = xml_element.elements['replacedEntryId'].text
			end
			if xml_element.elements['replacementStatus'] != nil
				self.replacement_status = xml_element.elements['replacementStatus'].text
			end
			if xml_element.elements['partnerSortValue'] != nil
				self.partner_sort_value = xml_element.elements['partnerSortValue'].text
			end
			if xml_element.elements['conversionProfileId'] != nil
				self.conversion_profile_id = xml_element.elements['conversionProfileId'].text
			end
			if xml_element.elements['redirectEntryId'] != nil
				self.redirect_entry_id = xml_element.elements['redirectEntryId'].text
			end
			if xml_element.elements['rootEntryId'] != nil
				self.root_entry_id = xml_element.elements['rootEntryId'].text
			end
			if xml_element.elements['parentEntryId'] != nil
				self.parent_entry_id = xml_element.elements['parentEntryId'].text
			end
			if xml_element.elements['operationAttributes'] != nil
				self.operation_attributes = KalturaClientBase.object_from_xml(xml_element.elements['operationAttributes'], 'KalturaOperationAttributes')
			end
			if xml_element.elements['entitledUsersEdit'] != nil
				self.entitled_users_edit = xml_element.elements['entitledUsersEdit'].text
			end
			if xml_element.elements['entitledUsersPublish'] != nil
				self.entitled_users_publish = xml_element.elements['entitledUsersPublish'].text
			end
			if xml_element.elements['entitledUsersView'] != nil
				self.entitled_users_view = xml_element.elements['entitledUsersView'].text
			end
			if xml_element.elements['capabilities'] != nil
				self.capabilities = xml_element.elements['capabilities'].text
			end
			if xml_element.elements['templateEntryId'] != nil
				self.template_entry_id = xml_element.elements['templateEntryId'].text
			end
			if xml_element.elements['displayInSearch'] != nil
				self.display_in_search = xml_element.elements['displayInSearch'].text
			end
		end

	end

	class KalturaBaseEntryCloneOptionItem < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	class KalturaBaseResponseProfile < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	class KalturaBaseSyndicationFeed < KalturaObjectBase
		attr_accessor :id
		attr_accessor :feed_url
		attr_accessor :partner_id
		# link a playlist that will set what content the feed will include
		# 	 if empty, all content will be included in feed
		attr_accessor :playlist_id
		# feed name
		attr_accessor :name
		# feed status
		attr_accessor :status
		# feed type
		attr_accessor :type
		# Base URL for each video, on the partners site
		# 	 This is required by all syndication types.
		attr_accessor :landing_page
		# Creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# allow_embed tells google OR yahoo weather to allow embedding the video on google OR yahoo video results
		# 	 or just to provide a link to the landing page.
		# 	 it is applied on the video-player_loc property in the XML (google)
		# 	 and addes media-player tag (yahoo)
		attr_accessor :allow_embed
		# Select a uiconf ID as player skin to include in the kwidget url
		attr_accessor :player_uiconf_id
		attr_accessor :flavor_param_id
		attr_accessor :transcode_existing_content
		attr_accessor :add_to_default_conversion_profile
		attr_accessor :categories
		attr_accessor :storage_id
		attr_accessor :entries_order_by
		# Should enforce entitlement on feed entries
		attr_accessor :enforce_entitlement
		# Set privacy context for search entries that assiged to private and public categories within a category privacy context.
		attr_accessor :privacy_context
		# Update date as Unix timestamp (In seconds)
		attr_accessor :updated_at
		attr_accessor :use_category_entries
		# Feed content-type header value
		attr_accessor :feed_content_type_header

		def partner_id=(val)
			@partner_id = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def type=(val)
			@type = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def allow_embed=(val)
			@allow_embed = to_b(val)
		end
		def player_uiconf_id=(val)
			@player_uiconf_id = val.to_i
		end
		def flavor_param_id=(val)
			@flavor_param_id = val.to_i
		end
		def transcode_existing_content=(val)
			@transcode_existing_content = to_b(val)
		end
		def add_to_default_conversion_profile=(val)
			@add_to_default_conversion_profile = to_b(val)
		end
		def storage_id=(val)
			@storage_id = val.to_i
		end
		def enforce_entitlement=(val)
			@enforce_entitlement = to_b(val)
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def use_category_entries=(val)
			@use_category_entries = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['feedUrl'] != nil
				self.feed_url = xml_element.elements['feedUrl'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['playlistId'] != nil
				self.playlist_id = xml_element.elements['playlistId'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['landingPage'] != nil
				self.landing_page = xml_element.elements['landingPage'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['allowEmbed'] != nil
				self.allow_embed = xml_element.elements['allowEmbed'].text
			end
			if xml_element.elements['playerUiconfId'] != nil
				self.player_uiconf_id = xml_element.elements['playerUiconfId'].text
			end
			if xml_element.elements['flavorParamId'] != nil
				self.flavor_param_id = xml_element.elements['flavorParamId'].text
			end
			if xml_element.elements['transcodeExistingContent'] != nil
				self.transcode_existing_content = xml_element.elements['transcodeExistingContent'].text
			end
			if xml_element.elements['addToDefaultConversionProfile'] != nil
				self.add_to_default_conversion_profile = xml_element.elements['addToDefaultConversionProfile'].text
			end
			if xml_element.elements['categories'] != nil
				self.categories = xml_element.elements['categories'].text
			end
			if xml_element.elements['storageId'] != nil
				self.storage_id = xml_element.elements['storageId'].text
			end
			if xml_element.elements['entriesOrderBy'] != nil
				self.entries_order_by = xml_element.elements['entriesOrderBy'].text
			end
			if xml_element.elements['enforceEntitlement'] != nil
				self.enforce_entitlement = xml_element.elements['enforceEntitlement'].text
			end
			if xml_element.elements['privacyContext'] != nil
				self.privacy_context = xml_element.elements['privacyContext'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['useCategoryEntries'] != nil
				self.use_category_entries = xml_element.elements['useCategoryEntries'].text
			end
			if xml_element.elements['feedContentTypeHeader'] != nil
				self.feed_content_type_header = xml_element.elements['feedContentTypeHeader'].text
			end
		end

	end

	class KalturaJobData < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	class KalturaBatchHistoryData < KalturaObjectBase
		attr_accessor :scheduler_id
		attr_accessor :worker_id
		attr_accessor :batch_index
		attr_accessor :time_stamp
		attr_accessor :message
		attr_accessor :err_type
		attr_accessor :err_number
		attr_accessor :host_name
		attr_accessor :session_id

		def scheduler_id=(val)
			@scheduler_id = val.to_i
		end
		def worker_id=(val)
			@worker_id = val.to_i
		end
		def batch_index=(val)
			@batch_index = val.to_i
		end
		def time_stamp=(val)
			@time_stamp = val.to_i
		end
		def err_type=(val)
			@err_type = val.to_i
		end
		def err_number=(val)
			@err_number = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['schedulerId'] != nil
				self.scheduler_id = xml_element.elements['schedulerId'].text
			end
			if xml_element.elements['workerId'] != nil
				self.worker_id = xml_element.elements['workerId'].text
			end
			if xml_element.elements['batchIndex'] != nil
				self.batch_index = xml_element.elements['batchIndex'].text
			end
			if xml_element.elements['timeStamp'] != nil
				self.time_stamp = xml_element.elements['timeStamp'].text
			end
			if xml_element.elements['message'] != nil
				self.message = xml_element.elements['message'].text
			end
			if xml_element.elements['errType'] != nil
				self.err_type = xml_element.elements['errType'].text
			end
			if xml_element.elements['errNumber'] != nil
				self.err_number = xml_element.elements['errNumber'].text
			end
			if xml_element.elements['hostName'] != nil
				self.host_name = xml_element.elements['hostName'].text
			end
			if xml_element.elements['sessionId'] != nil
				self.session_id = xml_element.elements['sessionId'].text
			end
		end

	end

	class KalturaBatchJob < KalturaObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :deleted_at
		attr_accessor :lock_expiration
		attr_accessor :execution_attempts
		attr_accessor :lock_version
		attr_accessor :entry_id
		attr_accessor :entry_name
		attr_accessor :job_type
		attr_accessor :job_sub_type
		attr_accessor :data
		attr_accessor :status
		attr_accessor :abort
		attr_accessor :check_again_timeout
		attr_accessor :message
		attr_accessor :description
		attr_accessor :priority
		attr_accessor :history
		# The id of the bulk upload job that initiated this job
		attr_accessor :bulk_job_id
		attr_accessor :batch_version
		# When one job creates another - the parent should set this parentJobId to be its own id.
		attr_accessor :parent_job_id
		# The id of the root parent job
		attr_accessor :root_job_id
		# The time that the job was pulled from the queue
		attr_accessor :queue_time
		# The time that the job was finished or closed as failed
		attr_accessor :finish_time
		attr_accessor :err_type
		attr_accessor :err_number
		attr_accessor :estimated_effort
		attr_accessor :urgency
		attr_accessor :scheduler_id
		attr_accessor :worker_id
		attr_accessor :batch_index
		attr_accessor :last_scheduler_id
		attr_accessor :last_worker_id
		attr_accessor :dc
		attr_accessor :job_object_id
		attr_accessor :job_object_type

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def deleted_at=(val)
			@deleted_at = val.to_i
		end
		def lock_expiration=(val)
			@lock_expiration = val.to_i
		end
		def execution_attempts=(val)
			@execution_attempts = val.to_i
		end
		def lock_version=(val)
			@lock_version = val.to_i
		end
		def job_sub_type=(val)
			@job_sub_type = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def abort=(val)
			@abort = val.to_i
		end
		def check_again_timeout=(val)
			@check_again_timeout = val.to_i
		end
		def priority=(val)
			@priority = val.to_i
		end
		def bulk_job_id=(val)
			@bulk_job_id = val.to_i
		end
		def batch_version=(val)
			@batch_version = val.to_i
		end
		def parent_job_id=(val)
			@parent_job_id = val.to_i
		end
		def root_job_id=(val)
			@root_job_id = val.to_i
		end
		def queue_time=(val)
			@queue_time = val.to_i
		end
		def finish_time=(val)
			@finish_time = val.to_i
		end
		def err_type=(val)
			@err_type = val.to_i
		end
		def err_number=(val)
			@err_number = val.to_i
		end
		def estimated_effort=(val)
			@estimated_effort = val.to_i
		end
		def urgency=(val)
			@urgency = val.to_i
		end
		def scheduler_id=(val)
			@scheduler_id = val.to_i
		end
		def worker_id=(val)
			@worker_id = val.to_i
		end
		def batch_index=(val)
			@batch_index = val.to_i
		end
		def last_scheduler_id=(val)
			@last_scheduler_id = val.to_i
		end
		def last_worker_id=(val)
			@last_worker_id = val.to_i
		end
		def dc=(val)
			@dc = val.to_i
		end
		def job_object_type=(val)
			@job_object_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['deletedAt'] != nil
				self.deleted_at = xml_element.elements['deletedAt'].text
			end
			if xml_element.elements['lockExpiration'] != nil
				self.lock_expiration = xml_element.elements['lockExpiration'].text
			end
			if xml_element.elements['executionAttempts'] != nil
				self.execution_attempts = xml_element.elements['executionAttempts'].text
			end
			if xml_element.elements['lockVersion'] != nil
				self.lock_version = xml_element.elements['lockVersion'].text
			end
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['entryName'] != nil
				self.entry_name = xml_element.elements['entryName'].text
			end
			if xml_element.elements['jobType'] != nil
				self.job_type = xml_element.elements['jobType'].text
			end
			if xml_element.elements['jobSubType'] != nil
				self.job_sub_type = xml_element.elements['jobSubType'].text
			end
			if xml_element.elements['data'] != nil
				self.data = KalturaClientBase.object_from_xml(xml_element.elements['data'], 'KalturaJobData')
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['abort'] != nil
				self.abort = xml_element.elements['abort'].text
			end
			if xml_element.elements['checkAgainTimeout'] != nil
				self.check_again_timeout = xml_element.elements['checkAgainTimeout'].text
			end
			if xml_element.elements['message'] != nil
				self.message = xml_element.elements['message'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['priority'] != nil
				self.priority = xml_element.elements['priority'].text
			end
			if xml_element.elements['history'] != nil
				self.history = KalturaClientBase.object_from_xml(xml_element.elements['history'], 'KalturaBatchHistoryData')
			end
			if xml_element.elements['bulkJobId'] != nil
				self.bulk_job_id = xml_element.elements['bulkJobId'].text
			end
			if xml_element.elements['batchVersion'] != nil
				self.batch_version = xml_element.elements['batchVersion'].text
			end
			if xml_element.elements['parentJobId'] != nil
				self.parent_job_id = xml_element.elements['parentJobId'].text
			end
			if xml_element.elements['rootJobId'] != nil
				self.root_job_id = xml_element.elements['rootJobId'].text
			end
			if xml_element.elements['queueTime'] != nil
				self.queue_time = xml_element.elements['queueTime'].text
			end
			if xml_element.elements['finishTime'] != nil
				self.finish_time = xml_element.elements['finishTime'].text
			end
			if xml_element.elements['errType'] != nil
				self.err_type = xml_element.elements['errType'].text
			end
			if xml_element.elements['errNumber'] != nil
				self.err_number = xml_element.elements['errNumber'].text
			end
			if xml_element.elements['estimatedEffort'] != nil
				self.estimated_effort = xml_element.elements['estimatedEffort'].text
			end
			if xml_element.elements['urgency'] != nil
				self.urgency = xml_element.elements['urgency'].text
			end
			if xml_element.elements['schedulerId'] != nil
				self.scheduler_id = xml_element.elements['schedulerId'].text
			end
			if xml_element.elements['workerId'] != nil
				self.worker_id = xml_element.elements['workerId'].text
			end
			if xml_element.elements['batchIndex'] != nil
				self.batch_index = xml_element.elements['batchIndex'].text
			end
			if xml_element.elements['lastSchedulerId'] != nil
				self.last_scheduler_id = xml_element.elements['lastSchedulerId'].text
			end
			if xml_element.elements['lastWorkerId'] != nil
				self.last_worker_id = xml_element.elements['lastWorkerId'].text
			end
			if xml_element.elements['dc'] != nil
				self.dc = xml_element.elements['dc'].text
			end
			if xml_element.elements['jobObjectId'] != nil
				self.job_object_id = xml_element.elements['jobObjectId'].text
			end
			if xml_element.elements['jobObjectType'] != nil
				self.job_object_type = xml_element.elements['jobObjectType'].text
			end
		end

	end

	class KalturaPlayerDeliveryType < KalturaObjectBase
		attr_accessor :id
		attr_accessor :label
		attr_accessor :flashvars
		attr_accessor :min_version
		attr_accessor :enabled_by_default

		def enabled_by_default=(val)
			@enabled_by_default = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['label'] != nil
				self.label = xml_element.elements['label'].text
			end
			if xml_element.elements['flashvars'] != nil
				self.flashvars = KalturaClientBase.object_from_xml(xml_element.elements['flashvars'], 'KalturaKeyValue')
			end
			if xml_element.elements['minVersion'] != nil
				self.min_version = xml_element.elements['minVersion'].text
			end
			if xml_element.elements['enabledByDefault'] != nil
				self.enabled_by_default = xml_element.elements['enabledByDefault'].text
			end
		end

	end

	class KalturaPlayerEmbedCodeType < KalturaObjectBase
		attr_accessor :id
		attr_accessor :label
		attr_accessor :entry_only
		attr_accessor :min_version

		def entry_only=(val)
			@entry_only = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['label'] != nil
				self.label = xml_element.elements['label'].text
			end
			if xml_element.elements['entryOnly'] != nil
				self.entry_only = xml_element.elements['entryOnly'].text
			end
			if xml_element.elements['minVersion'] != nil
				self.min_version = xml_element.elements['minVersion'].text
			end
		end

	end

	class KalturaESearchLanguageItem < KalturaObjectBase
		attr_accessor :e_serach_language


		def from_xml(xml_element)
			super
			if xml_element.elements['eSerachLanguage'] != nil
				self.e_serach_language = xml_element.elements['eSerachLanguage'].text
			end
		end

	end

	class KalturaPartner < KalturaObjectBase
		attr_accessor :id
		attr_accessor :name
		attr_accessor :website
		attr_accessor :notification_url
		attr_accessor :appear_in_search
		attr_accessor :created_at
		# deprecated - lastName and firstName replaces this field
		attr_accessor :admin_name
		attr_accessor :admin_email
		attr_accessor :description
		attr_accessor :commercial_use
		attr_accessor :landing_page
		attr_accessor :user_landing_page
		attr_accessor :content_categories
		attr_accessor :type
		attr_accessor :phone
		attr_accessor :describe_yourself
		attr_accessor :adult_content
		attr_accessor :def_conversion_profile_type
		attr_accessor :notify
		attr_accessor :status
		attr_accessor :allow_quick_edit
		attr_accessor :merge_entry_lists
		attr_accessor :notifications_config
		attr_accessor :max_upload_size
		attr_accessor :partner_package
		attr_accessor :secret
		attr_accessor :admin_secret
		attr_accessor :cms_password
		attr_accessor :allow_multi_notification
		attr_accessor :admin_login_users_quota
		attr_accessor :admin_user_id
		# firstName and lastName replace the old (deprecated) adminName
		attr_accessor :first_name
		# lastName and firstName replace the old (deprecated) adminName
		attr_accessor :last_name
		# country code (2char) - this field is optional
		attr_accessor :country
		# state code (2char) - this field is optional
		attr_accessor :state
		attr_accessor :additional_params
		attr_accessor :publishers_quota
		attr_accessor :partner_group_type
		attr_accessor :default_entitlement_enforcement
		attr_accessor :default_delivery_type
		attr_accessor :default_embed_code_type
		attr_accessor :delivery_types
		attr_accessor :embed_code_types
		attr_accessor :template_partner_id
		attr_accessor :ignore_seo_links
		attr_accessor :host
		attr_accessor :cdn_host
		attr_accessor :is_first_login
		attr_accessor :logout_url
		attr_accessor :partner_parent_id
		attr_accessor :crm_id
		attr_accessor :reference_id
		attr_accessor :time_aligned_renditions
		attr_accessor :publisher_environment_type
		attr_accessor :ovp_environment_url
		attr_accessor :ott_environment_url
		attr_accessor :e_search_languages

		def id=(val)
			@id = val.to_i
		end
		def appear_in_search=(val)
			@appear_in_search = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def commercial_use=(val)
			@commercial_use = val.to_i
		end
		def type=(val)
			@type = val.to_i
		end
		def adult_content=(val)
			@adult_content = to_b(val)
		end
		def notify=(val)
			@notify = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def allow_quick_edit=(val)
			@allow_quick_edit = val.to_i
		end
		def merge_entry_lists=(val)
			@merge_entry_lists = val.to_i
		end
		def max_upload_size=(val)
			@max_upload_size = val.to_i
		end
		def partner_package=(val)
			@partner_package = val.to_i
		end
		def allow_multi_notification=(val)
			@allow_multi_notification = val.to_i
		end
		def admin_login_users_quota=(val)
			@admin_login_users_quota = val.to_i
		end
		def publishers_quota=(val)
			@publishers_quota = val.to_i
		end
		def partner_group_type=(val)
			@partner_group_type = val.to_i
		end
		def default_entitlement_enforcement=(val)
			@default_entitlement_enforcement = to_b(val)
		end
		def template_partner_id=(val)
			@template_partner_id = val.to_i
		end
		def ignore_seo_links=(val)
			@ignore_seo_links = to_b(val)
		end
		def is_first_login=(val)
			@is_first_login = to_b(val)
		end
		def partner_parent_id=(val)
			@partner_parent_id = val.to_i
		end
		def time_aligned_renditions=(val)
			@time_aligned_renditions = to_b(val)
		end
		def publisher_environment_type=(val)
			@publisher_environment_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['website'] != nil
				self.website = xml_element.elements['website'].text
			end
			if xml_element.elements['notificationUrl'] != nil
				self.notification_url = xml_element.elements['notificationUrl'].text
			end
			if xml_element.elements['appearInSearch'] != nil
				self.appear_in_search = xml_element.elements['appearInSearch'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['adminName'] != nil
				self.admin_name = xml_element.elements['adminName'].text
			end
			if xml_element.elements['adminEmail'] != nil
				self.admin_email = xml_element.elements['adminEmail'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['commercialUse'] != nil
				self.commercial_use = xml_element.elements['commercialUse'].text
			end
			if xml_element.elements['landingPage'] != nil
				self.landing_page = xml_element.elements['landingPage'].text
			end
			if xml_element.elements['userLandingPage'] != nil
				self.user_landing_page = xml_element.elements['userLandingPage'].text
			end
			if xml_element.elements['contentCategories'] != nil
				self.content_categories = xml_element.elements['contentCategories'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['phone'] != nil
				self.phone = xml_element.elements['phone'].text
			end
			if xml_element.elements['describeYourself'] != nil
				self.describe_yourself = xml_element.elements['describeYourself'].text
			end
			if xml_element.elements['adultContent'] != nil
				self.adult_content = xml_element.elements['adultContent'].text
			end
			if xml_element.elements['defConversionProfileType'] != nil
				self.def_conversion_profile_type = xml_element.elements['defConversionProfileType'].text
			end
			if xml_element.elements['notify'] != nil
				self.notify = xml_element.elements['notify'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['allowQuickEdit'] != nil
				self.allow_quick_edit = xml_element.elements['allowQuickEdit'].text
			end
			if xml_element.elements['mergeEntryLists'] != nil
				self.merge_entry_lists = xml_element.elements['mergeEntryLists'].text
			end
			if xml_element.elements['notificationsConfig'] != nil
				self.notifications_config = xml_element.elements['notificationsConfig'].text
			end
			if xml_element.elements['maxUploadSize'] != nil
				self.max_upload_size = xml_element.elements['maxUploadSize'].text
			end
			if xml_element.elements['partnerPackage'] != nil
				self.partner_package = xml_element.elements['partnerPackage'].text
			end
			if xml_element.elements['secret'] != nil
				self.secret = xml_element.elements['secret'].text
			end
			if xml_element.elements['adminSecret'] != nil
				self.admin_secret = xml_element.elements['adminSecret'].text
			end
			if xml_element.elements['cmsPassword'] != nil
				self.cms_password = xml_element.elements['cmsPassword'].text
			end
			if xml_element.elements['allowMultiNotification'] != nil
				self.allow_multi_notification = xml_element.elements['allowMultiNotification'].text
			end
			if xml_element.elements['adminLoginUsersQuota'] != nil
				self.admin_login_users_quota = xml_element.elements['adminLoginUsersQuota'].text
			end
			if xml_element.elements['adminUserId'] != nil
				self.admin_user_id = xml_element.elements['adminUserId'].text
			end
			if xml_element.elements['firstName'] != nil
				self.first_name = xml_element.elements['firstName'].text
			end
			if xml_element.elements['lastName'] != nil
				self.last_name = xml_element.elements['lastName'].text
			end
			if xml_element.elements['country'] != nil
				self.country = xml_element.elements['country'].text
			end
			if xml_element.elements['state'] != nil
				self.state = xml_element.elements['state'].text
			end
			if xml_element.elements['additionalParams'] != nil
				self.additional_params = KalturaClientBase.object_from_xml(xml_element.elements['additionalParams'], 'KalturaKeyValue')
			end
			if xml_element.elements['publishersQuota'] != nil
				self.publishers_quota = xml_element.elements['publishersQuota'].text
			end
			if xml_element.elements['partnerGroupType'] != nil
				self.partner_group_type = xml_element.elements['partnerGroupType'].text
			end
			if xml_element.elements['defaultEntitlementEnforcement'] != nil
				self.default_entitlement_enforcement = xml_element.elements['defaultEntitlementEnforcement'].text
			end
			if xml_element.elements['defaultDeliveryType'] != nil
				self.default_delivery_type = xml_element.elements['defaultDeliveryType'].text
			end
			if xml_element.elements['defaultEmbedCodeType'] != nil
				self.default_embed_code_type = xml_element.elements['defaultEmbedCodeType'].text
			end
			if xml_element.elements['deliveryTypes'] != nil
				self.delivery_types = KalturaClientBase.object_from_xml(xml_element.elements['deliveryTypes'], 'KalturaPlayerDeliveryType')
			end
			if xml_element.elements['embedCodeTypes'] != nil
				self.embed_code_types = KalturaClientBase.object_from_xml(xml_element.elements['embedCodeTypes'], 'KalturaPlayerEmbedCodeType')
			end
			if xml_element.elements['templatePartnerId'] != nil
				self.template_partner_id = xml_element.elements['templatePartnerId'].text
			end
			if xml_element.elements['ignoreSeoLinks'] != nil
				self.ignore_seo_links = xml_element.elements['ignoreSeoLinks'].text
			end
			if xml_element.elements['host'] != nil
				self.host = xml_element.elements['host'].text
			end
			if xml_element.elements['cdnHost'] != nil
				self.cdn_host = xml_element.elements['cdnHost'].text
			end
			if xml_element.elements['isFirstLogin'] != nil
				self.is_first_login = xml_element.elements['isFirstLogin'].text
			end
			if xml_element.elements['logoutUrl'] != nil
				self.logout_url = xml_element.elements['logoutUrl'].text
			end
			if xml_element.elements['partnerParentId'] != nil
				self.partner_parent_id = xml_element.elements['partnerParentId'].text
			end
			if xml_element.elements['crmId'] != nil
				self.crm_id = xml_element.elements['crmId'].text
			end
			if xml_element.elements['referenceId'] != nil
				self.reference_id = xml_element.elements['referenceId'].text
			end
			if xml_element.elements['timeAlignedRenditions'] != nil
				self.time_aligned_renditions = xml_element.elements['timeAlignedRenditions'].text
			end
			if xml_element.elements['publisherEnvironmentType'] != nil
				self.publisher_environment_type = xml_element.elements['publisherEnvironmentType'].text
			end
			if xml_element.elements['ovpEnvironmentUrl'] != nil
				self.ovp_environment_url = xml_element.elements['ovpEnvironmentUrl'].text
			end
			if xml_element.elements['ottEnvironmentUrl'] != nil
				self.ott_environment_url = xml_element.elements['ottEnvironmentUrl'].text
			end
			if xml_element.elements['eSearchLanguages'] != nil
				self.e_search_languages = KalturaClientBase.object_from_xml(xml_element.elements['eSearchLanguages'], 'KalturaESearchLanguageItem')
			end
		end

	end

	# A representation to return an array of values
	class KalturaValue < KalturaObjectBase
		attr_accessor :description


		def from_xml(xml_element)
			super
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
		end

	end

	# A boolean representation to return an array of booleans
	class KalturaBooleanValue < KalturaValue
		attr_accessor :value

		def value=(val)
			@value = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	class KalturaBulkUploadPluginData < KalturaObjectBase
		attr_accessor :field
		attr_accessor :value


		def from_xml(xml_element)
			super
			if xml_element.elements['field'] != nil
				self.field = xml_element.elements['field'].text
			end
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	class KalturaBulkUploadResult < KalturaObjectBase
		# The id of the result
		attr_accessor :id
		# The id of the parent job
		attr_accessor :bulk_upload_job_id
		# The index of the line in the CSV
		attr_accessor :line_index
		attr_accessor :partner_id
		attr_accessor :status
		attr_accessor :action
		attr_accessor :object_id
		attr_accessor :object_status
		attr_accessor :bulk_upload_result_object_type
		# The data as recieved in the csv
		attr_accessor :row_data
		attr_accessor :partner_data
		attr_accessor :object_error_description
		attr_accessor :plugins_data
		attr_accessor :error_description
		attr_accessor :error_code
		attr_accessor :error_type

		def id=(val)
			@id = val.to_i
		end
		def bulk_upload_job_id=(val)
			@bulk_upload_job_id = val.to_i
		end
		def line_index=(val)
			@line_index = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def object_status=(val)
			@object_status = val.to_i
		end
		def error_type=(val)
			@error_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['bulkUploadJobId'] != nil
				self.bulk_upload_job_id = xml_element.elements['bulkUploadJobId'].text
			end
			if xml_element.elements['lineIndex'] != nil
				self.line_index = xml_element.elements['lineIndex'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['action'] != nil
				self.action = xml_element.elements['action'].text
			end
			if xml_element.elements['objectId'] != nil
				self.object_id = xml_element.elements['objectId'].text
			end
			if xml_element.elements['objectStatus'] != nil
				self.object_status = xml_element.elements['objectStatus'].text
			end
			if xml_element.elements['bulkUploadResultObjectType'] != nil
				self.bulk_upload_result_object_type = xml_element.elements['bulkUploadResultObjectType'].text
			end
			if xml_element.elements['rowData'] != nil
				self.row_data = xml_element.elements['rowData'].text
			end
			if xml_element.elements['partnerData'] != nil
				self.partner_data = xml_element.elements['partnerData'].text
			end
			if xml_element.elements['objectErrorDescription'] != nil
				self.object_error_description = xml_element.elements['objectErrorDescription'].text
			end
			if xml_element.elements['pluginsData'] != nil
				self.plugins_data = KalturaClientBase.object_from_xml(xml_element.elements['pluginsData'], 'KalturaBulkUploadPluginData')
			end
			if xml_element.elements['errorDescription'] != nil
				self.error_description = xml_element.elements['errorDescription'].text
			end
			if xml_element.elements['errorCode'] != nil
				self.error_code = xml_element.elements['errorCode'].text
			end
			if xml_element.elements['errorType'] != nil
				self.error_type = xml_element.elements['errorType'].text
			end
		end

	end

	class KalturaBulkUpload < KalturaObjectBase
		attr_accessor :id
		attr_accessor :uploaded_by
		attr_accessor :uploaded_by_user_id
		attr_accessor :uploaded_on
		attr_accessor :num_of_entries
		attr_accessor :status
		attr_accessor :log_file_url
		attr_accessor :csv_file_url
		attr_accessor :bulk_file_url
		attr_accessor :bulk_upload_type
		attr_accessor :results
		attr_accessor :error
		attr_accessor :error_type
		attr_accessor :error_number
		attr_accessor :file_name
		attr_accessor :description
		attr_accessor :num_of_objects
		attr_accessor :bulk_upload_object_type

		def id=(val)
			@id = val.to_i
		end
		def uploaded_on=(val)
			@uploaded_on = val.to_i
		end
		def num_of_entries=(val)
			@num_of_entries = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def error_type=(val)
			@error_type = val.to_i
		end
		def error_number=(val)
			@error_number = val.to_i
		end
		def num_of_objects=(val)
			@num_of_objects = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['uploadedBy'] != nil
				self.uploaded_by = xml_element.elements['uploadedBy'].text
			end
			if xml_element.elements['uploadedByUserId'] != nil
				self.uploaded_by_user_id = xml_element.elements['uploadedByUserId'].text
			end
			if xml_element.elements['uploadedOn'] != nil
				self.uploaded_on = xml_element.elements['uploadedOn'].text
			end
			if xml_element.elements['numOfEntries'] != nil
				self.num_of_entries = xml_element.elements['numOfEntries'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['logFileUrl'] != nil
				self.log_file_url = xml_element.elements['logFileUrl'].text
			end
			if xml_element.elements['csvFileUrl'] != nil
				self.csv_file_url = xml_element.elements['csvFileUrl'].text
			end
			if xml_element.elements['bulkFileUrl'] != nil
				self.bulk_file_url = xml_element.elements['bulkFileUrl'].text
			end
			if xml_element.elements['bulkUploadType'] != nil
				self.bulk_upload_type = xml_element.elements['bulkUploadType'].text
			end
			if xml_element.elements['results'] != nil
				self.results = KalturaClientBase.object_from_xml(xml_element.elements['results'], 'KalturaBulkUploadResult')
			end
			if xml_element.elements['error'] != nil
				self.error = xml_element.elements['error'].text
			end
			if xml_element.elements['errorType'] != nil
				self.error_type = xml_element.elements['errorType'].text
			end
			if xml_element.elements['errorNumber'] != nil
				self.error_number = xml_element.elements['errorNumber'].text
			end
			if xml_element.elements['fileName'] != nil
				self.file_name = xml_element.elements['fileName'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['numOfObjects'] != nil
				self.num_of_objects = xml_element.elements['numOfObjects'].text
			end
			if xml_element.elements['bulkUploadObjectType'] != nil
				self.bulk_upload_object_type = xml_element.elements['bulkUploadObjectType'].text
			end
		end

	end

	# This class represents object-specific data passed to the 
	#  bulk upload job.
	class KalturaBulkUploadObjectData < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	class KalturaCEError < KalturaObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :browser
		attr_accessor :server_ip
		attr_accessor :server_os
		attr_accessor :php_version
		attr_accessor :ce_admin_email
		attr_accessor :type
		attr_accessor :description
		attr_accessor :data

		def partner_id=(val)
			@partner_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['browser'] != nil
				self.browser = xml_element.elements['browser'].text
			end
			if xml_element.elements['serverIp'] != nil
				self.server_ip = xml_element.elements['serverIp'].text
			end
			if xml_element.elements['serverOs'] != nil
				self.server_os = xml_element.elements['serverOs'].text
			end
			if xml_element.elements['phpVersion'] != nil
				self.php_version = xml_element.elements['phpVersion'].text
			end
			if xml_element.elements['ceAdminEmail'] != nil
				self.ce_admin_email = xml_element.elements['ceAdminEmail'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['data'] != nil
				self.data = xml_element.elements['data'].text
			end
		end

	end

	class KalturaCategory < KalturaObjectBase
		# The id of the Category
		attr_accessor :id
		attr_accessor :parent_id
		attr_accessor :depth
		attr_accessor :partner_id
		# The name of the Category. 
		# 	 The following characters are not allowed: '<', '>', ','
		attr_accessor :name
		# The full name of the Category
		attr_accessor :full_name
		# The full ids of the Category
		attr_accessor :full_ids
		# Number of entries in this Category (including child categories)
		attr_accessor :entries_count
		# Creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Update date as Unix timestamp (In seconds)
		attr_accessor :updated_at
		# Category description
		attr_accessor :description
		# Category tags
		attr_accessor :tags
		# If category will be returned for list action.
		attr_accessor :appear_in_list
		# defines the privacy of the entries that assigned to this category
		attr_accessor :privacy
		# If Category members are inherited from parent category or set manualy.
		attr_accessor :inheritance_type
		# Who can ask to join this category
		attr_accessor :user_join_policy
		# Default permissionLevel for new users
		attr_accessor :default_permission_level
		# Category Owner (User id)
		attr_accessor :owner
		# Number of entries that belong to this category directly
		attr_accessor :direct_entries_count
		# Category external id, controlled and managed by the partner.
		attr_accessor :reference_id
		# who can assign entries to this category
		attr_accessor :contribution_policy
		# Number of active members for this category
		attr_accessor :members_count
		# Number of pending members for this category
		attr_accessor :pending_members_count
		# Set privacy context for search entries that assiged to private and public categories. the entries will be private if the search context is set with those categories.
		attr_accessor :privacy_context
		# comma separated parents that defines a privacyContext for search
		attr_accessor :privacy_contexts
		# Status
		attr_accessor :status
		# The category id that this category inherit its members and members permission (for contribution and join)
		attr_accessor :inherited_parent_id
		# Can be used to store various partner related data as a numeric value
		attr_accessor :partner_sort_value
		# Can be used to store various partner related data as a string
		attr_accessor :partner_data
		# Enable client side applications to define how to sort the category child categories
		attr_accessor :default_order_by
		# Number of direct children categories
		attr_accessor :direct_sub_categories_count
		# Moderation to add entries to this category by users that are not of permission level Manager or Moderator.
		attr_accessor :moderation
		# Nunber of pending moderation entries
		attr_accessor :pending_entries_count
		# Flag indicating that the category is an aggregation category
		attr_accessor :is_aggregation_category
		# List of aggregation channels the category belongs to
		attr_accessor :aggregation_categories

		def id=(val)
			@id = val.to_i
		end
		def parent_id=(val)
			@parent_id = val.to_i
		end
		def depth=(val)
			@depth = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def entries_count=(val)
			@entries_count = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def appear_in_list=(val)
			@appear_in_list = val.to_i
		end
		def privacy=(val)
			@privacy = val.to_i
		end
		def inheritance_type=(val)
			@inheritance_type = val.to_i
		end
		def user_join_policy=(val)
			@user_join_policy = val.to_i
		end
		def default_permission_level=(val)
			@default_permission_level = val.to_i
		end
		def direct_entries_count=(val)
			@direct_entries_count = val.to_i
		end
		def contribution_policy=(val)
			@contribution_policy = val.to_i
		end
		def members_count=(val)
			@members_count = val.to_i
		end
		def pending_members_count=(val)
			@pending_members_count = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def inherited_parent_id=(val)
			@inherited_parent_id = val.to_i
		end
		def partner_sort_value=(val)
			@partner_sort_value = val.to_i
		end
		def direct_sub_categories_count=(val)
			@direct_sub_categories_count = val.to_i
		end
		def moderation=(val)
			@moderation = val.to_i
		end
		def pending_entries_count=(val)
			@pending_entries_count = val.to_i
		end
		def is_aggregation_category=(val)
			@is_aggregation_category = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['parentId'] != nil
				self.parent_id = xml_element.elements['parentId'].text
			end
			if xml_element.elements['depth'] != nil
				self.depth = xml_element.elements['depth'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['fullName'] != nil
				self.full_name = xml_element.elements['fullName'].text
			end
			if xml_element.elements['fullIds'] != nil
				self.full_ids = xml_element.elements['fullIds'].text
			end
			if xml_element.elements['entriesCount'] != nil
				self.entries_count = xml_element.elements['entriesCount'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['appearInList'] != nil
				self.appear_in_list = xml_element.elements['appearInList'].text
			end
			if xml_element.elements['privacy'] != nil
				self.privacy = xml_element.elements['privacy'].text
			end
			if xml_element.elements['inheritanceType'] != nil
				self.inheritance_type = xml_element.elements['inheritanceType'].text
			end
			if xml_element.elements['userJoinPolicy'] != nil
				self.user_join_policy = xml_element.elements['userJoinPolicy'].text
			end
			if xml_element.elements['defaultPermissionLevel'] != nil
				self.default_permission_level = xml_element.elements['defaultPermissionLevel'].text
			end
			if xml_element.elements['owner'] != nil
				self.owner = xml_element.elements['owner'].text
			end
			if xml_element.elements['directEntriesCount'] != nil
				self.direct_entries_count = xml_element.elements['directEntriesCount'].text
			end
			if xml_element.elements['referenceId'] != nil
				self.reference_id = xml_element.elements['referenceId'].text
			end
			if xml_element.elements['contributionPolicy'] != nil
				self.contribution_policy = xml_element.elements['contributionPolicy'].text
			end
			if xml_element.elements['membersCount'] != nil
				self.members_count = xml_element.elements['membersCount'].text
			end
			if xml_element.elements['pendingMembersCount'] != nil
				self.pending_members_count = xml_element.elements['pendingMembersCount'].text
			end
			if xml_element.elements['privacyContext'] != nil
				self.privacy_context = xml_element.elements['privacyContext'].text
			end
			if xml_element.elements['privacyContexts'] != nil
				self.privacy_contexts = xml_element.elements['privacyContexts'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['inheritedParentId'] != nil
				self.inherited_parent_id = xml_element.elements['inheritedParentId'].text
			end
			if xml_element.elements['partnerSortValue'] != nil
				self.partner_sort_value = xml_element.elements['partnerSortValue'].text
			end
			if xml_element.elements['partnerData'] != nil
				self.partner_data = xml_element.elements['partnerData'].text
			end
			if xml_element.elements['defaultOrderBy'] != nil
				self.default_order_by = xml_element.elements['defaultOrderBy'].text
			end
			if xml_element.elements['directSubCategoriesCount'] != nil
				self.direct_sub_categories_count = xml_element.elements['directSubCategoriesCount'].text
			end
			if xml_element.elements['moderation'] != nil
				self.moderation = xml_element.elements['moderation'].text
			end
			if xml_element.elements['pendingEntriesCount'] != nil
				self.pending_entries_count = xml_element.elements['pendingEntriesCount'].text
			end
			if xml_element.elements['isAggregationCategory'] != nil
				self.is_aggregation_category = xml_element.elements['isAggregationCategory'].text
			end
			if xml_element.elements['aggregationCategories'] != nil
				self.aggregation_categories = xml_element.elements['aggregationCategories'].text
			end
		end

	end

	class KalturaCategoryEntry < KalturaObjectBase
		attr_accessor :category_id
		# entry id
		attr_accessor :entry_id
		# Creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# The full ids of the Category
		attr_accessor :category_full_ids
		# CategroyEntry status
		attr_accessor :status
		# CategroyEntry creator puser ID
		attr_accessor :creator_user_id

		def category_id=(val)
			@category_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['categoryId'] != nil
				self.category_id = xml_element.elements['categoryId'].text
			end
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['categoryFullIds'] != nil
				self.category_full_ids = xml_element.elements['categoryFullIds'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['creatorUserId'] != nil
				self.creator_user_id = xml_element.elements['creatorUserId'].text
			end
		end

	end

	class KalturaCategoryUser < KalturaObjectBase
		attr_accessor :category_id
		# User id
		attr_accessor :user_id
		# Partner id
		attr_accessor :partner_id
		# Permission level
		attr_accessor :permission_level
		# Status
		attr_accessor :status
		# CategoryUser creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# CategoryUser update date as Unix timestamp (In seconds)
		attr_accessor :updated_at
		# Update method can be either manual or automatic to distinguish between manual operations (for example in KMC) on automatic - using bulk upload
		attr_accessor :update_method
		# The full ids of the Category
		attr_accessor :category_full_ids
		# Set of category-related permissions for the current category user.
		attr_accessor :permission_names

		def category_id=(val)
			@category_id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def permission_level=(val)
			@permission_level = val.to_i
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
		def update_method=(val)
			@update_method = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['categoryId'] != nil
				self.category_id = xml_element.elements['categoryId'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['permissionLevel'] != nil
				self.permission_level = xml_element.elements['permissionLevel'].text
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
			if xml_element.elements['updateMethod'] != nil
				self.update_method = xml_element.elements['updateMethod'].text
			end
			if xml_element.elements['categoryFullIds'] != nil
				self.category_full_ids = xml_element.elements['categoryFullIds'].text
			end
			if xml_element.elements['permissionNames'] != nil
				self.permission_names = xml_element.elements['permissionNames'].text
			end
		end

	end

	# Define client optional configurations
	#  /
	class KalturaClientConfiguration < KalturaObjectBase
		attr_accessor :client_tag
		attr_accessor :api_version


		def from_xml(xml_element)
			super
			if xml_element.elements['clientTag'] != nil
				self.client_tag = xml_element.elements['clientTag'].text
			end
			if xml_element.elements['apiVersion'] != nil
				self.api_version = xml_element.elements['apiVersion'].text
			end
		end

	end

	# Client notification object to hold the notification url and the data when sending client side notifications
	class KalturaClientNotification < KalturaObjectBase
		# The URL where the notification should be sent to
		attr_accessor :url
		# The serialized notification data to send
		attr_accessor :data


		def from_xml(xml_element)
			super
			if xml_element.elements['url'] != nil
				self.url = xml_element.elements['url'].text
			end
			if xml_element.elements['data'] != nil
				self.data = xml_element.elements['data'].text
			end
		end

	end

	class KalturaClipDescription < KalturaObjectBase
		attr_accessor :source_entry_id
		attr_accessor :start_time
		attr_accessor :duration
		attr_accessor :offset_in_destination

		def start_time=(val)
			@start_time = val.to_i
		end
		def duration=(val)
			@duration = val.to_i
		end
		def offset_in_destination=(val)
			@offset_in_destination = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['sourceEntryId'] != nil
				self.source_entry_id = xml_element.elements['sourceEntryId'].text
			end
			if xml_element.elements['startTime'] != nil
				self.start_time = xml_element.elements['startTime'].text
			end
			if xml_element.elements['duration'] != nil
				self.duration = xml_element.elements['duration'].text
			end
			if xml_element.elements['offsetInDestination'] != nil
				self.offset_in_destination = xml_element.elements['offsetInDestination'].text
			end
		end

	end

	class KalturaContext < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	class KalturaContextDataResult < KalturaObjectBase
		# Array of messages as received from the rules that invalidated
		attr_accessor :messages
		# Array of actions as received from the rules that invalidated
		attr_accessor :actions


		def from_xml(xml_element)
			super
			if xml_element.elements['messages'] != nil
				self.messages = KalturaClientBase.object_from_xml(xml_element.elements['messages'], 'KalturaString')
			end
			if xml_element.elements['actions'] != nil
				self.actions = KalturaClientBase.object_from_xml(xml_element.elements['actions'], 'KalturaRuleAction')
			end
		end

	end

	class KalturaControlPanelCommand < KalturaObjectBase
		# The id of the Category
		attr_accessor :id
		# Creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Creator name
		attr_accessor :created_by
		# Update date as Unix timestamp (In seconds)
		attr_accessor :updated_at
		# Updater name
		attr_accessor :updated_by
		# Creator id
		attr_accessor :created_by_id
		# The id of the scheduler that the command refers to
		attr_accessor :scheduler_id
		# The id of the scheduler worker that the command refers to
		attr_accessor :worker_id
		# The id of the scheduler worker as configured in the ini file
		attr_accessor :worker_configured_id
		# The name of the scheduler worker that the command refers to
		attr_accessor :worker_name
		# The index of the batch process that the command refers to
		attr_accessor :batch_index
		# The command type - stop / start / config
		attr_accessor :type
		# The command target type - data center / scheduler / job / job type
		attr_accessor :target_type
		# The command status
		attr_accessor :status
		# The reason for the command
		attr_accessor :cause
		# Command description
		attr_accessor :description
		# Error description
		attr_accessor :error_description

		def id=(val)
			@id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def created_by_id=(val)
			@created_by_id = val.to_i
		end
		def scheduler_id=(val)
			@scheduler_id = val.to_i
		end
		def worker_id=(val)
			@worker_id = val.to_i
		end
		def worker_configured_id=(val)
			@worker_configured_id = val.to_i
		end
		def worker_name=(val)
			@worker_name = val.to_i
		end
		def batch_index=(val)
			@batch_index = val.to_i
		end
		def type=(val)
			@type = val.to_i
		end
		def target_type=(val)
			@target_type = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['createdBy'] != nil
				self.created_by = xml_element.elements['createdBy'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['updatedBy'] != nil
				self.updated_by = xml_element.elements['updatedBy'].text
			end
			if xml_element.elements['createdById'] != nil
				self.created_by_id = xml_element.elements['createdById'].text
			end
			if xml_element.elements['schedulerId'] != nil
				self.scheduler_id = xml_element.elements['schedulerId'].text
			end
			if xml_element.elements['workerId'] != nil
				self.worker_id = xml_element.elements['workerId'].text
			end
			if xml_element.elements['workerConfiguredId'] != nil
				self.worker_configured_id = xml_element.elements['workerConfiguredId'].text
			end
			if xml_element.elements['workerName'] != nil
				self.worker_name = xml_element.elements['workerName'].text
			end
			if xml_element.elements['batchIndex'] != nil
				self.batch_index = xml_element.elements['batchIndex'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['targetType'] != nil
				self.target_type = xml_element.elements['targetType'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['cause'] != nil
				self.cause = xml_element.elements['cause'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['errorDescription'] != nil
				self.error_description = xml_element.elements['errorDescription'].text
			end
		end

	end

	class KalturaConversionAttribute < KalturaObjectBase
		# The id of the flavor params, set to null for source flavor
		attr_accessor :flavor_params_id
		# Attribute name
		attr_accessor :name
		# Attribute value
		attr_accessor :value

		def flavor_params_id=(val)
			@flavor_params_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['flavorParamsId'] != nil
				self.flavor_params_id = xml_element.elements['flavorParamsId'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	class KalturaCropDimensions < KalturaObjectBase
		# Crop left point
		attr_accessor :left
		# Crop top point
		attr_accessor :top
		# Crop width
		attr_accessor :width
		# Crop height
		attr_accessor :height

		def left=(val)
			@left = val.to_i
		end
		def top=(val)
			@top = val.to_i
		end
		def width=(val)
			@width = val.to_i
		end
		def height=(val)
			@height = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['left'] != nil
				self.left = xml_element.elements['left'].text
			end
			if xml_element.elements['top'] != nil
				self.top = xml_element.elements['top'].text
			end
			if xml_element.elements['width'] != nil
				self.width = xml_element.elements['width'].text
			end
			if xml_element.elements['height'] != nil
				self.height = xml_element.elements['height'].text
			end
		end

	end

	class KalturaPluginReplacementOptionsItem < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	# Advanced configuration for entry replacement process
	class KalturaEntryReplacementOptions < KalturaObjectBase
		# If true manually created thumbnails will not be deleted on entry replacement
		attr_accessor :keep_manual_thumbnails
		# Array of plugin replacement options
		attr_accessor :plugin_option_items

		def keep_manual_thumbnails=(val)
			@keep_manual_thumbnails = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['keepManualThumbnails'] != nil
				self.keep_manual_thumbnails = xml_element.elements['keepManualThumbnails'].text
			end
			if xml_element.elements['pluginOptionItems'] != nil
				self.plugin_option_items = KalturaClientBase.object_from_xml(xml_element.elements['pluginOptionItems'], 'KalturaPluginReplacementOptionsItem')
			end
		end

	end

	class KalturaConversionProfile < KalturaObjectBase
		# The id of the Conversion Profile
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :status
		attr_accessor :type
		# The name of the Conversion Profile
		attr_accessor :name
		# System name of the Conversion Profile
		attr_accessor :system_name
		# Comma separated tags
		attr_accessor :tags
		# The description of the Conversion Profile
		attr_accessor :description
		# ID of the default entry to be used for template data
		attr_accessor :default_entry_id
		# Creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# List of included flavor ids (comma separated)
		attr_accessor :flavor_params_ids
		# Indicates that this conversion profile is system default
		attr_accessor :is_default
		# Indicates that this conversion profile is partner default
		attr_accessor :is_partner_default
		# Cropping dimensions
		attr_accessor :crop_dimensions
		# Clipping start position (in miliseconds)
		attr_accessor :clip_start
		# Clipping duration (in miliseconds)
		attr_accessor :clip_duration
		# XSL to transform ingestion MRSS XML
		attr_accessor :xsl_transformation
		# ID of default storage profile to be used for linked net-storage file syncs
		attr_accessor :storage_profile_id
		# Media parser type to be used for extract media
		attr_accessor :media_parser_type
		# Should calculate file conversion complexity
		attr_accessor :calculate_complexity
		# Defines the tags that should be used to define 'collective'/group/multi-flavor processing,
		# 	 like 'mbr' or 'ism'
		attr_accessor :collection_tags
		# JSON string with array of "condition,profile-id" pairs.
		attr_accessor :conditional_profiles
		# When set, the ExtractMedia job should detect the source file GOP using this value as the max calculated period
		attr_accessor :detect_gop
		# XSL to transform ingestion Media Info XML
		attr_accessor :media_info_xsl_transformation
		# Default replacement options to be applied to entries
		attr_accessor :default_replacement_options
		attr_accessor :default_audio_lang

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def is_default=(val)
			@is_default = val.to_i
		end
		def is_partner_default=(val)
			@is_partner_default = to_b(val)
		end
		def clip_start=(val)
			@clip_start = val.to_i
		end
		def clip_duration=(val)
			@clip_duration = val.to_i
		end
		def storage_profile_id=(val)
			@storage_profile_id = val.to_i
		end
		def calculate_complexity=(val)
			@calculate_complexity = val.to_i
		end
		def detect_gop=(val)
			@detect_gop = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['systemName'] != nil
				self.system_name = xml_element.elements['systemName'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['defaultEntryId'] != nil
				self.default_entry_id = xml_element.elements['defaultEntryId'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['flavorParamsIds'] != nil
				self.flavor_params_ids = xml_element.elements['flavorParamsIds'].text
			end
			if xml_element.elements['isDefault'] != nil
				self.is_default = xml_element.elements['isDefault'].text
			end
			if xml_element.elements['isPartnerDefault'] != nil
				self.is_partner_default = xml_element.elements['isPartnerDefault'].text
			end
			if xml_element.elements['cropDimensions'] != nil
				self.crop_dimensions = KalturaClientBase.object_from_xml(xml_element.elements['cropDimensions'], 'KalturaCropDimensions')
			end
			if xml_element.elements['clipStart'] != nil
				self.clip_start = xml_element.elements['clipStart'].text
			end
			if xml_element.elements['clipDuration'] != nil
				self.clip_duration = xml_element.elements['clipDuration'].text
			end
			if xml_element.elements['xslTransformation'] != nil
				self.xsl_transformation = xml_element.elements['xslTransformation'].text
			end
			if xml_element.elements['storageProfileId'] != nil
				self.storage_profile_id = xml_element.elements['storageProfileId'].text
			end
			if xml_element.elements['mediaParserType'] != nil
				self.media_parser_type = xml_element.elements['mediaParserType'].text
			end
			if xml_element.elements['calculateComplexity'] != nil
				self.calculate_complexity = xml_element.elements['calculateComplexity'].text
			end
			if xml_element.elements['collectionTags'] != nil
				self.collection_tags = xml_element.elements['collectionTags'].text
			end
			if xml_element.elements['conditionalProfiles'] != nil
				self.conditional_profiles = xml_element.elements['conditionalProfiles'].text
			end
			if xml_element.elements['detectGOP'] != nil
				self.detect_gop = xml_element.elements['detectGOP'].text
			end
			if xml_element.elements['mediaInfoXslTransformation'] != nil
				self.media_info_xsl_transformation = xml_element.elements['mediaInfoXslTransformation'].text
			end
			if xml_element.elements['defaultReplacementOptions'] != nil
				self.default_replacement_options = KalturaClientBase.object_from_xml(xml_element.elements['defaultReplacementOptions'], 'KalturaEntryReplacementOptions')
			end
			if xml_element.elements['defaultAudioLang'] != nil
				self.default_audio_lang = xml_element.elements['defaultAudioLang'].text
			end
		end

	end

	class KalturaConversionProfileAssetParams < KalturaObjectBase
		# The id of the conversion profile
		attr_accessor :conversion_profile_id
		# The id of the asset params
		attr_accessor :asset_params_id
		# The ingestion origin of the asset params
		attr_accessor :ready_behavior
		# The ingestion origin of the asset params
		attr_accessor :origin
		# Asset params system name
		attr_accessor :system_name
		# Starts conversion even if the decision layer reduced the configuration to comply with the source
		attr_accessor :force_none_complied
		# Specifies how to treat the flavor after conversion is finished
		attr_accessor :delete_policy
		attr_accessor :is_encrypted
		attr_accessor :content_awareness
		attr_accessor :chunked_encode_mode
		attr_accessor :two_pass
		attr_accessor :tags
		# JSON string containing an array of flavotParams field-value pairs.
		attr_accessor :overload_params

		def conversion_profile_id=(val)
			@conversion_profile_id = val.to_i
		end
		def asset_params_id=(val)
			@asset_params_id = val.to_i
		end
		def ready_behavior=(val)
			@ready_behavior = val.to_i
		end
		def origin=(val)
			@origin = val.to_i
		end
		def force_none_complied=(val)
			@force_none_complied = val.to_i
		end
		def delete_policy=(val)
			@delete_policy = val.to_i
		end
		def is_encrypted=(val)
			@is_encrypted = val.to_i
		end
		def content_awareness=(val)
			@content_awareness = val.to_f
		end
		def chunked_encode_mode=(val)
			@chunked_encode_mode = val.to_i
		end
		def two_pass=(val)
			@two_pass = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['conversionProfileId'] != nil
				self.conversion_profile_id = xml_element.elements['conversionProfileId'].text
			end
			if xml_element.elements['assetParamsId'] != nil
				self.asset_params_id = xml_element.elements['assetParamsId'].text
			end
			if xml_element.elements['readyBehavior'] != nil
				self.ready_behavior = xml_element.elements['readyBehavior'].text
			end
			if xml_element.elements['origin'] != nil
				self.origin = xml_element.elements['origin'].text
			end
			if xml_element.elements['systemName'] != nil
				self.system_name = xml_element.elements['systemName'].text
			end
			if xml_element.elements['forceNoneComplied'] != nil
				self.force_none_complied = xml_element.elements['forceNoneComplied'].text
			end
			if xml_element.elements['deletePolicy'] != nil
				self.delete_policy = xml_element.elements['deletePolicy'].text
			end
			if xml_element.elements['isEncrypted'] != nil
				self.is_encrypted = xml_element.elements['isEncrypted'].text
			end
			if xml_element.elements['contentAwareness'] != nil
				self.content_awareness = xml_element.elements['contentAwareness'].text
			end
			if xml_element.elements['chunkedEncodeMode'] != nil
				self.chunked_encode_mode = xml_element.elements['chunkedEncodeMode'].text
			end
			if xml_element.elements['twoPass'] != nil
				self.two_pass = xml_element.elements['twoPass'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['overloadParams'] != nil
				self.overload_params = xml_element.elements['overloadParams'].text
			end
		end

	end

	class KalturaConvertCollectionFlavorData < KalturaObjectBase
		attr_accessor :flavor_asset_id
		attr_accessor :flavor_params_output_id
		attr_accessor :ready_behavior
		attr_accessor :video_bitrate
		attr_accessor :audio_bitrate
		attr_accessor :dest_file_sync_local_path
		attr_accessor :dest_file_sync_remote_url

		def flavor_params_output_id=(val)
			@flavor_params_output_id = val.to_i
		end
		def ready_behavior=(val)
			@ready_behavior = val.to_i
		end
		def video_bitrate=(val)
			@video_bitrate = val.to_i
		end
		def audio_bitrate=(val)
			@audio_bitrate = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['flavorAssetId'] != nil
				self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			end
			if xml_element.elements['flavorParamsOutputId'] != nil
				self.flavor_params_output_id = xml_element.elements['flavorParamsOutputId'].text
			end
			if xml_element.elements['readyBehavior'] != nil
				self.ready_behavior = xml_element.elements['readyBehavior'].text
			end
			if xml_element.elements['videoBitrate'] != nil
				self.video_bitrate = xml_element.elements['videoBitrate'].text
			end
			if xml_element.elements['audioBitrate'] != nil
				self.audio_bitrate = xml_element.elements['audioBitrate'].text
			end
			if xml_element.elements['destFileSyncLocalPath'] != nil
				self.dest_file_sync_local_path = xml_element.elements['destFileSyncLocalPath'].text
			end
			if xml_element.elements['destFileSyncRemoteUrl'] != nil
				self.dest_file_sync_remote_url = xml_element.elements['destFileSyncRemoteUrl'].text
			end
		end

	end

	class KalturaCoordinate < KalturaObjectBase
		attr_accessor :latitude
		attr_accessor :longitude
		attr_accessor :name

		def latitude=(val)
			@latitude = val.to_f
		end
		def longitude=(val)
			@longitude = val.to_f
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['latitude'] != nil
				self.latitude = xml_element.elements['latitude'].text
			end
			if xml_element.elements['longitude'] != nil
				self.longitude = xml_element.elements['longitude'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
		end

	end

	class KalturaCsvAdditionalFieldInfo < KalturaObjectBase
		attr_accessor :field_name
		attr_accessor :xpath


		def from_xml(xml_element)
			super
			if xml_element.elements['fieldName'] != nil
				self.field_name = xml_element.elements['fieldName'].text
			end
			if xml_element.elements['xpath'] != nil
				self.xpath = xml_element.elements['xpath'].text
			end
		end

	end

	class KalturaDataEntry < KalturaBaseEntry
		# The data of the entry
		attr_accessor :data_content
		# indicator whether to return the object for get action with the dataContent field.
		attr_accessor :retrieve_data_content_by_get

		def retrieve_data_content_by_get=(val)
			@retrieve_data_content_by_get = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['dataContent'] != nil
				self.data_content = xml_element.elements['dataContent'].text
			end
			if xml_element.elements['retrieveDataContentByGet'] != nil
				self.retrieve_data_content_by_get = xml_element.elements['retrieveDataContentByGet'].text
			end
		end

	end

	class KalturaUrlRecognizer < KalturaObjectBase
		# The hosts that are recognized
		attr_accessor :hosts
		# The URI prefix we use for security
		attr_accessor :uri_prefix


		def from_xml(xml_element)
			super
			if xml_element.elements['hosts'] != nil
				self.hosts = xml_element.elements['hosts'].text
			end
			if xml_element.elements['uriPrefix'] != nil
				self.uri_prefix = xml_element.elements['uriPrefix'].text
			end
		end

	end

	class KalturaUrlTokenizer < KalturaObjectBase
		# Window
		attr_accessor :window
		# key
		attr_accessor :key
		attr_accessor :limit_ip_address

		def window=(val)
			@window = val.to_i
		end
		def limit_ip_address=(val)
			@limit_ip_address = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['window'] != nil
				self.window = xml_element.elements['window'].text
			end
			if xml_element.elements['key'] != nil
				self.key = xml_element.elements['key'].text
			end
			if xml_element.elements['limitIpAddress'] != nil
				self.limit_ip_address = xml_element.elements['limitIpAddress'].text
			end
		end

	end

	class KalturaSearchItem < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFilter < KalturaObjectBase
		attr_accessor :order_by
		attr_accessor :advanced_search


		def from_xml(xml_element)
			super
			if xml_element.elements['orderBy'] != nil
				self.order_by = xml_element.elements['orderBy'].text
			end
			if xml_element.elements['advancedSearch'] != nil
				self.advanced_search = KalturaClientBase.object_from_xml(xml_element.elements['advancedSearch'], 'KalturaSearchItem')
			end
		end

	end

	class KalturaRelatedFilter < KalturaFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAssetBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :entry_id_equal
		attr_accessor :entry_id_in
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :size_greater_than_or_equal
		attr_accessor :size_less_than_or_equal
		attr_accessor :tags_like
		attr_accessor :tags_multi_like_or
		attr_accessor :tags_multi_like_and
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :deleted_at_greater_than_or_equal
		attr_accessor :deleted_at_less_than_or_equal

		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
		end
		def size_greater_than_or_equal=(val)
			@size_greater_than_or_equal = val.to_i
		end
		def size_less_than_or_equal=(val)
			@size_less_than_or_equal = val.to_i
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
		def deleted_at_greater_than_or_equal=(val)
			@deleted_at_greater_than_or_equal = val.to_i
		end
		def deleted_at_less_than_or_equal=(val)
			@deleted_at_less_than_or_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['entryIdEqual'] != nil
				self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			end
			if xml_element.elements['entryIdIn'] != nil
				self.entry_id_in = xml_element.elements['entryIdIn'].text
			end
			if xml_element.elements['partnerIdEqual'] != nil
				self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			end
			if xml_element.elements['partnerIdIn'] != nil
				self.partner_id_in = xml_element.elements['partnerIdIn'].text
			end
			if xml_element.elements['sizeGreaterThanOrEqual'] != nil
				self.size_greater_than_or_equal = xml_element.elements['sizeGreaterThanOrEqual'].text
			end
			if xml_element.elements['sizeLessThanOrEqual'] != nil
				self.size_less_than_or_equal = xml_element.elements['sizeLessThanOrEqual'].text
			end
			if xml_element.elements['tagsLike'] != nil
				self.tags_like = xml_element.elements['tagsLike'].text
			end
			if xml_element.elements['tagsMultiLikeOr'] != nil
				self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			end
			if xml_element.elements['tagsMultiLikeAnd'] != nil
				self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
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
			if xml_element.elements['deletedAtGreaterThanOrEqual'] != nil
				self.deleted_at_greater_than_or_equal = xml_element.elements['deletedAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['deletedAtLessThanOrEqual'] != nil
				self.deleted_at_less_than_or_equal = xml_element.elements['deletedAtLessThanOrEqual'].text
			end
		end

	end

	class KalturaAssetFilter < KalturaAssetBaseFilter
		attr_accessor :type_in


		def from_xml(xml_element)
			super
			if xml_element.elements['typeIn'] != nil
				self.type_in = xml_element.elements['typeIn'].text
			end
		end

	end

	class KalturaDeliveryProfile < KalturaObjectBase
		# The id of the Delivery
		attr_accessor :id
		attr_accessor :partner_id
		# The name of the Delivery
		attr_accessor :name
		# Delivery type
		attr_accessor :type
		# System name of the delivery
		attr_accessor :system_name
		# The description of the Delivery
		attr_accessor :description
		# Creation time as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Update time as Unix timestamp (In seconds)
		attr_accessor :updated_at
		attr_accessor :streamer_type
		attr_accessor :url
		# the host part of the url
		attr_accessor :host_name
		attr_accessor :status
		attr_accessor :recognizer
		attr_accessor :tokenizer
		# True if this is the systemwide default for the protocol
		attr_accessor :is_default
		# the object from which this object was cloned (or 0)
		attr_accessor :parent_id
		# Comma separated list of supported media protocols. f.i. rtmpe
		attr_accessor :media_protocols
		# priority used for ordering similar delivery profiles
		attr_accessor :priority
		# Extra query string parameters that should be added to the url
		attr_accessor :extra_params
		# A filter that can be used to include additional assets in the URL (e.g. captions)
		attr_accessor :supplementary_assets_filter

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def is_default=(val)
			@is_default = val.to_i
		end
		def parent_id=(val)
			@parent_id = val.to_i
		end
		def priority=(val)
			@priority = val.to_i
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
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['systemName'] != nil
				self.system_name = xml_element.elements['systemName'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['streamerType'] != nil
				self.streamer_type = xml_element.elements['streamerType'].text
			end
			if xml_element.elements['url'] != nil
				self.url = xml_element.elements['url'].text
			end
			if xml_element.elements['hostName'] != nil
				self.host_name = xml_element.elements['hostName'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['recognizer'] != nil
				self.recognizer = KalturaClientBase.object_from_xml(xml_element.elements['recognizer'], 'KalturaUrlRecognizer')
			end
			if xml_element.elements['tokenizer'] != nil
				self.tokenizer = KalturaClientBase.object_from_xml(xml_element.elements['tokenizer'], 'KalturaUrlTokenizer')
			end
			if xml_element.elements['isDefault'] != nil
				self.is_default = xml_element.elements['isDefault'].text
			end
			if xml_element.elements['parentId'] != nil
				self.parent_id = xml_element.elements['parentId'].text
			end
			if xml_element.elements['mediaProtocols'] != nil
				self.media_protocols = xml_element.elements['mediaProtocols'].text
			end
			if xml_element.elements['priority'] != nil
				self.priority = xml_element.elements['priority'].text
			end
			if xml_element.elements['extraParams'] != nil
				self.extra_params = xml_element.elements['extraParams'].text
			end
			if xml_element.elements['supplementaryAssetsFilter'] != nil
				self.supplementary_assets_filter = KalturaClientBase.object_from_xml(xml_element.elements['supplementaryAssetsFilter'], 'KalturaAssetFilter')
			end
		end

	end

	class KalturaFileSyncDescriptor < KalturaObjectBase
		attr_accessor :file_sync_local_path
		attr_accessor :file_encryption_key
		# The translated path as used by the scheduler
		attr_accessor :file_sync_remote_url
		attr_accessor :file_sync_object_sub_type

		def file_sync_object_sub_type=(val)
			@file_sync_object_sub_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['fileSyncLocalPath'] != nil
				self.file_sync_local_path = xml_element.elements['fileSyncLocalPath'].text
			end
			if xml_element.elements['fileEncryptionKey'] != nil
				self.file_encryption_key = xml_element.elements['fileEncryptionKey'].text
			end
			if xml_element.elements['fileSyncRemoteUrl'] != nil
				self.file_sync_remote_url = xml_element.elements['fileSyncRemoteUrl'].text
			end
			if xml_element.elements['fileSyncObjectSubType'] != nil
				self.file_sync_object_sub_type = xml_element.elements['fileSyncObjectSubType'].text
			end
		end

	end

	class KalturaDestFileSyncDescriptor < KalturaFileSyncDescriptor


		def from_xml(xml_element)
			super
		end

	end

	# The KalturaPager object enables paging management to be applied upon service list/search actions.
	class KalturaPager < KalturaObjectBase
		# The number of objects to retrieve. (Default is 30, maximum page size is 500).
		attr_accessor :page_size
		# The page number for which {pageSize} of objects should be retrieved (Default is 1).
		attr_accessor :page_index

		def page_size=(val)
			@page_size = val.to_i
		end
		def page_index=(val)
			@page_index = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['pageSize'] != nil
				self.page_size = xml_element.elements['pageSize'].text
			end
			if xml_element.elements['pageIndex'] != nil
				self.page_index = xml_element.elements['pageIndex'].text
			end
		end

	end

	# The KalturaFilterPager object enables paging management to be applied upon service list actions.
	class KalturaFilterPager < KalturaPager


		def from_xml(xml_element)
			super
		end

	end

	class KalturaResponseProfileMapping < KalturaObjectBase
		attr_accessor :parent_property
		attr_accessor :filter_property
		attr_accessor :allow_null

		def allow_null=(val)
			@allow_null = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['parentProperty'] != nil
				self.parent_property = xml_element.elements['parentProperty'].text
			end
			if xml_element.elements['filterProperty'] != nil
				self.filter_property = xml_element.elements['filterProperty'].text
			end
			if xml_element.elements['allowNull'] != nil
				self.allow_null = xml_element.elements['allowNull'].text
			end
		end

	end

	class KalturaDetachedResponseProfile < KalturaBaseResponseProfile
		# Friendly name
		attr_accessor :name
		attr_accessor :type
		# Comma separated fields list to be included or excluded
		attr_accessor :fields
		attr_accessor :filter
		attr_accessor :pager
		attr_accessor :related_profiles
		attr_accessor :mappings

		def type=(val)
			@type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['fields'] != nil
				self.fields = xml_element.elements['fields'].text
			end
			if xml_element.elements['filter'] != nil
				self.filter = KalturaClientBase.object_from_xml(xml_element.elements['filter'], 'KalturaRelatedFilter')
			end
			if xml_element.elements['pager'] != nil
				self.pager = KalturaClientBase.object_from_xml(xml_element.elements['pager'], 'KalturaFilterPager')
			end
			if xml_element.elements['relatedProfiles'] != nil
				self.related_profiles = KalturaClientBase.object_from_xml(xml_element.elements['relatedProfiles'], 'KalturaDetachedResponseProfile')
			end
			if xml_element.elements['mappings'] != nil
				self.mappings = KalturaClientBase.object_from_xml(xml_element.elements['mappings'], 'KalturaResponseProfileMapping')
			end
		end

	end

	class KalturaPluginData < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDrmPlaybackPluginData < KalturaPluginData
		attr_accessor :scheme
		attr_accessor :license_url


		def from_xml(xml_element)
			super
			if xml_element.elements['scheme'] != nil
				self.scheme = xml_element.elements['scheme'].text
			end
			if xml_element.elements['licenseURL'] != nil
				self.license_url = xml_element.elements['licenseURL'].text
			end
		end

	end

	class KalturaUser < KalturaObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :type
		attr_accessor :screen_name
		attr_accessor :full_name
		attr_accessor :email
		attr_accessor :date_of_birth
		attr_accessor :country
		attr_accessor :state
		attr_accessor :city
		attr_accessor :zip
		attr_accessor :thumbnail_url
		attr_accessor :description
		attr_accessor :tags
		# Admin tags can be updated only by using an admin session
		attr_accessor :admin_tags
		attr_accessor :gender
		attr_accessor :status
		# Creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Last update date as Unix timestamp (In seconds)
		attr_accessor :updated_at
		# Can be used to store various partner related data as a string
		attr_accessor :partner_data
		attr_accessor :indexed_partner_data_int
		attr_accessor :indexed_partner_data_string
		attr_accessor :storage_size
		attr_accessor :password
		attr_accessor :first_name
		attr_accessor :last_name
		attr_accessor :is_admin
		attr_accessor :language
		attr_accessor :last_login_time
		attr_accessor :status_updated_at
		attr_accessor :deleted_at
		attr_accessor :login_enabled
		attr_accessor :role_ids
		attr_accessor :role_names
		attr_accessor :is_account_owner
		attr_accessor :allowed_partner_ids
		attr_accessor :allowed_partner_packages
		attr_accessor :user_mode

		def partner_id=(val)
			@partner_id = val.to_i
		end
		def type=(val)
			@type = val.to_i
		end
		def date_of_birth=(val)
			@date_of_birth = val.to_i
		end
		def gender=(val)
			@gender = val.to_i
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
		def indexed_partner_data_int=(val)
			@indexed_partner_data_int = val.to_i
		end
		def storage_size=(val)
			@storage_size = val.to_i
		end
		def is_admin=(val)
			@is_admin = to_b(val)
		end
		def last_login_time=(val)
			@last_login_time = val.to_i
		end
		def status_updated_at=(val)
			@status_updated_at = val.to_i
		end
		def deleted_at=(val)
			@deleted_at = val.to_i
		end
		def login_enabled=(val)
			@login_enabled = to_b(val)
		end
		def is_account_owner=(val)
			@is_account_owner = to_b(val)
		end
		def user_mode=(val)
			@user_mode = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['screenName'] != nil
				self.screen_name = xml_element.elements['screenName'].text
			end
			if xml_element.elements['fullName'] != nil
				self.full_name = xml_element.elements['fullName'].text
			end
			if xml_element.elements['email'] != nil
				self.email = xml_element.elements['email'].text
			end
			if xml_element.elements['dateOfBirth'] != nil
				self.date_of_birth = xml_element.elements['dateOfBirth'].text
			end
			if xml_element.elements['country'] != nil
				self.country = xml_element.elements['country'].text
			end
			if xml_element.elements['state'] != nil
				self.state = xml_element.elements['state'].text
			end
			if xml_element.elements['city'] != nil
				self.city = xml_element.elements['city'].text
			end
			if xml_element.elements['zip'] != nil
				self.zip = xml_element.elements['zip'].text
			end
			if xml_element.elements['thumbnailUrl'] != nil
				self.thumbnail_url = xml_element.elements['thumbnailUrl'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['adminTags'] != nil
				self.admin_tags = xml_element.elements['adminTags'].text
			end
			if xml_element.elements['gender'] != nil
				self.gender = xml_element.elements['gender'].text
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
			if xml_element.elements['partnerData'] != nil
				self.partner_data = xml_element.elements['partnerData'].text
			end
			if xml_element.elements['indexedPartnerDataInt'] != nil
				self.indexed_partner_data_int = xml_element.elements['indexedPartnerDataInt'].text
			end
			if xml_element.elements['indexedPartnerDataString'] != nil
				self.indexed_partner_data_string = xml_element.elements['indexedPartnerDataString'].text
			end
			if xml_element.elements['storageSize'] != nil
				self.storage_size = xml_element.elements['storageSize'].text
			end
			if xml_element.elements['password'] != nil
				self.password = xml_element.elements['password'].text
			end
			if xml_element.elements['firstName'] != nil
				self.first_name = xml_element.elements['firstName'].text
			end
			if xml_element.elements['lastName'] != nil
				self.last_name = xml_element.elements['lastName'].text
			end
			if xml_element.elements['isAdmin'] != nil
				self.is_admin = xml_element.elements['isAdmin'].text
			end
			if xml_element.elements['language'] != nil
				self.language = xml_element.elements['language'].text
			end
			if xml_element.elements['lastLoginTime'] != nil
				self.last_login_time = xml_element.elements['lastLoginTime'].text
			end
			if xml_element.elements['statusUpdatedAt'] != nil
				self.status_updated_at = xml_element.elements['statusUpdatedAt'].text
			end
			if xml_element.elements['deletedAt'] != nil
				self.deleted_at = xml_element.elements['deletedAt'].text
			end
			if xml_element.elements['loginEnabled'] != nil
				self.login_enabled = xml_element.elements['loginEnabled'].text
			end
			if xml_element.elements['roleIds'] != nil
				self.role_ids = xml_element.elements['roleIds'].text
			end
			if xml_element.elements['roleNames'] != nil
				self.role_names = xml_element.elements['roleNames'].text
			end
			if xml_element.elements['isAccountOwner'] != nil
				self.is_account_owner = xml_element.elements['isAccountOwner'].text
			end
			if xml_element.elements['allowedPartnerIds'] != nil
				self.allowed_partner_ids = xml_element.elements['allowedPartnerIds'].text
			end
			if xml_element.elements['allowedPartnerPackages'] != nil
				self.allowed_partner_packages = xml_element.elements['allowedPartnerPackages'].text
			end
			if xml_element.elements['userMode'] != nil
				self.user_mode = xml_element.elements['userMode'].text
			end
		end

	end

	# Effects attributes
	class KalturaEffect < KalturaObjectBase
		attr_accessor :effect_type
		# value
		attr_accessor :value

		def effect_type=(val)
			@effect_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['effectType'] != nil
				self.effect_type = xml_element.elements['effectType'].text
			end
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	class KalturaEmailIngestionProfile < KalturaObjectBase
		attr_accessor :id
		attr_accessor :name
		attr_accessor :description
		attr_accessor :email_address
		attr_accessor :mailbox_id
		attr_accessor :partner_id
		attr_accessor :conversion_profile2id
		attr_accessor :moderation_status
		attr_accessor :status
		attr_accessor :created_at
		attr_accessor :default_category
		attr_accessor :default_user_id
		attr_accessor :default_tags
		attr_accessor :default_admin_tags
		attr_accessor :max_attachment_size_kbytes
		attr_accessor :max_attachments_per_mail

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def conversion_profile2id=(val)
			@conversion_profile2id = val.to_i
		end
		def moderation_status=(val)
			@moderation_status = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def max_attachment_size_kbytes=(val)
			@max_attachment_size_kbytes = val.to_i
		end
		def max_attachments_per_mail=(val)
			@max_attachments_per_mail = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['emailAddress'] != nil
				self.email_address = xml_element.elements['emailAddress'].text
			end
			if xml_element.elements['mailboxId'] != nil
				self.mailbox_id = xml_element.elements['mailboxId'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['conversionProfile2Id'] != nil
				self.conversion_profile2id = xml_element.elements['conversionProfile2Id'].text
			end
			if xml_element.elements['moderationStatus'] != nil
				self.moderation_status = xml_element.elements['moderationStatus'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['defaultCategory'] != nil
				self.default_category = xml_element.elements['defaultCategory'].text
			end
			if xml_element.elements['defaultUserId'] != nil
				self.default_user_id = xml_element.elements['defaultUserId'].text
			end
			if xml_element.elements['defaultTags'] != nil
				self.default_tags = xml_element.elements['defaultTags'].text
			end
			if xml_element.elements['defaultAdminTags'] != nil
				self.default_admin_tags = xml_element.elements['defaultAdminTags'].text
			end
			if xml_element.elements['maxAttachmentSizeKbytes'] != nil
				self.max_attachment_size_kbytes = xml_element.elements['maxAttachmentSizeKbytes'].text
			end
			if xml_element.elements['maxAttachmentsPerMail'] != nil
				self.max_attachments_per_mail = xml_element.elements['maxAttachmentsPerMail'].text
			end
		end

	end

	# A string representation to return an array of strings
	class KalturaStringValue < KalturaValue
		attr_accessor :value


		def from_xml(xml_element)
			super
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	class KalturaEntryServerNode < KalturaObjectBase
		# unique auto-generated identifier
		attr_accessor :id
		attr_accessor :entry_id
		attr_accessor :server_node_id
		attr_accessor :partner_id
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :status
		attr_accessor :server_type

		def id=(val)
			@id = val.to_i
		end
		def server_node_id=(val)
			@server_node_id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['serverNodeId'] != nil
				self.server_node_id = xml_element.elements['serverNodeId'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['serverType'] != nil
				self.server_type = xml_element.elements['serverType'].text
			end
		end

	end

	# Configuration for extended item in the Kaltura MRSS feeds
	class KalturaObjectIdentifier < KalturaObjectBase
		# Comma separated string of enum values denoting which features of the item need to be included in the MRSS
		attr_accessor :extended_features


		def from_xml(xml_element)
			super
			if xml_element.elements['extendedFeatures'] != nil
				self.extended_features = xml_element.elements['extendedFeatures'].text
			end
		end

	end

	class KalturaExtendingItemMrssParameter < KalturaObjectBase
		# XPath for the extending item
		attr_accessor :xpath
		# Object identifier
		attr_accessor :identifier
		# Mode of extension - append to MRSS or replace the xpath content.
		attr_accessor :extension_mode

		def extension_mode=(val)
			@extension_mode = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['xpath'] != nil
				self.xpath = xml_element.elements['xpath'].text
			end
			if xml_element.elements['identifier'] != nil
				self.identifier = KalturaClientBase.object_from_xml(xml_element.elements['identifier'], 'KalturaObjectIdentifier')
			end
			if xml_element.elements['extensionMode'] != nil
				self.extension_mode = xml_element.elements['extensionMode'].text
			end
		end

	end

	class KalturaPlayableEntry < KalturaBaseEntry
		# Number of plays
		attr_accessor :plays
		# Number of views
		attr_accessor :views
		# The last time the entry was played
		attr_accessor :last_played_at
		# The width in pixels
		attr_accessor :width
		# The height in pixels
		attr_accessor :height
		# The duration in seconds
		attr_accessor :duration
		# The duration in miliseconds
		attr_accessor :ms_duration
		# The duration type (short for 0-4 mins, medium for 4-20 mins, long for 20+ mins)
		attr_accessor :duration_type

		def plays=(val)
			@plays = val.to_i
		end
		def views=(val)
			@views = val.to_i
		end
		def last_played_at=(val)
			@last_played_at = val.to_i
		end
		def width=(val)
			@width = val.to_i
		end
		def height=(val)
			@height = val.to_i
		end
		def duration=(val)
			@duration = val.to_i
		end
		def ms_duration=(val)
			@ms_duration = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['plays'] != nil
				self.plays = xml_element.elements['plays'].text
			end
			if xml_element.elements['views'] != nil
				self.views = xml_element.elements['views'].text
			end
			if xml_element.elements['lastPlayedAt'] != nil
				self.last_played_at = xml_element.elements['lastPlayedAt'].text
			end
			if xml_element.elements['width'] != nil
				self.width = xml_element.elements['width'].text
			end
			if xml_element.elements['height'] != nil
				self.height = xml_element.elements['height'].text
			end
			if xml_element.elements['duration'] != nil
				self.duration = xml_element.elements['duration'].text
			end
			if xml_element.elements['msDuration'] != nil
				self.ms_duration = xml_element.elements['msDuration'].text
			end
			if xml_element.elements['durationType'] != nil
				self.duration_type = xml_element.elements['durationType'].text
			end
		end

	end

	class KalturaStreamContainer < KalturaObjectBase
		attr_accessor :type
		attr_accessor :track_index
		attr_accessor :language
		attr_accessor :channel_index
		attr_accessor :label
		attr_accessor :channel_layout

		def track_index=(val)
			@track_index = val.to_i
		end
		def channel_index=(val)
			@channel_index = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['trackIndex'] != nil
				self.track_index = xml_element.elements['trackIndex'].text
			end
			if xml_element.elements['language'] != nil
				self.language = xml_element.elements['language'].text
			end
			if xml_element.elements['channelIndex'] != nil
				self.channel_index = xml_element.elements['channelIndex'].text
			end
			if xml_element.elements['label'] != nil
				self.label = xml_element.elements['label'].text
			end
			if xml_element.elements['channelLayout'] != nil
				self.channel_layout = xml_element.elements['channelLayout'].text
			end
		end

	end

	class KalturaMediaEntry < KalturaPlayableEntry
		# The media type of the entry
		attr_accessor :media_type
		# Override the default conversion quality
		attr_accessor :conversion_quality
		# The source type of the entry
		attr_accessor :source_type
		# The search provider type used to import this entry
		attr_accessor :search_provider_type
		# The ID of the media in the importing site
		attr_accessor :search_provider_id
		# The user name used for credits
		attr_accessor :credit_user_name
		# The URL for credits
		attr_accessor :credit_url
		# The media date extracted from EXIF data (For images) as Unix timestamp (In seconds)
		attr_accessor :media_date
		# The URL used for playback. This is not the download URL.
		attr_accessor :data_url
		# Comma separated flavor params ids that exists for this media entry
		attr_accessor :flavor_params_ids
		# True if trim action is disabled for this entry
		attr_accessor :is_trim_disabled
		# Array of streams that exists on the entry
		attr_accessor :streams

		def media_type=(val)
			@media_type = val.to_i
		end
		def search_provider_type=(val)
			@search_provider_type = val.to_i
		end
		def media_date=(val)
			@media_date = val.to_i
		end
		def is_trim_disabled=(val)
			@is_trim_disabled = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['mediaType'] != nil
				self.media_type = xml_element.elements['mediaType'].text
			end
			if xml_element.elements['conversionQuality'] != nil
				self.conversion_quality = xml_element.elements['conversionQuality'].text
			end
			if xml_element.elements['sourceType'] != nil
				self.source_type = xml_element.elements['sourceType'].text
			end
			if xml_element.elements['searchProviderType'] != nil
				self.search_provider_type = xml_element.elements['searchProviderType'].text
			end
			if xml_element.elements['searchProviderId'] != nil
				self.search_provider_id = xml_element.elements['searchProviderId'].text
			end
			if xml_element.elements['creditUserName'] != nil
				self.credit_user_name = xml_element.elements['creditUserName'].text
			end
			if xml_element.elements['creditUrl'] != nil
				self.credit_url = xml_element.elements['creditUrl'].text
			end
			if xml_element.elements['mediaDate'] != nil
				self.media_date = xml_element.elements['mediaDate'].text
			end
			if xml_element.elements['dataUrl'] != nil
				self.data_url = xml_element.elements['dataUrl'].text
			end
			if xml_element.elements['flavorParamsIds'] != nil
				self.flavor_params_ids = xml_element.elements['flavorParamsIds'].text
			end
			if xml_element.elements['isTrimDisabled'] != nil
				self.is_trim_disabled = xml_element.elements['isTrimDisabled'].text
			end
			if xml_element.elements['streams'] != nil
				self.streams = KalturaClientBase.object_from_xml(xml_element.elements['streams'], 'KalturaStreamContainer')
			end
		end

	end

	class KalturaFeatureStatus < KalturaObjectBase
		attr_accessor :type
		attr_accessor :value

		def type=(val)
			@type = val.to_i
		end
		def value=(val)
			@value = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	class KalturaFileAsset < KalturaObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :file_asset_object_type
		attr_accessor :object_id
		attr_accessor :name
		attr_accessor :system_name
		attr_accessor :file_ext
		attr_accessor :version
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :status

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def version=(val)
			@version = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['fileAssetObjectType'] != nil
				self.file_asset_object_type = xml_element.elements['fileAssetObjectType'].text
			end
			if xml_element.elements['objectId'] != nil
				self.object_id = xml_element.elements['objectId'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['systemName'] != nil
				self.system_name = xml_element.elements['systemName'].text
			end
			if xml_element.elements['fileExt'] != nil
				self.file_ext = xml_element.elements['fileExt'].text
			end
			if xml_element.elements['version'] != nil
				self.version = xml_element.elements['version'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
		end

	end

	class KalturaFileContainer < KalturaObjectBase
		attr_accessor :file_path
		attr_accessor :encryption_key
		attr_accessor :file_size

		def file_size=(val)
			@file_size = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['filePath'] != nil
				self.file_path = xml_element.elements['filePath'].text
			end
			if xml_element.elements['encryptionKey'] != nil
				self.encryption_key = xml_element.elements['encryptionKey'].text
			end
			if xml_element.elements['fileSize'] != nil
				self.file_size = xml_element.elements['fileSize'].text
			end
		end

	end

	class KalturaFlavorAsset < KalturaAsset
		# The Flavor Params used to create this Flavor Asset
		attr_accessor :flavor_params_id
		# The width of the Flavor Asset
		attr_accessor :width
		# The height of the Flavor Asset
		attr_accessor :height
		# The overall bitrate (in KBits) of the Flavor Asset
		attr_accessor :bitrate
		# The frame rate (in FPS) of the Flavor Asset
		attr_accessor :frame_rate
		# True if this Flavor Asset is the original source
		attr_accessor :is_original
		# True if this Flavor Asset is playable in KDP
		attr_accessor :is_web
		# The container format
		attr_accessor :container_format
		# The video codec
		attr_accessor :video_codec_id
		# The status of the Flavor Asset
		attr_accessor :status
		# The language of the flavor asset
		attr_accessor :language
		# The label of the flavor asset
		attr_accessor :label
		# Is default flavor asset of the entry (This field will be taken into account selectign which audio flavor will be selected as default)
		attr_accessor :is_default

		def flavor_params_id=(val)
			@flavor_params_id = val.to_i
		end
		def width=(val)
			@width = val.to_i
		end
		def height=(val)
			@height = val.to_i
		end
		def bitrate=(val)
			@bitrate = val.to_i
		end
		def frame_rate=(val)
			@frame_rate = val.to_f
		end
		def is_original=(val)
			@is_original = to_b(val)
		end
		def is_web=(val)
			@is_web = to_b(val)
		end
		def status=(val)
			@status = val.to_i
		end
		def is_default=(val)
			@is_default = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['flavorParamsId'] != nil
				self.flavor_params_id = xml_element.elements['flavorParamsId'].text
			end
			if xml_element.elements['width'] != nil
				self.width = xml_element.elements['width'].text
			end
			if xml_element.elements['height'] != nil
				self.height = xml_element.elements['height'].text
			end
			if xml_element.elements['bitrate'] != nil
				self.bitrate = xml_element.elements['bitrate'].text
			end
			if xml_element.elements['frameRate'] != nil
				self.frame_rate = xml_element.elements['frameRate'].text
			end
			if xml_element.elements['isOriginal'] != nil
				self.is_original = xml_element.elements['isOriginal'].text
			end
			if xml_element.elements['isWeb'] != nil
				self.is_web = xml_element.elements['isWeb'].text
			end
			if xml_element.elements['containerFormat'] != nil
				self.container_format = xml_element.elements['containerFormat'].text
			end
			if xml_element.elements['videoCodecId'] != nil
				self.video_codec_id = xml_element.elements['videoCodecId'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['language'] != nil
				self.language = xml_element.elements['language'].text
			end
			if xml_element.elements['label'] != nil
				self.label = xml_element.elements['label'].text
			end
			if xml_element.elements['isDefault'] != nil
				self.is_default = xml_element.elements['isDefault'].text
			end
		end

	end

	class KalturaFlavorAssetUrlOptions < KalturaObjectBase
		# The name of the downloaded file
		attr_accessor :file_name
		attr_accessor :referrer


		def from_xml(xml_element)
			super
			if xml_element.elements['fileName'] != nil
				self.file_name = xml_element.elements['fileName'].text
			end
			if xml_element.elements['referrer'] != nil
				self.referrer = xml_element.elements['referrer'].text
			end
		end

	end

	class KalturaFlavorParams < KalturaAssetParams
		# The video codec of the Flavor Params
		attr_accessor :video_codec
		# The video bitrate (in KBits) of the Flavor Params
		attr_accessor :video_bitrate
		# The audio codec of the Flavor Params
		attr_accessor :audio_codec
		# The audio bitrate (in KBits) of the Flavor Params
		attr_accessor :audio_bitrate
		# The number of audio channels for "downmixing"
		attr_accessor :audio_channels
		# The audio sample rate of the Flavor Params
		attr_accessor :audio_sample_rate
		# The desired width of the Flavor Params
		attr_accessor :width
		# The desired height of the Flavor Params
		attr_accessor :height
		# The frame rate of the Flavor Params
		attr_accessor :frame_rate
		# The gop size of the Flavor Params
		attr_accessor :gop_size
		# The list of conversion engines (comma separated)
		attr_accessor :conversion_engines
		# The list of conversion engines extra params (separated with "|")
		attr_accessor :conversion_engines_extra_params
		attr_accessor :two_pass
		attr_accessor :deinterlice
		attr_accessor :rotate
		attr_accessor :operators
		attr_accessor :engine_version
		# The container format of the Flavor Params
		attr_accessor :format
		attr_accessor :aspect_ratio_processing_mode
		attr_accessor :force_frame_to_multiplication16
		attr_accessor :is_gop_in_sec
		attr_accessor :is_avoid_video_shrink_framesize_to_source
		attr_accessor :is_avoid_video_shrink_bitrate_to_source
		attr_accessor :is_video_frame_rate_for_low_br_apple_hls
		attr_accessor :multi_stream
		attr_accessor :anamorphic_pixels
		attr_accessor :is_avoid_forced_key_frames
		attr_accessor :forced_key_frames_mode
		attr_accessor :is_crop_imx
		attr_accessor :optimization_policy
		attr_accessor :max_frame_rate
		attr_accessor :video_constant_bitrate
		attr_accessor :video_bitrate_tolerance
		attr_accessor :watermark_data
		attr_accessor :subtitles_data
		attr_accessor :is_encrypted
		attr_accessor :content_awareness
		attr_accessor :chunked_encode_mode
		attr_accessor :clip_offset
		attr_accessor :clip_duration

		def video_bitrate=(val)
			@video_bitrate = val.to_i
		end
		def audio_bitrate=(val)
			@audio_bitrate = val.to_i
		end
		def audio_channels=(val)
			@audio_channels = val.to_i
		end
		def audio_sample_rate=(val)
			@audio_sample_rate = val.to_i
		end
		def width=(val)
			@width = val.to_i
		end
		def height=(val)
			@height = val.to_i
		end
		def frame_rate=(val)
			@frame_rate = val.to_f
		end
		def gop_size=(val)
			@gop_size = val.to_i
		end
		def two_pass=(val)
			@two_pass = to_b(val)
		end
		def deinterlice=(val)
			@deinterlice = val.to_i
		end
		def rotate=(val)
			@rotate = val.to_i
		end
		def engine_version=(val)
			@engine_version = val.to_i
		end
		def aspect_ratio_processing_mode=(val)
			@aspect_ratio_processing_mode = val.to_i
		end
		def force_frame_to_multiplication16=(val)
			@force_frame_to_multiplication16 = val.to_i
		end
		def is_gop_in_sec=(val)
			@is_gop_in_sec = val.to_i
		end
		def is_avoid_video_shrink_framesize_to_source=(val)
			@is_avoid_video_shrink_framesize_to_source = val.to_i
		end
		def is_avoid_video_shrink_bitrate_to_source=(val)
			@is_avoid_video_shrink_bitrate_to_source = val.to_i
		end
		def is_video_frame_rate_for_low_br_apple_hls=(val)
			@is_video_frame_rate_for_low_br_apple_hls = val.to_i
		end
		def anamorphic_pixels=(val)
			@anamorphic_pixels = val.to_f
		end
		def is_avoid_forced_key_frames=(val)
			@is_avoid_forced_key_frames = val.to_i
		end
		def forced_key_frames_mode=(val)
			@forced_key_frames_mode = val.to_i
		end
		def is_crop_imx=(val)
			@is_crop_imx = val.to_i
		end
		def optimization_policy=(val)
			@optimization_policy = val.to_i
		end
		def max_frame_rate=(val)
			@max_frame_rate = val.to_i
		end
		def video_constant_bitrate=(val)
			@video_constant_bitrate = val.to_i
		end
		def video_bitrate_tolerance=(val)
			@video_bitrate_tolerance = val.to_i
		end
		def is_encrypted=(val)
			@is_encrypted = val.to_i
		end
		def content_awareness=(val)
			@content_awareness = val.to_f
		end
		def chunked_encode_mode=(val)
			@chunked_encode_mode = val.to_i
		end
		def clip_offset=(val)
			@clip_offset = val.to_i
		end
		def clip_duration=(val)
			@clip_duration = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['videoCodec'] != nil
				self.video_codec = xml_element.elements['videoCodec'].text
			end
			if xml_element.elements['videoBitrate'] != nil
				self.video_bitrate = xml_element.elements['videoBitrate'].text
			end
			if xml_element.elements['audioCodec'] != nil
				self.audio_codec = xml_element.elements['audioCodec'].text
			end
			if xml_element.elements['audioBitrate'] != nil
				self.audio_bitrate = xml_element.elements['audioBitrate'].text
			end
			if xml_element.elements['audioChannels'] != nil
				self.audio_channels = xml_element.elements['audioChannels'].text
			end
			if xml_element.elements['audioSampleRate'] != nil
				self.audio_sample_rate = xml_element.elements['audioSampleRate'].text
			end
			if xml_element.elements['width'] != nil
				self.width = xml_element.elements['width'].text
			end
			if xml_element.elements['height'] != nil
				self.height = xml_element.elements['height'].text
			end
			if xml_element.elements['frameRate'] != nil
				self.frame_rate = xml_element.elements['frameRate'].text
			end
			if xml_element.elements['gopSize'] != nil
				self.gop_size = xml_element.elements['gopSize'].text
			end
			if xml_element.elements['conversionEngines'] != nil
				self.conversion_engines = xml_element.elements['conversionEngines'].text
			end
			if xml_element.elements['conversionEnginesExtraParams'] != nil
				self.conversion_engines_extra_params = xml_element.elements['conversionEnginesExtraParams'].text
			end
			if xml_element.elements['twoPass'] != nil
				self.two_pass = xml_element.elements['twoPass'].text
			end
			if xml_element.elements['deinterlice'] != nil
				self.deinterlice = xml_element.elements['deinterlice'].text
			end
			if xml_element.elements['rotate'] != nil
				self.rotate = xml_element.elements['rotate'].text
			end
			if xml_element.elements['operators'] != nil
				self.operators = xml_element.elements['operators'].text
			end
			if xml_element.elements['engineVersion'] != nil
				self.engine_version = xml_element.elements['engineVersion'].text
			end
			if xml_element.elements['format'] != nil
				self.format = xml_element.elements['format'].text
			end
			if xml_element.elements['aspectRatioProcessingMode'] != nil
				self.aspect_ratio_processing_mode = xml_element.elements['aspectRatioProcessingMode'].text
			end
			if xml_element.elements['forceFrameToMultiplication16'] != nil
				self.force_frame_to_multiplication16 = xml_element.elements['forceFrameToMultiplication16'].text
			end
			if xml_element.elements['isGopInSec'] != nil
				self.is_gop_in_sec = xml_element.elements['isGopInSec'].text
			end
			if xml_element.elements['isAvoidVideoShrinkFramesizeToSource'] != nil
				self.is_avoid_video_shrink_framesize_to_source = xml_element.elements['isAvoidVideoShrinkFramesizeToSource'].text
			end
			if xml_element.elements['isAvoidVideoShrinkBitrateToSource'] != nil
				self.is_avoid_video_shrink_bitrate_to_source = xml_element.elements['isAvoidVideoShrinkBitrateToSource'].text
			end
			if xml_element.elements['isVideoFrameRateForLowBrAppleHls'] != nil
				self.is_video_frame_rate_for_low_br_apple_hls = xml_element.elements['isVideoFrameRateForLowBrAppleHls'].text
			end
			if xml_element.elements['multiStream'] != nil
				self.multi_stream = xml_element.elements['multiStream'].text
			end
			if xml_element.elements['anamorphicPixels'] != nil
				self.anamorphic_pixels = xml_element.elements['anamorphicPixels'].text
			end
			if xml_element.elements['isAvoidForcedKeyFrames'] != nil
				self.is_avoid_forced_key_frames = xml_element.elements['isAvoidForcedKeyFrames'].text
			end
			if xml_element.elements['forcedKeyFramesMode'] != nil
				self.forced_key_frames_mode = xml_element.elements['forcedKeyFramesMode'].text
			end
			if xml_element.elements['isCropIMX'] != nil
				self.is_crop_imx = xml_element.elements['isCropIMX'].text
			end
			if xml_element.elements['optimizationPolicy'] != nil
				self.optimization_policy = xml_element.elements['optimizationPolicy'].text
			end
			if xml_element.elements['maxFrameRate'] != nil
				self.max_frame_rate = xml_element.elements['maxFrameRate'].text
			end
			if xml_element.elements['videoConstantBitrate'] != nil
				self.video_constant_bitrate = xml_element.elements['videoConstantBitrate'].text
			end
			if xml_element.elements['videoBitrateTolerance'] != nil
				self.video_bitrate_tolerance = xml_element.elements['videoBitrateTolerance'].text
			end
			if xml_element.elements['watermarkData'] != nil
				self.watermark_data = xml_element.elements['watermarkData'].text
			end
			if xml_element.elements['subtitlesData'] != nil
				self.subtitles_data = xml_element.elements['subtitlesData'].text
			end
			if xml_element.elements['isEncrypted'] != nil
				self.is_encrypted = xml_element.elements['isEncrypted'].text
			end
			if xml_element.elements['contentAwareness'] != nil
				self.content_awareness = xml_element.elements['contentAwareness'].text
			end
			if xml_element.elements['chunkedEncodeMode'] != nil
				self.chunked_encode_mode = xml_element.elements['chunkedEncodeMode'].text
			end
			if xml_element.elements['clipOffset'] != nil
				self.clip_offset = xml_element.elements['clipOffset'].text
			end
			if xml_element.elements['clipDuration'] != nil
				self.clip_duration = xml_element.elements['clipDuration'].text
			end
		end

	end

	class KalturaFlavorAssetWithParams < KalturaObjectBase
		# The Flavor Asset (Can be null when there are params without asset)
		attr_accessor :flavor_asset
		# The Flavor Params
		attr_accessor :flavor_params
		# The entry id
		attr_accessor :entry_id


		def from_xml(xml_element)
			super
			if xml_element.elements['flavorAsset'] != nil
				self.flavor_asset = KalturaClientBase.object_from_xml(xml_element.elements['flavorAsset'], 'KalturaFlavorAsset')
			end
			if xml_element.elements['flavorParams'] != nil
				self.flavor_params = KalturaClientBase.object_from_xml(xml_element.elements['flavorParams'], 'KalturaFlavorParams')
			end
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
		end

	end

	class KalturaFlavorParamsOutput < KalturaFlavorParams
		attr_accessor :flavor_params_id
		attr_accessor :command_lines_str
		attr_accessor :flavor_params_version
		attr_accessor :flavor_asset_id
		attr_accessor :flavor_asset_version
		attr_accessor :ready_behavior

		def flavor_params_id=(val)
			@flavor_params_id = val.to_i
		end
		def ready_behavior=(val)
			@ready_behavior = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['flavorParamsId'] != nil
				self.flavor_params_id = xml_element.elements['flavorParamsId'].text
			end
			if xml_element.elements['commandLinesStr'] != nil
				self.command_lines_str = xml_element.elements['commandLinesStr'].text
			end
			if xml_element.elements['flavorParamsVersion'] != nil
				self.flavor_params_version = xml_element.elements['flavorParamsVersion'].text
			end
			if xml_element.elements['flavorAssetId'] != nil
				self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			end
			if xml_element.elements['flavorAssetVersion'] != nil
				self.flavor_asset_version = xml_element.elements['flavorAssetVersion'].text
			end
			if xml_element.elements['readyBehavior'] != nil
				self.ready_behavior = xml_element.elements['readyBehavior'].text
			end
		end

	end

	class KalturaSchedulerStatus < KalturaObjectBase
		# The id of the Category
		attr_accessor :id
		# The configured id of the scheduler
		attr_accessor :scheduler_configured_id
		# The configured id of the job worker
		attr_accessor :worker_configured_id
		# The type of the job worker.
		attr_accessor :worker_type
		# The status type
		attr_accessor :type
		# The status value
		attr_accessor :value
		# The id of the scheduler
		attr_accessor :scheduler_id
		# The id of the worker
		attr_accessor :worker_id

		def id=(val)
			@id = val.to_i
		end
		def scheduler_configured_id=(val)
			@scheduler_configured_id = val.to_i
		end
		def worker_configured_id=(val)
			@worker_configured_id = val.to_i
		end
		def type=(val)
			@type = val.to_i
		end
		def value=(val)
			@value = val.to_i
		end
		def scheduler_id=(val)
			@scheduler_id = val.to_i
		end
		def worker_id=(val)
			@worker_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['schedulerConfiguredId'] != nil
				self.scheduler_configured_id = xml_element.elements['schedulerConfiguredId'].text
			end
			if xml_element.elements['workerConfiguredId'] != nil
				self.worker_configured_id = xml_element.elements['workerConfiguredId'].text
			end
			if xml_element.elements['workerType'] != nil
				self.worker_type = xml_element.elements['workerType'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
			if xml_element.elements['schedulerId'] != nil
				self.scheduler_id = xml_element.elements['schedulerId'].text
			end
			if xml_element.elements['workerId'] != nil
				self.worker_id = xml_element.elements['workerId'].text
			end
		end

	end

	class KalturaSchedulerConfig < KalturaObjectBase
		# The id of the Category
		attr_accessor :id
		# Creator name
		attr_accessor :created_by
		# Updater name
		attr_accessor :updated_by
		# Id of the control panel command that created this config item
		attr_accessor :command_id
		# The status of the control panel command
		attr_accessor :command_status
		# The id of the scheduler
		attr_accessor :scheduler_id
		# The configured id of the scheduler
		attr_accessor :scheduler_configured_id
		# The name of the scheduler
		attr_accessor :scheduler_name
		# The id of the job worker
		attr_accessor :worker_id
		# The configured id of the job worker
		attr_accessor :worker_configured_id
		# The name of the job worker
		attr_accessor :worker_name
		# The name of the variable
		attr_accessor :variable
		# The part of the variable
		attr_accessor :variable_part
		# The value of the variable
		attr_accessor :value

		def id=(val)
			@id = val.to_i
		end
		def scheduler_id=(val)
			@scheduler_id = val.to_i
		end
		def scheduler_configured_id=(val)
			@scheduler_configured_id = val.to_i
		end
		def worker_id=(val)
			@worker_id = val.to_i
		end
		def worker_configured_id=(val)
			@worker_configured_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['createdBy'] != nil
				self.created_by = xml_element.elements['createdBy'].text
			end
			if xml_element.elements['updatedBy'] != nil
				self.updated_by = xml_element.elements['updatedBy'].text
			end
			if xml_element.elements['commandId'] != nil
				self.command_id = xml_element.elements['commandId'].text
			end
			if xml_element.elements['commandStatus'] != nil
				self.command_status = xml_element.elements['commandStatus'].text
			end
			if xml_element.elements['schedulerId'] != nil
				self.scheduler_id = xml_element.elements['schedulerId'].text
			end
			if xml_element.elements['schedulerConfiguredId'] != nil
				self.scheduler_configured_id = xml_element.elements['schedulerConfiguredId'].text
			end
			if xml_element.elements['schedulerName'] != nil
				self.scheduler_name = xml_element.elements['schedulerName'].text
			end
			if xml_element.elements['workerId'] != nil
				self.worker_id = xml_element.elements['workerId'].text
			end
			if xml_element.elements['workerConfiguredId'] != nil
				self.worker_configured_id = xml_element.elements['workerConfiguredId'].text
			end
			if xml_element.elements['workerName'] != nil
				self.worker_name = xml_element.elements['workerName'].text
			end
			if xml_element.elements['variable'] != nil
				self.variable = xml_element.elements['variable'].text
			end
			if xml_element.elements['variablePart'] != nil
				self.variable_part = xml_element.elements['variablePart'].text
			end
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	class KalturaSchedulerWorker < KalturaObjectBase
		# The id of the Worker
		attr_accessor :id
		# The id as configured in the batch config
		attr_accessor :configured_id
		# The id of the Scheduler
		attr_accessor :scheduler_id
		# The id of the scheduler as configured in the batch config
		attr_accessor :scheduler_configured_id
		# The worker type
		attr_accessor :type
		# The friendly name of the type
		attr_accessor :type_name
		# The scheduler name
		attr_accessor :name
		# Array of the last statuses
		attr_accessor :statuses
		# Array of the last configs
		attr_accessor :configs
		# Array of jobs that locked to this worker
		attr_accessor :locked_jobs
		# Avarage time between creation and queue time
		attr_accessor :avg_wait
		# Avarage time between queue time end finish time
		attr_accessor :avg_work
		# last status time
		attr_accessor :last_status
		# last status formated
		attr_accessor :last_status_str

		def id=(val)
			@id = val.to_i
		end
		def configured_id=(val)
			@configured_id = val.to_i
		end
		def scheduler_id=(val)
			@scheduler_id = val.to_i
		end
		def scheduler_configured_id=(val)
			@scheduler_configured_id = val.to_i
		end
		def avg_wait=(val)
			@avg_wait = val.to_i
		end
		def avg_work=(val)
			@avg_work = val.to_i
		end
		def last_status=(val)
			@last_status = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['configuredId'] != nil
				self.configured_id = xml_element.elements['configuredId'].text
			end
			if xml_element.elements['schedulerId'] != nil
				self.scheduler_id = xml_element.elements['schedulerId'].text
			end
			if xml_element.elements['schedulerConfiguredId'] != nil
				self.scheduler_configured_id = xml_element.elements['schedulerConfiguredId'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['typeName'] != nil
				self.type_name = xml_element.elements['typeName'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['statuses'] != nil
				self.statuses = KalturaClientBase.object_from_xml(xml_element.elements['statuses'], 'KalturaSchedulerStatus')
			end
			if xml_element.elements['configs'] != nil
				self.configs = KalturaClientBase.object_from_xml(xml_element.elements['configs'], 'KalturaSchedulerConfig')
			end
			if xml_element.elements['lockedJobs'] != nil
				self.locked_jobs = KalturaClientBase.object_from_xml(xml_element.elements['lockedJobs'], 'KalturaBatchJob')
			end
			if xml_element.elements['avgWait'] != nil
				self.avg_wait = xml_element.elements['avgWait'].text
			end
			if xml_element.elements['avgWork'] != nil
				self.avg_work = xml_element.elements['avgWork'].text
			end
			if xml_element.elements['lastStatus'] != nil
				self.last_status = xml_element.elements['lastStatus'].text
			end
			if xml_element.elements['lastStatusStr'] != nil
				self.last_status_str = xml_element.elements['lastStatusStr'].text
			end
		end

	end

	class KalturaScheduler < KalturaObjectBase
		# The id of the Scheduler
		attr_accessor :id
		# The id as configured in the batch config
		attr_accessor :configured_id
		# The scheduler name
		attr_accessor :name
		# The host name
		attr_accessor :host
		# Array of the last statuses
		attr_accessor :statuses
		# Array of the last configs
		attr_accessor :configs
		# Array of the workers
		attr_accessor :workers
		# creation time
		attr_accessor :created_at
		# last status time
		attr_accessor :last_status
		# last status formated
		attr_accessor :last_status_str

		def id=(val)
			@id = val.to_i
		end
		def configured_id=(val)
			@configured_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def last_status=(val)
			@last_status = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['configuredId'] != nil
				self.configured_id = xml_element.elements['configuredId'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['host'] != nil
				self.host = xml_element.elements['host'].text
			end
			if xml_element.elements['statuses'] != nil
				self.statuses = KalturaClientBase.object_from_xml(xml_element.elements['statuses'], 'KalturaSchedulerStatus')
			end
			if xml_element.elements['configs'] != nil
				self.configs = KalturaClientBase.object_from_xml(xml_element.elements['configs'], 'KalturaSchedulerConfig')
			end
			if xml_element.elements['workers'] != nil
				self.workers = KalturaClientBase.object_from_xml(xml_element.elements['workers'], 'KalturaSchedulerWorker')
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['lastStatus'] != nil
				self.last_status = xml_element.elements['lastStatus'].text
			end
			if xml_element.elements['lastStatusStr'] != nil
				self.last_status_str = xml_element.elements['lastStatusStr'].text
			end
		end

	end

	class KalturaGroupUser < KalturaObjectBase
		attr_accessor :id
		attr_accessor :user_id
		attr_accessor :group_id
		attr_accessor :status
		attr_accessor :partner_id
		# Creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Last update date as Unix timestamp (In seconds)
		attr_accessor :updated_at
		attr_accessor :creation_mode
		attr_accessor :user_role

		def status=(val)
			@status = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def creation_mode=(val)
			@creation_mode = val.to_i
		end
		def user_role=(val)
			@user_role = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['groupId'] != nil
				self.group_id = xml_element.elements['groupId'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['creationMode'] != nil
				self.creation_mode = xml_element.elements['creationMode'].text
			end
			if xml_element.elements['userRole'] != nil
				self.user_role = xml_element.elements['userRole'].text
			end
		end

	end

	class KalturaObject < KalturaObjectBase
		attr_accessor :related_objects


		def from_xml(xml_element)
			super
			if xml_element.elements['relatedObjects'] != nil
				self.related_objects = KalturaClientBase.object_from_xml(xml_element.elements['relatedObjects'], 'KalturaListResponse')
			end
		end

	end

	# An int representation to return an array of ints
	class KalturaIntegerValue < KalturaValue
		attr_accessor :value

		def value=(val)
			@value = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	class KalturaBatchJobListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaBatchJob')
			end
		end

	end

	class KalturaMediaInfo < KalturaObjectBase
		# The id of the media info
		attr_accessor :id
		# The id of the related flavor asset
		attr_accessor :flavor_asset_id
		# The file size
		attr_accessor :file_size
		# The container format
		attr_accessor :container_format
		# The container id
		attr_accessor :container_id
		# The container profile
		attr_accessor :container_profile
		# The container duration
		attr_accessor :container_duration
		# The container bit rate
		attr_accessor :container_bit_rate
		# The video format
		attr_accessor :video_format
		# The video codec id
		attr_accessor :video_codec_id
		# The video duration
		attr_accessor :video_duration
		# The video bit rate
		attr_accessor :video_bit_rate
		# The video bit rate mode
		attr_accessor :video_bit_rate_mode
		# The video width
		attr_accessor :video_width
		# The video height
		attr_accessor :video_height
		# The video frame rate
		attr_accessor :video_frame_rate
		# The video display aspect ratio (dar)
		attr_accessor :video_dar
		attr_accessor :video_rotation
		# The audio format
		attr_accessor :audio_format
		# The audio codec id
		attr_accessor :audio_codec_id
		# The audio duration
		attr_accessor :audio_duration
		# The audio bit rate
		attr_accessor :audio_bit_rate
		# The audio bit rate mode
		attr_accessor :audio_bit_rate_mode
		# The number of audio channels
		attr_accessor :audio_channels
		# The audio sampling rate
		attr_accessor :audio_sampling_rate
		# The audio resolution
		attr_accessor :audio_resolution
		# The writing library
		attr_accessor :writing_lib
		# The data as returned by the mediainfo command line
		attr_accessor :raw_data
		attr_accessor :multi_stream_info
		attr_accessor :scan_type
		attr_accessor :multi_stream
		attr_accessor :is_fast_start
		attr_accessor :content_streams
		attr_accessor :complexity_value
		attr_accessor :max_gop

		def id=(val)
			@id = val.to_i
		end
		def file_size=(val)
			@file_size = val.to_i
		end
		def container_duration=(val)
			@container_duration = val.to_i
		end
		def container_bit_rate=(val)
			@container_bit_rate = val.to_i
		end
		def video_duration=(val)
			@video_duration = val.to_i
		end
		def video_bit_rate=(val)
			@video_bit_rate = val.to_i
		end
		def video_bit_rate_mode=(val)
			@video_bit_rate_mode = val.to_i
		end
		def video_width=(val)
			@video_width = val.to_i
		end
		def video_height=(val)
			@video_height = val.to_i
		end
		def video_frame_rate=(val)
			@video_frame_rate = val.to_f
		end
		def video_dar=(val)
			@video_dar = val.to_f
		end
		def video_rotation=(val)
			@video_rotation = val.to_i
		end
		def audio_duration=(val)
			@audio_duration = val.to_i
		end
		def audio_bit_rate=(val)
			@audio_bit_rate = val.to_i
		end
		def audio_bit_rate_mode=(val)
			@audio_bit_rate_mode = val.to_i
		end
		def audio_channels=(val)
			@audio_channels = val.to_i
		end
		def audio_sampling_rate=(val)
			@audio_sampling_rate = val.to_i
		end
		def audio_resolution=(val)
			@audio_resolution = val.to_i
		end
		def scan_type=(val)
			@scan_type = val.to_i
		end
		def is_fast_start=(val)
			@is_fast_start = val.to_i
		end
		def complexity_value=(val)
			@complexity_value = val.to_i
		end
		def max_gop=(val)
			@max_gop = val.to_f
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['flavorAssetId'] != nil
				self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			end
			if xml_element.elements['fileSize'] != nil
				self.file_size = xml_element.elements['fileSize'].text
			end
			if xml_element.elements['containerFormat'] != nil
				self.container_format = xml_element.elements['containerFormat'].text
			end
			if xml_element.elements['containerId'] != nil
				self.container_id = xml_element.elements['containerId'].text
			end
			if xml_element.elements['containerProfile'] != nil
				self.container_profile = xml_element.elements['containerProfile'].text
			end
			if xml_element.elements['containerDuration'] != nil
				self.container_duration = xml_element.elements['containerDuration'].text
			end
			if xml_element.elements['containerBitRate'] != nil
				self.container_bit_rate = xml_element.elements['containerBitRate'].text
			end
			if xml_element.elements['videoFormat'] != nil
				self.video_format = xml_element.elements['videoFormat'].text
			end
			if xml_element.elements['videoCodecId'] != nil
				self.video_codec_id = xml_element.elements['videoCodecId'].text
			end
			if xml_element.elements['videoDuration'] != nil
				self.video_duration = xml_element.elements['videoDuration'].text
			end
			if xml_element.elements['videoBitRate'] != nil
				self.video_bit_rate = xml_element.elements['videoBitRate'].text
			end
			if xml_element.elements['videoBitRateMode'] != nil
				self.video_bit_rate_mode = xml_element.elements['videoBitRateMode'].text
			end
			if xml_element.elements['videoWidth'] != nil
				self.video_width = xml_element.elements['videoWidth'].text
			end
			if xml_element.elements['videoHeight'] != nil
				self.video_height = xml_element.elements['videoHeight'].text
			end
			if xml_element.elements['videoFrameRate'] != nil
				self.video_frame_rate = xml_element.elements['videoFrameRate'].text
			end
			if xml_element.elements['videoDar'] != nil
				self.video_dar = xml_element.elements['videoDar'].text
			end
			if xml_element.elements['videoRotation'] != nil
				self.video_rotation = xml_element.elements['videoRotation'].text
			end
			if xml_element.elements['audioFormat'] != nil
				self.audio_format = xml_element.elements['audioFormat'].text
			end
			if xml_element.elements['audioCodecId'] != nil
				self.audio_codec_id = xml_element.elements['audioCodecId'].text
			end
			if xml_element.elements['audioDuration'] != nil
				self.audio_duration = xml_element.elements['audioDuration'].text
			end
			if xml_element.elements['audioBitRate'] != nil
				self.audio_bit_rate = xml_element.elements['audioBitRate'].text
			end
			if xml_element.elements['audioBitRateMode'] != nil
				self.audio_bit_rate_mode = xml_element.elements['audioBitRateMode'].text
			end
			if xml_element.elements['audioChannels'] != nil
				self.audio_channels = xml_element.elements['audioChannels'].text
			end
			if xml_element.elements['audioSamplingRate'] != nil
				self.audio_sampling_rate = xml_element.elements['audioSamplingRate'].text
			end
			if xml_element.elements['audioResolution'] != nil
				self.audio_resolution = xml_element.elements['audioResolution'].text
			end
			if xml_element.elements['writingLib'] != nil
				self.writing_lib = xml_element.elements['writingLib'].text
			end
			if xml_element.elements['rawData'] != nil
				self.raw_data = xml_element.elements['rawData'].text
			end
			if xml_element.elements['multiStreamInfo'] != nil
				self.multi_stream_info = xml_element.elements['multiStreamInfo'].text
			end
			if xml_element.elements['scanType'] != nil
				self.scan_type = xml_element.elements['scanType'].text
			end
			if xml_element.elements['multiStream'] != nil
				self.multi_stream = xml_element.elements['multiStream'].text
			end
			if xml_element.elements['isFastStart'] != nil
				self.is_fast_start = xml_element.elements['isFastStart'].text
			end
			if xml_element.elements['contentStreams'] != nil
				self.content_streams = xml_element.elements['contentStreams'].text
			end
			if xml_element.elements['complexityValue'] != nil
				self.complexity_value = xml_element.elements['complexityValue'].text
			end
			if xml_element.elements['maxGOP'] != nil
				self.max_gop = xml_element.elements['maxGOP'].text
			end
		end

	end

	class KalturaMediaInfoListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaMediaInfo')
			end
		end

	end

	class KalturaFlavorParamsOutputListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaFlavorParamsOutput')
			end
		end

	end

	class KalturaThumbAsset < KalturaAsset
		# The Flavor Params used to create this Flavor Asset
		attr_accessor :thumb_params_id
		# The width of the Flavor Asset
		attr_accessor :width
		# The height of the Flavor Asset
		attr_accessor :height
		# The status of the asset
		attr_accessor :status

		def thumb_params_id=(val)
			@thumb_params_id = val.to_i
		end
		def width=(val)
			@width = val.to_i
		end
		def height=(val)
			@height = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['thumbParamsId'] != nil
				self.thumb_params_id = xml_element.elements['thumbParamsId'].text
			end
			if xml_element.elements['width'] != nil
				self.width = xml_element.elements['width'].text
			end
			if xml_element.elements['height'] != nil
				self.height = xml_element.elements['height'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
		end

	end

	class KalturaThumbParams < KalturaAssetParams
		attr_accessor :crop_type
		attr_accessor :quality
		attr_accessor :crop_x
		attr_accessor :crop_y
		attr_accessor :crop_width
		attr_accessor :crop_height
		attr_accessor :video_offset
		attr_accessor :width
		attr_accessor :height
		attr_accessor :scale_width
		attr_accessor :scale_height
		# Hexadecimal value
		attr_accessor :background_color
		# Id of the flavor params or the thumbnail params to be used as source for the thumbnail creation
		attr_accessor :source_params_id
		# The container format of the Flavor Params
		attr_accessor :format
		# The image density (dpi) for example: 72 or 96
		attr_accessor :density
		# Strip profiles and comments
		attr_accessor :strip_profiles
		# Create thumbnail from the videoLengthpercentage second
		attr_accessor :video_offset_in_percentage
		# interval in seconds for creating thumbnail
		attr_accessor :interval

		def crop_type=(val)
			@crop_type = val.to_i
		end
		def quality=(val)
			@quality = val.to_i
		end
		def crop_x=(val)
			@crop_x = val.to_i
		end
		def crop_y=(val)
			@crop_y = val.to_i
		end
		def crop_width=(val)
			@crop_width = val.to_i
		end
		def crop_height=(val)
			@crop_height = val.to_i
		end
		def video_offset=(val)
			@video_offset = val.to_f
		end
		def width=(val)
			@width = val.to_i
		end
		def height=(val)
			@height = val.to_i
		end
		def scale_width=(val)
			@scale_width = val.to_f
		end
		def scale_height=(val)
			@scale_height = val.to_f
		end
		def source_params_id=(val)
			@source_params_id = val.to_i
		end
		def density=(val)
			@density = val.to_i
		end
		def strip_profiles=(val)
			@strip_profiles = to_b(val)
		end
		def video_offset_in_percentage=(val)
			@video_offset_in_percentage = val.to_i
		end
		def interval=(val)
			@interval = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['cropType'] != nil
				self.crop_type = xml_element.elements['cropType'].text
			end
			if xml_element.elements['quality'] != nil
				self.quality = xml_element.elements['quality'].text
			end
			if xml_element.elements['cropX'] != nil
				self.crop_x = xml_element.elements['cropX'].text
			end
			if xml_element.elements['cropY'] != nil
				self.crop_y = xml_element.elements['cropY'].text
			end
			if xml_element.elements['cropWidth'] != nil
				self.crop_width = xml_element.elements['cropWidth'].text
			end
			if xml_element.elements['cropHeight'] != nil
				self.crop_height = xml_element.elements['cropHeight'].text
			end
			if xml_element.elements['videoOffset'] != nil
				self.video_offset = xml_element.elements['videoOffset'].text
			end
			if xml_element.elements['width'] != nil
				self.width = xml_element.elements['width'].text
			end
			if xml_element.elements['height'] != nil
				self.height = xml_element.elements['height'].text
			end
			if xml_element.elements['scaleWidth'] != nil
				self.scale_width = xml_element.elements['scaleWidth'].text
			end
			if xml_element.elements['scaleHeight'] != nil
				self.scale_height = xml_element.elements['scaleHeight'].text
			end
			if xml_element.elements['backgroundColor'] != nil
				self.background_color = xml_element.elements['backgroundColor'].text
			end
			if xml_element.elements['sourceParamsId'] != nil
				self.source_params_id = xml_element.elements['sourceParamsId'].text
			end
			if xml_element.elements['format'] != nil
				self.format = xml_element.elements['format'].text
			end
			if xml_element.elements['density'] != nil
				self.density = xml_element.elements['density'].text
			end
			if xml_element.elements['stripProfiles'] != nil
				self.strip_profiles = xml_element.elements['stripProfiles'].text
			end
			if xml_element.elements['videoOffsetInPercentage'] != nil
				self.video_offset_in_percentage = xml_element.elements['videoOffsetInPercentage'].text
			end
			if xml_element.elements['interval'] != nil
				self.interval = xml_element.elements['interval'].text
			end
		end

	end

	class KalturaThumbParamsOutput < KalturaThumbParams
		attr_accessor :thumb_params_id
		attr_accessor :thumb_params_version
		attr_accessor :thumb_asset_id
		attr_accessor :thumb_asset_version
		attr_accessor :rotate

		def thumb_params_id=(val)
			@thumb_params_id = val.to_i
		end
		def rotate=(val)
			@rotate = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['thumbParamsId'] != nil
				self.thumb_params_id = xml_element.elements['thumbParamsId'].text
			end
			if xml_element.elements['thumbParamsVersion'] != nil
				self.thumb_params_version = xml_element.elements['thumbParamsVersion'].text
			end
			if xml_element.elements['thumbAssetId'] != nil
				self.thumb_asset_id = xml_element.elements['thumbAssetId'].text
			end
			if xml_element.elements['thumbAssetVersion'] != nil
				self.thumb_asset_version = xml_element.elements['thumbAssetVersion'].text
			end
			if xml_element.elements['rotate'] != nil
				self.rotate = xml_element.elements['rotate'].text
			end
		end

	end

	class KalturaThumbParamsOutputListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaThumbParamsOutput')
			end
		end

	end

	# A representation of a live stream configuration
	class KalturaLiveStreamConfiguration < KalturaObjectBase
		attr_accessor :protocol
		attr_accessor :url
		attr_accessor :publish_url
		attr_accessor :backup_url
		attr_accessor :stream_name


		def from_xml(xml_element)
			super
			if xml_element.elements['protocol'] != nil
				self.protocol = xml_element.elements['protocol'].text
			end
			if xml_element.elements['url'] != nil
				self.url = xml_element.elements['url'].text
			end
			if xml_element.elements['publishUrl'] != nil
				self.publish_url = xml_element.elements['publishUrl'].text
			end
			if xml_element.elements['backupUrl'] != nil
				self.backup_url = xml_element.elements['backupUrl'].text
			end
			if xml_element.elements['streamName'] != nil
				self.stream_name = xml_element.elements['streamName'].text
			end
		end

	end

	# Basic push-publish configuration for Kaltura live stream entry
	class KalturaLiveStreamPushPublishConfiguration < KalturaObjectBase
		attr_accessor :publish_url
		attr_accessor :backup_publish_url
		attr_accessor :port


		def from_xml(xml_element)
			super
			if xml_element.elements['publishUrl'] != nil
				self.publish_url = xml_element.elements['publishUrl'].text
			end
			if xml_element.elements['backupPublishUrl'] != nil
				self.backup_publish_url = xml_element.elements['backupPublishUrl'].text
			end
			if xml_element.elements['port'] != nil
				self.port = xml_element.elements['port'].text
			end
		end

	end

	# A representation of a live stream recording entry configuration
	class KalturaLiveEntryRecordingOptions < KalturaObjectBase
		attr_accessor :should_copy_entitlement
		attr_accessor :should_copy_scheduling
		attr_accessor :should_copy_thumbnail
		attr_accessor :should_make_hidden

		def should_copy_entitlement=(val)
			@should_copy_entitlement = val.to_i
		end
		def should_copy_scheduling=(val)
			@should_copy_scheduling = val.to_i
		end
		def should_copy_thumbnail=(val)
			@should_copy_thumbnail = val.to_i
		end
		def should_make_hidden=(val)
			@should_make_hidden = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['shouldCopyEntitlement'] != nil
				self.should_copy_entitlement = xml_element.elements['shouldCopyEntitlement'].text
			end
			if xml_element.elements['shouldCopyScheduling'] != nil
				self.should_copy_scheduling = xml_element.elements['shouldCopyScheduling'].text
			end
			if xml_element.elements['shouldCopyThumbnail'] != nil
				self.should_copy_thumbnail = xml_element.elements['shouldCopyThumbnail'].text
			end
			if xml_element.elements['shouldMakeHidden'] != nil
				self.should_make_hidden = xml_element.elements['shouldMakeHidden'].text
			end
		end

	end

	class KalturaLiveEntry < KalturaMediaEntry
		# The message to be presented when the stream is offline
		attr_accessor :offline_message
		# Recording Status Enabled/Disabled
		attr_accessor :record_status
		# DVR Status Enabled/Disabled
		attr_accessor :dvr_status
		# Window of time which the DVR allows for backwards scrubbing (in minutes)
		attr_accessor :dvr_window
		# Elapsed recording time (in msec) up to the point where the live stream was last stopped (unpublished).
		attr_accessor :last_elapsed_recording_time
		# Array of key value protocol->live stream url objects
		attr_accessor :live_stream_configurations
		# Recorded entry id
		attr_accessor :recorded_entry_id
		# Flag denoting whether entry should be published by the media server
		attr_accessor :push_publish_enabled
		# Array of publish configurations
		attr_accessor :publish_configurations
		# The first time in which the entry was broadcast
		attr_accessor :first_broadcast
		# The Last time in which the entry was broadcast
		attr_accessor :last_broadcast
		# The time (unix timestamp in milliseconds) in which the entry broadcast started or 0 when the entry is off the air
		attr_accessor :current_broadcast_start_time
		attr_accessor :recording_options
		# the status of the entry of type EntryServerNodeStatus
		attr_accessor :live_status
		# The chunk duration value in milliseconds
		attr_accessor :segment_duration
		attr_accessor :explicit_live
		attr_accessor :view_mode
		attr_accessor :recording_status
		# The time the last broadcast finished.
		attr_accessor :last_broadcast_end_time

		def record_status=(val)
			@record_status = val.to_i
		end
		def dvr_status=(val)
			@dvr_status = val.to_i
		end
		def dvr_window=(val)
			@dvr_window = val.to_i
		end
		def last_elapsed_recording_time=(val)
			@last_elapsed_recording_time = val.to_i
		end
		def push_publish_enabled=(val)
			@push_publish_enabled = val.to_i
		end
		def first_broadcast=(val)
			@first_broadcast = val.to_i
		end
		def last_broadcast=(val)
			@last_broadcast = val.to_i
		end
		def current_broadcast_start_time=(val)
			@current_broadcast_start_time = val.to_f
		end
		def live_status=(val)
			@live_status = val.to_i
		end
		def segment_duration=(val)
			@segment_duration = val.to_i
		end
		def explicit_live=(val)
			@explicit_live = val.to_i
		end
		def view_mode=(val)
			@view_mode = val.to_i
		end
		def recording_status=(val)
			@recording_status = val.to_i
		end
		def last_broadcast_end_time=(val)
			@last_broadcast_end_time = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['offlineMessage'] != nil
				self.offline_message = xml_element.elements['offlineMessage'].text
			end
			if xml_element.elements['recordStatus'] != nil
				self.record_status = xml_element.elements['recordStatus'].text
			end
			if xml_element.elements['dvrStatus'] != nil
				self.dvr_status = xml_element.elements['dvrStatus'].text
			end
			if xml_element.elements['dvrWindow'] != nil
				self.dvr_window = xml_element.elements['dvrWindow'].text
			end
			if xml_element.elements['lastElapsedRecordingTime'] != nil
				self.last_elapsed_recording_time = xml_element.elements['lastElapsedRecordingTime'].text
			end
			if xml_element.elements['liveStreamConfigurations'] != nil
				self.live_stream_configurations = KalturaClientBase.object_from_xml(xml_element.elements['liveStreamConfigurations'], 'KalturaLiveStreamConfiguration')
			end
			if xml_element.elements['recordedEntryId'] != nil
				self.recorded_entry_id = xml_element.elements['recordedEntryId'].text
			end
			if xml_element.elements['pushPublishEnabled'] != nil
				self.push_publish_enabled = xml_element.elements['pushPublishEnabled'].text
			end
			if xml_element.elements['publishConfigurations'] != nil
				self.publish_configurations = KalturaClientBase.object_from_xml(xml_element.elements['publishConfigurations'], 'KalturaLiveStreamPushPublishConfiguration')
			end
			if xml_element.elements['firstBroadcast'] != nil
				self.first_broadcast = xml_element.elements['firstBroadcast'].text
			end
			if xml_element.elements['lastBroadcast'] != nil
				self.last_broadcast = xml_element.elements['lastBroadcast'].text
			end
			if xml_element.elements['currentBroadcastStartTime'] != nil
				self.current_broadcast_start_time = xml_element.elements['currentBroadcastStartTime'].text
			end
			if xml_element.elements['recordingOptions'] != nil
				self.recording_options = KalturaClientBase.object_from_xml(xml_element.elements['recordingOptions'], 'KalturaLiveEntryRecordingOptions')
			end
			if xml_element.elements['liveStatus'] != nil
				self.live_status = xml_element.elements['liveStatus'].text
			end
			if xml_element.elements['segmentDuration'] != nil
				self.segment_duration = xml_element.elements['segmentDuration'].text
			end
			if xml_element.elements['explicitLive'] != nil
				self.explicit_live = xml_element.elements['explicitLive'].text
			end
			if xml_element.elements['viewMode'] != nil
				self.view_mode = xml_element.elements['viewMode'].text
			end
			if xml_element.elements['recordingStatus'] != nil
				self.recording_status = xml_element.elements['recordingStatus'].text
			end
			if xml_element.elements['lastBroadcastEndTime'] != nil
				self.last_broadcast_end_time = xml_element.elements['lastBroadcastEndTime'].text
			end
		end

	end

	class KalturaLiveChannel < KalturaLiveEntry
		# Playlist id to be played
		attr_accessor :playlist_id
		# Indicates that the segments should be repeated for ever
		attr_accessor :repeat

		def repeat=(val)
			@repeat = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['playlistId'] != nil
				self.playlist_id = xml_element.elements['playlistId'].text
			end
			if xml_element.elements['repeat'] != nil
				self.repeat = xml_element.elements['repeat'].text
			end
		end

	end

	class KalturaLiveChannelSegment < KalturaObjectBase
		# Unique identifier
		attr_accessor :id
		attr_accessor :partner_id
		# Segment creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Segment update date as Unix timestamp (In seconds)
		attr_accessor :updated_at
		# Segment name
		attr_accessor :name
		# Segment description
		attr_accessor :description
		# Segment tags
		attr_accessor :tags
		# Segment could be associated with the main stream, as additional stream or as overlay
		attr_accessor :type
		attr_accessor :status
		# Live channel id
		attr_accessor :channel_id
		# Entry id to be played
		attr_accessor :entry_id
		# Segment start time trigger type
		attr_accessor :trigger_type
		# Live channel segment that the trigger relates to
		attr_accessor :trigger_segment_id
		# Segment play start time, in mili-seconds, according to trigger type
		attr_accessor :start_time
		# Segment play duration time, in mili-seconds
		attr_accessor :duration

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def trigger_segment_id=(val)
			@trigger_segment_id = val.to_i
		end
		def start_time=(val)
			@start_time = val.to_f
		end
		def duration=(val)
			@duration = val.to_f
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['channelId'] != nil
				self.channel_id = xml_element.elements['channelId'].text
			end
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['triggerType'] != nil
				self.trigger_type = xml_element.elements['triggerType'].text
			end
			if xml_element.elements['triggerSegmentId'] != nil
				self.trigger_segment_id = xml_element.elements['triggerSegmentId'].text
			end
			if xml_element.elements['startTime'] != nil
				self.start_time = xml_element.elements['startTime'].text
			end
			if xml_element.elements['duration'] != nil
				self.duration = xml_element.elements['duration'].text
			end
		end

	end

	class KalturaLiveEntryServerNodeRecordingInfo < KalturaObjectBase
		attr_accessor :recorded_entry_id
		attr_accessor :duration
		attr_accessor :recording_status

		def duration=(val)
			@duration = val.to_i
		end
		def recording_status=(val)
			@recording_status = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['recordedEntryId'] != nil
				self.recorded_entry_id = xml_element.elements['recordedEntryId'].text
			end
			if xml_element.elements['duration'] != nil
				self.duration = xml_element.elements['duration'].text
			end
			if xml_element.elements['recordingStatus'] != nil
				self.recording_status = xml_element.elements['recordingStatus'].text
			end
		end

	end

	class KalturaLiveReportExportParams < KalturaObjectBase
		attr_accessor :entry_ids
		attr_accessor :recpient_email
		# Time zone offset in minutes (between client to UTC)
		attr_accessor :time_zone_offset
		# Optional argument that allows controlling the prefix of the exported csv url
		attr_accessor :application_url_template

		def time_zone_offset=(val)
			@time_zone_offset = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['entryIds'] != nil
				self.entry_ids = xml_element.elements['entryIds'].text
			end
			if xml_element.elements['recpientEmail'] != nil
				self.recpient_email = xml_element.elements['recpientEmail'].text
			end
			if xml_element.elements['timeZoneOffset'] != nil
				self.time_zone_offset = xml_element.elements['timeZoneOffset'].text
			end
			if xml_element.elements['applicationUrlTemplate'] != nil
				self.application_url_template = xml_element.elements['applicationUrlTemplate'].text
			end
		end

	end

	class KalturaLiveReportExportResponse < KalturaObjectBase
		attr_accessor :reference_job_id
		attr_accessor :report_email

		def reference_job_id=(val)
			@reference_job_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['referenceJobId'] != nil
				self.reference_job_id = xml_element.elements['referenceJobId'].text
			end
			if xml_element.elements['reportEmail'] != nil
				self.report_email = xml_element.elements['reportEmail'].text
			end
		end

	end

	class KalturaLiveReportInputFilter < KalturaObjectBase
		attr_accessor :entry_ids
		attr_accessor :from_time
		attr_accessor :to_time
		attr_accessor :live
		attr_accessor :order_by

		def from_time=(val)
			@from_time = val.to_i
		end
		def to_time=(val)
			@to_time = val.to_i
		end
		def live=(val)
			@live = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['entryIds'] != nil
				self.entry_ids = xml_element.elements['entryIds'].text
			end
			if xml_element.elements['fromTime'] != nil
				self.from_time = xml_element.elements['fromTime'].text
			end
			if xml_element.elements['toTime'] != nil
				self.to_time = xml_element.elements['toTime'].text
			end
			if xml_element.elements['live'] != nil
				self.live = xml_element.elements['live'].text
			end
			if xml_element.elements['orderBy'] != nil
				self.order_by = xml_element.elements['orderBy'].text
			end
		end

	end

	class KalturaLiveStats < KalturaObjectBase
		attr_accessor :audience
		attr_accessor :dvr_audience
		attr_accessor :avg_bitrate
		attr_accessor :buffer_time
		attr_accessor :plays
		attr_accessor :seconds_viewed
		attr_accessor :start_event
		attr_accessor :timestamp

		def audience=(val)
			@audience = val.to_i
		end
		def dvr_audience=(val)
			@dvr_audience = val.to_i
		end
		def avg_bitrate=(val)
			@avg_bitrate = val.to_f
		end
		def buffer_time=(val)
			@buffer_time = val.to_i
		end
		def plays=(val)
			@plays = val.to_i
		end
		def seconds_viewed=(val)
			@seconds_viewed = val.to_i
		end
		def start_event=(val)
			@start_event = val.to_i
		end
		def timestamp=(val)
			@timestamp = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['audience'] != nil
				self.audience = xml_element.elements['audience'].text
			end
			if xml_element.elements['dvrAudience'] != nil
				self.dvr_audience = xml_element.elements['dvrAudience'].text
			end
			if xml_element.elements['avgBitrate'] != nil
				self.avg_bitrate = xml_element.elements['avgBitrate'].text
			end
			if xml_element.elements['bufferTime'] != nil
				self.buffer_time = xml_element.elements['bufferTime'].text
			end
			if xml_element.elements['plays'] != nil
				self.plays = xml_element.elements['plays'].text
			end
			if xml_element.elements['secondsViewed'] != nil
				self.seconds_viewed = xml_element.elements['secondsViewed'].text
			end
			if xml_element.elements['startEvent'] != nil
				self.start_event = xml_element.elements['startEvent'].text
			end
			if xml_element.elements['timestamp'] != nil
				self.timestamp = xml_element.elements['timestamp'].text
			end
		end

	end

	# Will hold data from the Kaltura Player components to be passed on to the live analytics system
	class KalturaLiveStatsEvent < KalturaObjectBase
		attr_accessor :partner_id
		attr_accessor :entry_id
		# an integer representing the type of event being sent from the player
		attr_accessor :event_type
		# a unique string generated by the client that will represent the client-side session: the primary component will pass it on to other components that sprout from it
		attr_accessor :session_id
		# incremental sequence of the event
		attr_accessor :event_index
		# buffer time in seconds from the last 10 seconds
		attr_accessor :buffer_time
		# bitrate used in the last 10 seconds
		attr_accessor :bitrate
		# the referrer of the client
		attr_accessor :referrer
		attr_accessor :is_live
		# the event start time as string
		attr_accessor :start_time
		# delivery type used for this stream
		attr_accessor :delivery_type

		def partner_id=(val)
			@partner_id = val.to_i
		end
		def event_type=(val)
			@event_type = val.to_i
		end
		def event_index=(val)
			@event_index = val.to_i
		end
		def buffer_time=(val)
			@buffer_time = val.to_i
		end
		def bitrate=(val)
			@bitrate = val.to_i
		end
		def is_live=(val)
			@is_live = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['eventType'] != nil
				self.event_type = xml_element.elements['eventType'].text
			end
			if xml_element.elements['sessionId'] != nil
				self.session_id = xml_element.elements['sessionId'].text
			end
			if xml_element.elements['eventIndex'] != nil
				self.event_index = xml_element.elements['eventIndex'].text
			end
			if xml_element.elements['bufferTime'] != nil
				self.buffer_time = xml_element.elements['bufferTime'].text
			end
			if xml_element.elements['bitrate'] != nil
				self.bitrate = xml_element.elements['bitrate'].text
			end
			if xml_element.elements['referrer'] != nil
				self.referrer = xml_element.elements['referrer'].text
			end
			if xml_element.elements['isLive'] != nil
				self.is_live = xml_element.elements['isLive'].text
			end
			if xml_element.elements['startTime'] != nil
				self.start_time = xml_element.elements['startTime'].text
			end
			if xml_element.elements['deliveryType'] != nil
				self.delivery_type = xml_element.elements['deliveryType'].text
			end
		end

	end

	class KalturaLiveStreamBitrate < KalturaObjectBase
		attr_accessor :bitrate
		attr_accessor :width
		attr_accessor :height
		attr_accessor :tags

		def bitrate=(val)
			@bitrate = val.to_i
		end
		def width=(val)
			@width = val.to_i
		end
		def height=(val)
			@height = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['bitrate'] != nil
				self.bitrate = xml_element.elements['bitrate'].text
			end
			if xml_element.elements['width'] != nil
				self.width = xml_element.elements['width'].text
			end
			if xml_element.elements['height'] != nil
				self.height = xml_element.elements['height'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
		end

	end

	class KalturaLiveStreamEntry < KalturaLiveEntry
		# The stream id as provided by the provider
		attr_accessor :stream_remote_id
		# The backup stream id as provided by the provider
		attr_accessor :stream_remote_backup_id
		# Array of supported bitrates
		attr_accessor :bitrates
		attr_accessor :primary_broadcasting_url
		attr_accessor :secondary_broadcasting_url
		attr_accessor :primary_rtsp_broadcasting_url
		attr_accessor :secondary_rtsp_broadcasting_url
		attr_accessor :stream_name
		# The stream url
		attr_accessor :stream_url
		# HLS URL - URL for live stream playback on mobile device
		attr_accessor :hls_stream_url
		# URL Manager to handle the live stream URL (for instance, add token)
		attr_accessor :url_manager
		# The broadcast primary ip
		attr_accessor :encoding_ip1
		# The broadcast secondary ip
		attr_accessor :encoding_ip2
		# The broadcast password
		attr_accessor :stream_password
		# The broadcast username
		attr_accessor :stream_username
		# The Streams primary server node id
		attr_accessor :primary_server_node_id

		def primary_server_node_id=(val)
			@primary_server_node_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['streamRemoteId'] != nil
				self.stream_remote_id = xml_element.elements['streamRemoteId'].text
			end
			if xml_element.elements['streamRemoteBackupId'] != nil
				self.stream_remote_backup_id = xml_element.elements['streamRemoteBackupId'].text
			end
			if xml_element.elements['bitrates'] != nil
				self.bitrates = KalturaClientBase.object_from_xml(xml_element.elements['bitrates'], 'KalturaLiveStreamBitrate')
			end
			if xml_element.elements['primaryBroadcastingUrl'] != nil
				self.primary_broadcasting_url = xml_element.elements['primaryBroadcastingUrl'].text
			end
			if xml_element.elements['secondaryBroadcastingUrl'] != nil
				self.secondary_broadcasting_url = xml_element.elements['secondaryBroadcastingUrl'].text
			end
			if xml_element.elements['primaryRtspBroadcastingUrl'] != nil
				self.primary_rtsp_broadcasting_url = xml_element.elements['primaryRtspBroadcastingUrl'].text
			end
			if xml_element.elements['secondaryRtspBroadcastingUrl'] != nil
				self.secondary_rtsp_broadcasting_url = xml_element.elements['secondaryRtspBroadcastingUrl'].text
			end
			if xml_element.elements['streamName'] != nil
				self.stream_name = xml_element.elements['streamName'].text
			end
			if xml_element.elements['streamUrl'] != nil
				self.stream_url = xml_element.elements['streamUrl'].text
			end
			if xml_element.elements['hlsStreamUrl'] != nil
				self.hls_stream_url = xml_element.elements['hlsStreamUrl'].text
			end
			if xml_element.elements['urlManager'] != nil
				self.url_manager = xml_element.elements['urlManager'].text
			end
			if xml_element.elements['encodingIP1'] != nil
				self.encoding_ip1 = xml_element.elements['encodingIP1'].text
			end
			if xml_element.elements['encodingIP2'] != nil
				self.encoding_ip2 = xml_element.elements['encodingIP2'].text
			end
			if xml_element.elements['streamPassword'] != nil
				self.stream_password = xml_element.elements['streamPassword'].text
			end
			if xml_element.elements['streamUsername'] != nil
				self.stream_username = xml_element.elements['streamUsername'].text
			end
			if xml_element.elements['primaryServerNodeId'] != nil
				self.primary_server_node_id = xml_element.elements['primaryServerNodeId'].text
			end
		end

	end

	class KalturaLiveStreamParams < KalturaObjectBase
		# Bit rate of the stream. (i.e. 900)
		attr_accessor :bitrate
		# flavor asset id
		attr_accessor :flavor_id
		# Stream's width
		attr_accessor :width
		# Stream's height
		attr_accessor :height
		# Live stream's codec
		attr_accessor :codec
		# Live stream's farme rate
		attr_accessor :frame_rate
		# Live stream's key frame interval
		attr_accessor :key_frame_interval
		# Live stream's language
		attr_accessor :language

		def bitrate=(val)
			@bitrate = val.to_i
		end
		def width=(val)
			@width = val.to_i
		end
		def height=(val)
			@height = val.to_i
		end
		def frame_rate=(val)
			@frame_rate = val.to_i
		end
		def key_frame_interval=(val)
			@key_frame_interval = val.to_f
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['bitrate'] != nil
				self.bitrate = xml_element.elements['bitrate'].text
			end
			if xml_element.elements['flavorId'] != nil
				self.flavor_id = xml_element.elements['flavorId'].text
			end
			if xml_element.elements['width'] != nil
				self.width = xml_element.elements['width'].text
			end
			if xml_element.elements['height'] != nil
				self.height = xml_element.elements['height'].text
			end
			if xml_element.elements['codec'] != nil
				self.codec = xml_element.elements['codec'].text
			end
			if xml_element.elements['frameRate'] != nil
				self.frame_rate = xml_element.elements['frameRate'].text
			end
			if xml_element.elements['keyFrameInterval'] != nil
				self.key_frame_interval = xml_element.elements['keyFrameInterval'].text
			end
			if xml_element.elements['language'] != nil
				self.language = xml_element.elements['language'].text
			end
		end

	end

	class KalturaBaseEntryBaseFilter < KalturaRelatedFilter
		# This filter should be in use for retrieving only a specific entry (identified by its entryId).
		attr_accessor :id_equal
		# This filter should be in use for retrieving few specific entries (string should include comma separated list of entryId strings).
		attr_accessor :id_in
		attr_accessor :id_not_in
		# This filter should be in use for retrieving specific entries. It should include only one string to search for in entry names (no wildcards, spaces are treated as part of the string).
		attr_accessor :name_like
		# This filter should be in use for retrieving specific entries. It could include few (comma separated) strings for searching in entry names, while applying an OR logic to retrieve entries that contain at least one input string (no wildcards, spaces are treated as part of the string).
		attr_accessor :name_multi_like_or
		# This filter should be in use for retrieving specific entries. It could include few (comma separated) strings for searching in entry names, while applying an AND logic to retrieve entries that contain all input strings (no wildcards, spaces are treated as part of the string).
		attr_accessor :name_multi_like_and
		# This filter should be in use for retrieving entries with a specific name.
		attr_accessor :name_equal
		# This filter should be in use for retrieving only entries which were uploaded by/assigned to users of a specific Kaltura Partner (identified by Partner ID).
		attr_accessor :partner_id_equal
		# This filter should be in use for retrieving only entries within Kaltura network which were uploaded by/assigned to users of few Kaltura Partners  (string should include comma separated list of PartnerIDs)
		attr_accessor :partner_id_in
		# This filter parameter should be in use for retrieving only entries, uploaded by/assigned to a specific user (identified by user Id).
		attr_accessor :user_id_equal
		attr_accessor :user_id_in
		attr_accessor :user_id_not_in
		attr_accessor :creator_id_equal
		# This filter should be in use for retrieving specific entries. It should include only one string to search for in entry tags (no wildcards, spaces are treated as part of the string).
		attr_accessor :tags_like
		# This filter should be in use for retrieving specific entries. It could include few (comma separated) strings for searching in entry tags, while applying an OR logic to retrieve entries that contain at least one input string (no wildcards, spaces are treated as part of the string).
		attr_accessor :tags_multi_like_or
		# This filter should be in use for retrieving specific entries. It could include few (comma separated) strings for searching in entry tags, while applying an AND logic to retrieve entries that contain all input strings (no wildcards, spaces are treated as part of the string).
		attr_accessor :tags_multi_like_and
		# This filter should be in use for retrieving specific entries. It should include only one string to search for in entry tags set by an ADMIN user (no wildcards, spaces are treated as part of the string).
		attr_accessor :admin_tags_like
		# This filter should be in use for retrieving specific entries. It could include few (comma separated) strings for searching in entry tags, set by an ADMIN user, while applying an OR logic to retrieve entries that contain at least one input string (no wildcards, spaces are treated as part of the string).
		attr_accessor :admin_tags_multi_like_or
		# This filter should be in use for retrieving specific entries. It could include few (comma separated) strings for searching in entry tags, set by an ADMIN user, while applying an AND logic to retrieve entries that contain all input strings (no wildcards, spaces are treated as part of the string).
		attr_accessor :admin_tags_multi_like_and
		attr_accessor :categories_match_and
		# All entries within these categories or their child categories.
		attr_accessor :categories_match_or
		attr_accessor :categories_not_contains
		attr_accessor :categories_ids_match_and
		# All entries of the categories, excluding their child categories.
		# 	 To include entries of the child categories, use categoryAncestorIdIn, or categoriesMatchOr.
		attr_accessor :categories_ids_match_or
		attr_accessor :categories_ids_not_contains
		attr_accessor :categories_ids_empty
		# This filter should be in use for retrieving only entries, at a specific {
		attr_accessor :status_equal
		# This filter should be in use for retrieving only entries, not at a specific {
		attr_accessor :status_not_equal
		# This filter should be in use for retrieving only entries, at few specific {
		attr_accessor :status_in
		# This filter should be in use for retrieving only entries, not at few specific {
		attr_accessor :status_not_in
		attr_accessor :moderation_status_equal
		attr_accessor :moderation_status_not_equal
		attr_accessor :moderation_status_in
		attr_accessor :moderation_status_not_in
		attr_accessor :type_equal
		# This filter should be in use for retrieving entries of few {
		attr_accessor :type_in
		# This filter parameter should be in use for retrieving only entries which were created at Kaltura system after a specific time/date (standard timestamp format).
		attr_accessor :created_at_greater_than_or_equal
		# This filter parameter should be in use for retrieving only entries which were created at Kaltura system before a specific time/date (standard timestamp format).
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :total_rank_less_than_or_equal
		attr_accessor :total_rank_greater_than_or_equal
		attr_accessor :group_id_equal
		# This filter should be in use for retrieving specific entries while search match the input string within all of the following metadata attributes: name, description, tags, adminTags.
		attr_accessor :search_text_match_and
		# This filter should be in use for retrieving specific entries while search match the input string within at least one of the following metadata attributes: name, description, tags, adminTags.
		attr_accessor :search_text_match_or
		attr_accessor :access_control_id_equal
		attr_accessor :access_control_id_in
		attr_accessor :start_date_greater_than_or_equal
		attr_accessor :start_date_less_than_or_equal
		attr_accessor :start_date_greater_than_or_equal_or_null
		attr_accessor :start_date_less_than_or_equal_or_null
		attr_accessor :end_date_greater_than_or_equal
		attr_accessor :end_date_less_than_or_equal
		attr_accessor :end_date_greater_than_or_equal_or_null
		attr_accessor :end_date_less_than_or_equal_or_null
		attr_accessor :reference_id_equal
		attr_accessor :reference_id_in
		attr_accessor :replacing_entry_id_equal
		attr_accessor :replacing_entry_id_in
		attr_accessor :replaced_entry_id_equal
		attr_accessor :replaced_entry_id_in
		attr_accessor :replacement_status_equal
		attr_accessor :replacement_status_in
		attr_accessor :partner_sort_value_greater_than_or_equal
		attr_accessor :partner_sort_value_less_than_or_equal
		attr_accessor :root_entry_id_equal
		attr_accessor :root_entry_id_in
		attr_accessor :parent_entry_id_equal
		attr_accessor :entitled_users_edit_match_and
		attr_accessor :entitled_users_edit_match_or
		attr_accessor :entitled_users_publish_match_and
		attr_accessor :entitled_users_publish_match_or
		attr_accessor :entitled_users_view_match_and
		attr_accessor :entitled_users_view_match_or
		attr_accessor :tags_name_multi_like_or
		attr_accessor :tags_admin_tags_multi_like_or
		attr_accessor :tags_admin_tags_name_multi_like_or
		attr_accessor :tags_name_multi_like_and
		attr_accessor :tags_admin_tags_multi_like_and
		attr_accessor :tags_admin_tags_name_multi_like_and

		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
		end
		def categories_ids_empty=(val)
			@categories_ids_empty = val.to_i
		end
		def moderation_status_equal=(val)
			@moderation_status_equal = val.to_i
		end
		def moderation_status_not_equal=(val)
			@moderation_status_not_equal = val.to_i
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
		def total_rank_less_than_or_equal=(val)
			@total_rank_less_than_or_equal = val.to_i
		end
		def total_rank_greater_than_or_equal=(val)
			@total_rank_greater_than_or_equal = val.to_i
		end
		def group_id_equal=(val)
			@group_id_equal = val.to_i
		end
		def access_control_id_equal=(val)
			@access_control_id_equal = val.to_i
		end
		def start_date_greater_than_or_equal=(val)
			@start_date_greater_than_or_equal = val.to_i
		end
		def start_date_less_than_or_equal=(val)
			@start_date_less_than_or_equal = val.to_i
		end
		def start_date_greater_than_or_equal_or_null=(val)
			@start_date_greater_than_or_equal_or_null = val.to_i
		end
		def start_date_less_than_or_equal_or_null=(val)
			@start_date_less_than_or_equal_or_null = val.to_i
		end
		def end_date_greater_than_or_equal=(val)
			@end_date_greater_than_or_equal = val.to_i
		end
		def end_date_less_than_or_equal=(val)
			@end_date_less_than_or_equal = val.to_i
		end
		def end_date_greater_than_or_equal_or_null=(val)
			@end_date_greater_than_or_equal_or_null = val.to_i
		end
		def end_date_less_than_or_equal_or_null=(val)
			@end_date_less_than_or_equal_or_null = val.to_i
		end
		def partner_sort_value_greater_than_or_equal=(val)
			@partner_sort_value_greater_than_or_equal = val.to_i
		end
		def partner_sort_value_less_than_or_equal=(val)
			@partner_sort_value_less_than_or_equal = val.to_i
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
			if xml_element.elements['nameLike'] != nil
				self.name_like = xml_element.elements['nameLike'].text
			end
			if xml_element.elements['nameMultiLikeOr'] != nil
				self.name_multi_like_or = xml_element.elements['nameMultiLikeOr'].text
			end
			if xml_element.elements['nameMultiLikeAnd'] != nil
				self.name_multi_like_and = xml_element.elements['nameMultiLikeAnd'].text
			end
			if xml_element.elements['nameEqual'] != nil
				self.name_equal = xml_element.elements['nameEqual'].text
			end
			if xml_element.elements['partnerIdEqual'] != nil
				self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			end
			if xml_element.elements['partnerIdIn'] != nil
				self.partner_id_in = xml_element.elements['partnerIdIn'].text
			end
			if xml_element.elements['userIdEqual'] != nil
				self.user_id_equal = xml_element.elements['userIdEqual'].text
			end
			if xml_element.elements['userIdIn'] != nil
				self.user_id_in = xml_element.elements['userIdIn'].text
			end
			if xml_element.elements['userIdNotIn'] != nil
				self.user_id_not_in = xml_element.elements['userIdNotIn'].text
			end
			if xml_element.elements['creatorIdEqual'] != nil
				self.creator_id_equal = xml_element.elements['creatorIdEqual'].text
			end
			if xml_element.elements['tagsLike'] != nil
				self.tags_like = xml_element.elements['tagsLike'].text
			end
			if xml_element.elements['tagsMultiLikeOr'] != nil
				self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			end
			if xml_element.elements['tagsMultiLikeAnd'] != nil
				self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
			end
			if xml_element.elements['adminTagsLike'] != nil
				self.admin_tags_like = xml_element.elements['adminTagsLike'].text
			end
			if xml_element.elements['adminTagsMultiLikeOr'] != nil
				self.admin_tags_multi_like_or = xml_element.elements['adminTagsMultiLikeOr'].text
			end
			if xml_element.elements['adminTagsMultiLikeAnd'] != nil
				self.admin_tags_multi_like_and = xml_element.elements['adminTagsMultiLikeAnd'].text
			end
			if xml_element.elements['categoriesMatchAnd'] != nil
				self.categories_match_and = xml_element.elements['categoriesMatchAnd'].text
			end
			if xml_element.elements['categoriesMatchOr'] != nil
				self.categories_match_or = xml_element.elements['categoriesMatchOr'].text
			end
			if xml_element.elements['categoriesNotContains'] != nil
				self.categories_not_contains = xml_element.elements['categoriesNotContains'].text
			end
			if xml_element.elements['categoriesIdsMatchAnd'] != nil
				self.categories_ids_match_and = xml_element.elements['categoriesIdsMatchAnd'].text
			end
			if xml_element.elements['categoriesIdsMatchOr'] != nil
				self.categories_ids_match_or = xml_element.elements['categoriesIdsMatchOr'].text
			end
			if xml_element.elements['categoriesIdsNotContains'] != nil
				self.categories_ids_not_contains = xml_element.elements['categoriesIdsNotContains'].text
			end
			if xml_element.elements['categoriesIdsEmpty'] != nil
				self.categories_ids_empty = xml_element.elements['categoriesIdsEmpty'].text
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
			if xml_element.elements['moderationStatusEqual'] != nil
				self.moderation_status_equal = xml_element.elements['moderationStatusEqual'].text
			end
			if xml_element.elements['moderationStatusNotEqual'] != nil
				self.moderation_status_not_equal = xml_element.elements['moderationStatusNotEqual'].text
			end
			if xml_element.elements['moderationStatusIn'] != nil
				self.moderation_status_in = xml_element.elements['moderationStatusIn'].text
			end
			if xml_element.elements['moderationStatusNotIn'] != nil
				self.moderation_status_not_in = xml_element.elements['moderationStatusNotIn'].text
			end
			if xml_element.elements['typeEqual'] != nil
				self.type_equal = xml_element.elements['typeEqual'].text
			end
			if xml_element.elements['typeIn'] != nil
				self.type_in = xml_element.elements['typeIn'].text
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
			if xml_element.elements['totalRankLessThanOrEqual'] != nil
				self.total_rank_less_than_or_equal = xml_element.elements['totalRankLessThanOrEqual'].text
			end
			if xml_element.elements['totalRankGreaterThanOrEqual'] != nil
				self.total_rank_greater_than_or_equal = xml_element.elements['totalRankGreaterThanOrEqual'].text
			end
			if xml_element.elements['groupIdEqual'] != nil
				self.group_id_equal = xml_element.elements['groupIdEqual'].text
			end
			if xml_element.elements['searchTextMatchAnd'] != nil
				self.search_text_match_and = xml_element.elements['searchTextMatchAnd'].text
			end
			if xml_element.elements['searchTextMatchOr'] != nil
				self.search_text_match_or = xml_element.elements['searchTextMatchOr'].text
			end
			if xml_element.elements['accessControlIdEqual'] != nil
				self.access_control_id_equal = xml_element.elements['accessControlIdEqual'].text
			end
			if xml_element.elements['accessControlIdIn'] != nil
				self.access_control_id_in = xml_element.elements['accessControlIdIn'].text
			end
			if xml_element.elements['startDateGreaterThanOrEqual'] != nil
				self.start_date_greater_than_or_equal = xml_element.elements['startDateGreaterThanOrEqual'].text
			end
			if xml_element.elements['startDateLessThanOrEqual'] != nil
				self.start_date_less_than_or_equal = xml_element.elements['startDateLessThanOrEqual'].text
			end
			if xml_element.elements['startDateGreaterThanOrEqualOrNull'] != nil
				self.start_date_greater_than_or_equal_or_null = xml_element.elements['startDateGreaterThanOrEqualOrNull'].text
			end
			if xml_element.elements['startDateLessThanOrEqualOrNull'] != nil
				self.start_date_less_than_or_equal_or_null = xml_element.elements['startDateLessThanOrEqualOrNull'].text
			end
			if xml_element.elements['endDateGreaterThanOrEqual'] != nil
				self.end_date_greater_than_or_equal = xml_element.elements['endDateGreaterThanOrEqual'].text
			end
			if xml_element.elements['endDateLessThanOrEqual'] != nil
				self.end_date_less_than_or_equal = xml_element.elements['endDateLessThanOrEqual'].text
			end
			if xml_element.elements['endDateGreaterThanOrEqualOrNull'] != nil
				self.end_date_greater_than_or_equal_or_null = xml_element.elements['endDateGreaterThanOrEqualOrNull'].text
			end
			if xml_element.elements['endDateLessThanOrEqualOrNull'] != nil
				self.end_date_less_than_or_equal_or_null = xml_element.elements['endDateLessThanOrEqualOrNull'].text
			end
			if xml_element.elements['referenceIdEqual'] != nil
				self.reference_id_equal = xml_element.elements['referenceIdEqual'].text
			end
			if xml_element.elements['referenceIdIn'] != nil
				self.reference_id_in = xml_element.elements['referenceIdIn'].text
			end
			if xml_element.elements['replacingEntryIdEqual'] != nil
				self.replacing_entry_id_equal = xml_element.elements['replacingEntryIdEqual'].text
			end
			if xml_element.elements['replacingEntryIdIn'] != nil
				self.replacing_entry_id_in = xml_element.elements['replacingEntryIdIn'].text
			end
			if xml_element.elements['replacedEntryIdEqual'] != nil
				self.replaced_entry_id_equal = xml_element.elements['replacedEntryIdEqual'].text
			end
			if xml_element.elements['replacedEntryIdIn'] != nil
				self.replaced_entry_id_in = xml_element.elements['replacedEntryIdIn'].text
			end
			if xml_element.elements['replacementStatusEqual'] != nil
				self.replacement_status_equal = xml_element.elements['replacementStatusEqual'].text
			end
			if xml_element.elements['replacementStatusIn'] != nil
				self.replacement_status_in = xml_element.elements['replacementStatusIn'].text
			end
			if xml_element.elements['partnerSortValueGreaterThanOrEqual'] != nil
				self.partner_sort_value_greater_than_or_equal = xml_element.elements['partnerSortValueGreaterThanOrEqual'].text
			end
			if xml_element.elements['partnerSortValueLessThanOrEqual'] != nil
				self.partner_sort_value_less_than_or_equal = xml_element.elements['partnerSortValueLessThanOrEqual'].text
			end
			if xml_element.elements['rootEntryIdEqual'] != nil
				self.root_entry_id_equal = xml_element.elements['rootEntryIdEqual'].text
			end
			if xml_element.elements['rootEntryIdIn'] != nil
				self.root_entry_id_in = xml_element.elements['rootEntryIdIn'].text
			end
			if xml_element.elements['parentEntryIdEqual'] != nil
				self.parent_entry_id_equal = xml_element.elements['parentEntryIdEqual'].text
			end
			if xml_element.elements['entitledUsersEditMatchAnd'] != nil
				self.entitled_users_edit_match_and = xml_element.elements['entitledUsersEditMatchAnd'].text
			end
			if xml_element.elements['entitledUsersEditMatchOr'] != nil
				self.entitled_users_edit_match_or = xml_element.elements['entitledUsersEditMatchOr'].text
			end
			if xml_element.elements['entitledUsersPublishMatchAnd'] != nil
				self.entitled_users_publish_match_and = xml_element.elements['entitledUsersPublishMatchAnd'].text
			end
			if xml_element.elements['entitledUsersPublishMatchOr'] != nil
				self.entitled_users_publish_match_or = xml_element.elements['entitledUsersPublishMatchOr'].text
			end
			if xml_element.elements['entitledUsersViewMatchAnd'] != nil
				self.entitled_users_view_match_and = xml_element.elements['entitledUsersViewMatchAnd'].text
			end
			if xml_element.elements['entitledUsersViewMatchOr'] != nil
				self.entitled_users_view_match_or = xml_element.elements['entitledUsersViewMatchOr'].text
			end
			if xml_element.elements['tagsNameMultiLikeOr'] != nil
				self.tags_name_multi_like_or = xml_element.elements['tagsNameMultiLikeOr'].text
			end
			if xml_element.elements['tagsAdminTagsMultiLikeOr'] != nil
				self.tags_admin_tags_multi_like_or = xml_element.elements['tagsAdminTagsMultiLikeOr'].text
			end
			if xml_element.elements['tagsAdminTagsNameMultiLikeOr'] != nil
				self.tags_admin_tags_name_multi_like_or = xml_element.elements['tagsAdminTagsNameMultiLikeOr'].text
			end
			if xml_element.elements['tagsNameMultiLikeAnd'] != nil
				self.tags_name_multi_like_and = xml_element.elements['tagsNameMultiLikeAnd'].text
			end
			if xml_element.elements['tagsAdminTagsMultiLikeAnd'] != nil
				self.tags_admin_tags_multi_like_and = xml_element.elements['tagsAdminTagsMultiLikeAnd'].text
			end
			if xml_element.elements['tagsAdminTagsNameMultiLikeAnd'] != nil
				self.tags_admin_tags_name_multi_like_and = xml_element.elements['tagsAdminTagsNameMultiLikeAnd'].text
			end
		end

	end

	class KalturaBaseEntryFilter < KalturaBaseEntryBaseFilter
		attr_accessor :free_text
		attr_accessor :is_root
		attr_accessor :categories_full_name_in
		# All entries within this categoy or in child categories
		attr_accessor :category_ancestor_id_in
		# The id of the original entry
		attr_accessor :redirect_from_entry_id

		def is_root=(val)
			@is_root = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['freeText'] != nil
				self.free_text = xml_element.elements['freeText'].text
			end
			if xml_element.elements['isRoot'] != nil
				self.is_root = xml_element.elements['isRoot'].text
			end
			if xml_element.elements['categoriesFullNameIn'] != nil
				self.categories_full_name_in = xml_element.elements['categoriesFullNameIn'].text
			end
			if xml_element.elements['categoryAncestorIdIn'] != nil
				self.category_ancestor_id_in = xml_element.elements['categoryAncestorIdIn'].text
			end
			if xml_element.elements['redirectFromEntryId'] != nil
				self.redirect_from_entry_id = xml_element.elements['redirectFromEntryId'].text
			end
		end

	end

	class KalturaPlayableEntryBaseFilter < KalturaBaseEntryFilter
		attr_accessor :last_played_at_greater_than_or_equal
		attr_accessor :last_played_at_less_than_or_equal
		attr_accessor :duration_less_than
		attr_accessor :duration_greater_than
		attr_accessor :duration_less_than_or_equal
		attr_accessor :duration_greater_than_or_equal
		attr_accessor :duration_type_match_or

		def last_played_at_greater_than_or_equal=(val)
			@last_played_at_greater_than_or_equal = val.to_i
		end
		def last_played_at_less_than_or_equal=(val)
			@last_played_at_less_than_or_equal = val.to_i
		end
		def duration_less_than=(val)
			@duration_less_than = val.to_i
		end
		def duration_greater_than=(val)
			@duration_greater_than = val.to_i
		end
		def duration_less_than_or_equal=(val)
			@duration_less_than_or_equal = val.to_i
		end
		def duration_greater_than_or_equal=(val)
			@duration_greater_than_or_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['lastPlayedAtGreaterThanOrEqual'] != nil
				self.last_played_at_greater_than_or_equal = xml_element.elements['lastPlayedAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['lastPlayedAtLessThanOrEqual'] != nil
				self.last_played_at_less_than_or_equal = xml_element.elements['lastPlayedAtLessThanOrEqual'].text
			end
			if xml_element.elements['durationLessThan'] != nil
				self.duration_less_than = xml_element.elements['durationLessThan'].text
			end
			if xml_element.elements['durationGreaterThan'] != nil
				self.duration_greater_than = xml_element.elements['durationGreaterThan'].text
			end
			if xml_element.elements['durationLessThanOrEqual'] != nil
				self.duration_less_than_or_equal = xml_element.elements['durationLessThanOrEqual'].text
			end
			if xml_element.elements['durationGreaterThanOrEqual'] != nil
				self.duration_greater_than_or_equal = xml_element.elements['durationGreaterThanOrEqual'].text
			end
			if xml_element.elements['durationTypeMatchOr'] != nil
				self.duration_type_match_or = xml_element.elements['durationTypeMatchOr'].text
			end
		end

	end

	class KalturaPlayableEntryFilter < KalturaPlayableEntryBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMediaEntryBaseFilter < KalturaPlayableEntryFilter
		attr_accessor :media_type_equal
		attr_accessor :media_type_in
		attr_accessor :source_type_equal
		attr_accessor :source_type_not_equal
		attr_accessor :source_type_in
		attr_accessor :source_type_not_in
		attr_accessor :media_date_greater_than_or_equal
		attr_accessor :media_date_less_than_or_equal
		attr_accessor :flavor_params_ids_match_or
		attr_accessor :flavor_params_ids_match_and

		def media_type_equal=(val)
			@media_type_equal = val.to_i
		end
		def media_date_greater_than_or_equal=(val)
			@media_date_greater_than_or_equal = val.to_i
		end
		def media_date_less_than_or_equal=(val)
			@media_date_less_than_or_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['mediaTypeEqual'] != nil
				self.media_type_equal = xml_element.elements['mediaTypeEqual'].text
			end
			if xml_element.elements['mediaTypeIn'] != nil
				self.media_type_in = xml_element.elements['mediaTypeIn'].text
			end
			if xml_element.elements['sourceTypeEqual'] != nil
				self.source_type_equal = xml_element.elements['sourceTypeEqual'].text
			end
			if xml_element.elements['sourceTypeNotEqual'] != nil
				self.source_type_not_equal = xml_element.elements['sourceTypeNotEqual'].text
			end
			if xml_element.elements['sourceTypeIn'] != nil
				self.source_type_in = xml_element.elements['sourceTypeIn'].text
			end
			if xml_element.elements['sourceTypeNotIn'] != nil
				self.source_type_not_in = xml_element.elements['sourceTypeNotIn'].text
			end
			if xml_element.elements['mediaDateGreaterThanOrEqual'] != nil
				self.media_date_greater_than_or_equal = xml_element.elements['mediaDateGreaterThanOrEqual'].text
			end
			if xml_element.elements['mediaDateLessThanOrEqual'] != nil
				self.media_date_less_than_or_equal = xml_element.elements['mediaDateLessThanOrEqual'].text
			end
			if xml_element.elements['flavorParamsIdsMatchOr'] != nil
				self.flavor_params_ids_match_or = xml_element.elements['flavorParamsIdsMatchOr'].text
			end
			if xml_element.elements['flavorParamsIdsMatchAnd'] != nil
				self.flavor_params_ids_match_and = xml_element.elements['flavorParamsIdsMatchAnd'].text
			end
		end

	end

	class KalturaMediaEntryFilter < KalturaMediaEntryBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMediaEntryFilterForPlaylist < KalturaMediaEntryFilter
		attr_accessor :limit
		attr_accessor :name

		def limit=(val)
			@limit = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['limit'] != nil
				self.limit = xml_element.elements['limit'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
		end

	end

	class KalturaMixEntry < KalturaPlayableEntry
		# Indicates whether the user has submited a real thumbnail to the mix (Not the one that was generated automaticaly)
		attr_accessor :has_real_thumbnail
		# The editor type used to edit the metadata
		attr_accessor :editor_type
		# The xml data of the mix
		attr_accessor :data_content

		def has_real_thumbnail=(val)
			@has_real_thumbnail = to_b(val)
		end
		def editor_type=(val)
			@editor_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['hasRealThumbnail'] != nil
				self.has_real_thumbnail = xml_element.elements['hasRealThumbnail'].text
			end
			if xml_element.elements['editorType'] != nil
				self.editor_type = xml_element.elements['editorType'].text
			end
			if xml_element.elements['dataContent'] != nil
				self.data_content = xml_element.elements['dataContent'].text
			end
		end

	end

	class KalturaModerationFlag < KalturaObjectBase
		# Moderation flag id
		attr_accessor :id
		attr_accessor :partner_id
		# The user id that added the moderation flag
		attr_accessor :user_id
		# The type of the moderation flag (entry or user)
		attr_accessor :moderation_object_type
		# If moderation flag is set for entry, this is the flagged entry id
		attr_accessor :flagged_entry_id
		# If moderation flag is set for user, this is the flagged user id
		attr_accessor :flagged_user_id
		# The moderation flag status
		attr_accessor :status
		# The comment that was added to the flag
		attr_accessor :comments
		attr_accessor :flag_type
		attr_accessor :created_at
		attr_accessor :updated_at

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def flag_type=(val)
			@flag_type = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['moderationObjectType'] != nil
				self.moderation_object_type = xml_element.elements['moderationObjectType'].text
			end
			if xml_element.elements['flaggedEntryId'] != nil
				self.flagged_entry_id = xml_element.elements['flaggedEntryId'].text
			end
			if xml_element.elements['flaggedUserId'] != nil
				self.flagged_user_id = xml_element.elements['flaggedUserId'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['comments'] != nil
				self.comments = xml_element.elements['comments'].text
			end
			if xml_element.elements['flagType'] != nil
				self.flag_type = xml_element.elements['flagType'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
		end

	end

	class KalturaPartnerStatistics < KalturaObjectBase
		# Package total allowed bandwidth and storage
		attr_accessor :package_bandwidth_and_storage
		# Partner total hosting in GB on the disk
		attr_accessor :hosting
		# Partner total bandwidth in GB
		attr_accessor :bandwidth
		# total usage in GB - including bandwidth and storage
		attr_accessor :usage
		# Percent of usage out of partner's package. if usage is 5GB and package is 10GB, this value will be 50
		attr_accessor :usage_percent
		# date when partner reached the limit of his package (timestamp)
		attr_accessor :reached_limit_date

		def package_bandwidth_and_storage=(val)
			@package_bandwidth_and_storage = val.to_i
		end
		def hosting=(val)
			@hosting = val.to_f
		end
		def bandwidth=(val)
			@bandwidth = val.to_f
		end
		def usage=(val)
			@usage = val.to_i
		end
		def usage_percent=(val)
			@usage_percent = val.to_f
		end
		def reached_limit_date=(val)
			@reached_limit_date = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['packageBandwidthAndStorage'] != nil
				self.package_bandwidth_and_storage = xml_element.elements['packageBandwidthAndStorage'].text
			end
			if xml_element.elements['hosting'] != nil
				self.hosting = xml_element.elements['hosting'].text
			end
			if xml_element.elements['bandwidth'] != nil
				self.bandwidth = xml_element.elements['bandwidth'].text
			end
			if xml_element.elements['usage'] != nil
				self.usage = xml_element.elements['usage'].text
			end
			if xml_element.elements['usagePercent'] != nil
				self.usage_percent = xml_element.elements['usagePercent'].text
			end
			if xml_element.elements['reachedLimitDate'] != nil
				self.reached_limit_date = xml_element.elements['reachedLimitDate'].text
			end
		end

	end

	class KalturaPartnerUsage < KalturaObjectBase
		# Partner total hosting in GB on the disk
		attr_accessor :hosting_gb
		# percent of usage out of partner's package. if usageGB is 5 and package is 10GB, this value will be 50
		attr_accessor :percent
		# package total BW - actually this is usage, which represents BW+storage
		attr_accessor :package_bw
		# total usage in GB - including bandwidth and storage
		attr_accessor :usage_gb
		# date when partner reached the limit of his package (timestamp)
		attr_accessor :reached_limit_date
		# a semi-colon separated list of comma-separated key-values to represent a usage graph.
		# 	 keys could be 1-12 for a year view (1,1.2;2,1.1;3,0.9;...;12,1.4;)
		# 	 keys could be 1-[28,29,30,31] depending on the requested month, for a daily view in a given month (1,0.4;2,0.2;...;31,0.1;)
		attr_accessor :usage_graph

		def hosting_gb=(val)
			@hosting_gb = val.to_f
		end
		def percent=(val)
			@percent = val.to_f
		end
		def package_bw=(val)
			@package_bw = val.to_i
		end
		def usage_gb=(val)
			@usage_gb = val.to_f
		end
		def reached_limit_date=(val)
			@reached_limit_date = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['hostingGB'] != nil
				self.hosting_gb = xml_element.elements['hostingGB'].text
			end
			if xml_element.elements['Percent'] != nil
				self.percent = xml_element.elements['Percent'].text
			end
			if xml_element.elements['packageBW'] != nil
				self.package_bw = xml_element.elements['packageBW'].text
			end
			if xml_element.elements['usageGB'] != nil
				self.usage_gb = xml_element.elements['usageGB'].text
			end
			if xml_element.elements['reachedLimitDate'] != nil
				self.reached_limit_date = xml_element.elements['reachedLimitDate'].text
			end
			if xml_element.elements['usageGraph'] != nil
				self.usage_graph = xml_element.elements['usageGraph'].text
			end
		end

	end

	class KalturaPermission < KalturaObjectBase
		attr_accessor :id
		attr_accessor :type
		attr_accessor :name
		attr_accessor :friendly_name
		attr_accessor :description
		attr_accessor :status
		attr_accessor :partner_id
		attr_accessor :depends_on_permission_names
		attr_accessor :tags
		attr_accessor :permission_items_ids
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :partner_group

		def id=(val)
			@id = val.to_i
		end
		def type=(val)
			@type = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['friendlyName'] != nil
				self.friendly_name = xml_element.elements['friendlyName'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['dependsOnPermissionNames'] != nil
				self.depends_on_permission_names = xml_element.elements['dependsOnPermissionNames'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['permissionItemsIds'] != nil
				self.permission_items_ids = xml_element.elements['permissionItemsIds'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['partnerGroup'] != nil
				self.partner_group = xml_element.elements['partnerGroup'].text
			end
		end

	end

	class KalturaPermissionItem < KalturaObjectBase
		attr_accessor :id
		attr_accessor :type
		attr_accessor :partner_id
		attr_accessor :tags
		attr_accessor :created_at
		attr_accessor :updated_at

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
		end

	end

	class KalturaPlaybackSource < KalturaObjectBase
		attr_accessor :delivery_profile_id
		# source format according to delivery profile streamer type (applehttp, mpegdash etc.)
		attr_accessor :format
		# comma separated string according to deliveryProfile media protocols ('http,https' etc.)
		attr_accessor :protocols
		# comma separated string of flavor ids
		attr_accessor :flavor_ids
		attr_accessor :url
		# drm data object containing relevant license url ,scheme name and certificate
		attr_accessor :drm


		def from_xml(xml_element)
			super
			if xml_element.elements['deliveryProfileId'] != nil
				self.delivery_profile_id = xml_element.elements['deliveryProfileId'].text
			end
			if xml_element.elements['format'] != nil
				self.format = xml_element.elements['format'].text
			end
			if xml_element.elements['protocols'] != nil
				self.protocols = xml_element.elements['protocols'].text
			end
			if xml_element.elements['flavorIds'] != nil
				self.flavor_ids = xml_element.elements['flavorIds'].text
			end
			if xml_element.elements['url'] != nil
				self.url = xml_element.elements['url'].text
			end
			if xml_element.elements['drm'] != nil
				self.drm = KalturaClientBase.object_from_xml(xml_element.elements['drm'], 'KalturaDrmPlaybackPluginData')
			end
		end

	end

	class KalturaPlaybackContext < KalturaObjectBase
		attr_accessor :sources
		attr_accessor :playback_captions
		attr_accessor :flavor_assets
		# Array of actions as received from the rules that invalidated
		attr_accessor :actions
		# Array of actions as received from the rules that invalidated
		attr_accessor :messages


		def from_xml(xml_element)
			super
			if xml_element.elements['sources'] != nil
				self.sources = KalturaClientBase.object_from_xml(xml_element.elements['sources'], 'KalturaPlaybackSource')
			end
			if xml_element.elements['playbackCaptions'] != nil
				self.playback_captions = KalturaClientBase.object_from_xml(xml_element.elements['playbackCaptions'], 'KalturaCaptionPlaybackPluginData')
			end
			if xml_element.elements['flavorAssets'] != nil
				self.flavor_assets = KalturaClientBase.object_from_xml(xml_element.elements['flavorAssets'], 'KalturaFlavorAsset')
			end
			if xml_element.elements['actions'] != nil
				self.actions = KalturaClientBase.object_from_xml(xml_element.elements['actions'], 'KalturaRuleAction')
			end
			if xml_element.elements['messages'] != nil
				self.messages = KalturaClientBase.object_from_xml(xml_element.elements['messages'], 'KalturaAccessControlMessage')
			end
		end

	end

	class KalturaPlaylist < KalturaBaseEntry
		# Content of the playlist - 
		# 	 XML if the playlistType is dynamic 
		# 	 text if the playlistType is static 
		# 	 url if the playlistType is mRss
		attr_accessor :playlist_content
		attr_accessor :filters
		# Maximum count of results to be returned in playlist execution
		attr_accessor :total_results
		# Type of playlist
		attr_accessor :playlist_type
		# Number of plays
		attr_accessor :plays
		# Number of views
		attr_accessor :views
		# The duration in seconds
		attr_accessor :duration
		# The url for this playlist
		attr_accessor :execute_url

		def total_results=(val)
			@total_results = val.to_i
		end
		def playlist_type=(val)
			@playlist_type = val.to_i
		end
		def plays=(val)
			@plays = val.to_i
		end
		def views=(val)
			@views = val.to_i
		end
		def duration=(val)
			@duration = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['playlistContent'] != nil
				self.playlist_content = xml_element.elements['playlistContent'].text
			end
			if xml_element.elements['filters'] != nil
				self.filters = KalturaClientBase.object_from_xml(xml_element.elements['filters'], 'KalturaMediaEntryFilterForPlaylist')
			end
			if xml_element.elements['totalResults'] != nil
				self.total_results = xml_element.elements['totalResults'].text
			end
			if xml_element.elements['playlistType'] != nil
				self.playlist_type = xml_element.elements['playlistType'].text
			end
			if xml_element.elements['plays'] != nil
				self.plays = xml_element.elements['plays'].text
			end
			if xml_element.elements['views'] != nil
				self.views = xml_element.elements['views'].text
			end
			if xml_element.elements['duration'] != nil
				self.duration = xml_element.elements['duration'].text
			end
			if xml_element.elements['executeUrl'] != nil
				self.execute_url = xml_element.elements['executeUrl'].text
			end
		end

	end

	class KalturaRemotePath < KalturaObjectBase
		attr_accessor :storage_profile_id
		attr_accessor :uri

		def storage_profile_id=(val)
			@storage_profile_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['storageProfileId'] != nil
				self.storage_profile_id = xml_element.elements['storageProfileId'].text
			end
			if xml_element.elements['uri'] != nil
				self.uri = xml_element.elements['uri'].text
			end
		end

	end

	# Used to ingest media that is available on remote server and accessible using the supplied URL, media file will be downloaded using import job in order to make the asset ready.
	class KalturaUrlResource < KalturaContentResource
		# Remote URL, FTP, HTTP or HTTPS
		attr_accessor :url
		# Force Import Job
		attr_accessor :force_async_download

		def force_async_download=(val)
			@force_async_download = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['url'] != nil
				self.url = xml_element.elements['url'].text
			end
			if xml_element.elements['forceAsyncDownload'] != nil
				self.force_async_download = xml_element.elements['forceAsyncDownload'].text
			end
		end

	end

	# Used to ingest media that is available on remote server and accessible using the supplied URL, the media file won't be downloaded but a file sync object of URL type will point to the media URL.
	class KalturaRemoteStorageResource < KalturaUrlResource
		# ID of storage profile to be associated with the created file sync, used for file serving URL composing.
		attr_accessor :storage_profile_id

		def storage_profile_id=(val)
			@storage_profile_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['storageProfileId'] != nil
				self.storage_profile_id = xml_element.elements['storageProfileId'].text
			end
		end

	end

	class KalturaReport < KalturaObjectBase
		# Report id
		attr_accessor :id
		# Partner id associated with the report
		attr_accessor :partner_id
		# Report name
		attr_accessor :name
		# Used to identify system reports in a friendly way
		attr_accessor :system_name
		# Report description
		attr_accessor :description
		# Report query
		attr_accessor :query
		# Creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Last update date as Unix timestamp (In seconds)
		attr_accessor :updated_at

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
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
			if xml_element.elements['query'] != nil
				self.query = xml_element.elements['query'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
		end

	end

	class KalturaReportBaseTotal < KalturaObjectBase
		attr_accessor :id
		attr_accessor :data


		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['data'] != nil
				self.data = xml_element.elements['data'].text
			end
		end

	end

	class KalturaReportGraph < KalturaObjectBase
		attr_accessor :id
		attr_accessor :data


		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['data'] != nil
				self.data = xml_element.elements['data'].text
			end
		end

	end

	class KalturaReportInputBaseFilter < KalturaObjectBase
		# Start date as Unix timestamp (In seconds)
		attr_accessor :from_date
		# End date as Unix timestamp (In seconds)
		attr_accessor :to_date
		# Start day as string (YYYYMMDD)
		attr_accessor :from_day
		# End date as string (YYYYMMDD)
		attr_accessor :to_day

		def from_date=(val)
			@from_date = val.to_i
		end
		def to_date=(val)
			@to_date = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['fromDate'] != nil
				self.from_date = xml_element.elements['fromDate'].text
			end
			if xml_element.elements['toDate'] != nil
				self.to_date = xml_element.elements['toDate'].text
			end
			if xml_element.elements['fromDay'] != nil
				self.from_day = xml_element.elements['fromDay'].text
			end
			if xml_element.elements['toDay'] != nil
				self.to_day = xml_element.elements['toDay'].text
			end
		end

	end

	class KalturaReportResponse < KalturaObjectBase
		attr_accessor :columns
		attr_accessor :results


		def from_xml(xml_element)
			super
			if xml_element.elements['columns'] != nil
				self.columns = xml_element.elements['columns'].text
			end
			if xml_element.elements['results'] != nil
				self.results = KalturaClientBase.object_from_xml(xml_element.elements['results'], 'KalturaString')
			end
		end

	end

	class KalturaReportResponseOptions < KalturaObjectBase
		attr_accessor :delimiter
		attr_accessor :skip_empty_dates

		def skip_empty_dates=(val)
			@skip_empty_dates = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['delimiter'] != nil
				self.delimiter = xml_element.elements['delimiter'].text
			end
			if xml_element.elements['skipEmptyDates'] != nil
				self.skip_empty_dates = xml_element.elements['skipEmptyDates'].text
			end
		end

	end

	class KalturaReportTable < KalturaObjectBase
		attr_accessor :header
		attr_accessor :data
		attr_accessor :total_count

		def total_count=(val)
			@total_count = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['header'] != nil
				self.header = xml_element.elements['header'].text
			end
			if xml_element.elements['data'] != nil
				self.data = xml_element.elements['data'].text
			end
			if xml_element.elements['totalCount'] != nil
				self.total_count = xml_element.elements['totalCount'].text
			end
		end

	end

	class KalturaReportTotal < KalturaObjectBase
		attr_accessor :header
		attr_accessor :data


		def from_xml(xml_element)
			super
			if xml_element.elements['header'] != nil
				self.header = xml_element.elements['header'].text
			end
			if xml_element.elements['data'] != nil
				self.data = xml_element.elements['data'].text
			end
		end

	end

	# Define client request optional configurations
	#  /
	class KalturaRequestConfiguration < KalturaObjectBase
		# Impersonated partner id
		attr_accessor :partner_id
		# Kaltura API session
		attr_accessor :ks
		# Response profile - this attribute will be automatically unset after every API call.
		attr_accessor :response_profile

		def partner_id=(val)
			@partner_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['ks'] != nil
				self.ks = xml_element.elements['ks'].text
			end
			if xml_element.elements['responseProfile'] != nil
				self.response_profile = KalturaClientBase.object_from_xml(xml_element.elements['responseProfile'], 'KalturaBaseResponseProfile')
			end
		end

	end

	class KalturaResponseProfile < KalturaDetachedResponseProfile
		# Auto generated numeric identifier
		attr_accessor :id
		# Unique system name
		attr_accessor :system_name
		attr_accessor :partner_id
		# Creation time as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Update time as Unix timestamp (In seconds)
		attr_accessor :updated_at
		attr_accessor :status
		attr_accessor :version

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def version=(val)
			@version = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['systemName'] != nil
				self.system_name = xml_element.elements['systemName'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['version'] != nil
				self.version = xml_element.elements['version'].text
			end
		end

	end

	class KalturaResponseProfileCacheRecalculateOptions < KalturaObjectBase
		# Maximum number of keys to recalculate
		attr_accessor :limit
		# Class name
		attr_accessor :cached_object_type
		attr_accessor :object_id
		attr_accessor :start_object_key
		attr_accessor :end_object_key
		attr_accessor :job_created_at
		attr_accessor :is_first_loop

		def limit=(val)
			@limit = val.to_i
		end
		def job_created_at=(val)
			@job_created_at = val.to_i
		end
		def is_first_loop=(val)
			@is_first_loop = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['limit'] != nil
				self.limit = xml_element.elements['limit'].text
			end
			if xml_element.elements['cachedObjectType'] != nil
				self.cached_object_type = xml_element.elements['cachedObjectType'].text
			end
			if xml_element.elements['objectId'] != nil
				self.object_id = xml_element.elements['objectId'].text
			end
			if xml_element.elements['startObjectKey'] != nil
				self.start_object_key = xml_element.elements['startObjectKey'].text
			end
			if xml_element.elements['endObjectKey'] != nil
				self.end_object_key = xml_element.elements['endObjectKey'].text
			end
			if xml_element.elements['jobCreatedAt'] != nil
				self.job_created_at = xml_element.elements['jobCreatedAt'].text
			end
			if xml_element.elements['isFirstLoop'] != nil
				self.is_first_loop = xml_element.elements['isFirstLoop'].text
			end
		end

	end

	class KalturaResponseProfileCacheRecalculateResults < KalturaObjectBase
		# Last recalculated id
		attr_accessor :last_object_key
		# Number of recalculated keys
		attr_accessor :recalculated

		def recalculated=(val)
			@recalculated = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['lastObjectKey'] != nil
				self.last_object_key = xml_element.elements['lastObjectKey'].text
			end
			if xml_element.elements['recalculated'] != nil
				self.recalculated = xml_element.elements['recalculated'].text
			end
		end

	end

	class KalturaScope < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSearch < KalturaObjectBase
		attr_accessor :key_words
		attr_accessor :search_source
		attr_accessor :media_type
		# Use this field to pass dynamic data for searching
		# 	 For example - if you set this field to "mymovies_$partner_id"
		# 	 The $partner_id will be automatically replcaed with your real partner Id
		attr_accessor :extra_data
		attr_accessor :auth_data

		def search_source=(val)
			@search_source = val.to_i
		end
		def media_type=(val)
			@media_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['keyWords'] != nil
				self.key_words = xml_element.elements['keyWords'].text
			end
			if xml_element.elements['searchSource'] != nil
				self.search_source = xml_element.elements['searchSource'].text
			end
			if xml_element.elements['mediaType'] != nil
				self.media_type = xml_element.elements['mediaType'].text
			end
			if xml_element.elements['extraData'] != nil
				self.extra_data = xml_element.elements['extraData'].text
			end
			if xml_element.elements['authData'] != nil
				self.auth_data = xml_element.elements['authData'].text
			end
		end

	end

	class KalturaSearchAuthData < KalturaObjectBase
		# The authentication data that further should be used for search
		attr_accessor :auth_data
		# Login URL when user need to sign-in and authorize the search
		attr_accessor :login_url
		# Information when there was an error
		attr_accessor :message


		def from_xml(xml_element)
			super
			if xml_element.elements['authData'] != nil
				self.auth_data = xml_element.elements['authData'].text
			end
			if xml_element.elements['loginUrl'] != nil
				self.login_url = xml_element.elements['loginUrl'].text
			end
			if xml_element.elements['message'] != nil
				self.message = xml_element.elements['message'].text
			end
		end

	end

	class KalturaSearchResult < KalturaSearch
		attr_accessor :id
		attr_accessor :title
		attr_accessor :thumb_url
		attr_accessor :description
		attr_accessor :tags
		attr_accessor :url
		attr_accessor :source_link
		attr_accessor :credit
		attr_accessor :license_type
		attr_accessor :flash_playback_type
		attr_accessor :file_ext

		def license_type=(val)
			@license_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['title'] != nil
				self.title = xml_element.elements['title'].text
			end
			if xml_element.elements['thumbUrl'] != nil
				self.thumb_url = xml_element.elements['thumbUrl'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['url'] != nil
				self.url = xml_element.elements['url'].text
			end
			if xml_element.elements['sourceLink'] != nil
				self.source_link = xml_element.elements['sourceLink'].text
			end
			if xml_element.elements['credit'] != nil
				self.credit = xml_element.elements['credit'].text
			end
			if xml_element.elements['licenseType'] != nil
				self.license_type = xml_element.elements['licenseType'].text
			end
			if xml_element.elements['flashPlaybackType'] != nil
				self.flash_playback_type = xml_element.elements['flashPlaybackType'].text
			end
			if xml_element.elements['fileExt'] != nil
				self.file_ext = xml_element.elements['fileExt'].text
			end
		end

	end

	class KalturaSearchResultResponse < KalturaObjectBase
		attr_accessor :objects
		attr_accessor :need_media_info

		def need_media_info=(val)
			@need_media_info = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaSearchResult')
			end
			if xml_element.elements['needMediaInfo'] != nil
				self.need_media_info = xml_element.elements['needMediaInfo'].text
			end
		end

	end

	class KalturaServerNode < KalturaObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :heartbeat_time
		# serverNode name
		attr_accessor :name
		# serverNode uniqe system name
		attr_accessor :system_name
		attr_accessor :description
		# serverNode hostName
		attr_accessor :host_name
		attr_accessor :status
		attr_accessor :type
		# serverNode tags
		attr_accessor :tags
		# DC where the serverNode is located
		attr_accessor :dc
		# Id of the parent serverNode
		attr_accessor :parent_id
		# Environment
		attr_accessor :environment

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def heartbeat_time=(val)
			@heartbeat_time = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def dc=(val)
			@dc = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['heartbeatTime'] != nil
				self.heartbeat_time = xml_element.elements['heartbeatTime'].text
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
			if xml_element.elements['hostName'] != nil
				self.host_name = xml_element.elements['hostName'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['dc'] != nil
				self.dc = xml_element.elements['dc'].text
			end
			if xml_element.elements['parentId'] != nil
				self.parent_id = xml_element.elements['parentId'].text
			end
			if xml_element.elements['environment'] != nil
				self.environment = xml_element.elements['environment'].text
			end
		end

	end

	class KalturaSessionInfo < KalturaObjectBase
		attr_accessor :ks
		attr_accessor :session_type
		attr_accessor :partner_id
		attr_accessor :user_id
		attr_accessor :expiry
		attr_accessor :privileges

		def session_type=(val)
			@session_type = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def expiry=(val)
			@expiry = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['ks'] != nil
				self.ks = xml_element.elements['ks'].text
			end
			if xml_element.elements['sessionType'] != nil
				self.session_type = xml_element.elements['sessionType'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['expiry'] != nil
				self.expiry = xml_element.elements['expiry'].text
			end
			if xml_element.elements['privileges'] != nil
				self.privileges = xml_element.elements['privileges'].text
			end
		end

	end

	class KalturaSourceFileSyncDescriptor < KalturaFileSyncDescriptor
		# The translated path as used by the scheduler
		attr_accessor :actual_file_sync_local_path
		attr_accessor :asset_id
		attr_accessor :asset_params_id

		def asset_params_id=(val)
			@asset_params_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['actualFileSyncLocalPath'] != nil
				self.actual_file_sync_local_path = xml_element.elements['actualFileSyncLocalPath'].text
			end
			if xml_element.elements['assetId'] != nil
				self.asset_id = xml_element.elements['assetId'].text
			end
			if xml_element.elements['assetParamsId'] != nil
				self.asset_params_id = xml_element.elements['assetParamsId'].text
			end
		end

	end

	class KalturaStartWidgetSessionResponse < KalturaObjectBase
		attr_accessor :partner_id
		attr_accessor :ks
		attr_accessor :user_id

		def partner_id=(val)
			@partner_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['ks'] != nil
				self.ks = xml_element.elements['ks'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
		end

	end

	# Will hold data from the Kaltura UI components to be passed on to the reports and analytics system
	class KalturaStatsEvent < KalturaObjectBase
		attr_accessor :client_ver
		attr_accessor :event_type
		# the client's timestamp of this event
		attr_accessor :event_timestamp
		# a unique string generated by the client that will represent the client-side session: the primary component will pass it on to other components that sprout from it
		attr_accessor :session_id
		attr_accessor :partner_id
		attr_accessor :entry_id
		# the UV cookie - creates in the operational system and should be passed on ofr every event
		attr_accessor :unique_viewer
		attr_accessor :widget_id
		attr_accessor :uiconf_id
		# the partner's user id
		attr_accessor :user_id
		# the timestamp along the video when the event happend
		attr_accessor :current_point
		# the duration of the video in milliseconds - will make it much faster than quering the db for each entry
		attr_accessor :duration
		# will be retrieved from the request of the user
		attr_accessor :user_ip
		# the time in milliseconds the event took
		attr_accessor :process_duration
		# the id of the GUI control - will be used in the future to better understand what the user clicked
		attr_accessor :control_id
		# true if the user ever used seek in this session
		attr_accessor :seek
		# timestamp of the new point on the timeline of the video after the user seeks
		attr_accessor :new_point
		# the referrer of the client
		attr_accessor :referrer
		# will indicate if the event is thrown for the first video in the session
		attr_accessor :is_first_in_session
		# kaltura application name
		attr_accessor :application_id
		attr_accessor :context_id
		attr_accessor :feature_type

		def event_type=(val)
			@event_type = val.to_i
		end
		def event_timestamp=(val)
			@event_timestamp = val.to_f
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def uiconf_id=(val)
			@uiconf_id = val.to_i
		end
		def current_point=(val)
			@current_point = val.to_i
		end
		def duration=(val)
			@duration = val.to_i
		end
		def process_duration=(val)
			@process_duration = val.to_i
		end
		def seek=(val)
			@seek = to_b(val)
		end
		def new_point=(val)
			@new_point = val.to_i
		end
		def is_first_in_session=(val)
			@is_first_in_session = to_b(val)
		end
		def context_id=(val)
			@context_id = val.to_i
		end
		def feature_type=(val)
			@feature_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['clientVer'] != nil
				self.client_ver = xml_element.elements['clientVer'].text
			end
			if xml_element.elements['eventType'] != nil
				self.event_type = xml_element.elements['eventType'].text
			end
			if xml_element.elements['eventTimestamp'] != nil
				self.event_timestamp = xml_element.elements['eventTimestamp'].text
			end
			if xml_element.elements['sessionId'] != nil
				self.session_id = xml_element.elements['sessionId'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['uniqueViewer'] != nil
				self.unique_viewer = xml_element.elements['uniqueViewer'].text
			end
			if xml_element.elements['widgetId'] != nil
				self.widget_id = xml_element.elements['widgetId'].text
			end
			if xml_element.elements['uiconfId'] != nil
				self.uiconf_id = xml_element.elements['uiconfId'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['currentPoint'] != nil
				self.current_point = xml_element.elements['currentPoint'].text
			end
			if xml_element.elements['duration'] != nil
				self.duration = xml_element.elements['duration'].text
			end
			if xml_element.elements['userIp'] != nil
				self.user_ip = xml_element.elements['userIp'].text
			end
			if xml_element.elements['processDuration'] != nil
				self.process_duration = xml_element.elements['processDuration'].text
			end
			if xml_element.elements['controlId'] != nil
				self.control_id = xml_element.elements['controlId'].text
			end
			if xml_element.elements['seek'] != nil
				self.seek = xml_element.elements['seek'].text
			end
			if xml_element.elements['newPoint'] != nil
				self.new_point = xml_element.elements['newPoint'].text
			end
			if xml_element.elements['referrer'] != nil
				self.referrer = xml_element.elements['referrer'].text
			end
			if xml_element.elements['isFirstInSession'] != nil
				self.is_first_in_session = xml_element.elements['isFirstInSession'].text
			end
			if xml_element.elements['applicationId'] != nil
				self.application_id = xml_element.elements['applicationId'].text
			end
			if xml_element.elements['contextId'] != nil
				self.context_id = xml_element.elements['contextId'].text
			end
			if xml_element.elements['featureType'] != nil
				self.feature_type = xml_element.elements['featureType'].text
			end
		end

	end

	# Will hold data from the Kaltura UI components to be passed on to the reports and analytics system
	class KalturaStatsKmcEvent < KalturaObjectBase
		attr_accessor :client_ver
		attr_accessor :kmc_event_action_path
		attr_accessor :kmc_event_type
		# the client's timestamp of this event
		attr_accessor :event_timestamp
		# a unique string generated by the client that will represent the client-side session: the primary component will pass it on to other components that sprout from it
		attr_accessor :session_id
		attr_accessor :partner_id
		attr_accessor :entry_id
		attr_accessor :widget_id
		attr_accessor :uiconf_id
		# the partner's user id
		attr_accessor :user_id
		# will be retrieved from the request of the user
		attr_accessor :user_ip

		def kmc_event_type=(val)
			@kmc_event_type = val.to_i
		end
		def event_timestamp=(val)
			@event_timestamp = val.to_f
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def uiconf_id=(val)
			@uiconf_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['clientVer'] != nil
				self.client_ver = xml_element.elements['clientVer'].text
			end
			if xml_element.elements['kmcEventActionPath'] != nil
				self.kmc_event_action_path = xml_element.elements['kmcEventActionPath'].text
			end
			if xml_element.elements['kmcEventType'] != nil
				self.kmc_event_type = xml_element.elements['kmcEventType'].text
			end
			if xml_element.elements['eventTimestamp'] != nil
				self.event_timestamp = xml_element.elements['eventTimestamp'].text
			end
			if xml_element.elements['sessionId'] != nil
				self.session_id = xml_element.elements['sessionId'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['widgetId'] != nil
				self.widget_id = xml_element.elements['widgetId'].text
			end
			if xml_element.elements['uiconfId'] != nil
				self.uiconf_id = xml_element.elements['uiconfId'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['userIp'] != nil
				self.user_ip = xml_element.elements['userIp'].text
			end
		end

	end

	class KalturaStorageProfile < KalturaObjectBase
		attr_accessor :id
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :partner_id
		attr_accessor :name
		attr_accessor :system_name
		attr_accessor :desciption
		attr_accessor :status
		attr_accessor :protocol
		attr_accessor :storage_url
		attr_accessor :storage_base_dir
		attr_accessor :storage_username
		attr_accessor :storage_password
		attr_accessor :storage_ftp_passive_mode
		attr_accessor :min_file_size
		attr_accessor :max_file_size
		attr_accessor :flavor_params_ids
		attr_accessor :max_concurrent_connections
		attr_accessor :path_manager_class
		attr_accessor :path_manager_params
		# No need to create enum for temp field
		attr_accessor :trigger
		# Delivery Priority
		attr_accessor :delivery_priority
		attr_accessor :delivery_status
		attr_accessor :ready_behavior
		# Flag sugnifying that the storage exported content should be deleted when soure entry is deleted
		attr_accessor :allow_auto_delete
		# Indicates to the local file transfer manager to create a link to the file instead of copying it
		attr_accessor :create_file_link
		# Holds storage profile export rules
		attr_accessor :rules
		# Delivery profile ids
		attr_accessor :delivery_profile_ids
		attr_accessor :private_key
		attr_accessor :public_key
		attr_accessor :pass_phrase
		attr_accessor :should_export_thumbs

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
		def status=(val)
			@status = val.to_i
		end
		def storage_ftp_passive_mode=(val)
			@storage_ftp_passive_mode = to_b(val)
		end
		def min_file_size=(val)
			@min_file_size = val.to_i
		end
		def max_file_size=(val)
			@max_file_size = val.to_i
		end
		def max_concurrent_connections=(val)
			@max_concurrent_connections = val.to_i
		end
		def trigger=(val)
			@trigger = val.to_i
		end
		def delivery_priority=(val)
			@delivery_priority = val.to_i
		end
		def delivery_status=(val)
			@delivery_status = val.to_i
		end
		def ready_behavior=(val)
			@ready_behavior = val.to_i
		end
		def allow_auto_delete=(val)
			@allow_auto_delete = val.to_i
		end
		def create_file_link=(val)
			@create_file_link = to_b(val)
		end
		def should_export_thumbs=(val)
			@should_export_thumbs = to_b(val)
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
			if xml_element.elements['desciption'] != nil
				self.desciption = xml_element.elements['desciption'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['protocol'] != nil
				self.protocol = xml_element.elements['protocol'].text
			end
			if xml_element.elements['storageUrl'] != nil
				self.storage_url = xml_element.elements['storageUrl'].text
			end
			if xml_element.elements['storageBaseDir'] != nil
				self.storage_base_dir = xml_element.elements['storageBaseDir'].text
			end
			if xml_element.elements['storageUsername'] != nil
				self.storage_username = xml_element.elements['storageUsername'].text
			end
			if xml_element.elements['storagePassword'] != nil
				self.storage_password = xml_element.elements['storagePassword'].text
			end
			if xml_element.elements['storageFtpPassiveMode'] != nil
				self.storage_ftp_passive_mode = xml_element.elements['storageFtpPassiveMode'].text
			end
			if xml_element.elements['minFileSize'] != nil
				self.min_file_size = xml_element.elements['minFileSize'].text
			end
			if xml_element.elements['maxFileSize'] != nil
				self.max_file_size = xml_element.elements['maxFileSize'].text
			end
			if xml_element.elements['flavorParamsIds'] != nil
				self.flavor_params_ids = xml_element.elements['flavorParamsIds'].text
			end
			if xml_element.elements['maxConcurrentConnections'] != nil
				self.max_concurrent_connections = xml_element.elements['maxConcurrentConnections'].text
			end
			if xml_element.elements['pathManagerClass'] != nil
				self.path_manager_class = xml_element.elements['pathManagerClass'].text
			end
			if xml_element.elements['pathManagerParams'] != nil
				self.path_manager_params = KalturaClientBase.object_from_xml(xml_element.elements['pathManagerParams'], 'KalturaKeyValue')
			end
			if xml_element.elements['trigger'] != nil
				self.trigger = xml_element.elements['trigger'].text
			end
			if xml_element.elements['deliveryPriority'] != nil
				self.delivery_priority = xml_element.elements['deliveryPriority'].text
			end
			if xml_element.elements['deliveryStatus'] != nil
				self.delivery_status = xml_element.elements['deliveryStatus'].text
			end
			if xml_element.elements['readyBehavior'] != nil
				self.ready_behavior = xml_element.elements['readyBehavior'].text
			end
			if xml_element.elements['allowAutoDelete'] != nil
				self.allow_auto_delete = xml_element.elements['allowAutoDelete'].text
			end
			if xml_element.elements['createFileLink'] != nil
				self.create_file_link = xml_element.elements['createFileLink'].text
			end
			if xml_element.elements['rules'] != nil
				self.rules = KalturaClientBase.object_from_xml(xml_element.elements['rules'], 'KalturaRule')
			end
			if xml_element.elements['deliveryProfileIds'] != nil
				self.delivery_profile_ids = KalturaClientBase.object_from_xml(xml_element.elements['deliveryProfileIds'], 'KalturaKeyValue')
			end
			if xml_element.elements['privateKey'] != nil
				self.private_key = xml_element.elements['privateKey'].text
			end
			if xml_element.elements['publicKey'] != nil
				self.public_key = xml_element.elements['publicKey'].text
			end
			if xml_element.elements['passPhrase'] != nil
				self.pass_phrase = xml_element.elements['passPhrase'].text
			end
			if xml_element.elements['shouldExportThumbs'] != nil
				self.should_export_thumbs = xml_element.elements['shouldExportThumbs'].text
			end
		end

	end

	class KalturaSyndicationFeedEntryCount < KalturaObjectBase
		# the total count of entries that should appear in the feed without flavor filtering
		attr_accessor :total_entry_count
		# count of entries that will appear in the feed (including all relevant filters)
		attr_accessor :actual_entry_count
		# count of entries that requires transcoding in order to be included in feed
		attr_accessor :require_transcoding_count

		def total_entry_count=(val)
			@total_entry_count = val.to_i
		end
		def actual_entry_count=(val)
			@actual_entry_count = val.to_i
		end
		def require_transcoding_count=(val)
			@require_transcoding_count = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['totalEntryCount'] != nil
				self.total_entry_count = xml_element.elements['totalEntryCount'].text
			end
			if xml_element.elements['actualEntryCount'] != nil
				self.actual_entry_count = xml_element.elements['actualEntryCount'].text
			end
			if xml_element.elements['requireTranscodingCount'] != nil
				self.require_transcoding_count = xml_element.elements['requireTranscodingCount'].text
			end
		end

	end

	class KalturaUiConf < KalturaObjectBase
		attr_accessor :id
		# Name of the uiConf, this is not a primary key
		attr_accessor :name
		attr_accessor :description
		attr_accessor :partner_id
		attr_accessor :obj_type
		attr_accessor :obj_type_as_string
		attr_accessor :width
		attr_accessor :height
		attr_accessor :html_params
		attr_accessor :swf_url
		attr_accessor :conf_file_path
		attr_accessor :conf_file
		attr_accessor :conf_file_features
		attr_accessor :config
		attr_accessor :conf_vars
		attr_accessor :use_cdn
		attr_accessor :tags
		attr_accessor :swf_url_version
		# Entry creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Entry creation date as Unix timestamp (In seconds)
		attr_accessor :updated_at
		attr_accessor :creation_mode
		attr_accessor :html5url
		# UiConf version
		attr_accessor :version
		attr_accessor :partner_tags

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def obj_type=(val)
			@obj_type = val.to_i
		end
		def width=(val)
			@width = val.to_i
		end
		def height=(val)
			@height = val.to_i
		end
		def use_cdn=(val)
			@use_cdn = to_b(val)
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def creation_mode=(val)
			@creation_mode = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['objType'] != nil
				self.obj_type = xml_element.elements['objType'].text
			end
			if xml_element.elements['objTypeAsString'] != nil
				self.obj_type_as_string = xml_element.elements['objTypeAsString'].text
			end
			if xml_element.elements['width'] != nil
				self.width = xml_element.elements['width'].text
			end
			if xml_element.elements['height'] != nil
				self.height = xml_element.elements['height'].text
			end
			if xml_element.elements['htmlParams'] != nil
				self.html_params = xml_element.elements['htmlParams'].text
			end
			if xml_element.elements['swfUrl'] != nil
				self.swf_url = xml_element.elements['swfUrl'].text
			end
			if xml_element.elements['confFilePath'] != nil
				self.conf_file_path = xml_element.elements['confFilePath'].text
			end
			if xml_element.elements['confFile'] != nil
				self.conf_file = xml_element.elements['confFile'].text
			end
			if xml_element.elements['confFileFeatures'] != nil
				self.conf_file_features = xml_element.elements['confFileFeatures'].text
			end
			if xml_element.elements['config'] != nil
				self.config = xml_element.elements['config'].text
			end
			if xml_element.elements['confVars'] != nil
				self.conf_vars = xml_element.elements['confVars'].text
			end
			if xml_element.elements['useCdn'] != nil
				self.use_cdn = xml_element.elements['useCdn'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['swfUrlVersion'] != nil
				self.swf_url_version = xml_element.elements['swfUrlVersion'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['creationMode'] != nil
				self.creation_mode = xml_element.elements['creationMode'].text
			end
			if xml_element.elements['html5Url'] != nil
				self.html5url = xml_element.elements['html5Url'].text
			end
			if xml_element.elements['version'] != nil
				self.version = xml_element.elements['version'].text
			end
			if xml_element.elements['partnerTags'] != nil
				self.partner_tags = xml_element.elements['partnerTags'].text
			end
		end

	end

	# Info about uiconf type
	class KalturaUiConfTypeInfo < KalturaObjectBase
		# UiConf Type
		attr_accessor :type
		# Available versions
		attr_accessor :versions
		# The direcotry this type is saved at
		attr_accessor :directory
		# Filename for this UiConf type
		attr_accessor :filename

		def type=(val)
			@type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['versions'] != nil
				self.versions = KalturaClientBase.object_from_xml(xml_element.elements['versions'], 'KalturaString')
			end
			if xml_element.elements['directory'] != nil
				self.directory = xml_element.elements['directory'].text
			end
			if xml_element.elements['filename'] != nil
				self.filename = xml_element.elements['filename'].text
			end
		end

	end

	class KalturaUploadResponse < KalturaObjectBase
		attr_accessor :upload_token_id
		attr_accessor :file_size
		attr_accessor :error_code
		attr_accessor :error_description

		def file_size=(val)
			@file_size = val.to_i
		end
		def error_code=(val)
			@error_code = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['uploadTokenId'] != nil
				self.upload_token_id = xml_element.elements['uploadTokenId'].text
			end
			if xml_element.elements['fileSize'] != nil
				self.file_size = xml_element.elements['fileSize'].text
			end
			if xml_element.elements['errorCode'] != nil
				self.error_code = xml_element.elements['errorCode'].text
			end
			if xml_element.elements['errorDescription'] != nil
				self.error_description = xml_element.elements['errorDescription'].text
			end
		end

	end

	class KalturaUploadToken < KalturaObjectBase
		# Upload token unique ID
		attr_accessor :id
		# Partner ID of the upload token
		attr_accessor :partner_id
		# User id for the upload token
		attr_accessor :user_id
		# Status of the upload token
		attr_accessor :status
		# Name of the file for the upload token, can be empty when the upload token is created and will be updated internally after the file is uploaded
		attr_accessor :file_name
		# File size in bytes, can be empty when the upload token is created and will be updated internally after the file is uploaded
		attr_accessor :file_size
		# Uploaded file size in bytes, can be used to identify how many bytes were uploaded before resuming
		attr_accessor :uploaded_file_size
		# Creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Last update date as Unix timestamp (In seconds)
		attr_accessor :updated_at
		# Upload url - to explicitly determine to which domain to adress the uploadToken->upload call
		attr_accessor :upload_url
		# autoFinalize - Should the upload be finalized once the file size on disk matches the file size reproted when adding the upload token.
		attr_accessor :auto_finalize

		def partner_id=(val)
			@partner_id = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def file_size=(val)
			@file_size = val.to_f
		end
		def uploaded_file_size=(val)
			@uploaded_file_size = val.to_f
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def auto_finalize=(val)
			@auto_finalize = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['fileName'] != nil
				self.file_name = xml_element.elements['fileName'].text
			end
			if xml_element.elements['fileSize'] != nil
				self.file_size = xml_element.elements['fileSize'].text
			end
			if xml_element.elements['uploadedFileSize'] != nil
				self.uploaded_file_size = xml_element.elements['uploadedFileSize'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['uploadUrl'] != nil
				self.upload_url = xml_element.elements['uploadUrl'].text
			end
			if xml_element.elements['autoFinalize'] != nil
				self.auto_finalize = xml_element.elements['autoFinalize'].text
			end
		end

	end

	class KalturaUserEntry < KalturaObjectBase
		# unique auto-generated identifier
		attr_accessor :id
		attr_accessor :entry_id
		attr_accessor :user_id
		attr_accessor :partner_id
		attr_accessor :status
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :type
		attr_accessor :extended_status

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
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
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['extendedStatus'] != nil
				self.extended_status = xml_element.elements['extendedStatus'].text
			end
		end

	end

	class KalturaUserLoginData < KalturaObjectBase
		attr_accessor :id
		attr_accessor :login_email


		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['loginEmail'] != nil
				self.login_email = xml_element.elements['loginEmail'].text
			end
		end

	end

	class KalturaUserRole < KalturaObjectBase
		attr_accessor :id
		attr_accessor :name
		attr_accessor :system_name
		attr_accessor :description
		attr_accessor :status
		attr_accessor :partner_id
		attr_accessor :permission_names
		attr_accessor :tags
		attr_accessor :created_at
		attr_accessor :updated_at

		def id=(val)
			@id = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
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
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['permissionNames'] != nil
				self.permission_names = xml_element.elements['permissionNames'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
		end

	end

	class KalturaWidget < KalturaObjectBase
		attr_accessor :id
		attr_accessor :source_widget_id
		attr_accessor :root_widget_id
		attr_accessor :partner_id
		attr_accessor :entry_id
		attr_accessor :ui_conf_id
		attr_accessor :security_type
		attr_accessor :security_policy
		attr_accessor :created_at
		attr_accessor :updated_at
		# Can be used to store various partner related data as a string
		attr_accessor :partner_data
		attr_accessor :widget_ht_ml
		# Should enforce entitlement on feed entries
		attr_accessor :enforce_entitlement
		# Set privacy context for search entries that assiged to private and public categories within a category privacy context.
		attr_accessor :privacy_context
		# Addes the HTML5 script line to the widget's embed code
		attr_accessor :add_embed_html5support
		attr_accessor :roles

		def partner_id=(val)
			@partner_id = val.to_i
		end
		def ui_conf_id=(val)
			@ui_conf_id = val.to_i
		end
		def security_type=(val)
			@security_type = val.to_i
		end
		def security_policy=(val)
			@security_policy = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def enforce_entitlement=(val)
			@enforce_entitlement = to_b(val)
		end
		def add_embed_html5support=(val)
			@add_embed_html5support = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['sourceWidgetId'] != nil
				self.source_widget_id = xml_element.elements['sourceWidgetId'].text
			end
			if xml_element.elements['rootWidgetId'] != nil
				self.root_widget_id = xml_element.elements['rootWidgetId'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['uiConfId'] != nil
				self.ui_conf_id = xml_element.elements['uiConfId'].text
			end
			if xml_element.elements['securityType'] != nil
				self.security_type = xml_element.elements['securityType'].text
			end
			if xml_element.elements['securityPolicy'] != nil
				self.security_policy = xml_element.elements['securityPolicy'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['partnerData'] != nil
				self.partner_data = xml_element.elements['partnerData'].text
			end
			if xml_element.elements['widgetHTML'] != nil
				self.widget_ht_ml = xml_element.elements['widgetHTML'].text
			end
			if xml_element.elements['enforceEntitlement'] != nil
				self.enforce_entitlement = xml_element.elements['enforceEntitlement'].text
			end
			if xml_element.elements['privacyContext'] != nil
				self.privacy_context = xml_element.elements['privacyContext'].text
			end
			if xml_element.elements['addEmbedHtml5Support'] != nil
				self.add_embed_html5support = xml_element.elements['addEmbedHtml5Support'].text
			end
			if xml_element.elements['roles'] != nil
				self.roles = xml_element.elements['roles'].text
			end
		end

	end

	class KalturaBatchJobBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_greater_than_or_equal
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :partner_id_not_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :execution_attempts_greater_than_or_equal
		attr_accessor :execution_attempts_less_than_or_equal
		attr_accessor :lock_version_greater_than_or_equal
		attr_accessor :lock_version_less_than_or_equal
		attr_accessor :entry_id_equal
		attr_accessor :job_type_equal
		attr_accessor :job_type_in
		attr_accessor :job_type_not_in
		attr_accessor :job_sub_type_equal
		attr_accessor :job_sub_type_in
		attr_accessor :job_sub_type_not_in
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :status_not_in
		attr_accessor :priority_greater_than_or_equal
		attr_accessor :priority_less_than_or_equal
		attr_accessor :priority_equal
		attr_accessor :priority_in
		attr_accessor :priority_not_in
		attr_accessor :batch_version_greater_than_or_equal
		attr_accessor :batch_version_less_than_or_equal
		attr_accessor :batch_version_equal
		attr_accessor :queue_time_greater_than_or_equal
		attr_accessor :queue_time_less_than_or_equal
		attr_accessor :finish_time_greater_than_or_equal
		attr_accessor :finish_time_less_than_or_equal
		attr_accessor :err_type_equal
		attr_accessor :err_type_in
		attr_accessor :err_type_not_in
		attr_accessor :err_number_equal
		attr_accessor :err_number_in
		attr_accessor :err_number_not_in
		attr_accessor :estimated_effort_less_than
		attr_accessor :estimated_effort_greater_than
		attr_accessor :urgency_less_than_or_equal
		attr_accessor :urgency_greater_than_or_equal

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def id_greater_than_or_equal=(val)
			@id_greater_than_or_equal = val.to_i
		end
		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
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
		def execution_attempts_greater_than_or_equal=(val)
			@execution_attempts_greater_than_or_equal = val.to_i
		end
		def execution_attempts_less_than_or_equal=(val)
			@execution_attempts_less_than_or_equal = val.to_i
		end
		def lock_version_greater_than_or_equal=(val)
			@lock_version_greater_than_or_equal = val.to_i
		end
		def lock_version_less_than_or_equal=(val)
			@lock_version_less_than_or_equal = val.to_i
		end
		def job_sub_type_equal=(val)
			@job_sub_type_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end
		def priority_greater_than_or_equal=(val)
			@priority_greater_than_or_equal = val.to_i
		end
		def priority_less_than_or_equal=(val)
			@priority_less_than_or_equal = val.to_i
		end
		def priority_equal=(val)
			@priority_equal = val.to_i
		end
		def batch_version_greater_than_or_equal=(val)
			@batch_version_greater_than_or_equal = val.to_i
		end
		def batch_version_less_than_or_equal=(val)
			@batch_version_less_than_or_equal = val.to_i
		end
		def batch_version_equal=(val)
			@batch_version_equal = val.to_i
		end
		def queue_time_greater_than_or_equal=(val)
			@queue_time_greater_than_or_equal = val.to_i
		end
		def queue_time_less_than_or_equal=(val)
			@queue_time_less_than_or_equal = val.to_i
		end
		def finish_time_greater_than_or_equal=(val)
			@finish_time_greater_than_or_equal = val.to_i
		end
		def finish_time_less_than_or_equal=(val)
			@finish_time_less_than_or_equal = val.to_i
		end
		def err_type_equal=(val)
			@err_type_equal = val.to_i
		end
		def err_number_equal=(val)
			@err_number_equal = val.to_i
		end
		def estimated_effort_less_than=(val)
			@estimated_effort_less_than = val.to_i
		end
		def estimated_effort_greater_than=(val)
			@estimated_effort_greater_than = val.to_i
		end
		def urgency_less_than_or_equal=(val)
			@urgency_less_than_or_equal = val.to_i
		end
		def urgency_greater_than_or_equal=(val)
			@urgency_greater_than_or_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idGreaterThanOrEqual'] != nil
				self.id_greater_than_or_equal = xml_element.elements['idGreaterThanOrEqual'].text
			end
			if xml_element.elements['partnerIdEqual'] != nil
				self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			end
			if xml_element.elements['partnerIdIn'] != nil
				self.partner_id_in = xml_element.elements['partnerIdIn'].text
			end
			if xml_element.elements['partnerIdNotIn'] != nil
				self.partner_id_not_in = xml_element.elements['partnerIdNotIn'].text
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
			if xml_element.elements['executionAttemptsGreaterThanOrEqual'] != nil
				self.execution_attempts_greater_than_or_equal = xml_element.elements['executionAttemptsGreaterThanOrEqual'].text
			end
			if xml_element.elements['executionAttemptsLessThanOrEqual'] != nil
				self.execution_attempts_less_than_or_equal = xml_element.elements['executionAttemptsLessThanOrEqual'].text
			end
			if xml_element.elements['lockVersionGreaterThanOrEqual'] != nil
				self.lock_version_greater_than_or_equal = xml_element.elements['lockVersionGreaterThanOrEqual'].text
			end
			if xml_element.elements['lockVersionLessThanOrEqual'] != nil
				self.lock_version_less_than_or_equal = xml_element.elements['lockVersionLessThanOrEqual'].text
			end
			if xml_element.elements['entryIdEqual'] != nil
				self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			end
			if xml_element.elements['jobTypeEqual'] != nil
				self.job_type_equal = xml_element.elements['jobTypeEqual'].text
			end
			if xml_element.elements['jobTypeIn'] != nil
				self.job_type_in = xml_element.elements['jobTypeIn'].text
			end
			if xml_element.elements['jobTypeNotIn'] != nil
				self.job_type_not_in = xml_element.elements['jobTypeNotIn'].text
			end
			if xml_element.elements['jobSubTypeEqual'] != nil
				self.job_sub_type_equal = xml_element.elements['jobSubTypeEqual'].text
			end
			if xml_element.elements['jobSubTypeIn'] != nil
				self.job_sub_type_in = xml_element.elements['jobSubTypeIn'].text
			end
			if xml_element.elements['jobSubTypeNotIn'] != nil
				self.job_sub_type_not_in = xml_element.elements['jobSubTypeNotIn'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['statusNotIn'] != nil
				self.status_not_in = xml_element.elements['statusNotIn'].text
			end
			if xml_element.elements['priorityGreaterThanOrEqual'] != nil
				self.priority_greater_than_or_equal = xml_element.elements['priorityGreaterThanOrEqual'].text
			end
			if xml_element.elements['priorityLessThanOrEqual'] != nil
				self.priority_less_than_or_equal = xml_element.elements['priorityLessThanOrEqual'].text
			end
			if xml_element.elements['priorityEqual'] != nil
				self.priority_equal = xml_element.elements['priorityEqual'].text
			end
			if xml_element.elements['priorityIn'] != nil
				self.priority_in = xml_element.elements['priorityIn'].text
			end
			if xml_element.elements['priorityNotIn'] != nil
				self.priority_not_in = xml_element.elements['priorityNotIn'].text
			end
			if xml_element.elements['batchVersionGreaterThanOrEqual'] != nil
				self.batch_version_greater_than_or_equal = xml_element.elements['batchVersionGreaterThanOrEqual'].text
			end
			if xml_element.elements['batchVersionLessThanOrEqual'] != nil
				self.batch_version_less_than_or_equal = xml_element.elements['batchVersionLessThanOrEqual'].text
			end
			if xml_element.elements['batchVersionEqual'] != nil
				self.batch_version_equal = xml_element.elements['batchVersionEqual'].text
			end
			if xml_element.elements['queueTimeGreaterThanOrEqual'] != nil
				self.queue_time_greater_than_or_equal = xml_element.elements['queueTimeGreaterThanOrEqual'].text
			end
			if xml_element.elements['queueTimeLessThanOrEqual'] != nil
				self.queue_time_less_than_or_equal = xml_element.elements['queueTimeLessThanOrEqual'].text
			end
			if xml_element.elements['finishTimeGreaterThanOrEqual'] != nil
				self.finish_time_greater_than_or_equal = xml_element.elements['finishTimeGreaterThanOrEqual'].text
			end
			if xml_element.elements['finishTimeLessThanOrEqual'] != nil
				self.finish_time_less_than_or_equal = xml_element.elements['finishTimeLessThanOrEqual'].text
			end
			if xml_element.elements['errTypeEqual'] != nil
				self.err_type_equal = xml_element.elements['errTypeEqual'].text
			end
			if xml_element.elements['errTypeIn'] != nil
				self.err_type_in = xml_element.elements['errTypeIn'].text
			end
			if xml_element.elements['errTypeNotIn'] != nil
				self.err_type_not_in = xml_element.elements['errTypeNotIn'].text
			end
			if xml_element.elements['errNumberEqual'] != nil
				self.err_number_equal = xml_element.elements['errNumberEqual'].text
			end
			if xml_element.elements['errNumberIn'] != nil
				self.err_number_in = xml_element.elements['errNumberIn'].text
			end
			if xml_element.elements['errNumberNotIn'] != nil
				self.err_number_not_in = xml_element.elements['errNumberNotIn'].text
			end
			if xml_element.elements['estimatedEffortLessThan'] != nil
				self.estimated_effort_less_than = xml_element.elements['estimatedEffortLessThan'].text
			end
			if xml_element.elements['estimatedEffortGreaterThan'] != nil
				self.estimated_effort_greater_than = xml_element.elements['estimatedEffortGreaterThan'].text
			end
			if xml_element.elements['urgencyLessThanOrEqual'] != nil
				self.urgency_less_than_or_equal = xml_element.elements['urgencyLessThanOrEqual'].text
			end
			if xml_element.elements['urgencyGreaterThanOrEqual'] != nil
				self.urgency_greater_than_or_equal = xml_element.elements['urgencyGreaterThanOrEqual'].text
			end
		end

	end

	class KalturaBatchJobFilter < KalturaBatchJobBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAccessControlBlockAction < KalturaRuleAction


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAccessControlLimitDeliveryProfilesAction < KalturaRuleAction
		# Comma separated list of delivery profile ids
		attr_accessor :delivery_profile_ids
		attr_accessor :is_blocked_list

		def is_blocked_list=(val)
			@is_blocked_list = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['deliveryProfileIds'] != nil
				self.delivery_profile_ids = xml_element.elements['deliveryProfileIds'].text
			end
			if xml_element.elements['isBlockedList'] != nil
				self.is_blocked_list = xml_element.elements['isBlockedList'].text
			end
		end

	end

	class KalturaAccessControlLimitFlavorsAction < KalturaRuleAction
		# Comma separated list of flavor ids
		attr_accessor :flavor_params_ids
		attr_accessor :is_blocked_list

		def is_blocked_list=(val)
			@is_blocked_list = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['flavorParamsIds'] != nil
				self.flavor_params_ids = xml_element.elements['flavorParamsIds'].text
			end
			if xml_element.elements['isBlockedList'] != nil
				self.is_blocked_list = xml_element.elements['isBlockedList'].text
			end
		end

	end

	class KalturaAccessControlLimitThumbnailCaptureAction < KalturaRuleAction


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAccessControlListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaAccessControl')
			end
		end

	end

	class KalturaAccessControlModifyRequestHostRegexAction < KalturaRuleAction
		# Request host regex pattern
		attr_accessor :pattern
		# Request host regex replacment
		attr_accessor :replacement
		# serverNodeId to generate replacment host from
		attr_accessor :replacmen_server_node_id

		def replacmen_server_node_id=(val)
			@replacmen_server_node_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['pattern'] != nil
				self.pattern = xml_element.elements['pattern'].text
			end
			if xml_element.elements['replacement'] != nil
				self.replacement = xml_element.elements['replacement'].text
			end
			if xml_element.elements['replacmenServerNodeId'] != nil
				self.replacmen_server_node_id = xml_element.elements['replacmenServerNodeId'].text
			end
		end

	end

	class KalturaAccessControlPreviewAction < KalturaRuleAction
		attr_accessor :limit

		def limit=(val)
			@limit = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['limit'] != nil
				self.limit = xml_element.elements['limit'].text
			end
		end

	end

	class KalturaAccessControlProfileListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaAccessControlProfile')
			end
		end

	end

	class KalturaAccessControlServeRemoteEdgeServerAction < KalturaRuleAction
		# Comma separated list of edge servers playBack should be done from
		attr_accessor :edge_server_ids
		attr_accessor :seamless_fallback_enabled

		def seamless_fallback_enabled=(val)
			@seamless_fallback_enabled = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['edgeServerIds'] != nil
				self.edge_server_ids = xml_element.elements['edgeServerIds'].text
			end
			if xml_element.elements['seamlessFallbackEnabled'] != nil
				self.seamless_fallback_enabled = xml_element.elements['seamlessFallbackEnabled'].text
			end
		end

	end

	class KalturaAdminUser < KalturaUser


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAmazonS3StorageProfile < KalturaStorageProfile
		attr_accessor :files_permission_in_s3
		attr_accessor :s3region
		attr_accessor :sse_type
		attr_accessor :sse_kms_key_id
		attr_accessor :signature_type
		attr_accessor :end_point


		def from_xml(xml_element)
			super
			if xml_element.elements['filesPermissionInS3'] != nil
				self.files_permission_in_s3 = xml_element.elements['filesPermissionInS3'].text
			end
			if xml_element.elements['s3Region'] != nil
				self.s3region = xml_element.elements['s3Region'].text
			end
			if xml_element.elements['sseType'] != nil
				self.sse_type = xml_element.elements['sseType'].text
			end
			if xml_element.elements['sseKmsKeyId'] != nil
				self.sse_kms_key_id = xml_element.elements['sseKmsKeyId'].text
			end
			if xml_element.elements['signatureType'] != nil
				self.signature_type = xml_element.elements['signatureType'].text
			end
			if xml_element.elements['endPoint'] != nil
				self.end_point = xml_element.elements['endPoint'].text
			end
		end

	end

	class KalturaApiActionPermissionItem < KalturaPermissionItem
		attr_accessor :service
		attr_accessor :action


		def from_xml(xml_element)
			super
			if xml_element.elements['service'] != nil
				self.service = xml_element.elements['service'].text
			end
			if xml_element.elements['action'] != nil
				self.action = xml_element.elements['action'].text
			end
		end

	end

	class KalturaApiParameterPermissionItem < KalturaPermissionItem
		attr_accessor :object
		attr_accessor :parameter
		attr_accessor :action


		def from_xml(xml_element)
			super
			if xml_element.elements['object'] != nil
				self.object = xml_element.elements['object'].text
			end
			if xml_element.elements['parameter'] != nil
				self.parameter = xml_element.elements['parameter'].text
			end
			if xml_element.elements['action'] != nil
				self.action = xml_element.elements['action'].text
			end
		end

	end

	class KalturaAppTokenBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :session_user_id_equal

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
		def status_equal=(val)
			@status_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
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
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['sessionUserIdEqual'] != nil
				self.session_user_id_equal = xml_element.elements['sessionUserIdEqual'].text
			end
		end

	end

	class KalturaAppTokenListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaAppToken')
			end
		end

	end

	class KalturaAssetParamsOutput < KalturaAssetParams
		attr_accessor :asset_params_id
		attr_accessor :asset_params_version
		attr_accessor :asset_id
		attr_accessor :asset_version
		attr_accessor :ready_behavior
		# The container format of the Flavor Params
		attr_accessor :format

		def asset_params_id=(val)
			@asset_params_id = val.to_i
		end
		def ready_behavior=(val)
			@ready_behavior = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['assetParamsId'] != nil
				self.asset_params_id = xml_element.elements['assetParamsId'].text
			end
			if xml_element.elements['assetParamsVersion'] != nil
				self.asset_params_version = xml_element.elements['assetParamsVersion'].text
			end
			if xml_element.elements['assetId'] != nil
				self.asset_id = xml_element.elements['assetId'].text
			end
			if xml_element.elements['assetVersion'] != nil
				self.asset_version = xml_element.elements['assetVersion'].text
			end
			if xml_element.elements['readyBehavior'] != nil
				self.ready_behavior = xml_element.elements['readyBehavior'].text
			end
			if xml_element.elements['format'] != nil
				self.format = xml_element.elements['format'].text
			end
		end

	end

	class KalturaAssetPropertiesCompareCondition < KalturaCondition
		# Array of key/value objects that holds the property and the value to find and compare on an asset object
		attr_accessor :properties


		def from_xml(xml_element)
			super
			if xml_element.elements['properties'] != nil
				self.properties = KalturaClientBase.object_from_xml(xml_element.elements['properties'], 'KalturaKeyValue')
			end
		end

	end

	class KalturaAssetTypeCondition < KalturaCondition
		attr_accessor :asset_types


		def from_xml(xml_element)
			super
			if xml_element.elements['assetTypes'] != nil
				self.asset_types = xml_element.elements['assetTypes'].text
			end
		end

	end

	class KalturaAssetsParamsResourceContainers < KalturaResource
		# Array of resources associated with asset params ids
		attr_accessor :resources


		def from_xml(xml_element)
			super
			if xml_element.elements['resources'] != nil
				self.resources = KalturaClientBase.object_from_xml(xml_element.elements['resources'], 'KalturaAssetParamsResourceContainer')
			end
		end

	end

	class KalturaAttributeCondition < KalturaSearchItem
		attr_accessor :value


		def from_xml(xml_element)
			super
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	class KalturaAuthenticatedCondition < KalturaCondition
		# The privelege needed to remove the restriction
		attr_accessor :privileges


		def from_xml(xml_element)
			super
			if xml_element.elements['privileges'] != nil
				self.privileges = KalturaClientBase.object_from_xml(xml_element.elements['privileges'], 'KalturaStringValue')
			end
		end

	end

	class KalturaBaseEntryCloneOptionComponent < KalturaBaseEntryCloneOptionItem
		attr_accessor :item_type
		# condition rule (include/exclude)
		attr_accessor :rule


		def from_xml(xml_element)
			super
			if xml_element.elements['itemType'] != nil
				self.item_type = xml_element.elements['itemType'].text
			end
			if xml_element.elements['rule'] != nil
				self.rule = xml_element.elements['rule'].text
			end
		end

	end

	class KalturaBaseEntryListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaBaseEntry')
			end
		end

	end

	class KalturaBaseSyndicationFeedBaseFilter < KalturaFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaBaseSyndicationFeedListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaBaseSyndicationFeed')
			end
		end

	end

	class KalturaBulkDownloadJobData < KalturaJobData
		# Comma separated list of entry ids
		attr_accessor :entry_ids
		# Flavor params id to use for conversion
		attr_accessor :flavor_params_id
		# The id of the requesting user
		attr_accessor :puser_id

		def flavor_params_id=(val)
			@flavor_params_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['entryIds'] != nil
				self.entry_ids = xml_element.elements['entryIds'].text
			end
			if xml_element.elements['flavorParamsId'] != nil
				self.flavor_params_id = xml_element.elements['flavorParamsId'].text
			end
			if xml_element.elements['puserId'] != nil
				self.puser_id = xml_element.elements['puserId'].text
			end
		end

	end

	class KalturaBulkUploadBaseFilter < KalturaFilter
		attr_accessor :uploaded_on_greater_than_or_equal
		attr_accessor :uploaded_on_less_than_or_equal
		attr_accessor :uploaded_on_equal
		attr_accessor :status_in
		attr_accessor :status_equal
		attr_accessor :bulk_upload_object_type_equal
		attr_accessor :bulk_upload_object_type_in

		def uploaded_on_greater_than_or_equal=(val)
			@uploaded_on_greater_than_or_equal = val.to_i
		end
		def uploaded_on_less_than_or_equal=(val)
			@uploaded_on_less_than_or_equal = val.to_i
		end
		def uploaded_on_equal=(val)
			@uploaded_on_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['uploadedOnGreaterThanOrEqual'] != nil
				self.uploaded_on_greater_than_or_equal = xml_element.elements['uploadedOnGreaterThanOrEqual'].text
			end
			if xml_element.elements['uploadedOnLessThanOrEqual'] != nil
				self.uploaded_on_less_than_or_equal = xml_element.elements['uploadedOnLessThanOrEqual'].text
			end
			if xml_element.elements['uploadedOnEqual'] != nil
				self.uploaded_on_equal = xml_element.elements['uploadedOnEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['bulkUploadObjectTypeEqual'] != nil
				self.bulk_upload_object_type_equal = xml_element.elements['bulkUploadObjectTypeEqual'].text
			end
			if xml_element.elements['bulkUploadObjectTypeIn'] != nil
				self.bulk_upload_object_type_in = xml_element.elements['bulkUploadObjectTypeIn'].text
			end
		end

	end

	# This class represents object-specific data passed to the 
	#  bulk upload job.
	class KalturaBulkUploadCategoryData < KalturaBulkUploadObjectData


		def from_xml(xml_element)
			super
		end

	end

	# This class represents object-specific data passed to the 
	#  bulk upload job.
	class KalturaBulkUploadCategoryEntryData < KalturaBulkUploadObjectData


		def from_xml(xml_element)
			super
		end

	end

	# This class represents object-specific data passed to the 
	#  bulk upload job.
	class KalturaBulkUploadCategoryUserData < KalturaBulkUploadObjectData


		def from_xml(xml_element)
			super
		end

	end

	# This class represents object-specific data passed to the 
	#  bulk upload job.
	class KalturaBulkUploadEntryData < KalturaBulkUploadObjectData
		# Selected profile id for all bulk entries
		attr_accessor :conversion_profile_id

		def conversion_profile_id=(val)
			@conversion_profile_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['conversionProfileId'] != nil
				self.conversion_profile_id = xml_element.elements['conversionProfileId'].text
			end
		end

	end

	class KalturaBulkUploadJobData < KalturaJobData
		attr_accessor :user_id
		# The screen name of the user
		attr_accessor :uploaded_by
		# Selected profile id for all bulk entries
		attr_accessor :conversion_profile_id
		# Created by the API
		attr_accessor :results_file_local_path
		# Created by the API
		attr_accessor :results_file_url
		# Number of created entries
		attr_accessor :num_of_entries
		# Number of created objects
		attr_accessor :num_of_objects
		# The bulk upload file path
		attr_accessor :file_path
		# Type of object for bulk upload
		attr_accessor :bulk_upload_object_type
		# Friendly name of the file, used to be recognized later in the logs.
		attr_accessor :file_name
		# Data pertaining to the objects being uploaded
		attr_accessor :object_data
		# Type of bulk upload
		attr_accessor :type
		# Recipients of the email for bulk upload success/failure
		attr_accessor :email_recipients
		# Number of objects that finished on error status
		attr_accessor :num_of_error_objects
		# privileges for the job
		attr_accessor :privileges

		def conversion_profile_id=(val)
			@conversion_profile_id = val.to_i
		end
		def num_of_entries=(val)
			@num_of_entries = val.to_i
		end
		def num_of_objects=(val)
			@num_of_objects = val.to_i
		end
		def num_of_error_objects=(val)
			@num_of_error_objects = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['uploadedBy'] != nil
				self.uploaded_by = xml_element.elements['uploadedBy'].text
			end
			if xml_element.elements['conversionProfileId'] != nil
				self.conversion_profile_id = xml_element.elements['conversionProfileId'].text
			end
			if xml_element.elements['resultsFileLocalPath'] != nil
				self.results_file_local_path = xml_element.elements['resultsFileLocalPath'].text
			end
			if xml_element.elements['resultsFileUrl'] != nil
				self.results_file_url = xml_element.elements['resultsFileUrl'].text
			end
			if xml_element.elements['numOfEntries'] != nil
				self.num_of_entries = xml_element.elements['numOfEntries'].text
			end
			if xml_element.elements['numOfObjects'] != nil
				self.num_of_objects = xml_element.elements['numOfObjects'].text
			end
			if xml_element.elements['filePath'] != nil
				self.file_path = xml_element.elements['filePath'].text
			end
			if xml_element.elements['bulkUploadObjectType'] != nil
				self.bulk_upload_object_type = xml_element.elements['bulkUploadObjectType'].text
			end
			if xml_element.elements['fileName'] != nil
				self.file_name = xml_element.elements['fileName'].text
			end
			if xml_element.elements['objectData'] != nil
				self.object_data = KalturaClientBase.object_from_xml(xml_element.elements['objectData'], 'KalturaBulkUploadObjectData')
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['emailRecipients'] != nil
				self.email_recipients = xml_element.elements['emailRecipients'].text
			end
			if xml_element.elements['numOfErrorObjects'] != nil
				self.num_of_error_objects = xml_element.elements['numOfErrorObjects'].text
			end
			if xml_element.elements['privileges'] != nil
				self.privileges = xml_element.elements['privileges'].text
			end
		end

	end

	class KalturaBulkUploadListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaBulkUpload')
			end
		end

	end

	class KalturaBulkUploadResultCategory < KalturaBulkUploadResult
		attr_accessor :relative_path
		attr_accessor :name
		attr_accessor :reference_id
		attr_accessor :description
		attr_accessor :tags
		attr_accessor :appear_in_list
		attr_accessor :privacy
		attr_accessor :inheritance_type
		attr_accessor :user_join_policy
		attr_accessor :default_permission_level
		attr_accessor :owner
		attr_accessor :contribution_policy
		attr_accessor :partner_sort_value
		attr_accessor :moderation

		def appear_in_list=(val)
			@appear_in_list = val.to_i
		end
		def privacy=(val)
			@privacy = val.to_i
		end
		def inheritance_type=(val)
			@inheritance_type = val.to_i
		end
		def user_join_policy=(val)
			@user_join_policy = val.to_i
		end
		def default_permission_level=(val)
			@default_permission_level = val.to_i
		end
		def contribution_policy=(val)
			@contribution_policy = val.to_i
		end
		def partner_sort_value=(val)
			@partner_sort_value = val.to_i
		end
		def moderation=(val)
			@moderation = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['relativePath'] != nil
				self.relative_path = xml_element.elements['relativePath'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['referenceId'] != nil
				self.reference_id = xml_element.elements['referenceId'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['appearInList'] != nil
				self.appear_in_list = xml_element.elements['appearInList'].text
			end
			if xml_element.elements['privacy'] != nil
				self.privacy = xml_element.elements['privacy'].text
			end
			if xml_element.elements['inheritanceType'] != nil
				self.inheritance_type = xml_element.elements['inheritanceType'].text
			end
			if xml_element.elements['userJoinPolicy'] != nil
				self.user_join_policy = xml_element.elements['userJoinPolicy'].text
			end
			if xml_element.elements['defaultPermissionLevel'] != nil
				self.default_permission_level = xml_element.elements['defaultPermissionLevel'].text
			end
			if xml_element.elements['owner'] != nil
				self.owner = xml_element.elements['owner'].text
			end
			if xml_element.elements['contributionPolicy'] != nil
				self.contribution_policy = xml_element.elements['contributionPolicy'].text
			end
			if xml_element.elements['partnerSortValue'] != nil
				self.partner_sort_value = xml_element.elements['partnerSortValue'].text
			end
			if xml_element.elements['moderation'] != nil
				self.moderation = xml_element.elements['moderation'].text
			end
		end

	end

	class KalturaBulkUploadResultCategoryEntry < KalturaBulkUploadResult
		attr_accessor :category_id
		attr_accessor :entry_id

		def category_id=(val)
			@category_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['categoryId'] != nil
				self.category_id = xml_element.elements['categoryId'].text
			end
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
		end

	end

	class KalturaBulkUploadResultCategoryUser < KalturaBulkUploadResult
		attr_accessor :category_id
		attr_accessor :category_reference_id
		attr_accessor :user_id
		attr_accessor :permission_level
		attr_accessor :update_method
		attr_accessor :required_object_status

		def category_id=(val)
			@category_id = val.to_i
		end
		def permission_level=(val)
			@permission_level = val.to_i
		end
		def update_method=(val)
			@update_method = val.to_i
		end
		def required_object_status=(val)
			@required_object_status = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['categoryId'] != nil
				self.category_id = xml_element.elements['categoryId'].text
			end
			if xml_element.elements['categoryReferenceId'] != nil
				self.category_reference_id = xml_element.elements['categoryReferenceId'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['permissionLevel'] != nil
				self.permission_level = xml_element.elements['permissionLevel'].text
			end
			if xml_element.elements['updateMethod'] != nil
				self.update_method = xml_element.elements['updateMethod'].text
			end
			if xml_element.elements['requiredObjectStatus'] != nil
				self.required_object_status = xml_element.elements['requiredObjectStatus'].text
			end
		end

	end

	class KalturaBulkUploadResultEntry < KalturaBulkUploadResult
		attr_accessor :entry_id
		attr_accessor :title
		attr_accessor :description
		attr_accessor :tags
		attr_accessor :url
		attr_accessor :content_type
		attr_accessor :conversion_profile_id
		attr_accessor :access_control_profile_id
		attr_accessor :category
		attr_accessor :schedule_start_date
		attr_accessor :schedule_end_date
		attr_accessor :entry_status
		attr_accessor :thumbnail_url
		attr_accessor :thumbnail_saved
		attr_accessor :ssh_private_key
		attr_accessor :ssh_public_key
		attr_accessor :ssh_key_passphrase
		attr_accessor :creator_id
		attr_accessor :entitled_users_edit
		attr_accessor :entitled_users_publish
		attr_accessor :owner_id
		attr_accessor :reference_id
		attr_accessor :template_entry_id

		def conversion_profile_id=(val)
			@conversion_profile_id = val.to_i
		end
		def access_control_profile_id=(val)
			@access_control_profile_id = val.to_i
		end
		def schedule_start_date=(val)
			@schedule_start_date = val.to_i
		end
		def schedule_end_date=(val)
			@schedule_end_date = val.to_i
		end
		def entry_status=(val)
			@entry_status = val.to_i
		end
		def thumbnail_saved=(val)
			@thumbnail_saved = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['title'] != nil
				self.title = xml_element.elements['title'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['url'] != nil
				self.url = xml_element.elements['url'].text
			end
			if xml_element.elements['contentType'] != nil
				self.content_type = xml_element.elements['contentType'].text
			end
			if xml_element.elements['conversionProfileId'] != nil
				self.conversion_profile_id = xml_element.elements['conversionProfileId'].text
			end
			if xml_element.elements['accessControlProfileId'] != nil
				self.access_control_profile_id = xml_element.elements['accessControlProfileId'].text
			end
			if xml_element.elements['category'] != nil
				self.category = xml_element.elements['category'].text
			end
			if xml_element.elements['scheduleStartDate'] != nil
				self.schedule_start_date = xml_element.elements['scheduleStartDate'].text
			end
			if xml_element.elements['scheduleEndDate'] != nil
				self.schedule_end_date = xml_element.elements['scheduleEndDate'].text
			end
			if xml_element.elements['entryStatus'] != nil
				self.entry_status = xml_element.elements['entryStatus'].text
			end
			if xml_element.elements['thumbnailUrl'] != nil
				self.thumbnail_url = xml_element.elements['thumbnailUrl'].text
			end
			if xml_element.elements['thumbnailSaved'] != nil
				self.thumbnail_saved = xml_element.elements['thumbnailSaved'].text
			end
			if xml_element.elements['sshPrivateKey'] != nil
				self.ssh_private_key = xml_element.elements['sshPrivateKey'].text
			end
			if xml_element.elements['sshPublicKey'] != nil
				self.ssh_public_key = xml_element.elements['sshPublicKey'].text
			end
			if xml_element.elements['sshKeyPassphrase'] != nil
				self.ssh_key_passphrase = xml_element.elements['sshKeyPassphrase'].text
			end
			if xml_element.elements['creatorId'] != nil
				self.creator_id = xml_element.elements['creatorId'].text
			end
			if xml_element.elements['entitledUsersEdit'] != nil
				self.entitled_users_edit = xml_element.elements['entitledUsersEdit'].text
			end
			if xml_element.elements['entitledUsersPublish'] != nil
				self.entitled_users_publish = xml_element.elements['entitledUsersPublish'].text
			end
			if xml_element.elements['ownerId'] != nil
				self.owner_id = xml_element.elements['ownerId'].text
			end
			if xml_element.elements['referenceId'] != nil
				self.reference_id = xml_element.elements['referenceId'].text
			end
			if xml_element.elements['templateEntryId'] != nil
				self.template_entry_id = xml_element.elements['templateEntryId'].text
			end
		end

	end

	class KalturaBulkUploadResultUser < KalturaBulkUploadResult
		attr_accessor :user_id
		attr_accessor :screen_name
		attr_accessor :email
		attr_accessor :description
		attr_accessor :tags
		attr_accessor :date_of_birth
		attr_accessor :country
		attr_accessor :state
		attr_accessor :city
		attr_accessor :zip
		attr_accessor :gender
		attr_accessor :first_name
		attr_accessor :last_name
		attr_accessor :group

		def date_of_birth=(val)
			@date_of_birth = val.to_i
		end
		def gender=(val)
			@gender = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['screenName'] != nil
				self.screen_name = xml_element.elements['screenName'].text
			end
			if xml_element.elements['email'] != nil
				self.email = xml_element.elements['email'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['dateOfBirth'] != nil
				self.date_of_birth = xml_element.elements['dateOfBirth'].text
			end
			if xml_element.elements['country'] != nil
				self.country = xml_element.elements['country'].text
			end
			if xml_element.elements['state'] != nil
				self.state = xml_element.elements['state'].text
			end
			if xml_element.elements['city'] != nil
				self.city = xml_element.elements['city'].text
			end
			if xml_element.elements['zip'] != nil
				self.zip = xml_element.elements['zip'].text
			end
			if xml_element.elements['gender'] != nil
				self.gender = xml_element.elements['gender'].text
			end
			if xml_element.elements['firstName'] != nil
				self.first_name = xml_element.elements['firstName'].text
			end
			if xml_element.elements['lastName'] != nil
				self.last_name = xml_element.elements['lastName'].text
			end
			if xml_element.elements['group'] != nil
				self.group = xml_element.elements['group'].text
			end
		end

	end

	# This class represents object-specific data passed to the 
	#  bulk upload job.
	class KalturaBulkUploadUserData < KalturaBulkUploadObjectData


		def from_xml(xml_element)
			super
		end

	end

	class KalturaCaptureThumbJobData < KalturaJobData
		attr_accessor :file_container
		# The translated path as used by the scheduler
		attr_accessor :actual_src_file_sync_local_path
		attr_accessor :src_file_sync_remote_url
		attr_accessor :thumb_params_output_id
		attr_accessor :thumb_asset_id
		attr_accessor :src_asset_id
		attr_accessor :src_asset_encryption_key
		attr_accessor :src_asset_type
		attr_accessor :thumb_path

		def thumb_params_output_id=(val)
			@thumb_params_output_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['fileContainer'] != nil
				self.file_container = KalturaClientBase.object_from_xml(xml_element.elements['fileContainer'], 'KalturaFileContainer')
			end
			if xml_element.elements['actualSrcFileSyncLocalPath'] != nil
				self.actual_src_file_sync_local_path = xml_element.elements['actualSrcFileSyncLocalPath'].text
			end
			if xml_element.elements['srcFileSyncRemoteUrl'] != nil
				self.src_file_sync_remote_url = xml_element.elements['srcFileSyncRemoteUrl'].text
			end
			if xml_element.elements['thumbParamsOutputId'] != nil
				self.thumb_params_output_id = xml_element.elements['thumbParamsOutputId'].text
			end
			if xml_element.elements['thumbAssetId'] != nil
				self.thumb_asset_id = xml_element.elements['thumbAssetId'].text
			end
			if xml_element.elements['srcAssetId'] != nil
				self.src_asset_id = xml_element.elements['srcAssetId'].text
			end
			if xml_element.elements['srcAssetEncryptionKey'] != nil
				self.src_asset_encryption_key = xml_element.elements['srcAssetEncryptionKey'].text
			end
			if xml_element.elements['srcAssetType'] != nil
				self.src_asset_type = xml_element.elements['srcAssetType'].text
			end
			if xml_element.elements['thumbPath'] != nil
				self.thumb_path = xml_element.elements['thumbPath'].text
			end
		end

	end

	class KalturaCategoryEntryAdvancedFilter < KalturaSearchItem
		attr_accessor :categories_match_or
		attr_accessor :category_entry_status_in
		attr_accessor :order_by
		attr_accessor :category_id_equal

		def category_id_equal=(val)
			@category_id_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['categoriesMatchOr'] != nil
				self.categories_match_or = xml_element.elements['categoriesMatchOr'].text
			end
			if xml_element.elements['categoryEntryStatusIn'] != nil
				self.category_entry_status_in = xml_element.elements['categoryEntryStatusIn'].text
			end
			if xml_element.elements['orderBy'] != nil
				self.order_by = xml_element.elements['orderBy'].text
			end
			if xml_element.elements['categoryIdEqual'] != nil
				self.category_id_equal = xml_element.elements['categoryIdEqual'].text
			end
		end

	end

	class KalturaCategoryEntryListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaCategoryEntry')
			end
		end

	end

	class KalturaCategoryIdentifier < KalturaObjectIdentifier
		# Identifier of the object
		attr_accessor :identifier


		def from_xml(xml_element)
			super
			if xml_element.elements['identifier'] != nil
				self.identifier = xml_element.elements['identifier'].text
			end
		end

	end

	class KalturaCategoryListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaCategory')
			end
		end

	end

	class KalturaCategoryUserAdvancedFilter < KalturaSearchItem
		attr_accessor :member_id_eq
		attr_accessor :member_id_in
		attr_accessor :member_permissions_match_or
		attr_accessor :member_permissions_match_and


		def from_xml(xml_element)
			super
			if xml_element.elements['memberIdEq'] != nil
				self.member_id_eq = xml_element.elements['memberIdEq'].text
			end
			if xml_element.elements['memberIdIn'] != nil
				self.member_id_in = xml_element.elements['memberIdIn'].text
			end
			if xml_element.elements['memberPermissionsMatchOr'] != nil
				self.member_permissions_match_or = xml_element.elements['memberPermissionsMatchOr'].text
			end
			if xml_element.elements['memberPermissionsMatchAnd'] != nil
				self.member_permissions_match_and = xml_element.elements['memberPermissionsMatchAnd'].text
			end
		end

	end

	class KalturaCategoryUserListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaCategoryUser')
			end
		end

	end

	# Clip operation attributes
	class KalturaClipAttributes < KalturaOperationAttributes
		# Offset in milliseconds
		attr_accessor :offset
		# Duration in milliseconds
		attr_accessor :duration
		# global Offset In Destination in milliseconds
		attr_accessor :global_offset_in_destination
		# global Offset In Destination in milliseconds
		attr_accessor :effect_array

		def offset=(val)
			@offset = val.to_i
		end
		def duration=(val)
			@duration = val.to_i
		end
		def global_offset_in_destination=(val)
			@global_offset_in_destination = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['offset'] != nil
				self.offset = xml_element.elements['offset'].text
			end
			if xml_element.elements['duration'] != nil
				self.duration = xml_element.elements['duration'].text
			end
			if xml_element.elements['globalOffsetInDestination'] != nil
				self.global_offset_in_destination = xml_element.elements['globalOffsetInDestination'].text
			end
			if xml_element.elements['effectArray'] != nil
				self.effect_array = KalturaClientBase.object_from_xml(xml_element.elements['effectArray'], 'KalturaEffect')
			end
		end

	end

	class KalturaClipConcatJobData < KalturaJobData
		# $partnerId
		attr_accessor :partner_id
		# $priority
		attr_accessor :priority
		# clip operations
		attr_accessor :operation_attributes

		def partner_id=(val)
			@partner_id = val.to_i
		end
		def priority=(val)
			@priority = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['priority'] != nil
				self.priority = xml_element.elements['priority'].text
			end
			if xml_element.elements['operationAttributes'] != nil
				self.operation_attributes = KalturaClientBase.object_from_xml(xml_element.elements['operationAttributes'], 'KalturaOperationAttributes')
			end
		end

	end

	class KalturaCompareCondition < KalturaCondition
		# Value to evaluate against the field and operator
		attr_accessor :value
		# Comparing operator
		attr_accessor :comparison


		def from_xml(xml_element)
			super
			if xml_element.elements['value'] != nil
				self.value = KalturaClientBase.object_from_xml(xml_element.elements['value'], 'KalturaIntegerValue')
			end
			if xml_element.elements['comparison'] != nil
				self.comparison = xml_element.elements['comparison'].text
			end
		end

	end

	class KalturaDataCenterContentResource < KalturaContentResource


		def from_xml(xml_element)
			super
		end

	end

	# Concat operation attributes
	class KalturaConcatAttributes < KalturaOperationAttributes
		# The resource to be concatenated
		attr_accessor :resource


		def from_xml(xml_element)
			super
			if xml_element.elements['resource'] != nil
				self.resource = KalturaClientBase.object_from_xml(xml_element.elements['resource'], 'KalturaDataCenterContentResource')
			end
		end

	end

	class KalturaConcatJobData < KalturaJobData
		# Source files to be concatenated
		attr_accessor :src_files
		# Output file
		attr_accessor :dest_file_path
		# Flavor asset to be ingested with the output
		attr_accessor :flavor_asset_id
		# Clipping offset in seconds
		attr_accessor :offset
		# Clipping duration in seconds
		attr_accessor :duration
		# duration of the concated video
		attr_accessor :concatenated_duration
		# Should Sort the clip parts
		attr_accessor :should_sort

		def offset=(val)
			@offset = val.to_f
		end
		def duration=(val)
			@duration = val.to_f
		end
		def concatenated_duration=(val)
			@concatenated_duration = val.to_f
		end
		def should_sort=(val)
			@should_sort = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['srcFiles'] != nil
				self.src_files = KalturaClientBase.object_from_xml(xml_element.elements['srcFiles'], 'KalturaString')
			end
			if xml_element.elements['destFilePath'] != nil
				self.dest_file_path = xml_element.elements['destFilePath'].text
			end
			if xml_element.elements['flavorAssetId'] != nil
				self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			end
			if xml_element.elements['offset'] != nil
				self.offset = xml_element.elements['offset'].text
			end
			if xml_element.elements['duration'] != nil
				self.duration = xml_element.elements['duration'].text
			end
			if xml_element.elements['concatenatedDuration'] != nil
				self.concatenated_duration = xml_element.elements['concatenatedDuration'].text
			end
			if xml_element.elements['shouldSort'] != nil
				self.should_sort = xml_element.elements['shouldSort'].text
			end
		end

	end

	class KalturaControlPanelCommandBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :created_by_id_equal
		attr_accessor :type_equal
		attr_accessor :type_in
		attr_accessor :target_type_equal
		attr_accessor :target_type_in
		attr_accessor :status_equal
		attr_accessor :status_in

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def created_at_greater_than_or_equal=(val)
			@created_at_greater_than_or_equal = val.to_i
		end
		def created_at_less_than_or_equal=(val)
			@created_at_less_than_or_equal = val.to_i
		end
		def created_by_id_equal=(val)
			@created_by_id_equal = val.to_i
		end
		def type_equal=(val)
			@type_equal = val.to_i
		end
		def target_type_equal=(val)
			@target_type_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['createdAtGreaterThanOrEqual'] != nil
				self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['createdAtLessThanOrEqual'] != nil
				self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			end
			if xml_element.elements['createdByIdEqual'] != nil
				self.created_by_id_equal = xml_element.elements['createdByIdEqual'].text
			end
			if xml_element.elements['typeEqual'] != nil
				self.type_equal = xml_element.elements['typeEqual'].text
			end
			if xml_element.elements['typeIn'] != nil
				self.type_in = xml_element.elements['typeIn'].text
			end
			if xml_element.elements['targetTypeEqual'] != nil
				self.target_type_equal = xml_element.elements['targetTypeEqual'].text
			end
			if xml_element.elements['targetTypeIn'] != nil
				self.target_type_in = xml_element.elements['targetTypeIn'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
		end

	end

	class KalturaControlPanelCommandListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaControlPanelCommand')
			end
		end

	end

	class KalturaConvartableJobData < KalturaJobData
		attr_accessor :src_file_sync_local_path
		# The translated path as used by the scheduler
		attr_accessor :actual_src_file_sync_local_path
		attr_accessor :src_file_sync_remote_url
		attr_accessor :src_file_syncs
		attr_accessor :engine_version
		attr_accessor :flavor_params_output_id
		attr_accessor :flavor_params_output
		attr_accessor :media_info_id
		attr_accessor :current_operation_set
		attr_accessor :current_operation_index
		attr_accessor :plugin_data

		def engine_version=(val)
			@engine_version = val.to_i
		end
		def flavor_params_output_id=(val)
			@flavor_params_output_id = val.to_i
		end
		def media_info_id=(val)
			@media_info_id = val.to_i
		end
		def current_operation_set=(val)
			@current_operation_set = val.to_i
		end
		def current_operation_index=(val)
			@current_operation_index = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['srcFileSyncLocalPath'] != nil
				self.src_file_sync_local_path = xml_element.elements['srcFileSyncLocalPath'].text
			end
			if xml_element.elements['actualSrcFileSyncLocalPath'] != nil
				self.actual_src_file_sync_local_path = xml_element.elements['actualSrcFileSyncLocalPath'].text
			end
			if xml_element.elements['srcFileSyncRemoteUrl'] != nil
				self.src_file_sync_remote_url = xml_element.elements['srcFileSyncRemoteUrl'].text
			end
			if xml_element.elements['srcFileSyncs'] != nil
				self.src_file_syncs = KalturaClientBase.object_from_xml(xml_element.elements['srcFileSyncs'], 'KalturaSourceFileSyncDescriptor')
			end
			if xml_element.elements['engineVersion'] != nil
				self.engine_version = xml_element.elements['engineVersion'].text
			end
			if xml_element.elements['flavorParamsOutputId'] != nil
				self.flavor_params_output_id = xml_element.elements['flavorParamsOutputId'].text
			end
			if xml_element.elements['flavorParamsOutput'] != nil
				self.flavor_params_output = KalturaClientBase.object_from_xml(xml_element.elements['flavorParamsOutput'], 'KalturaFlavorParamsOutput')
			end
			if xml_element.elements['mediaInfoId'] != nil
				self.media_info_id = xml_element.elements['mediaInfoId'].text
			end
			if xml_element.elements['currentOperationSet'] != nil
				self.current_operation_set = xml_element.elements['currentOperationSet'].text
			end
			if xml_element.elements['currentOperationIndex'] != nil
				self.current_operation_index = xml_element.elements['currentOperationIndex'].text
			end
			if xml_element.elements['pluginData'] != nil
				self.plugin_data = KalturaClientBase.object_from_xml(xml_element.elements['pluginData'], 'KalturaKeyValue')
			end
		end

	end

	class KalturaConversionProfileAssetParamsListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaConversionProfileAssetParams')
			end
		end

	end

	class KalturaConversionProfileListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaConversionProfile')
			end
		end

	end

	class KalturaConvertLiveSegmentJobData < KalturaJobData
		# Live stream entry id
		attr_accessor :entry_id
		attr_accessor :asset_id
		# Primary or secondary media server
		attr_accessor :media_server_index
		# The index of the file within the entry
		attr_accessor :file_index
		# The recorded live media
		attr_accessor :src_file_path
		# The output file
		attr_accessor :dest_file_path
		# Duration of the live entry including all recorded segments including the current
		attr_accessor :end_time
		# The data output file
		attr_accessor :dest_data_file_path

		def file_index=(val)
			@file_index = val.to_i
		end
		def end_time=(val)
			@end_time = val.to_f
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['assetId'] != nil
				self.asset_id = xml_element.elements['assetId'].text
			end
			if xml_element.elements['mediaServerIndex'] != nil
				self.media_server_index = xml_element.elements['mediaServerIndex'].text
			end
			if xml_element.elements['fileIndex'] != nil
				self.file_index = xml_element.elements['fileIndex'].text
			end
			if xml_element.elements['srcFilePath'] != nil
				self.src_file_path = xml_element.elements['srcFilePath'].text
			end
			if xml_element.elements['destFilePath'] != nil
				self.dest_file_path = xml_element.elements['destFilePath'].text
			end
			if xml_element.elements['endTime'] != nil
				self.end_time = xml_element.elements['endTime'].text
			end
			if xml_element.elements['destDataFilePath'] != nil
				self.dest_data_file_path = xml_element.elements['destDataFilePath'].text
			end
		end

	end

	class KalturaConvertProfileJobData < KalturaJobData
		attr_accessor :input_file_sync_local_path
		# The height of last created thumbnail, will be used to comapare if this thumbnail is the best we can have
		attr_accessor :thumb_height
		# The bit rate of last created thumbnail, will be used to comapare if this thumbnail is the best we can have
		attr_accessor :thumb_bitrate

		def thumb_height=(val)
			@thumb_height = val.to_i
		end
		def thumb_bitrate=(val)
			@thumb_bitrate = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['inputFileSyncLocalPath'] != nil
				self.input_file_sync_local_path = xml_element.elements['inputFileSyncLocalPath'].text
			end
			if xml_element.elements['thumbHeight'] != nil
				self.thumb_height = xml_element.elements['thumbHeight'].text
			end
			if xml_element.elements['thumbBitrate'] != nil
				self.thumb_bitrate = xml_element.elements['thumbBitrate'].text
			end
		end

	end

	class KalturaCopyPartnerJobData < KalturaJobData
		# Id of the partner to copy from
		attr_accessor :from_partner_id
		# Id of the partner to copy to
		attr_accessor :to_partner_id

		def from_partner_id=(val)
			@from_partner_id = val.to_i
		end
		def to_partner_id=(val)
			@to_partner_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['fromPartnerId'] != nil
				self.from_partner_id = xml_element.elements['fromPartnerId'].text
			end
			if xml_element.elements['toPartnerId'] != nil
				self.to_partner_id = xml_element.elements['toPartnerId'].text
			end
		end

	end

	class KalturaCountryRestriction < KalturaBaseRestriction
		# Country restriction type (Allow or deny)
		attr_accessor :country_restriction_type
		# Comma separated list of country codes to allow to deny
		attr_accessor :country_list

		def country_restriction_type=(val)
			@country_restriction_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['countryRestrictionType'] != nil
				self.country_restriction_type = xml_element.elements['countryRestrictionType'].text
			end
			if xml_element.elements['countryList'] != nil
				self.country_list = xml_element.elements['countryList'].text
			end
		end

	end

	class KalturaDataListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaDataEntry')
			end
		end

	end

	class KalturaDeleteFileJobData < KalturaJobData
		attr_accessor :local_file_sync_path


		def from_xml(xml_element)
			super
			if xml_element.elements['localFileSyncPath'] != nil
				self.local_file_sync_path = xml_element.elements['localFileSyncPath'].text
			end
		end

	end

	class KalturaDeleteJobData < KalturaJobData
		# The filter should return the list of objects that need to be deleted.
		attr_accessor :filter


		def from_xml(xml_element)
			super
			if xml_element.elements['filter'] != nil
				self.filter = KalturaClientBase.object_from_xml(xml_element.elements['filter'], 'KalturaFilter')
			end
		end

	end

	class KalturaDeliveryProfileAkamaiAppleHttpManifest < KalturaDeliveryProfile
		# Should we use timing parameters - clipTo / seekFrom
		attr_accessor :support_clipping

		def support_clipping=(val)
			@support_clipping = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['supportClipping'] != nil
				self.support_clipping = xml_element.elements['supportClipping'].text
			end
		end

	end

	class KalturaDeliveryProfileAkamaiHds < KalturaDeliveryProfile
		# Should we use timing parameters - clipTo / seekFrom
		attr_accessor :support_clipping

		def support_clipping=(val)
			@support_clipping = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['supportClipping'] != nil
				self.support_clipping = xml_element.elements['supportClipping'].text
			end
		end

	end

	class KalturaDeliveryProfileAkamaiHttp < KalturaDeliveryProfile
		# Should we use intelliseek
		attr_accessor :use_intelliseek

		def use_intelliseek=(val)
			@use_intelliseek = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['useIntelliseek'] != nil
				self.use_intelliseek = xml_element.elements['useIntelliseek'].text
			end
		end

	end

	class KalturaDeliveryProfileBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :system_name_equal
		attr_accessor :system_name_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :streamer_type_equal
		attr_accessor :status_equal
		attr_accessor :status_in

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
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
		def status_equal=(val)
			@status_equal = val.to_i
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
			if xml_element.elements['streamerTypeEqual'] != nil
				self.streamer_type_equal = xml_element.elements['streamerTypeEqual'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
		end

	end

	class KalturaDeliveryProfileCondition < KalturaCondition
		# The delivery ids that are accepted by this condition
		attr_accessor :delivery_profile_ids


		def from_xml(xml_element)
			super
			if xml_element.elements['deliveryProfileIds'] != nil
				self.delivery_profile_ids = KalturaClientBase.object_from_xml(xml_element.elements['deliveryProfileIds'], 'KalturaIntegerValue')
			end
		end

	end

	class KalturaDeliveryProfileGenericAppleHttp < KalturaDeliveryProfile
		attr_accessor :pattern
		# rendererClass
		attr_accessor :renderer_class
		# Enable to make playManifest redirect to the domain of the delivery profile
		attr_accessor :manifest_redirect

		def manifest_redirect=(val)
			@manifest_redirect = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['pattern'] != nil
				self.pattern = xml_element.elements['pattern'].text
			end
			if xml_element.elements['rendererClass'] != nil
				self.renderer_class = xml_element.elements['rendererClass'].text
			end
			if xml_element.elements['manifestRedirect'] != nil
				self.manifest_redirect = xml_element.elements['manifestRedirect'].text
			end
		end

	end

	class KalturaDeliveryProfileGenericHds < KalturaDeliveryProfile
		attr_accessor :pattern
		# rendererClass
		attr_accessor :renderer_class


		def from_xml(xml_element)
			super
			if xml_element.elements['pattern'] != nil
				self.pattern = xml_element.elements['pattern'].text
			end
			if xml_element.elements['rendererClass'] != nil
				self.renderer_class = xml_element.elements['rendererClass'].text
			end
		end

	end

	class KalturaDeliveryProfileGenericHttp < KalturaDeliveryProfile
		attr_accessor :pattern


		def from_xml(xml_element)
			super
			if xml_element.elements['pattern'] != nil
				self.pattern = xml_element.elements['pattern'].text
			end
		end

	end

	class KalturaDeliveryProfileGenericSilverLight < KalturaDeliveryProfile
		attr_accessor :pattern


		def from_xml(xml_element)
			super
			if xml_element.elements['pattern'] != nil
				self.pattern = xml_element.elements['pattern'].text
			end
		end

	end

	class KalturaDeliveryProfileListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaDeliveryProfile')
			end
		end

	end

	class KalturaDeliveryProfileLiveAppleHttp < KalturaDeliveryProfile
		attr_accessor :disable_extra_attributes
		attr_accessor :force_proxy

		def disable_extra_attributes=(val)
			@disable_extra_attributes = to_b(val)
		end
		def force_proxy=(val)
			@force_proxy = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['disableExtraAttributes'] != nil
				self.disable_extra_attributes = xml_element.elements['disableExtraAttributes'].text
			end
			if xml_element.elements['forceProxy'] != nil
				self.force_proxy = xml_element.elements['forceProxy'].text
			end
		end

	end

	class KalturaDeliveryProfileLivePackager < KalturaDeliveryProfile
		# Domain used to sign the live url
		attr_accessor :live_packager_signing_domain


		def from_xml(xml_element)
			super
			if xml_element.elements['livePackagerSigningDomain'] != nil
				self.live_packager_signing_domain = xml_element.elements['livePackagerSigningDomain'].text
			end
		end

	end

	class KalturaDeliveryProfileRtmp < KalturaDeliveryProfile
		# enforceRtmpe
		attr_accessor :enforce_rtmpe
		# a prefix that is added to all stream urls (replaces storageProfile::rtmpPrefix)
		attr_accessor :prefix

		def enforce_rtmpe=(val)
			@enforce_rtmpe = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['enforceRtmpe'] != nil
				self.enforce_rtmpe = xml_element.elements['enforceRtmpe'].text
			end
			if xml_element.elements['prefix'] != nil
				self.prefix = xml_element.elements['prefix'].text
			end
		end

	end

	class KalturaDeliveryProfileVodPackagerPlayServer < KalturaDeliveryProfile
		attr_accessor :ad_stitching_enabled

		def ad_stitching_enabled=(val)
			@ad_stitching_enabled = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['adStitchingEnabled'] != nil
				self.ad_stitching_enabled = xml_element.elements['adStitchingEnabled'].text
			end
		end

	end

	class KalturaDeliveryServerNode < KalturaServerNode
		# Delivery profile ids
		attr_accessor :delivery_profile_ids
		# Override server node default configuration - json format
		attr_accessor :config


		def from_xml(xml_element)
			super
			if xml_element.elements['deliveryProfileIds'] != nil
				self.delivery_profile_ids = KalturaClientBase.object_from_xml(xml_element.elements['deliveryProfileIds'], 'KalturaKeyValue')
			end
			if xml_element.elements['config'] != nil
				self.config = xml_element.elements['config'].text
			end
		end

	end

	class KalturaDirectoryRestriction < KalturaBaseRestriction
		# Kaltura directory restriction type
		attr_accessor :directory_restriction_type

		def directory_restriction_type=(val)
			@directory_restriction_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['directoryRestrictionType'] != nil
				self.directory_restriction_type = xml_element.elements['directoryRestrictionType'].text
			end
		end

	end

	class KalturaDrmEntryContextPluginData < KalturaPluginData
		# For the uDRM we give the drm context data which is a json encoding of an array containing the uDRM data
		#      for each flavor that is required from this getContextData request.
		attr_accessor :flavor_data


		def from_xml(xml_element)
			super
			if xml_element.elements['flavorData'] != nil
				self.flavor_data = xml_element.elements['flavorData'].text
			end
		end

	end

	class KalturaCategoryUserBaseFilter < KalturaRelatedFilter
		attr_accessor :category_id_equal
		attr_accessor :category_id_in
		attr_accessor :user_id_equal
		attr_accessor :user_id_in
		attr_accessor :permission_level_equal
		attr_accessor :permission_level_in
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :update_method_equal
		attr_accessor :update_method_in
		attr_accessor :category_full_ids_starts_with
		attr_accessor :category_full_ids_equal
		attr_accessor :permission_names_match_and
		attr_accessor :permission_names_match_or
		attr_accessor :permission_names_not_contains

		def category_id_equal=(val)
			@category_id_equal = val.to_i
		end
		def permission_level_equal=(val)
			@permission_level_equal = val.to_i
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
		def update_method_equal=(val)
			@update_method_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['categoryIdEqual'] != nil
				self.category_id_equal = xml_element.elements['categoryIdEqual'].text
			end
			if xml_element.elements['categoryIdIn'] != nil
				self.category_id_in = xml_element.elements['categoryIdIn'].text
			end
			if xml_element.elements['userIdEqual'] != nil
				self.user_id_equal = xml_element.elements['userIdEqual'].text
			end
			if xml_element.elements['userIdIn'] != nil
				self.user_id_in = xml_element.elements['userIdIn'].text
			end
			if xml_element.elements['permissionLevelEqual'] != nil
				self.permission_level_equal = xml_element.elements['permissionLevelEqual'].text
			end
			if xml_element.elements['permissionLevelIn'] != nil
				self.permission_level_in = xml_element.elements['permissionLevelIn'].text
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
			if xml_element.elements['updateMethodEqual'] != nil
				self.update_method_equal = xml_element.elements['updateMethodEqual'].text
			end
			if xml_element.elements['updateMethodIn'] != nil
				self.update_method_in = xml_element.elements['updateMethodIn'].text
			end
			if xml_element.elements['categoryFullIdsStartsWith'] != nil
				self.category_full_ids_starts_with = xml_element.elements['categoryFullIdsStartsWith'].text
			end
			if xml_element.elements['categoryFullIdsEqual'] != nil
				self.category_full_ids_equal = xml_element.elements['categoryFullIdsEqual'].text
			end
			if xml_element.elements['permissionNamesMatchAnd'] != nil
				self.permission_names_match_and = xml_element.elements['permissionNamesMatchAnd'].text
			end
			if xml_element.elements['permissionNamesMatchOr'] != nil
				self.permission_names_match_or = xml_element.elements['permissionNamesMatchOr'].text
			end
			if xml_element.elements['permissionNamesNotContains'] != nil
				self.permission_names_not_contains = xml_element.elements['permissionNamesNotContains'].text
			end
		end

	end

	class KalturaCategoryUserFilter < KalturaCategoryUserBaseFilter
		# Return the list of categoryUser that are not inherited from parent category - only the direct categoryUsers.
		attr_accessor :category_direct_members
		# Free text search on user id or screen name
		attr_accessor :free_text
		# Return a list of categoryUser that related to the userId in this field by groups
		attr_accessor :related_groups_by_user_id

		def category_direct_members=(val)
			@category_direct_members = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['categoryDirectMembers'] != nil
				self.category_direct_members = xml_element.elements['categoryDirectMembers'].text
			end
			if xml_element.elements['freeText'] != nil
				self.free_text = xml_element.elements['freeText'].text
			end
			if xml_element.elements['relatedGroupsByUserId'] != nil
				self.related_groups_by_user_id = xml_element.elements['relatedGroupsByUserId'].text
			end
		end

	end

	class KalturaUserBaseFilter < KalturaRelatedFilter
		attr_accessor :partner_id_equal
		attr_accessor :type_equal
		attr_accessor :type_in
		attr_accessor :screen_name_like
		attr_accessor :screen_name_starts_with
		attr_accessor :email_like
		attr_accessor :email_starts_with
		attr_accessor :tags_multi_like_or
		attr_accessor :tags_multi_like_and
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :first_name_starts_with
		attr_accessor :last_name_starts_with
		attr_accessor :is_admin_equal

		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
		end
		def type_equal=(val)
			@type_equal = val.to_i
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
		def is_admin_equal=(val)
			@is_admin_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['partnerIdEqual'] != nil
				self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			end
			if xml_element.elements['typeEqual'] != nil
				self.type_equal = xml_element.elements['typeEqual'].text
			end
			if xml_element.elements['typeIn'] != nil
				self.type_in = xml_element.elements['typeIn'].text
			end
			if xml_element.elements['screenNameLike'] != nil
				self.screen_name_like = xml_element.elements['screenNameLike'].text
			end
			if xml_element.elements['screenNameStartsWith'] != nil
				self.screen_name_starts_with = xml_element.elements['screenNameStartsWith'].text
			end
			if xml_element.elements['emailLike'] != nil
				self.email_like = xml_element.elements['emailLike'].text
			end
			if xml_element.elements['emailStartsWith'] != nil
				self.email_starts_with = xml_element.elements['emailStartsWith'].text
			end
			if xml_element.elements['tagsMultiLikeOr'] != nil
				self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			end
			if xml_element.elements['tagsMultiLikeAnd'] != nil
				self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
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
			if xml_element.elements['firstNameStartsWith'] != nil
				self.first_name_starts_with = xml_element.elements['firstNameStartsWith'].text
			end
			if xml_element.elements['lastNameStartsWith'] != nil
				self.last_name_starts_with = xml_element.elements['lastNameStartsWith'].text
			end
			if xml_element.elements['isAdminEqual'] != nil
				self.is_admin_equal = xml_element.elements['isAdminEqual'].text
			end
		end

	end

	class KalturaUserFilter < KalturaUserBaseFilter
		attr_accessor :id_or_screen_name_starts_with
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :login_enabled_equal
		attr_accessor :role_id_equal
		attr_accessor :role_ids_equal
		attr_accessor :role_ids_in
		attr_accessor :first_name_or_last_name_starts_with
		# Permission names filter expression
		attr_accessor :permission_names_multi_like_or
		# Permission names filter expression
		attr_accessor :permission_names_multi_like_and

		def login_enabled_equal=(val)
			@login_enabled_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idOrScreenNameStartsWith'] != nil
				self.id_or_screen_name_starts_with = xml_element.elements['idOrScreenNameStartsWith'].text
			end
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['loginEnabledEqual'] != nil
				self.login_enabled_equal = xml_element.elements['loginEnabledEqual'].text
			end
			if xml_element.elements['roleIdEqual'] != nil
				self.role_id_equal = xml_element.elements['roleIdEqual'].text
			end
			if xml_element.elements['roleIdsEqual'] != nil
				self.role_ids_equal = xml_element.elements['roleIdsEqual'].text
			end
			if xml_element.elements['roleIdsIn'] != nil
				self.role_ids_in = xml_element.elements['roleIdsIn'].text
			end
			if xml_element.elements['firstNameOrLastNameStartsWith'] != nil
				self.first_name_or_last_name_starts_with = xml_element.elements['firstNameOrLastNameStartsWith'].text
			end
			if xml_element.elements['permissionNamesMultiLikeOr'] != nil
				self.permission_names_multi_like_or = xml_element.elements['permissionNamesMultiLikeOr'].text
			end
			if xml_element.elements['permissionNamesMultiLikeAnd'] != nil
				self.permission_names_multi_like_and = xml_element.elements['permissionNamesMultiLikeAnd'].text
			end
		end

	end

	class KalturaEntryContext < KalturaContext
		# The entry ID in the context of which the playlist should be built
		attr_accessor :entry_id
		# Is this a redirected entry followup?
		attr_accessor :follow_entry_redirect

		def follow_entry_redirect=(val)
			@follow_entry_redirect = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['followEntryRedirect'] != nil
				self.follow_entry_redirect = xml_element.elements['followEntryRedirect'].text
			end
		end

	end

	# Object which contains contextual entry-related data.
	class KalturaEntryContextDataParams < KalturaAccessControlScope
		# Id of the current flavor.
		attr_accessor :flavor_asset_id
		# The tags of the flavors that should be used for playback.
		attr_accessor :flavor_tags
		# Playback streamer type: RTMP, HTTP, appleHttps, rtsp, sl.
		attr_accessor :streamer_type
		# Protocol of the specific media object.
		attr_accessor :media_protocol


		def from_xml(xml_element)
			super
			if xml_element.elements['flavorAssetId'] != nil
				self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			end
			if xml_element.elements['flavorTags'] != nil
				self.flavor_tags = xml_element.elements['flavorTags'].text
			end
			if xml_element.elements['streamerType'] != nil
				self.streamer_type = xml_element.elements['streamerType'].text
			end
			if xml_element.elements['mediaProtocol'] != nil
				self.media_protocol = xml_element.elements['mediaProtocol'].text
			end
		end

	end

	class KalturaEntryContextDataResult < KalturaContextDataResult
		attr_accessor :is_site_restricted
		attr_accessor :is_country_restricted
		attr_accessor :is_session_restricted
		attr_accessor :is_ip_address_restricted
		attr_accessor :is_user_agent_restricted
		attr_accessor :preview_length
		attr_accessor :is_scheduled_now
		attr_accessor :is_admin
		# http/rtmp/hdnetwork
		attr_accessor :streamer_type
		# http/https, rtmp/rtmpe
		attr_accessor :media_protocol
		attr_accessor :storage_profiles_xml
		# Array of messages as received from the access control rules that invalidated
		attr_accessor :access_control_messages
		# Array of actions as received from the access control rules that invalidated
		attr_accessor :access_control_actions
		# Array of allowed flavor assets according to access control limitations and requested tags
		attr_accessor :flavor_assets
		# The duration of the entry in milliseconds
		attr_accessor :ms_duration
		# Array of allowed flavor assets according to access control limitations and requested tags
		attr_accessor :plugin_data

		def is_site_restricted=(val)
			@is_site_restricted = to_b(val)
		end
		def is_country_restricted=(val)
			@is_country_restricted = to_b(val)
		end
		def is_session_restricted=(val)
			@is_session_restricted = to_b(val)
		end
		def is_ip_address_restricted=(val)
			@is_ip_address_restricted = to_b(val)
		end
		def is_user_agent_restricted=(val)
			@is_user_agent_restricted = to_b(val)
		end
		def preview_length=(val)
			@preview_length = val.to_i
		end
		def is_scheduled_now=(val)
			@is_scheduled_now = to_b(val)
		end
		def is_admin=(val)
			@is_admin = to_b(val)
		end
		def ms_duration=(val)
			@ms_duration = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['isSiteRestricted'] != nil
				self.is_site_restricted = xml_element.elements['isSiteRestricted'].text
			end
			if xml_element.elements['isCountryRestricted'] != nil
				self.is_country_restricted = xml_element.elements['isCountryRestricted'].text
			end
			if xml_element.elements['isSessionRestricted'] != nil
				self.is_session_restricted = xml_element.elements['isSessionRestricted'].text
			end
			if xml_element.elements['isIpAddressRestricted'] != nil
				self.is_ip_address_restricted = xml_element.elements['isIpAddressRestricted'].text
			end
			if xml_element.elements['isUserAgentRestricted'] != nil
				self.is_user_agent_restricted = xml_element.elements['isUserAgentRestricted'].text
			end
			if xml_element.elements['previewLength'] != nil
				self.preview_length = xml_element.elements['previewLength'].text
			end
			if xml_element.elements['isScheduledNow'] != nil
				self.is_scheduled_now = xml_element.elements['isScheduledNow'].text
			end
			if xml_element.elements['isAdmin'] != nil
				self.is_admin = xml_element.elements['isAdmin'].text
			end
			if xml_element.elements['streamerType'] != nil
				self.streamer_type = xml_element.elements['streamerType'].text
			end
			if xml_element.elements['mediaProtocol'] != nil
				self.media_protocol = xml_element.elements['mediaProtocol'].text
			end
			if xml_element.elements['storageProfilesXML'] != nil
				self.storage_profiles_xml = xml_element.elements['storageProfilesXML'].text
			end
			if xml_element.elements['accessControlMessages'] != nil
				self.access_control_messages = KalturaClientBase.object_from_xml(xml_element.elements['accessControlMessages'], 'KalturaString')
			end
			if xml_element.elements['accessControlActions'] != nil
				self.access_control_actions = KalturaClientBase.object_from_xml(xml_element.elements['accessControlActions'], 'KalturaRuleAction')
			end
			if xml_element.elements['flavorAssets'] != nil
				self.flavor_assets = KalturaClientBase.object_from_xml(xml_element.elements['flavorAssets'], 'KalturaFlavorAsset')
			end
			if xml_element.elements['msDuration'] != nil
				self.ms_duration = xml_element.elements['msDuration'].text
			end
			if xml_element.elements['pluginData'] != nil
				self.plugin_data = KalturaClientBase.object_from_xml(xml_element.elements['pluginData'], 'KalturaPluginData')
			end
		end

	end

	class KalturaEntryCuePointSearchFilter < KalturaSearchItem
		attr_accessor :cue_points_free_text
		attr_accessor :cue_point_type_in
		attr_accessor :cue_point_sub_type_equal

		def cue_point_sub_type_equal=(val)
			@cue_point_sub_type_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['cuePointsFreeText'] != nil
				self.cue_points_free_text = xml_element.elements['cuePointsFreeText'].text
			end
			if xml_element.elements['cuePointTypeIn'] != nil
				self.cue_point_type_in = xml_element.elements['cuePointTypeIn'].text
			end
			if xml_element.elements['cuePointSubTypeEqual'] != nil
				self.cue_point_sub_type_equal = xml_element.elements['cuePointSubTypeEqual'].text
			end
		end

	end

	class KalturaEntryIdentifier < KalturaObjectIdentifier
		# Identifier of the object
		attr_accessor :identifier


		def from_xml(xml_element)
			super
			if xml_element.elements['identifier'] != nil
				self.identifier = xml_element.elements['identifier'].text
			end
		end

	end

	class KalturaEntryLiveStats < KalturaLiveStats
		attr_accessor :entry_id
		attr_accessor :peak_audience
		attr_accessor :peak_dvr_audience

		def peak_audience=(val)
			@peak_audience = val.to_i
		end
		def peak_dvr_audience=(val)
			@peak_dvr_audience = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['peakAudience'] != nil
				self.peak_audience = xml_element.elements['peakAudience'].text
			end
			if xml_element.elements['peakDvrAudience'] != nil
				self.peak_dvr_audience = xml_element.elements['peakDvrAudience'].text
			end
		end

	end

	class KalturaEntryServerNodeBaseFilter < KalturaFilter
		attr_accessor :entry_id_equal
		attr_accessor :entry_id_in
		attr_accessor :server_node_id_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :server_type_equal
		attr_accessor :server_type_in

		def server_node_id_equal=(val)
			@server_node_id_equal = val.to_i
		end
		def created_at_less_than_or_equal=(val)
			@created_at_less_than_or_equal = val.to_i
		end
		def created_at_greater_than_or_equal=(val)
			@created_at_greater_than_or_equal = val.to_i
		end
		def updated_at_greater_than_or_equal=(val)
			@updated_at_greater_than_or_equal = val.to_i
		end
		def updated_at_less_than_or_equal=(val)
			@updated_at_less_than_or_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['entryIdEqual'] != nil
				self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			end
			if xml_element.elements['entryIdIn'] != nil
				self.entry_id_in = xml_element.elements['entryIdIn'].text
			end
			if xml_element.elements['serverNodeIdEqual'] != nil
				self.server_node_id_equal = xml_element.elements['serverNodeIdEqual'].text
			end
			if xml_element.elements['createdAtLessThanOrEqual'] != nil
				self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			end
			if xml_element.elements['createdAtGreaterThanOrEqual'] != nil
				self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['updatedAtGreaterThanOrEqual'] != nil
				self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['updatedAtLessThanOrEqual'] != nil
				self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['serverTypeEqual'] != nil
				self.server_type_equal = xml_element.elements['serverTypeEqual'].text
			end
			if xml_element.elements['serverTypeIn'] != nil
				self.server_type_in = xml_element.elements['serverTypeIn'].text
			end
		end

	end

	class KalturaEntryServerNodeListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaEntryServerNode')
			end
		end

	end

	# A boolean representation to return evaluated dynamic value
	class KalturaBooleanField < KalturaBooleanValue


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFeatureStatusListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaFeatureStatus')
			end
		end

	end

	class KalturaFileAssetListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaFileAsset')
			end
		end

	end

	class KalturaFlattenJobData < KalturaJobData


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFlavorAssetListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaFlavorAsset')
			end
		end

	end

	class KalturaFlavorParamsListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaFlavorParams')
			end
		end

	end

	class KalturaGenericSyndicationFeed < KalturaBaseSyndicationFeed
		# feed description
		attr_accessor :feed_description
		# feed landing page (i.e publisher website)
		attr_accessor :feed_landing_page
		# entry filter
		attr_accessor :entry_filter
		# page size
		attr_accessor :page_size

		def page_size=(val)
			@page_size = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['feedDescription'] != nil
				self.feed_description = xml_element.elements['feedDescription'].text
			end
			if xml_element.elements['feedLandingPage'] != nil
				self.feed_landing_page = xml_element.elements['feedLandingPage'].text
			end
			if xml_element.elements['entryFilter'] != nil
				self.entry_filter = KalturaClientBase.object_from_xml(xml_element.elements['entryFilter'], 'KalturaBaseEntryFilter')
			end
			if xml_element.elements['pageSize'] != nil
				self.page_size = xml_element.elements['pageSize'].text
			end
		end

	end

	class KalturaGoogleVideoSyndicationFeed < KalturaBaseSyndicationFeed
		attr_accessor :adult_content


		def from_xml(xml_element)
			super
			if xml_element.elements['adultContent'] != nil
				self.adult_content = xml_element.elements['adultContent'].text
			end
		end

	end

	class KalturaGroupUserListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaGroupUser')
			end
		end

	end

	class KalturaHashCondition < KalturaCondition
		# hash name
		attr_accessor :hash_name
		# hash secret
		attr_accessor :hash_secret


		def from_xml(xml_element)
			super
			if xml_element.elements['hashName'] != nil
				self.hash_name = xml_element.elements['hashName'].text
			end
			if xml_element.elements['hashSecret'] != nil
				self.hash_secret = xml_element.elements['hashSecret'].text
			end
		end

	end

	class KalturaITunesSyndicationFeed < KalturaBaseSyndicationFeed
		# feed description
		attr_accessor :feed_description
		# feed language
		attr_accessor :language
		# feed landing page (i.e publisher website)
		attr_accessor :feed_landing_page
		# author/publisher name
		attr_accessor :owner_name
		# publisher email
		attr_accessor :owner_email
		# podcast thumbnail
		attr_accessor :feed_image_url
		attr_accessor :category
		attr_accessor :adult_content
		attr_accessor :feed_author
		attr_accessor :enforce_feed_author
		# true in case you want to enfore the palylist order on the
		attr_accessor :enforce_order

		def enforce_feed_author=(val)
			@enforce_feed_author = to_b(val)
		end
		def enforce_order=(val)
			@enforce_order = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['feedDescription'] != nil
				self.feed_description = xml_element.elements['feedDescription'].text
			end
			if xml_element.elements['language'] != nil
				self.language = xml_element.elements['language'].text
			end
			if xml_element.elements['feedLandingPage'] != nil
				self.feed_landing_page = xml_element.elements['feedLandingPage'].text
			end
			if xml_element.elements['ownerName'] != nil
				self.owner_name = xml_element.elements['ownerName'].text
			end
			if xml_element.elements['ownerEmail'] != nil
				self.owner_email = xml_element.elements['ownerEmail'].text
			end
			if xml_element.elements['feedImageUrl'] != nil
				self.feed_image_url = xml_element.elements['feedImageUrl'].text
			end
			if xml_element.elements['category'] != nil
				self.category = xml_element.elements['category'].text
			end
			if xml_element.elements['adultContent'] != nil
				self.adult_content = xml_element.elements['adultContent'].text
			end
			if xml_element.elements['feedAuthor'] != nil
				self.feed_author = xml_element.elements['feedAuthor'].text
			end
			if xml_element.elements['enforceFeedAuthor'] != nil
				self.enforce_feed_author = xml_element.elements['enforceFeedAuthor'].text
			end
			if xml_element.elements['enforceOrder'] != nil
				self.enforce_order = xml_element.elements['enforceOrder'].text
			end
		end

	end

	class KalturaImportJobData < KalturaJobData
		attr_accessor :src_file_url
		attr_accessor :dest_file_local_path
		attr_accessor :flavor_asset_id
		attr_accessor :file_size

		def file_size=(val)
			@file_size = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['srcFileUrl'] != nil
				self.src_file_url = xml_element.elements['srcFileUrl'].text
			end
			if xml_element.elements['destFileLocalPath'] != nil
				self.dest_file_local_path = xml_element.elements['destFileLocalPath'].text
			end
			if xml_element.elements['flavorAssetId'] != nil
				self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			end
			if xml_element.elements['fileSize'] != nil
				self.file_size = xml_element.elements['fileSize'].text
			end
		end

	end

	class KalturaIndexAdvancedFilter < KalturaSearchItem
		attr_accessor :index_id_greater_than
		attr_accessor :depth_greater_than_equal

		def index_id_greater_than=(val)
			@index_id_greater_than = val.to_i
		end
		def depth_greater_than_equal=(val)
			@depth_greater_than_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['indexIdGreaterThan'] != nil
				self.index_id_greater_than = xml_element.elements['indexIdGreaterThan'].text
			end
			if xml_element.elements['depthGreaterThanEqual'] != nil
				self.depth_greater_than_equal = xml_element.elements['depthGreaterThanEqual'].text
			end
		end

	end

	class KalturaIndexJobData < KalturaJobData
		# The filter should return the list of objects that need to be reindexed.
		attr_accessor :filter
		# Indicates the last id that reindexed, used when the batch crached, to re-run from the last crash point.
		attr_accessor :last_index_id
		# Indicates the last depth that reindexed, used when the batch crached, to re-run from the last crash point.
		attr_accessor :last_index_depth
		# Indicates that the object columns and attributes values should be recalculated before reindexed.
		attr_accessor :should_update

		def last_index_id=(val)
			@last_index_id = val.to_i
		end
		def last_index_depth=(val)
			@last_index_depth = val.to_i
		end
		def should_update=(val)
			@should_update = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['filter'] != nil
				self.filter = KalturaClientBase.object_from_xml(xml_element.elements['filter'], 'KalturaFilter')
			end
			if xml_element.elements['lastIndexId'] != nil
				self.last_index_id = xml_element.elements['lastIndexId'].text
			end
			if xml_element.elements['lastIndexDepth'] != nil
				self.last_index_depth = xml_element.elements['lastIndexDepth'].text
			end
			if xml_element.elements['shouldUpdate'] != nil
				self.should_update = xml_element.elements['shouldUpdate'].text
			end
		end

	end

	class KalturaIpAddressRestriction < KalturaBaseRestriction
		# Ip address restriction type (Allow or deny)
		attr_accessor :ip_address_restriction_type
		# Comma separated list of ip address to allow to deny
		attr_accessor :ip_address_list

		def ip_address_restriction_type=(val)
			@ip_address_restriction_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['ipAddressRestrictionType'] != nil
				self.ip_address_restriction_type = xml_element.elements['ipAddressRestrictionType'].text
			end
			if xml_element.elements['ipAddressList'] != nil
				self.ip_address_list = xml_element.elements['ipAddressList'].text
			end
		end

	end

	class KalturaLimitFlavorsRestriction < KalturaBaseRestriction
		# Limit flavors restriction type (Allow or deny)
		attr_accessor :limit_flavors_restriction_type
		# Comma separated list of flavor params ids to allow to deny
		attr_accessor :flavor_params_ids

		def limit_flavors_restriction_type=(val)
			@limit_flavors_restriction_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['limitFlavorsRestrictionType'] != nil
				self.limit_flavors_restriction_type = xml_element.elements['limitFlavorsRestrictionType'].text
			end
			if xml_element.elements['flavorParamsIds'] != nil
				self.flavor_params_ids = xml_element.elements['flavorParamsIds'].text
			end
		end

	end

	class KalturaLiveChannelListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaLiveChannel')
			end
		end

	end

	class KalturaLiveChannelSegmentListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaLiveChannelSegment')
			end
		end

	end

	class KalturaLiveEntryServerNode < KalturaEntryServerNode
		# parameters of the stream we got
		attr_accessor :streams
		attr_accessor :recording_info
		attr_accessor :is_playable_user

		def is_playable_user=(val)
			@is_playable_user = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['streams'] != nil
				self.streams = KalturaClientBase.object_from_xml(xml_element.elements['streams'], 'KalturaLiveStreamParams')
			end
			if xml_element.elements['recordingInfo'] != nil
				self.recording_info = KalturaClientBase.object_from_xml(xml_element.elements['recordingInfo'], 'KalturaLiveEntryServerNodeRecordingInfo')
			end
			if xml_element.elements['isPlayableUser'] != nil
				self.is_playable_user = xml_element.elements['isPlayableUser'].text
			end
		end

	end

	class KalturaLiveReportExportJobData < KalturaJobData
		attr_accessor :time_reference
		attr_accessor :time_zone_offset
		attr_accessor :entry_ids
		attr_accessor :output_path
		attr_accessor :recipient_email

		def time_reference=(val)
			@time_reference = val.to_i
		end
		def time_zone_offset=(val)
			@time_zone_offset = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['timeReference'] != nil
				self.time_reference = xml_element.elements['timeReference'].text
			end
			if xml_element.elements['timeZoneOffset'] != nil
				self.time_zone_offset = xml_element.elements['timeZoneOffset'].text
			end
			if xml_element.elements['entryIds'] != nil
				self.entry_ids = xml_element.elements['entryIds'].text
			end
			if xml_element.elements['outputPath'] != nil
				self.output_path = xml_element.elements['outputPath'].text
			end
			if xml_element.elements['recipientEmail'] != nil
				self.recipient_email = xml_element.elements['recipientEmail'].text
			end
		end

	end

	class KalturaLiveStatsListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaLiveStats')
			end
		end

	end

	class KalturaLiveStreamListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaLiveStreamEntry')
			end
		end

	end

	# A representation of an RTMP live stream configuration
	class KalturaLiveStreamPushPublishRTMPConfiguration < KalturaLiveStreamPushPublishConfiguration
		attr_accessor :user_id
		attr_accessor :password
		attr_accessor :stream_name
		attr_accessor :application_name


		def from_xml(xml_element)
			super
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['password'] != nil
				self.password = xml_element.elements['password'].text
			end
			if xml_element.elements['streamName'] != nil
				self.stream_name = xml_element.elements['streamName'].text
			end
			if xml_element.elements['applicationName'] != nil
				self.application_name = xml_element.elements['applicationName'].text
			end
		end

	end

	class KalturaLiveToVodJobData < KalturaJobData
		# $vod Entry Id
		attr_accessor :vod_entry_id
		# live Entry Id
		attr_accessor :live_entry_id
		# total VOD Duration
		attr_accessor :total_vod_duration
		# last Segment Duration
		attr_accessor :last_segment_duration
		# amf Array File Path
		attr_accessor :amf_array
		# last live to vod sync time
		attr_accessor :last_cue_point_sync_time
		# last segment drift
		attr_accessor :last_segment_drift

		def total_vod_duration=(val)
			@total_vod_duration = val.to_f
		end
		def last_segment_duration=(val)
			@last_segment_duration = val.to_f
		end
		def last_cue_point_sync_time=(val)
			@last_cue_point_sync_time = val.to_i
		end
		def last_segment_drift=(val)
			@last_segment_drift = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['vodEntryId'] != nil
				self.vod_entry_id = xml_element.elements['vodEntryId'].text
			end
			if xml_element.elements['liveEntryId'] != nil
				self.live_entry_id = xml_element.elements['liveEntryId'].text
			end
			if xml_element.elements['totalVodDuration'] != nil
				self.total_vod_duration = xml_element.elements['totalVodDuration'].text
			end
			if xml_element.elements['lastSegmentDuration'] != nil
				self.last_segment_duration = xml_element.elements['lastSegmentDuration'].text
			end
			if xml_element.elements['amfArray'] != nil
				self.amf_array = xml_element.elements['amfArray'].text
			end
			if xml_element.elements['lastCuePointSyncTime'] != nil
				self.last_cue_point_sync_time = xml_element.elements['lastCuePointSyncTime'].text
			end
			if xml_element.elements['lastSegmentDrift'] != nil
				self.last_segment_drift = xml_element.elements['lastSegmentDrift'].text
			end
		end

	end

	class KalturaMailJobData < KalturaJobData
		attr_accessor :mail_type
		attr_accessor :mail_priority
		attr_accessor :status
		attr_accessor :recipient_name
		attr_accessor :recipient_email
		# kuserId
		attr_accessor :recipient_id
		attr_accessor :from_name
		attr_accessor :from_email
		attr_accessor :body_params
		attr_accessor :subject_params
		attr_accessor :template_path
		attr_accessor :language
		attr_accessor :campaign_id
		attr_accessor :min_send_date
		attr_accessor :is_html
		attr_accessor :separator

		def mail_priority=(val)
			@mail_priority = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def recipient_id=(val)
			@recipient_id = val.to_i
		end
		def campaign_id=(val)
			@campaign_id = val.to_i
		end
		def min_send_date=(val)
			@min_send_date = val.to_i
		end
		def is_html=(val)
			@is_html = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['mailType'] != nil
				self.mail_type = xml_element.elements['mailType'].text
			end
			if xml_element.elements['mailPriority'] != nil
				self.mail_priority = xml_element.elements['mailPriority'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['recipientName'] != nil
				self.recipient_name = xml_element.elements['recipientName'].text
			end
			if xml_element.elements['recipientEmail'] != nil
				self.recipient_email = xml_element.elements['recipientEmail'].text
			end
			if xml_element.elements['recipientId'] != nil
				self.recipient_id = xml_element.elements['recipientId'].text
			end
			if xml_element.elements['fromName'] != nil
				self.from_name = xml_element.elements['fromName'].text
			end
			if xml_element.elements['fromEmail'] != nil
				self.from_email = xml_element.elements['fromEmail'].text
			end
			if xml_element.elements['bodyParams'] != nil
				self.body_params = xml_element.elements['bodyParams'].text
			end
			if xml_element.elements['subjectParams'] != nil
				self.subject_params = xml_element.elements['subjectParams'].text
			end
			if xml_element.elements['templatePath'] != nil
				self.template_path = xml_element.elements['templatePath'].text
			end
			if xml_element.elements['language'] != nil
				self.language = xml_element.elements['language'].text
			end
			if xml_element.elements['campaignId'] != nil
				self.campaign_id = xml_element.elements['campaignId'].text
			end
			if xml_element.elements['minSendDate'] != nil
				self.min_send_date = xml_element.elements['minSendDate'].text
			end
			if xml_element.elements['isHtml'] != nil
				self.is_html = xml_element.elements['isHtml'].text
			end
			if xml_element.elements['separator'] != nil
				self.separator = xml_element.elements['separator'].text
			end
		end

	end

	class KalturaMatchCondition < KalturaCondition
		attr_accessor :values
		attr_accessor :match_type


		def from_xml(xml_element)
			super
			if xml_element.elements['values'] != nil
				self.values = KalturaClientBase.object_from_xml(xml_element.elements['values'], 'KalturaStringValue')
			end
			if xml_element.elements['matchType'] != nil
				self.match_type = xml_element.elements['matchType'].text
			end
		end

	end

	class KalturaMediaInfoBaseFilter < KalturaFilter
		attr_accessor :flavor_asset_id_equal


		def from_xml(xml_element)
			super
			if xml_element.elements['flavorAssetIdEqual'] != nil
				self.flavor_asset_id_equal = xml_element.elements['flavorAssetIdEqual'].text
			end
		end

	end

	class KalturaMediaListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaMediaEntry')
			end
		end

	end

	class KalturaMixListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaMixEntry')
			end
		end

	end

	class KalturaModerationFlagListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaModerationFlag')
			end
		end

	end

	class KalturaMoveCategoryEntriesJobData < KalturaJobData
		# Source category id
		attr_accessor :src_category_id
		# Destination category id
		attr_accessor :dest_category_id
		# Saves the last category id that its entries moved completely
		#      In case of crash the batch will restart from that point
		attr_accessor :last_moved_category_id
		# Saves the last page index of the child categories filter pager
		#      In case of crash the batch will restart from that point
		attr_accessor :last_moved_category_page_index
		# Saves the last page index of the category entries filter pager
		#      In case of crash the batch will restart from that point
		attr_accessor :last_moved_category_entry_page_index
		# All entries from all child categories will be moved as well
		attr_accessor :move_from_children
		# Destination categories fallback ids
		attr_accessor :dest_category_full_ids

		def src_category_id=(val)
			@src_category_id = val.to_i
		end
		def dest_category_id=(val)
			@dest_category_id = val.to_i
		end
		def last_moved_category_id=(val)
			@last_moved_category_id = val.to_i
		end
		def last_moved_category_page_index=(val)
			@last_moved_category_page_index = val.to_i
		end
		def last_moved_category_entry_page_index=(val)
			@last_moved_category_entry_page_index = val.to_i
		end
		def move_from_children=(val)
			@move_from_children = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['srcCategoryId'] != nil
				self.src_category_id = xml_element.elements['srcCategoryId'].text
			end
			if xml_element.elements['destCategoryId'] != nil
				self.dest_category_id = xml_element.elements['destCategoryId'].text
			end
			if xml_element.elements['lastMovedCategoryId'] != nil
				self.last_moved_category_id = xml_element.elements['lastMovedCategoryId'].text
			end
			if xml_element.elements['lastMovedCategoryPageIndex'] != nil
				self.last_moved_category_page_index = xml_element.elements['lastMovedCategoryPageIndex'].text
			end
			if xml_element.elements['lastMovedCategoryEntryPageIndex'] != nil
				self.last_moved_category_entry_page_index = xml_element.elements['lastMovedCategoryEntryPageIndex'].text
			end
			if xml_element.elements['moveFromChildren'] != nil
				self.move_from_children = xml_element.elements['moveFromChildren'].text
			end
			if xml_element.elements['destCategoryFullIds'] != nil
				self.dest_category_full_ids = xml_element.elements['destCategoryFullIds'].text
			end
		end

	end

	class KalturaNotificationJobData < KalturaJobData
		attr_accessor :user_id
		attr_accessor :type
		attr_accessor :type_as_string
		attr_accessor :object_id
		attr_accessor :status
		attr_accessor :data
		attr_accessor :number_of_attempts
		attr_accessor :notification_result
		attr_accessor :obj_type

		def type=(val)
			@type = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def number_of_attempts=(val)
			@number_of_attempts = val.to_i
		end
		def obj_type=(val)
			@obj_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['typeAsString'] != nil
				self.type_as_string = xml_element.elements['typeAsString'].text
			end
			if xml_element.elements['objectId'] != nil
				self.object_id = xml_element.elements['objectId'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['data'] != nil
				self.data = xml_element.elements['data'].text
			end
			if xml_element.elements['numberOfAttempts'] != nil
				self.number_of_attempts = xml_element.elements['numberOfAttempts'].text
			end
			if xml_element.elements['notificationResult'] != nil
				self.notification_result = xml_element.elements['notificationResult'].text
			end
			if xml_element.elements['objType'] != nil
				self.obj_type = xml_element.elements['objType'].text
			end
		end

	end

	class KalturaObjectListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaObject')
			end
		end

	end

	class KalturaOrCondition < KalturaCondition
		attr_accessor :conditions


		def from_xml(xml_element)
			super
			if xml_element.elements['conditions'] != nil
				self.conditions = KalturaClientBase.object_from_xml(xml_element.elements['conditions'], 'KalturaCondition')
			end
		end

	end

	class KalturaPartnerBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :id_not_in
		attr_accessor :name_like
		attr_accessor :name_multi_like_or
		attr_accessor :name_multi_like_and
		attr_accessor :name_equal
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :partner_package_equal
		attr_accessor :partner_package_greater_than_or_equal
		attr_accessor :partner_package_less_than_or_equal
		attr_accessor :partner_package_in
		attr_accessor :partner_group_type_equal
		attr_accessor :partner_name_description_website_admin_name_admin_email_like

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end
		def partner_package_equal=(val)
			@partner_package_equal = val.to_i
		end
		def partner_package_greater_than_or_equal=(val)
			@partner_package_greater_than_or_equal = val.to_i
		end
		def partner_package_less_than_or_equal=(val)
			@partner_package_less_than_or_equal = val.to_i
		end
		def partner_group_type_equal=(val)
			@partner_group_type_equal = val.to_i
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
			if xml_element.elements['nameLike'] != nil
				self.name_like = xml_element.elements['nameLike'].text
			end
			if xml_element.elements['nameMultiLikeOr'] != nil
				self.name_multi_like_or = xml_element.elements['nameMultiLikeOr'].text
			end
			if xml_element.elements['nameMultiLikeAnd'] != nil
				self.name_multi_like_and = xml_element.elements['nameMultiLikeAnd'].text
			end
			if xml_element.elements['nameEqual'] != nil
				self.name_equal = xml_element.elements['nameEqual'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['partnerPackageEqual'] != nil
				self.partner_package_equal = xml_element.elements['partnerPackageEqual'].text
			end
			if xml_element.elements['partnerPackageGreaterThanOrEqual'] != nil
				self.partner_package_greater_than_or_equal = xml_element.elements['partnerPackageGreaterThanOrEqual'].text
			end
			if xml_element.elements['partnerPackageLessThanOrEqual'] != nil
				self.partner_package_less_than_or_equal = xml_element.elements['partnerPackageLessThanOrEqual'].text
			end
			if xml_element.elements['partnerPackageIn'] != nil
				self.partner_package_in = xml_element.elements['partnerPackageIn'].text
			end
			if xml_element.elements['partnerGroupTypeEqual'] != nil
				self.partner_group_type_equal = xml_element.elements['partnerGroupTypeEqual'].text
			end
			if xml_element.elements['partnerNameDescriptionWebsiteAdminNameAdminEmailLike'] != nil
				self.partner_name_description_website_admin_name_admin_email_like = xml_element.elements['partnerNameDescriptionWebsiteAdminNameAdminEmailLike'].text
			end
		end

	end

	class KalturaPartnerListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaPartner')
			end
		end

	end

	class KalturaPermissionItemListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaPermissionItem')
			end
		end

	end

	class KalturaPermissionListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaPermission')
			end
		end

	end

	class KalturaPlaylistListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaPlaylist')
			end
		end

	end

	class KalturaProvisionJobData < KalturaJobData
		attr_accessor :stream_id
		attr_accessor :backup_stream_id
		attr_accessor :rtmp
		attr_accessor :encoder_ip
		attr_accessor :backup_encoder_ip
		attr_accessor :encoder_password
		attr_accessor :encoder_username
		attr_accessor :end_date
		attr_accessor :return_val
		attr_accessor :media_type
		attr_accessor :primary_broadcasting_url
		attr_accessor :secondary_broadcasting_url
		attr_accessor :stream_name

		def end_date=(val)
			@end_date = val.to_i
		end
		def media_type=(val)
			@media_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['streamID'] != nil
				self.stream_id = xml_element.elements['streamID'].text
			end
			if xml_element.elements['backupStreamID'] != nil
				self.backup_stream_id = xml_element.elements['backupStreamID'].text
			end
			if xml_element.elements['rtmp'] != nil
				self.rtmp = xml_element.elements['rtmp'].text
			end
			if xml_element.elements['encoderIP'] != nil
				self.encoder_ip = xml_element.elements['encoderIP'].text
			end
			if xml_element.elements['backupEncoderIP'] != nil
				self.backup_encoder_ip = xml_element.elements['backupEncoderIP'].text
			end
			if xml_element.elements['encoderPassword'] != nil
				self.encoder_password = xml_element.elements['encoderPassword'].text
			end
			if xml_element.elements['encoderUsername'] != nil
				self.encoder_username = xml_element.elements['encoderUsername'].text
			end
			if xml_element.elements['endDate'] != nil
				self.end_date = xml_element.elements['endDate'].text
			end
			if xml_element.elements['returnVal'] != nil
				self.return_val = xml_element.elements['returnVal'].text
			end
			if xml_element.elements['mediaType'] != nil
				self.media_type = xml_element.elements['mediaType'].text
			end
			if xml_element.elements['primaryBroadcastingUrl'] != nil
				self.primary_broadcasting_url = xml_element.elements['primaryBroadcastingUrl'].text
			end
			if xml_element.elements['secondaryBroadcastingUrl'] != nil
				self.secondary_broadcasting_url = xml_element.elements['secondaryBroadcastingUrl'].text
			end
			if xml_element.elements['streamName'] != nil
				self.stream_name = xml_element.elements['streamName'].text
			end
		end

	end

	class KalturaQuizUserEntry < KalturaUserEntry
		attr_accessor :score
		attr_accessor :calculated_score
		attr_accessor :feedback
		attr_accessor :version

		def score=(val)
			@score = val.to_f
		end
		def calculated_score=(val)
			@calculated_score = val.to_f
		end
		def version=(val)
			@version = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['score'] != nil
				self.score = xml_element.elements['score'].text
			end
			if xml_element.elements['calculatedScore'] != nil
				self.calculated_score = xml_element.elements['calculatedScore'].text
			end
			if xml_element.elements['feedback'] != nil
				self.feedback = xml_element.elements['feedback'].text
			end
			if xml_element.elements['version'] != nil
				self.version = xml_element.elements['version'].text
			end
		end

	end

	class KalturaRecalculateCacheJobData < KalturaJobData


		def from_xml(xml_element)
			super
		end

	end

	class KalturaRemotePathListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaRemotePath')
			end
		end

	end

	class KalturaReportBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :system_name_equal
		attr_accessor :system_name_in

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
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
		end

	end

	class KalturaReportInputFilter < KalturaReportInputBaseFilter
		# Search keywords to filter objects
		attr_accessor :keywords
		# Search keywords in objects tags
		attr_accessor :search_in_tags
		# Search keywords in objects admin tags
		attr_accessor :search_in_admin_tags
		# Search objects in specified categories
		attr_accessor :categories
		# Search objects in specified category ids
		attr_accessor :categories_ids_in
		# Filter by customVar1
		attr_accessor :custom_var1in
		# Filter by customVar2
		attr_accessor :custom_var2in
		# Filter by customVar3
		attr_accessor :custom_var3in
		# Filter by device
		attr_accessor :device_in
		# Filter by country
		attr_accessor :country_in
		# Filter by region
		attr_accessor :region_in
		# Filter by city
		attr_accessor :cities_in
		# Filter by operating system family
		attr_accessor :operating_system_family_in
		# Filter by browser family
		attr_accessor :browser_family_in
		# Time zone offset in minutes
		attr_accessor :time_zone_offset
		# Aggregated results according to interval
		attr_accessor :interval
		# Filter by media types
		attr_accessor :media_type_in
		# Filter by source types
		attr_accessor :source_type_in
		# Filter by entry owner
		attr_accessor :owner_ids_in
		attr_accessor :entry_operator
		# Entry created at greater than or equal as Unix timestamp
		attr_accessor :entry_created_at_greater_than_or_equal
		# Entry created at less than or equal as Unix timestamp
		attr_accessor :entry_created_at_less_than_or_equal
		attr_accessor :entry_id_in

		def search_in_tags=(val)
			@search_in_tags = to_b(val)
		end
		def search_in_admin_tags=(val)
			@search_in_admin_tags = to_b(val)
		end
		def time_zone_offset=(val)
			@time_zone_offset = val.to_i
		end
		def entry_created_at_greater_than_or_equal=(val)
			@entry_created_at_greater_than_or_equal = val.to_i
		end
		def entry_created_at_less_than_or_equal=(val)
			@entry_created_at_less_than_or_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['keywords'] != nil
				self.keywords = xml_element.elements['keywords'].text
			end
			if xml_element.elements['searchInTags'] != nil
				self.search_in_tags = xml_element.elements['searchInTags'].text
			end
			if xml_element.elements['searchInAdminTags'] != nil
				self.search_in_admin_tags = xml_element.elements['searchInAdminTags'].text
			end
			if xml_element.elements['categories'] != nil
				self.categories = xml_element.elements['categories'].text
			end
			if xml_element.elements['categoriesIdsIn'] != nil
				self.categories_ids_in = xml_element.elements['categoriesIdsIn'].text
			end
			if xml_element.elements['customVar1In'] != nil
				self.custom_var1in = xml_element.elements['customVar1In'].text
			end
			if xml_element.elements['customVar2In'] != nil
				self.custom_var2in = xml_element.elements['customVar2In'].text
			end
			if xml_element.elements['customVar3In'] != nil
				self.custom_var3in = xml_element.elements['customVar3In'].text
			end
			if xml_element.elements['deviceIn'] != nil
				self.device_in = xml_element.elements['deviceIn'].text
			end
			if xml_element.elements['countryIn'] != nil
				self.country_in = xml_element.elements['countryIn'].text
			end
			if xml_element.elements['regionIn'] != nil
				self.region_in = xml_element.elements['regionIn'].text
			end
			if xml_element.elements['citiesIn'] != nil
				self.cities_in = xml_element.elements['citiesIn'].text
			end
			if xml_element.elements['operatingSystemFamilyIn'] != nil
				self.operating_system_family_in = xml_element.elements['operatingSystemFamilyIn'].text
			end
			if xml_element.elements['browserFamilyIn'] != nil
				self.browser_family_in = xml_element.elements['browserFamilyIn'].text
			end
			if xml_element.elements['timeZoneOffset'] != nil
				self.time_zone_offset = xml_element.elements['timeZoneOffset'].text
			end
			if xml_element.elements['interval'] != nil
				self.interval = xml_element.elements['interval'].text
			end
			if xml_element.elements['mediaTypeIn'] != nil
				self.media_type_in = xml_element.elements['mediaTypeIn'].text
			end
			if xml_element.elements['sourceTypeIn'] != nil
				self.source_type_in = xml_element.elements['sourceTypeIn'].text
			end
			if xml_element.elements['ownerIdsIn'] != nil
				self.owner_ids_in = xml_element.elements['ownerIdsIn'].text
			end
			if xml_element.elements['entryOperator'] != nil
				self.entry_operator = KalturaClientBase.object_from_xml(xml_element.elements['entryOperator'], 'KalturaESearchEntryOperator')
			end
			if xml_element.elements['entryCreatedAtGreaterThanOrEqual'] != nil
				self.entry_created_at_greater_than_or_equal = xml_element.elements['entryCreatedAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['entryCreatedAtLessThanOrEqual'] != nil
				self.entry_created_at_less_than_or_equal = xml_element.elements['entryCreatedAtLessThanOrEqual'].text
			end
			if xml_element.elements['entryIdIn'] != nil
				self.entry_id_in = xml_element.elements['entryIdIn'].text
			end
		end

	end

	class KalturaReportListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaReport')
			end
		end

	end

	class KalturaResponseProfileBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :system_name_equal
		attr_accessor :system_name_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :status_equal
		attr_accessor :status_in

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
		def status_equal=(val)
			@status_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['systemNameEqual'] != nil
				self.system_name_equal = xml_element.elements['systemNameEqual'].text
			end
			if xml_element.elements['systemNameIn'] != nil
				self.system_name_in = xml_element.elements['systemNameIn'].text
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
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
		end

	end

	class KalturaResponseProfileHolder < KalturaBaseResponseProfile
		# Auto generated numeric identifier
		attr_accessor :id
		# Unique system name
		attr_accessor :system_name

		def id=(val)
			@id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['systemName'] != nil
				self.system_name = xml_element.elements['systemName'].text
			end
		end

	end

	class KalturaResponseProfileListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaResponseProfile')
			end
		end

	end

	class KalturaSchedulerListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaScheduler')
			end
		end

	end

	class KalturaSchedulerWorkerListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaSchedulerWorker')
			end
		end

	end

	class KalturaSearchCondition < KalturaSearchItem
		attr_accessor :field
		attr_accessor :value


		def from_xml(xml_element)
			super
			if xml_element.elements['field'] != nil
				self.field = xml_element.elements['field'].text
			end
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	class KalturaSearchOperator < KalturaSearchItem
		attr_accessor :type
		attr_accessor :items

		def type=(val)
			@type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['items'] != nil
				self.items = KalturaClientBase.object_from_xml(xml_element.elements['items'], 'KalturaSearchItem')
			end
		end

	end

	class KalturaServerNodeBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :heartbeat_time_greater_than_or_equal
		attr_accessor :heartbeat_time_less_than_or_equal
		attr_accessor :name_equal
		attr_accessor :name_in
		attr_accessor :system_name_equal
		attr_accessor :system_name_in
		attr_accessor :host_name_like
		attr_accessor :host_name_multi_like_or
		attr_accessor :host_name_multi_like_and
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :type_equal
		attr_accessor :type_in
		attr_accessor :tags_like
		attr_accessor :tags_multi_like_or
		attr_accessor :tags_multi_like_and
		attr_accessor :dc_equal
		attr_accessor :dc_in
		attr_accessor :parent_id_like
		attr_accessor :parent_id_multi_like_or
		attr_accessor :parent_id_multi_like_and
		attr_accessor :environment_equal
		attr_accessor :environment_in

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
		def heartbeat_time_greater_than_or_equal=(val)
			@heartbeat_time_greater_than_or_equal = val.to_i
		end
		def heartbeat_time_less_than_or_equal=(val)
			@heartbeat_time_less_than_or_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end
		def dc_equal=(val)
			@dc_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
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
			if xml_element.elements['heartbeatTimeGreaterThanOrEqual'] != nil
				self.heartbeat_time_greater_than_or_equal = xml_element.elements['heartbeatTimeGreaterThanOrEqual'].text
			end
			if xml_element.elements['heartbeatTimeLessThanOrEqual'] != nil
				self.heartbeat_time_less_than_or_equal = xml_element.elements['heartbeatTimeLessThanOrEqual'].text
			end
			if xml_element.elements['nameEqual'] != nil
				self.name_equal = xml_element.elements['nameEqual'].text
			end
			if xml_element.elements['nameIn'] != nil
				self.name_in = xml_element.elements['nameIn'].text
			end
			if xml_element.elements['systemNameEqual'] != nil
				self.system_name_equal = xml_element.elements['systemNameEqual'].text
			end
			if xml_element.elements['systemNameIn'] != nil
				self.system_name_in = xml_element.elements['systemNameIn'].text
			end
			if xml_element.elements['hostNameLike'] != nil
				self.host_name_like = xml_element.elements['hostNameLike'].text
			end
			if xml_element.elements['hostNameMultiLikeOr'] != nil
				self.host_name_multi_like_or = xml_element.elements['hostNameMultiLikeOr'].text
			end
			if xml_element.elements['hostNameMultiLikeAnd'] != nil
				self.host_name_multi_like_and = xml_element.elements['hostNameMultiLikeAnd'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['typeEqual'] != nil
				self.type_equal = xml_element.elements['typeEqual'].text
			end
			if xml_element.elements['typeIn'] != nil
				self.type_in = xml_element.elements['typeIn'].text
			end
			if xml_element.elements['tagsLike'] != nil
				self.tags_like = xml_element.elements['tagsLike'].text
			end
			if xml_element.elements['tagsMultiLikeOr'] != nil
				self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			end
			if xml_element.elements['tagsMultiLikeAnd'] != nil
				self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
			end
			if xml_element.elements['dcEqual'] != nil
				self.dc_equal = xml_element.elements['dcEqual'].text
			end
			if xml_element.elements['dcIn'] != nil
				self.dc_in = xml_element.elements['dcIn'].text
			end
			if xml_element.elements['parentIdLike'] != nil
				self.parent_id_like = xml_element.elements['parentIdLike'].text
			end
			if xml_element.elements['parentIdMultiLikeOr'] != nil
				self.parent_id_multi_like_or = xml_element.elements['parentIdMultiLikeOr'].text
			end
			if xml_element.elements['parentIdMultiLikeAnd'] != nil
				self.parent_id_multi_like_and = xml_element.elements['parentIdMultiLikeAnd'].text
			end
			if xml_element.elements['environmentEqual'] != nil
				self.environment_equal = xml_element.elements['environmentEqual'].text
			end
			if xml_element.elements['environmentIn'] != nil
				self.environment_in = xml_element.elements['environmentIn'].text
			end
		end

	end

	class KalturaServerNodeListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaServerNode')
			end
		end

	end

	class KalturaSessionResponse < KalturaStartWidgetSessionResponse


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSessionRestriction < KalturaBaseRestriction


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSiteRestriction < KalturaBaseRestriction
		# The site restriction type (allow or deny)
		attr_accessor :site_restriction_type
		# Comma separated list of sites (domains) to allow or deny
		attr_accessor :site_list

		def site_restriction_type=(val)
			@site_restriction_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['siteRestrictionType'] != nil
				self.site_restriction_type = xml_element.elements['siteRestrictionType'].text
			end
			if xml_element.elements['siteList'] != nil
				self.site_list = xml_element.elements['siteList'].text
			end
		end

	end

	class KalturaStorageAddAction < KalturaRuleAction


		def from_xml(xml_element)
			super
		end

	end

	class KalturaStorageJobData < KalturaJobData
		attr_accessor :server_url
		attr_accessor :server_username
		attr_accessor :server_password
		attr_accessor :server_private_key
		attr_accessor :server_public_key
		attr_accessor :server_pass_phrase
		attr_accessor :ftp_passive_mode
		attr_accessor :src_file_sync_local_path
		attr_accessor :src_file_encryption_key
		attr_accessor :src_file_sync_id
		attr_accessor :dest_file_sync_stored_path

		def ftp_passive_mode=(val)
			@ftp_passive_mode = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['serverUrl'] != nil
				self.server_url = xml_element.elements['serverUrl'].text
			end
			if xml_element.elements['serverUsername'] != nil
				self.server_username = xml_element.elements['serverUsername'].text
			end
			if xml_element.elements['serverPassword'] != nil
				self.server_password = xml_element.elements['serverPassword'].text
			end
			if xml_element.elements['serverPrivateKey'] != nil
				self.server_private_key = xml_element.elements['serverPrivateKey'].text
			end
			if xml_element.elements['serverPublicKey'] != nil
				self.server_public_key = xml_element.elements['serverPublicKey'].text
			end
			if xml_element.elements['serverPassPhrase'] != nil
				self.server_pass_phrase = xml_element.elements['serverPassPhrase'].text
			end
			if xml_element.elements['ftpPassiveMode'] != nil
				self.ftp_passive_mode = xml_element.elements['ftpPassiveMode'].text
			end
			if xml_element.elements['srcFileSyncLocalPath'] != nil
				self.src_file_sync_local_path = xml_element.elements['srcFileSyncLocalPath'].text
			end
			if xml_element.elements['srcFileEncryptionKey'] != nil
				self.src_file_encryption_key = xml_element.elements['srcFileEncryptionKey'].text
			end
			if xml_element.elements['srcFileSyncId'] != nil
				self.src_file_sync_id = xml_element.elements['srcFileSyncId'].text
			end
			if xml_element.elements['destFileSyncStoredPath'] != nil
				self.dest_file_sync_stored_path = xml_element.elements['destFileSyncStoredPath'].text
			end
		end

	end

	class KalturaStorageProfileBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :system_name_equal
		attr_accessor :system_name_in
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :protocol_equal
		attr_accessor :protocol_in

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
		def status_equal=(val)
			@status_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
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
			if xml_element.elements['protocolEqual'] != nil
				self.protocol_equal = xml_element.elements['protocolEqual'].text
			end
			if xml_element.elements['protocolIn'] != nil
				self.protocol_in = xml_element.elements['protocolIn'].text
			end
		end

	end

	class KalturaStorageProfileListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaStorageProfile')
			end
		end

	end

	class KalturaSyncCategoryPrivacyContextJobData < KalturaJobData
		# category id
		attr_accessor :category_id
		# Saves the last category entry creation date that was updated
		#      In case of crash the batch will restart from that point
		attr_accessor :last_updated_category_entry_created_at
		# Saves the last sub category creation date that was updated
		#      In case of crash the batch will restart from that point
		attr_accessor :last_updated_category_created_at

		def category_id=(val)
			@category_id = val.to_i
		end
		def last_updated_category_entry_created_at=(val)
			@last_updated_category_entry_created_at = val.to_i
		end
		def last_updated_category_created_at=(val)
			@last_updated_category_created_at = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['categoryId'] != nil
				self.category_id = xml_element.elements['categoryId'].text
			end
			if xml_element.elements['lastUpdatedCategoryEntryCreatedAt'] != nil
				self.last_updated_category_entry_created_at = xml_element.elements['lastUpdatedCategoryEntryCreatedAt'].text
			end
			if xml_element.elements['lastUpdatedCategoryCreatedAt'] != nil
				self.last_updated_category_created_at = xml_element.elements['lastUpdatedCategoryCreatedAt'].text
			end
		end

	end

	class KalturaTaskEntryServerNode < KalturaEntryServerNode


		def from_xml(xml_element)
			super
		end

	end

	class KalturaThumbAssetListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaThumbAsset')
			end
		end

	end

	class KalturaThumbParamsListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaThumbParams')
			end
		end

	end

	class KalturaThumbnailServeOptions < KalturaAssetServeOptions


		def from_xml(xml_element)
			super
		end

	end

	class KalturaTubeMogulSyndicationFeed < KalturaBaseSyndicationFeed
		attr_accessor :category


		def from_xml(xml_element)
			super
			if xml_element.elements['category'] != nil
				self.category = xml_element.elements['category'].text
			end
		end

	end

	class KalturaUiConfBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :name_like
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :obj_type_equal
		attr_accessor :obj_type_in
		attr_accessor :tags_multi_like_or
		attr_accessor :tags_multi_like_and
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :creation_mode_equal
		attr_accessor :creation_mode_in
		attr_accessor :version_equal
		attr_accessor :version_multi_like_or
		attr_accessor :version_multi_like_and
		attr_accessor :partner_tags_multi_like_or
		attr_accessor :partner_tags_multi_like_and

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
		end
		def obj_type_equal=(val)
			@obj_type_equal = val.to_i
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
		def creation_mode_equal=(val)
			@creation_mode_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['nameLike'] != nil
				self.name_like = xml_element.elements['nameLike'].text
			end
			if xml_element.elements['partnerIdEqual'] != nil
				self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			end
			if xml_element.elements['partnerIdIn'] != nil
				self.partner_id_in = xml_element.elements['partnerIdIn'].text
			end
			if xml_element.elements['objTypeEqual'] != nil
				self.obj_type_equal = xml_element.elements['objTypeEqual'].text
			end
			if xml_element.elements['objTypeIn'] != nil
				self.obj_type_in = xml_element.elements['objTypeIn'].text
			end
			if xml_element.elements['tagsMultiLikeOr'] != nil
				self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			end
			if xml_element.elements['tagsMultiLikeAnd'] != nil
				self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
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
			if xml_element.elements['creationModeEqual'] != nil
				self.creation_mode_equal = xml_element.elements['creationModeEqual'].text
			end
			if xml_element.elements['creationModeIn'] != nil
				self.creation_mode_in = xml_element.elements['creationModeIn'].text
			end
			if xml_element.elements['versionEqual'] != nil
				self.version_equal = xml_element.elements['versionEqual'].text
			end
			if xml_element.elements['versionMultiLikeOr'] != nil
				self.version_multi_like_or = xml_element.elements['versionMultiLikeOr'].text
			end
			if xml_element.elements['versionMultiLikeAnd'] != nil
				self.version_multi_like_and = xml_element.elements['versionMultiLikeAnd'].text
			end
			if xml_element.elements['partnerTagsMultiLikeOr'] != nil
				self.partner_tags_multi_like_or = xml_element.elements['partnerTagsMultiLikeOr'].text
			end
			if xml_element.elements['partnerTagsMultiLikeAnd'] != nil
				self.partner_tags_multi_like_and = xml_element.elements['partnerTagsMultiLikeAnd'].text
			end
		end

	end

	class KalturaUiConfListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaUiConf')
			end
		end

	end

	class KalturaUploadTokenBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :user_id_equal
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :file_name_equal
		attr_accessor :file_size_equal

		def status_equal=(val)
			@status_equal = val.to_i
		end
		def file_size_equal=(val)
			@file_size_equal = val.to_f
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['userIdEqual'] != nil
				self.user_id_equal = xml_element.elements['userIdEqual'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['fileNameEqual'] != nil
				self.file_name_equal = xml_element.elements['fileNameEqual'].text
			end
			if xml_element.elements['fileSizeEqual'] != nil
				self.file_size_equal = xml_element.elements['fileSizeEqual'].text
			end
		end

	end

	class KalturaUploadTokenListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaUploadToken')
			end
		end

	end

	class KalturaUrlRecognizerAkamaiG2O < KalturaUrlRecognizer
		# headerData
		attr_accessor :header_data
		# headerSign
		attr_accessor :header_sign
		# timeout
		attr_accessor :timeout
		# salt
		attr_accessor :salt

		def timeout=(val)
			@timeout = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['headerData'] != nil
				self.header_data = xml_element.elements['headerData'].text
			end
			if xml_element.elements['headerSign'] != nil
				self.header_sign = xml_element.elements['headerSign'].text
			end
			if xml_element.elements['timeout'] != nil
				self.timeout = xml_element.elements['timeout'].text
			end
			if xml_element.elements['salt'] != nil
				self.salt = xml_element.elements['salt'].text
			end
		end

	end

	class KalturaUrlTokenizerAkamaiHttp < KalturaUrlTokenizer
		# param
		attr_accessor :param_name
		attr_accessor :root_dir


		def from_xml(xml_element)
			super
			if xml_element.elements['paramName'] != nil
				self.param_name = xml_element.elements['paramName'].text
			end
			if xml_element.elements['rootDir'] != nil
				self.root_dir = xml_element.elements['rootDir'].text
			end
		end

	end

	class KalturaUrlTokenizerAkamaiRtmp < KalturaUrlTokenizer
		# profile
		attr_accessor :profile
		# Type
		attr_accessor :type
		attr_accessor :aifp
		attr_accessor :use_prefix

		def use_prefix=(val)
			@use_prefix = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['profile'] != nil
				self.profile = xml_element.elements['profile'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['aifp'] != nil
				self.aifp = xml_element.elements['aifp'].text
			end
			if xml_element.elements['usePrefix'] != nil
				self.use_prefix = xml_element.elements['usePrefix'].text
			end
		end

	end

	class KalturaUrlTokenizerAkamaiRtsp < KalturaUrlTokenizer
		# host
		attr_accessor :host
		# Cp-Code
		attr_accessor :cpcode

		def cpcode=(val)
			@cpcode = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['host'] != nil
				self.host = xml_element.elements['host'].text
			end
			if xml_element.elements['cpcode'] != nil
				self.cpcode = xml_element.elements['cpcode'].text
			end
		end

	end

	class KalturaUrlTokenizerAkamaiSecureHd < KalturaUrlTokenizer
		attr_accessor :param_name
		attr_accessor :acl_postfix
		attr_accessor :custom_postfixes
		attr_accessor :use_cookie_hosts
		attr_accessor :root_dir


		def from_xml(xml_element)
			super
			if xml_element.elements['paramName'] != nil
				self.param_name = xml_element.elements['paramName'].text
			end
			if xml_element.elements['aclPostfix'] != nil
				self.acl_postfix = xml_element.elements['aclPostfix'].text
			end
			if xml_element.elements['customPostfixes'] != nil
				self.custom_postfixes = xml_element.elements['customPostfixes'].text
			end
			if xml_element.elements['useCookieHosts'] != nil
				self.use_cookie_hosts = xml_element.elements['useCookieHosts'].text
			end
			if xml_element.elements['rootDir'] != nil
				self.root_dir = xml_element.elements['rootDir'].text
			end
		end

	end

	class KalturaUrlTokenizerBitGravity < KalturaUrlTokenizer
		# hashPatternRegex
		attr_accessor :hash_pattern_regex


		def from_xml(xml_element)
			super
			if xml_element.elements['hashPatternRegex'] != nil
				self.hash_pattern_regex = xml_element.elements['hashPatternRegex'].text
			end
		end

	end

	class KalturaUrlTokenizerChinaCache < KalturaUrlTokenizer
		attr_accessor :algorithm_id
		attr_accessor :key_id

		def algorithm_id=(val)
			@algorithm_id = val.to_i
		end
		def key_id=(val)
			@key_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['algorithmId'] != nil
				self.algorithm_id = xml_element.elements['algorithmId'].text
			end
			if xml_element.elements['keyId'] != nil
				self.key_id = xml_element.elements['keyId'].text
			end
		end

	end

	class KalturaUrlTokenizerCht < KalturaUrlTokenizer


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUrlTokenizerCloudFront < KalturaUrlTokenizer
		attr_accessor :key_pair_id
		attr_accessor :root_dir


		def from_xml(xml_element)
			super
			if xml_element.elements['keyPairId'] != nil
				self.key_pair_id = xml_element.elements['keyPairId'].text
			end
			if xml_element.elements['rootDir'] != nil
				self.root_dir = xml_element.elements['rootDir'].text
			end
		end

	end

	class KalturaUrlTokenizerKs < KalturaUrlTokenizer
		attr_accessor :use_path
		attr_accessor :additional_uris

		def use_path=(val)
			@use_path = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['usePath'] != nil
				self.use_path = xml_element.elements['usePath'].text
			end
			if xml_element.elements['additionalUris'] != nil
				self.additional_uris = xml_element.elements['additionalUris'].text
			end
		end

	end

	class KalturaUrlTokenizerLevel3 < KalturaUrlTokenizer
		# paramName
		attr_accessor :param_name
		# expiryName
		attr_accessor :expiry_name
		# gen
		attr_accessor :gen


		def from_xml(xml_element)
			super
			if xml_element.elements['paramName'] != nil
				self.param_name = xml_element.elements['paramName'].text
			end
			if xml_element.elements['expiryName'] != nil
				self.expiry_name = xml_element.elements['expiryName'].text
			end
			if xml_element.elements['gen'] != nil
				self.gen = xml_element.elements['gen'].text
			end
		end

	end

	class KalturaUrlTokenizerLimeLight < KalturaUrlTokenizer


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUrlTokenizerVelocix < KalturaUrlTokenizer
		# hdsPaths
		attr_accessor :hds_paths
		# tokenParamName
		attr_accessor :param_name
		# secure URL prefix
		attr_accessor :auth_prefix


		def from_xml(xml_element)
			super
			if xml_element.elements['hdsPaths'] != nil
				self.hds_paths = xml_element.elements['hdsPaths'].text
			end
			if xml_element.elements['paramName'] != nil
				self.param_name = xml_element.elements['paramName'].text
			end
			if xml_element.elements['authPrefix'] != nil
				self.auth_prefix = xml_element.elements['authPrefix'].text
			end
		end

	end

	class KalturaUrlTokenizerVnpt < KalturaUrlTokenizer
		attr_accessor :tokenization_format
		attr_accessor :should_include_client_ip

		def tokenization_format=(val)
			@tokenization_format = val.to_i
		end
		def should_include_client_ip=(val)
			@should_include_client_ip = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['tokenizationFormat'] != nil
				self.tokenization_format = xml_element.elements['tokenizationFormat'].text
			end
			if xml_element.elements['shouldIncludeClientIp'] != nil
				self.should_include_client_ip = xml_element.elements['shouldIncludeClientIp'].text
			end
		end

	end

	class KalturaUrlTokenizerWowzaSecureToken < KalturaUrlTokenizer
		attr_accessor :param_prefix
		attr_accessor :hash_algorithm


		def from_xml(xml_element)
			super
			if xml_element.elements['paramPrefix'] != nil
				self.param_prefix = xml_element.elements['paramPrefix'].text
			end
			if xml_element.elements['hashAlgorithm'] != nil
				self.hash_algorithm = xml_element.elements['hashAlgorithm'].text
			end
		end

	end

	class KalturaUserAgentRestriction < KalturaBaseRestriction
		# User agent restriction type (Allow or deny)
		attr_accessor :user_agent_restriction_type
		# A comma seperated list of user agent regular expressions
		attr_accessor :user_agent_regex_list

		def user_agent_restriction_type=(val)
			@user_agent_restriction_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['userAgentRestrictionType'] != nil
				self.user_agent_restriction_type = xml_element.elements['userAgentRestrictionType'].text
			end
			if xml_element.elements['userAgentRegexList'] != nil
				self.user_agent_regex_list = xml_element.elements['userAgentRegexList'].text
			end
		end

	end

	class KalturaUserEntryListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaUserEntry')
			end
		end

	end

	class KalturaUserListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaUser')
			end
		end

	end

	class KalturaUserLoginDataListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaUserLoginData')
			end
		end

	end

	class KalturaUserRoleCondition < KalturaCondition
		# Comma separated list of role ids
		attr_accessor :role_ids


		def from_xml(xml_element)
			super
			if xml_element.elements['roleIds'] != nil
				self.role_ids = xml_element.elements['roleIds'].text
			end
		end

	end

	class KalturaUserRoleListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaUserRole')
			end
		end

	end

	class KalturaUsersCsvJobData < KalturaJobData
		# The filter should return the list of users that need to be specified in the csv.
		attr_accessor :filter
		# The metadata profile we should look the xpath in
		attr_accessor :metadata_profile_id
		# The xpath to look in the metadataProfileId  and the wanted csv field name
		attr_accessor :additional_fields
		# The users name
		attr_accessor :user_name
		# The users email
		attr_accessor :user_mail
		# The file location
		attr_accessor :output_path

		def metadata_profile_id=(val)
			@metadata_profile_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['filter'] != nil
				self.filter = KalturaClientBase.object_from_xml(xml_element.elements['filter'], 'KalturaUserFilter')
			end
			if xml_element.elements['metadataProfileId'] != nil
				self.metadata_profile_id = xml_element.elements['metadataProfileId'].text
			end
			if xml_element.elements['additionalFields'] != nil
				self.additional_fields = KalturaClientBase.object_from_xml(xml_element.elements['additionalFields'], 'KalturaCsvAdditionalFieldInfo')
			end
			if xml_element.elements['userName'] != nil
				self.user_name = xml_element.elements['userName'].text
			end
			if xml_element.elements['userMail'] != nil
				self.user_mail = xml_element.elements['userMail'].text
			end
			if xml_element.elements['outputPath'] != nil
				self.output_path = xml_element.elements['outputPath'].text
			end
		end

	end

	class KalturaValidateActiveEdgeCondition < KalturaCondition
		# Comma separated list of edge servers to validate are active
		attr_accessor :edge_server_ids


		def from_xml(xml_element)
			super
			if xml_element.elements['edgeServerIds'] != nil
				self.edge_server_ids = xml_element.elements['edgeServerIds'].text
			end
		end

	end

	class KalturaWidgetBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :source_widget_id_equal
		attr_accessor :root_widget_id_equal
		attr_accessor :partner_id_equal
		attr_accessor :entry_id_equal
		attr_accessor :ui_conf_id_equal
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :partner_data_like

		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
		end
		def ui_conf_id_equal=(val)
			@ui_conf_id_equal = val.to_i
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
			if xml_element.elements['sourceWidgetIdEqual'] != nil
				self.source_widget_id_equal = xml_element.elements['sourceWidgetIdEqual'].text
			end
			if xml_element.elements['rootWidgetIdEqual'] != nil
				self.root_widget_id_equal = xml_element.elements['rootWidgetIdEqual'].text
			end
			if xml_element.elements['partnerIdEqual'] != nil
				self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			end
			if xml_element.elements['entryIdEqual'] != nil
				self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			end
			if xml_element.elements['uiConfIdEqual'] != nil
				self.ui_conf_id_equal = xml_element.elements['uiConfIdEqual'].text
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
			if xml_element.elements['partnerDataLike'] != nil
				self.partner_data_like = xml_element.elements['partnerDataLike'].text
			end
		end

	end

	class KalturaWidgetListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaWidget')
			end
		end

	end

	class KalturaYahooSyndicationFeed < KalturaBaseSyndicationFeed
		attr_accessor :category
		attr_accessor :adult_content
		# feed description
		attr_accessor :feed_description
		# feed landing page (i.e publisher website)
		attr_accessor :feed_landing_page


		def from_xml(xml_element)
			super
			if xml_element.elements['category'] != nil
				self.category = xml_element.elements['category'].text
			end
			if xml_element.elements['adultContent'] != nil
				self.adult_content = xml_element.elements['adultContent'].text
			end
			if xml_element.elements['feedDescription'] != nil
				self.feed_description = xml_element.elements['feedDescription'].text
			end
			if xml_element.elements['feedLandingPage'] != nil
				self.feed_landing_page = xml_element.elements['feedLandingPage'].text
			end
		end

	end

	class KalturaAccessControlBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :system_name_equal
		attr_accessor :system_name_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def created_at_greater_than_or_equal=(val)
			@created_at_greater_than_or_equal = val.to_i
		end
		def created_at_less_than_or_equal=(val)
			@created_at_less_than_or_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['systemNameEqual'] != nil
				self.system_name_equal = xml_element.elements['systemNameEqual'].text
			end
			if xml_element.elements['systemNameIn'] != nil
				self.system_name_in = xml_element.elements['systemNameIn'].text
			end
			if xml_element.elements['createdAtGreaterThanOrEqual'] != nil
				self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['createdAtLessThanOrEqual'] != nil
				self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			end
		end

	end

	class KalturaAccessControlProfileBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :system_name_equal
		attr_accessor :system_name_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal

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

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['systemNameEqual'] != nil
				self.system_name_equal = xml_element.elements['systemNameEqual'].text
			end
			if xml_element.elements['systemNameIn'] != nil
				self.system_name_in = xml_element.elements['systemNameIn'].text
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

	class KalturaAkamaiProvisionJobData < KalturaProvisionJobData
		attr_accessor :wsdl_username
		attr_accessor :wsdl_password
		attr_accessor :cpcode
		attr_accessor :email_id
		attr_accessor :primary_contact
		attr_accessor :secondary_contact


		def from_xml(xml_element)
			super
			if xml_element.elements['wsdlUsername'] != nil
				self.wsdl_username = xml_element.elements['wsdlUsername'].text
			end
			if xml_element.elements['wsdlPassword'] != nil
				self.wsdl_password = xml_element.elements['wsdlPassword'].text
			end
			if xml_element.elements['cpcode'] != nil
				self.cpcode = xml_element.elements['cpcode'].text
			end
			if xml_element.elements['emailId'] != nil
				self.email_id = xml_element.elements['emailId'].text
			end
			if xml_element.elements['primaryContact'] != nil
				self.primary_contact = xml_element.elements['primaryContact'].text
			end
			if xml_element.elements['secondaryContact'] != nil
				self.secondary_contact = xml_element.elements['secondaryContact'].text
			end
		end

	end

	class KalturaAkamaiUniversalProvisionJobData < KalturaProvisionJobData
		attr_accessor :stream_id
		attr_accessor :system_user_name
		attr_accessor :system_password
		attr_accessor :domain_name
		attr_accessor :dvr_enabled
		attr_accessor :dvr_window
		attr_accessor :primary_contact
		attr_accessor :secondary_contact
		attr_accessor :stream_type
		attr_accessor :notification_email

		def stream_id=(val)
			@stream_id = val.to_i
		end
		def dvr_enabled=(val)
			@dvr_enabled = val.to_i
		end
		def dvr_window=(val)
			@dvr_window = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['streamId'] != nil
				self.stream_id = xml_element.elements['streamId'].text
			end
			if xml_element.elements['systemUserName'] != nil
				self.system_user_name = xml_element.elements['systemUserName'].text
			end
			if xml_element.elements['systemPassword'] != nil
				self.system_password = xml_element.elements['systemPassword'].text
			end
			if xml_element.elements['domainName'] != nil
				self.domain_name = xml_element.elements['domainName'].text
			end
			if xml_element.elements['dvrEnabled'] != nil
				self.dvr_enabled = xml_element.elements['dvrEnabled'].text
			end
			if xml_element.elements['dvrWindow'] != nil
				self.dvr_window = xml_element.elements['dvrWindow'].text
			end
			if xml_element.elements['primaryContact'] != nil
				self.primary_contact = xml_element.elements['primaryContact'].text
			end
			if xml_element.elements['secondaryContact'] != nil
				self.secondary_contact = xml_element.elements['secondaryContact'].text
			end
			if xml_element.elements['streamType'] != nil
				self.stream_type = xml_element.elements['streamType'].text
			end
			if xml_element.elements['notificationEmail'] != nil
				self.notification_email = xml_element.elements['notificationEmail'].text
			end
		end

	end

	class KalturaAnonymousIPCondition < KalturaMatchCondition
		# The ip geo coder engine to be used
		attr_accessor :geo_coder_type


		def from_xml(xml_element)
			super
			if xml_element.elements['geoCoderType'] != nil
				self.geo_coder_type = xml_element.elements['geoCoderType'].text
			end
		end

	end

	class KalturaAppTokenFilter < KalturaAppTokenBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAssetParamsBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :system_name_equal
		attr_accessor :system_name_in
		attr_accessor :is_system_default_equal
		attr_accessor :tags_equal

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def is_system_default_equal=(val)
			@is_system_default_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['systemNameEqual'] != nil
				self.system_name_equal = xml_element.elements['systemNameEqual'].text
			end
			if xml_element.elements['systemNameIn'] != nil
				self.system_name_in = xml_element.elements['systemNameIn'].text
			end
			if xml_element.elements['isSystemDefaultEqual'] != nil
				self.is_system_default_equal = xml_element.elements['isSystemDefaultEqual'].text
			end
			if xml_element.elements['tagsEqual'] != nil
				self.tags_equal = xml_element.elements['tagsEqual'].text
			end
		end

	end

	# Used to ingest media that is already ingested to Kaltura system as a different flavor asset in the past, the new created flavor asset will be ready immediately using a file sync of link type that will point to the existing file sync of the existing flavor asset.
	class KalturaAssetResource < KalturaContentResource
		# ID of the source asset
		attr_accessor :asset_id


		def from_xml(xml_element)
			super
			if xml_element.elements['assetId'] != nil
				self.asset_id = xml_element.elements['assetId'].text
			end
		end

	end

	class KalturaBaseSyndicationFeedFilter < KalturaBaseSyndicationFeedBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaBulkUploadFilter < KalturaBulkUploadBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaCategoryBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :id_not_in
		attr_accessor :parent_id_equal
		attr_accessor :parent_id_in
		attr_accessor :depth_equal
		attr_accessor :full_name_equal
		attr_accessor :full_name_starts_with
		attr_accessor :full_name_in
		attr_accessor :full_ids_equal
		attr_accessor :full_ids_starts_with
		attr_accessor :full_ids_match_or
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :tags_like
		attr_accessor :tags_multi_like_or
		attr_accessor :tags_multi_like_and
		attr_accessor :appear_in_list_equal
		attr_accessor :privacy_equal
		attr_accessor :privacy_in
		attr_accessor :inheritance_type_equal
		attr_accessor :inheritance_type_in
		attr_accessor :reference_id_equal
		attr_accessor :reference_id_empty
		attr_accessor :contribution_policy_equal
		attr_accessor :members_count_greater_than_or_equal
		attr_accessor :members_count_less_than_or_equal
		attr_accessor :pending_members_count_greater_than_or_equal
		attr_accessor :pending_members_count_less_than_or_equal
		attr_accessor :privacy_context_equal
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :inherited_parent_id_equal
		attr_accessor :inherited_parent_id_in
		attr_accessor :partner_sort_value_greater_than_or_equal
		attr_accessor :partner_sort_value_less_than_or_equal
		attr_accessor :aggregation_categories_multi_like_or
		attr_accessor :aggregation_categories_multi_like_and

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def parent_id_equal=(val)
			@parent_id_equal = val.to_i
		end
		def depth_equal=(val)
			@depth_equal = val.to_i
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
		def appear_in_list_equal=(val)
			@appear_in_list_equal = val.to_i
		end
		def privacy_equal=(val)
			@privacy_equal = val.to_i
		end
		def inheritance_type_equal=(val)
			@inheritance_type_equal = val.to_i
		end
		def reference_id_empty=(val)
			@reference_id_empty = val.to_i
		end
		def contribution_policy_equal=(val)
			@contribution_policy_equal = val.to_i
		end
		def members_count_greater_than_or_equal=(val)
			@members_count_greater_than_or_equal = val.to_i
		end
		def members_count_less_than_or_equal=(val)
			@members_count_less_than_or_equal = val.to_i
		end
		def pending_members_count_greater_than_or_equal=(val)
			@pending_members_count_greater_than_or_equal = val.to_i
		end
		def pending_members_count_less_than_or_equal=(val)
			@pending_members_count_less_than_or_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end
		def inherited_parent_id_equal=(val)
			@inherited_parent_id_equal = val.to_i
		end
		def partner_sort_value_greater_than_or_equal=(val)
			@partner_sort_value_greater_than_or_equal = val.to_i
		end
		def partner_sort_value_less_than_or_equal=(val)
			@partner_sort_value_less_than_or_equal = val.to_i
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
			if xml_element.elements['parentIdEqual'] != nil
				self.parent_id_equal = xml_element.elements['parentIdEqual'].text
			end
			if xml_element.elements['parentIdIn'] != nil
				self.parent_id_in = xml_element.elements['parentIdIn'].text
			end
			if xml_element.elements['depthEqual'] != nil
				self.depth_equal = xml_element.elements['depthEqual'].text
			end
			if xml_element.elements['fullNameEqual'] != nil
				self.full_name_equal = xml_element.elements['fullNameEqual'].text
			end
			if xml_element.elements['fullNameStartsWith'] != nil
				self.full_name_starts_with = xml_element.elements['fullNameStartsWith'].text
			end
			if xml_element.elements['fullNameIn'] != nil
				self.full_name_in = xml_element.elements['fullNameIn'].text
			end
			if xml_element.elements['fullIdsEqual'] != nil
				self.full_ids_equal = xml_element.elements['fullIdsEqual'].text
			end
			if xml_element.elements['fullIdsStartsWith'] != nil
				self.full_ids_starts_with = xml_element.elements['fullIdsStartsWith'].text
			end
			if xml_element.elements['fullIdsMatchOr'] != nil
				self.full_ids_match_or = xml_element.elements['fullIdsMatchOr'].text
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
			if xml_element.elements['tagsLike'] != nil
				self.tags_like = xml_element.elements['tagsLike'].text
			end
			if xml_element.elements['tagsMultiLikeOr'] != nil
				self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			end
			if xml_element.elements['tagsMultiLikeAnd'] != nil
				self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
			end
			if xml_element.elements['appearInListEqual'] != nil
				self.appear_in_list_equal = xml_element.elements['appearInListEqual'].text
			end
			if xml_element.elements['privacyEqual'] != nil
				self.privacy_equal = xml_element.elements['privacyEqual'].text
			end
			if xml_element.elements['privacyIn'] != nil
				self.privacy_in = xml_element.elements['privacyIn'].text
			end
			if xml_element.elements['inheritanceTypeEqual'] != nil
				self.inheritance_type_equal = xml_element.elements['inheritanceTypeEqual'].text
			end
			if xml_element.elements['inheritanceTypeIn'] != nil
				self.inheritance_type_in = xml_element.elements['inheritanceTypeIn'].text
			end
			if xml_element.elements['referenceIdEqual'] != nil
				self.reference_id_equal = xml_element.elements['referenceIdEqual'].text
			end
			if xml_element.elements['referenceIdEmpty'] != nil
				self.reference_id_empty = xml_element.elements['referenceIdEmpty'].text
			end
			if xml_element.elements['contributionPolicyEqual'] != nil
				self.contribution_policy_equal = xml_element.elements['contributionPolicyEqual'].text
			end
			if xml_element.elements['membersCountGreaterThanOrEqual'] != nil
				self.members_count_greater_than_or_equal = xml_element.elements['membersCountGreaterThanOrEqual'].text
			end
			if xml_element.elements['membersCountLessThanOrEqual'] != nil
				self.members_count_less_than_or_equal = xml_element.elements['membersCountLessThanOrEqual'].text
			end
			if xml_element.elements['pendingMembersCountGreaterThanOrEqual'] != nil
				self.pending_members_count_greater_than_or_equal = xml_element.elements['pendingMembersCountGreaterThanOrEqual'].text
			end
			if xml_element.elements['pendingMembersCountLessThanOrEqual'] != nil
				self.pending_members_count_less_than_or_equal = xml_element.elements['pendingMembersCountLessThanOrEqual'].text
			end
			if xml_element.elements['privacyContextEqual'] != nil
				self.privacy_context_equal = xml_element.elements['privacyContextEqual'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['inheritedParentIdEqual'] != nil
				self.inherited_parent_id_equal = xml_element.elements['inheritedParentIdEqual'].text
			end
			if xml_element.elements['inheritedParentIdIn'] != nil
				self.inherited_parent_id_in = xml_element.elements['inheritedParentIdIn'].text
			end
			if xml_element.elements['partnerSortValueGreaterThanOrEqual'] != nil
				self.partner_sort_value_greater_than_or_equal = xml_element.elements['partnerSortValueGreaterThanOrEqual'].text
			end
			if xml_element.elements['partnerSortValueLessThanOrEqual'] != nil
				self.partner_sort_value_less_than_or_equal = xml_element.elements['partnerSortValueLessThanOrEqual'].text
			end
			if xml_element.elements['aggregationCategoriesMultiLikeOr'] != nil
				self.aggregation_categories_multi_like_or = xml_element.elements['aggregationCategoriesMultiLikeOr'].text
			end
			if xml_element.elements['aggregationCategoriesMultiLikeAnd'] != nil
				self.aggregation_categories_multi_like_and = xml_element.elements['aggregationCategoriesMultiLikeAnd'].text
			end
		end

	end

	class KalturaCategoryEntryBaseFilter < KalturaRelatedFilter
		attr_accessor :category_id_equal
		attr_accessor :category_id_in
		attr_accessor :entry_id_equal
		attr_accessor :entry_id_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :category_full_ids_starts_with
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :creator_user_id_equal
		attr_accessor :creator_user_id_in

		def category_id_equal=(val)
			@category_id_equal = val.to_i
		end
		def created_at_greater_than_or_equal=(val)
			@created_at_greater_than_or_equal = val.to_i
		end
		def created_at_less_than_or_equal=(val)
			@created_at_less_than_or_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['categoryIdEqual'] != nil
				self.category_id_equal = xml_element.elements['categoryIdEqual'].text
			end
			if xml_element.elements['categoryIdIn'] != nil
				self.category_id_in = xml_element.elements['categoryIdIn'].text
			end
			if xml_element.elements['entryIdEqual'] != nil
				self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			end
			if xml_element.elements['entryIdIn'] != nil
				self.entry_id_in = xml_element.elements['entryIdIn'].text
			end
			if xml_element.elements['createdAtGreaterThanOrEqual'] != nil
				self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['createdAtLessThanOrEqual'] != nil
				self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			end
			if xml_element.elements['categoryFullIdsStartsWith'] != nil
				self.category_full_ids_starts_with = xml_element.elements['categoryFullIdsStartsWith'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['creatorUserIdEqual'] != nil
				self.creator_user_id_equal = xml_element.elements['creatorUserIdEqual'].text
			end
			if xml_element.elements['creatorUserIdIn'] != nil
				self.creator_user_id_in = xml_element.elements['creatorUserIdIn'].text
			end
		end

	end

	class KalturaClippingTaskEntryServerNode < KalturaTaskEntryServerNode
		attr_accessor :clip_attributes
		attr_accessor :clipped_entry_id
		attr_accessor :live_entry_id


		def from_xml(xml_element)
			super
			if xml_element.elements['clipAttributes'] != nil
				self.clip_attributes = KalturaClientBase.object_from_xml(xml_element.elements['clipAttributes'], 'KalturaClipAttributes')
			end
			if xml_element.elements['clippedEntryId'] != nil
				self.clipped_entry_id = xml_element.elements['clippedEntryId'].text
			end
			if xml_element.elements['liveEntryId'] != nil
				self.live_entry_id = xml_element.elements['liveEntryId'].text
			end
		end

	end

	class KalturaControlPanelCommandFilter < KalturaControlPanelCommandBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaConversionProfileAssetParamsBaseFilter < KalturaRelatedFilter
		attr_accessor :conversion_profile_id_equal
		attr_accessor :conversion_profile_id_in
		attr_accessor :asset_params_id_equal
		attr_accessor :asset_params_id_in
		attr_accessor :ready_behavior_equal
		attr_accessor :ready_behavior_in
		attr_accessor :origin_equal
		attr_accessor :origin_in
		attr_accessor :system_name_equal
		attr_accessor :system_name_in

		def conversion_profile_id_equal=(val)
			@conversion_profile_id_equal = val.to_i
		end
		def asset_params_id_equal=(val)
			@asset_params_id_equal = val.to_i
		end
		def ready_behavior_equal=(val)
			@ready_behavior_equal = val.to_i
		end
		def origin_equal=(val)
			@origin_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['conversionProfileIdEqual'] != nil
				self.conversion_profile_id_equal = xml_element.elements['conversionProfileIdEqual'].text
			end
			if xml_element.elements['conversionProfileIdIn'] != nil
				self.conversion_profile_id_in = xml_element.elements['conversionProfileIdIn'].text
			end
			if xml_element.elements['assetParamsIdEqual'] != nil
				self.asset_params_id_equal = xml_element.elements['assetParamsIdEqual'].text
			end
			if xml_element.elements['assetParamsIdIn'] != nil
				self.asset_params_id_in = xml_element.elements['assetParamsIdIn'].text
			end
			if xml_element.elements['readyBehaviorEqual'] != nil
				self.ready_behavior_equal = xml_element.elements['readyBehaviorEqual'].text
			end
			if xml_element.elements['readyBehaviorIn'] != nil
				self.ready_behavior_in = xml_element.elements['readyBehaviorIn'].text
			end
			if xml_element.elements['originEqual'] != nil
				self.origin_equal = xml_element.elements['originEqual'].text
			end
			if xml_element.elements['originIn'] != nil
				self.origin_in = xml_element.elements['originIn'].text
			end
			if xml_element.elements['systemNameEqual'] != nil
				self.system_name_equal = xml_element.elements['systemNameEqual'].text
			end
			if xml_element.elements['systemNameIn'] != nil
				self.system_name_in = xml_element.elements['systemNameIn'].text
			end
		end

	end

	class KalturaConversionProfileBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :type_equal
		attr_accessor :type_in
		attr_accessor :name_equal
		attr_accessor :system_name_equal
		attr_accessor :system_name_in
		attr_accessor :tags_multi_like_or
		attr_accessor :tags_multi_like_and
		attr_accessor :default_entry_id_equal
		attr_accessor :default_entry_id_in

		def id_equal=(val)
			@id_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['typeEqual'] != nil
				self.type_equal = xml_element.elements['typeEqual'].text
			end
			if xml_element.elements['typeIn'] != nil
				self.type_in = xml_element.elements['typeIn'].text
			end
			if xml_element.elements['nameEqual'] != nil
				self.name_equal = xml_element.elements['nameEqual'].text
			end
			if xml_element.elements['systemNameEqual'] != nil
				self.system_name_equal = xml_element.elements['systemNameEqual'].text
			end
			if xml_element.elements['systemNameIn'] != nil
				self.system_name_in = xml_element.elements['systemNameIn'].text
			end
			if xml_element.elements['tagsMultiLikeOr'] != nil
				self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			end
			if xml_element.elements['tagsMultiLikeAnd'] != nil
				self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
			end
			if xml_element.elements['defaultEntryIdEqual'] != nil
				self.default_entry_id_equal = xml_element.elements['defaultEntryIdEqual'].text
			end
			if xml_element.elements['defaultEntryIdIn'] != nil
				self.default_entry_id_in = xml_element.elements['defaultEntryIdIn'].text
			end
		end

	end

	class KalturaConvertCollectionJobData < KalturaConvartableJobData
		attr_accessor :dest_dir_local_path
		attr_accessor :dest_dir_remote_url
		attr_accessor :dest_file_name
		attr_accessor :input_xml_local_path
		attr_accessor :input_xml_remote_url
		attr_accessor :command_lines_str
		attr_accessor :flavors


		def from_xml(xml_element)
			super
			if xml_element.elements['destDirLocalPath'] != nil
				self.dest_dir_local_path = xml_element.elements['destDirLocalPath'].text
			end
			if xml_element.elements['destDirRemoteUrl'] != nil
				self.dest_dir_remote_url = xml_element.elements['destDirRemoteUrl'].text
			end
			if xml_element.elements['destFileName'] != nil
				self.dest_file_name = xml_element.elements['destFileName'].text
			end
			if xml_element.elements['inputXmlLocalPath'] != nil
				self.input_xml_local_path = xml_element.elements['inputXmlLocalPath'].text
			end
			if xml_element.elements['inputXmlRemoteUrl'] != nil
				self.input_xml_remote_url = xml_element.elements['inputXmlRemoteUrl'].text
			end
			if xml_element.elements['commandLinesStr'] != nil
				self.command_lines_str = xml_element.elements['commandLinesStr'].text
			end
			if xml_element.elements['flavors'] != nil
				self.flavors = KalturaClientBase.object_from_xml(xml_element.elements['flavors'], 'KalturaConvertCollectionFlavorData')
			end
		end

	end

	class KalturaConvertJobData < KalturaConvartableJobData
		attr_accessor :dest_file_sync_local_path
		attr_accessor :dest_file_sync_remote_url
		attr_accessor :log_file_sync_local_path
		attr_accessor :log_file_sync_remote_url
		attr_accessor :flavor_asset_id
		attr_accessor :remote_media_id
		attr_accessor :custom_data
		attr_accessor :extra_dest_file_syncs
		attr_accessor :engine_message


		def from_xml(xml_element)
			super
			if xml_element.elements['destFileSyncLocalPath'] != nil
				self.dest_file_sync_local_path = xml_element.elements['destFileSyncLocalPath'].text
			end
			if xml_element.elements['destFileSyncRemoteUrl'] != nil
				self.dest_file_sync_remote_url = xml_element.elements['destFileSyncRemoteUrl'].text
			end
			if xml_element.elements['logFileSyncLocalPath'] != nil
				self.log_file_sync_local_path = xml_element.elements['logFileSyncLocalPath'].text
			end
			if xml_element.elements['logFileSyncRemoteUrl'] != nil
				self.log_file_sync_remote_url = xml_element.elements['logFileSyncRemoteUrl'].text
			end
			if xml_element.elements['flavorAssetId'] != nil
				self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			end
			if xml_element.elements['remoteMediaId'] != nil
				self.remote_media_id = xml_element.elements['remoteMediaId'].text
			end
			if xml_element.elements['customData'] != nil
				self.custom_data = xml_element.elements['customData'].text
			end
			if xml_element.elements['extraDestFileSyncs'] != nil
				self.extra_dest_file_syncs = KalturaClientBase.object_from_xml(xml_element.elements['extraDestFileSyncs'], 'KalturaDestFileSyncDescriptor')
			end
			if xml_element.elements['engineMessage'] != nil
				self.engine_message = xml_element.elements['engineMessage'].text
			end
		end

	end

	class KalturaCountryCondition < KalturaMatchCondition
		# The ip geo coder engine to be used
		attr_accessor :geo_coder_type


		def from_xml(xml_element)
			super
			if xml_element.elements['geoCoderType'] != nil
				self.geo_coder_type = xml_element.elements['geoCoderType'].text
			end
		end

	end

	class KalturaDeliveryProfileFilter < KalturaDeliveryProfileBaseFilter
		attr_accessor :is_live

		def is_live=(val)
			@is_live = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['isLive'] != nil
				self.is_live = xml_element.elements['isLive'].text
			end
		end

	end

	class KalturaDeliveryProfileGenericRtmp < KalturaDeliveryProfileRtmp
		attr_accessor :pattern
		# rendererClass
		attr_accessor :renderer_class


		def from_xml(xml_element)
			super
			if xml_element.elements['pattern'] != nil
				self.pattern = xml_element.elements['pattern'].text
			end
			if xml_element.elements['rendererClass'] != nil
				self.renderer_class = xml_element.elements['rendererClass'].text
			end
		end

	end

	class KalturaDeliveryProfileLivePackagerHls < KalturaDeliveryProfileLivePackager
		attr_accessor :disable_extra_attributes
		attr_accessor :force_proxy

		def disable_extra_attributes=(val)
			@disable_extra_attributes = to_b(val)
		end
		def force_proxy=(val)
			@force_proxy = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['disableExtraAttributes'] != nil
				self.disable_extra_attributes = xml_element.elements['disableExtraAttributes'].text
			end
			if xml_element.elements['forceProxy'] != nil
				self.force_proxy = xml_element.elements['forceProxy'].text
			end
		end

	end

	class KalturaDeliveryProfileVodPackagerHls < KalturaDeliveryProfileVodPackagerPlayServer
		attr_accessor :allow_fairplay_offline

		def allow_fairplay_offline=(val)
			@allow_fairplay_offline = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['allowFairplayOffline'] != nil
				self.allow_fairplay_offline = xml_element.elements['allowFairplayOffline'].text
			end
		end

	end

	class KalturaEdgeServerNode < KalturaDeliveryServerNode
		# Delivery server playback Domain
		attr_accessor :playback_domain


		def from_xml(xml_element)
			super
			if xml_element.elements['playbackDomain'] != nil
				self.playback_domain = xml_element.elements['playbackDomain'].text
			end
		end

	end

	class KalturaEndUserReportInputFilter < KalturaReportInputFilter
		attr_accessor :application
		attr_accessor :user_ids
		attr_accessor :playback_context
		attr_accessor :ancestor_playback_context


		def from_xml(xml_element)
			super
			if xml_element.elements['application'] != nil
				self.application = xml_element.elements['application'].text
			end
			if xml_element.elements['userIds'] != nil
				self.user_ids = xml_element.elements['userIds'].text
			end
			if xml_element.elements['playbackContext'] != nil
				self.playback_context = xml_element.elements['playbackContext'].text
			end
			if xml_element.elements['ancestorPlaybackContext'] != nil
				self.ancestor_playback_context = xml_element.elements['ancestorPlaybackContext'].text
			end
		end

	end

	class KalturaEntryIndexAdvancedFilter < KalturaIndexAdvancedFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaEntryReferrerLiveStats < KalturaEntryLiveStats
		attr_accessor :referrer


		def from_xml(xml_element)
			super
			if xml_element.elements['referrer'] != nil
				self.referrer = xml_element.elements['referrer'].text
			end
		end

	end

	# Used to ingest media that is already ingested to Kaltura system as a different entry in the past, the new created flavor asset will be ready immediately using a file sync of link type that will point to the existing file sync of the existing entry.
	class KalturaEntryResource < KalturaContentResource
		# ID of the source entry
		attr_accessor :entry_id
		# ID of the source flavor params, set to null to use the source flavor
		attr_accessor :flavor_params_id

		def flavor_params_id=(val)
			@flavor_params_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['flavorParamsId'] != nil
				self.flavor_params_id = xml_element.elements['flavorParamsId'].text
			end
		end

	end

	class KalturaEntryServerNodeFilter < KalturaEntryServerNodeBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaExtractMediaJobData < KalturaConvartableJobData
		attr_accessor :flavor_asset_id
		attr_accessor :calculate_complexity
		attr_accessor :extract_id3tags
		# The data output file
		attr_accessor :dest_data_file_path
		attr_accessor :detect_gop

		def calculate_complexity=(val)
			@calculate_complexity = to_b(val)
		end
		def extract_id3tags=(val)
			@extract_id3tags = to_b(val)
		end
		def detect_gop=(val)
			@detect_gop = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['flavorAssetId'] != nil
				self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			end
			if xml_element.elements['calculateComplexity'] != nil
				self.calculate_complexity = xml_element.elements['calculateComplexity'].text
			end
			if xml_element.elements['extractId3Tags'] != nil
				self.extract_id3tags = xml_element.elements['extractId3Tags'].text
			end
			if xml_element.elements['destDataFilePath'] != nil
				self.dest_data_file_path = xml_element.elements['destDataFilePath'].text
			end
			if xml_element.elements['detectGOP'] != nil
				self.detect_gop = xml_element.elements['detectGOP'].text
			end
		end

	end

	class KalturaFairPlayPlaybackPluginData < KalturaDrmPlaybackPluginData
		attr_accessor :certificate


		def from_xml(xml_element)
			super
			if xml_element.elements['certificate'] != nil
				self.certificate = xml_element.elements['certificate'].text
			end
		end

	end

	# An int representation to return evaluated dynamic value
	class KalturaIntegerField < KalturaIntegerValue


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFieldCompareCondition < KalturaCompareCondition
		# Field to evaluate
		attr_accessor :field


		def from_xml(xml_element)
			super
			if xml_element.elements['field'] != nil
				self.field = KalturaClientBase.object_from_xml(xml_element.elements['field'], 'KalturaIntegerField')
			end
		end

	end

	# A string representation to return evaluated dynamic value
	class KalturaStringField < KalturaStringValue


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFieldMatchCondition < KalturaMatchCondition
		# Field to evaluate
		attr_accessor :field


		def from_xml(xml_element)
			super
			if xml_element.elements['field'] != nil
				self.field = KalturaClientBase.object_from_xml(xml_element.elements['field'], 'KalturaStringField')
			end
		end

	end

	class KalturaFileAssetBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :partner_id_equal
		attr_accessor :file_asset_object_type_equal
		attr_accessor :object_id_equal
		attr_accessor :object_id_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :status_equal
		attr_accessor :status_in

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
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
			if xml_element.elements['fileAssetObjectTypeEqual'] != nil
				self.file_asset_object_type_equal = xml_element.elements['fileAssetObjectTypeEqual'].text
			end
			if xml_element.elements['objectIdEqual'] != nil
				self.object_id_equal = xml_element.elements['objectIdEqual'].text
			end
			if xml_element.elements['objectIdIn'] != nil
				self.object_id_in = xml_element.elements['objectIdIn'].text
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
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
		end

	end

	# Used to ingest media that is already ingested to Kaltura system as a different file in the past, the new created flavor asset will be ready immediately using a file sync of link type that will point to the existing file sync.
	class KalturaFileSyncResource < KalturaContentResource
		# The object type of the file sync object
		attr_accessor :file_sync_object_type
		# The object sub-type of the file sync object
		attr_accessor :object_sub_type
		# The object id of the file sync object
		attr_accessor :object_id
		# The version of the file sync object
		attr_accessor :version

		def file_sync_object_type=(val)
			@file_sync_object_type = val.to_i
		end
		def object_sub_type=(val)
			@object_sub_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['fileSyncObjectType'] != nil
				self.file_sync_object_type = xml_element.elements['fileSyncObjectType'].text
			end
			if xml_element.elements['objectSubType'] != nil
				self.object_sub_type = xml_element.elements['objectSubType'].text
			end
			if xml_element.elements['objectId'] != nil
				self.object_id = xml_element.elements['objectId'].text
			end
			if xml_element.elements['version'] != nil
				self.version = xml_element.elements['version'].text
			end
		end

	end

	class KalturaGenericXsltSyndicationFeed < KalturaGenericSyndicationFeed
		attr_accessor :xslt
		attr_accessor :item_xpaths_to_extend


		def from_xml(xml_element)
			super
			if xml_element.elements['xslt'] != nil
				self.xslt = xml_element.elements['xslt'].text
			end
			if xml_element.elements['itemXpathsToExtend'] != nil
				self.item_xpaths_to_extend = KalturaClientBase.object_from_xml(xml_element.elements['itemXpathsToExtend'], 'KalturaExtendingItemMrssParameter')
			end
		end

	end

	class KalturaGeoDistanceCondition < KalturaMatchCondition
		# The ip geo coder engine to be used
		attr_accessor :geo_coder_type


		def from_xml(xml_element)
			super
			if xml_element.elements['geoCoderType'] != nil
				self.geo_coder_type = xml_element.elements['geoCoderType'].text
			end
		end

	end

	class KalturaGeoTimeLiveStats < KalturaEntryLiveStats
		attr_accessor :city
		attr_accessor :country


		def from_xml(xml_element)
			super
			if xml_element.elements['city'] != nil
				self.city = KalturaClientBase.object_from_xml(xml_element.elements['city'], 'KalturaCoordinate')
			end
			if xml_element.elements['country'] != nil
				self.country = KalturaClientBase.object_from_xml(xml_element.elements['country'], 'KalturaCoordinate')
			end
		end

	end

	class KalturaGroupUserBaseFilter < KalturaRelatedFilter
		attr_accessor :user_id_equal
		attr_accessor :user_id_in
		attr_accessor :group_id_equal
		attr_accessor :group_id_in
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal

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
			if xml_element.elements['userIdEqual'] != nil
				self.user_id_equal = xml_element.elements['userIdEqual'].text
			end
			if xml_element.elements['userIdIn'] != nil
				self.user_id_in = xml_element.elements['userIdIn'].text
			end
			if xml_element.elements['groupIdEqual'] != nil
				self.group_id_equal = xml_element.elements['groupIdEqual'].text
			end
			if xml_element.elements['groupIdIn'] != nil
				self.group_id_in = xml_element.elements['groupIdIn'].text
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

	class KalturaIpAddressCondition < KalturaMatchCondition
		# allow internal ips
		attr_accessor :accept_internal_ips
		# http header name for extracting the ip
		attr_accessor :http_header

		def accept_internal_ips=(val)
			@accept_internal_ips = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['acceptInternalIps'] != nil
				self.accept_internal_ips = xml_element.elements['acceptInternalIps'].text
			end
			if xml_element.elements['httpHeader'] != nil
				self.http_header = xml_element.elements['httpHeader'].text
			end
		end

	end

	class KalturaLiveAsset < KalturaFlavorAsset
		attr_accessor :multicast_ip
		attr_accessor :multicast_port

		def multicast_port=(val)
			@multicast_port = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['multicastIP'] != nil
				self.multicast_ip = xml_element.elements['multicastIP'].text
			end
			if xml_element.elements['multicastPort'] != nil
				self.multicast_port = xml_element.elements['multicastPort'].text
			end
		end

	end

	class KalturaLiveChannelSegmentBaseFilter < KalturaRelatedFilter
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :channel_id_equal
		attr_accessor :channel_id_in
		attr_accessor :start_time_greater_than_or_equal
		attr_accessor :start_time_less_than_or_equal

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
		def start_time_greater_than_or_equal=(val)
			@start_time_greater_than_or_equal = val.to_f
		end
		def start_time_less_than_or_equal=(val)
			@start_time_less_than_or_equal = val.to_f
		end

		def from_xml(xml_element)
			super
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
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['channelIdEqual'] != nil
				self.channel_id_equal = xml_element.elements['channelIdEqual'].text
			end
			if xml_element.elements['channelIdIn'] != nil
				self.channel_id_in = xml_element.elements['channelIdIn'].text
			end
			if xml_element.elements['startTimeGreaterThanOrEqual'] != nil
				self.start_time_greater_than_or_equal = xml_element.elements['startTimeGreaterThanOrEqual'].text
			end
			if xml_element.elements['startTimeLessThanOrEqual'] != nil
				self.start_time_less_than_or_equal = xml_element.elements['startTimeLessThanOrEqual'].text
			end
		end

	end

	class KalturaLiveParams < KalturaFlavorParams
		# Suffix to be added to the stream name after the entry id {entry_id}_{stream_suffix}, e.g. for entry id 0_kjdu5jr6 and suffix 1, the stream name will be 0_kjdu5jr6_1
		attr_accessor :stream_suffix


		def from_xml(xml_element)
			super
			if xml_element.elements['streamSuffix'] != nil
				self.stream_suffix = xml_element.elements['streamSuffix'].text
			end
		end

	end

	class KalturaMediaFlavorParams < KalturaFlavorParams


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMediaInfoFilter < KalturaMediaInfoBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMediaServerNode < KalturaDeliveryServerNode
		# Media server application name
		attr_accessor :application_name
		# Media server playback port configuration by protocol and format
		attr_accessor :media_server_port_config
		# Media server playback Domain configuration by protocol and format
		attr_accessor :media_server_playback_domain_config


		def from_xml(xml_element)
			super
			if xml_element.elements['applicationName'] != nil
				self.application_name = xml_element.elements['applicationName'].text
			end
			if xml_element.elements['mediaServerPortConfig'] != nil
				self.media_server_port_config = KalturaClientBase.object_from_xml(xml_element.elements['mediaServerPortConfig'], 'KalturaKeyValue')
			end
			if xml_element.elements['mediaServerPlaybackDomainConfig'] != nil
				self.media_server_playback_domain_config = KalturaClientBase.object_from_xml(xml_element.elements['mediaServerPlaybackDomainConfig'], 'KalturaKeyValue')
			end
		end

	end

	# A resource that perform operation (transcoding, clipping, cropping) before the flavor is ready.
	class KalturaOperationResource < KalturaContentResource
		# Only KalturaEntryResource and KalturaAssetResource are supported
		attr_accessor :resource
		attr_accessor :operation_attributes
		# ID of alternative asset params to be used instead of the system default flavor params
		attr_accessor :asset_params_id

		def asset_params_id=(val)
			@asset_params_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['resource'] != nil
				self.resource = KalturaClientBase.object_from_xml(xml_element.elements['resource'], 'KalturaContentResource')
			end
			if xml_element.elements['operationAttributes'] != nil
				self.operation_attributes = KalturaClientBase.object_from_xml(xml_element.elements['operationAttributes'], 'KalturaOperationAttributes')
			end
			if xml_element.elements['assetParamsId'] != nil
				self.asset_params_id = xml_element.elements['assetParamsId'].text
			end
		end

	end

	class KalturaPartnerFilter < KalturaPartnerBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaPermissionBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :type_equal
		attr_accessor :type_in
		attr_accessor :name_equal
		attr_accessor :name_in
		attr_accessor :friendly_name_like
		attr_accessor :description_like
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :depends_on_permission_names_multi_like_or
		attr_accessor :depends_on_permission_names_multi_like_and
		attr_accessor :tags_multi_like_or
		attr_accessor :tags_multi_like_and
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def type_equal=(val)
			@type_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end
		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
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
			if xml_element.elements['typeEqual'] != nil
				self.type_equal = xml_element.elements['typeEqual'].text
			end
			if xml_element.elements['typeIn'] != nil
				self.type_in = xml_element.elements['typeIn'].text
			end
			if xml_element.elements['nameEqual'] != nil
				self.name_equal = xml_element.elements['nameEqual'].text
			end
			if xml_element.elements['nameIn'] != nil
				self.name_in = xml_element.elements['nameIn'].text
			end
			if xml_element.elements['friendlyNameLike'] != nil
				self.friendly_name_like = xml_element.elements['friendlyNameLike'].text
			end
			if xml_element.elements['descriptionLike'] != nil
				self.description_like = xml_element.elements['descriptionLike'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['partnerIdEqual'] != nil
				self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			end
			if xml_element.elements['partnerIdIn'] != nil
				self.partner_id_in = xml_element.elements['partnerIdIn'].text
			end
			if xml_element.elements['dependsOnPermissionNamesMultiLikeOr'] != nil
				self.depends_on_permission_names_multi_like_or = xml_element.elements['dependsOnPermissionNamesMultiLikeOr'].text
			end
			if xml_element.elements['dependsOnPermissionNamesMultiLikeAnd'] != nil
				self.depends_on_permission_names_multi_like_and = xml_element.elements['dependsOnPermissionNamesMultiLikeAnd'].text
			end
			if xml_element.elements['tagsMultiLikeOr'] != nil
				self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			end
			if xml_element.elements['tagsMultiLikeAnd'] != nil
				self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
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

	class KalturaPermissionItemBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :type_equal
		attr_accessor :type_in
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :tags_multi_like_or
		attr_accessor :tags_multi_like_and
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
			if xml_element.elements['typeEqual'] != nil
				self.type_equal = xml_element.elements['typeEqual'].text
			end
			if xml_element.elements['typeIn'] != nil
				self.type_in = xml_element.elements['typeIn'].text
			end
			if xml_element.elements['partnerIdEqual'] != nil
				self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			end
			if xml_element.elements['partnerIdIn'] != nil
				self.partner_id_in = xml_element.elements['partnerIdIn'].text
			end
			if xml_element.elements['tagsMultiLikeOr'] != nil
				self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			end
			if xml_element.elements['tagsMultiLikeAnd'] != nil
				self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
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

	# Object which contains contextual entry-related data.
	class KalturaPlaybackContextOptions < KalturaEntryContextDataParams


		def from_xml(xml_element)
			super
		end

	end

	class KalturaPostConvertJobData < KalturaConvartableJobData
		attr_accessor :flavor_asset_id
		attr_accessor :flavor_asset_encryption_key
		# Indicates if a thumbnail should be created
		attr_accessor :create_thumb
		# The path of the created thumbnail
		attr_accessor :thumb_path
		# The position of the thumbnail in the media file
		attr_accessor :thumb_offset
		# The height of the movie, will be used to comapare if this thumbnail is the best we can have
		attr_accessor :thumb_height
		# The bit rate of the movie, will be used to comapare if this thumbnail is the best we can have
		attr_accessor :thumb_bitrate
		attr_accessor :custom_data

		def create_thumb=(val)
			@create_thumb = to_b(val)
		end
		def thumb_offset=(val)
			@thumb_offset = val.to_i
		end
		def thumb_height=(val)
			@thumb_height = val.to_i
		end
		def thumb_bitrate=(val)
			@thumb_bitrate = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['flavorAssetId'] != nil
				self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			end
			if xml_element.elements['flavorAssetEncryptionKey'] != nil
				self.flavor_asset_encryption_key = xml_element.elements['flavorAssetEncryptionKey'].text
			end
			if xml_element.elements['createThumb'] != nil
				self.create_thumb = xml_element.elements['createThumb'].text
			end
			if xml_element.elements['thumbPath'] != nil
				self.thumb_path = xml_element.elements['thumbPath'].text
			end
			if xml_element.elements['thumbOffset'] != nil
				self.thumb_offset = xml_element.elements['thumbOffset'].text
			end
			if xml_element.elements['thumbHeight'] != nil
				self.thumb_height = xml_element.elements['thumbHeight'].text
			end
			if xml_element.elements['thumbBitrate'] != nil
				self.thumb_bitrate = xml_element.elements['thumbBitrate'].text
			end
			if xml_element.elements['customData'] != nil
				self.custom_data = xml_element.elements['customData'].text
			end
		end

	end

	class KalturaPreviewRestriction < KalturaSessionRestriction
		# The preview restriction length
		attr_accessor :preview_length

		def preview_length=(val)
			@preview_length = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['previewLength'] != nil
				self.preview_length = xml_element.elements['previewLength'].text
			end
		end

	end

	class KalturaRecalculateResponseProfileCacheJobData < KalturaRecalculateCacheJobData
		# http / https
		attr_accessor :protocol
		attr_accessor :ks_type
		attr_accessor :user_roles
		# Class name
		attr_accessor :cached_object_type
		attr_accessor :object_id
		attr_accessor :start_object_key
		attr_accessor :end_object_key

		def ks_type=(val)
			@ks_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['protocol'] != nil
				self.protocol = xml_element.elements['protocol'].text
			end
			if xml_element.elements['ksType'] != nil
				self.ks_type = xml_element.elements['ksType'].text
			end
			if xml_element.elements['userRoles'] != nil
				self.user_roles = KalturaClientBase.object_from_xml(xml_element.elements['userRoles'], 'KalturaIntegerValue')
			end
			if xml_element.elements['cachedObjectType'] != nil
				self.cached_object_type = xml_element.elements['cachedObjectType'].text
			end
			if xml_element.elements['objectId'] != nil
				self.object_id = xml_element.elements['objectId'].text
			end
			if xml_element.elements['startObjectKey'] != nil
				self.start_object_key = xml_element.elements['startObjectKey'].text
			end
			if xml_element.elements['endObjectKey'] != nil
				self.end_object_key = xml_element.elements['endObjectKey'].text
			end
		end

	end

	class KalturaRegexCondition < KalturaMatchCondition


		def from_xml(xml_element)
			super
		end

	end

	# Used to ingest media that is available on remote server and accessible using the supplied URL, the media file won't be downloaded but a file sync object of URL type will point to the media URL.
	class KalturaRemoteStorageResources < KalturaContentResource
		# Array of remote stoage resources
		attr_accessor :resources


		def from_xml(xml_element)
			super
			if xml_element.elements['resources'] != nil
				self.resources = KalturaClientBase.object_from_xml(xml_element.elements['resources'], 'KalturaRemoteStorageResource')
			end
		end

	end

	class KalturaResponseProfileFilter < KalturaResponseProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSearchComparableAttributeCondition < KalturaAttributeCondition
		attr_accessor :comparison


		def from_xml(xml_element)
			super
			if xml_element.elements['comparison'] != nil
				self.comparison = xml_element.elements['comparison'].text
			end
		end

	end

	class KalturaSearchComparableCondition < KalturaSearchCondition
		attr_accessor :comparison


		def from_xml(xml_element)
			super
			if xml_element.elements['comparison'] != nil
				self.comparison = xml_element.elements['comparison'].text
			end
		end

	end

	class KalturaSearchMatchAttributeCondition < KalturaAttributeCondition
		attr_accessor :not

		def not=(val)
			@not = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['not'] != nil
				self.not = xml_element.elements['not'].text
			end
		end

	end

	class KalturaSearchMatchCondition < KalturaSearchCondition
		attr_accessor :not

		def not=(val)
			@not = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['not'] != nil
				self.not = xml_element.elements['not'].text
			end
		end

	end

	class KalturaServerNodeFilter < KalturaServerNodeBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSiteCondition < KalturaMatchCondition


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSshImportJobData < KalturaImportJobData
		attr_accessor :private_key
		attr_accessor :public_key
		attr_accessor :pass_phrase


		def from_xml(xml_element)
			super
			if xml_element.elements['privateKey'] != nil
				self.private_key = xml_element.elements['privateKey'].text
			end
			if xml_element.elements['publicKey'] != nil
				self.public_key = xml_element.elements['publicKey'].text
			end
			if xml_element.elements['passPhrase'] != nil
				self.pass_phrase = xml_element.elements['passPhrase'].text
			end
		end

	end

	class KalturaStorageDeleteJobData < KalturaStorageJobData


		def from_xml(xml_element)
			super
		end

	end

	class KalturaStorageExportJobData < KalturaStorageJobData
		attr_accessor :force
		attr_accessor :create_link

		def force=(val)
			@force = to_b(val)
		end
		def create_link=(val)
			@create_link = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['force'] != nil
				self.force = xml_element.elements['force'].text
			end
			if xml_element.elements['createLink'] != nil
				self.create_link = xml_element.elements['createLink'].text
			end
		end

	end

	class KalturaStorageProfileFilter < KalturaStorageProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	# Used to ingest string content.
	class KalturaStringResource < KalturaContentResource
		# Textual content
		attr_accessor :content


		def from_xml(xml_element)
			super
			if xml_element.elements['content'] != nil
				self.content = xml_element.elements['content'].text
			end
		end

	end

	class KalturaUiConfFilter < KalturaUiConfBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUploadTokenFilter < KalturaUploadTokenBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUserEntryBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :id_not_in
		attr_accessor :entry_id_equal
		attr_accessor :entry_id_in
		attr_accessor :entry_id_not_in
		attr_accessor :user_id_equal
		attr_accessor :user_id_in
		attr_accessor :user_id_not_in
		attr_accessor :status_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :type_equal
		attr_accessor :extended_status_equal
		attr_accessor :extended_status_in
		attr_accessor :extended_status_not_in

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def created_at_less_than_or_equal=(val)
			@created_at_less_than_or_equal = val.to_i
		end
		def created_at_greater_than_or_equal=(val)
			@created_at_greater_than_or_equal = val.to_i
		end
		def updated_at_less_than_or_equal=(val)
			@updated_at_less_than_or_equal = val.to_i
		end
		def updated_at_greater_than_or_equal=(val)
			@updated_at_greater_than_or_equal = val.to_i
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
			if xml_element.elements['entryIdEqual'] != nil
				self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			end
			if xml_element.elements['entryIdIn'] != nil
				self.entry_id_in = xml_element.elements['entryIdIn'].text
			end
			if xml_element.elements['entryIdNotIn'] != nil
				self.entry_id_not_in = xml_element.elements['entryIdNotIn'].text
			end
			if xml_element.elements['userIdEqual'] != nil
				self.user_id_equal = xml_element.elements['userIdEqual'].text
			end
			if xml_element.elements['userIdIn'] != nil
				self.user_id_in = xml_element.elements['userIdIn'].text
			end
			if xml_element.elements['userIdNotIn'] != nil
				self.user_id_not_in = xml_element.elements['userIdNotIn'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['createdAtLessThanOrEqual'] != nil
				self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			end
			if xml_element.elements['createdAtGreaterThanOrEqual'] != nil
				self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['updatedAtLessThanOrEqual'] != nil
				self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			end
			if xml_element.elements['updatedAtGreaterThanOrEqual'] != nil
				self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['typeEqual'] != nil
				self.type_equal = xml_element.elements['typeEqual'].text
			end
			if xml_element.elements['extendedStatusEqual'] != nil
				self.extended_status_equal = xml_element.elements['extendedStatusEqual'].text
			end
			if xml_element.elements['extendedStatusIn'] != nil
				self.extended_status_in = xml_element.elements['extendedStatusIn'].text
			end
			if xml_element.elements['extendedStatusNotIn'] != nil
				self.extended_status_not_in = xml_element.elements['extendedStatusNotIn'].text
			end
		end

	end

	class KalturaUserLoginDataBaseFilter < KalturaRelatedFilter
		attr_accessor :login_email_equal


		def from_xml(xml_element)
			super
			if xml_element.elements['loginEmailEqual'] != nil
				self.login_email_equal = xml_element.elements['loginEmailEqual'].text
			end
		end

	end

	class KalturaUserRoleBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :name_equal
		attr_accessor :name_in
		attr_accessor :system_name_equal
		attr_accessor :system_name_in
		attr_accessor :description_like
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :tags_multi_like_or
		attr_accessor :tags_multi_like_and
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end
		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
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
			if xml_element.elements['nameEqual'] != nil
				self.name_equal = xml_element.elements['nameEqual'].text
			end
			if xml_element.elements['nameIn'] != nil
				self.name_in = xml_element.elements['nameIn'].text
			end
			if xml_element.elements['systemNameEqual'] != nil
				self.system_name_equal = xml_element.elements['systemNameEqual'].text
			end
			if xml_element.elements['systemNameIn'] != nil
				self.system_name_in = xml_element.elements['systemNameIn'].text
			end
			if xml_element.elements['descriptionLike'] != nil
				self.description_like = xml_element.elements['descriptionLike'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['partnerIdEqual'] != nil
				self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			end
			if xml_element.elements['partnerIdIn'] != nil
				self.partner_id_in = xml_element.elements['partnerIdIn'].text
			end
			if xml_element.elements['tagsMultiLikeOr'] != nil
				self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			end
			if xml_element.elements['tagsMultiLikeAnd'] != nil
				self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
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

	class KalturaWidgetFilter < KalturaWidgetBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAccessControlFilter < KalturaAccessControlBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAccessControlProfileFilter < KalturaAccessControlProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAmazonS3StorageExportJobData < KalturaStorageExportJobData
		attr_accessor :files_permission_in_s3
		attr_accessor :s3region
		attr_accessor :sse_type
		attr_accessor :sse_kms_key_id
		attr_accessor :signature_type
		attr_accessor :end_point


		def from_xml(xml_element)
			super
			if xml_element.elements['filesPermissionInS3'] != nil
				self.files_permission_in_s3 = xml_element.elements['filesPermissionInS3'].text
			end
			if xml_element.elements['s3Region'] != nil
				self.s3region = xml_element.elements['s3Region'].text
			end
			if xml_element.elements['sseType'] != nil
				self.sse_type = xml_element.elements['sseType'].text
			end
			if xml_element.elements['sseKmsKeyId'] != nil
				self.sse_kms_key_id = xml_element.elements['sseKmsKeyId'].text
			end
			if xml_element.elements['signatureType'] != nil
				self.signature_type = xml_element.elements['signatureType'].text
			end
			if xml_element.elements['endPoint'] != nil
				self.end_point = xml_element.elements['endPoint'].text
			end
		end

	end

	class KalturaAmazonS3StorageProfileBaseFilter < KalturaStorageProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	# Represents the current request country context as calculated based on the IP address
	class KalturaAnonymousIPContextField < KalturaStringField
		# The ip geo coder engine to be used
		attr_accessor :geo_coder_type


		def from_xml(xml_element)
			super
			if xml_element.elements['geoCoderType'] != nil
				self.geo_coder_type = xml_element.elements['geoCoderType'].text
			end
		end

	end

	class KalturaAssetParamsFilter < KalturaAssetParamsBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	# Auto-generated class.
	#  Used to search KalturaBaseEntry attributes. Use KalturaBaseEntryCompareAttribute enum to provide attribute name.
	# /
	class KalturaBaseEntryCompareAttributeCondition < KalturaSearchComparableAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	# Auto-generated class.
	#  Used to search KalturaBaseEntry attributes. Use KalturaBaseEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaBaseEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	class KalturaBatchJobFilterExt < KalturaBatchJobFilter
		attr_accessor :job_type_and_sub_type_in


		def from_xml(xml_element)
			super
			if xml_element.elements['jobTypeAndSubTypeIn'] != nil
				self.job_type_and_sub_type_in = xml_element.elements['jobTypeAndSubTypeIn'].text
			end
		end

	end

	class KalturaCategoryEntryFilter < KalturaCategoryEntryBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaCategoryFilter < KalturaCategoryBaseFilter
		attr_accessor :free_text
		attr_accessor :members_in
		attr_accessor :name_or_reference_id_starts_with
		attr_accessor :manager_equal
		attr_accessor :member_equal
		attr_accessor :full_name_starts_with_in
		# not includes the category itself (only sub categories)
		attr_accessor :ancestor_id_in
		attr_accessor :id_or_inherited_parent_id_in


		def from_xml(xml_element)
			super
			if xml_element.elements['freeText'] != nil
				self.free_text = xml_element.elements['freeText'].text
			end
			if xml_element.elements['membersIn'] != nil
				self.members_in = xml_element.elements['membersIn'].text
			end
			if xml_element.elements['nameOrReferenceIdStartsWith'] != nil
				self.name_or_reference_id_starts_with = xml_element.elements['nameOrReferenceIdStartsWith'].text
			end
			if xml_element.elements['managerEqual'] != nil
				self.manager_equal = xml_element.elements['managerEqual'].text
			end
			if xml_element.elements['memberEqual'] != nil
				self.member_equal = xml_element.elements['memberEqual'].text
			end
			if xml_element.elements['fullNameStartsWithIn'] != nil
				self.full_name_starts_with_in = xml_element.elements['fullNameStartsWithIn'].text
			end
			if xml_element.elements['ancestorIdIn'] != nil
				self.ancestor_id_in = xml_element.elements['ancestorIdIn'].text
			end
			if xml_element.elements['idOrInheritedParentIdIn'] != nil
				self.id_or_inherited_parent_id_in = xml_element.elements['idOrInheritedParentIdIn'].text
			end
		end

	end

	class KalturaConstantXsltSyndicationFeed < KalturaGenericXsltSyndicationFeed


		def from_xml(xml_element)
			super
		end

	end

	class KalturaConversionProfileFilter < KalturaConversionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaConversionProfileAssetParamsFilter < KalturaConversionProfileAssetParamsBaseFilter
		attr_accessor :conversion_profile_id_filter
		attr_accessor :asset_params_id_filter


		def from_xml(xml_element)
			super
			if xml_element.elements['conversionProfileIdFilter'] != nil
				self.conversion_profile_id_filter = KalturaClientBase.object_from_xml(xml_element.elements['conversionProfileIdFilter'], 'KalturaConversionProfileFilter')
			end
			if xml_element.elements['assetParamsIdFilter'] != nil
				self.asset_params_id_filter = KalturaClientBase.object_from_xml(xml_element.elements['assetParamsIdFilter'], 'KalturaAssetParamsFilter')
			end
		end

	end

	# Represents the current request country context as calculated based on the IP address
	class KalturaCoordinatesContextField < KalturaStringField
		# The ip geo coder engine to be used
		attr_accessor :geo_coder_type


		def from_xml(xml_element)
			super
			if xml_element.elements['geoCoderType'] != nil
				self.geo_coder_type = xml_element.elements['geoCoderType'].text
			end
		end

	end

	# Represents the current request country context as calculated based on the IP address
	class KalturaCountryContextField < KalturaStringField
		# The ip geo coder engine to be used
		attr_accessor :geo_coder_type


		def from_xml(xml_element)
			super
			if xml_element.elements['geoCoderType'] != nil
				self.geo_coder_type = xml_element.elements['geoCoderType'].text
			end
		end

	end

	# Auto-generated class.
	#  Used to search KalturaDataEntry attributes. Use KalturaDataEntryCompareAttribute enum to provide attribute name.
	# /
	class KalturaDataEntryCompareAttributeCondition < KalturaSearchComparableAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	# Auto-generated class.
	#  Used to search KalturaDataEntry attributes. Use KalturaDataEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaDataEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	class KalturaDeliveryProfileAkamaiAppleHttpManifestBaseFilter < KalturaDeliveryProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileAkamaiHdsBaseFilter < KalturaDeliveryProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileAkamaiHttpBaseFilter < KalturaDeliveryProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileGenericAppleHttpBaseFilter < KalturaDeliveryProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileGenericHdsBaseFilter < KalturaDeliveryProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileGenericHttpBaseFilter < KalturaDeliveryProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileGenericSilverLightBaseFilter < KalturaDeliveryProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileLiveAppleHttpBaseFilter < KalturaDeliveryProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileRtmpBaseFilter < KalturaDeliveryProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryServerNodeBaseFilter < KalturaServerNodeFilter


		def from_xml(xml_element)
			super
		end

	end

	# Auto-generated class.
	#  Used to search KalturaDocumentEntry attributes. Use KalturaDocumentEntryCompareAttribute enum to provide attribute name.
	# /
	class KalturaDocumentEntryCompareAttributeCondition < KalturaSearchComparableAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	# Auto-generated class.
	#  Used to search KalturaDocumentEntry attributes. Use KalturaDocumentEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaDocumentEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	# Evaluates PHP statement, depends on the execution context
	class KalturaEvalBooleanField < KalturaBooleanField
		# PHP code
		attr_accessor :code


		def from_xml(xml_element)
			super
			if xml_element.elements['code'] != nil
				self.code = xml_element.elements['code'].text
			end
		end

	end

	# Evaluates PHP statement, depends on the execution context
	class KalturaEvalStringField < KalturaStringField
		# PHP code
		attr_accessor :code


		def from_xml(xml_element)
			super
			if xml_element.elements['code'] != nil
				self.code = xml_element.elements['code'].text
			end
		end

	end

	# Auto-generated class.
	#  Used to search KalturaExternalMediaEntry attributes. Use KalturaExternalMediaEntryCompareAttribute enum to provide attribute name.
	# /
	class KalturaExternalMediaEntryCompareAttributeCondition < KalturaSearchComparableAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	# Auto-generated class.
	#  Used to search KalturaExternalMediaEntry attributes. Use KalturaExternalMediaEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaExternalMediaEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	class KalturaFileAssetFilter < KalturaFileAssetBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaGenericDataCenterContentResource < KalturaDataCenterContentResource


		def from_xml(xml_element)
			super
		end

	end

	class KalturaGenericSyndicationFeedBaseFilter < KalturaBaseSyndicationFeedFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaGoogleVideoSyndicationFeedBaseFilter < KalturaBaseSyndicationFeedFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaGroupUserFilter < KalturaGroupUserBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaITunesSyndicationFeedBaseFilter < KalturaBaseSyndicationFeedFilter


		def from_xml(xml_element)
			super
		end

	end

	# Represents the current request IP address context
	class KalturaIpAddressContextField < KalturaStringField


		def from_xml(xml_element)
			super
		end

	end

	# Auto-generated class.
	#  Used to search KalturaLiveChannel attributes. Use KalturaLiveChannelCompareAttribute enum to provide attribute name.
	# /
	class KalturaLiveChannelCompareAttributeCondition < KalturaSearchComparableAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	# Auto-generated class.
	#  Used to search KalturaLiveChannel attributes. Use KalturaLiveChannelMatchAttribute enum to provide attribute name.
	# /
	class KalturaLiveChannelMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	class KalturaLiveChannelSegmentFilter < KalturaLiveChannelSegmentBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	# Auto-generated class.
	#  Used to search KalturaLiveEntry attributes. Use KalturaLiveEntryCompareAttribute enum to provide attribute name.
	# /
	class KalturaLiveEntryCompareAttributeCondition < KalturaSearchComparableAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	# Auto-generated class.
	#  Used to search KalturaLiveEntry attributes. Use KalturaLiveEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaLiveEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	class KalturaLiveEntryServerNodeBaseFilter < KalturaEntryServerNodeFilter


		def from_xml(xml_element)
			super
		end

	end

	# Auto-generated class.
	#  Used to search KalturaLiveStreamAdminEntry attributes. Use KalturaLiveStreamAdminEntryCompareAttribute enum to provide attribute name.
	# /
	class KalturaLiveStreamAdminEntryCompareAttributeCondition < KalturaSearchComparableAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	# Auto-generated class.
	#  Used to search KalturaLiveStreamAdminEntry attributes. Use KalturaLiveStreamAdminEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaLiveStreamAdminEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	# Auto-generated class.
	#  Used to search KalturaLiveStreamEntry attributes. Use KalturaLiveStreamEntryCompareAttribute enum to provide attribute name.
	# /
	class KalturaLiveStreamEntryCompareAttributeCondition < KalturaSearchComparableAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	# Auto-generated class.
	#  Used to search KalturaLiveStreamEntry attributes. Use KalturaLiveStreamEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaLiveStreamEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	# Auto-generated class.
	#  Used to search KalturaMediaEntry attributes. Use KalturaMediaEntryCompareAttribute enum to provide attribute name.
	# /
	class KalturaMediaEntryCompareAttributeCondition < KalturaSearchComparableAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	# Auto-generated class.
	#  Used to search KalturaMediaEntry attributes. Use KalturaMediaEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaMediaEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	class KalturaMediaFlavorParamsOutput < KalturaFlavorParamsOutput


		def from_xml(xml_element)
			super
		end

	end

	# Auto-generated class.
	#  Used to search KalturaMixEntry attributes. Use KalturaMixEntryCompareAttribute enum to provide attribute name.
	# /
	class KalturaMixEntryCompareAttributeCondition < KalturaSearchComparableAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	# Auto-generated class.
	#  Used to search KalturaMixEntry attributes. Use KalturaMixEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaMixEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	# Evaluates object ID according to given context
	class KalturaObjectIdField < KalturaStringField


		def from_xml(xml_element)
			super
		end

	end

	class KalturaPermissionFilter < KalturaPermissionBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaPermissionItemFilter < KalturaPermissionItemBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	# Auto-generated class.
	#  Used to search KalturaPlayableEntry attributes. Use KalturaPlayableEntryCompareAttribute enum to provide attribute name.
	# /
	class KalturaPlayableEntryCompareAttributeCondition < KalturaSearchComparableAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	# Auto-generated class.
	#  Used to search KalturaPlayableEntry attributes. Use KalturaPlayableEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaPlayableEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	# Auto-generated class.
	#  Used to search KalturaPlaylist attributes. Use KalturaPlaylistCompareAttribute enum to provide attribute name.
	# /
	class KalturaPlaylistCompareAttributeCondition < KalturaSearchComparableAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	# Auto-generated class.
	#  Used to search KalturaPlaylist attributes. Use KalturaPlaylistMatchAttribute enum to provide attribute name.
	# /
	class KalturaPlaylistMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			if xml_element.elements['attribute'] != nil
				self.attribute = xml_element.elements['attribute'].text
			end
		end

	end

	# Used to ingest media that is available on remote SSH server and accessible using the supplied URL, media file will be downloaded using import job in order to make the asset ready.
	class KalturaSshUrlResource < KalturaUrlResource
		# SSH private key
		attr_accessor :private_key
		# SSH public key
		attr_accessor :public_key
		# Passphrase for SSH keys
		attr_accessor :key_passphrase


		def from_xml(xml_element)
			super
			if xml_element.elements['privateKey'] != nil
				self.private_key = xml_element.elements['privateKey'].text
			end
			if xml_element.elements['publicKey'] != nil
				self.public_key = xml_element.elements['publicKey'].text
			end
			if xml_element.elements['keyPassphrase'] != nil
				self.key_passphrase = xml_element.elements['keyPassphrase'].text
			end
		end

	end

	# Represents the current time context on Kaltura servers
	class KalturaTimeContextField < KalturaIntegerField
		# Time offset in seconds since current time
		attr_accessor :offset

		def offset=(val)
			@offset = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['offset'] != nil
				self.offset = xml_element.elements['offset'].text
			end
		end

	end

	class KalturaTubeMogulSyndicationFeedBaseFilter < KalturaBaseSyndicationFeedFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUserAgentCondition < KalturaRegexCondition


		def from_xml(xml_element)
			super
		end

	end

	# Represents the current request user agent context
	class KalturaUserAgentContextField < KalturaStringField


		def from_xml(xml_element)
			super
		end

	end

	# Represents the current session user e-mail address context
	class KalturaUserEmailContextField < KalturaStringField


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUserEntryFilter < KalturaUserEntryBaseFilter
		attr_accessor :user_id_equal_current
		attr_accessor :is_anonymous
		attr_accessor :privacy_context_equal
		attr_accessor :privacy_context_in

		def user_id_equal_current=(val)
			@user_id_equal_current = val.to_i
		end
		def is_anonymous=(val)
			@is_anonymous = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['userIdEqualCurrent'] != nil
				self.user_id_equal_current = xml_element.elements['userIdEqualCurrent'].text
			end
			if xml_element.elements['isAnonymous'] != nil
				self.is_anonymous = xml_element.elements['isAnonymous'].text
			end
			if xml_element.elements['privacyContextEqual'] != nil
				self.privacy_context_equal = xml_element.elements['privacyContextEqual'].text
			end
			if xml_element.elements['privacyContextIn'] != nil
				self.privacy_context_in = xml_element.elements['privacyContextIn'].text
			end
		end

	end

	class KalturaUserLoginDataFilter < KalturaUserLoginDataBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUserRoleFilter < KalturaUserRoleBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	# Used to ingest media that streamed to the system and represented by token that returned from media server such as FMS or red5.
	class KalturaWebcamTokenResource < KalturaDataCenterContentResource
		# Token that returned from media server such as FMS or red5.
		attr_accessor :token


		def from_xml(xml_element)
			super
			if xml_element.elements['token'] != nil
				self.token = xml_element.elements['token'].text
			end
		end

	end

	class KalturaYahooSyndicationFeedBaseFilter < KalturaBaseSyndicationFeedFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAdminUserBaseFilter < KalturaUserFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAmazonS3StorageProfileFilter < KalturaAmazonS3StorageProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaApiActionPermissionItemBaseFilter < KalturaPermissionItemFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaApiParameterPermissionItemBaseFilter < KalturaPermissionItemFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAssetParamsOutputBaseFilter < KalturaAssetParamsFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDataEntryBaseFilter < KalturaBaseEntryFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileAkamaiAppleHttpManifestFilter < KalturaDeliveryProfileAkamaiAppleHttpManifestBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileAkamaiHdsFilter < KalturaDeliveryProfileAkamaiHdsBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileAkamaiHttpFilter < KalturaDeliveryProfileAkamaiHttpBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileGenericAppleHttpFilter < KalturaDeliveryProfileGenericAppleHttpBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileGenericHdsFilter < KalturaDeliveryProfileGenericHdsBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileGenericHttpFilter < KalturaDeliveryProfileGenericHttpBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileGenericSilverLightFilter < KalturaDeliveryProfileGenericSilverLightBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileLiveAppleHttpFilter < KalturaDeliveryProfileLiveAppleHttpBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileRtmpFilter < KalturaDeliveryProfileRtmpBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryServerNodeFilter < KalturaDeliveryServerNodeBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFlavorAssetBaseFilter < KalturaAssetFilter
		attr_accessor :flavor_params_id_equal
		attr_accessor :flavor_params_id_in
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :status_not_in

		def flavor_params_id_equal=(val)
			@flavor_params_id_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['flavorParamsIdEqual'] != nil
				self.flavor_params_id_equal = xml_element.elements['flavorParamsIdEqual'].text
			end
			if xml_element.elements['flavorParamsIdIn'] != nil
				self.flavor_params_id_in = xml_element.elements['flavorParamsIdIn'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['statusNotIn'] != nil
				self.status_not_in = xml_element.elements['statusNotIn'].text
			end
		end

	end

	class KalturaFlavorParamsBaseFilter < KalturaAssetParamsFilter
		attr_accessor :format_equal


		def from_xml(xml_element)
			super
			if xml_element.elements['formatEqual'] != nil
				self.format_equal = xml_element.elements['formatEqual'].text
			end
		end

	end

	class KalturaGenericSyndicationFeedFilter < KalturaGenericSyndicationFeedBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaGoogleVideoSyndicationFeedFilter < KalturaGoogleVideoSyndicationFeedBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaITunesSyndicationFeedFilter < KalturaITunesSyndicationFeedBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaLiveEntryServerNodeFilter < KalturaLiveEntryServerNodeBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaOperaSyndicationFeed < KalturaConstantXsltSyndicationFeed


		def from_xml(xml_element)
			super
		end

	end

	class KalturaPlaylistBaseFilter < KalturaBaseEntryFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaQuizUserEntryBaseFilter < KalturaUserEntryFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaRokuSyndicationFeed < KalturaConstantXsltSyndicationFeed


		def from_xml(xml_element)
			super
		end

	end

	# Used to ingest media file that is already accessible on the shared disc.
	class KalturaServerFileResource < KalturaGenericDataCenterContentResource
		# Full path to the local file
		attr_accessor :local_file_path
		# Should keep original file (false = mv, true = cp)
		attr_accessor :keep_original_file

		def keep_original_file=(val)
			@keep_original_file = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['localFilePath'] != nil
				self.local_file_path = xml_element.elements['localFilePath'].text
			end
			if xml_element.elements['keepOriginalFile'] != nil
				self.keep_original_file = xml_element.elements['keepOriginalFile'].text
			end
		end

	end

	class KalturaThumbAssetBaseFilter < KalturaAssetFilter
		attr_accessor :thumb_params_id_equal
		attr_accessor :thumb_params_id_in
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :status_not_in

		def thumb_params_id_equal=(val)
			@thumb_params_id_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['thumbParamsIdEqual'] != nil
				self.thumb_params_id_equal = xml_element.elements['thumbParamsIdEqual'].text
			end
			if xml_element.elements['thumbParamsIdIn'] != nil
				self.thumb_params_id_in = xml_element.elements['thumbParamsIdIn'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['statusNotIn'] != nil
				self.status_not_in = xml_element.elements['statusNotIn'].text
			end
		end

	end

	class KalturaThumbParamsBaseFilter < KalturaAssetParamsFilter
		attr_accessor :format_equal


		def from_xml(xml_element)
			super
			if xml_element.elements['formatEqual'] != nil
				self.format_equal = xml_element.elements['formatEqual'].text
			end
		end

	end

	class KalturaTubeMogulSyndicationFeedFilter < KalturaTubeMogulSyndicationFeedBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	# Used to ingest media that uploaded to the system and represented by token that returned from upload.upload action or uploadToken.add action.
	class KalturaUploadedFileTokenResource < KalturaGenericDataCenterContentResource
		# Token that returned from upload.upload action or uploadToken.add action.
		attr_accessor :token


		def from_xml(xml_element)
			super
			if xml_element.elements['token'] != nil
				self.token = xml_element.elements['token'].text
			end
		end

	end

	class KalturaYahooSyndicationFeedFilter < KalturaYahooSyndicationFeedBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAdminUserFilter < KalturaAdminUserBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaApiActionPermissionItemFilter < KalturaApiActionPermissionItemBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaApiParameterPermissionItemFilter < KalturaApiParameterPermissionItemBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAssetParamsOutputFilter < KalturaAssetParamsOutputBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDataEntryFilter < KalturaDataEntryBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileGenericRtmpBaseFilter < KalturaDeliveryProfileRtmpFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaEdgeServerNodeBaseFilter < KalturaDeliveryServerNodeFilter
		attr_accessor :playback_domain_like
		attr_accessor :playback_domain_multi_like_or
		attr_accessor :playback_domain_multi_like_and


		def from_xml(xml_element)
			super
			if xml_element.elements['playbackDomainLike'] != nil
				self.playback_domain_like = xml_element.elements['playbackDomainLike'].text
			end
			if xml_element.elements['playbackDomainMultiLikeOr'] != nil
				self.playback_domain_multi_like_or = xml_element.elements['playbackDomainMultiLikeOr'].text
			end
			if xml_element.elements['playbackDomainMultiLikeAnd'] != nil
				self.playback_domain_multi_like_and = xml_element.elements['playbackDomainMultiLikeAnd'].text
			end
		end

	end

	class KalturaFlavorAssetFilter < KalturaFlavorAssetBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFlavorParamsFilter < KalturaFlavorParamsBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaGenericXsltSyndicationFeedBaseFilter < KalturaGenericSyndicationFeedFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaLiveStreamAdminEntry < KalturaLiveStreamEntry


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMediaServerNodeBaseFilter < KalturaDeliveryServerNodeFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaPlaylistFilter < KalturaPlaylistBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaThumbAssetFilter < KalturaThumbAssetBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaThumbParamsFilter < KalturaThumbParamsBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileGenericRtmpFilter < KalturaDeliveryProfileGenericRtmpBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaEdgeServerNodeFilter < KalturaEdgeServerNodeBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFlavorParamsOutputBaseFilter < KalturaFlavorParamsFilter
		attr_accessor :flavor_params_id_equal
		attr_accessor :flavor_params_version_equal
		attr_accessor :flavor_asset_id_equal
		attr_accessor :flavor_asset_version_equal

		def flavor_params_id_equal=(val)
			@flavor_params_id_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['flavorParamsIdEqual'] != nil
				self.flavor_params_id_equal = xml_element.elements['flavorParamsIdEqual'].text
			end
			if xml_element.elements['flavorParamsVersionEqual'] != nil
				self.flavor_params_version_equal = xml_element.elements['flavorParamsVersionEqual'].text
			end
			if xml_element.elements['flavorAssetIdEqual'] != nil
				self.flavor_asset_id_equal = xml_element.elements['flavorAssetIdEqual'].text
			end
			if xml_element.elements['flavorAssetVersionEqual'] != nil
				self.flavor_asset_version_equal = xml_element.elements['flavorAssetVersionEqual'].text
			end
		end

	end

	class KalturaGenericXsltSyndicationFeedFilter < KalturaGenericXsltSyndicationFeedBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaLiveAssetBaseFilter < KalturaFlavorAssetFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaLiveParamsBaseFilter < KalturaFlavorParamsFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMediaFlavorParamsBaseFilter < KalturaFlavorParamsFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMediaServerNodeFilter < KalturaMediaServerNodeBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMixEntryBaseFilter < KalturaPlayableEntryFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaThumbParamsOutputBaseFilter < KalturaThumbParamsFilter
		attr_accessor :thumb_params_id_equal
		attr_accessor :thumb_params_version_equal
		attr_accessor :thumb_asset_id_equal
		attr_accessor :thumb_asset_version_equal

		def thumb_params_id_equal=(val)
			@thumb_params_id_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['thumbParamsIdEqual'] != nil
				self.thumb_params_id_equal = xml_element.elements['thumbParamsIdEqual'].text
			end
			if xml_element.elements['thumbParamsVersionEqual'] != nil
				self.thumb_params_version_equal = xml_element.elements['thumbParamsVersionEqual'].text
			end
			if xml_element.elements['thumbAssetIdEqual'] != nil
				self.thumb_asset_id_equal = xml_element.elements['thumbAssetIdEqual'].text
			end
			if xml_element.elements['thumbAssetVersionEqual'] != nil
				self.thumb_asset_version_equal = xml_element.elements['thumbAssetVersionEqual'].text
			end
		end

	end

	class KalturaFlavorParamsOutputFilter < KalturaFlavorParamsOutputBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaLiveAssetFilter < KalturaLiveAssetBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaLiveParamsFilter < KalturaLiveParamsBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMediaFlavorParamsFilter < KalturaMediaFlavorParamsBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMixEntryFilter < KalturaMixEntryBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaThumbParamsOutputFilter < KalturaThumbParamsOutputBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaLiveEntryBaseFilter < KalturaMediaEntryFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMediaFlavorParamsOutputBaseFilter < KalturaFlavorParamsOutputFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaLiveEntryFilter < KalturaLiveEntryBaseFilter
		attr_accessor :is_live
		attr_accessor :is_recorded_entry_id_empty
		attr_accessor :has_media_server_hostname

		def is_live=(val)
			@is_live = val.to_i
		end
		def is_recorded_entry_id_empty=(val)
			@is_recorded_entry_id_empty = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['isLive'] != nil
				self.is_live = xml_element.elements['isLive'].text
			end
			if xml_element.elements['isRecordedEntryIdEmpty'] != nil
				self.is_recorded_entry_id_empty = xml_element.elements['isRecordedEntryIdEmpty'].text
			end
			if xml_element.elements['hasMediaServerHostname'] != nil
				self.has_media_server_hostname = xml_element.elements['hasMediaServerHostname'].text
			end
		end

	end

	class KalturaMediaFlavorParamsOutputFilter < KalturaMediaFlavorParamsOutputBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaLiveChannelBaseFilter < KalturaLiveEntryFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaLiveStreamEntryBaseFilter < KalturaLiveEntryFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaLiveChannelFilter < KalturaLiveChannelBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaLiveStreamEntryFilter < KalturaLiveStreamEntryBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaLiveStreamAdminEntryBaseFilter < KalturaLiveStreamEntryFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaLiveStreamAdminEntryFilter < KalturaLiveStreamAdminEntryBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
