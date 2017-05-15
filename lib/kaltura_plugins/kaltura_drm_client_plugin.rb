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

	class KalturaDrmLicenseExpirationPolicy
		FIXED_DURATION = 1
		ENTRY_SCHEDULING_END = 2
		UNLIMITED = 3
	end

	class KalturaDrmPolicyStatus
		ACTIVE = 1
		DELETED = 2
	end

	class KalturaDrmProfileStatus
		ACTIVE = 1
		DELETED = 2
	end

	class KalturaDrmLicenseScenario
		PROTECTION = "playReady.PROTECTION"
		PURCHASE = "playReady.PURCHASE"
		RENTAL = "playReady.RENTAL"
		SUBSCRIPTION = "playReady.SUBSCRIPTION"
	end

	class KalturaDrmLicenseType
		NON_PERSISTENT = "playReady.NON_PERSISTENT"
		PERSISTENT = "playReady.PERSISTENT"
	end

	class KalturaDrmPolicyOrderBy
	end

	class KalturaDrmProfileOrderBy
		ID_ASC = "+id"
		NAME_ASC = "+name"
		ID_DESC = "-id"
		NAME_DESC = "-name"
	end

	class KalturaDrmProviderType
		FAIRPLAY = "fairplay.FAIRPLAY"
		PLAY_READY = "playReady.PLAY_READY"
		WIDEVINE = "widevine.WIDEVINE"
		CENC = "1"
	end

	class KalturaDrmSchemeName
		PLAYREADY_CENC = "drm.PLAYREADY_CENC"
		WIDEVINE_CENC = "drm.WIDEVINE_CENC"
		FAIRPLAY = "fairplay.FAIRPLAY"
		PLAYREADY = "playReady.PLAYREADY"
		WIDEVINE = "widevine.WIDEVINE"
	end

	class KalturaDrmLicenseAccessDetails < KalturaObjectBase
		# Drm policy name
		attr_accessor :policy
		# movie duration in seconds
		attr_accessor :duration
		# playback window in seconds
		attr_accessor :absolute_duration
		attr_accessor :license_params

		def duration=(val)
			@duration = val.to_i
		end
		def absolute_duration=(val)
			@absolute_duration = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['policy'] != nil
				self.policy = xml_element.elements['policy'].text
			end
			if xml_element.elements['duration'] != nil
				self.duration = xml_element.elements['duration'].text
			end
			if xml_element.elements['absolute_duration'] != nil
				self.absolute_duration = xml_element.elements['absolute_duration'].text
			end
			if xml_element.elements['licenseParams'] != nil
				self.license_params = KalturaClientBase.object_from_xml(xml_element.elements['licenseParams'], 'KalturaKeyValue')
			end
		end

	end

	class KalturaDrmPolicy < KalturaObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :name
		attr_accessor :system_name
		attr_accessor :description
		attr_accessor :provider
		attr_accessor :status
		attr_accessor :scenario
		attr_accessor :license_type
		attr_accessor :license_expiration_policy
		# Duration in days the license is effective
		attr_accessor :duration
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :license_params

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def license_expiration_policy=(val)
			@license_expiration_policy = val.to_i
		end
		def duration=(val)
			@duration = val.to_i
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
			if xml_element.elements['provider'] != nil
				self.provider = xml_element.elements['provider'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['scenario'] != nil
				self.scenario = xml_element.elements['scenario'].text
			end
			if xml_element.elements['licenseType'] != nil
				self.license_type = xml_element.elements['licenseType'].text
			end
			if xml_element.elements['licenseExpirationPolicy'] != nil
				self.license_expiration_policy = xml_element.elements['licenseExpirationPolicy'].text
			end
			if xml_element.elements['duration'] != nil
				self.duration = xml_element.elements['duration'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['licenseParams'] != nil
				self.license_params = KalturaClientBase.object_from_xml(xml_element.elements['licenseParams'], 'KalturaKeyValue')
			end
		end

	end

	class KalturaDrmProfile < KalturaObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :name
		attr_accessor :description
		attr_accessor :provider
		attr_accessor :status
		attr_accessor :license_server_url
		attr_accessor :default_policy
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :signing_key

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
			if xml_element.elements['provider'] != nil
				self.provider = xml_element.elements['provider'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['licenseServerUrl'] != nil
				self.license_server_url = xml_element.elements['licenseServerUrl'].text
			end
			if xml_element.elements['defaultPolicy'] != nil
				self.default_policy = xml_element.elements['defaultPolicy'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['signingKey'] != nil
				self.signing_key = xml_element.elements['signingKey'].text
			end
		end

	end

	class KalturaAccessControlDrmPolicyAction < KalturaRuleAction
		# Drm policy id
		attr_accessor :policy_id

		def policy_id=(val)
			@policy_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['policyId'] != nil
				self.policy_id = xml_element.elements['policyId'].text
			end
		end

	end

	class KalturaDrmPolicyBaseFilter < KalturaFilter
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :name_like
		attr_accessor :system_name_like
		attr_accessor :provider_equal
		attr_accessor :provider_in
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :scenario_equal
		attr_accessor :scenario_in

		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['partnerIdEqual'] != nil
				self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			end
			if xml_element.elements['partnerIdIn'] != nil
				self.partner_id_in = xml_element.elements['partnerIdIn'].text
			end
			if xml_element.elements['nameLike'] != nil
				self.name_like = xml_element.elements['nameLike'].text
			end
			if xml_element.elements['systemNameLike'] != nil
				self.system_name_like = xml_element.elements['systemNameLike'].text
			end
			if xml_element.elements['providerEqual'] != nil
				self.provider_equal = xml_element.elements['providerEqual'].text
			end
			if xml_element.elements['providerIn'] != nil
				self.provider_in = xml_element.elements['providerIn'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['scenarioEqual'] != nil
				self.scenario_equal = xml_element.elements['scenarioEqual'].text
			end
			if xml_element.elements['scenarioIn'] != nil
				self.scenario_in = xml_element.elements['scenarioIn'].text
			end
		end

	end

	class KalturaDrmPolicyListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaDrmPolicy')
			end
		end

	end

	class KalturaDrmProfileBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :name_like
		attr_accessor :provider_equal
		attr_accessor :provider_in
		attr_accessor :status_equal
		attr_accessor :status_in

		def id_equal=(val)
			@id_equal = val.to_i
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
			if xml_element.elements['partnerIdEqual'] != nil
				self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			end
			if xml_element.elements['partnerIdIn'] != nil
				self.partner_id_in = xml_element.elements['partnerIdIn'].text
			end
			if xml_element.elements['nameLike'] != nil
				self.name_like = xml_element.elements['nameLike'].text
			end
			if xml_element.elements['providerEqual'] != nil
				self.provider_equal = xml_element.elements['providerEqual'].text
			end
			if xml_element.elements['providerIn'] != nil
				self.provider_in = xml_element.elements['providerIn'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
		end

	end

	class KalturaDrmProfileListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaDrmProfile')
			end
		end

	end

	class KalturaDrmPolicyFilter < KalturaDrmPolicyBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDrmProfileFilter < KalturaDrmProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	class KalturaDrmPolicyService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Allows you to add a new DrmPolicy object
		# @return [KalturaDrmPolicy]
		def add(drm_policy)
			kparams = {}
			client.add_param(kparams, 'drmPolicy', drm_policy)
			client.queue_service_action_call('drm_drmpolicy', 'add', 'KalturaDrmPolicy', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Mark the KalturaDrmPolicy object as deleted
		# @return [KalturaDrmPolicy]
		def delete(drm_policy_id)
			kparams = {}
			client.add_param(kparams, 'drmPolicyId', drm_policy_id)
			client.queue_service_action_call('drm_drmpolicy', 'delete', 'KalturaDrmPolicy', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a KalturaDrmPolicy object by ID
		# @return [KalturaDrmPolicy]
		def get(drm_policy_id)
			kparams = {}
			client.add_param(kparams, 'drmPolicyId', drm_policy_id)
			client.queue_service_action_call('drm_drmpolicy', 'get', 'KalturaDrmPolicy', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List KalturaDrmPolicy objects
		# @return [KalturaDrmPolicyListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('drm_drmpolicy', 'list', 'KalturaDrmPolicyListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing KalturaDrmPolicy object
		# @return [KalturaDrmPolicy]
		def update(drm_policy_id, drm_policy)
			kparams = {}
			client.add_param(kparams, 'drmPolicyId', drm_policy_id)
			client.add_param(kparams, 'drmPolicy', drm_policy)
			client.queue_service_action_call('drm_drmpolicy', 'update', 'KalturaDrmPolicy', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaDrmProfileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Allows you to add a new DrmProfile object
		# @return [KalturaDrmProfile]
		def add(drm_profile)
			kparams = {}
			client.add_param(kparams, 'drmProfile', drm_profile)
			client.queue_service_action_call('drm_drmprofile', 'add', 'KalturaDrmProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Mark the KalturaDrmProfile object as deleted
		# @return [KalturaDrmProfile]
		def delete(drm_profile_id)
			kparams = {}
			client.add_param(kparams, 'drmProfileId', drm_profile_id)
			client.queue_service_action_call('drm_drmprofile', 'delete', 'KalturaDrmProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a KalturaDrmProfile object by ID
		# @return [KalturaDrmProfile]
		def get(drm_profile_id)
			kparams = {}
			client.add_param(kparams, 'drmProfileId', drm_profile_id)
			client.queue_service_action_call('drm_drmprofile', 'get', 'KalturaDrmProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a KalturaDrmProfile object by provider, if no specific profile defined return default profile
		# @return [KalturaDrmProfile]
		def get_by_provider(provider)
			kparams = {}
			client.add_param(kparams, 'provider', provider)
			client.queue_service_action_call('drm_drmprofile', 'getByProvider', 'KalturaDrmProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List KalturaDrmProfile objects
		# @return [KalturaDrmProfileListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('drm_drmprofile', 'list', 'KalturaDrmProfileListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing KalturaDrmProfile object
		# @return [KalturaDrmProfile]
		def update(drm_profile_id, drm_profile)
			kparams = {}
			client.add_param(kparams, 'drmProfileId', drm_profile_id)
			client.add_param(kparams, 'drmProfile', drm_profile)
			client.queue_service_action_call('drm_drmprofile', 'update', 'KalturaDrmProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Retrieve information and invoke actions on Flavor Asset
	class KalturaDrmLicenseAccessService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# getAccessAction
		#      input: flavor ids, drmProvider
		#      Get Access Action
		# @return [KalturaDrmLicenseAccessDetails]
		def get_access(entry_id, flavor_ids, referrer)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'flavorIds', flavor_ids)
			client.add_param(kparams, 'referrer', referrer)
			client.queue_service_action_call('drm_drmlicenseaccess', 'getAccess', 'KalturaDrmLicenseAccessDetails', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :drm_policy_service
		def drm_policy_service
			if (@drm_policy_service == nil)
				@drm_policy_service = KalturaDrmPolicyService.new(self)
			end
			return @drm_policy_service
		end
		
		attr_reader :drm_profile_service
		def drm_profile_service
			if (@drm_profile_service == nil)
				@drm_profile_service = KalturaDrmProfileService.new(self)
			end
			return @drm_profile_service
		end
		
		attr_reader :drm_license_access_service
		def drm_license_access_service
			if (@drm_license_access_service == nil)
				@drm_license_access_service = KalturaDrmLicenseAccessService.new(self)
			end
			return @drm_license_access_service
		end
		
	end

end
