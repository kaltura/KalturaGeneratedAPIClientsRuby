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

	class KalturaQuickPlayDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaQuickPlayDistributionProviderOrderBy
	end

	class KalturaQuickPlayDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaQuickPlayDistributionJobProviderData < KalturaConfigurableDistributionJobProviderData
		attr_accessor :xml
		attr_accessor :video_file_paths
		attr_accessor :thumbnail_file_paths


		def from_xml(xml_element)
			super
			if xml_element.elements['xml'] != nil
				self.xml = xml_element.elements['xml'].text
			end
			if xml_element.elements['videoFilePaths'] != nil
				self.video_file_paths = KalturaClientBase.object_from_xml(xml_element.elements['videoFilePaths'], 'KalturaString')
			end
			if xml_element.elements['thumbnailFilePaths'] != nil
				self.thumbnail_file_paths = KalturaClientBase.object_from_xml(xml_element.elements['thumbnailFilePaths'], 'KalturaString')
			end
		end

	end

	class KalturaQuickPlayDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :sftp_host
		attr_accessor :sftp_login
		attr_accessor :sftp_pass
		attr_accessor :sftp_base_path
		attr_accessor :channel_title
		attr_accessor :channel_link
		attr_accessor :channel_description
		attr_accessor :channel_managing_editor
		attr_accessor :channel_language
		attr_accessor :channel_image_title
		attr_accessor :channel_image_width
		attr_accessor :channel_image_height
		attr_accessor :channel_image_link
		attr_accessor :channel_image_url
		attr_accessor :channel_copyright
		attr_accessor :channel_generator
		attr_accessor :channel_rating


		def from_xml(xml_element)
			super
			if xml_element.elements['sftpHost'] != nil
				self.sftp_host = xml_element.elements['sftpHost'].text
			end
			if xml_element.elements['sftpLogin'] != nil
				self.sftp_login = xml_element.elements['sftpLogin'].text
			end
			if xml_element.elements['sftpPass'] != nil
				self.sftp_pass = xml_element.elements['sftpPass'].text
			end
			if xml_element.elements['sftpBasePath'] != nil
				self.sftp_base_path = xml_element.elements['sftpBasePath'].text
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
			if xml_element.elements['channelManagingEditor'] != nil
				self.channel_managing_editor = xml_element.elements['channelManagingEditor'].text
			end
			if xml_element.elements['channelLanguage'] != nil
				self.channel_language = xml_element.elements['channelLanguage'].text
			end
			if xml_element.elements['channelImageTitle'] != nil
				self.channel_image_title = xml_element.elements['channelImageTitle'].text
			end
			if xml_element.elements['channelImageWidth'] != nil
				self.channel_image_width = xml_element.elements['channelImageWidth'].text
			end
			if xml_element.elements['channelImageHeight'] != nil
				self.channel_image_height = xml_element.elements['channelImageHeight'].text
			end
			if xml_element.elements['channelImageLink'] != nil
				self.channel_image_link = xml_element.elements['channelImageLink'].text
			end
			if xml_element.elements['channelImageUrl'] != nil
				self.channel_image_url = xml_element.elements['channelImageUrl'].text
			end
			if xml_element.elements['channelCopyright'] != nil
				self.channel_copyright = xml_element.elements['channelCopyright'].text
			end
			if xml_element.elements['channelGenerator'] != nil
				self.channel_generator = xml_element.elements['channelGenerator'].text
			end
			if xml_element.elements['channelRating'] != nil
				self.channel_rating = xml_element.elements['channelRating'].text
			end
		end

	end

	class KalturaQuickPlayDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaQuickPlayDistributionProviderFilter < KalturaQuickPlayDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaQuickPlayDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaQuickPlayDistributionProfileFilter < KalturaQuickPlayDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
