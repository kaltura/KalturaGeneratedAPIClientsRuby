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

	class KalturaNdnDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaNdnDistributionProviderOrderBy
	end

	class KalturaNdnDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaNdnDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :feed_url
		attr_accessor :channel_title
		attr_accessor :channel_link
		attr_accessor :channel_description
		attr_accessor :channel_language
		attr_accessor :channel_copyright
		attr_accessor :channel_image_title
		attr_accessor :channel_image_url
		attr_accessor :channel_image_link
		attr_accessor :item_media_rating


		def from_xml(xml_element)
			super
			if xml_element.elements['feedUrl'] != nil
				self.feed_url = xml_element.elements['feedUrl'].text
			end
			if xml_element.elements['channelTitle'] != nil
				self.channel_title = xml_element.elements['channelTitle'].text
			end
			if xml_element.elements['channelLink'] != nil
				self.channel_link = xml_element.elements['channelLink'].text
			end
			if xml_element.elements['channelDescription'] != nil
				self.channel_description = xml_element.elements['channelDescription'].text
			end
			if xml_element.elements['channelLanguage'] != nil
				self.channel_language = xml_element.elements['channelLanguage'].text
			end
			if xml_element.elements['channelCopyright'] != nil
				self.channel_copyright = xml_element.elements['channelCopyright'].text
			end
			if xml_element.elements['channelImageTitle'] != nil
				self.channel_image_title = xml_element.elements['channelImageTitle'].text
			end
			if xml_element.elements['channelImageUrl'] != nil
				self.channel_image_url = xml_element.elements['channelImageUrl'].text
			end
			if xml_element.elements['channelImageLink'] != nil
				self.channel_image_link = xml_element.elements['channelImageLink'].text
			end
			if xml_element.elements['itemMediaRating'] != nil
				self.item_media_rating = xml_element.elements['itemMediaRating'].text
			end
		end

	end

	class KalturaNdnDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaNdnDistributionProviderFilter < KalturaNdnDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaNdnDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaNdnDistributionProfileFilter < KalturaNdnDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Ndn Service
	class KalturaNdnService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# @return [file]
		def get_feed(distribution_profile_id, hash)
			kparams = {}
			client.add_param(kparams, 'distributionProfileId', distribution_profile_id)
			client.add_param(kparams, 'hash', hash)
			client.queue_service_action_call('ndndistribution_ndn', 'getFeed', 'file', kparams)
			return client.get_serve_url()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :ndn_service
		def ndn_service
			if (@ndn_service == nil)
				@ndn_service = KalturaNdnService.new(self)
			end
			return @ndn_service
		end
		
	end

end
