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

	class KalturaMetroPcsDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaMetroPcsDistributionProviderOrderBy
	end

	class KalturaMetroPcsDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMetroPcsDistributionJobProviderData < KalturaConfigurableDistributionJobProviderData
		attr_accessor :asset_local_paths
		attr_accessor :thumb_urls


		def from_xml(xml_element)
			super
			if xml_element.elements['assetLocalPaths'] != nil
				self.asset_local_paths = xml_element.elements['assetLocalPaths'].text
			end
			if xml_element.elements['thumbUrls'] != nil
				self.thumb_urls = xml_element.elements['thumbUrls'].text
			end
		end

	end

	class KalturaMetroPcsDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :ftp_host
		attr_accessor :ftp_login
		attr_accessor :ftp_pass
		attr_accessor :ftp_path
		attr_accessor :provider_name
		attr_accessor :provider_id
		attr_accessor :copyright
		attr_accessor :entitlements
		attr_accessor :rating
		attr_accessor :item_type


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
			if xml_element.elements['ftpPath'] != nil
				self.ftp_path = xml_element.elements['ftpPath'].text
			end
			if xml_element.elements['providerName'] != nil
				self.provider_name = xml_element.elements['providerName'].text
			end
			if xml_element.elements['providerId'] != nil
				self.provider_id = xml_element.elements['providerId'].text
			end
			if xml_element.elements['copyright'] != nil
				self.copyright = xml_element.elements['copyright'].text
			end
			if xml_element.elements['entitlements'] != nil
				self.entitlements = xml_element.elements['entitlements'].text
			end
			if xml_element.elements['rating'] != nil
				self.rating = xml_element.elements['rating'].text
			end
			if xml_element.elements['itemType'] != nil
				self.item_type = xml_element.elements['itemType'].text
			end
		end

	end

	class KalturaMetroPcsDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMetroPcsDistributionProviderFilter < KalturaMetroPcsDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMetroPcsDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMetroPcsDistributionProfileFilter < KalturaMetroPcsDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
