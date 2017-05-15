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

	class KalturaTimeWarnerDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaTimeWarnerDistributionProviderOrderBy
	end

	class KalturaTimeWarnerDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaTimeWarnerDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :feed_url


		def from_xml(xml_element)
			super
			if xml_element.elements['feedUrl'] != nil
				self.feed_url = xml_element.elements['feedUrl'].text
			end
		end

	end

	class KalturaTimeWarnerDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaTimeWarnerDistributionProviderFilter < KalturaTimeWarnerDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaTimeWarnerDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaTimeWarnerDistributionProfileFilter < KalturaTimeWarnerDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Time Warner Service
	class KalturaTimeWarnerService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# @return [file]
		def get_feed(distribution_profile_id, hash)
			kparams = {}
			client.add_param(kparams, 'distributionProfileId', distribution_profile_id)
			client.add_param(kparams, 'hash', hash)
			client.queue_service_action_call('timewarnerdistribution_timewarner', 'getFeed', 'file', kparams)
			return client.get_serve_url()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :time_warner_service
		def time_warner_service
			if (@time_warner_service == nil)
				@time_warner_service = KalturaTimeWarnerService.new(self)
			end
			return @time_warner_service
		end
		
	end

end
