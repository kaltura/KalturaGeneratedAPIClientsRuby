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
# Copyright (C) 2006-2020  Kaltura Inc.
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

	class KalturaZoomUsersMatching
		DO_NOT_MODIFY = 0
		ADD_POSTFIX = 1
		REMOVE_POSTFIX = 2
	end

	class KalturaZoomIntegrationSetting < KalturaObjectBase
		attr_accessor :default_user_id
		attr_accessor :zoom_category
		attr_accessor :account_id
		attr_accessor :enable_recording_upload
		attr_accessor :create_user_if_not_exist
		attr_accessor :handle_participants_mode
		attr_accessor :zoom_user_matching_mode
		attr_accessor :zoom_user_postfix
		attr_accessor :zoom_webinar_category
		attr_accessor :enable_webinar_uploads
		attr_accessor :conversion_profile_id

		def enable_recording_upload=(val)
			@enable_recording_upload = val.to_i
		end
		def create_user_if_not_exist=(val)
			@create_user_if_not_exist = val.to_i
		end
		def handle_participants_mode=(val)
			@handle_participants_mode = val.to_i
		end
		def zoom_user_matching_mode=(val)
			@zoom_user_matching_mode = val.to_i
		end
		def enable_webinar_uploads=(val)
			@enable_webinar_uploads = val.to_i
		end
		def conversion_profile_id=(val)
			@conversion_profile_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['defaultUserId'] != nil
				self.default_user_id = xml_element.elements['defaultUserId'].text
			end
			if xml_element.elements['zoomCategory'] != nil
				self.zoom_category = xml_element.elements['zoomCategory'].text
			end
			if xml_element.elements['accountId'] != nil
				self.account_id = xml_element.elements['accountId'].text
			end
			if xml_element.elements['enableRecordingUpload'] != nil
				self.enable_recording_upload = xml_element.elements['enableRecordingUpload'].text
			end
			if xml_element.elements['createUserIfNotExist'] != nil
				self.create_user_if_not_exist = xml_element.elements['createUserIfNotExist'].text
			end
			if xml_element.elements['handleParticipantsMode'] != nil
				self.handle_participants_mode = xml_element.elements['handleParticipantsMode'].text
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
			if xml_element.elements['conversionProfileId'] != nil
				self.conversion_profile_id = xml_element.elements['conversionProfileId'].text
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

		# @return [string]
		def oauth_validation()
			kparams = {}
			client.queue_service_action_call('vendor_zoomvendor', 'oauthValidation', 'string', kparams)
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

	class KalturaClient < KalturaClientBase
		attr_reader :zoom_vendor_service
		def zoom_vendor_service
			if (@zoom_vendor_service == nil)
				@zoom_vendor_service = KalturaZoomVendorService.new(self)
			end
			return @zoom_vendor_service
		end
		
	end

end
