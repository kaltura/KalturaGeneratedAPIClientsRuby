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

	class KalturaPodcastDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaPodcastDistributionProviderOrderBy
	end

	class KalturaPodcastDistributionJobProviderData < KalturaDistributionJobProviderData
		attr_accessor :xml
		attr_accessor :metadata_profile_id
		attr_accessor :distribution_profile_id

		def metadata_profile_id=(val)
			@metadata_profile_id = val.to_i
		end
		def distribution_profile_id=(val)
			@distribution_profile_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['xml'] != nil
				self.xml = xml_element.elements['xml'].text
			end
			if xml_element.elements['metadataProfileId'] != nil
				self.metadata_profile_id = xml_element.elements['metadataProfileId'].text
			end
			if xml_element.elements['distributionProfileId'] != nil
				self.distribution_profile_id = xml_element.elements['distributionProfileId'].text
			end
		end

	end

	class KalturaPodcastDistributionProfile < KalturaDistributionProfile
		attr_accessor :xsl
		attr_accessor :feed_id
		attr_accessor :metadata_profile_id

		def metadata_profile_id=(val)
			@metadata_profile_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['xsl'] != nil
				self.xsl = xml_element.elements['xsl'].text
			end
			if xml_element.elements['feedId'] != nil
				self.feed_id = xml_element.elements['feedId'].text
			end
			if xml_element.elements['metadataProfileId'] != nil
				self.metadata_profile_id = xml_element.elements['metadataProfileId'].text
			end
		end

	end

	class KalturaPodcastDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaPodcastDistributionProfileBaseFilter < KalturaDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaPodcastDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaPodcastDistributionProfileFilter < KalturaPodcastDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaPodcastDistributionProviderFilter < KalturaPodcastDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
