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

	class KalturaFreewheelDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaFreewheelDistributionProviderOrderBy
	end

	class KalturaFreewheelDistributionAssetPath < KalturaDistributionJobProviderData
		attr_accessor :path


		def from_xml(xml_element)
			super
			if xml_element.elements['path'] != nil
				self.path = xml_element.elements['path'].text
			end
		end

	end

	class KalturaFreewheelDistributionJobProviderData < KalturaDistributionJobProviderData
		# Demonstrate passing array of paths to the job
		attr_accessor :video_asset_file_paths
		# Demonstrate passing single path to the job
		attr_accessor :thumb_asset_file_path


		def from_xml(xml_element)
			super
			if xml_element.elements['videoAssetFilePaths'] != nil
				self.video_asset_file_paths = KalturaClientBase.object_from_xml(xml_element.elements['videoAssetFilePaths'], 'KalturaFreewheelDistributionAssetPath')
			end
			if xml_element.elements['thumbAssetFilePath'] != nil
				self.thumb_asset_file_path = xml_element.elements['thumbAssetFilePath'].text
			end
		end

	end

	class KalturaFreewheelDistributionProfile < KalturaDistributionProfile
		attr_accessor :apikey
		attr_accessor :email
		attr_accessor :sftp_pass
		attr_accessor :sftp_login
		attr_accessor :account_id
		attr_accessor :metadata_profile_id

		def metadata_profile_id=(val)
			@metadata_profile_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['apikey'] != nil
				self.apikey = xml_element.elements['apikey'].text
			end
			if xml_element.elements['email'] != nil
				self.email = xml_element.elements['email'].text
			end
			if xml_element.elements['sftpPass'] != nil
				self.sftp_pass = xml_element.elements['sftpPass'].text
			end
			if xml_element.elements['sftpLogin'] != nil
				self.sftp_login = xml_element.elements['sftpLogin'].text
			end
			if xml_element.elements['accountId'] != nil
				self.account_id = xml_element.elements['accountId'].text
			end
			if xml_element.elements['metadataProfileId'] != nil
				self.metadata_profile_id = xml_element.elements['metadataProfileId'].text
			end
		end

	end

	class KalturaFreewheelDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFreewheelDistributionProfileBaseFilter < KalturaDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFreewheelDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFreewheelDistributionProfileFilter < KalturaFreewheelDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFreewheelDistributionProviderFilter < KalturaFreewheelDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
