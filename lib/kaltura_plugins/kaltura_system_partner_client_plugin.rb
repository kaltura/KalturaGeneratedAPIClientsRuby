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
# Copyright (C) 2006-2015  Kaltura Inc.
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

	class KalturaSystemPartnerLimitType
		ACCESS_CONTROLS = "ACCESS_CONTROLS"
		ADMIN_LOGIN_USERS = "ADMIN_LOGIN_USERS"
		BULK_SIZE = "BULK_SIZE"
		END_USERS = "END_USERS"
		ENTRIES = "ENTRIES"
		LIVE_STREAM_INPUTS = "LIVE_STREAM_INPUTS"
		LIVE_STREAM_OUTPUTS = "LIVE_STREAM_OUTPUTS"
		LOGIN_USERS = "LOGIN_USERS"
		MONTHLY_BANDWIDTH = "MONTHLY_BANDWIDTH"
		MONTHLY_STORAGE = "MONTHLY_STORAGE"
		MONTHLY_STORAGE_AND_BANDWIDTH = "MONTHLY_STORAGE_AND_BANDWIDTH"
		MONTHLY_STREAM_ENTRIES = "MONTHLY_STREAM_ENTRIES"
		PUBLISHERS = "PUBLISHERS"
		USER_LOGIN_ATTEMPTS = "USER_LOGIN_ATTEMPTS"
	end

	class KalturaSystemPartnerLimit < KalturaObjectBase
		attr_accessor :type
		attr_accessor :max

		def max=(val)
			@max = val.to_f
		end

		def from_xml(xml_element)
			super
			self.type = xml_element.elements['type'].text
			self.max = xml_element.elements['max'].text
		end

	end

	class KalturaSystemPartnerConfiguration < KalturaObjectBase
		attr_accessor :id
		attr_accessor :partner_name
		attr_accessor :description
		attr_accessor :admin_name
		attr_accessor :admin_email
		attr_accessor :host
		attr_accessor :cdn_host
		attr_accessor :cdn_host_white_list
		attr_accessor :thumbnail_host
		attr_accessor :partner_package
		attr_accessor :monitor_usage
		attr_accessor :moderate_content
		attr_accessor :storage_delete_from_kaltura
		attr_accessor :storage_serve_priority
		attr_accessor :kmc_version
		attr_accessor :restrict_thumbnail_by_ks
		attr_accessor :support_animated_thumbnails
		attr_accessor :def_thumb_offset
		attr_accessor :def_thumb_density
		attr_accessor :user_session_role_id
		attr_accessor :admin_session_role_id
		attr_accessor :always_allowed_permission_names
		attr_accessor :import_remote_source_for_convert
		attr_accessor :permissions
		attr_accessor :notifications_config
		attr_accessor :allow_multi_notification
		attr_accessor :login_block_period
		attr_accessor :num_prev_pass_to_keep
		attr_accessor :pass_replace_freq
		attr_accessor :is_first_login
		attr_accessor :partner_group_type
		attr_accessor :partner_parent_id
		attr_accessor :limits
		# http/rtmp/hdnetwork
		# 	 
		attr_accessor :streamer_type
		# http/https, rtmp/rtmpe
		# 	 
		attr_accessor :media_protocol
		attr_accessor :extended_free_trail_expiry_reason
		# Unix timestamp (In seconds)
		# 	 
		attr_accessor :extended_free_trail_expiry_date
		attr_accessor :extended_free_trail
		attr_accessor :crm_id
		attr_accessor :reference_id
		attr_accessor :crm_link
		attr_accessor :vertical_clasiffication
		attr_accessor :partner_package_class_of_service
		attr_accessor :enable_bulk_upload_notifications_emails
		attr_accessor :delivery_profile_ids
		attr_accessor :enforce_delivery
		attr_accessor :bulk_upload_notifications_email
		attr_accessor :internal_use
		attr_accessor :default_live_stream_entry_source_type
		attr_accessor :live_stream_provision_params
		attr_accessor :auto_moderate_entry_filter
		attr_accessor :logout_url
		attr_accessor :default_entitlement_enforcement
		attr_accessor :cache_flavor_version
		attr_accessor :api_access_control_id
		attr_accessor :default_delivery_type
		attr_accessor :default_embed_code_type
		attr_accessor :custom_delivery_types
		attr_accessor :restrict_entry_by_metadata
		attr_accessor :language
		attr_accessor :audio_thumb_entry_id
		attr_accessor :live_thumb_entry_id
		attr_accessor :time_aligned_renditions

		def id=(val)
			@id = val.to_i
		end
		def partner_package=(val)
			@partner_package = val.to_i
		end
		def monitor_usage=(val)
			@monitor_usage = val.to_i
		end
		def moderate_content=(val)
			@moderate_content = to_b(val)
		end
		def storage_delete_from_kaltura=(val)
			@storage_delete_from_kaltura = to_b(val)
		end
		def storage_serve_priority=(val)
			@storage_serve_priority = val.to_i
		end
		def kmc_version=(val)
			@kmc_version = val.to_i
		end
		def restrict_thumbnail_by_ks=(val)
			@restrict_thumbnail_by_ks = val.to_i
		end
		def support_animated_thumbnails=(val)
			@support_animated_thumbnails = to_b(val)
		end
		def def_thumb_offset=(val)
			@def_thumb_offset = val.to_i
		end
		def def_thumb_density=(val)
			@def_thumb_density = val.to_i
		end
		def user_session_role_id=(val)
			@user_session_role_id = val.to_i
		end
		def admin_session_role_id=(val)
			@admin_session_role_id = val.to_i
		end
		def import_remote_source_for_convert=(val)
			@import_remote_source_for_convert = to_b(val)
		end
		def allow_multi_notification=(val)
			@allow_multi_notification = to_b(val)
		end
		def login_block_period=(val)
			@login_block_period = val.to_i
		end
		def num_prev_pass_to_keep=(val)
			@num_prev_pass_to_keep = val.to_i
		end
		def pass_replace_freq=(val)
			@pass_replace_freq = val.to_i
		end
		def is_first_login=(val)
			@is_first_login = to_b(val)
		end
		def partner_group_type=(val)
			@partner_group_type = val.to_i
		end
		def partner_parent_id=(val)
			@partner_parent_id = val.to_i
		end
		def extended_free_trail_expiry_date=(val)
			@extended_free_trail_expiry_date = val.to_i
		end
		def extended_free_trail=(val)
			@extended_free_trail = val.to_i
		end
		def enable_bulk_upload_notifications_emails=(val)
			@enable_bulk_upload_notifications_emails = to_b(val)
		end
		def enforce_delivery=(val)
			@enforce_delivery = to_b(val)
		end
		def internal_use=(val)
			@internal_use = to_b(val)
		end
		def default_entitlement_enforcement=(val)
			@default_entitlement_enforcement = to_b(val)
		end
		def cache_flavor_version=(val)
			@cache_flavor_version = val.to_i
		end
		def api_access_control_id=(val)
			@api_access_control_id = val.to_i
		end
		def restrict_entry_by_metadata=(val)
			@restrict_entry_by_metadata = to_b(val)
		end
		def time_aligned_renditions=(val)
			@time_aligned_renditions = to_b(val)
		end

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.partner_name = xml_element.elements['partnerName'].text
			self.description = xml_element.elements['description'].text
			self.admin_name = xml_element.elements['adminName'].text
			self.admin_email = xml_element.elements['adminEmail'].text
			self.host = xml_element.elements['host'].text
			self.cdn_host = xml_element.elements['cdnHost'].text
			self.cdn_host_white_list = xml_element.elements['cdnHostWhiteList'].text
			self.thumbnail_host = xml_element.elements['thumbnailHost'].text
			self.partner_package = xml_element.elements['partnerPackage'].text
			self.monitor_usage = xml_element.elements['monitorUsage'].text
			self.moderate_content = xml_element.elements['moderateContent'].text
			self.storage_delete_from_kaltura = xml_element.elements['storageDeleteFromKaltura'].text
			self.storage_serve_priority = xml_element.elements['storageServePriority'].text
			self.kmc_version = xml_element.elements['kmcVersion'].text
			self.restrict_thumbnail_by_ks = xml_element.elements['restrictThumbnailByKs'].text
			self.support_animated_thumbnails = xml_element.elements['supportAnimatedThumbnails'].text
			self.def_thumb_offset = xml_element.elements['defThumbOffset'].text
			self.def_thumb_density = xml_element.elements['defThumbDensity'].text
			self.user_session_role_id = xml_element.elements['userSessionRoleId'].text
			self.admin_session_role_id = xml_element.elements['adminSessionRoleId'].text
			self.always_allowed_permission_names = xml_element.elements['alwaysAllowedPermissionNames'].text
			self.import_remote_source_for_convert = xml_element.elements['importRemoteSourceForConvert'].text
			self.permissions = KalturaClientBase.object_from_xml(xml_element.elements['permissions'], 'KalturaPermission')
			self.notifications_config = xml_element.elements['notificationsConfig'].text
			self.allow_multi_notification = xml_element.elements['allowMultiNotification'].text
			self.login_block_period = xml_element.elements['loginBlockPeriod'].text
			self.num_prev_pass_to_keep = xml_element.elements['numPrevPassToKeep'].text
			self.pass_replace_freq = xml_element.elements['passReplaceFreq'].text
			self.is_first_login = xml_element.elements['isFirstLogin'].text
			self.partner_group_type = xml_element.elements['partnerGroupType'].text
			self.partner_parent_id = xml_element.elements['partnerParentId'].text
			self.limits = KalturaClientBase.object_from_xml(xml_element.elements['limits'], 'KalturaSystemPartnerLimit')
			self.streamer_type = xml_element.elements['streamerType'].text
			self.media_protocol = xml_element.elements['mediaProtocol'].text
			self.extended_free_trail_expiry_reason = xml_element.elements['extendedFreeTrailExpiryReason'].text
			self.extended_free_trail_expiry_date = xml_element.elements['extendedFreeTrailExpiryDate'].text
			self.extended_free_trail = xml_element.elements['extendedFreeTrail'].text
			self.crm_id = xml_element.elements['crmId'].text
			self.reference_id = xml_element.elements['referenceId'].text
			self.crm_link = xml_element.elements['crmLink'].text
			self.vertical_clasiffication = xml_element.elements['verticalClasiffication'].text
			self.partner_package_class_of_service = xml_element.elements['partnerPackageClassOfService'].text
			self.enable_bulk_upload_notifications_emails = xml_element.elements['enableBulkUploadNotificationsEmails'].text
			self.delivery_profile_ids = xml_element.elements['deliveryProfileIds'].text
			self.enforce_delivery = xml_element.elements['enforceDelivery'].text
			self.bulk_upload_notifications_email = xml_element.elements['bulkUploadNotificationsEmail'].text
			self.internal_use = xml_element.elements['internalUse'].text
			self.default_live_stream_entry_source_type = xml_element.elements['defaultLiveStreamEntrySourceType'].text
			self.live_stream_provision_params = xml_element.elements['liveStreamProvisionParams'].text
			self.auto_moderate_entry_filter = KalturaClientBase.object_from_xml(xml_element.elements['autoModerateEntryFilter'], 'KalturaBaseEntryFilter')
			self.logout_url = xml_element.elements['logoutUrl'].text
			self.default_entitlement_enforcement = xml_element.elements['defaultEntitlementEnforcement'].text
			self.cache_flavor_version = xml_element.elements['cacheFlavorVersion'].text
			self.api_access_control_id = xml_element.elements['apiAccessControlId'].text
			self.default_delivery_type = xml_element.elements['defaultDeliveryType'].text
			self.default_embed_code_type = xml_element.elements['defaultEmbedCodeType'].text
			self.custom_delivery_types = KalturaClientBase.object_from_xml(xml_element.elements['customDeliveryTypes'], 'KalturaKeyBooleanValue')
			self.restrict_entry_by_metadata = xml_element.elements['restrictEntryByMetadata'].text
			self.language = xml_element.elements['language'].text
			self.audio_thumb_entry_id = xml_element.elements['audioThumbEntryId'].text
			self.live_thumb_entry_id = xml_element.elements['liveThumbEntryId'].text
			self.time_aligned_renditions = xml_element.elements['timeAlignedRenditions'].text
		end

	end

	class KalturaSystemPartnerPackage < KalturaObjectBase
		attr_accessor :id
		attr_accessor :name

		def id=(val)
			@id = val.to_i
		end

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.name = xml_element.elements['name'].text
		end

	end

	class KalturaSystemPartnerUsageItem < KalturaObjectBase
		# Partner ID
		# 	 
		attr_accessor :partner_id
		# Partner name
		# 	 
		attr_accessor :partner_name
		# Partner status
		# 	 
		attr_accessor :partner_status
		# Partner package
		# 	 
		attr_accessor :partner_package
		# Partner creation date (Unix timestamp)
		# 	 
		attr_accessor :partner_created_at
		# Number of player loads in the specific date range
		# 	 
		attr_accessor :views
		# Number of plays in the specific date range
		# 	 
		attr_accessor :plays
		# Number of new entries created during specific date range
		# 	 
		attr_accessor :entries_count
		# Total number of entries
		# 	 
		attr_accessor :total_entries_count
		# Number of new video entries created during specific date range
		# 	 
		attr_accessor :video_entries_count
		# Number of new image entries created during specific date range
		# 	 
		attr_accessor :image_entries_count
		# Number of new audio entries created during specific date range
		# 	 
		attr_accessor :audio_entries_count
		# Number of new mix entries created during specific date range
		# 	 
		attr_accessor :mix_entries_count
		# The total bandwidth usage during the given date range (in MB)
		# 	 
		attr_accessor :bandwidth
		# The total storage consumption (in MB)
		# 	 
		attr_accessor :total_storage
		# The change in storage consumption (new uploads) during the given date range (in MB)
		# 	 
		attr_accessor :storage
		# The peak amount of storage consumption during the given date range for the specific publisher
		# 	 
		attr_accessor :peak_storage
		# The average amount of storage consumption during the given date range for the specific publisher
		# 	 
		attr_accessor :avg_storage
		# The combined amount of bandwidth and storage consumed during the given date range for the specific publisher
		# 	 
		attr_accessor :combined_bandwidth_storage
		# Amount of deleted storage in MB
		# 	 
		attr_accessor :deleted_storage
		# Amount of transcoding usage in MB
		# 	 
		attr_accessor :transcoding_usage

		def partner_id=(val)
			@partner_id = val.to_i
		end
		def partner_status=(val)
			@partner_status = val.to_i
		end
		def partner_package=(val)
			@partner_package = val.to_i
		end
		def partner_created_at=(val)
			@partner_created_at = val.to_i
		end
		def views=(val)
			@views = val.to_i
		end
		def plays=(val)
			@plays = val.to_i
		end
		def entries_count=(val)
			@entries_count = val.to_i
		end
		def total_entries_count=(val)
			@total_entries_count = val.to_i
		end
		def video_entries_count=(val)
			@video_entries_count = val.to_i
		end
		def image_entries_count=(val)
			@image_entries_count = val.to_i
		end
		def audio_entries_count=(val)
			@audio_entries_count = val.to_i
		end
		def mix_entries_count=(val)
			@mix_entries_count = val.to_i
		end
		def bandwidth=(val)
			@bandwidth = val.to_f
		end
		def total_storage=(val)
			@total_storage = val.to_f
		end
		def storage=(val)
			@storage = val.to_f
		end
		def peak_storage=(val)
			@peak_storage = val.to_f
		end
		def avg_storage=(val)
			@avg_storage = val.to_f
		end
		def combined_bandwidth_storage=(val)
			@combined_bandwidth_storage = val.to_f
		end
		def deleted_storage=(val)
			@deleted_storage = val.to_f
		end
		def transcoding_usage=(val)
			@transcoding_usage = val.to_f
		end

		def from_xml(xml_element)
			super
			self.partner_id = xml_element.elements['partnerId'].text
			self.partner_name = xml_element.elements['partnerName'].text
			self.partner_status = xml_element.elements['partnerStatus'].text
			self.partner_package = xml_element.elements['partnerPackage'].text
			self.partner_created_at = xml_element.elements['partnerCreatedAt'].text
			self.views = xml_element.elements['views'].text
			self.plays = xml_element.elements['plays'].text
			self.entries_count = xml_element.elements['entriesCount'].text
			self.total_entries_count = xml_element.elements['totalEntriesCount'].text
			self.video_entries_count = xml_element.elements['videoEntriesCount'].text
			self.image_entries_count = xml_element.elements['imageEntriesCount'].text
			self.audio_entries_count = xml_element.elements['audioEntriesCount'].text
			self.mix_entries_count = xml_element.elements['mixEntriesCount'].text
			self.bandwidth = xml_element.elements['bandwidth'].text
			self.total_storage = xml_element.elements['totalStorage'].text
			self.storage = xml_element.elements['storage'].text
			self.peak_storage = xml_element.elements['peakStorage'].text
			self.avg_storage = xml_element.elements['avgStorage'].text
			self.combined_bandwidth_storage = xml_element.elements['combinedBandwidthStorage'].text
			self.deleted_storage = xml_element.elements['deletedStorage'].text
			self.transcoding_usage = xml_element.elements['transcodingUsage'].text
		end

	end

	class KalturaSystemPartnerOveragedLimit < KalturaSystemPartnerLimit
		attr_accessor :overage_price
		attr_accessor :overage_unit

		def overage_price=(val)
			@overage_price = val.to_f
		end
		def overage_unit=(val)
			@overage_unit = val.to_f
		end

		def from_xml(xml_element)
			super
			self.overage_price = xml_element.elements['overagePrice'].text
			self.overage_unit = xml_element.elements['overageUnit'].text
		end

	end

	class KalturaSystemPartnerUsageFilter < KalturaFilter
		# Date range from
		# 	 
		attr_accessor :from_date
		# Date range to
		# 	 
		attr_accessor :to_date
		# Time zone offset
		# 	 
		attr_accessor :timezone_offset

		def from_date=(val)
			@from_date = val.to_i
		end
		def to_date=(val)
			@to_date = val.to_i
		end
		def timezone_offset=(val)
			@timezone_offset = val.to_i
		end

		def from_xml(xml_element)
			super
			self.from_date = xml_element.elements['fromDate'].text
			self.to_date = xml_element.elements['toDate'].text
			self.timezone_offset = xml_element.elements['timezoneOffset'].text
		end

	end

	class KalturaSystemPartnerUsageListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaSystemPartnerUsageItem')
		end

	end

	class KalturaSystemPartnerFilter < KalturaPartnerFilter
		attr_accessor :partner_parent_id_equal
		attr_accessor :partner_parent_id_in

		def partner_parent_id_equal=(val)
			@partner_parent_id_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			self.partner_parent_id_equal = xml_element.elements['partnerParentIdEqual'].text
			self.partner_parent_id_in = xml_element.elements['partnerParentIdIn'].text
		end

	end


	# System partner service
	#  
	class KalturaSystemPartnerService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Retrieve all info about partner
		# 	 This service gets partner id as parameter and accessable to the admin console partner only
		# 	 
		def get(partner_id)
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.queue_service_action_call('systempartner_systempartner', 'get', 'KalturaPartner', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get_usage(partner_filter=KalturaNotImplemented, usage_filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'partnerFilter', partner_filter)
			client.add_param(kparams, 'usageFilter', usage_filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('systempartner_systempartner', 'getUsage', 'KalturaSystemPartnerUsageListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('systempartner_systempartner', 'list', 'KalturaPartnerListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def update_status(partner_id, status, reason)
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'status', status)
			client.add_param(kparams, 'reason', reason)
			client.queue_service_action_call('systempartner_systempartner', 'updateStatus', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get_admin_session(partner_id, user_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'userId', user_id)
			client.queue_service_action_call('systempartner_systempartner', 'getAdminSession', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def update_configuration(partner_id, configuration)
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'configuration', configuration)
			client.queue_service_action_call('systempartner_systempartner', 'updateConfiguration', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get_configuration(partner_id)
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.queue_service_action_call('systempartner_systempartner', 'getConfiguration', 'KalturaSystemPartnerConfiguration', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get_packages()
			kparams = {}
			client.queue_service_action_call('systempartner_systempartner', 'getPackages', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get_packages_class_of_service()
			kparams = {}
			client.queue_service_action_call('systempartner_systempartner', 'getPackagesClassOfService', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get_packages_vertical()
			kparams = {}
			client.queue_service_action_call('systempartner_systempartner', 'getPackagesVertical', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get_player_embed_code_types()
			kparams = {}
			client.queue_service_action_call('systempartner_systempartner', 'getPlayerEmbedCodeTypes', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get_player_delivery_types()
			kparams = {}
			client.queue_service_action_call('systempartner_systempartner', 'getPlayerDeliveryTypes', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def reset_user_password(user_id, partner_id, new_password)
			kparams = {}
			client.add_param(kparams, 'userId', user_id)
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'newPassword', new_password)
			client.queue_service_action_call('systempartner_systempartner', 'resetUserPassword', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def list_user_login_data(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('systempartner_systempartner', 'listUserLoginData', 'KalturaUserLoginDataListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :system_partner_service
		def system_partner_service
			if (@system_partner_service == nil)
				@system_partner_service = KalturaSystemPartnerService.new(self)
			end
			return @system_partner_service
		end
		
	end

end
