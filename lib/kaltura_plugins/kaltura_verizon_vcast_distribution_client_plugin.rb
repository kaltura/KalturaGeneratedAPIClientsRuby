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

	class KalturaVerizonVcastDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaVerizonVcastDistributionProviderOrderBy
	end

	class KalturaVerizonVcastDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaVerizonVcastDistributionJobProviderData < KalturaConfigurableDistributionJobProviderData
		attr_accessor :xml


		def from_xml(xml_element)
			super
			if xml_element.elements['xml'] != nil
				self.xml = xml_element.elements['xml'].text
			end
		end

	end

	class KalturaVerizonVcastDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :ftp_host
		attr_accessor :ftp_login
		attr_accessor :ftp_pass
		attr_accessor :provider_name
		attr_accessor :provider_id
		attr_accessor :entitlement
		attr_accessor :priority
		attr_accessor :allow_streaming
		attr_accessor :streaming_price_code
		attr_accessor :allow_download
		attr_accessor :download_price_code


		def from_xml(xml_element)
			super
			if xml_element.elements['ftpHost'] != nil
				self.ftp_host = xml_element.elements['ftpHost'].text
			end
			if xml_element.elements['ftpLogin'] != nil
				self.ftp_login = xml_element.elements['ftpLogin'].text
			end
			if xml_element.elements['ftpPass'] != nil
				self.ftp_pass = xml_element.elements['ftpPass'].text
			end
			if xml_element.elements['providerName'] != nil
				self.provider_name = xml_element.elements['providerName'].text
			end
			if xml_element.elements['providerId'] != nil
				self.provider_id = xml_element.elements['providerId'].text
			end
			if xml_element.elements['entitlement'] != nil
				self.entitlement = xml_element.elements['entitlement'].text
			end
			if xml_element.elements['priority'] != nil
				self.priority = xml_element.elements['priority'].text
			end
			if xml_element.elements['allowStreaming'] != nil
				self.allow_streaming = xml_element.elements['allowStreaming'].text
			end
			if xml_element.elements['streamingPriceCode'] != nil
				self.streaming_price_code = xml_element.elements['streamingPriceCode'].text
			end
			if xml_element.elements['allowDownload'] != nil
				self.allow_download = xml_element.elements['allowDownload'].text
			end
			if xml_element.elements['downloadPriceCode'] != nil
				self.download_price_code = xml_element.elements['downloadPriceCode'].text
			end
		end

	end

	class KalturaVerizonVcastDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaVerizonVcastDistributionProviderFilter < KalturaVerizonVcastDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaVerizonVcastDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaVerizonVcastDistributionProfileFilter < KalturaVerizonVcastDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
