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

	class KalturaYahooDistributionProcessFeedActionStatus
		MANUAL = 0
		AUTOMATIC = 1
	end

	class KalturaYahooDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaYahooDistributionProviderOrderBy
	end

	class KalturaYahooDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaYahooDistributionJobProviderData < KalturaConfigurableDistributionJobProviderData
		attr_accessor :small_thumb_path
		attr_accessor :large_thumb_path
		attr_accessor :video_asset_file_path


		def from_xml(xml_element)
			super
			if xml_element.elements['smallThumbPath'] != nil
				self.small_thumb_path = xml_element.elements['smallThumbPath'].text
			end
			if xml_element.elements['largeThumbPath'] != nil
				self.large_thumb_path = xml_element.elements['largeThumbPath'].text
			end
			if xml_element.elements['videoAssetFilePath'] != nil
				self.video_asset_file_path = xml_element.elements['videoAssetFilePath'].text
			end
		end

	end

	class KalturaYahooDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :ftp_path
		attr_accessor :ftp_username
		attr_accessor :ftp_password
		attr_accessor :ftp_host
		attr_accessor :contact_telephone
		attr_accessor :contact_email
		attr_accessor :process_feed

		def process_feed=(val)
			@process_feed = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['ftpPath'] != nil
				self.ftp_path = xml_element.elements['ftpPath'].text
			end
			if xml_element.elements['ftpUsername'] != nil
				self.ftp_username = xml_element.elements['ftpUsername'].text
			end
			if xml_element.elements['ftpPassword'] != nil
				self.ftp_password = xml_element.elements['ftpPassword'].text
			end
			if xml_element.elements['ftpHost'] != nil
				self.ftp_host = xml_element.elements['ftpHost'].text
			end
			if xml_element.elements['contactTelephone'] != nil
				self.contact_telephone = xml_element.elements['contactTelephone'].text
			end
			if xml_element.elements['contactEmail'] != nil
				self.contact_email = xml_element.elements['contactEmail'].text
			end
			if xml_element.elements['processFeed'] != nil
				self.process_feed = xml_element.elements['processFeed'].text
			end
		end

	end

	class KalturaYahooDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaYahooDistributionProviderFilter < KalturaYahooDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaYahooDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaYahooDistributionProfileFilter < KalturaYahooDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
