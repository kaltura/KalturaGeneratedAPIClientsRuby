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
require File.dirname(__FILE__) + '/kaltura_content_distribution_client_plugin.rb'

module Kaltura

	class KalturaYouTubeApiDistributionCaptionAction
		UPDATE_ACTION = 1
		SUBMIT_ACTION = 2
		DELETE_ACTION = 3
	end

	class KalturaYoutubeApiDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaYoutubeApiDistributionProviderOrderBy
	end

	class KalturaYouTubeApiCaptionDistributionInfo < KalturaObjectBase
		attr_accessor :language
		attr_accessor :label
		attr_accessor :file_path
		attr_accessor :remote_id
		attr_accessor :action
		attr_accessor :version
		attr_accessor :asset_id

		def action=(val)
			@action = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['language'] != nil
				self.language = xml_element.elements['language'].text
			end
			if xml_element.elements['label'] != nil
				self.label = xml_element.elements['label'].text
			end
			if xml_element.elements['filePath'] != nil
				self.file_path = xml_element.elements['filePath'].text
			end
			if xml_element.elements['remoteId'] != nil
				self.remote_id = xml_element.elements['remoteId'].text
			end
			if xml_element.elements['action'] != nil
				self.action = xml_element.elements['action'].text
			end
			if xml_element.elements['version'] != nil
				self.version = xml_element.elements['version'].text
			end
			if xml_element.elements['assetId'] != nil
				self.asset_id = xml_element.elements['assetId'].text
			end
		end

	end

	class KalturaYoutubeApiDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaYoutubeApiDistributionJobProviderData < KalturaConfigurableDistributionJobProviderData
		attr_accessor :video_asset_file_path
		attr_accessor :thumb_asset_file_path
		attr_accessor :captions_info


		def from_xml(xml_element)
			super
			if xml_element.elements['videoAssetFilePath'] != nil
				self.video_asset_file_path = xml_element.elements['videoAssetFilePath'].text
			end
			if xml_element.elements['thumbAssetFilePath'] != nil
				self.thumb_asset_file_path = xml_element.elements['thumbAssetFilePath'].text
			end
			if xml_element.elements['captionsInfo'] != nil
				self.captions_info = KalturaClientBase.object_from_xml(xml_element.elements['captionsInfo'], 'KalturaYouTubeApiCaptionDistributionInfo')
			end
		end

	end

	class KalturaYoutubeApiDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :username
		attr_accessor :default_category
		attr_accessor :allow_comments
		attr_accessor :allow_embedding
		attr_accessor :allow_ratings
		attr_accessor :allow_responses
		attr_accessor :api_authorize_url
		attr_accessor :google_client_id
		attr_accessor :google_client_secret
		attr_accessor :google_token_data
		attr_accessor :assume_success
		attr_accessor :privacy_status

		def default_category=(val)
			@default_category = val.to_i
		end
		def assume_success=(val)
			@assume_success = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['username'] != nil
				self.username = xml_element.elements['username'].text
			end
			if xml_element.elements['defaultCategory'] != nil
				self.default_category = xml_element.elements['defaultCategory'].text
			end
			if xml_element.elements['allowComments'] != nil
				self.allow_comments = xml_element.elements['allowComments'].text
			end
			if xml_element.elements['allowEmbedding'] != nil
				self.allow_embedding = xml_element.elements['allowEmbedding'].text
			end
			if xml_element.elements['allowRatings'] != nil
				self.allow_ratings = xml_element.elements['allowRatings'].text
			end
			if xml_element.elements['allowResponses'] != nil
				self.allow_responses = xml_element.elements['allowResponses'].text
			end
			if xml_element.elements['apiAuthorizeUrl'] != nil
				self.api_authorize_url = xml_element.elements['apiAuthorizeUrl'].text
			end
			if xml_element.elements['googleClientId'] != nil
				self.google_client_id = xml_element.elements['googleClientId'].text
			end
			if xml_element.elements['googleClientSecret'] != nil
				self.google_client_secret = xml_element.elements['googleClientSecret'].text
			end
			if xml_element.elements['googleTokenData'] != nil
				self.google_token_data = xml_element.elements['googleTokenData'].text
			end
			if xml_element.elements['assumeSuccess'] != nil
				self.assume_success = xml_element.elements['assumeSuccess'].text
			end
			if xml_element.elements['privacyStatus'] != nil
				self.privacy_status = xml_element.elements['privacyStatus'].text
			end
		end

	end

	class KalturaYoutubeApiDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaYoutubeApiDistributionProviderFilter < KalturaYoutubeApiDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaYoutubeApiDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaYoutubeApiDistributionProfileFilter < KalturaYoutubeApiDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
