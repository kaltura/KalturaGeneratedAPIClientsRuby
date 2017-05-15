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
require File.dirname(__FILE__) + '/kaltura_cue_point_client_plugin.rb'

module Kaltura

	class KalturaFreewheelGenericDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaFreewheelGenericDistributionProviderOrderBy
	end

	class KalturaFreewheelGenericDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFreewheelGenericDistributionJobProviderData < KalturaConfigurableDistributionJobProviderData
		# Demonstrate passing array of paths to the job
		attr_accessor :video_asset_file_paths
		# Demonstrate passing single path to the job
		attr_accessor :thumb_asset_file_path
		attr_accessor :cue_points


		def from_xml(xml_element)
			super
			if xml_element.elements['videoAssetFilePaths'] != nil
				self.video_asset_file_paths = KalturaClientBase.object_from_xml(xml_element.elements['videoAssetFilePaths'], 'KalturaString')
			end
			if xml_element.elements['thumbAssetFilePath'] != nil
				self.thumb_asset_file_path = xml_element.elements['thumbAssetFilePath'].text
			end
			if xml_element.elements['cuePoints'] != nil
				self.cue_points = KalturaClientBase.object_from_xml(xml_element.elements['cuePoints'], 'KalturaCuePoint')
			end
		end

	end

	class KalturaFreewheelGenericDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :apikey
		attr_accessor :email
		attr_accessor :sftp_pass
		attr_accessor :sftp_login
		attr_accessor :content_owner
		attr_accessor :upstream_video_id
		attr_accessor :upstream_network_name
		attr_accessor :upstream_network_id
		attr_accessor :category_id
		attr_accessor :replace_group
		attr_accessor :replace_air_dates

		def replace_group=(val)
			@replace_group = to_b(val)
		end
		def replace_air_dates=(val)
			@replace_air_dates = to_b(val)
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
			if xml_element.elements['contentOwner'] != nil
				self.content_owner = xml_element.elements['contentOwner'].text
			end
			if xml_element.elements['upstreamVideoId'] != nil
				self.upstream_video_id = xml_element.elements['upstreamVideoId'].text
			end
			if xml_element.elements['upstreamNetworkName'] != nil
				self.upstream_network_name = xml_element.elements['upstreamNetworkName'].text
			end
			if xml_element.elements['upstreamNetworkId'] != nil
				self.upstream_network_id = xml_element.elements['upstreamNetworkId'].text
			end
			if xml_element.elements['categoryId'] != nil
				self.category_id = xml_element.elements['categoryId'].text
			end
			if xml_element.elements['replaceGroup'] != nil
				self.replace_group = xml_element.elements['replaceGroup'].text
			end
			if xml_element.elements['replaceAirDates'] != nil
				self.replace_air_dates = xml_element.elements['replaceAirDates'].text
			end
		end

	end

	class KalturaFreewheelGenericDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFreewheelGenericDistributionProviderFilter < KalturaFreewheelGenericDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFreewheelGenericDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFreewheelGenericDistributionProfileFilter < KalturaFreewheelGenericDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
