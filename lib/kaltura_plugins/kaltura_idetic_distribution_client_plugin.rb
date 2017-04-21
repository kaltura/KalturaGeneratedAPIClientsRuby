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

	class KalturaIdeticDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaIdeticDistributionProviderOrderBy
	end

	class KalturaIdeticDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaIdeticDistributionJobProviderData < KalturaConfigurableDistributionJobProviderData
		attr_accessor :thumbnail_url
		attr_accessor :flavor_asset_url


		def from_xml(xml_element)
			super
			if xml_element.elements['thumbnailUrl'] != nil
				self.thumbnail_url = xml_element.elements['thumbnailUrl'].text
			end
			if xml_element.elements['flavorAssetUrl'] != nil
				self.flavor_asset_url = xml_element.elements['flavorAssetUrl'].text
			end
		end

	end

	class KalturaIdeticDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :ftp_path
		attr_accessor :username
		attr_accessor :password
		attr_accessor :domain


		def from_xml(xml_element)
			super
			if xml_element.elements['ftpPath'] != nil
				self.ftp_path = xml_element.elements['ftpPath'].text
			end
			if xml_element.elements['username'] != nil
				self.username = xml_element.elements['username'].text
			end
			if xml_element.elements['password'] != nil
				self.password = xml_element.elements['password'].text
			end
			if xml_element.elements['domain'] != nil
				self.domain = xml_element.elements['domain'].text
			end
		end

	end

	class KalturaIdeticDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaIdeticDistributionProviderFilter < KalturaIdeticDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaIdeticDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaIdeticDistributionProfileFilter < KalturaIdeticDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
