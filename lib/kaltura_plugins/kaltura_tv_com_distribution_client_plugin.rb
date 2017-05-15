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

	class KalturaTVComDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaTVComDistributionProviderOrderBy
	end

	class KalturaTVComDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaTVComDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :metadata_profile_id
		attr_accessor :feed_url
		attr_accessor :feed_title
		attr_accessor :feed_link
		attr_accessor :feed_description
		attr_accessor :feed_language
		attr_accessor :feed_copyright
		attr_accessor :feed_image_title
		attr_accessor :feed_image_url
		attr_accessor :feed_image_link
		attr_accessor :feed_image_width
		attr_accessor :feed_image_height

		def metadata_profile_id=(val)
			@metadata_profile_id = val.to_i
		end
		def feed_image_width=(val)
			@feed_image_width = val.to_i
		end
		def feed_image_height=(val)
			@feed_image_height = val.to_i
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
			if xml_element.elements['feedLanguage'] != nil
				self.feed_language = xml_element.elements['feedLanguage'].text
			end
			if xml_element.elements['feedCopyright'] != nil
				self.feed_copyright = xml_element.elements['feedCopyright'].text
			end
			if xml_element.elements['feedImageTitle'] != nil
				self.feed_image_title = xml_element.elements['feedImageTitle'].text
			end
			if xml_element.elements['feedImageUrl'] != nil
				self.feed_image_url = xml_element.elements['feedImageUrl'].text
			end
			if xml_element.elements['feedImageLink'] != nil
				self.feed_image_link = xml_element.elements['feedImageLink'].text
			end
			if xml_element.elements['feedImageWidth'] != nil
				self.feed_image_width = xml_element.elements['feedImageWidth'].text
			end
			if xml_element.elements['feedImageHeight'] != nil
				self.feed_image_height = xml_element.elements['feedImageHeight'].text
			end
		end

	end

	class KalturaTVComDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaTVComDistributionProviderFilter < KalturaTVComDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaTVComDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaTVComDistributionProfileFilter < KalturaTVComDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
