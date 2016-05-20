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
# Copyright (C) 2006-2016  Kaltura Inc.
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
require File.dirname(__FILE__) + '/kaltura_integration_client_plugin.rb'

module Kaltura

	class KalturaVoicebaseJobProviderData < KalturaIntegrationJobProviderData
		# Entry ID
		attr_accessor :entry_id
		# Flavor ID
		attr_accessor :flavor_asset_id
		# input Transcript-asset ID
		attr_accessor :transcript_id
		# Caption formats
		attr_accessor :caption_asset_formats
		# Api key for service provider
		attr_accessor :api_key
		# Api key for service provider
		attr_accessor :api_password
		# Transcript content language
		attr_accessor :spoken_language
		# Transcript Content location
		attr_accessor :file_location
		# should replace remote media content
		attr_accessor :replace_media_content

		def replace_media_content=(val)
			@replace_media_content = to_b(val)
		end

		def from_xml(xml_element)
			super
			self.entry_id = xml_element.elements['entryId'].text
			self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			self.transcript_id = xml_element.elements['transcriptId'].text
			self.caption_asset_formats = xml_element.elements['captionAssetFormats'].text
			self.api_key = xml_element.elements['apiKey'].text
			self.api_password = xml_element.elements['apiPassword'].text
			self.spoken_language = xml_element.elements['spokenLanguage'].text
			self.file_location = xml_element.elements['fileLocation'].text
			self.replace_media_content = xml_element.elements['replaceMediaContent'].text
		end

	end


end
