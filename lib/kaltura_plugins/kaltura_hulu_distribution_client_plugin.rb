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

	class KalturaHuluDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaHuluDistributionProviderOrderBy
	end

	class KalturaHuluDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaHuluDistributionJobProviderData < KalturaConfigurableDistributionJobProviderData
		attr_accessor :video_asset_file_path
		attr_accessor :thumb_asset_file_path
		attr_accessor :cue_points
		attr_accessor :file_base_name
		attr_accessor :caption_local_paths


		def from_xml(xml_element)
			super
			if xml_element.elements['videoAssetFilePath'] != nil
				self.video_asset_file_path = xml_element.elements['videoAssetFilePath'].text
			end
			if xml_element.elements['thumbAssetFilePath'] != nil
				self.thumb_asset_file_path = xml_element.elements['thumbAssetFilePath'].text
			end
			if xml_element.elements['cuePoints'] != nil
				self.cue_points = KalturaClientBase.object_from_xml(xml_element.elements['cuePoints'], 'KalturaCuePoint')
			end
			if xml_element.elements['fileBaseName'] != nil
				self.file_base_name = xml_element.elements['fileBaseName'].text
			end
			if xml_element.elements['captionLocalPaths'] != nil
				self.caption_local_paths = KalturaClientBase.object_from_xml(xml_element.elements['captionLocalPaths'], 'KalturaString')
			end
		end

	end

	class KalturaHuluDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :sftp_host
		attr_accessor :sftp_login
		attr_accessor :sftp_pass
		attr_accessor :series_channel
		attr_accessor :series_primary_category
		attr_accessor :series_additional_categories
		attr_accessor :season_number
		attr_accessor :season_synopsis
		attr_accessor :season_tune_in_information
		attr_accessor :video_media_type
		attr_accessor :disable_episode_number_custom_validation
		attr_accessor :protocol
		attr_accessor :aspera_host
		attr_accessor :aspera_login
		attr_accessor :aspera_pass
		attr_accessor :port
		attr_accessor :passphrase
		attr_accessor :aspera_public_key
		attr_accessor :aspera_private_key

		def disable_episode_number_custom_validation=(val)
			@disable_episode_number_custom_validation = to_b(val)
		end
		def protocol=(val)
			@protocol = val.to_i
		end
		def port=(val)
			@port = val.to_i
		end

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
			if xml_element.elements['seriesChannel'] != nil
				self.series_channel = xml_element.elements['seriesChannel'].text
			end
			if xml_element.elements['seriesPrimaryCategory'] != nil
				self.series_primary_category = xml_element.elements['seriesPrimaryCategory'].text
			end
			if xml_element.elements['seriesAdditionalCategories'] != nil
				self.series_additional_categories = KalturaClientBase.object_from_xml(xml_element.elements['seriesAdditionalCategories'], 'KalturaString')
			end
			if xml_element.elements['seasonNumber'] != nil
				self.season_number = xml_element.elements['seasonNumber'].text
			end
			if xml_element.elements['seasonSynopsis'] != nil
				self.season_synopsis = xml_element.elements['seasonSynopsis'].text
			end
			if xml_element.elements['seasonTuneInInformation'] != nil
				self.season_tune_in_information = xml_element.elements['seasonTuneInInformation'].text
			end
			if xml_element.elements['videoMediaType'] != nil
				self.video_media_type = xml_element.elements['videoMediaType'].text
			end
			if xml_element.elements['disableEpisodeNumberCustomValidation'] != nil
				self.disable_episode_number_custom_validation = xml_element.elements['disableEpisodeNumberCustomValidation'].text
			end
			if xml_element.elements['protocol'] != nil
				self.protocol = xml_element.elements['protocol'].text
			end
			if xml_element.elements['asperaHost'] != nil
				self.aspera_host = xml_element.elements['asperaHost'].text
			end
			if xml_element.elements['asperaLogin'] != nil
				self.aspera_login = xml_element.elements['asperaLogin'].text
			end
			if xml_element.elements['asperaPass'] != nil
				self.aspera_pass = xml_element.elements['asperaPass'].text
			end
			if xml_element.elements['port'] != nil
				self.port = xml_element.elements['port'].text
			end
			if xml_element.elements['passphrase'] != nil
				self.passphrase = xml_element.elements['passphrase'].text
			end
			if xml_element.elements['asperaPublicKey'] != nil
				self.aspera_public_key = xml_element.elements['asperaPublicKey'].text
			end
			if xml_element.elements['asperaPrivateKey'] != nil
				self.aspera_private_key = xml_element.elements['asperaPrivateKey'].text
			end
		end

	end

	class KalturaHuluDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaHuluDistributionProviderFilter < KalturaHuluDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaHuluDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaHuluDistributionProfileFilter < KalturaHuluDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
