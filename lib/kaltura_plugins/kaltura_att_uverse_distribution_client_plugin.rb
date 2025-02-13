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

	class KalturaAttUverseDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaAttUverseDistributionProviderOrderBy
	end

	class KalturaAttUverseDistributionFile < KalturaObjectBase
		attr_accessor :remote_filename
		attr_accessor :local_file_path
		attr_accessor :asset_type
		attr_accessor :asset_id


		def from_xml(xml_element)
			super
			if xml_element.elements['remoteFilename'] != nil
				self.remote_filename = xml_element.elements['remoteFilename'].text
			end
			if xml_element.elements['localFilePath'] != nil
				self.local_file_path = xml_element.elements['localFilePath'].text
			end
			if xml_element.elements['assetType'] != nil
				self.asset_type = xml_element.elements['assetType'].text
			end
			if xml_element.elements['assetId'] != nil
				self.asset_id = xml_element.elements['assetId'].text
			end
		end

	end

	class KalturaAttUverseDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAttUverseDistributionJobProviderData < KalturaConfigurableDistributionJobProviderData
		attr_accessor :files_for_distribution
		# The remote URL of the video asset that was distributed
		attr_accessor :remote_asset_file_urls
		# The remote URL of the thumbnail asset that was distributed
		attr_accessor :remote_thumbnail_file_urls
		# The remote URL of the caption asset that was distributed
		attr_accessor :remote_caption_file_urls


		def from_xml(xml_element)
			super
			if xml_element.elements['filesForDistribution'] != nil
				self.files_for_distribution = KalturaClientBase.object_from_xml(xml_element.elements['filesForDistribution'], 'KalturaAttUverseDistributionFile')
			end
			if xml_element.elements['remoteAssetFileUrls'] != nil
				self.remote_asset_file_urls = xml_element.elements['remoteAssetFileUrls'].text
			end
			if xml_element.elements['remoteThumbnailFileUrls'] != nil
				self.remote_thumbnail_file_urls = xml_element.elements['remoteThumbnailFileUrls'].text
			end
			if xml_element.elements['remoteCaptionFileUrls'] != nil
				self.remote_caption_file_urls = xml_element.elements['remoteCaptionFileUrls'].text
			end
		end

	end

	class KalturaAttUverseDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :feed_url
		attr_accessor :ftp_host
		attr_accessor :ftp_username
		attr_accessor :ftp_password
		attr_accessor :ftp_path
		attr_accessor :channel_title
		attr_accessor :flavor_asset_filename_xslt
		attr_accessor :thumbnail_asset_filename_xslt
		attr_accessor :asset_filename_xslt


		def from_xml(xml_element)
			super
			if xml_element.elements['feedUrl'] != nil
				self.feed_url = xml_element.elements['feedUrl'].text
			end
			if xml_element.elements['ftpHost'] != nil
				self.ftp_host = xml_element.elements['ftpHost'].text
			end
			if xml_element.elements['ftpUsername'] != nil
				self.ftp_username = xml_element.elements['ftpUsername'].text
			end
			if xml_element.elements['ftpPassword'] != nil
				self.ftp_password = xml_element.elements['ftpPassword'].text
			end
			if xml_element.elements['ftpPath'] != nil
				self.ftp_path = xml_element.elements['ftpPath'].text
			end
			if xml_element.elements['channelTitle'] != nil
				self.channel_title = xml_element.elements['channelTitle'].text
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
		end

	end

	class KalturaAttUverseDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAttUverseDistributionProviderFilter < KalturaAttUverseDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAttUverseDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAttUverseDistributionProfileFilter < KalturaAttUverseDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Att Uverse Service
	class KalturaAttUverseService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# @return [file]
		def get_feed(distribution_profile_id, hash)
			kparams = {}
			client.add_param(kparams, 'distributionProfileId', distribution_profile_id)
			client.add_param(kparams, 'hash', hash)
			client.queue_service_action_call('attuversedistribution_attuverse', 'getFeed', 'file', kparams)
			return client.get_serve_url()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :att_uverse_service
		def att_uverse_service
			if (@att_uverse_service == nil)
				@att_uverse_service = KalturaAttUverseService.new(self)
			end
			return @att_uverse_service
		end
		
	end

end
