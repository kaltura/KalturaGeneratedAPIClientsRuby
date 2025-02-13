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
# Copyright (C) 2006-2021  Kaltura Inc.
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

	class KalturaUverseClickToOrderDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaUverseClickToOrderDistributionProviderOrderBy
	end

	class KalturaUverseClickToOrderDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUverseClickToOrderDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :feed_url
		attr_accessor :background_image_wide
		attr_accessor :background_image_standard


		def from_xml(xml_element)
			super
			if xml_element.elements['feedUrl'] != nil
				self.feed_url = xml_element.elements['feedUrl'].text
			end
			if xml_element.elements['backgroundImageWide'] != nil
				self.background_image_wide = xml_element.elements['backgroundImageWide'].text
			end
			if xml_element.elements['backgroundImageStandard'] != nil
				self.background_image_standard = xml_element.elements['backgroundImageStandard'].text
			end
		end

	end

	class KalturaUverseClickToOrderDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUverseClickToOrderDistributionProviderFilter < KalturaUverseClickToOrderDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUverseClickToOrderDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUverseClickToOrderDistributionProfileFilter < KalturaUverseClickToOrderDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Uverse Click To Order Service
	class KalturaUverseClickToOrderService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# @return [file]
		def get_feed(distribution_profile_id, hash)
			kparams = {}
			client.add_param(kparams, 'distributionProfileId', distribution_profile_id)
			client.add_param(kparams, 'hash', hash)
			client.queue_service_action_call('uverseclicktoorderdistribution_uverseclicktoorder', 'getFeed', 'file', kparams)
			return client.get_serve_url()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :uverse_click_to_order_service
		def uverse_click_to_order_service
			if (@uverse_click_to_order_service == nil)
				@uverse_click_to_order_service = KalturaUverseClickToOrderService.new(self)
			end
			return @uverse_click_to_order_service
		end
		
	end

end
