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
# Copyright (C) 2006-2016  Kaltura Inc.
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
			self.total_count = xml_element.elements['totalCount'].text
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
			self.id = xml_element.elements['id'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.name = xml_element.elements['name'].text
			self.system_name = xml_element.elements['systemName'].text
			self.description = xml_element.elements['description'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.is_default = xml_element.elements['isDefault'].text
			self.restrictions = KalturaClientBase.object_from_xml(xml_element.elements['restrictions'], 'KalturaBaseRestriction')
			self.contains_unsuported_restrictions = xml_element.elements['containsUnsuportedRestrictions'].text
		end

	end

	class KalturaContextTypeHolder < KalturaObjectBase
		# The type of the condition context
		attr_accessor :type


		def from_xml(xml_element)
			super
			self.type = xml_element.elements['type'].text
		end

	end

	class KalturaAccessControlContextTypeHolder < KalturaContextTypeHolder


		def from_xml(xml_element)
			super
		end

	end

	class KalturaRuleAction < KalturaObjectBase
		# The type of the action
		attr_accessor :type


		def from_xml(xml_element)
			super
			self.type = xml_element.elements['type'].text
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
			self.type = xml_element.elements['type'].text
			self.description = xml_element.elements['description'].text
			self.not = xml_element.elements['not'].text
		end

	end

	class KalturaRule < KalturaObjectBase
		# Short Rule Description
		attr_accessor :description
		# Rule Custom Data to allow saving rule specific information
		attr_accessor :rule_data
		# Message to be thrown to the player in case the rule is fulfilled
		attr_accessor :message
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
			self.description = xml_element.elements['description'].text
			self.rule_data = xml_element.elements['ruleData'].text
			self.message = xml_element.elements['message'].text
			self.actions = KalturaClientBase.object_from_xml(xml_element.elements['actions'], 'KalturaRuleAction')
			self.conditions = KalturaClientBase.object_from_xml(xml_element.elements['conditions'], 'KalturaCondition')
			self.contexts = KalturaClientBase.object_from_xml(xml_element.elements['contexts'], 'KalturaContextTypeHolder')
			self.stop_processing = xml_element.elements['stopProcessing'].text
			self.force_admin_validation = xml_element.elements['forceAdminValidation'].text
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
			self.id = xml_element.elements['id'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.name = xml_element.elements['name'].text
			self.system_name = xml_element.elements['systemName'].text
			self.description = xml_element.elements['description'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.is_default = xml_element.elements['isDefault'].text
			self.rules = KalturaClientBase.object_from_xml(xml_element.elements['rules'], 'KalturaRule')
		end

	end

	# A key value pair representation to return an array of key-value pairs (associative array)
	class KalturaKeyValue < KalturaObjectBase
		attr_accessor :key
		attr_accessor :value


		def from_xml(xml_element)
			super
			self.key = xml_element.elements['key'].text
			self.value = xml_element.elements['value'].text
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
			self.referrer = xml_element.elements['referrer'].text
			self.ip = xml_element.elements['ip'].text
			self.ks = xml_element.elements['ks'].text
			self.user_agent = xml_element.elements['userAgent'].text
			self.time = xml_element.elements['time'].text
			self.contexts = KalturaClientBase.object_from_xml(xml_element.elements['contexts'], 'KalturaAccessControlContextTypeHolder')
			self.hashes = KalturaClientBase.object_from_xml(xml_element.elements['hashes'], 'KalturaKeyValue')
		end

	end

	class KalturaReportFilter < KalturaObjectBase
		# The dimension whose values should be filtered
		attr_accessor :dimension
		# The (comma separated) values to include in the filter
		attr_accessor :values


		def from_xml(xml_element)
			super
			self.dimension = xml_element.elements['dimension'].text
			self.values = xml_element.elements['values'].text
		end

	end

	class KalturaAnalyticsFilter < KalturaObjectBase
		# Query start time (in local time)
		attr_accessor :from_time
		# Query end time (in local time)
		attr_accessor :to_time
		# Comma separated metrics list
		attr_accessor :metrics
		# Timezone offset from UTC (in minutes)
		attr_accessor :utc_offset
		# Comma separated dimensions list
		attr_accessor :dimensions
		# Array of filters
		attr_accessor :filters

		def utc_offset=(val)
			@utc_offset = val.to_f
		end

		def from_xml(xml_element)
			super
			self.from_time = xml_element.elements['from_time'].text
			self.to_time = xml_element.elements['to_time'].text
			self.metrics = xml_element.elements['metrics'].text
			self.utc_offset = xml_element.elements['utcOffset'].text
			self.dimensions = xml_element.elements['dimensions'].text
			self.filters = KalturaClientBase.object_from_xml(xml_element.elements['filters'], 'KalturaReportFilter')
		end

	end

	class KalturaApiExceptionArg < KalturaObjectBase
		attr_accessor :name
		attr_accessor :value


		def from_xml(xml_element)
			super
			self.name = xml_element.elements['name'].text
			self.value = xml_element.elements['value'].text
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
			self.id = xml_element.elements['id'].text
			self.token = xml_element.elements['token'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.status = xml_element.elements['status'].text
			self.expiry = xml_element.elements['expiry'].text
			self.session_type = xml_element.elements['sessionType'].text
			self.session_user_id = xml_element.elements['sessionUserId'].text
			self.session_duration = xml_element.elements['sessionDuration'].text
			self.session_privileges = xml_element.elements['sessionPrivileges'].text
			self.hash_type = xml_element.elements['hashType'].text
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
			self.id = xml_element.elements['id'].text
			self.entry_id = xml_element.elements['entryId'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.version = xml_element.elements['version'].text
			self.size = xml_element.elements['size'].text
			self.tags = xml_element.elements['tags'].text
			self.file_ext = xml_element.elements['fileExt'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.deleted_at = xml_element.elements['deletedAt'].text
			self.description = xml_element.elements['description'].text
			self.partner_data = xml_element.elements['partnerData'].text
			self.partner_description = xml_element.elements['partnerDescription'].text
			self.actual_source_asset_params_ids = xml_element.elements['actualSourceAssetParamsIds'].text
		end

	end

	# A string representation to return an array of strings
	class KalturaString < KalturaObjectBase
		attr_accessor :value


		def from_xml(xml_element)
			super
			self.value = xml_element.elements['value'].text
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
			self.id = xml_element.elements['id'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.name = xml_element.elements['name'].text
			self.system_name = xml_element.elements['systemName'].text
			self.description = xml_element.elements['description'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.is_system_default = xml_element.elements['isSystemDefault'].text
			self.tags = xml_element.elements['tags'].text
			self.required_permissions = KalturaClientBase.object_from_xml(xml_element.elements['requiredPermissions'], 'KalturaString')
			self.source_remote_storage_profile_id = xml_element.elements['sourceRemoteStorageProfileId'].text
			self.remote_storage_profile_ids = xml_element.elements['remoteStorageProfileIds'].text
			self.media_parser_type = xml_element.elements['mediaParserType'].text
			self.source_asset_params_ids = xml_element.elements['sourceAssetParamsIds'].text
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
			self.resource = KalturaClientBase.object_from_xml(xml_element.elements['resource'], 'KalturaContentResource')
			self.asset_params_id = xml_element.elements['assetParamsId'].text
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
		# list of user ids that are entitled to edit the entry (no server enforcement) The difference between entitledUsersEdit and entitledUsersPublish is applicative only
		attr_accessor :entitled_users_edit
		# list of user ids that are entitled to publish the entry (no server enforcement) The difference between entitledUsersEdit and entitledUsersPublish is applicative only
		attr_accessor :entitled_users_publish
		# Comma seperated string of the capabilities of the entry. Any capability needed can be added to this list.
		attr_accessor :capabilities
		# Template entry id
		attr_accessor :template_entry_id

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

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.name = xml_element.elements['name'].text
			self.description = xml_element.elements['description'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.user_id = xml_element.elements['userId'].text
			self.creator_id = xml_element.elements['creatorId'].text
			self.tags = xml_element.elements['tags'].text
			self.admin_tags = xml_element.elements['adminTags'].text
			self.categories = xml_element.elements['categories'].text
			self.categories_ids = xml_element.elements['categoriesIds'].text
			self.status = xml_element.elements['status'].text
			self.moderation_status = xml_element.elements['moderationStatus'].text
			self.moderation_count = xml_element.elements['moderationCount'].text
			self.type = xml_element.elements['type'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.rank = xml_element.elements['rank'].text
			self.total_rank = xml_element.elements['totalRank'].text
			self.votes = xml_element.elements['votes'].text
			self.group_id = xml_element.elements['groupId'].text
			self.partner_data = xml_element.elements['partnerData'].text
			self.download_url = xml_element.elements['downloadUrl'].text
			self.search_text = xml_element.elements['searchText'].text
			self.license_type = xml_element.elements['licenseType'].text
			self.version = xml_element.elements['version'].text
			self.thumbnail_url = xml_element.elements['thumbnailUrl'].text
			self.access_control_id = xml_element.elements['accessControlId'].text
			self.start_date = xml_element.elements['startDate'].text
			self.end_date = xml_element.elements['endDate'].text
			self.reference_id = xml_element.elements['referenceId'].text
			self.replacing_entry_id = xml_element.elements['replacingEntryId'].text
			self.replaced_entry_id = xml_element.elements['replacedEntryId'].text
			self.replacement_status = xml_element.elements['replacementStatus'].text
			self.partner_sort_value = xml_element.elements['partnerSortValue'].text
			self.conversion_profile_id = xml_element.elements['conversionProfileId'].text
			self.redirect_entry_id = xml_element.elements['redirectEntryId'].text
			self.root_entry_id = xml_element.elements['rootEntryId'].text
			self.parent_entry_id = xml_element.elements['parentEntryId'].text
			self.operation_attributes = KalturaClientBase.object_from_xml(xml_element.elements['operationAttributes'], 'KalturaOperationAttributes')
			self.entitled_users_edit = xml_element.elements['entitledUsersEdit'].text
			self.entitled_users_publish = xml_element.elements['entitledUsersPublish'].text
			self.capabilities = xml_element.elements['capabilities'].text
			self.template_entry_id = xml_element.elements['templateEntryId'].text
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
			self.id = xml_element.elements['id'].text
			self.feed_url = xml_element.elements['feedUrl'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.playlist_id = xml_element.elements['playlistId'].text
			self.name = xml_element.elements['name'].text
			self.status = xml_element.elements['status'].text
			self.type = xml_element.elements['type'].text
			self.landing_page = xml_element.elements['landingPage'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.allow_embed = xml_element.elements['allowEmbed'].text
			self.player_uiconf_id = xml_element.elements['playerUiconfId'].text
			self.flavor_param_id = xml_element.elements['flavorParamId'].text
			self.transcode_existing_content = xml_element.elements['transcodeExistingContent'].text
			self.add_to_default_conversion_profile = xml_element.elements['addToDefaultConversionProfile'].text
			self.categories = xml_element.elements['categories'].text
			self.storage_id = xml_element.elements['storageId'].text
			self.entries_order_by = xml_element.elements['entriesOrderBy'].text
			self.enforce_entitlement = xml_element.elements['enforceEntitlement'].text
			self.privacy_context = xml_element.elements['privacyContext'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.use_category_entries = xml_element.elements['useCategoryEntries'].text
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
			self.scheduler_id = xml_element.elements['schedulerId'].text
			self.worker_id = xml_element.elements['workerId'].text
			self.batch_index = xml_element.elements['batchIndex'].text
			self.time_stamp = xml_element.elements['timeStamp'].text
			self.message = xml_element.elements['message'].text
			self.err_type = xml_element.elements['errType'].text
			self.err_number = xml_element.elements['errNumber'].text
			self.host_name = xml_element.elements['hostName'].text
			self.session_id = xml_element.elements['sessionId'].text
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
			self.id = xml_element.elements['id'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.deleted_at = xml_element.elements['deletedAt'].text
			self.lock_expiration = xml_element.elements['lockExpiration'].text
			self.execution_attempts = xml_element.elements['executionAttempts'].text
			self.lock_version = xml_element.elements['lockVersion'].text
			self.entry_id = xml_element.elements['entryId'].text
			self.entry_name = xml_element.elements['entryName'].text
			self.job_type = xml_element.elements['jobType'].text
			self.job_sub_type = xml_element.elements['jobSubType'].text
			self.data = KalturaClientBase.object_from_xml(xml_element.elements['data'], 'KalturaJobData')
			self.status = xml_element.elements['status'].text
			self.abort = xml_element.elements['abort'].text
			self.check_again_timeout = xml_element.elements['checkAgainTimeout'].text
			self.message = xml_element.elements['message'].text
			self.description = xml_element.elements['description'].text
			self.priority = xml_element.elements['priority'].text
			self.history = KalturaClientBase.object_from_xml(xml_element.elements['history'], 'KalturaBatchHistoryData')
			self.bulk_job_id = xml_element.elements['bulkJobId'].text
			self.batch_version = xml_element.elements['batchVersion'].text
			self.parent_job_id = xml_element.elements['parentJobId'].text
			self.root_job_id = xml_element.elements['rootJobId'].text
			self.queue_time = xml_element.elements['queueTime'].text
			self.finish_time = xml_element.elements['finishTime'].text
			self.err_type = xml_element.elements['errType'].text
			self.err_number = xml_element.elements['errNumber'].text
			self.estimated_effort = xml_element.elements['estimatedEffort'].text
			self.urgency = xml_element.elements['urgency'].text
			self.scheduler_id = xml_element.elements['schedulerId'].text
			self.worker_id = xml_element.elements['workerId'].text
			self.batch_index = xml_element.elements['batchIndex'].text
			self.last_scheduler_id = xml_element.elements['lastSchedulerId'].text
			self.last_worker_id = xml_element.elements['lastWorkerId'].text
			self.dc = xml_element.elements['dc'].text
			self.job_object_id = xml_element.elements['jobObjectId'].text
			self.job_object_type = xml_element.elements['jobObjectType'].text
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
			self.id = xml_element.elements['id'].text
			self.label = xml_element.elements['label'].text
			self.flashvars = KalturaClientBase.object_from_xml(xml_element.elements['flashvars'], 'KalturaKeyValue')
			self.min_version = xml_element.elements['minVersion'].text
			self.enabled_by_default = xml_element.elements['enabledByDefault'].text
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
			self.id = xml_element.elements['id'].text
			self.label = xml_element.elements['label'].text
			self.entry_only = xml_element.elements['entryOnly'].text
			self.min_version = xml_element.elements['minVersion'].text
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

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.name = xml_element.elements['name'].text
			self.website = xml_element.elements['website'].text
			self.notification_url = xml_element.elements['notificationUrl'].text
			self.appear_in_search = xml_element.elements['appearInSearch'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.admin_name = xml_element.elements['adminName'].text
			self.admin_email = xml_element.elements['adminEmail'].text
			self.description = xml_element.elements['description'].text
			self.commercial_use = xml_element.elements['commercialUse'].text
			self.landing_page = xml_element.elements['landingPage'].text
			self.user_landing_page = xml_element.elements['userLandingPage'].text
			self.content_categories = xml_element.elements['contentCategories'].text
			self.type = xml_element.elements['type'].text
			self.phone = xml_element.elements['phone'].text
			self.describe_yourself = xml_element.elements['describeYourself'].text
			self.adult_content = xml_element.elements['adultContent'].text
			self.def_conversion_profile_type = xml_element.elements['defConversionProfileType'].text
			self.notify = xml_element.elements['notify'].text
			self.status = xml_element.elements['status'].text
			self.allow_quick_edit = xml_element.elements['allowQuickEdit'].text
			self.merge_entry_lists = xml_element.elements['mergeEntryLists'].text
			self.notifications_config = xml_element.elements['notificationsConfig'].text
			self.max_upload_size = xml_element.elements['maxUploadSize'].text
			self.partner_package = xml_element.elements['partnerPackage'].text
			self.secret = xml_element.elements['secret'].text
			self.admin_secret = xml_element.elements['adminSecret'].text
			self.cms_password = xml_element.elements['cmsPassword'].text
			self.allow_multi_notification = xml_element.elements['allowMultiNotification'].text
			self.admin_login_users_quota = xml_element.elements['adminLoginUsersQuota'].text
			self.admin_user_id = xml_element.elements['adminUserId'].text
			self.first_name = xml_element.elements['firstName'].text
			self.last_name = xml_element.elements['lastName'].text
			self.country = xml_element.elements['country'].text
			self.state = xml_element.elements['state'].text
			self.additional_params = KalturaClientBase.object_from_xml(xml_element.elements['additionalParams'], 'KalturaKeyValue')
			self.publishers_quota = xml_element.elements['publishersQuota'].text
			self.partner_group_type = xml_element.elements['partnerGroupType'].text
			self.default_entitlement_enforcement = xml_element.elements['defaultEntitlementEnforcement'].text
			self.default_delivery_type = xml_element.elements['defaultDeliveryType'].text
			self.default_embed_code_type = xml_element.elements['defaultEmbedCodeType'].text
			self.delivery_types = KalturaClientBase.object_from_xml(xml_element.elements['deliveryTypes'], 'KalturaPlayerDeliveryType')
			self.embed_code_types = KalturaClientBase.object_from_xml(xml_element.elements['embedCodeTypes'], 'KalturaPlayerEmbedCodeType')
			self.template_partner_id = xml_element.elements['templatePartnerId'].text
			self.ignore_seo_links = xml_element.elements['ignoreSeoLinks'].text
			self.host = xml_element.elements['host'].text
			self.cdn_host = xml_element.elements['cdnHost'].text
			self.is_first_login = xml_element.elements['isFirstLogin'].text
			self.logout_url = xml_element.elements['logoutUrl'].text
			self.partner_parent_id = xml_element.elements['partnerParentId'].text
			self.crm_id = xml_element.elements['crmId'].text
			self.reference_id = xml_element.elements['referenceId'].text
			self.time_aligned_renditions = xml_element.elements['timeAlignedRenditions'].text
		end

	end

	# A representation to return an array of values
	class KalturaValue < KalturaObjectBase
		attr_accessor :description


		def from_xml(xml_element)
			super
			self.description = xml_element.elements['description'].text
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
			self.value = xml_element.elements['value'].text
		end

	end

	class KalturaBulkUploadPluginData < KalturaObjectBase
		attr_accessor :field
		attr_accessor :value


		def from_xml(xml_element)
			super
			self.field = xml_element.elements['field'].text
			self.value = xml_element.elements['value'].text
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
			self.id = xml_element.elements['id'].text
			self.bulk_upload_job_id = xml_element.elements['bulkUploadJobId'].text
			self.line_index = xml_element.elements['lineIndex'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.status = xml_element.elements['status'].text
			self.action = xml_element.elements['action'].text
			self.object_id = xml_element.elements['objectId'].text
			self.object_status = xml_element.elements['objectStatus'].text
			self.bulk_upload_result_object_type = xml_element.elements['bulkUploadResultObjectType'].text
			self.row_data = xml_element.elements['rowData'].text
			self.partner_data = xml_element.elements['partnerData'].text
			self.object_error_description = xml_element.elements['objectErrorDescription'].text
			self.plugins_data = KalturaClientBase.object_from_xml(xml_element.elements['pluginsData'], 'KalturaBulkUploadPluginData')
			self.error_description = xml_element.elements['errorDescription'].text
			self.error_code = xml_element.elements['errorCode'].text
			self.error_type = xml_element.elements['errorType'].text
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
			self.id = xml_element.elements['id'].text
			self.uploaded_by = xml_element.elements['uploadedBy'].text
			self.uploaded_by_user_id = xml_element.elements['uploadedByUserId'].text
			self.uploaded_on = xml_element.elements['uploadedOn'].text
			self.num_of_entries = xml_element.elements['numOfEntries'].text
			self.status = xml_element.elements['status'].text
			self.log_file_url = xml_element.elements['logFileUrl'].text
			self.csv_file_url = xml_element.elements['csvFileUrl'].text
			self.bulk_file_url = xml_element.elements['bulkFileUrl'].text
			self.bulk_upload_type = xml_element.elements['bulkUploadType'].text
			self.results = KalturaClientBase.object_from_xml(xml_element.elements['results'], 'KalturaBulkUploadResult')
			self.error = xml_element.elements['error'].text
			self.error_type = xml_element.elements['errorType'].text
			self.error_number = xml_element.elements['errorNumber'].text
			self.file_name = xml_element.elements['fileName'].text
			self.description = xml_element.elements['description'].text
			self.num_of_objects = xml_element.elements['numOfObjects'].text
			self.bulk_upload_object_type = xml_element.elements['bulkUploadObjectType'].text
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
			self.id = xml_element.elements['id'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.browser = xml_element.elements['browser'].text
			self.server_ip = xml_element.elements['serverIp'].text
			self.server_os = xml_element.elements['serverOs'].text
			self.php_version = xml_element.elements['phpVersion'].text
			self.ce_admin_email = xml_element.elements['ceAdminEmail'].text
			self.type = xml_element.elements['type'].text
			self.description = xml_element.elements['description'].text
			self.data = xml_element.elements['data'].text
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

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.parent_id = xml_element.elements['parentId'].text
			self.depth = xml_element.elements['depth'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.name = xml_element.elements['name'].text
			self.full_name = xml_element.elements['fullName'].text
			self.full_ids = xml_element.elements['fullIds'].text
			self.entries_count = xml_element.elements['entriesCount'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.description = xml_element.elements['description'].text
			self.tags = xml_element.elements['tags'].text
			self.appear_in_list = xml_element.elements['appearInList'].text
			self.privacy = xml_element.elements['privacy'].text
			self.inheritance_type = xml_element.elements['inheritanceType'].text
			self.user_join_policy = xml_element.elements['userJoinPolicy'].text
			self.default_permission_level = xml_element.elements['defaultPermissionLevel'].text
			self.owner = xml_element.elements['owner'].text
			self.direct_entries_count = xml_element.elements['directEntriesCount'].text
			self.reference_id = xml_element.elements['referenceId'].text
			self.contribution_policy = xml_element.elements['contributionPolicy'].text
			self.members_count = xml_element.elements['membersCount'].text
			self.pending_members_count = xml_element.elements['pendingMembersCount'].text
			self.privacy_context = xml_element.elements['privacyContext'].text
			self.privacy_contexts = xml_element.elements['privacyContexts'].text
			self.status = xml_element.elements['status'].text
			self.inherited_parent_id = xml_element.elements['inheritedParentId'].text
			self.partner_sort_value = xml_element.elements['partnerSortValue'].text
			self.partner_data = xml_element.elements['partnerData'].text
			self.default_order_by = xml_element.elements['defaultOrderBy'].text
			self.direct_sub_categories_count = xml_element.elements['directSubCategoriesCount'].text
			self.moderation = xml_element.elements['moderation'].text
			self.pending_entries_count = xml_element.elements['pendingEntriesCount'].text
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
			self.category_id = xml_element.elements['categoryId'].text
			self.entry_id = xml_element.elements['entryId'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.category_full_ids = xml_element.elements['categoryFullIds'].text
			self.status = xml_element.elements['status'].text
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
			self.category_id = xml_element.elements['categoryId'].text
			self.user_id = xml_element.elements['userId'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.permission_level = xml_element.elements['permissionLevel'].text
			self.status = xml_element.elements['status'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.update_method = xml_element.elements['updateMethod'].text
			self.category_full_ids = xml_element.elements['categoryFullIds'].text
			self.permission_names = xml_element.elements['permissionNames'].text
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
			self.url = xml_element.elements['url'].text
			self.data = xml_element.elements['data'].text
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
			self.messages = KalturaClientBase.object_from_xml(xml_element.elements['messages'], 'KalturaString')
			self.actions = KalturaClientBase.object_from_xml(xml_element.elements['actions'], 'KalturaRuleAction')
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
			self.id = xml_element.elements['id'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.created_by = xml_element.elements['createdBy'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.updated_by = xml_element.elements['updatedBy'].text
			self.created_by_id = xml_element.elements['createdById'].text
			self.scheduler_id = xml_element.elements['schedulerId'].text
			self.worker_id = xml_element.elements['workerId'].text
			self.worker_configured_id = xml_element.elements['workerConfiguredId'].text
			self.worker_name = xml_element.elements['workerName'].text
			self.batch_index = xml_element.elements['batchIndex'].text
			self.type = xml_element.elements['type'].text
			self.target_type = xml_element.elements['targetType'].text
			self.status = xml_element.elements['status'].text
			self.cause = xml_element.elements['cause'].text
			self.description = xml_element.elements['description'].text
			self.error_description = xml_element.elements['errorDescription'].text
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
			self.flavor_params_id = xml_element.elements['flavorParamsId'].text
			self.name = xml_element.elements['name'].text
			self.value = xml_element.elements['value'].text
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
			self.left = xml_element.elements['left'].text
			self.top = xml_element.elements['top'].text
			self.width = xml_element.elements['width'].text
			self.height = xml_element.elements['height'].text
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

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.status = xml_element.elements['status'].text
			self.type = xml_element.elements['type'].text
			self.name = xml_element.elements['name'].text
			self.system_name = xml_element.elements['systemName'].text
			self.tags = xml_element.elements['tags'].text
			self.description = xml_element.elements['description'].text
			self.default_entry_id = xml_element.elements['defaultEntryId'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.flavor_params_ids = xml_element.elements['flavorParamsIds'].text
			self.is_default = xml_element.elements['isDefault'].text
			self.is_partner_default = xml_element.elements['isPartnerDefault'].text
			self.crop_dimensions = KalturaClientBase.object_from_xml(xml_element.elements['cropDimensions'], 'KalturaCropDimensions')
			self.clip_start = xml_element.elements['clipStart'].text
			self.clip_duration = xml_element.elements['clipDuration'].text
			self.xsl_transformation = xml_element.elements['xslTransformation'].text
			self.storage_profile_id = xml_element.elements['storageProfileId'].text
			self.media_parser_type = xml_element.elements['mediaParserType'].text
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

		def from_xml(xml_element)
			super
			self.conversion_profile_id = xml_element.elements['conversionProfileId'].text
			self.asset_params_id = xml_element.elements['assetParamsId'].text
			self.ready_behavior = xml_element.elements['readyBehavior'].text
			self.origin = xml_element.elements['origin'].text
			self.system_name = xml_element.elements['systemName'].text
			self.force_none_complied = xml_element.elements['forceNoneComplied'].text
			self.delete_policy = xml_element.elements['deletePolicy'].text
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
			self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			self.flavor_params_output_id = xml_element.elements['flavorParamsOutputId'].text
			self.ready_behavior = xml_element.elements['readyBehavior'].text
			self.video_bitrate = xml_element.elements['videoBitrate'].text
			self.audio_bitrate = xml_element.elements['audioBitrate'].text
			self.dest_file_sync_local_path = xml_element.elements['destFileSyncLocalPath'].text
			self.dest_file_sync_remote_url = xml_element.elements['destFileSyncRemoteUrl'].text
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
			self.latitude = xml_element.elements['latitude'].text
			self.longitude = xml_element.elements['longitude'].text
			self.name = xml_element.elements['name'].text
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
			self.data_content = xml_element.elements['dataContent'].text
			self.retrieve_data_content_by_get = xml_element.elements['retrieveDataContentByGet'].text
		end

	end

	class KalturaUrlRecognizer < KalturaObjectBase
		# The hosts that are recognized
		attr_accessor :hosts
		# The URI prefix we use for security
		attr_accessor :uri_prefix


		def from_xml(xml_element)
			super
			self.hosts = xml_element.elements['hosts'].text
			self.uri_prefix = xml_element.elements['uriPrefix'].text
		end

	end

	class KalturaUrlTokenizer < KalturaObjectBase
		# Window
		attr_accessor :window
		# key
		attr_accessor :key

		def window=(val)
			@window = val.to_i
		end

		def from_xml(xml_element)
			super
			self.window = xml_element.elements['window'].text
			self.key = xml_element.elements['key'].text
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
			self.id = xml_element.elements['id'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.name = xml_element.elements['name'].text
			self.type = xml_element.elements['type'].text
			self.system_name = xml_element.elements['systemName'].text
			self.description = xml_element.elements['description'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.streamer_type = xml_element.elements['streamerType'].text
			self.url = xml_element.elements['url'].text
			self.host_name = xml_element.elements['hostName'].text
			self.status = xml_element.elements['status'].text
			self.recognizer = KalturaClientBase.object_from_xml(xml_element.elements['recognizer'], 'KalturaUrlRecognizer')
			self.tokenizer = KalturaClientBase.object_from_xml(xml_element.elements['tokenizer'], 'KalturaUrlTokenizer')
			self.is_default = xml_element.elements['isDefault'].text
			self.parent_id = xml_element.elements['parentId'].text
			self.media_protocols = xml_element.elements['mediaProtocols'].text
			self.priority = xml_element.elements['priority'].text
			self.extra_params = xml_element.elements['extraParams'].text
		end

	end

	class KalturaFileSyncDescriptor < KalturaObjectBase
		attr_accessor :file_sync_local_path
		# The translated path as used by the scheduler
		attr_accessor :file_sync_remote_url
		attr_accessor :file_sync_object_sub_type

		def file_sync_object_sub_type=(val)
			@file_sync_object_sub_type = val.to_i
		end

		def from_xml(xml_element)
			super
			self.file_sync_local_path = xml_element.elements['fileSyncLocalPath'].text
			self.file_sync_remote_url = xml_element.elements['fileSyncRemoteUrl'].text
			self.file_sync_object_sub_type = xml_element.elements['fileSyncObjectSubType'].text
		end

	end

	class KalturaDestFileSyncDescriptor < KalturaFileSyncDescriptor


		def from_xml(xml_element)
			super
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
			self.order_by = xml_element.elements['orderBy'].text
			self.advanced_search = KalturaClientBase.object_from_xml(xml_element.elements['advancedSearch'], 'KalturaSearchItem')
		end

	end

	class KalturaRelatedFilter < KalturaFilter


		def from_xml(xml_element)
			super
		end

	end

	# The KalturaFilterPager object enables paging management to be applied upon service list actions.
	class KalturaFilterPager < KalturaObjectBase
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
			self.page_size = xml_element.elements['pageSize'].text
			self.page_index = xml_element.elements['pageIndex'].text
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
			self.parent_property = xml_element.elements['parentProperty'].text
			self.filter_property = xml_element.elements['filterProperty'].text
			self.allow_null = xml_element.elements['allowNull'].text
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
			self.name = xml_element.elements['name'].text
			self.type = xml_element.elements['type'].text
			self.fields = xml_element.elements['fields'].text
			self.filter = KalturaClientBase.object_from_xml(xml_element.elements['filter'], 'KalturaRelatedFilter')
			self.pager = KalturaClientBase.object_from_xml(xml_element.elements['pager'], 'KalturaFilterPager')
			self.related_profiles = KalturaClientBase.object_from_xml(xml_element.elements['relatedProfiles'], 'KalturaDetachedResponseProfile')
			self.mappings = KalturaClientBase.object_from_xml(xml_element.elements['mappings'], 'KalturaResponseProfileMapping')
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
			self.id = xml_element.elements['id'].text
			self.name = xml_element.elements['name'].text
			self.description = xml_element.elements['description'].text
			self.email_address = xml_element.elements['emailAddress'].text
			self.mailbox_id = xml_element.elements['mailboxId'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.conversion_profile2id = xml_element.elements['conversionProfile2Id'].text
			self.moderation_status = xml_element.elements['moderationStatus'].text
			self.status = xml_element.elements['status'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.default_category = xml_element.elements['defaultCategory'].text
			self.default_user_id = xml_element.elements['defaultUserId'].text
			self.default_tags = xml_element.elements['defaultTags'].text
			self.default_admin_tags = xml_element.elements['defaultAdminTags'].text
			self.max_attachment_size_kbytes = xml_element.elements['maxAttachmentSizeKbytes'].text
			self.max_attachments_per_mail = xml_element.elements['maxAttachmentsPerMail'].text
		end

	end

	# A string representation to return an array of strings
	class KalturaStringValue < KalturaValue
		attr_accessor :value


		def from_xml(xml_element)
			super
			self.value = xml_element.elements['value'].text
		end

	end

	# Advanced configuration for entry replacement process
	class KalturaEntryReplacementOptions < KalturaObjectBase
		# If true manually created thumbnails will not be deleted on entry replacement
		attr_accessor :keep_manual_thumbnails

		def keep_manual_thumbnails=(val)
			@keep_manual_thumbnails = val.to_i
		end

		def from_xml(xml_element)
			super
			self.keep_manual_thumbnails = xml_element.elements['keepManualThumbnails'].text
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
			self.id = xml_element.elements['id'].text
			self.entry_id = xml_element.elements['entryId'].text
			self.server_node_id = xml_element.elements['serverNodeId'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.status = xml_element.elements['status'].text
			self.server_type = xml_element.elements['serverType'].text
		end

	end

	# Configuration for extended item in the Kaltura MRSS feeds
	class KalturaObjectIdentifier < KalturaObjectBase
		# Comma separated string of enum values denoting which features of the item need to be included in the MRSS
		attr_accessor :extended_features


		def from_xml(xml_element)
			super
			self.extended_features = xml_element.elements['extendedFeatures'].text
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
			self.xpath = xml_element.elements['xpath'].text
			self.identifier = KalturaClientBase.object_from_xml(xml_element.elements['identifier'], 'KalturaObjectIdentifier')
			self.extension_mode = xml_element.elements['extensionMode'].text
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
			self.plays = xml_element.elements['plays'].text
			self.views = xml_element.elements['views'].text
			self.last_played_at = xml_element.elements['lastPlayedAt'].text
			self.width = xml_element.elements['width'].text
			self.height = xml_element.elements['height'].text
			self.duration = xml_element.elements['duration'].text
			self.ms_duration = xml_element.elements['msDuration'].text
			self.duration_type = xml_element.elements['durationType'].text
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
			self.media_type = xml_element.elements['mediaType'].text
			self.conversion_quality = xml_element.elements['conversionQuality'].text
			self.source_type = xml_element.elements['sourceType'].text
			self.search_provider_type = xml_element.elements['searchProviderType'].text
			self.search_provider_id = xml_element.elements['searchProviderId'].text
			self.credit_user_name = xml_element.elements['creditUserName'].text
			self.credit_url = xml_element.elements['creditUrl'].text
			self.media_date = xml_element.elements['mediaDate'].text
			self.data_url = xml_element.elements['dataUrl'].text
			self.flavor_params_ids = xml_element.elements['flavorParamsIds'].text
			self.is_trim_disabled = xml_element.elements['isTrimDisabled'].text
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
			self.type = xml_element.elements['type'].text
			self.value = xml_element.elements['value'].text
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
			self.id = xml_element.elements['id'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.file_asset_object_type = xml_element.elements['fileAssetObjectType'].text
			self.object_id = xml_element.elements['objectId'].text
			self.name = xml_element.elements['name'].text
			self.system_name = xml_element.elements['systemName'].text
			self.file_ext = xml_element.elements['fileExt'].text
			self.version = xml_element.elements['version'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.status = xml_element.elements['status'].text
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

		def from_xml(xml_element)
			super
			self.flavor_params_id = xml_element.elements['flavorParamsId'].text
			self.width = xml_element.elements['width'].text
			self.height = xml_element.elements['height'].text
			self.bitrate = xml_element.elements['bitrate'].text
			self.frame_rate = xml_element.elements['frameRate'].text
			self.is_original = xml_element.elements['isOriginal'].text
			self.is_web = xml_element.elements['isWeb'].text
			self.container_format = xml_element.elements['containerFormat'].text
			self.video_codec_id = xml_element.elements['videoCodecId'].text
			self.status = xml_element.elements['status'].text
			self.language = xml_element.elements['language'].text
		end

	end

	class KalturaFlavorAssetUrlOptions < KalturaObjectBase
		# The name of the downloaded file
		attr_accessor :file_name
		attr_accessor :referrer


		def from_xml(xml_element)
			super
			self.file_name = xml_element.elements['fileName'].text
			self.referrer = xml_element.elements['referrer'].text
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
		attr_accessor :is_crop_imx
		attr_accessor :optimization_policy
		attr_accessor :max_frame_rate
		attr_accessor :video_constant_bitrate
		attr_accessor :video_bitrate_tolerance
		attr_accessor :watermark_data
		attr_accessor :subtitles_data
		attr_accessor :is_encrypted
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
		def clip_offset=(val)
			@clip_offset = val.to_i
		end
		def clip_duration=(val)
			@clip_duration = val.to_i
		end

		def from_xml(xml_element)
			super
			self.video_codec = xml_element.elements['videoCodec'].text
			self.video_bitrate = xml_element.elements['videoBitrate'].text
			self.audio_codec = xml_element.elements['audioCodec'].text
			self.audio_bitrate = xml_element.elements['audioBitrate'].text
			self.audio_channels = xml_element.elements['audioChannels'].text
			self.audio_sample_rate = xml_element.elements['audioSampleRate'].text
			self.width = xml_element.elements['width'].text
			self.height = xml_element.elements['height'].text
			self.frame_rate = xml_element.elements['frameRate'].text
			self.gop_size = xml_element.elements['gopSize'].text
			self.conversion_engines = xml_element.elements['conversionEngines'].text
			self.conversion_engines_extra_params = xml_element.elements['conversionEnginesExtraParams'].text
			self.two_pass = xml_element.elements['twoPass'].text
			self.deinterlice = xml_element.elements['deinterlice'].text
			self.rotate = xml_element.elements['rotate'].text
			self.operators = xml_element.elements['operators'].text
			self.engine_version = xml_element.elements['engineVersion'].text
			self.format = xml_element.elements['format'].text
			self.aspect_ratio_processing_mode = xml_element.elements['aspectRatioProcessingMode'].text
			self.force_frame_to_multiplication16 = xml_element.elements['forceFrameToMultiplication16'].text
			self.is_gop_in_sec = xml_element.elements['isGopInSec'].text
			self.is_avoid_video_shrink_framesize_to_source = xml_element.elements['isAvoidVideoShrinkFramesizeToSource'].text
			self.is_avoid_video_shrink_bitrate_to_source = xml_element.elements['isAvoidVideoShrinkBitrateToSource'].text
			self.is_video_frame_rate_for_low_br_apple_hls = xml_element.elements['isVideoFrameRateForLowBrAppleHls'].text
			self.multi_stream = xml_element.elements['multiStream'].text
			self.anamorphic_pixels = xml_element.elements['anamorphicPixels'].text
			self.is_avoid_forced_key_frames = xml_element.elements['isAvoidForcedKeyFrames'].text
			self.is_crop_imx = xml_element.elements['isCropIMX'].text
			self.optimization_policy = xml_element.elements['optimizationPolicy'].text
			self.max_frame_rate = xml_element.elements['maxFrameRate'].text
			self.video_constant_bitrate = xml_element.elements['videoConstantBitrate'].text
			self.video_bitrate_tolerance = xml_element.elements['videoBitrateTolerance'].text
			self.watermark_data = xml_element.elements['watermarkData'].text
			self.subtitles_data = xml_element.elements['subtitlesData'].text
			self.is_encrypted = xml_element.elements['isEncrypted'].text
			self.clip_offset = xml_element.elements['clipOffset'].text
			self.clip_duration = xml_element.elements['clipDuration'].text
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
			self.flavor_asset = KalturaClientBase.object_from_xml(xml_element.elements['flavorAsset'], 'KalturaFlavorAsset')
			self.flavor_params = KalturaClientBase.object_from_xml(xml_element.elements['flavorParams'], 'KalturaFlavorParams')
			self.entry_id = xml_element.elements['entryId'].text
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
			self.flavor_params_id = xml_element.elements['flavorParamsId'].text
			self.command_lines_str = xml_element.elements['commandLinesStr'].text
			self.flavor_params_version = xml_element.elements['flavorParamsVersion'].text
			self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			self.flavor_asset_version = xml_element.elements['flavorAssetVersion'].text
			self.ready_behavior = xml_element.elements['readyBehavior'].text
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
			self.id = xml_element.elements['id'].text
			self.scheduler_configured_id = xml_element.elements['schedulerConfiguredId'].text
			self.worker_configured_id = xml_element.elements['workerConfiguredId'].text
			self.worker_type = xml_element.elements['workerType'].text
			self.type = xml_element.elements['type'].text
			self.value = xml_element.elements['value'].text
			self.scheduler_id = xml_element.elements['schedulerId'].text
			self.worker_id = xml_element.elements['workerId'].text
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
			self.id = xml_element.elements['id'].text
			self.created_by = xml_element.elements['createdBy'].text
			self.updated_by = xml_element.elements['updatedBy'].text
			self.command_id = xml_element.elements['commandId'].text
			self.command_status = xml_element.elements['commandStatus'].text
			self.scheduler_id = xml_element.elements['schedulerId'].text
			self.scheduler_configured_id = xml_element.elements['schedulerConfiguredId'].text
			self.scheduler_name = xml_element.elements['schedulerName'].text
			self.worker_id = xml_element.elements['workerId'].text
			self.worker_configured_id = xml_element.elements['workerConfiguredId'].text
			self.worker_name = xml_element.elements['workerName'].text
			self.variable = xml_element.elements['variable'].text
			self.variable_part = xml_element.elements['variablePart'].text
			self.value = xml_element.elements['value'].text
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
			self.id = xml_element.elements['id'].text
			self.configured_id = xml_element.elements['configuredId'].text
			self.scheduler_id = xml_element.elements['schedulerId'].text
			self.scheduler_configured_id = xml_element.elements['schedulerConfiguredId'].text
			self.type = xml_element.elements['type'].text
			self.type_name = xml_element.elements['typeName'].text
			self.name = xml_element.elements['name'].text
			self.statuses = KalturaClientBase.object_from_xml(xml_element.elements['statuses'], 'KalturaSchedulerStatus')
			self.configs = KalturaClientBase.object_from_xml(xml_element.elements['configs'], 'KalturaSchedulerConfig')
			self.locked_jobs = KalturaClientBase.object_from_xml(xml_element.elements['lockedJobs'], 'KalturaBatchJob')
			self.avg_wait = xml_element.elements['avgWait'].text
			self.avg_work = xml_element.elements['avgWork'].text
			self.last_status = xml_element.elements['lastStatus'].text
			self.last_status_str = xml_element.elements['lastStatusStr'].text
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
			self.id = xml_element.elements['id'].text
			self.configured_id = xml_element.elements['configuredId'].text
			self.name = xml_element.elements['name'].text
			self.host = xml_element.elements['host'].text
			self.statuses = KalturaClientBase.object_from_xml(xml_element.elements['statuses'], 'KalturaSchedulerStatus')
			self.configs = KalturaClientBase.object_from_xml(xml_element.elements['configs'], 'KalturaSchedulerConfig')
			self.workers = KalturaClientBase.object_from_xml(xml_element.elements['workers'], 'KalturaSchedulerWorker')
			self.created_at = xml_element.elements['createdAt'].text
			self.last_status = xml_element.elements['lastStatus'].text
			self.last_status_str = xml_element.elements['lastStatusStr'].text
		end

	end

	class KalturaGroupUser < KalturaObjectBase
		attr_accessor :user_id
		attr_accessor :group_id
		attr_accessor :status
		attr_accessor :partner_id
		# Creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Last update date as Unix timestamp (In seconds)
		attr_accessor :updated_at

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
			self.user_id = xml_element.elements['userId'].text
			self.group_id = xml_element.elements['groupId'].text
			self.status = xml_element.elements['status'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
		end

	end

	class KalturaObject < KalturaObjectBase
		attr_accessor :related_objects


		def from_xml(xml_element)
			super
			self.related_objects = KalturaClientBase.object_from_xml(xml_element.elements['relatedObjects'], 'KalturaListResponse')
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
			self.value = xml_element.elements['value'].text
		end

	end

	class KalturaBatchJobListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaBatchJob')
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

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			self.file_size = xml_element.elements['fileSize'].text
			self.container_format = xml_element.elements['containerFormat'].text
			self.container_id = xml_element.elements['containerId'].text
			self.container_profile = xml_element.elements['containerProfile'].text
			self.container_duration = xml_element.elements['containerDuration'].text
			self.container_bit_rate = xml_element.elements['containerBitRate'].text
			self.video_format = xml_element.elements['videoFormat'].text
			self.video_codec_id = xml_element.elements['videoCodecId'].text
			self.video_duration = xml_element.elements['videoDuration'].text
			self.video_bit_rate = xml_element.elements['videoBitRate'].text
			self.video_bit_rate_mode = xml_element.elements['videoBitRateMode'].text
			self.video_width = xml_element.elements['videoWidth'].text
			self.video_height = xml_element.elements['videoHeight'].text
			self.video_frame_rate = xml_element.elements['videoFrameRate'].text
			self.video_dar = xml_element.elements['videoDar'].text
			self.video_rotation = xml_element.elements['videoRotation'].text
			self.audio_format = xml_element.elements['audioFormat'].text
			self.audio_codec_id = xml_element.elements['audioCodecId'].text
			self.audio_duration = xml_element.elements['audioDuration'].text
			self.audio_bit_rate = xml_element.elements['audioBitRate'].text
			self.audio_bit_rate_mode = xml_element.elements['audioBitRateMode'].text
			self.audio_channels = xml_element.elements['audioChannels'].text
			self.audio_sampling_rate = xml_element.elements['audioSamplingRate'].text
			self.audio_resolution = xml_element.elements['audioResolution'].text
			self.writing_lib = xml_element.elements['writingLib'].text
			self.raw_data = xml_element.elements['rawData'].text
			self.multi_stream_info = xml_element.elements['multiStreamInfo'].text
			self.scan_type = xml_element.elements['scanType'].text
			self.multi_stream = xml_element.elements['multiStream'].text
			self.is_fast_start = xml_element.elements['isFastStart'].text
			self.content_streams = xml_element.elements['contentStreams'].text
		end

	end

	class KalturaMediaInfoListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaMediaInfo')
		end

	end

	class KalturaFlavorParamsOutputListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaFlavorParamsOutput')
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
			self.thumb_params_id = xml_element.elements['thumbParamsId'].text
			self.width = xml_element.elements['width'].text
			self.height = xml_element.elements['height'].text
			self.status = xml_element.elements['status'].text
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

		def from_xml(xml_element)
			super
			self.crop_type = xml_element.elements['cropType'].text
			self.quality = xml_element.elements['quality'].text
			self.crop_x = xml_element.elements['cropX'].text
			self.crop_y = xml_element.elements['cropY'].text
			self.crop_width = xml_element.elements['cropWidth'].text
			self.crop_height = xml_element.elements['cropHeight'].text
			self.video_offset = xml_element.elements['videoOffset'].text
			self.width = xml_element.elements['width'].text
			self.height = xml_element.elements['height'].text
			self.scale_width = xml_element.elements['scaleWidth'].text
			self.scale_height = xml_element.elements['scaleHeight'].text
			self.background_color = xml_element.elements['backgroundColor'].text
			self.source_params_id = xml_element.elements['sourceParamsId'].text
			self.format = xml_element.elements['format'].text
			self.density = xml_element.elements['density'].text
			self.strip_profiles = xml_element.elements['stripProfiles'].text
			self.video_offset_in_percentage = xml_element.elements['videoOffsetInPercentage'].text
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
			self.thumb_params_id = xml_element.elements['thumbParamsId'].text
			self.thumb_params_version = xml_element.elements['thumbParamsVersion'].text
			self.thumb_asset_id = xml_element.elements['thumbAssetId'].text
			self.thumb_asset_version = xml_element.elements['thumbAssetVersion'].text
			self.rotate = xml_element.elements['rotate'].text
		end

	end

	class KalturaThumbParamsOutputListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaThumbParamsOutput')
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
			self.protocol = xml_element.elements['protocol'].text
			self.url = xml_element.elements['url'].text
			self.publish_url = xml_element.elements['publishUrl'].text
			self.backup_url = xml_element.elements['backupUrl'].text
			self.stream_name = xml_element.elements['streamName'].text
		end

	end

	# Basic push-publish configuration for Kaltura live stream entry
	class KalturaLiveStreamPushPublishConfiguration < KalturaObjectBase
		attr_accessor :publish_url
		attr_accessor :backup_publish_url
		attr_accessor :port


		def from_xml(xml_element)
			super
			self.publish_url = xml_element.elements['publishUrl'].text
			self.backup_publish_url = xml_element.elements['backupPublishUrl'].text
			self.port = xml_element.elements['port'].text
		end

	end

	# A representation of a live stream recording entry configuration
	class KalturaLiveEntryRecordingOptions < KalturaObjectBase
		attr_accessor :should_copy_entitlement
		attr_accessor :should_copy_scheduling
		attr_accessor :should_copy_thumbnail

		def should_copy_entitlement=(val)
			@should_copy_entitlement = val.to_i
		end
		def should_copy_scheduling=(val)
			@should_copy_scheduling = val.to_i
		end
		def should_copy_thumbnail=(val)
			@should_copy_thumbnail = val.to_i
		end

		def from_xml(xml_element)
			super
			self.should_copy_entitlement = xml_element.elements['shouldCopyEntitlement'].text
			self.should_copy_scheduling = xml_element.elements['shouldCopyScheduling'].text
			self.should_copy_thumbnail = xml_element.elements['shouldCopyThumbnail'].text
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

		def from_xml(xml_element)
			super
			self.offline_message = xml_element.elements['offlineMessage'].text
			self.record_status = xml_element.elements['recordStatus'].text
			self.dvr_status = xml_element.elements['dvrStatus'].text
			self.dvr_window = xml_element.elements['dvrWindow'].text
			self.last_elapsed_recording_time = xml_element.elements['lastElapsedRecordingTime'].text
			self.live_stream_configurations = KalturaClientBase.object_from_xml(xml_element.elements['liveStreamConfigurations'], 'KalturaLiveStreamConfiguration')
			self.recorded_entry_id = xml_element.elements['recordedEntryId'].text
			self.push_publish_enabled = xml_element.elements['pushPublishEnabled'].text
			self.publish_configurations = KalturaClientBase.object_from_xml(xml_element.elements['publishConfigurations'], 'KalturaLiveStreamPushPublishConfiguration')
			self.first_broadcast = xml_element.elements['firstBroadcast'].text
			self.last_broadcast = xml_element.elements['lastBroadcast'].text
			self.current_broadcast_start_time = xml_element.elements['currentBroadcastStartTime'].text
			self.recording_options = KalturaClientBase.object_from_xml(xml_element.elements['recordingOptions'], 'KalturaLiveEntryRecordingOptions')
			self.live_status = xml_element.elements['liveStatus'].text
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
			self.playlist_id = xml_element.elements['playlistId'].text
			self.repeat = xml_element.elements['repeat'].text
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

		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def start_time=(val)
			@start_time = val.to_f
		end
		def duration=(val)
			@duration = val.to_f
		end

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.name = xml_element.elements['name'].text
			self.description = xml_element.elements['description'].text
			self.tags = xml_element.elements['tags'].text
			self.type = xml_element.elements['type'].text
			self.status = xml_element.elements['status'].text
			self.channel_id = xml_element.elements['channelId'].text
			self.entry_id = xml_element.elements['entryId'].text
			self.trigger_type = xml_element.elements['triggerType'].text
			self.trigger_segment_id = xml_element.elements['triggerSegmentId'].text
			self.start_time = xml_element.elements['startTime'].text
			self.duration = xml_element.elements['duration'].text
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
			self.entry_ids = xml_element.elements['entryIds'].text
			self.recpient_email = xml_element.elements['recpientEmail'].text
			self.time_zone_offset = xml_element.elements['timeZoneOffset'].text
			self.application_url_template = xml_element.elements['applicationUrlTemplate'].text
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
			self.reference_job_id = xml_element.elements['referenceJobId'].text
			self.report_email = xml_element.elements['reportEmail'].text
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
			self.entry_ids = xml_element.elements['entryIds'].text
			self.from_time = xml_element.elements['fromTime'].text
			self.to_time = xml_element.elements['toTime'].text
			self.live = xml_element.elements['live'].text
			self.order_by = xml_element.elements['orderBy'].text
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
			self.audience = xml_element.elements['audience'].text
			self.dvr_audience = xml_element.elements['dvrAudience'].text
			self.avg_bitrate = xml_element.elements['avgBitrate'].text
			self.buffer_time = xml_element.elements['bufferTime'].text
			self.plays = xml_element.elements['plays'].text
			self.seconds_viewed = xml_element.elements['secondsViewed'].text
			self.start_event = xml_element.elements['startEvent'].text
			self.timestamp = xml_element.elements['timestamp'].text
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
			self.partner_id = xml_element.elements['partnerId'].text
			self.entry_id = xml_element.elements['entryId'].text
			self.event_type = xml_element.elements['eventType'].text
			self.session_id = xml_element.elements['sessionId'].text
			self.event_index = xml_element.elements['eventIndex'].text
			self.buffer_time = xml_element.elements['bufferTime'].text
			self.bitrate = xml_element.elements['bitrate'].text
			self.referrer = xml_element.elements['referrer'].text
			self.is_live = xml_element.elements['isLive'].text
			self.start_time = xml_element.elements['startTime'].text
			self.delivery_type = xml_element.elements['deliveryType'].text
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
			self.bitrate = xml_element.elements['bitrate'].text
			self.width = xml_element.elements['width'].text
			self.height = xml_element.elements['height'].text
			self.tags = xml_element.elements['tags'].text
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
			self.stream_remote_id = xml_element.elements['streamRemoteId'].text
			self.stream_remote_backup_id = xml_element.elements['streamRemoteBackupId'].text
			self.bitrates = KalturaClientBase.object_from_xml(xml_element.elements['bitrates'], 'KalturaLiveStreamBitrate')
			self.primary_broadcasting_url = xml_element.elements['primaryBroadcastingUrl'].text
			self.secondary_broadcasting_url = xml_element.elements['secondaryBroadcastingUrl'].text
			self.primary_rtsp_broadcasting_url = xml_element.elements['primaryRtspBroadcastingUrl'].text
			self.secondary_rtsp_broadcasting_url = xml_element.elements['secondaryRtspBroadcastingUrl'].text
			self.stream_name = xml_element.elements['streamName'].text
			self.stream_url = xml_element.elements['streamUrl'].text
			self.hls_stream_url = xml_element.elements['hlsStreamUrl'].text
			self.url_manager = xml_element.elements['urlManager'].text
			self.encoding_ip1 = xml_element.elements['encodingIP1'].text
			self.encoding_ip2 = xml_element.elements['encodingIP2'].text
			self.stream_password = xml_element.elements['streamPassword'].text
			self.stream_username = xml_element.elements['streamUsername'].text
			self.primary_server_node_id = xml_element.elements['primaryServerNodeId'].text
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
			self.bitrate = xml_element.elements['bitrate'].text
			self.flavor_id = xml_element.elements['flavorId'].text
			self.width = xml_element.elements['width'].text
			self.height = xml_element.elements['height'].text
			self.codec = xml_element.elements['codec'].text
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.id_not_in = xml_element.elements['idNotIn'].text
			self.name_like = xml_element.elements['nameLike'].text
			self.name_multi_like_or = xml_element.elements['nameMultiLikeOr'].text
			self.name_multi_like_and = xml_element.elements['nameMultiLikeAnd'].text
			self.name_equal = xml_element.elements['nameEqual'].text
			self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			self.partner_id_in = xml_element.elements['partnerIdIn'].text
			self.user_id_equal = xml_element.elements['userIdEqual'].text
			self.user_id_in = xml_element.elements['userIdIn'].text
			self.creator_id_equal = xml_element.elements['creatorIdEqual'].text
			self.tags_like = xml_element.elements['tagsLike'].text
			self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
			self.admin_tags_like = xml_element.elements['adminTagsLike'].text
			self.admin_tags_multi_like_or = xml_element.elements['adminTagsMultiLikeOr'].text
			self.admin_tags_multi_like_and = xml_element.elements['adminTagsMultiLikeAnd'].text
			self.categories_match_and = xml_element.elements['categoriesMatchAnd'].text
			self.categories_match_or = xml_element.elements['categoriesMatchOr'].text
			self.categories_not_contains = xml_element.elements['categoriesNotContains'].text
			self.categories_ids_match_and = xml_element.elements['categoriesIdsMatchAnd'].text
			self.categories_ids_match_or = xml_element.elements['categoriesIdsMatchOr'].text
			self.categories_ids_not_contains = xml_element.elements['categoriesIdsNotContains'].text
			self.categories_ids_empty = xml_element.elements['categoriesIdsEmpty'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_not_equal = xml_element.elements['statusNotEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.status_not_in = xml_element.elements['statusNotIn'].text
			self.moderation_status_equal = xml_element.elements['moderationStatusEqual'].text
			self.moderation_status_not_equal = xml_element.elements['moderationStatusNotEqual'].text
			self.moderation_status_in = xml_element.elements['moderationStatusIn'].text
			self.moderation_status_not_in = xml_element.elements['moderationStatusNotIn'].text
			self.type_equal = xml_element.elements['typeEqual'].text
			self.type_in = xml_element.elements['typeIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.total_rank_less_than_or_equal = xml_element.elements['totalRankLessThanOrEqual'].text
			self.total_rank_greater_than_or_equal = xml_element.elements['totalRankGreaterThanOrEqual'].text
			self.group_id_equal = xml_element.elements['groupIdEqual'].text
			self.search_text_match_and = xml_element.elements['searchTextMatchAnd'].text
			self.search_text_match_or = xml_element.elements['searchTextMatchOr'].text
			self.access_control_id_equal = xml_element.elements['accessControlIdEqual'].text
			self.access_control_id_in = xml_element.elements['accessControlIdIn'].text
			self.start_date_greater_than_or_equal = xml_element.elements['startDateGreaterThanOrEqual'].text
			self.start_date_less_than_or_equal = xml_element.elements['startDateLessThanOrEqual'].text
			self.start_date_greater_than_or_equal_or_null = xml_element.elements['startDateGreaterThanOrEqualOrNull'].text
			self.start_date_less_than_or_equal_or_null = xml_element.elements['startDateLessThanOrEqualOrNull'].text
			self.end_date_greater_than_or_equal = xml_element.elements['endDateGreaterThanOrEqual'].text
			self.end_date_less_than_or_equal = xml_element.elements['endDateLessThanOrEqual'].text
			self.end_date_greater_than_or_equal_or_null = xml_element.elements['endDateGreaterThanOrEqualOrNull'].text
			self.end_date_less_than_or_equal_or_null = xml_element.elements['endDateLessThanOrEqualOrNull'].text
			self.reference_id_equal = xml_element.elements['referenceIdEqual'].text
			self.reference_id_in = xml_element.elements['referenceIdIn'].text
			self.replacing_entry_id_equal = xml_element.elements['replacingEntryIdEqual'].text
			self.replacing_entry_id_in = xml_element.elements['replacingEntryIdIn'].text
			self.replaced_entry_id_equal = xml_element.elements['replacedEntryIdEqual'].text
			self.replaced_entry_id_in = xml_element.elements['replacedEntryIdIn'].text
			self.replacement_status_equal = xml_element.elements['replacementStatusEqual'].text
			self.replacement_status_in = xml_element.elements['replacementStatusIn'].text
			self.partner_sort_value_greater_than_or_equal = xml_element.elements['partnerSortValueGreaterThanOrEqual'].text
			self.partner_sort_value_less_than_or_equal = xml_element.elements['partnerSortValueLessThanOrEqual'].text
			self.root_entry_id_equal = xml_element.elements['rootEntryIdEqual'].text
			self.root_entry_id_in = xml_element.elements['rootEntryIdIn'].text
			self.parent_entry_id_equal = xml_element.elements['parentEntryIdEqual'].text
			self.entitled_users_edit_match_and = xml_element.elements['entitledUsersEditMatchAnd'].text
			self.entitled_users_edit_match_or = xml_element.elements['entitledUsersEditMatchOr'].text
			self.entitled_users_publish_match_and = xml_element.elements['entitledUsersPublishMatchAnd'].text
			self.entitled_users_publish_match_or = xml_element.elements['entitledUsersPublishMatchOr'].text
			self.tags_name_multi_like_or = xml_element.elements['tagsNameMultiLikeOr'].text
			self.tags_admin_tags_multi_like_or = xml_element.elements['tagsAdminTagsMultiLikeOr'].text
			self.tags_admin_tags_name_multi_like_or = xml_element.elements['tagsAdminTagsNameMultiLikeOr'].text
			self.tags_name_multi_like_and = xml_element.elements['tagsNameMultiLikeAnd'].text
			self.tags_admin_tags_multi_like_and = xml_element.elements['tagsAdminTagsMultiLikeAnd'].text
			self.tags_admin_tags_name_multi_like_and = xml_element.elements['tagsAdminTagsNameMultiLikeAnd'].text
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
			self.free_text = xml_element.elements['freeText'].text
			self.is_root = xml_element.elements['isRoot'].text
			self.categories_full_name_in = xml_element.elements['categoriesFullNameIn'].text
			self.category_ancestor_id_in = xml_element.elements['categoryAncestorIdIn'].text
			self.redirect_from_entry_id = xml_element.elements['redirectFromEntryId'].text
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
			self.last_played_at_greater_than_or_equal = xml_element.elements['lastPlayedAtGreaterThanOrEqual'].text
			self.last_played_at_less_than_or_equal = xml_element.elements['lastPlayedAtLessThanOrEqual'].text
			self.duration_less_than = xml_element.elements['durationLessThan'].text
			self.duration_greater_than = xml_element.elements['durationGreaterThan'].text
			self.duration_less_than_or_equal = xml_element.elements['durationLessThanOrEqual'].text
			self.duration_greater_than_or_equal = xml_element.elements['durationGreaterThanOrEqual'].text
			self.duration_type_match_or = xml_element.elements['durationTypeMatchOr'].text
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
			self.media_type_equal = xml_element.elements['mediaTypeEqual'].text
			self.media_type_in = xml_element.elements['mediaTypeIn'].text
			self.source_type_equal = xml_element.elements['sourceTypeEqual'].text
			self.source_type_not_equal = xml_element.elements['sourceTypeNotEqual'].text
			self.source_type_in = xml_element.elements['sourceTypeIn'].text
			self.source_type_not_in = xml_element.elements['sourceTypeNotIn'].text
			self.media_date_greater_than_or_equal = xml_element.elements['mediaDateGreaterThanOrEqual'].text
			self.media_date_less_than_or_equal = xml_element.elements['mediaDateLessThanOrEqual'].text
			self.flavor_params_ids_match_or = xml_element.elements['flavorParamsIdsMatchOr'].text
			self.flavor_params_ids_match_and = xml_element.elements['flavorParamsIdsMatchAnd'].text
		end

	end

	class KalturaMediaEntryFilter < KalturaMediaEntryBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMediaEntryFilterForPlaylist < KalturaMediaEntryFilter
		attr_accessor :limit

		def limit=(val)
			@limit = val.to_i
		end

		def from_xml(xml_element)
			super
			self.limit = xml_element.elements['limit'].text
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
			self.has_real_thumbnail = xml_element.elements['hasRealThumbnail'].text
			self.editor_type = xml_element.elements['editorType'].text
			self.data_content = xml_element.elements['dataContent'].text
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
			self.id = xml_element.elements['id'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.user_id = xml_element.elements['userId'].text
			self.moderation_object_type = xml_element.elements['moderationObjectType'].text
			self.flagged_entry_id = xml_element.elements['flaggedEntryId'].text
			self.flagged_user_id = xml_element.elements['flaggedUserId'].text
			self.status = xml_element.elements['status'].text
			self.comments = xml_element.elements['comments'].text
			self.flag_type = xml_element.elements['flagType'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
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
			self.package_bandwidth_and_storage = xml_element.elements['packageBandwidthAndStorage'].text
			self.hosting = xml_element.elements['hosting'].text
			self.bandwidth = xml_element.elements['bandwidth'].text
			self.usage = xml_element.elements['usage'].text
			self.usage_percent = xml_element.elements['usagePercent'].text
			self.reached_limit_date = xml_element.elements['reachedLimitDate'].text
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
			self.hosting_gb = xml_element.elements['hostingGB'].text
			self.percent = xml_element.elements['Percent'].text
			self.package_bw = xml_element.elements['packageBW'].text
			self.usage_gb = xml_element.elements['usageGB'].text
			self.reached_limit_date = xml_element.elements['reachedLimitDate'].text
			self.usage_graph = xml_element.elements['usageGraph'].text
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
			self.id = xml_element.elements['id'].text
			self.type = xml_element.elements['type'].text
			self.name = xml_element.elements['name'].text
			self.friendly_name = xml_element.elements['friendlyName'].text
			self.description = xml_element.elements['description'].text
			self.status = xml_element.elements['status'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.depends_on_permission_names = xml_element.elements['dependsOnPermissionNames'].text
			self.tags = xml_element.elements['tags'].text
			self.permission_items_ids = xml_element.elements['permissionItemsIds'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.partner_group = xml_element.elements['partnerGroup'].text
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
			self.id = xml_element.elements['id'].text
			self.type = xml_element.elements['type'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.tags = xml_element.elements['tags'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
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
			self.playlist_content = xml_element.elements['playlistContent'].text
			self.filters = KalturaClientBase.object_from_xml(xml_element.elements['filters'], 'KalturaMediaEntryFilterForPlaylist')
			self.total_results = xml_element.elements['totalResults'].text
			self.playlist_type = xml_element.elements['playlistType'].text
			self.plays = xml_element.elements['plays'].text
			self.views = xml_element.elements['views'].text
			self.duration = xml_element.elements['duration'].text
			self.execute_url = xml_element.elements['executeUrl'].text
		end

	end

	class KalturaPluginData < KalturaObjectBase


		def from_xml(xml_element)
			super
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
			self.storage_profile_id = xml_element.elements['storageProfileId'].text
			self.uri = xml_element.elements['uri'].text
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
			self.url = xml_element.elements['url'].text
			self.force_async_download = xml_element.elements['forceAsyncDownload'].text
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
			self.storage_profile_id = xml_element.elements['storageProfileId'].text
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
			self.id = xml_element.elements['id'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.name = xml_element.elements['name'].text
			self.system_name = xml_element.elements['systemName'].text
			self.description = xml_element.elements['description'].text
			self.query = xml_element.elements['query'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
		end

	end

	class KalturaReportBaseTotal < KalturaObjectBase
		attr_accessor :id
		attr_accessor :data


		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.data = xml_element.elements['data'].text
		end

	end

	class KalturaReportGraph < KalturaObjectBase
		attr_accessor :id
		attr_accessor :data


		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.data = xml_element.elements['data'].text
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
			self.from_date = xml_element.elements['fromDate'].text
			self.to_date = xml_element.elements['toDate'].text
			self.from_day = xml_element.elements['fromDay'].text
			self.to_day = xml_element.elements['toDay'].text
		end

	end

	class KalturaReportResponse < KalturaObjectBase
		attr_accessor :columns
		attr_accessor :results


		def from_xml(xml_element)
			super
			self.columns = xml_element.elements['columns'].text
			self.results = KalturaClientBase.object_from_xml(xml_element.elements['results'], 'KalturaString')
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
			self.header = xml_element.elements['header'].text
			self.data = xml_element.elements['data'].text
			self.total_count = xml_element.elements['totalCount'].text
		end

	end

	class KalturaReportTotal < KalturaObjectBase
		attr_accessor :header
		attr_accessor :data


		def from_xml(xml_element)
			super
			self.header = xml_element.elements['header'].text
			self.data = xml_element.elements['data'].text
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
			self.id = xml_element.elements['id'].text
			self.system_name = xml_element.elements['systemName'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.status = xml_element.elements['status'].text
			self.version = xml_element.elements['version'].text
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
			self.limit = xml_element.elements['limit'].text
			self.cached_object_type = xml_element.elements['cachedObjectType'].text
			self.object_id = xml_element.elements['objectId'].text
			self.start_object_key = xml_element.elements['startObjectKey'].text
			self.end_object_key = xml_element.elements['endObjectKey'].text
			self.job_created_at = xml_element.elements['jobCreatedAt'].text
			self.is_first_loop = xml_element.elements['isFirstLoop'].text
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
			self.last_object_key = xml_element.elements['lastObjectKey'].text
			self.recalculated = xml_element.elements['recalculated'].text
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
			self.key_words = xml_element.elements['keyWords'].text
			self.search_source = xml_element.elements['searchSource'].text
			self.media_type = xml_element.elements['mediaType'].text
			self.extra_data = xml_element.elements['extraData'].text
			self.auth_data = xml_element.elements['authData'].text
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
			self.auth_data = xml_element.elements['authData'].text
			self.login_url = xml_element.elements['loginUrl'].text
			self.message = xml_element.elements['message'].text
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
			self.id = xml_element.elements['id'].text
			self.title = xml_element.elements['title'].text
			self.thumb_url = xml_element.elements['thumbUrl'].text
			self.description = xml_element.elements['description'].text
			self.tags = xml_element.elements['tags'].text
			self.url = xml_element.elements['url'].text
			self.source_link = xml_element.elements['sourceLink'].text
			self.credit = xml_element.elements['credit'].text
			self.license_type = xml_element.elements['licenseType'].text
			self.flash_playback_type = xml_element.elements['flashPlaybackType'].text
			self.file_ext = xml_element.elements['fileExt'].text
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
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaSearchResult')
			self.need_media_info = xml_element.elements['needMediaInfo'].text
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
		def parent_id=(val)
			@parent_id = val.to_i
		end

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.heartbeat_time = xml_element.elements['heartbeatTime'].text
			self.name = xml_element.elements['name'].text
			self.system_name = xml_element.elements['systemName'].text
			self.description = xml_element.elements['description'].text
			self.host_name = xml_element.elements['hostName'].text
			self.status = xml_element.elements['status'].text
			self.type = xml_element.elements['type'].text
			self.tags = xml_element.elements['tags'].text
			self.dc = xml_element.elements['dc'].text
			self.parent_id = xml_element.elements['parentId'].text
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
			self.ks = xml_element.elements['ks'].text
			self.session_type = xml_element.elements['sessionType'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.user_id = xml_element.elements['userId'].text
			self.expiry = xml_element.elements['expiry'].text
			self.privileges = xml_element.elements['privileges'].text
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
			self.actual_file_sync_local_path = xml_element.elements['actualFileSyncLocalPath'].text
			self.asset_id = xml_element.elements['assetId'].text
			self.asset_params_id = xml_element.elements['assetParamsId'].text
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
			self.partner_id = xml_element.elements['partnerId'].text
			self.ks = xml_element.elements['ks'].text
			self.user_id = xml_element.elements['userId'].text
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
			self.client_ver = xml_element.elements['clientVer'].text
			self.event_type = xml_element.elements['eventType'].text
			self.event_timestamp = xml_element.elements['eventTimestamp'].text
			self.session_id = xml_element.elements['sessionId'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.entry_id = xml_element.elements['entryId'].text
			self.unique_viewer = xml_element.elements['uniqueViewer'].text
			self.widget_id = xml_element.elements['widgetId'].text
			self.uiconf_id = xml_element.elements['uiconfId'].text
			self.user_id = xml_element.elements['userId'].text
			self.current_point = xml_element.elements['currentPoint'].text
			self.duration = xml_element.elements['duration'].text
			self.user_ip = xml_element.elements['userIp'].text
			self.process_duration = xml_element.elements['processDuration'].text
			self.control_id = xml_element.elements['controlId'].text
			self.seek = xml_element.elements['seek'].text
			self.new_point = xml_element.elements['newPoint'].text
			self.referrer = xml_element.elements['referrer'].text
			self.is_first_in_session = xml_element.elements['isFirstInSession'].text
			self.application_id = xml_element.elements['applicationId'].text
			self.context_id = xml_element.elements['contextId'].text
			self.feature_type = xml_element.elements['featureType'].text
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
			self.client_ver = xml_element.elements['clientVer'].text
			self.kmc_event_action_path = xml_element.elements['kmcEventActionPath'].text
			self.kmc_event_type = xml_element.elements['kmcEventType'].text
			self.event_timestamp = xml_element.elements['eventTimestamp'].text
			self.session_id = xml_element.elements['sessionId'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.entry_id = xml_element.elements['entryId'].text
			self.widget_id = xml_element.elements['widgetId'].text
			self.uiconf_id = xml_element.elements['uiconfId'].text
			self.user_id = xml_element.elements['userId'].text
			self.user_ip = xml_element.elements['userIp'].text
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

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.name = xml_element.elements['name'].text
			self.system_name = xml_element.elements['systemName'].text
			self.desciption = xml_element.elements['desciption'].text
			self.status = xml_element.elements['status'].text
			self.protocol = xml_element.elements['protocol'].text
			self.storage_url = xml_element.elements['storageUrl'].text
			self.storage_base_dir = xml_element.elements['storageBaseDir'].text
			self.storage_username = xml_element.elements['storageUsername'].text
			self.storage_password = xml_element.elements['storagePassword'].text
			self.storage_ftp_passive_mode = xml_element.elements['storageFtpPassiveMode'].text
			self.min_file_size = xml_element.elements['minFileSize'].text
			self.max_file_size = xml_element.elements['maxFileSize'].text
			self.flavor_params_ids = xml_element.elements['flavorParamsIds'].text
			self.max_concurrent_connections = xml_element.elements['maxConcurrentConnections'].text
			self.path_manager_class = xml_element.elements['pathManagerClass'].text
			self.path_manager_params = KalturaClientBase.object_from_xml(xml_element.elements['pathManagerParams'], 'KalturaKeyValue')
			self.trigger = xml_element.elements['trigger'].text
			self.delivery_priority = xml_element.elements['deliveryPriority'].text
			self.delivery_status = xml_element.elements['deliveryStatus'].text
			self.ready_behavior = xml_element.elements['readyBehavior'].text
			self.allow_auto_delete = xml_element.elements['allowAutoDelete'].text
			self.create_file_link = xml_element.elements['createFileLink'].text
			self.rules = KalturaClientBase.object_from_xml(xml_element.elements['rules'], 'KalturaRule')
			self.delivery_profile_ids = KalturaClientBase.object_from_xml(xml_element.elements['deliveryProfileIds'], 'KalturaKeyValue')
			self.private_key = xml_element.elements['privateKey'].text
			self.public_key = xml_element.elements['publicKey'].text
			self.pass_phrase = xml_element.elements['passPhrase'].text
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
			self.total_entry_count = xml_element.elements['totalEntryCount'].text
			self.actual_entry_count = xml_element.elements['actualEntryCount'].text
			self.require_transcoding_count = xml_element.elements['requireTranscodingCount'].text
		end

	end

	class KalturaThumbnailServeOptions < KalturaObjectBase
		attr_accessor :download
		attr_accessor :referrer

		def download=(val)
			@download = to_b(val)
		end

		def from_xml(xml_element)
			super
			self.download = xml_element.elements['download'].text
			self.referrer = xml_element.elements['referrer'].text
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
			self.id = xml_element.elements['id'].text
			self.name = xml_element.elements['name'].text
			self.description = xml_element.elements['description'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.obj_type = xml_element.elements['objType'].text
			self.obj_type_as_string = xml_element.elements['objTypeAsString'].text
			self.width = xml_element.elements['width'].text
			self.height = xml_element.elements['height'].text
			self.html_params = xml_element.elements['htmlParams'].text
			self.swf_url = xml_element.elements['swfUrl'].text
			self.conf_file_path = xml_element.elements['confFilePath'].text
			self.conf_file = xml_element.elements['confFile'].text
			self.conf_file_features = xml_element.elements['confFileFeatures'].text
			self.config = xml_element.elements['config'].text
			self.conf_vars = xml_element.elements['confVars'].text
			self.use_cdn = xml_element.elements['useCdn'].text
			self.tags = xml_element.elements['tags'].text
			self.swf_url_version = xml_element.elements['swfUrlVersion'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.creation_mode = xml_element.elements['creationMode'].text
			self.html5url = xml_element.elements['html5Url'].text
			self.version = xml_element.elements['version'].text
			self.partner_tags = xml_element.elements['partnerTags'].text
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
			self.type = xml_element.elements['type'].text
			self.versions = KalturaClientBase.object_from_xml(xml_element.elements['versions'], 'KalturaString')
			self.directory = xml_element.elements['directory'].text
			self.filename = xml_element.elements['filename'].text
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
			self.upload_token_id = xml_element.elements['uploadTokenId'].text
			self.file_size = xml_element.elements['fileSize'].text
			self.error_code = xml_element.elements['errorCode'].text
			self.error_description = xml_element.elements['errorDescription'].text
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

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.user_id = xml_element.elements['userId'].text
			self.status = xml_element.elements['status'].text
			self.file_name = xml_element.elements['fileName'].text
			self.file_size = xml_element.elements['fileSize'].text
			self.uploaded_file_size = xml_element.elements['uploadedFileSize'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
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

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.type = xml_element.elements['type'].text
			self.screen_name = xml_element.elements['screenName'].text
			self.full_name = xml_element.elements['fullName'].text
			self.email = xml_element.elements['email'].text
			self.date_of_birth = xml_element.elements['dateOfBirth'].text
			self.country = xml_element.elements['country'].text
			self.state = xml_element.elements['state'].text
			self.city = xml_element.elements['city'].text
			self.zip = xml_element.elements['zip'].text
			self.thumbnail_url = xml_element.elements['thumbnailUrl'].text
			self.description = xml_element.elements['description'].text
			self.tags = xml_element.elements['tags'].text
			self.admin_tags = xml_element.elements['adminTags'].text
			self.gender = xml_element.elements['gender'].text
			self.status = xml_element.elements['status'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.partner_data = xml_element.elements['partnerData'].text
			self.indexed_partner_data_int = xml_element.elements['indexedPartnerDataInt'].text
			self.indexed_partner_data_string = xml_element.elements['indexedPartnerDataString'].text
			self.storage_size = xml_element.elements['storageSize'].text
			self.password = xml_element.elements['password'].text
			self.first_name = xml_element.elements['firstName'].text
			self.last_name = xml_element.elements['lastName'].text
			self.is_admin = xml_element.elements['isAdmin'].text
			self.language = xml_element.elements['language'].text
			self.last_login_time = xml_element.elements['lastLoginTime'].text
			self.status_updated_at = xml_element.elements['statusUpdatedAt'].text
			self.deleted_at = xml_element.elements['deletedAt'].text
			self.login_enabled = xml_element.elements['loginEnabled'].text
			self.role_ids = xml_element.elements['roleIds'].text
			self.role_names = xml_element.elements['roleNames'].text
			self.is_account_owner = xml_element.elements['isAccountOwner'].text
			self.allowed_partner_ids = xml_element.elements['allowedPartnerIds'].text
			self.allowed_partner_packages = xml_element.elements['allowedPartnerPackages'].text
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
			self.id = xml_element.elements['id'].text
			self.entry_id = xml_element.elements['entryId'].text
			self.user_id = xml_element.elements['userId'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.status = xml_element.elements['status'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.type = xml_element.elements['type'].text
		end

	end

	class KalturaUserLoginData < KalturaObjectBase
		attr_accessor :id
		attr_accessor :login_email


		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.login_email = xml_element.elements['loginEmail'].text
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
			self.id = xml_element.elements['id'].text
			self.name = xml_element.elements['name'].text
			self.system_name = xml_element.elements['systemName'].text
			self.description = xml_element.elements['description'].text
			self.status = xml_element.elements['status'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.permission_names = xml_element.elements['permissionNames'].text
			self.tags = xml_element.elements['tags'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
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
			self.id = xml_element.elements['id'].text
			self.source_widget_id = xml_element.elements['sourceWidgetId'].text
			self.root_widget_id = xml_element.elements['rootWidgetId'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.entry_id = xml_element.elements['entryId'].text
			self.ui_conf_id = xml_element.elements['uiConfId'].text
			self.security_type = xml_element.elements['securityType'].text
			self.security_policy = xml_element.elements['securityPolicy'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.partner_data = xml_element.elements['partnerData'].text
			self.widget_ht_ml = xml_element.elements['widgetHTML'].text
			self.enforce_entitlement = xml_element.elements['enforceEntitlement'].text
			self.privacy_context = xml_element.elements['privacyContext'].text
			self.add_embed_html5support = xml_element.elements['addEmbedHtml5Support'].text
			self.roles = xml_element.elements['roles'].text
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_greater_than_or_equal = xml_element.elements['idGreaterThanOrEqual'].text
			self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			self.partner_id_in = xml_element.elements['partnerIdIn'].text
			self.partner_id_not_in = xml_element.elements['partnerIdNotIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.execution_attempts_greater_than_or_equal = xml_element.elements['executionAttemptsGreaterThanOrEqual'].text
			self.execution_attempts_less_than_or_equal = xml_element.elements['executionAttemptsLessThanOrEqual'].text
			self.lock_version_greater_than_or_equal = xml_element.elements['lockVersionGreaterThanOrEqual'].text
			self.lock_version_less_than_or_equal = xml_element.elements['lockVersionLessThanOrEqual'].text
			self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			self.job_type_equal = xml_element.elements['jobTypeEqual'].text
			self.job_type_in = xml_element.elements['jobTypeIn'].text
			self.job_type_not_in = xml_element.elements['jobTypeNotIn'].text
			self.job_sub_type_equal = xml_element.elements['jobSubTypeEqual'].text
			self.job_sub_type_in = xml_element.elements['jobSubTypeIn'].text
			self.job_sub_type_not_in = xml_element.elements['jobSubTypeNotIn'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.status_not_in = xml_element.elements['statusNotIn'].text
			self.priority_greater_than_or_equal = xml_element.elements['priorityGreaterThanOrEqual'].text
			self.priority_less_than_or_equal = xml_element.elements['priorityLessThanOrEqual'].text
			self.priority_equal = xml_element.elements['priorityEqual'].text
			self.priority_in = xml_element.elements['priorityIn'].text
			self.priority_not_in = xml_element.elements['priorityNotIn'].text
			self.batch_version_greater_than_or_equal = xml_element.elements['batchVersionGreaterThanOrEqual'].text
			self.batch_version_less_than_or_equal = xml_element.elements['batchVersionLessThanOrEqual'].text
			self.batch_version_equal = xml_element.elements['batchVersionEqual'].text
			self.queue_time_greater_than_or_equal = xml_element.elements['queueTimeGreaterThanOrEqual'].text
			self.queue_time_less_than_or_equal = xml_element.elements['queueTimeLessThanOrEqual'].text
			self.finish_time_greater_than_or_equal = xml_element.elements['finishTimeGreaterThanOrEqual'].text
			self.finish_time_less_than_or_equal = xml_element.elements['finishTimeLessThanOrEqual'].text
			self.err_type_equal = xml_element.elements['errTypeEqual'].text
			self.err_type_in = xml_element.elements['errTypeIn'].text
			self.err_type_not_in = xml_element.elements['errTypeNotIn'].text
			self.err_number_equal = xml_element.elements['errNumberEqual'].text
			self.err_number_in = xml_element.elements['errNumberIn'].text
			self.err_number_not_in = xml_element.elements['errNumberNotIn'].text
			self.estimated_effort_less_than = xml_element.elements['estimatedEffortLessThan'].text
			self.estimated_effort_greater_than = xml_element.elements['estimatedEffortGreaterThan'].text
			self.urgency_less_than_or_equal = xml_element.elements['urgencyLessThanOrEqual'].text
			self.urgency_greater_than_or_equal = xml_element.elements['urgencyGreaterThanOrEqual'].text
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
			self.delivery_profile_ids = xml_element.elements['deliveryProfileIds'].text
			self.is_blocked_list = xml_element.elements['isBlockedList'].text
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
			self.flavor_params_ids = xml_element.elements['flavorParamsIds'].text
			self.is_blocked_list = xml_element.elements['isBlockedList'].text
		end

	end

	class KalturaAccessControlListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaAccessControl')
		end

	end

	class KalturaAccessControlModifyRequestHostRegexAction < KalturaRuleAction
		# Request host regex pattern
		attr_accessor :pattern
		# Request host regex replacment
		attr_accessor :replacement


		def from_xml(xml_element)
			super
			self.pattern = xml_element.elements['pattern'].text
			self.replacement = xml_element.elements['replacement'].text
		end

	end

	class KalturaAccessControlPreviewAction < KalturaRuleAction
		attr_accessor :limit

		def limit=(val)
			@limit = val.to_i
		end

		def from_xml(xml_element)
			super
			self.limit = xml_element.elements['limit'].text
		end

	end

	class KalturaAccessControlProfileListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaAccessControlProfile')
		end

	end

	class KalturaAccessControlServeRemoteEdgeServerAction < KalturaRuleAction
		# Comma separated list of edge servers playBack should be done from
		attr_accessor :edge_server_ids


		def from_xml(xml_element)
			super
			self.edge_server_ids = xml_element.elements['edgeServerIds'].text
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


		def from_xml(xml_element)
			super
			self.files_permission_in_s3 = xml_element.elements['filesPermissionInS3'].text
			self.s3region = xml_element.elements['s3Region'].text
		end

	end

	class KalturaApiActionPermissionItem < KalturaPermissionItem
		attr_accessor :service
		attr_accessor :action


		def from_xml(xml_element)
			super
			self.service = xml_element.elements['service'].text
			self.action = xml_element.elements['action'].text
		end

	end

	class KalturaApiParameterPermissionItem < KalturaPermissionItem
		attr_accessor :object
		attr_accessor :parameter
		attr_accessor :action


		def from_xml(xml_element)
			super
			self.object = xml_element.elements['object'].text
			self.parameter = xml_element.elements['parameter'].text
			self.action = xml_element.elements['action'].text
		end

	end

	class KalturaAppTokenBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
		end

	end

	class KalturaAppTokenListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaAppToken')
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
			self.asset_params_id = xml_element.elements['assetParamsId'].text
			self.asset_params_version = xml_element.elements['assetParamsVersion'].text
			self.asset_id = xml_element.elements['assetId'].text
			self.asset_version = xml_element.elements['assetVersion'].text
			self.ready_behavior = xml_element.elements['readyBehavior'].text
			self.format = xml_element.elements['format'].text
		end

	end

	class KalturaAssetPropertiesCompareCondition < KalturaCondition
		# Array of key/value objects that holds the property and the value to find and compare on an asset object
		attr_accessor :properties


		def from_xml(xml_element)
			super
			self.properties = KalturaClientBase.object_from_xml(xml_element.elements['properties'], 'KalturaKeyValue')
		end

	end

	class KalturaAssetsParamsResourceContainers < KalturaResource
		# Array of resources associated with asset params ids
		attr_accessor :resources


		def from_xml(xml_element)
			super
			self.resources = KalturaClientBase.object_from_xml(xml_element.elements['resources'], 'KalturaAssetParamsResourceContainer')
		end

	end

	class KalturaAttributeCondition < KalturaSearchItem
		attr_accessor :value


		def from_xml(xml_element)
			super
			self.value = xml_element.elements['value'].text
		end

	end

	class KalturaAuthenticatedCondition < KalturaCondition
		# The privelege needed to remove the restriction
		attr_accessor :privileges


		def from_xml(xml_element)
			super
			self.privileges = KalturaClientBase.object_from_xml(xml_element.elements['privileges'], 'KalturaStringValue')
		end

	end

	class KalturaBaseEntryCloneOptionComponent < KalturaBaseEntryCloneOptionItem
		attr_accessor :item_type
		# condition rule (include/exclude)
		attr_accessor :rule


		def from_xml(xml_element)
			super
			self.item_type = xml_element.elements['itemType'].text
			self.rule = xml_element.elements['rule'].text
		end

	end

	class KalturaBaseEntryListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaBaseEntry')
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
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaBaseSyndicationFeed')
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
			self.entry_ids = xml_element.elements['entryIds'].text
			self.flavor_params_id = xml_element.elements['flavorParamsId'].text
			self.puser_id = xml_element.elements['puserId'].text
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
			self.uploaded_on_greater_than_or_equal = xml_element.elements['uploadedOnGreaterThanOrEqual'].text
			self.uploaded_on_less_than_or_equal = xml_element.elements['uploadedOnLessThanOrEqual'].text
			self.uploaded_on_equal = xml_element.elements['uploadedOnEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.bulk_upload_object_type_equal = xml_element.elements['bulkUploadObjectTypeEqual'].text
			self.bulk_upload_object_type_in = xml_element.elements['bulkUploadObjectTypeIn'].text
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
			self.conversion_profile_id = xml_element.elements['conversionProfileId'].text
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
			self.user_id = xml_element.elements['userId'].text
			self.uploaded_by = xml_element.elements['uploadedBy'].text
			self.conversion_profile_id = xml_element.elements['conversionProfileId'].text
			self.results_file_local_path = xml_element.elements['resultsFileLocalPath'].text
			self.results_file_url = xml_element.elements['resultsFileUrl'].text
			self.num_of_entries = xml_element.elements['numOfEntries'].text
			self.num_of_objects = xml_element.elements['numOfObjects'].text
			self.file_path = xml_element.elements['filePath'].text
			self.bulk_upload_object_type = xml_element.elements['bulkUploadObjectType'].text
			self.file_name = xml_element.elements['fileName'].text
			self.object_data = KalturaClientBase.object_from_xml(xml_element.elements['objectData'], 'KalturaBulkUploadObjectData')
			self.type = xml_element.elements['type'].text
			self.email_recipients = xml_element.elements['emailRecipients'].text
			self.num_of_error_objects = xml_element.elements['numOfErrorObjects'].text
		end

	end

	class KalturaBulkUploadListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaBulkUpload')
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
			self.relative_path = xml_element.elements['relativePath'].text
			self.name = xml_element.elements['name'].text
			self.reference_id = xml_element.elements['referenceId'].text
			self.description = xml_element.elements['description'].text
			self.tags = xml_element.elements['tags'].text
			self.appear_in_list = xml_element.elements['appearInList'].text
			self.privacy = xml_element.elements['privacy'].text
			self.inheritance_type = xml_element.elements['inheritanceType'].text
			self.user_join_policy = xml_element.elements['userJoinPolicy'].text
			self.default_permission_level = xml_element.elements['defaultPermissionLevel'].text
			self.owner = xml_element.elements['owner'].text
			self.contribution_policy = xml_element.elements['contributionPolicy'].text
			self.partner_sort_value = xml_element.elements['partnerSortValue'].text
			self.moderation = xml_element.elements['moderation'].text
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
			self.category_id = xml_element.elements['categoryId'].text
			self.entry_id = xml_element.elements['entryId'].text
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
			self.category_id = xml_element.elements['categoryId'].text
			self.category_reference_id = xml_element.elements['categoryReferenceId'].text
			self.user_id = xml_element.elements['userId'].text
			self.permission_level = xml_element.elements['permissionLevel'].text
			self.update_method = xml_element.elements['updateMethod'].text
			self.required_object_status = xml_element.elements['requiredObjectStatus'].text
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
			self.entry_id = xml_element.elements['entryId'].text
			self.title = xml_element.elements['title'].text
			self.description = xml_element.elements['description'].text
			self.tags = xml_element.elements['tags'].text
			self.url = xml_element.elements['url'].text
			self.content_type = xml_element.elements['contentType'].text
			self.conversion_profile_id = xml_element.elements['conversionProfileId'].text
			self.access_control_profile_id = xml_element.elements['accessControlProfileId'].text
			self.category = xml_element.elements['category'].text
			self.schedule_start_date = xml_element.elements['scheduleStartDate'].text
			self.schedule_end_date = xml_element.elements['scheduleEndDate'].text
			self.entry_status = xml_element.elements['entryStatus'].text
			self.thumbnail_url = xml_element.elements['thumbnailUrl'].text
			self.thumbnail_saved = xml_element.elements['thumbnailSaved'].text
			self.ssh_private_key = xml_element.elements['sshPrivateKey'].text
			self.ssh_public_key = xml_element.elements['sshPublicKey'].text
			self.ssh_key_passphrase = xml_element.elements['sshKeyPassphrase'].text
			self.creator_id = xml_element.elements['creatorId'].text
			self.entitled_users_edit = xml_element.elements['entitledUsersEdit'].text
			self.entitled_users_publish = xml_element.elements['entitledUsersPublish'].text
			self.owner_id = xml_element.elements['ownerId'].text
			self.reference_id = xml_element.elements['referenceId'].text
			self.template_entry_id = xml_element.elements['templateEntryId'].text
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

		def date_of_birth=(val)
			@date_of_birth = val.to_i
		end
		def gender=(val)
			@gender = val.to_i
		end

		def from_xml(xml_element)
			super
			self.user_id = xml_element.elements['userId'].text
			self.screen_name = xml_element.elements['screenName'].text
			self.email = xml_element.elements['email'].text
			self.description = xml_element.elements['description'].text
			self.tags = xml_element.elements['tags'].text
			self.date_of_birth = xml_element.elements['dateOfBirth'].text
			self.country = xml_element.elements['country'].text
			self.state = xml_element.elements['state'].text
			self.city = xml_element.elements['city'].text
			self.zip = xml_element.elements['zip'].text
			self.gender = xml_element.elements['gender'].text
			self.first_name = xml_element.elements['firstName'].text
			self.last_name = xml_element.elements['lastName'].text
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
		attr_accessor :src_file_sync_local_path
		# The translated path as used by the scheduler
		attr_accessor :actual_src_file_sync_local_path
		attr_accessor :src_file_sync_remote_url
		attr_accessor :thumb_params_output_id
		attr_accessor :thumb_asset_id
		attr_accessor :src_asset_id
		attr_accessor :src_asset_type
		attr_accessor :thumb_path

		def thumb_params_output_id=(val)
			@thumb_params_output_id = val.to_i
		end

		def from_xml(xml_element)
			super
			self.src_file_sync_local_path = xml_element.elements['srcFileSyncLocalPath'].text
			self.actual_src_file_sync_local_path = xml_element.elements['actualSrcFileSyncLocalPath'].text
			self.src_file_sync_remote_url = xml_element.elements['srcFileSyncRemoteUrl'].text
			self.thumb_params_output_id = xml_element.elements['thumbParamsOutputId'].text
			self.thumb_asset_id = xml_element.elements['thumbAssetId'].text
			self.src_asset_id = xml_element.elements['srcAssetId'].text
			self.src_asset_type = xml_element.elements['srcAssetType'].text
			self.thumb_path = xml_element.elements['thumbPath'].text
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
			self.categories_match_or = xml_element.elements['categoriesMatchOr'].text
			self.category_entry_status_in = xml_element.elements['categoryEntryStatusIn'].text
			self.order_by = xml_element.elements['orderBy'].text
			self.category_id_equal = xml_element.elements['categoryIdEqual'].text
		end

	end

	class KalturaCategoryEntryListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaCategoryEntry')
		end

	end

	class KalturaCategoryIdentifier < KalturaObjectIdentifier
		# Identifier of the object
		attr_accessor :identifier


		def from_xml(xml_element)
			super
			self.identifier = xml_element.elements['identifier'].text
		end

	end

	class KalturaCategoryListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaCategory')
		end

	end

	class KalturaCategoryUserAdvancedFilter < KalturaSearchItem
		attr_accessor :member_id_eq
		attr_accessor :member_id_in
		attr_accessor :member_permissions_match_or
		attr_accessor :member_permissions_match_and


		def from_xml(xml_element)
			super
			self.member_id_eq = xml_element.elements['memberIdEq'].text
			self.member_id_in = xml_element.elements['memberIdIn'].text
			self.member_permissions_match_or = xml_element.elements['memberPermissionsMatchOr'].text
			self.member_permissions_match_and = xml_element.elements['memberPermissionsMatchAnd'].text
		end

	end

	class KalturaCategoryUserListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaCategoryUser')
		end

	end

	# Clip operation attributes
	class KalturaClipAttributes < KalturaOperationAttributes
		# Offset in milliseconds
		attr_accessor :offset
		# Duration in milliseconds
		attr_accessor :duration

		def offset=(val)
			@offset = val.to_i
		end
		def duration=(val)
			@duration = val.to_i
		end

		def from_xml(xml_element)
			super
			self.offset = xml_element.elements['offset'].text
			self.duration = xml_element.elements['duration'].text
		end

	end

	class KalturaCompareCondition < KalturaCondition
		# Value to evaluate against the field and operator
		attr_accessor :value
		# Comparing operator
		attr_accessor :comparison


		def from_xml(xml_element)
			super
			self.value = KalturaClientBase.object_from_xml(xml_element.elements['value'], 'KalturaIntegerValue')
			self.comparison = xml_element.elements['comparison'].text
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
			self.resource = KalturaClientBase.object_from_xml(xml_element.elements['resource'], 'KalturaDataCenterContentResource')
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

		def offset=(val)
			@offset = val.to_f
		end
		def duration=(val)
			@duration = val.to_f
		end
		def concatenated_duration=(val)
			@concatenated_duration = val.to_f
		end

		def from_xml(xml_element)
			super
			self.src_files = KalturaClientBase.object_from_xml(xml_element.elements['srcFiles'], 'KalturaString')
			self.dest_file_path = xml_element.elements['destFilePath'].text
			self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			self.offset = xml_element.elements['offset'].text
			self.duration = xml_element.elements['duration'].text
			self.concatenated_duration = xml_element.elements['concatenatedDuration'].text
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.created_by_id_equal = xml_element.elements['createdByIdEqual'].text
			self.type_equal = xml_element.elements['typeEqual'].text
			self.type_in = xml_element.elements['typeIn'].text
			self.target_type_equal = xml_element.elements['targetTypeEqual'].text
			self.target_type_in = xml_element.elements['targetTypeIn'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
		end

	end

	class KalturaControlPanelCommandListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaControlPanelCommand')
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
			self.src_file_sync_local_path = xml_element.elements['srcFileSyncLocalPath'].text
			self.actual_src_file_sync_local_path = xml_element.elements['actualSrcFileSyncLocalPath'].text
			self.src_file_sync_remote_url = xml_element.elements['srcFileSyncRemoteUrl'].text
			self.src_file_syncs = KalturaClientBase.object_from_xml(xml_element.elements['srcFileSyncs'], 'KalturaSourceFileSyncDescriptor')
			self.engine_version = xml_element.elements['engineVersion'].text
			self.flavor_params_output_id = xml_element.elements['flavorParamsOutputId'].text
			self.flavor_params_output = KalturaClientBase.object_from_xml(xml_element.elements['flavorParamsOutput'], 'KalturaFlavorParamsOutput')
			self.media_info_id = xml_element.elements['mediaInfoId'].text
			self.current_operation_set = xml_element.elements['currentOperationSet'].text
			self.current_operation_index = xml_element.elements['currentOperationIndex'].text
			self.plugin_data = KalturaClientBase.object_from_xml(xml_element.elements['pluginData'], 'KalturaKeyValue')
		end

	end

	class KalturaConversionProfileAssetParamsListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaConversionProfileAssetParams')
		end

	end

	class KalturaConversionProfileListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaConversionProfile')
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
			self.entry_id = xml_element.elements['entryId'].text
			self.asset_id = xml_element.elements['assetId'].text
			self.media_server_index = xml_element.elements['mediaServerIndex'].text
			self.file_index = xml_element.elements['fileIndex'].text
			self.src_file_path = xml_element.elements['srcFilePath'].text
			self.dest_file_path = xml_element.elements['destFilePath'].text
			self.end_time = xml_element.elements['endTime'].text
			self.dest_data_file_path = xml_element.elements['destDataFilePath'].text
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
			self.input_file_sync_local_path = xml_element.elements['inputFileSyncLocalPath'].text
			self.thumb_height = xml_element.elements['thumbHeight'].text
			self.thumb_bitrate = xml_element.elements['thumbBitrate'].text
		end

	end

	class KalturaCopyJobData < KalturaJobData
		# The filter should return the list of objects that need to be copied.
		attr_accessor :filter
		# Indicates the last id that copied, used when the batch crached, to re-run from the last crash point.
		attr_accessor :last_copy_id
		# Template object to overwrite attributes on the copied object
		attr_accessor :template_object

		def last_copy_id=(val)
			@last_copy_id = val.to_i
		end

		def from_xml(xml_element)
			super
			self.filter = KalturaClientBase.object_from_xml(xml_element.elements['filter'], 'KalturaFilter')
			self.last_copy_id = xml_element.elements['lastCopyId'].text
			self.template_object = KalturaClientBase.object_from_xml(xml_element.elements['templateObject'], 'KalturaObjectBase')
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
			self.from_partner_id = xml_element.elements['fromPartnerId'].text
			self.to_partner_id = xml_element.elements['toPartnerId'].text
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
			self.country_restriction_type = xml_element.elements['countryRestrictionType'].text
			self.country_list = xml_element.elements['countryList'].text
		end

	end

	class KalturaDataListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaDataEntry')
		end

	end

	class KalturaDeleteFileJobData < KalturaJobData
		attr_accessor :local_file_sync_path


		def from_xml(xml_element)
			super
			self.local_file_sync_path = xml_element.elements['localFileSyncPath'].text
		end

	end

	class KalturaDeleteJobData < KalturaJobData
		# The filter should return the list of objects that need to be deleted.
		attr_accessor :filter


		def from_xml(xml_element)
			super
			self.filter = KalturaClientBase.object_from_xml(xml_element.elements['filter'], 'KalturaFilter')
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
			self.support_clipping = xml_element.elements['supportClipping'].text
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
			self.support_clipping = xml_element.elements['supportClipping'].text
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
			self.use_intelliseek = xml_element.elements['useIntelliseek'].text
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			self.partner_id_in = xml_element.elements['partnerIdIn'].text
			self.system_name_equal = xml_element.elements['systemNameEqual'].text
			self.system_name_in = xml_element.elements['systemNameIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.streamer_type_equal = xml_element.elements['streamerTypeEqual'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
		end

	end

	class KalturaDeliveryProfileCondition < KalturaCondition
		# The delivery ids that are accepted by this condition
		attr_accessor :delivery_profile_ids


		def from_xml(xml_element)
			super
			self.delivery_profile_ids = KalturaClientBase.object_from_xml(xml_element.elements['deliveryProfileIds'], 'KalturaIntegerValue')
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
			self.pattern = xml_element.elements['pattern'].text
			self.renderer_class = xml_element.elements['rendererClass'].text
			self.manifest_redirect = xml_element.elements['manifestRedirect'].text
		end

	end

	class KalturaDeliveryProfileGenericHds < KalturaDeliveryProfile
		attr_accessor :pattern
		# rendererClass
		attr_accessor :renderer_class


		def from_xml(xml_element)
			super
			self.pattern = xml_element.elements['pattern'].text
			self.renderer_class = xml_element.elements['rendererClass'].text
		end

	end

	class KalturaDeliveryProfileGenericHttp < KalturaDeliveryProfile
		attr_accessor :pattern


		def from_xml(xml_element)
			super
			self.pattern = xml_element.elements['pattern'].text
		end

	end

	class KalturaDeliveryProfileGenericSilverLight < KalturaDeliveryProfile
		attr_accessor :pattern


		def from_xml(xml_element)
			super
			self.pattern = xml_element.elements['pattern'].text
		end

	end

	class KalturaDeliveryProfileListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaDeliveryProfile')
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
			self.disable_extra_attributes = xml_element.elements['disableExtraAttributes'].text
			self.force_proxy = xml_element.elements['forceProxy'].text
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
			self.enforce_rtmpe = xml_element.elements['enforceRtmpe'].text
			self.prefix = xml_element.elements['prefix'].text
		end

	end

	class KalturaDeliveryServerNode < KalturaServerNode
		# Delivery server playback Domain
		attr_accessor :playback_domain


		def from_xml(xml_element)
			super
			self.playback_domain = xml_element.elements['playbackDomain'].text
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
			self.directory_restriction_type = xml_element.elements['directoryRestrictionType'].text
		end

	end

	class KalturaDrmEntryContextPluginData < KalturaPluginData
		# For the uDRM we give the drm context data which is a json encoding of an array containing the uDRM data
		#      for each flavor that is required from this getContextData request.
		attr_accessor :flavor_data


		def from_xml(xml_element)
			super
			self.flavor_data = xml_element.elements['flavorData'].text
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
			self.category_id_equal = xml_element.elements['categoryIdEqual'].text
			self.category_id_in = xml_element.elements['categoryIdIn'].text
			self.user_id_equal = xml_element.elements['userIdEqual'].text
			self.user_id_in = xml_element.elements['userIdIn'].text
			self.permission_level_equal = xml_element.elements['permissionLevelEqual'].text
			self.permission_level_in = xml_element.elements['permissionLevelIn'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.update_method_equal = xml_element.elements['updateMethodEqual'].text
			self.update_method_in = xml_element.elements['updateMethodIn'].text
			self.category_full_ids_starts_with = xml_element.elements['categoryFullIdsStartsWith'].text
			self.category_full_ids_equal = xml_element.elements['categoryFullIdsEqual'].text
			self.permission_names_match_and = xml_element.elements['permissionNamesMatchAnd'].text
			self.permission_names_match_or = xml_element.elements['permissionNamesMatchOr'].text
			self.permission_names_not_contains = xml_element.elements['permissionNamesNotContains'].text
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
			self.category_direct_members = xml_element.elements['categoryDirectMembers'].text
			self.free_text = xml_element.elements['freeText'].text
			self.related_groups_by_user_id = xml_element.elements['relatedGroupsByUserId'].text
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
			self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			self.type_equal = xml_element.elements['typeEqual'].text
			self.type_in = xml_element.elements['typeIn'].text
			self.screen_name_like = xml_element.elements['screenNameLike'].text
			self.screen_name_starts_with = xml_element.elements['screenNameStartsWith'].text
			self.email_like = xml_element.elements['emailLike'].text
			self.email_starts_with = xml_element.elements['emailStartsWith'].text
			self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.first_name_starts_with = xml_element.elements['firstNameStartsWith'].text
			self.last_name_starts_with = xml_element.elements['lastNameStartsWith'].text
			self.is_admin_equal = xml_element.elements['isAdminEqual'].text
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
			self.id_or_screen_name_starts_with = xml_element.elements['idOrScreenNameStartsWith'].text
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.login_enabled_equal = xml_element.elements['loginEnabledEqual'].text
			self.role_id_equal = xml_element.elements['roleIdEqual'].text
			self.role_ids_equal = xml_element.elements['roleIdsEqual'].text
			self.role_ids_in = xml_element.elements['roleIdsIn'].text
			self.first_name_or_last_name_starts_with = xml_element.elements['firstNameOrLastNameStartsWith'].text
			self.permission_names_multi_like_or = xml_element.elements['permissionNamesMultiLikeOr'].text
			self.permission_names_multi_like_and = xml_element.elements['permissionNamesMultiLikeAnd'].text
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
			self.entry_id = xml_element.elements['entryId'].text
			self.follow_entry_redirect = xml_element.elements['followEntryRedirect'].text
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
			self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			self.flavor_tags = xml_element.elements['flavorTags'].text
			self.streamer_type = xml_element.elements['streamerType'].text
			self.media_protocol = xml_element.elements['mediaProtocol'].text
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
			self.is_site_restricted = xml_element.elements['isSiteRestricted'].text
			self.is_country_restricted = xml_element.elements['isCountryRestricted'].text
			self.is_session_restricted = xml_element.elements['isSessionRestricted'].text
			self.is_ip_address_restricted = xml_element.elements['isIpAddressRestricted'].text
			self.is_user_agent_restricted = xml_element.elements['isUserAgentRestricted'].text
			self.preview_length = xml_element.elements['previewLength'].text
			self.is_scheduled_now = xml_element.elements['isScheduledNow'].text
			self.is_admin = xml_element.elements['isAdmin'].text
			self.streamer_type = xml_element.elements['streamerType'].text
			self.media_protocol = xml_element.elements['mediaProtocol'].text
			self.storage_profiles_xml = xml_element.elements['storageProfilesXML'].text
			self.access_control_messages = KalturaClientBase.object_from_xml(xml_element.elements['accessControlMessages'], 'KalturaString')
			self.access_control_actions = KalturaClientBase.object_from_xml(xml_element.elements['accessControlActions'], 'KalturaRuleAction')
			self.flavor_assets = KalturaClientBase.object_from_xml(xml_element.elements['flavorAssets'], 'KalturaFlavorAsset')
			self.ms_duration = xml_element.elements['msDuration'].text
			self.plugin_data = KalturaClientBase.object_from_xml(xml_element.elements['pluginData'], 'KalturaPluginData')
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
			self.cue_points_free_text = xml_element.elements['cuePointsFreeText'].text
			self.cue_point_type_in = xml_element.elements['cuePointTypeIn'].text
			self.cue_point_sub_type_equal = xml_element.elements['cuePointSubTypeEqual'].text
		end

	end

	class KalturaEntryIdentifier < KalturaObjectIdentifier
		# Identifier of the object
		attr_accessor :identifier


		def from_xml(xml_element)
			super
			self.identifier = xml_element.elements['identifier'].text
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
			self.entry_id = xml_element.elements['entryId'].text
			self.peak_audience = xml_element.elements['peakAudience'].text
			self.peak_dvr_audience = xml_element.elements['peakDvrAudience'].text
		end

	end

	class KalturaEntryServerNodeListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaEntryServerNode')
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
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaFeatureStatus')
		end

	end

	class KalturaFileAssetListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaFileAsset')
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
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaFlavorAsset')
		end

	end

	class KalturaFlavorParamsListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaFlavorParams')
		end

	end

	class KalturaGenericSyndicationFeed < KalturaBaseSyndicationFeed
		# feed description
		attr_accessor :feed_description
		# feed landing page (i.e publisher website)
		attr_accessor :feed_landing_page


		def from_xml(xml_element)
			super
			self.feed_description = xml_element.elements['feedDescription'].text
			self.feed_landing_page = xml_element.elements['feedLandingPage'].text
		end

	end

	class KalturaGoogleVideoSyndicationFeed < KalturaBaseSyndicationFeed
		attr_accessor :adult_content


		def from_xml(xml_element)
			super
			self.adult_content = xml_element.elements['adultContent'].text
		end

	end

	class KalturaGroupUserListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaGroupUser')
		end

	end

	class KalturaHashCondition < KalturaCondition
		# hash name
		attr_accessor :hash_name
		# hash secret
		attr_accessor :hash_secret


		def from_xml(xml_element)
			super
			self.hash_name = xml_element.elements['hashName'].text
			self.hash_secret = xml_element.elements['hashSecret'].text
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
		# true in case you want to enfore the palylist order on the
		attr_accessor :enforce_order

		def enforce_order=(val)
			@enforce_order = val.to_i
		end

		def from_xml(xml_element)
			super
			self.feed_description = xml_element.elements['feedDescription'].text
			self.language = xml_element.elements['language'].text
			self.feed_landing_page = xml_element.elements['feedLandingPage'].text
			self.owner_name = xml_element.elements['ownerName'].text
			self.owner_email = xml_element.elements['ownerEmail'].text
			self.feed_image_url = xml_element.elements['feedImageUrl'].text
			self.category = xml_element.elements['category'].text
			self.adult_content = xml_element.elements['adultContent'].text
			self.feed_author = xml_element.elements['feedAuthor'].text
			self.enforce_order = xml_element.elements['enforceOrder'].text
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
			self.src_file_url = xml_element.elements['srcFileUrl'].text
			self.dest_file_local_path = xml_element.elements['destFileLocalPath'].text
			self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			self.file_size = xml_element.elements['fileSize'].text
		end

	end

	class KalturaIndexAdvancedFilter < KalturaSearchItem
		attr_accessor :index_id_greater_than

		def index_id_greater_than=(val)
			@index_id_greater_than = val.to_i
		end

		def from_xml(xml_element)
			super
			self.index_id_greater_than = xml_element.elements['indexIdGreaterThan'].text
		end

	end

	class KalturaIndexJobData < KalturaJobData
		# The filter should return the list of objects that need to be reindexed.
		attr_accessor :filter
		# Indicates the last id that reindexed, used when the batch crached, to re-run from the last crash point.
		attr_accessor :last_index_id
		# Indicates that the object columns and attributes values should be recalculated before reindexed.
		attr_accessor :should_update

		def last_index_id=(val)
			@last_index_id = val.to_i
		end
		def should_update=(val)
			@should_update = to_b(val)
		end

		def from_xml(xml_element)
			super
			self.filter = KalturaClientBase.object_from_xml(xml_element.elements['filter'], 'KalturaFilter')
			self.last_index_id = xml_element.elements['lastIndexId'].text
			self.should_update = xml_element.elements['shouldUpdate'].text
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
			self.ip_address_restriction_type = xml_element.elements['ipAddressRestrictionType'].text
			self.ip_address_list = xml_element.elements['ipAddressList'].text
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
			self.limit_flavors_restriction_type = xml_element.elements['limitFlavorsRestrictionType'].text
			self.flavor_params_ids = xml_element.elements['flavorParamsIds'].text
		end

	end

	class KalturaLiveChannelListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaLiveChannel')
		end

	end

	class KalturaLiveChannelSegmentListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaLiveChannelSegment')
		end

	end

	class KalturaLiveEntryServerNode < KalturaEntryServerNode
		# parameters of the stream we got
		attr_accessor :streams


		def from_xml(xml_element)
			super
			self.streams = KalturaClientBase.object_from_xml(xml_element.elements['streams'], 'KalturaLiveStreamParams')
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
			self.time_reference = xml_element.elements['timeReference'].text
			self.time_zone_offset = xml_element.elements['timeZoneOffset'].text
			self.entry_ids = xml_element.elements['entryIds'].text
			self.output_path = xml_element.elements['outputPath'].text
			self.recipient_email = xml_element.elements['recipientEmail'].text
		end

	end

	class KalturaLiveStatsListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaLiveStats')
		end

	end

	class KalturaLiveStreamListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaLiveStreamEntry')
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
			self.user_id = xml_element.elements['userId'].text
			self.password = xml_element.elements['password'].text
			self.stream_name = xml_element.elements['streamName'].text
			self.application_name = xml_element.elements['applicationName'].text
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
			self.mail_type = xml_element.elements['mailType'].text
			self.mail_priority = xml_element.elements['mailPriority'].text
			self.status = xml_element.elements['status'].text
			self.recipient_name = xml_element.elements['recipientName'].text
			self.recipient_email = xml_element.elements['recipientEmail'].text
			self.recipient_id = xml_element.elements['recipientId'].text
			self.from_name = xml_element.elements['fromName'].text
			self.from_email = xml_element.elements['fromEmail'].text
			self.body_params = xml_element.elements['bodyParams'].text
			self.subject_params = xml_element.elements['subjectParams'].text
			self.template_path = xml_element.elements['templatePath'].text
			self.language = xml_element.elements['language'].text
			self.campaign_id = xml_element.elements['campaignId'].text
			self.min_send_date = xml_element.elements['minSendDate'].text
			self.is_html = xml_element.elements['isHtml'].text
			self.separator = xml_element.elements['separator'].text
		end

	end

	class KalturaMatchCondition < KalturaCondition
		attr_accessor :values


		def from_xml(xml_element)
			super
			self.values = KalturaClientBase.object_from_xml(xml_element.elements['values'], 'KalturaStringValue')
		end

	end

	class KalturaMediaInfoBaseFilter < KalturaFilter
		attr_accessor :flavor_asset_id_equal


		def from_xml(xml_element)
			super
			self.flavor_asset_id_equal = xml_element.elements['flavorAssetIdEqual'].text
		end

	end

	class KalturaMediaListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaMediaEntry')
		end

	end

	class KalturaMixListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaMixEntry')
		end

	end

	class KalturaModerationFlagListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaModerationFlag')
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
			self.src_category_id = xml_element.elements['srcCategoryId'].text
			self.dest_category_id = xml_element.elements['destCategoryId'].text
			self.last_moved_category_id = xml_element.elements['lastMovedCategoryId'].text
			self.last_moved_category_page_index = xml_element.elements['lastMovedCategoryPageIndex'].text
			self.last_moved_category_entry_page_index = xml_element.elements['lastMovedCategoryEntryPageIndex'].text
			self.move_from_children = xml_element.elements['moveFromChildren'].text
			self.dest_category_full_ids = xml_element.elements['destCategoryFullIds'].text
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
			self.user_id = xml_element.elements['userId'].text
			self.type = xml_element.elements['type'].text
			self.type_as_string = xml_element.elements['typeAsString'].text
			self.object_id = xml_element.elements['objectId'].text
			self.status = xml_element.elements['status'].text
			self.data = xml_element.elements['data'].text
			self.number_of_attempts = xml_element.elements['numberOfAttempts'].text
			self.notification_result = xml_element.elements['notificationResult'].text
			self.obj_type = xml_element.elements['objType'].text
		end

	end

	class KalturaObjectListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaObject')
		end

	end

	class KalturaOrCondition < KalturaCondition
		attr_accessor :conditions


		def from_xml(xml_element)
			super
			self.conditions = KalturaClientBase.object_from_xml(xml_element.elements['conditions'], 'KalturaCondition')
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.id_not_in = xml_element.elements['idNotIn'].text
			self.name_like = xml_element.elements['nameLike'].text
			self.name_multi_like_or = xml_element.elements['nameMultiLikeOr'].text
			self.name_multi_like_and = xml_element.elements['nameMultiLikeAnd'].text
			self.name_equal = xml_element.elements['nameEqual'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.partner_package_equal = xml_element.elements['partnerPackageEqual'].text
			self.partner_package_greater_than_or_equal = xml_element.elements['partnerPackageGreaterThanOrEqual'].text
			self.partner_package_less_than_or_equal = xml_element.elements['partnerPackageLessThanOrEqual'].text
			self.partner_package_in = xml_element.elements['partnerPackageIn'].text
			self.partner_group_type_equal = xml_element.elements['partnerGroupTypeEqual'].text
			self.partner_name_description_website_admin_name_admin_email_like = xml_element.elements['partnerNameDescriptionWebsiteAdminNameAdminEmailLike'].text
		end

	end

	class KalturaPartnerListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaPartner')
		end

	end

	class KalturaPermissionItemListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaPermissionItem')
		end

	end

	class KalturaPermissionListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaPermission')
		end

	end

	class KalturaPlaylistListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaPlaylist')
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
			self.stream_id = xml_element.elements['streamID'].text
			self.backup_stream_id = xml_element.elements['backupStreamID'].text
			self.rtmp = xml_element.elements['rtmp'].text
			self.encoder_ip = xml_element.elements['encoderIP'].text
			self.backup_encoder_ip = xml_element.elements['backupEncoderIP'].text
			self.encoder_password = xml_element.elements['encoderPassword'].text
			self.encoder_username = xml_element.elements['encoderUsername'].text
			self.end_date = xml_element.elements['endDate'].text
			self.return_val = xml_element.elements['returnVal'].text
			self.media_type = xml_element.elements['mediaType'].text
			self.primary_broadcasting_url = xml_element.elements['primaryBroadcastingUrl'].text
			self.secondary_broadcasting_url = xml_element.elements['secondaryBroadcastingUrl'].text
			self.stream_name = xml_element.elements['streamName'].text
		end

	end

	class KalturaQuizUserEntry < KalturaUserEntry
		attr_accessor :score

		def score=(val)
			@score = val.to_f
		end

		def from_xml(xml_element)
			super
			self.score = xml_element.elements['score'].text
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
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaRemotePath')
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			self.partner_id_in = xml_element.elements['partnerIdIn'].text
			self.system_name_equal = xml_element.elements['systemNameEqual'].text
			self.system_name_in = xml_element.elements['systemNameIn'].text
		end

	end

	class KalturaReportInputFilter < KalturaReportInputBaseFilter
		# Search keywords to filter objects
		attr_accessor :keywords
		# Search keywords in onjects tags
		attr_accessor :search_in_tags
		# Search keywords in onjects admin tags
		attr_accessor :search_in_admin_tags
		# Search onjects in specified categories
		attr_accessor :categories
		# Time zone offset in minutes
		attr_accessor :time_zone_offset
		# Aggregated results according to interval
		attr_accessor :interval

		def search_in_tags=(val)
			@search_in_tags = to_b(val)
		end
		def search_in_admin_tags=(val)
			@search_in_admin_tags = to_b(val)
		end
		def time_zone_offset=(val)
			@time_zone_offset = val.to_i
		end

		def from_xml(xml_element)
			super
			self.keywords = xml_element.elements['keywords'].text
			self.search_in_tags = xml_element.elements['searchInTags'].text
			self.search_in_admin_tags = xml_element.elements['searchInAdminTags'].text
			self.categories = xml_element.elements['categories'].text
			self.time_zone_offset = xml_element.elements['timeZoneOffset'].text
			self.interval = xml_element.elements['interval'].text
		end

	end

	class KalturaReportListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaReport')
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.system_name_equal = xml_element.elements['systemNameEqual'].text
			self.system_name_in = xml_element.elements['systemNameIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
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
			self.id = xml_element.elements['id'].text
			self.system_name = xml_element.elements['systemName'].text
		end

	end

	class KalturaResponseProfileListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaResponseProfile')
		end

	end

	class KalturaSchedulerListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaScheduler')
		end

	end

	class KalturaSchedulerWorkerListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaSchedulerWorker')
		end

	end

	class KalturaSearchCondition < KalturaSearchItem
		attr_accessor :field
		attr_accessor :value


		def from_xml(xml_element)
			super
			self.field = xml_element.elements['field'].text
			self.value = xml_element.elements['value'].text
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
			self.type = xml_element.elements['type'].text
			self.items = KalturaClientBase.object_from_xml(xml_element.elements['items'], 'KalturaSearchItem')
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
		attr_accessor :parent_id_equal
		attr_accessor :parent_id_in

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
		def parent_id_equal=(val)
			@parent_id_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.heartbeat_time_greater_than_or_equal = xml_element.elements['heartbeatTimeGreaterThanOrEqual'].text
			self.heartbeat_time_less_than_or_equal = xml_element.elements['heartbeatTimeLessThanOrEqual'].text
			self.name_equal = xml_element.elements['nameEqual'].text
			self.name_in = xml_element.elements['nameIn'].text
			self.system_name_equal = xml_element.elements['systemNameEqual'].text
			self.system_name_in = xml_element.elements['systemNameIn'].text
			self.host_name_like = xml_element.elements['hostNameLike'].text
			self.host_name_multi_like_or = xml_element.elements['hostNameMultiLikeOr'].text
			self.host_name_multi_like_and = xml_element.elements['hostNameMultiLikeAnd'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.type_equal = xml_element.elements['typeEqual'].text
			self.type_in = xml_element.elements['typeIn'].text
			self.tags_like = xml_element.elements['tagsLike'].text
			self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
			self.dc_equal = xml_element.elements['dcEqual'].text
			self.dc_in = xml_element.elements['dcIn'].text
			self.parent_id_equal = xml_element.elements['parentIdEqual'].text
			self.parent_id_in = xml_element.elements['parentIdIn'].text
		end

	end

	class KalturaServerNodeListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaServerNode')
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
			self.site_restriction_type = xml_element.elements['siteRestrictionType'].text
			self.site_list = xml_element.elements['siteList'].text
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
		attr_accessor :src_file_sync_id
		attr_accessor :dest_file_sync_stored_path

		def ftp_passive_mode=(val)
			@ftp_passive_mode = to_b(val)
		end

		def from_xml(xml_element)
			super
			self.server_url = xml_element.elements['serverUrl'].text
			self.server_username = xml_element.elements['serverUsername'].text
			self.server_password = xml_element.elements['serverPassword'].text
			self.server_private_key = xml_element.elements['serverPrivateKey'].text
			self.server_public_key = xml_element.elements['serverPublicKey'].text
			self.server_pass_phrase = xml_element.elements['serverPassPhrase'].text
			self.ftp_passive_mode = xml_element.elements['ftpPassiveMode'].text
			self.src_file_sync_local_path = xml_element.elements['srcFileSyncLocalPath'].text
			self.src_file_sync_id = xml_element.elements['srcFileSyncId'].text
			self.dest_file_sync_stored_path = xml_element.elements['destFileSyncStoredPath'].text
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			self.partner_id_in = xml_element.elements['partnerIdIn'].text
			self.system_name_equal = xml_element.elements['systemNameEqual'].text
			self.system_name_in = xml_element.elements['systemNameIn'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.protocol_equal = xml_element.elements['protocolEqual'].text
			self.protocol_in = xml_element.elements['protocolIn'].text
		end

	end

	class KalturaStorageProfileListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaStorageProfile')
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
			self.category_id = xml_element.elements['categoryId'].text
			self.last_updated_category_entry_created_at = xml_element.elements['lastUpdatedCategoryEntryCreatedAt'].text
			self.last_updated_category_created_at = xml_element.elements['lastUpdatedCategoryCreatedAt'].text
		end

	end

	class KalturaThumbAssetListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaThumbAsset')
		end

	end

	class KalturaThumbParamsListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaThumbParams')
		end

	end

	class KalturaTubeMogulSyndicationFeed < KalturaBaseSyndicationFeed
		attr_accessor :category


		def from_xml(xml_element)
			super
			self.category = xml_element.elements['category'].text
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.name_like = xml_element.elements['nameLike'].text
			self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			self.partner_id_in = xml_element.elements['partnerIdIn'].text
			self.obj_type_equal = xml_element.elements['objTypeEqual'].text
			self.obj_type_in = xml_element.elements['objTypeIn'].text
			self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.creation_mode_equal = xml_element.elements['creationModeEqual'].text
			self.creation_mode_in = xml_element.elements['creationModeIn'].text
			self.version_equal = xml_element.elements['versionEqual'].text
			self.version_multi_like_or = xml_element.elements['versionMultiLikeOr'].text
			self.version_multi_like_and = xml_element.elements['versionMultiLikeAnd'].text
			self.partner_tags_multi_like_or = xml_element.elements['partnerTagsMultiLikeOr'].text
			self.partner_tags_multi_like_and = xml_element.elements['partnerTagsMultiLikeAnd'].text
		end

	end

	class KalturaUiConfListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaUiConf')
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.user_id_equal = xml_element.elements['userIdEqual'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.file_name_equal = xml_element.elements['fileNameEqual'].text
			self.file_size_equal = xml_element.elements['fileSizeEqual'].text
		end

	end

	class KalturaUploadTokenListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaUploadToken')
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
			self.header_data = xml_element.elements['headerData'].text
			self.header_sign = xml_element.elements['headerSign'].text
			self.timeout = xml_element.elements['timeout'].text
			self.salt = xml_element.elements['salt'].text
		end

	end

	class KalturaUrlTokenizerAkamaiHttp < KalturaUrlTokenizer
		# param
		attr_accessor :param_name
		attr_accessor :root_dir


		def from_xml(xml_element)
			super
			self.param_name = xml_element.elements['paramName'].text
			self.root_dir = xml_element.elements['rootDir'].text
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
			self.profile = xml_element.elements['profile'].text
			self.type = xml_element.elements['type'].text
			self.aifp = xml_element.elements['aifp'].text
			self.use_prefix = xml_element.elements['usePrefix'].text
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
			self.host = xml_element.elements['host'].text
			self.cpcode = xml_element.elements['cpcode'].text
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
			self.param_name = xml_element.elements['paramName'].text
			self.acl_postfix = xml_element.elements['aclPostfix'].text
			self.custom_postfixes = xml_element.elements['customPostfixes'].text
			self.use_cookie_hosts = xml_element.elements['useCookieHosts'].text
			self.root_dir = xml_element.elements['rootDir'].text
		end

	end

	class KalturaUrlTokenizerBitGravity < KalturaUrlTokenizer
		# hashPatternRegex
		attr_accessor :hash_pattern_regex


		def from_xml(xml_element)
			super
			self.hash_pattern_regex = xml_element.elements['hashPatternRegex'].text
		end

	end

	class KalturaUrlTokenizerCloudFront < KalturaUrlTokenizer
		attr_accessor :key_pair_id
		attr_accessor :root_dir
		attr_accessor :limit_ip_address

		def limit_ip_address=(val)
			@limit_ip_address = to_b(val)
		end

		def from_xml(xml_element)
			super
			self.key_pair_id = xml_element.elements['keyPairId'].text
			self.root_dir = xml_element.elements['rootDir'].text
			self.limit_ip_address = xml_element.elements['limitIpAddress'].text
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
			self.param_name = xml_element.elements['paramName'].text
			self.expiry_name = xml_element.elements['expiryName'].text
			self.gen = xml_element.elements['gen'].text
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
			self.hds_paths = xml_element.elements['hdsPaths'].text
			self.param_name = xml_element.elements['paramName'].text
			self.auth_prefix = xml_element.elements['authPrefix'].text
		end

	end

	class KalturaUrlTokenizerVnpt < KalturaUrlTokenizer
		attr_accessor :tokenization_format

		def tokenization_format=(val)
			@tokenization_format = val.to_i
		end

		def from_xml(xml_element)
			super
			self.tokenization_format = xml_element.elements['tokenizationFormat'].text
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
			self.user_agent_restriction_type = xml_element.elements['userAgentRestrictionType'].text
			self.user_agent_regex_list = xml_element.elements['userAgentRegexList'].text
		end

	end

	class KalturaUserEntryBaseFilter < KalturaFilter
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.id_not_in = xml_element.elements['idNotIn'].text
			self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			self.entry_id_in = xml_element.elements['entryIdIn'].text
			self.entry_id_not_in = xml_element.elements['entryIdNotIn'].text
			self.user_id_equal = xml_element.elements['userIdEqual'].text
			self.user_id_in = xml_element.elements['userIdIn'].text
			self.user_id_not_in = xml_element.elements['userIdNotIn'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.type_equal = xml_element.elements['typeEqual'].text
		end

	end

	class KalturaUserEntryListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaUserEntry')
		end

	end

	class KalturaUserListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaUser')
		end

	end

	class KalturaUserLoginDataListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaUserLoginData')
		end

	end

	class KalturaUserRoleCondition < KalturaCondition
		# Comma separated list of role ids
		attr_accessor :role_ids


		def from_xml(xml_element)
			super
			self.role_ids = xml_element.elements['roleIds'].text
		end

	end

	class KalturaUserRoleListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaUserRole')
		end

	end

	class KalturaValidateActiveEdgeCondition < KalturaCondition
		# Comma separated list of edge servers to validate are active
		attr_accessor :edge_server_ids


		def from_xml(xml_element)
			super
			self.edge_server_ids = xml_element.elements['edgeServerIds'].text
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.source_widget_id_equal = xml_element.elements['sourceWidgetIdEqual'].text
			self.root_widget_id_equal = xml_element.elements['rootWidgetIdEqual'].text
			self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			self.ui_conf_id_equal = xml_element.elements['uiConfIdEqual'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.partner_data_like = xml_element.elements['partnerDataLike'].text
		end

	end

	class KalturaWidgetListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaWidget')
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
			self.category = xml_element.elements['category'].text
			self.adult_content = xml_element.elements['adultContent'].text
			self.feed_description = xml_element.elements['feedDescription'].text
			self.feed_landing_page = xml_element.elements['feedLandingPage'].text
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.system_name_equal = xml_element.elements['systemNameEqual'].text
			self.system_name_in = xml_element.elements['systemNameIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.system_name_equal = xml_element.elements['systemNameEqual'].text
			self.system_name_in = xml_element.elements['systemNameIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
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
			self.wsdl_username = xml_element.elements['wsdlUsername'].text
			self.wsdl_password = xml_element.elements['wsdlPassword'].text
			self.cpcode = xml_element.elements['cpcode'].text
			self.email_id = xml_element.elements['emailId'].text
			self.primary_contact = xml_element.elements['primaryContact'].text
			self.secondary_contact = xml_element.elements['secondaryContact'].text
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
			self.stream_id = xml_element.elements['streamId'].text
			self.system_user_name = xml_element.elements['systemUserName'].text
			self.system_password = xml_element.elements['systemPassword'].text
			self.domain_name = xml_element.elements['domainName'].text
			self.dvr_enabled = xml_element.elements['dvrEnabled'].text
			self.dvr_window = xml_element.elements['dvrWindow'].text
			self.primary_contact = xml_element.elements['primaryContact'].text
			self.secondary_contact = xml_element.elements['secondaryContact'].text
			self.stream_type = xml_element.elements['streamType'].text
			self.notification_email = xml_element.elements['notificationEmail'].text
		end

	end

	class KalturaAppTokenFilter < KalturaAppTokenBaseFilter


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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			self.entry_id_in = xml_element.elements['entryIdIn'].text
			self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			self.partner_id_in = xml_element.elements['partnerIdIn'].text
			self.size_greater_than_or_equal = xml_element.elements['sizeGreaterThanOrEqual'].text
			self.size_less_than_or_equal = xml_element.elements['sizeLessThanOrEqual'].text
			self.tags_like = xml_element.elements['tagsLike'].text
			self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.deleted_at_greater_than_or_equal = xml_element.elements['deletedAtGreaterThanOrEqual'].text
			self.deleted_at_less_than_or_equal = xml_element.elements['deletedAtLessThanOrEqual'].text
		end

	end

	class KalturaAssetParamsBaseFilter < KalturaRelatedFilter
		attr_accessor :system_name_equal
		attr_accessor :system_name_in
		attr_accessor :is_system_default_equal
		attr_accessor :tags_equal

		def is_system_default_equal=(val)
			@is_system_default_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			self.system_name_equal = xml_element.elements['systemNameEqual'].text
			self.system_name_in = xml_element.elements['systemNameIn'].text
			self.is_system_default_equal = xml_element.elements['isSystemDefaultEqual'].text
			self.tags_equal = xml_element.elements['tagsEqual'].text
		end

	end

	# Used to ingest media that is already ingested to Kaltura system as a different flavor asset in the past, the new created flavor asset will be ready immediately using a file sync of link type that will point to the existing file sync of the existing flavor asset.
	class KalturaAssetResource < KalturaContentResource
		# ID of the source asset
		attr_accessor :asset_id


		def from_xml(xml_element)
			super
			self.asset_id = xml_element.elements['assetId'].text
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.parent_id_equal = xml_element.elements['parentIdEqual'].text
			self.parent_id_in = xml_element.elements['parentIdIn'].text
			self.depth_equal = xml_element.elements['depthEqual'].text
			self.full_name_equal = xml_element.elements['fullNameEqual'].text
			self.full_name_starts_with = xml_element.elements['fullNameStartsWith'].text
			self.full_name_in = xml_element.elements['fullNameIn'].text
			self.full_ids_equal = xml_element.elements['fullIdsEqual'].text
			self.full_ids_starts_with = xml_element.elements['fullIdsStartsWith'].text
			self.full_ids_match_or = xml_element.elements['fullIdsMatchOr'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.tags_like = xml_element.elements['tagsLike'].text
			self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
			self.appear_in_list_equal = xml_element.elements['appearInListEqual'].text
			self.privacy_equal = xml_element.elements['privacyEqual'].text
			self.privacy_in = xml_element.elements['privacyIn'].text
			self.inheritance_type_equal = xml_element.elements['inheritanceTypeEqual'].text
			self.inheritance_type_in = xml_element.elements['inheritanceTypeIn'].text
			self.reference_id_equal = xml_element.elements['referenceIdEqual'].text
			self.reference_id_empty = xml_element.elements['referenceIdEmpty'].text
			self.contribution_policy_equal = xml_element.elements['contributionPolicyEqual'].text
			self.members_count_greater_than_or_equal = xml_element.elements['membersCountGreaterThanOrEqual'].text
			self.members_count_less_than_or_equal = xml_element.elements['membersCountLessThanOrEqual'].text
			self.pending_members_count_greater_than_or_equal = xml_element.elements['pendingMembersCountGreaterThanOrEqual'].text
			self.pending_members_count_less_than_or_equal = xml_element.elements['pendingMembersCountLessThanOrEqual'].text
			self.privacy_context_equal = xml_element.elements['privacyContextEqual'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.inherited_parent_id_equal = xml_element.elements['inheritedParentIdEqual'].text
			self.inherited_parent_id_in = xml_element.elements['inheritedParentIdIn'].text
			self.partner_sort_value_greater_than_or_equal = xml_element.elements['partnerSortValueGreaterThanOrEqual'].text
			self.partner_sort_value_less_than_or_equal = xml_element.elements['partnerSortValueLessThanOrEqual'].text
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
			self.category_id_equal = xml_element.elements['categoryIdEqual'].text
			self.category_id_in = xml_element.elements['categoryIdIn'].text
			self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			self.entry_id_in = xml_element.elements['entryIdIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.category_full_ids_starts_with = xml_element.elements['categoryFullIdsStartsWith'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
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
			self.conversion_profile_id_equal = xml_element.elements['conversionProfileIdEqual'].text
			self.conversion_profile_id_in = xml_element.elements['conversionProfileIdIn'].text
			self.asset_params_id_equal = xml_element.elements['assetParamsIdEqual'].text
			self.asset_params_id_in = xml_element.elements['assetParamsIdIn'].text
			self.ready_behavior_equal = xml_element.elements['readyBehaviorEqual'].text
			self.ready_behavior_in = xml_element.elements['readyBehaviorIn'].text
			self.origin_equal = xml_element.elements['originEqual'].text
			self.origin_in = xml_element.elements['originIn'].text
			self.system_name_equal = xml_element.elements['systemNameEqual'].text
			self.system_name_in = xml_element.elements['systemNameIn'].text
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.type_equal = xml_element.elements['typeEqual'].text
			self.type_in = xml_element.elements['typeIn'].text
			self.name_equal = xml_element.elements['nameEqual'].text
			self.system_name_equal = xml_element.elements['systemNameEqual'].text
			self.system_name_in = xml_element.elements['systemNameIn'].text
			self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
			self.default_entry_id_equal = xml_element.elements['defaultEntryIdEqual'].text
			self.default_entry_id_in = xml_element.elements['defaultEntryIdIn'].text
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
			self.dest_dir_local_path = xml_element.elements['destDirLocalPath'].text
			self.dest_dir_remote_url = xml_element.elements['destDirRemoteUrl'].text
			self.dest_file_name = xml_element.elements['destFileName'].text
			self.input_xml_local_path = xml_element.elements['inputXmlLocalPath'].text
			self.input_xml_remote_url = xml_element.elements['inputXmlRemoteUrl'].text
			self.command_lines_str = xml_element.elements['commandLinesStr'].text
			self.flavors = KalturaClientBase.object_from_xml(xml_element.elements['flavors'], 'KalturaConvertCollectionFlavorData')
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
			self.dest_file_sync_local_path = xml_element.elements['destFileSyncLocalPath'].text
			self.dest_file_sync_remote_url = xml_element.elements['destFileSyncRemoteUrl'].text
			self.log_file_sync_local_path = xml_element.elements['logFileSyncLocalPath'].text
			self.log_file_sync_remote_url = xml_element.elements['logFileSyncRemoteUrl'].text
			self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			self.remote_media_id = xml_element.elements['remoteMediaId'].text
			self.custom_data = xml_element.elements['customData'].text
			self.extra_dest_file_syncs = KalturaClientBase.object_from_xml(xml_element.elements['extraDestFileSyncs'], 'KalturaDestFileSyncDescriptor')
			self.engine_message = xml_element.elements['engineMessage'].text
		end

	end

	class KalturaCountryCondition < KalturaMatchCondition
		# The ip geo coder engine to be used
		attr_accessor :geo_coder_type


		def from_xml(xml_element)
			super
			self.geo_coder_type = xml_element.elements['geoCoderType'].text
		end

	end

	class KalturaDeliveryProfileFilter < KalturaDeliveryProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDeliveryProfileGenericRtmp < KalturaDeliveryProfileRtmp
		attr_accessor :pattern
		# rendererClass
		attr_accessor :renderer_class


		def from_xml(xml_element)
			super
			self.pattern = xml_element.elements['pattern'].text
			self.renderer_class = xml_element.elements['rendererClass'].text
		end

	end

	class KalturaEdgeServerNode < KalturaDeliveryServerNode
		# Delivery profile ids
		attr_accessor :delivery_profile_ids
		# Overdie edge server default configuration - json format
		attr_accessor :config


		def from_xml(xml_element)
			super
			self.delivery_profile_ids = KalturaClientBase.object_from_xml(xml_element.elements['deliveryProfileIds'], 'KalturaKeyValue')
			self.config = xml_element.elements['config'].text
		end

	end

	class KalturaEndUserReportInputFilter < KalturaReportInputFilter
		attr_accessor :application
		attr_accessor :user_ids
		attr_accessor :playback_context
		attr_accessor :ancestor_playback_context


		def from_xml(xml_element)
			super
			self.application = xml_element.elements['application'].text
			self.user_ids = xml_element.elements['userIds'].text
			self.playback_context = xml_element.elements['playbackContext'].text
			self.ancestor_playback_context = xml_element.elements['ancestorPlaybackContext'].text
		end

	end

	class KalturaEntryReferrerLiveStats < KalturaEntryLiveStats
		attr_accessor :referrer


		def from_xml(xml_element)
			super
			self.referrer = xml_element.elements['referrer'].text
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
			self.entry_id = xml_element.elements['entryId'].text
			self.flavor_params_id = xml_element.elements['flavorParamsId'].text
		end

	end

	class KalturaEntryServerNodeBaseFilter < KalturaRelatedFilter
		attr_accessor :entry_id_equal
		attr_accessor :entry_id_in
		attr_accessor :server_node_id_equal
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :server_type_equal

		def server_node_id_equal=(val)
			@server_node_id_equal = val.to_i
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
			self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			self.entry_id_in = xml_element.elements['entryIdIn'].text
			self.server_node_id_equal = xml_element.elements['serverNodeIdEqual'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.server_type_equal = xml_element.elements['serverTypeEqual'].text
		end

	end

	class KalturaExtractMediaJobData < KalturaConvartableJobData
		attr_accessor :flavor_asset_id


		def from_xml(xml_element)
			super
			self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
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
			self.field = KalturaClientBase.object_from_xml(xml_element.elements['field'], 'KalturaIntegerField')
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
			self.field = KalturaClientBase.object_from_xml(xml_element.elements['field'], 'KalturaStringField')
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			self.file_asset_object_type_equal = xml_element.elements['fileAssetObjectTypeEqual'].text
			self.object_id_equal = xml_element.elements['objectIdEqual'].text
			self.object_id_in = xml_element.elements['objectIdIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
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
			self.file_sync_object_type = xml_element.elements['fileSyncObjectType'].text
			self.object_sub_type = xml_element.elements['objectSubType'].text
			self.object_id = xml_element.elements['objectId'].text
			self.version = xml_element.elements['version'].text
		end

	end

	class KalturaGenericXsltSyndicationFeed < KalturaGenericSyndicationFeed
		attr_accessor :xslt
		attr_accessor :item_xpaths_to_extend


		def from_xml(xml_element)
			super
			self.xslt = xml_element.elements['xslt'].text
			self.item_xpaths_to_extend = KalturaClientBase.object_from_xml(xml_element.elements['itemXpathsToExtend'], 'KalturaExtendingItemMrssParameter')
		end

	end

	class KalturaGeoDistanceCondition < KalturaMatchCondition
		# The ip geo coder engine to be used
		attr_accessor :geo_coder_type


		def from_xml(xml_element)
			super
			self.geo_coder_type = xml_element.elements['geoCoderType'].text
		end

	end

	class KalturaGeoTimeLiveStats < KalturaEntryLiveStats
		attr_accessor :city
		attr_accessor :country


		def from_xml(xml_element)
			super
			self.city = KalturaClientBase.object_from_xml(xml_element.elements['city'], 'KalturaCoordinate')
			self.country = KalturaClientBase.object_from_xml(xml_element.elements['country'], 'KalturaCoordinate')
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
			self.user_id_equal = xml_element.elements['userIdEqual'].text
			self.user_id_in = xml_element.elements['userIdIn'].text
			self.group_id_equal = xml_element.elements['groupIdEqual'].text
			self.group_id_in = xml_element.elements['groupIdIn'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
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
			self.accept_internal_ips = xml_element.elements['acceptInternalIps'].text
			self.http_header = xml_element.elements['httpHeader'].text
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
			self.multicast_ip = xml_element.elements['multicastIP'].text
			self.multicast_port = xml_element.elements['multicastPort'].text
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
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.channel_id_equal = xml_element.elements['channelIdEqual'].text
			self.channel_id_in = xml_element.elements['channelIdIn'].text
			self.start_time_greater_than_or_equal = xml_element.elements['startTimeGreaterThanOrEqual'].text
			self.start_time_less_than_or_equal = xml_element.elements['startTimeLessThanOrEqual'].text
		end

	end

	class KalturaLiveParams < KalturaFlavorParams
		# Suffix to be added to the stream name after the entry id {entry_id}_{stream_suffix}, e.g. for entry id 0_kjdu5jr6 and suffix 1, the stream name will be 0_kjdu5jr6_1
		attr_accessor :stream_suffix


		def from_xml(xml_element)
			super
			self.stream_suffix = xml_element.elements['streamSuffix'].text
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
			self.application_name = xml_element.elements['applicationName'].text
			self.media_server_port_config = KalturaClientBase.object_from_xml(xml_element.elements['mediaServerPortConfig'], 'KalturaKeyValue')
			self.media_server_playback_domain_config = KalturaClientBase.object_from_xml(xml_element.elements['mediaServerPlaybackDomainConfig'], 'KalturaKeyValue')
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
			self.resource = KalturaClientBase.object_from_xml(xml_element.elements['resource'], 'KalturaContentResource')
			self.operation_attributes = KalturaClientBase.object_from_xml(xml_element.elements['operationAttributes'], 'KalturaOperationAttributes')
			self.asset_params_id = xml_element.elements['assetParamsId'].text
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.type_equal = xml_element.elements['typeEqual'].text
			self.type_in = xml_element.elements['typeIn'].text
			self.name_equal = xml_element.elements['nameEqual'].text
			self.name_in = xml_element.elements['nameIn'].text
			self.friendly_name_like = xml_element.elements['friendlyNameLike'].text
			self.description_like = xml_element.elements['descriptionLike'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			self.partner_id_in = xml_element.elements['partnerIdIn'].text
			self.depends_on_permission_names_multi_like_or = xml_element.elements['dependsOnPermissionNamesMultiLikeOr'].text
			self.depends_on_permission_names_multi_like_and = xml_element.elements['dependsOnPermissionNamesMultiLikeAnd'].text
			self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.type_equal = xml_element.elements['typeEqual'].text
			self.type_in = xml_element.elements['typeIn'].text
			self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			self.partner_id_in = xml_element.elements['partnerIdIn'].text
			self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
		end

	end

	class KalturaPostConvertJobData < KalturaConvartableJobData
		attr_accessor :flavor_asset_id
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
			self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			self.create_thumb = xml_element.elements['createThumb'].text
			self.thumb_path = xml_element.elements['thumbPath'].text
			self.thumb_offset = xml_element.elements['thumbOffset'].text
			self.thumb_height = xml_element.elements['thumbHeight'].text
			self.thumb_bitrate = xml_element.elements['thumbBitrate'].text
			self.custom_data = xml_element.elements['customData'].text
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
			self.preview_length = xml_element.elements['previewLength'].text
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
			self.protocol = xml_element.elements['protocol'].text
			self.ks_type = xml_element.elements['ksType'].text
			self.user_roles = KalturaClientBase.object_from_xml(xml_element.elements['userRoles'], 'KalturaIntegerValue')
			self.cached_object_type = xml_element.elements['cachedObjectType'].text
			self.object_id = xml_element.elements['objectId'].text
			self.start_object_key = xml_element.elements['startObjectKey'].text
			self.end_object_key = xml_element.elements['endObjectKey'].text
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
			self.resources = KalturaClientBase.object_from_xml(xml_element.elements['resources'], 'KalturaRemoteStorageResource')
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
			self.comparison = xml_element.elements['comparison'].text
		end

	end

	class KalturaSearchComparableCondition < KalturaSearchCondition
		attr_accessor :comparison


		def from_xml(xml_element)
			super
			self.comparison = xml_element.elements['comparison'].text
		end

	end

	class KalturaSearchMatchAttributeCondition < KalturaAttributeCondition
		attr_accessor :not

		def not=(val)
			@not = to_b(val)
		end

		def from_xml(xml_element)
			super
			self.not = xml_element.elements['not'].text
		end

	end

	class KalturaSearchMatchCondition < KalturaSearchCondition
		attr_accessor :not

		def not=(val)
			@not = to_b(val)
		end

		def from_xml(xml_element)
			super
			self.not = xml_element.elements['not'].text
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
			self.private_key = xml_element.elements['privateKey'].text
			self.public_key = xml_element.elements['publicKey'].text
			self.pass_phrase = xml_element.elements['passPhrase'].text
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
			self.force = xml_element.elements['force'].text
			self.create_link = xml_element.elements['createLink'].text
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
			self.content = xml_element.elements['content'].text
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

	class KalturaUserEntryFilter < KalturaUserEntryBaseFilter
		attr_accessor :user_id_equal_current
		attr_accessor :is_anonymous

		def user_id_equal_current=(val)
			@user_id_equal_current = val.to_i
		end
		def is_anonymous=(val)
			@is_anonymous = val.to_i
		end

		def from_xml(xml_element)
			super
			self.user_id_equal_current = xml_element.elements['userIdEqualCurrent'].text
			self.is_anonymous = xml_element.elements['isAnonymous'].text
		end

	end

	class KalturaUserLoginDataBaseFilter < KalturaRelatedFilter
		attr_accessor :login_email_equal


		def from_xml(xml_element)
			super
			self.login_email_equal = xml_element.elements['loginEmailEqual'].text
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
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.name_equal = xml_element.elements['nameEqual'].text
			self.name_in = xml_element.elements['nameIn'].text
			self.system_name_equal = xml_element.elements['systemNameEqual'].text
			self.system_name_in = xml_element.elements['systemNameIn'].text
			self.description_like = xml_element.elements['descriptionLike'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			self.partner_id_in = xml_element.elements['partnerIdIn'].text
			self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
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


		def from_xml(xml_element)
			super
			self.files_permission_in_s3 = xml_element.elements['filesPermissionInS3'].text
			self.s3region = xml_element.elements['s3Region'].text
		end

	end

	class KalturaAmazonS3StorageProfileBaseFilter < KalturaStorageProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAssetFilter < KalturaAssetBaseFilter


		def from_xml(xml_element)
			super
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
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	# Auto-generated class.
	#  Used to search KalturaBaseEntry attributes. Use KalturaBaseEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaBaseEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	class KalturaBatchJobFilterExt < KalturaBatchJobFilter
		attr_accessor :job_type_and_sub_type_in


		def from_xml(xml_element)
			super
			self.job_type_and_sub_type_in = xml_element.elements['jobTypeAndSubTypeIn'].text
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
			self.free_text = xml_element.elements['freeText'].text
			self.members_in = xml_element.elements['membersIn'].text
			self.name_or_reference_id_starts_with = xml_element.elements['nameOrReferenceIdStartsWith'].text
			self.manager_equal = xml_element.elements['managerEqual'].text
			self.member_equal = xml_element.elements['memberEqual'].text
			self.full_name_starts_with_in = xml_element.elements['fullNameStartsWithIn'].text
			self.ancestor_id_in = xml_element.elements['ancestorIdIn'].text
			self.id_or_inherited_parent_id_in = xml_element.elements['idOrInheritedParentIdIn'].text
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
			self.conversion_profile_id_filter = KalturaClientBase.object_from_xml(xml_element.elements['conversionProfileIdFilter'], 'KalturaConversionProfileFilter')
			self.asset_params_id_filter = KalturaClientBase.object_from_xml(xml_element.elements['assetParamsIdFilter'], 'KalturaAssetParamsFilter')
		end

	end

	# Represents the current request country context as calculated based on the IP address
	class KalturaCoordinatesContextField < KalturaStringField
		# The ip geo coder engine to be used
		attr_accessor :geo_coder_type


		def from_xml(xml_element)
			super
			self.geo_coder_type = xml_element.elements['geoCoderType'].text
		end

	end

	# Represents the current request country context as calculated based on the IP address
	class KalturaCountryContextField < KalturaStringField
		# The ip geo coder engine to be used
		attr_accessor :geo_coder_type


		def from_xml(xml_element)
			super
			self.geo_coder_type = xml_element.elements['geoCoderType'].text
		end

	end

	# Auto-generated class.
	#  Used to search KalturaDataEntry attributes. Use KalturaDataEntryCompareAttribute enum to provide attribute name.
	# /
	class KalturaDataEntryCompareAttributeCondition < KalturaSearchComparableAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	# Auto-generated class.
	#  Used to search KalturaDataEntry attributes. Use KalturaDataEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaDataEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			self.attribute = xml_element.elements['attribute'].text
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
		attr_accessor :playback_domain_like
		attr_accessor :playback_domain_multi_like_or
		attr_accessor :playback_domain_multi_like_and


		def from_xml(xml_element)
			super
			self.playback_domain_like = xml_element.elements['playbackDomainLike'].text
			self.playback_domain_multi_like_or = xml_element.elements['playbackDomainMultiLikeOr'].text
			self.playback_domain_multi_like_and = xml_element.elements['playbackDomainMultiLikeAnd'].text
		end

	end

	# Auto-generated class.
	#  Used to search KalturaDocumentEntry attributes. Use KalturaDocumentEntryCompareAttribute enum to provide attribute name.
	# /
	class KalturaDocumentEntryCompareAttributeCondition < KalturaSearchComparableAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	# Auto-generated class.
	#  Used to search KalturaDocumentEntry attributes. Use KalturaDocumentEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaDocumentEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	class KalturaEntryServerNodeFilter < KalturaEntryServerNodeBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	# Evaluates PHP statement, depends on the execution context
	class KalturaEvalBooleanField < KalturaBooleanField
		# PHP code
		attr_accessor :code


		def from_xml(xml_element)
			super
			self.code = xml_element.elements['code'].text
		end

	end

	# Evaluates PHP statement, depends on the execution context
	class KalturaEvalStringField < KalturaStringField
		# PHP code
		attr_accessor :code


		def from_xml(xml_element)
			super
			self.code = xml_element.elements['code'].text
		end

	end

	# Auto-generated class.
	#  Used to search KalturaExternalMediaEntry attributes. Use KalturaExternalMediaEntryCompareAttribute enum to provide attribute name.
	# /
	class KalturaExternalMediaEntryCompareAttributeCondition < KalturaSearchComparableAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	# Auto-generated class.
	#  Used to search KalturaExternalMediaEntry attributes. Use KalturaExternalMediaEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaExternalMediaEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	class KalturaFileAssetFilter < KalturaFileAssetBaseFilter


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
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	# Auto-generated class.
	#  Used to search KalturaLiveChannel attributes. Use KalturaLiveChannelMatchAttribute enum to provide attribute name.
	# /
	class KalturaLiveChannelMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			self.attribute = xml_element.elements['attribute'].text
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
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	# Auto-generated class.
	#  Used to search KalturaLiveEntry attributes. Use KalturaLiveEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaLiveEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	# Auto-generated class.
	#  Used to search KalturaLiveStreamAdminEntry attributes. Use KalturaLiveStreamAdminEntryCompareAttribute enum to provide attribute name.
	# /
	class KalturaLiveStreamAdminEntryCompareAttributeCondition < KalturaSearchComparableAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	# Auto-generated class.
	#  Used to search KalturaLiveStreamAdminEntry attributes. Use KalturaLiveStreamAdminEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaLiveStreamAdminEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	# Auto-generated class.
	#  Used to search KalturaLiveStreamEntry attributes. Use KalturaLiveStreamEntryCompareAttribute enum to provide attribute name.
	# /
	class KalturaLiveStreamEntryCompareAttributeCondition < KalturaSearchComparableAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	# Auto-generated class.
	#  Used to search KalturaLiveStreamEntry attributes. Use KalturaLiveStreamEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaLiveStreamEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	# Auto-generated class.
	#  Used to search KalturaMediaEntry attributes. Use KalturaMediaEntryCompareAttribute enum to provide attribute name.
	# /
	class KalturaMediaEntryCompareAttributeCondition < KalturaSearchComparableAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	# Auto-generated class.
	#  Used to search KalturaMediaEntry attributes. Use KalturaMediaEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaMediaEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			self.attribute = xml_element.elements['attribute'].text
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
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	# Auto-generated class.
	#  Used to search KalturaMixEntry attributes. Use KalturaMixEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaMixEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			self.attribute = xml_element.elements['attribute'].text
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
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	# Auto-generated class.
	#  Used to search KalturaPlayableEntry attributes. Use KalturaPlayableEntryMatchAttribute enum to provide attribute name.
	# /
	class KalturaPlayableEntryMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	# Auto-generated class.
	#  Used to search KalturaPlaylist attributes. Use KalturaPlaylistCompareAttribute enum to provide attribute name.
	# /
	class KalturaPlaylistCompareAttributeCondition < KalturaSearchComparableAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	# Auto-generated class.
	#  Used to search KalturaPlaylist attributes. Use KalturaPlaylistMatchAttribute enum to provide attribute name.
	# /
	class KalturaPlaylistMatchAttributeCondition < KalturaSearchMatchAttributeCondition
		attr_accessor :attribute


		def from_xml(xml_element)
			super
			self.attribute = xml_element.elements['attribute'].text
		end

	end

	class KalturaQuizUserEntryBaseFilter < KalturaUserEntryFilter


		def from_xml(xml_element)
			super
		end

	end

	# Used to ingest media file that is already accessible on the shared disc.
	class KalturaServerFileResource < KalturaDataCenterContentResource
		# Full path to the local file
		attr_accessor :local_file_path


		def from_xml(xml_element)
			super
			self.local_file_path = xml_element.elements['localFilePath'].text
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
			self.private_key = xml_element.elements['privateKey'].text
			self.public_key = xml_element.elements['publicKey'].text
			self.key_passphrase = xml_element.elements['keyPassphrase'].text
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
			self.offset = xml_element.elements['offset'].text
		end

	end

	class KalturaTubeMogulSyndicationFeedBaseFilter < KalturaBaseSyndicationFeedFilter


		def from_xml(xml_element)
			super
		end

	end

	# sed to ingest media that uploaded as posted file in this http request, the file data represents the $_FILE
	class KalturaUploadedFileResource < KalturaDataCenterContentResource
		# Represents the $_FILE
		attr_accessor :file_data


		def from_xml(xml_element)
			super
			self.file_data = KalturaClientBase.object_from_xml(xml_element.elements['fileData'], 'file')
		end

	end

	# Used to ingest media that uploaded to the system and represented by token that returned from upload.upload action or uploadToken.add action.
	class KalturaUploadedFileTokenResource < KalturaDataCenterContentResource
		# Token that returned from upload.upload action or uploadToken.add action.
		attr_accessor :token


		def from_xml(xml_element)
			super
			self.token = xml_element.elements['token'].text
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
			self.token = xml_element.elements['token'].text
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
			self.flavor_params_id_equal = xml_element.elements['flavorParamsIdEqual'].text
			self.flavor_params_id_in = xml_element.elements['flavorParamsIdIn'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.status_not_in = xml_element.elements['statusNotIn'].text
		end

	end

	class KalturaFlavorParamsBaseFilter < KalturaAssetParamsFilter
		attr_accessor :format_equal


		def from_xml(xml_element)
			super
			self.format_equal = xml_element.elements['formatEqual'].text
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

	class KalturaPlaylistBaseFilter < KalturaBaseEntryFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaQuizUserEntryFilter < KalturaQuizUserEntryBaseFilter


		def from_xml(xml_element)
			super
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
			self.thumb_params_id_equal = xml_element.elements['thumbParamsIdEqual'].text
			self.thumb_params_id_in = xml_element.elements['thumbParamsIdIn'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.status_not_in = xml_element.elements['statusNotIn'].text
		end

	end

	class KalturaThumbParamsBaseFilter < KalturaAssetParamsFilter
		attr_accessor :format_equal


		def from_xml(xml_element)
			super
			self.format_equal = xml_element.elements['formatEqual'].text
		end

	end

	class KalturaTubeMogulSyndicationFeedFilter < KalturaTubeMogulSyndicationFeedBaseFilter


		def from_xml(xml_element)
			super
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


		def from_xml(xml_element)
			super
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
		attr_accessor :type_in


		def from_xml(xml_element)
			super
			self.type_in = xml_element.elements['typeIn'].text
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
			self.flavor_params_id_equal = xml_element.elements['flavorParamsIdEqual'].text
			self.flavor_params_version_equal = xml_element.elements['flavorParamsVersionEqual'].text
			self.flavor_asset_id_equal = xml_element.elements['flavorAssetIdEqual'].text
			self.flavor_asset_version_equal = xml_element.elements['flavorAssetVersionEqual'].text
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
			self.thumb_params_id_equal = xml_element.elements['thumbParamsIdEqual'].text
			self.thumb_params_version_equal = xml_element.elements['thumbParamsVersionEqual'].text
			self.thumb_asset_id_equal = xml_element.elements['thumbAssetIdEqual'].text
			self.thumb_asset_version_equal = xml_element.elements['thumbAssetVersionEqual'].text
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
			self.is_live = xml_element.elements['isLive'].text
			self.is_recorded_entry_id_empty = xml_element.elements['isRecordedEntryIdEmpty'].text
			self.has_media_server_hostname = xml_element.elements['hasMediaServerHostname'].text
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
