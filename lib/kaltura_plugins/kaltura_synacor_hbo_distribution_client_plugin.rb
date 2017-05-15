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

	class KalturaSynacorHboDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaSynacorHboDistributionProviderOrderBy
	end

	class KalturaSynacorHboDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSynacorHboDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :feed_url
		attr_accessor :feed_title
		attr_accessor :feed_subtitle
		attr_accessor :feed_link
		attr_accessor :feed_author_name


		def from_xml(xml_element)
			super
			if xml_element.elements['feedUrl'] != nil
				self.feed_url = xml_element.elements['feedUrl'].text
			end
			if xml_element.elements['feedTitle'] != nil
				self.feed_title = xml_element.elements['feedTitle'].text
			end
			if xml_element.elements['feedSubtitle'] != nil
				self.feed_subtitle = xml_element.elements['feedSubtitle'].text
			end
			if xml_element.elements['feedLink'] != nil
				self.feed_link = xml_element.elements['feedLink'].text
			end
			if xml_element.elements['feedAuthorName'] != nil
				self.feed_author_name = xml_element.elements['feedAuthorName'].text
			end
		end

	end

	class KalturaSynacorHboDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSynacorHboDistributionProviderFilter < KalturaSynacorHboDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSynacorHboDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSynacorHboDistributionProfileFilter < KalturaSynacorHboDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Synacor HBO Service
	class KalturaSynacorHboService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# @return [file]
		def get_feed(distribution_profile_id, hash)
			kparams = {}
			client.add_param(kparams, 'distributionProfileId', distribution_profile_id)
			client.add_param(kparams, 'hash', hash)
			client.queue_service_action_call('synacorhbodistribution_synacorhbo', 'getFeed', 'file', kparams)
			return client.get_serve_url()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :synacor_hbo_service
		def synacor_hbo_service
			if (@synacor_hbo_service == nil)
				@synacor_hbo_service = KalturaSynacorHboService.new(self)
			end
			return @synacor_hbo_service
		end
		
	end

end
