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
require File.dirname(__FILE__) + '/kaltura_cue_point_client_plugin.rb'

module Kaltura

	class KalturaDoubleClickDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaDoubleClickDistributionProviderOrderBy
	end

	class KalturaDoubleClickDistributionJobProviderData < KalturaDistributionJobProviderData


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDoubleClickDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDoubleClickDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :channel_title
		attr_accessor :channel_link
		attr_accessor :channel_description
		attr_accessor :feed_url
		attr_accessor :cue_points_provider
		attr_accessor :items_per_page
		attr_accessor :ignore_scheduling_in_feed

		def ignore_scheduling_in_feed=(val)
			@ignore_scheduling_in_feed = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['channelTitle'] != nil
				self.channel_title = xml_element.elements['channelTitle'].text
			end
			if xml_element.elements['channelLink'] != nil
				self.channel_link = xml_element.elements['channelLink'].text
			end
			if xml_element.elements['channelDescription'] != nil
				self.channel_description = xml_element.elements['channelDescription'].text
			end
			if xml_element.elements['feedUrl'] != nil
				self.feed_url = xml_element.elements['feedUrl'].text
			end
			if xml_element.elements['cuePointsProvider'] != nil
				self.cue_points_provider = xml_element.elements['cuePointsProvider'].text
			end
			if xml_element.elements['itemsPerPage'] != nil
				self.items_per_page = xml_element.elements['itemsPerPage'].text
			end
			if xml_element.elements['ignoreSchedulingInFeed'] != nil
				self.ignore_scheduling_in_feed = xml_element.elements['ignoreSchedulingInFeed'].text
			end
		end

	end

	class KalturaDoubleClickDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDoubleClickDistributionProviderFilter < KalturaDoubleClickDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDoubleClickDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDoubleClickDistributionProfileFilter < KalturaDoubleClickDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	class KalturaClient < KalturaClientBase
	end

end
