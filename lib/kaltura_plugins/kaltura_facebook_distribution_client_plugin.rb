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
require 'kaltura_client.rb'
require File.dirname(__FILE__) + '/kaltura_content_distribution_client_plugin.rb'

module Kaltura

	class KalturaFacebookDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaFacebookDistributionProviderOrderBy
	end

	class KalturaFacebookCaptionDistributionInfo < KalturaObjectBase
		attr_accessor :language
		attr_accessor :label
		attr_accessor :file_path
		attr_accessor :remote_id
		attr_accessor :version
		attr_accessor :asset_id


		def from_xml(xml_element)
			super
			self.language = xml_element.elements['language'].text
			self.label = xml_element.elements['label'].text
			self.file_path = xml_element.elements['filePath'].text
			self.remote_id = xml_element.elements['remoteId'].text
			self.version = xml_element.elements['version'].text
			self.asset_id = xml_element.elements['assetId'].text
		end

	end

	class KalturaFacebookDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFacebookDistributionJobProviderData < KalturaConfigurableDistributionJobProviderData
		attr_accessor :video_asset_file_path
		attr_accessor :thumb_asset_file_path
		attr_accessor :captions_info


		def from_xml(xml_element)
			super
			self.video_asset_file_path = xml_element.elements['videoAssetFilePath'].text
			self.thumb_asset_file_path = xml_element.elements['thumbAssetFilePath'].text
			self.captions_info = KalturaClientBase.object_from_xml(xml_element.elements['captionsInfo'], 'KalturaFacebookCaptionDistributionInfo')
		end

	end

	class KalturaFacebookDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :api_authorize_url
		attr_accessor :page_id
		attr_accessor :page_access_token
		attr_accessor :user_access_token
		attr_accessor :state
		attr_accessor :permissions
		attr_accessor :re_request_permissions

		def re_request_permissions=(val)
			@re_request_permissions = val.to_i
		end

		def from_xml(xml_element)
			super
			self.api_authorize_url = xml_element.elements['apiAuthorizeUrl'].text
			self.page_id = xml_element.elements['pageId'].text
			self.page_access_token = xml_element.elements['pageAccessToken'].text
			self.user_access_token = xml_element.elements['userAccessToken'].text
			self.state = xml_element.elements['state'].text
			self.permissions = xml_element.elements['permissions'].text
			self.re_request_permissions = xml_element.elements['reRequestPermissions'].text
		end

	end

	class KalturaFacebookDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFacebookDistributionProviderFilter < KalturaFacebookDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFacebookDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFacebookDistributionProfileFilter < KalturaFacebookDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
