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

	class KalturaFtpDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaFtpDistributionProviderOrderBy
	end

	class KalturaFtpScheduledDistributionProviderOrderBy
	end

	class KalturaFtpDistributionFile < KalturaObjectBase
		attr_accessor :asset_id
		attr_accessor :filename
		attr_accessor :contents
		attr_accessor :local_file_path
		attr_accessor :version
		attr_accessor :hash


		def from_xml(xml_element)
			super
			if xml_element.elements['assetId'] != nil
				self.asset_id = xml_element.elements['assetId'].text
			end
			if xml_element.elements['filename'] != nil
				self.filename = xml_element.elements['filename'].text
			end
			if xml_element.elements['contents'] != nil
				self.contents = xml_element.elements['contents'].text
			end
			if xml_element.elements['localFilePath'] != nil
				self.local_file_path = xml_element.elements['localFilePath'].text
			end
			if xml_element.elements['version'] != nil
				self.version = xml_element.elements['version'].text
			end
			if xml_element.elements['hash'] != nil
				self.hash = xml_element.elements['hash'].text
			end
		end

	end

	class KalturaFtpDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFtpDistributionJobProviderData < KalturaConfigurableDistributionJobProviderData
		attr_accessor :files_for_distribution


		def from_xml(xml_element)
			super
			if xml_element.elements['filesForDistribution'] != nil
				self.files_for_distribution = KalturaClientBase.object_from_xml(xml_element.elements['filesForDistribution'], 'KalturaFtpDistributionFile')
			end
		end

	end

	class KalturaFtpDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :protocol
		attr_accessor :host
		attr_accessor :port
		attr_accessor :base_path
		attr_accessor :username
		attr_accessor :password
		attr_accessor :passphrase
		attr_accessor :sftp_public_key
		attr_accessor :sftp_private_key
		attr_accessor :disable_metadata
		attr_accessor :metadata_xslt
		attr_accessor :metadata_filename_xslt
		attr_accessor :flavor_asset_filename_xslt
		attr_accessor :thumbnail_asset_filename_xslt
		attr_accessor :asset_filename_xslt
		attr_accessor :aspera_public_key
		attr_accessor :aspera_private_key
		attr_accessor :send_metadata_after_assets

		def protocol=(val)
			@protocol = val.to_i
		end
		def port=(val)
			@port = val.to_i
		end
		def disable_metadata=(val)
			@disable_metadata = to_b(val)
		end
		def send_metadata_after_assets=(val)
			@send_metadata_after_assets = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['protocol'] != nil
				self.protocol = xml_element.elements['protocol'].text
			end
			if xml_element.elements['host'] != nil
				self.host = xml_element.elements['host'].text
			end
			if xml_element.elements['port'] != nil
				self.port = xml_element.elements['port'].text
			end
			if xml_element.elements['basePath'] != nil
				self.base_path = xml_element.elements['basePath'].text
			end
			if xml_element.elements['username'] != nil
				self.username = xml_element.elements['username'].text
			end
			if xml_element.elements['password'] != nil
				self.password = xml_element.elements['password'].text
			end
			if xml_element.elements['passphrase'] != nil
				self.passphrase = xml_element.elements['passphrase'].text
			end
			if xml_element.elements['sftpPublicKey'] != nil
				self.sftp_public_key = xml_element.elements['sftpPublicKey'].text
			end
			if xml_element.elements['sftpPrivateKey'] != nil
				self.sftp_private_key = xml_element.elements['sftpPrivateKey'].text
			end
			if xml_element.elements['disableMetadata'] != nil
				self.disable_metadata = xml_element.elements['disableMetadata'].text
			end
			if xml_element.elements['metadataXslt'] != nil
				self.metadata_xslt = xml_element.elements['metadataXslt'].text
			end
			if xml_element.elements['metadataFilenameXslt'] != nil
				self.metadata_filename_xslt = xml_element.elements['metadataFilenameXslt'].text
			end
			if xml_element.elements['flavorAssetFilenameXslt'] != nil
				self.flavor_asset_filename_xslt = xml_element.elements['flavorAssetFilenameXslt'].text
			end
			if xml_element.elements['thumbnailAssetFilenameXslt'] != nil
				self.thumbnail_asset_filename_xslt = xml_element.elements['thumbnailAssetFilenameXslt'].text
			end
			if xml_element.elements['assetFilenameXslt'] != nil
				self.asset_filename_xslt = xml_element.elements['assetFilenameXslt'].text
			end
			if xml_element.elements['asperaPublicKey'] != nil
				self.aspera_public_key = xml_element.elements['asperaPublicKey'].text
			end
			if xml_element.elements['asperaPrivateKey'] != nil
				self.aspera_private_key = xml_element.elements['asperaPrivateKey'].text
			end
			if xml_element.elements['sendMetadataAfterAssets'] != nil
				self.send_metadata_after_assets = xml_element.elements['sendMetadataAfterAssets'].text
			end
		end

	end

	class KalturaFtpScheduledDistributionProvider < KalturaFtpDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFtpDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFtpDistributionProviderFilter < KalturaFtpDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFtpDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFtpScheduledDistributionProviderBaseFilter < KalturaFtpDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFtpDistributionProfileFilter < KalturaFtpDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFtpScheduledDistributionProviderFilter < KalturaFtpScheduledDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
