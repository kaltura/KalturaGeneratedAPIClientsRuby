# ===================================================================================================
#                           _  __     _ _
#                          | |/ /__ _| | |_ _  _ _ _ __ _
#                          | ' </ _` | |  _| || | '_/ _` |
#                          |_|\_\__,_|_|\__|\_,_|_| \__,_|
#
# This file is part of the Kaltura Collaborative Media Suite which allows users
# to do with audio, video, and animation what Wiki platforms allow them to do with
# text.
#
# Copyright (C) 2006-2023  Kaltura Inc.
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
require File.dirname(__FILE__) + '/kaltura_drop_folder_client_plugin.rb'

module Kaltura

	class KalturaWebexDropFolderFileOrderBy
		CREATED_AT_ASC = "+createdAt"
		FILE_NAME_ASC = "+fileName"
		FILE_SIZE_ASC = "+fileSize"
		FILE_SIZE_LAST_SET_AT_ASC = "+fileSizeLastSetAt"
		ID_ASC = "+id"
		PARSED_FLAVOR_ASC = "+parsedFlavor"
		PARSED_SLUG_ASC = "+parsedSlug"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		FILE_NAME_DESC = "-fileName"
		FILE_SIZE_DESC = "-fileSize"
		FILE_SIZE_LAST_SET_AT_DESC = "-fileSizeLastSetAt"
		ID_DESC = "-id"
		PARSED_FLAVOR_DESC = "-parsedFlavor"
		PARSED_SLUG_DESC = "-parsedSlug"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaWebexDropFolderOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		NAME_ASC = "+name"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		NAME_DESC = "-name"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaWebexDropFolder < KalturaDropFolder
		attr_accessor :webex_user_id
		attr_accessor :webex_password
		attr_accessor :webex_site_id
		attr_accessor :webex_partner_id
		attr_accessor :webex_service_url
		attr_accessor :webex_host_id_metadata_field_name
		attr_accessor :delete_from_recycle_bin
		attr_accessor :webex_service_type
		attr_accessor :webex_site_name
		attr_accessor :delete_from_timestamp

		def webex_site_id=(val)
			@webex_site_id = val.to_i
		end
		def delete_from_recycle_bin=(val)
			@delete_from_recycle_bin = to_b(val)
		end
		def delete_from_timestamp=(val)
			@delete_from_timestamp = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['webexUserId'] != nil
				self.webex_user_id = xml_element.elements['webexUserId'].text
			end
			if xml_element.elements['webexPassword'] != nil
				self.webex_password = xml_element.elements['webexPassword'].text
			end
			if xml_element.elements['webexSiteId'] != nil
				self.webex_site_id = xml_element.elements['webexSiteId'].text
			end
			if xml_element.elements['webexPartnerId'] != nil
				self.webex_partner_id = xml_element.elements['webexPartnerId'].text
			end
			if xml_element.elements['webexServiceUrl'] != nil
				self.webex_service_url = xml_element.elements['webexServiceUrl'].text
			end
			if xml_element.elements['webexHostIdMetadataFieldName'] != nil
				self.webex_host_id_metadata_field_name = xml_element.elements['webexHostIdMetadataFieldName'].text
			end
			if xml_element.elements['deleteFromRecycleBin'] != nil
				self.delete_from_recycle_bin = xml_element.elements['deleteFromRecycleBin'].text
			end
			if xml_element.elements['webexServiceType'] != nil
				self.webex_service_type = xml_element.elements['webexServiceType'].text
			end
			if xml_element.elements['webexSiteName'] != nil
				self.webex_site_name = xml_element.elements['webexSiteName'].text
			end
			if xml_element.elements['deleteFromTimestamp'] != nil
				self.delete_from_timestamp = xml_element.elements['deleteFromTimestamp'].text
			end
		end

	end

	class KalturaWebexDropFolderFile < KalturaDropFolderFile
		attr_accessor :recording_id
		attr_accessor :webex_host_id
		attr_accessor :description
		attr_accessor :conf_id
		attr_accessor :content_url

		def recording_id=(val)
			@recording_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['recordingId'] != nil
				self.recording_id = xml_element.elements['recordingId'].text
			end
			if xml_element.elements['webexHostId'] != nil
				self.webex_host_id = xml_element.elements['webexHostId'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['confId'] != nil
				self.conf_id = xml_element.elements['confId'].text
			end
			if xml_element.elements['contentUrl'] != nil
				self.content_url = xml_element.elements['contentUrl'].text
			end
		end

	end

	class KalturaWebexDropFolderContentProcessorJobData < KalturaDropFolderContentProcessorJobData
		attr_accessor :description
		attr_accessor :webex_host_id


		def from_xml(xml_element)
			super
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['webexHostId'] != nil
				self.webex_host_id = xml_element.elements['webexHostId'].text
			end
		end

	end

	class KalturaWebexDropFolderBaseFilter < KalturaDropFolderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaWebexDropFolderFileBaseFilter < KalturaDropFolderFileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaWebexDropFolderFileFilter < KalturaWebexDropFolderFileBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaWebexDropFolderFilter < KalturaWebexDropFolderBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
