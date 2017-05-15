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

	class KalturaDailymotionDistributionCaptionAction
		UPDATE_ACTION = 1
		SUBMIT_ACTION = 2
		DELETE_ACTION = 3
	end

	class KalturaDailymotionDistributionCaptionFormat
		SRT = 1
		STL = 2
		TT = 3
	end

	class KalturaDailymotionGeoBlockingMapping
		DISABLED = 0
		ACCESS_CONTROL = 1
		METADATA = 2
	end

	class KalturaDailymotionDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaDailymotionDistributionProviderOrderBy
	end

	class KalturaDailymotionDistributionCaptionInfo < KalturaObjectBase
		attr_accessor :language
		attr_accessor :file_path
		attr_accessor :remote_id
		attr_accessor :action
		attr_accessor :version
		attr_accessor :asset_id
		attr_accessor :format

		def action=(val)
			@action = val.to_i
		end
		def format=(val)
			@format = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['language'] != nil
				self.language = xml_element.elements['language'].text
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
			if xml_element.elements['format'] != nil
				self.format = xml_element.elements['format'].text
			end
		end

	end

	class KalturaDailymotionDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDailymotionDistributionJobProviderData < KalturaConfigurableDistributionJobProviderData
		attr_accessor :video_asset_file_path
		attr_accessor :access_control_geo_blocking_operation
		attr_accessor :access_control_geo_blocking_country_list
		attr_accessor :captions_info


		def from_xml(xml_element)
			super
			if xml_element.elements['videoAssetFilePath'] != nil
				self.video_asset_file_path = xml_element.elements['videoAssetFilePath'].text
			end
			if xml_element.elements['accessControlGeoBlockingOperation'] != nil
				self.access_control_geo_blocking_operation = xml_element.elements['accessControlGeoBlockingOperation'].text
			end
			if xml_element.elements['accessControlGeoBlockingCountryList'] != nil
				self.access_control_geo_blocking_country_list = xml_element.elements['accessControlGeoBlockingCountryList'].text
			end
			if xml_element.elements['captionsInfo'] != nil
				self.captions_info = KalturaClientBase.object_from_xml(xml_element.elements['captionsInfo'], 'KalturaDailymotionDistributionCaptionInfo')
			end
		end

	end

	class KalturaDailymotionDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :user
		attr_accessor :password
		attr_accessor :geo_blocking_mapping

		def geo_blocking_mapping=(val)
			@geo_blocking_mapping = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['user'] != nil
				self.user = xml_element.elements['user'].text
			end
			if xml_element.elements['password'] != nil
				self.password = xml_element.elements['password'].text
			end
			if xml_element.elements['geoBlockingMapping'] != nil
				self.geo_blocking_mapping = xml_element.elements['geoBlockingMapping'].text
			end
		end

	end

	class KalturaDailymotionDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDailymotionDistributionProviderFilter < KalturaDailymotionDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDailymotionDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDailymotionDistributionProfileFilter < KalturaDailymotionDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
