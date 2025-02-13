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

	class KalturaUverseDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaUverseDistributionProviderOrderBy
	end

	class KalturaUverseDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUverseDistributionJobProviderData < KalturaConfigurableDistributionJobProviderData
		# The local file path of the video asset that needs to be distributed
		attr_accessor :local_asset_file_path
		# The remote URL of the video asset that was distributed
		attr_accessor :remote_asset_url
		# The file name of the remote video asset that was distributed
		attr_accessor :remote_asset_file_name


		def from_xml(xml_element)
			super
			if xml_element.elements['localAssetFilePath'] != nil
				self.local_asset_file_path = xml_element.elements['localAssetFilePath'].text
			end
			if xml_element.elements['remoteAssetUrl'] != nil
				self.remote_asset_url = xml_element.elements['remoteAssetUrl'].text
			end
			if xml_element.elements['remoteAssetFileName'] != nil
				self.remote_asset_file_name = xml_element.elements['remoteAssetFileName'].text
			end
		end

	end

	class KalturaUverseDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :feed_url
		attr_accessor :channel_title
		attr_accessor :channel_link
		attr_accessor :channel_description
		attr_accessor :channel_language
		attr_accessor :channel_copyright
		attr_accessor :channel_image_title
		attr_accessor :channel_image_url
		attr_accessor :channel_image_link
		attr_accessor :ftp_host
		attr_accessor :ftp_login
		attr_accessor :ftp_password


		def from_xml(xml_element)
			super
			if xml_element.elements['feedUrl'] != nil
				self.feed_url = xml_element.elements['feedUrl'].text
			end
			if xml_element.elements['channelTitle'] != nil
				self.channel_title = xml_element.elements['channelTitle'].text
			end
			if xml_element.elements['channelLink'] != nil
				self.channel_link = xml_element.elements['channelLink'].text
			end
			if xml_element.elements['channelDescription'] != nil
				self.channel_description = xml_element.elements['channelDescription'].text
			end
			if xml_element.elements['channelLanguage'] != nil
				self.channel_language = xml_element.elements['channelLanguage'].text
			end
			if xml_element.elements['channelCopyright'] != nil
				self.channel_copyright = xml_element.elements['channelCopyright'].text
			end
			if xml_element.elements['channelImageTitle'] != nil
				self.channel_image_title = xml_element.elements['channelImageTitle'].text
			end
			if xml_element.elements['channelImageUrl'] != nil
				self.channel_image_url = xml_element.elements['channelImageUrl'].text
			end
			if xml_element.elements['channelImageLink'] != nil
				self.channel_image_link = xml_element.elements['channelImageLink'].text
			end
			if xml_element.elements['ftpHost'] != nil
				self.ftp_host = xml_element.elements['ftpHost'].text
			end
			if xml_element.elements['ftpLogin'] != nil
				self.ftp_login = xml_element.elements['ftpLogin'].text
			end
			if xml_element.elements['ftpPassword'] != nil
				self.ftp_password = xml_element.elements['ftpPassword'].text
			end
		end

	end

	class KalturaUverseDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUverseDistributionProviderFilter < KalturaUverseDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUverseDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUverseDistributionProfileFilter < KalturaUverseDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Uverse Service
	class KalturaUverseService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# @return [file]
		def get_feed(distribution_profile_id, hash)
			kparams = {}
			client.add_param(kparams, 'distributionProfileId', distribution_profile_id)
			client.add_param(kparams, 'hash', hash)
			client.queue_service_action_call('uversedistribution_uverse', 'getFeed', 'file', kparams)
			return client.get_serve_url()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :uverse_service
		def uverse_service
			if (@uverse_service == nil)
				@uverse_service = KalturaUverseService.new(self)
			end
			return @uverse_service
		end
		
	end

end
