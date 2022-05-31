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
# Copyright (C) 2006-2022  Kaltura Inc.
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

	class KalturaHandleParticipantsMode
		ADD_AS_CO_PUBLISHERS = 0
		ADD_AS_CO_VIEWERS = 1
		IGNORE = 2
	end

	class KalturaVendorIntegrationStatus
		DISABLED = 1
		ACTIVE = 2
		DELETED = 3
	end

	class KalturaZoomUsersMatching
		DO_NOT_MODIFY = 0
		ADD_POSTFIX = 1
		REMOVE_POSTFIX = 2
		CMS_MATCHING = 3
	end

	class KalturaIntegrationSetting < KalturaObjectBase
		attr_accessor :id
		attr_accessor :status
		attr_accessor :default_user_id
		attr_accessor :account_id
		attr_accessor :create_user_if_not_exist
		attr_accessor :conversion_profile_id
		attr_accessor :handle_participants_mode
		attr_accessor :deletion_policy
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :partner_id

		def id=(val)
			@id = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def create_user_if_not_exist=(val)
			@create_user_if_not_exist = val.to_i
		end
		def conversion_profile_id=(val)
			@conversion_profile_id = val.to_i
		end
		def handle_participants_mode=(val)
			@handle_participants_mode = val.to_i
		end
		def deletion_policy=(val)
			@deletion_policy = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['defaultUserId'] != nil
				self.default_user_id = xml_element.elements['defaultUserId'].text
			end
			if xml_element.elements['accountId'] != nil
				self.account_id = xml_element.elements['accountId'].text
			end
			if xml_element.elements['createUserIfNotExist'] != nil
				self.create_user_if_not_exist = xml_element.elements['createUserIfNotExist'].text
			end
			if xml_element.elements['conversionProfileId'] != nil
				self.conversion_profile_id = xml_element.elements['conversionProfileId'].text
			end
			if xml_element.elements['handleParticipantsMode'] != nil
				self.handle_participants_mode = xml_element.elements['handleParticipantsMode'].text
			end
			if xml_element.elements['deletionPolicy'] != nil
				self.deletion_policy = xml_element.elements['deletionPolicy'].text
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
		end

	end

	class KalturaZoomIntegrationSetting < KalturaIntegrationSetting
		attr_accessor :zoom_category
		attr_accessor :enable_recording_upload
		attr_accessor :zoom_user_matching_mode
		attr_accessor :zoom_user_postfix
		attr_accessor :zoom_webinar_category
		attr_accessor :enable_webinar_uploads
		attr_accessor :jwt_token
		attr_accessor :enable_zoom_transcription
		attr_accessor :zoom_account_description
		attr_accessor :enable_meeting_upload
		attr_accessor :opt_out_group_names
		attr_accessor :opt_in_group_names
		attr_accessor :group_participation_type

		def enable_recording_upload=(val)
			@enable_recording_upload = val.to_i
		end
		def zoom_user_matching_mode=(val)
			@zoom_user_matching_mode = val.to_i
		end
		def enable_webinar_uploads=(val)
			@enable_webinar_uploads = val.to_i
		end
		def enable_zoom_transcription=(val)
			@enable_zoom_transcription = val.to_i
		end
		def enable_meeting_upload=(val)
			@enable_meeting_upload = val.to_i
		end
		def group_participation_type=(val)
			@group_participation_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['zoomCategory'] != nil
				self.zoom_category = xml_element.elements['zoomCategory'].text
			end
			if xml_element.elements['enableRecordingUpload'] != nil
				self.enable_recording_upload = xml_element.elements['enableRecordingUpload'].text
			end
			if xml_element.elements['zoomUserMatchingMode'] != nil
				self.zoom_user_matching_mode = xml_element.elements['zoomUserMatchingMode'].text
			end
			if xml_element.elements['zoomUserPostfix'] != nil
				self.zoom_user_postfix = xml_element.elements['zoomUserPostfix'].text
			end
			if xml_element.elements['zoomWebinarCategory'] != nil
				self.zoom_webinar_category = xml_element.elements['zoomWebinarCategory'].text
			end
			if xml_element.elements['enableWebinarUploads'] != nil
				self.enable_webinar_uploads = xml_element.elements['enableWebinarUploads'].text
			end
			if xml_element.elements['jwtToken'] != nil
				self.jwt_token = xml_element.elements['jwtToken'].text
			end
			if xml_element.elements['enableZoomTranscription'] != nil
				self.enable_zoom_transcription = xml_element.elements['enableZoomTranscription'].text
			end
			if xml_element.elements['zoomAccountDescription'] != nil
				self.zoom_account_description = xml_element.elements['zoomAccountDescription'].text
			end
			if xml_element.elements['enableMeetingUpload'] != nil
				self.enable_meeting_upload = xml_element.elements['enableMeetingUpload'].text
			end
			if xml_element.elements['optOutGroupNames'] != nil
				self.opt_out_group_names = xml_element.elements['optOutGroupNames'].text
			end
			if xml_element.elements['optInGroupNames'] != nil
				self.opt_in_group_names = xml_element.elements['optInGroupNames'].text
			end
			if xml_element.elements['groupParticipationType'] != nil
				self.group_participation_type = xml_element.elements['groupParticipationType'].text
			end
		end

	end

	class KalturaZoomIntegrationSettingResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaZoomIntegrationSetting')
			end
		end

	end


	class KalturaZoomVendorService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# @return [string]
		def de_authorization()
			kparams = {}
			client.queue_service_action_call('vendor_zoomvendor', 'deAuthorization', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return []
		def fetch_registration_page(tokens_data, iv)
			kparams = {}
			client.add_param(kparams, 'tokensData', tokens_data)
			client.add_param(kparams, 'iv', iv)
			client.queue_service_action_call('vendor_zoomvendor', 'fetchRegistrationPage', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve zoom integration setting object by partner id
		# @return [KalturaZoomIntegrationSetting]
		def get(partner_id)
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.queue_service_action_call('vendor_zoomvendor', 'get', 'KalturaZoomIntegrationSetting', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List KalturaZoomIntegrationSetting objects
		# @return [KalturaZoomIntegrationSettingResponse]
		def list(pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('vendor_zoomvendor', 'list', 'KalturaZoomIntegrationSettingResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return []
		def local_registration_page(jwt)
			kparams = {}
			client.add_param(kparams, 'jwt', jwt)
			client.queue_service_action_call('vendor_zoomvendor', 'localRegistrationPage', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# load html page the that will ask the user for its KMC URL, derive the region of the user from it,
		# 	 and redirect to the registration page in the correct region, while forwarding the necessary code for registration
		# @return []
		def oauth_validation()
			kparams = {}
			client.queue_service_action_call('vendor_zoomvendor', 'oauthValidation', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return [string]
		def pre_oauth_validation()
			kparams = {}
			client.queue_service_action_call('vendor_zoomvendor', 'preOauthValidation', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return []
		def recording_complete()
			kparams = {}
			client.queue_service_action_call('vendor_zoomvendor', 'recordingComplete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return [string]
		def submit_registration(account_id, integration_setting)
			kparams = {}
			client.add_param(kparams, 'accountId', account_id)
			client.add_param(kparams, 'integrationSetting', integration_setting)
			client.queue_service_action_call('vendor_zoomvendor', 'submitRegistration', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaVendorIntegrationService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new integration setting object
		# @return [KalturaIntegrationSetting]
		def add(integration, remote_id)
			kparams = {}
			client.add_param(kparams, 'integration', integration)
			client.add_param(kparams, 'remoteId', remote_id)
			client.queue_service_action_call('vendor_vendorintegration', 'add', 'KalturaIntegrationSetting', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete integration object by ID
		# @return [KalturaIntegrationSetting]
		def delete(integration_id)
			kparams = {}
			client.add_param(kparams, 'integrationId', integration_id)
			client.queue_service_action_call('vendor_vendorintegration', 'delete', 'KalturaIntegrationSetting', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve integration setting object by ID
		# @return [KalturaIntegrationSetting]
		def get(integration_id)
			kparams = {}
			client.add_param(kparams, 'integrationId', integration_id)
			client.queue_service_action_call('vendor_vendorintegration', 'get', 'KalturaIntegrationSetting', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing vedor catalog item object
		# @return [KalturaIntegrationSetting]
		def update(id, integration_setting)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'integrationSetting', integration_setting)
			client.queue_service_action_call('vendor_vendorintegration', 'update', 'KalturaIntegrationSetting', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update vendor catalog item status by id
		# @return [KalturaIntegrationSetting]
		def update_status(id, status)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'status', status)
			client.queue_service_action_call('vendor_vendorintegration', 'updateStatus', 'KalturaIntegrationSetting', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :zoom_vendor_service
		def zoom_vendor_service
			if (@zoom_vendor_service == nil)
				@zoom_vendor_service = KalturaZoomVendorService.new(self)
			end
			return @zoom_vendor_service
		end
		
		attr_reader :vendor_integration_service
		def vendor_integration_service
			if (@vendor_integration_service == nil)
				@vendor_integration_service = KalturaVendorIntegrationService.new(self)
			end
			return @vendor_integration_service
		end
		
	end

end
