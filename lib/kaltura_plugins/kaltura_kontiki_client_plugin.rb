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

module Kaltura

	class KalturaKontikiStorageProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaKontikiStorageProfile < KalturaStorageProfile
		attr_accessor :service_token


		def from_xml(xml_element)
			super
			if xml_element.elements['serviceToken'] != nil
				self.service_token = xml_element.elements['serviceToken'].text
			end
		end

	end

	class KalturaKontikiStorageDeleteJobData < KalturaStorageDeleteJobData
		# Unique Kontiki MOID for the content uploaded to Kontiki
		attr_accessor :content_moid
		attr_accessor :service_token


		def from_xml(xml_element)
			super
			if xml_element.elements['contentMoid'] != nil
				self.content_moid = xml_element.elements['contentMoid'].text
			end
			if xml_element.elements['serviceToken'] != nil
				self.service_token = xml_element.elements['serviceToken'].text
			end
		end

	end

	class KalturaKontikiStorageExportJobData < KalturaStorageExportJobData
		# Holds the id of the exported asset
		attr_accessor :flavor_asset_id
		# Unique Kontiki MOID for the content uploaded to Kontiki
		attr_accessor :content_moid
		attr_accessor :service_token


		def from_xml(xml_element)
			super
			if xml_element.elements['flavorAssetId'] != nil
				self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			end
			if xml_element.elements['contentMoid'] != nil
				self.content_moid = xml_element.elements['contentMoid'].text
			end
			if xml_element.elements['serviceToken'] != nil
				self.service_token = xml_element.elements['serviceToken'].text
			end
		end

	end

	class KalturaKontikiStorageProfileBaseFilter < KalturaStorageProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaKontikiStorageProfileFilter < KalturaKontikiStorageProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
