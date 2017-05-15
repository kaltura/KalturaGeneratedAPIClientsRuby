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
require File.dirname(__FILE__) + '/kaltura_caption_client_plugin.rb'
require File.dirname(__FILE__) + '/kaltura_cue_point_client_plugin.rb'

module Kaltura

	class KalturaComcastMrssDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaComcastMrssDistributionProviderOrderBy
	end

	class KalturaComcastMrssDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaComcastMrssDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :metadata_profile_id
		attr_accessor :feed_url
		attr_accessor :feed_title
		attr_accessor :feed_link
		attr_accessor :feed_description
		attr_accessor :feed_last_build_date
		attr_accessor :item_link
		attr_accessor :c_platform_tv_series
		attr_accessor :c_platform_tv_series_field
		attr_accessor :should_include_cue_points
		attr_accessor :should_include_captions
		attr_accessor :should_add_thumb_extension

		def metadata_profile_id=(val)
			@metadata_profile_id = val.to_i
		end
		def should_include_cue_points=(val)
			@should_include_cue_points = to_b(val)
		end
		def should_include_captions=(val)
			@should_include_captions = to_b(val)
		end
		def should_add_thumb_extension=(val)
			@should_add_thumb_extension = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['metadataProfileId'] != nil
				self.metadata_profile_id = xml_element.elements['metadataProfileId'].text
			end
			if xml_element.elements['feedUrl'] != nil
				self.feed_url = xml_element.elements['feedUrl'].text
			end
			if xml_element.elements['feedTitle'] != nil
				self.feed_title = xml_element.elements['feedTitle'].text
			end
			if xml_element.elements['feedLink'] != nil
				self.feed_link = xml_element.elements['feedLink'].text
			end
			if xml_element.elements['feedDescription'] != nil
				self.feed_description = xml_element.elements['feedDescription'].text
			end
			if xml_element.elements['feedLastBuildDate'] != nil
				self.feed_last_build_date = xml_element.elements['feedLastBuildDate'].text
			end
			if xml_element.elements['itemLink'] != nil
				self.item_link = xml_element.elements['itemLink'].text
			end
			if xml_element.elements['cPlatformTvSeries'] != nil
				self.c_platform_tv_series = KalturaClientBase.object_from_xml(xml_element.elements['cPlatformTvSeries'], 'KalturaKeyValue')
			end
			if xml_element.elements['cPlatformTvSeriesField'] != nil
				self.c_platform_tv_series_field = xml_element.elements['cPlatformTvSeriesField'].text
			end
			if xml_element.elements['shouldIncludeCuePoints'] != nil
				self.should_include_cue_points = xml_element.elements['shouldIncludeCuePoints'].text
			end
			if xml_element.elements['shouldIncludeCaptions'] != nil
				self.should_include_captions = xml_element.elements['shouldIncludeCaptions'].text
			end
			if xml_element.elements['shouldAddThumbExtension'] != nil
				self.should_add_thumb_extension = xml_element.elements['shouldAddThumbExtension'].text
			end
		end

	end

	class KalturaComcastMrssDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaComcastMrssDistributionProviderFilter < KalturaComcastMrssDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaComcastMrssDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaComcastMrssDistributionProfileFilter < KalturaComcastMrssDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	class KalturaClient < KalturaClientBase
	end

end
