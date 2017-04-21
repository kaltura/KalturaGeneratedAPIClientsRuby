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
require File.dirname(__FILE__) + '/kaltura_integration_client_plugin.rb'
require File.dirname(__FILE__) + '/kaltura_transcript_client_plugin.rb'

module Kaltura

	class KalturaCielo24Fidelity
		MECHANICAL = "MECHANICAL"
		PREMIUM = "PREMIUM"
		PROFESSIONAL = "PROFESSIONAL"
	end

	class KalturaCielo24Priority
		PRIORITY = "PRIORITY"
		STANDARD = "STANDARD"
	end

	class KalturaCielo24JobProviderData < KalturaIntegrationJobProviderData
		# Entry ID
		attr_accessor :entry_id
		# Flavor ID
		attr_accessor :flavor_asset_id
		# Caption formats
		attr_accessor :caption_asset_formats
		attr_accessor :priority
		attr_accessor :fidelity
		# Api key for service provider
		attr_accessor :username
		# Api key for service provider
		attr_accessor :password
		# Base url for service provider
		attr_accessor :base_url
		# Transcript content language
		attr_accessor :spoken_language
		# should replace remote media content
		attr_accessor :replace_media_content
		# additional parameters to send to Cielo24
		attr_accessor :additional_parameters

		def replace_media_content=(val)
			@replace_media_content = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['flavorAssetId'] != nil
				self.flavor_asset_id = xml_element.elements['flavorAssetId'].text
			end
			if xml_element.elements['captionAssetFormats'] != nil
				self.caption_asset_formats = xml_element.elements['captionAssetFormats'].text
			end
			if xml_element.elements['priority'] != nil
				self.priority = xml_element.elements['priority'].text
			end
			if xml_element.elements['fidelity'] != nil
				self.fidelity = xml_element.elements['fidelity'].text
			end
			if xml_element.elements['username'] != nil
				self.username = xml_element.elements['username'].text
			end
			if xml_element.elements['password'] != nil
				self.password = xml_element.elements['password'].text
			end
			if xml_element.elements['baseUrl'] != nil
				self.base_url = xml_element.elements['baseUrl'].text
			end
			if xml_element.elements['spokenLanguage'] != nil
				self.spoken_language = xml_element.elements['spokenLanguage'].text
			end
			if xml_element.elements['replaceMediaContent'] != nil
				self.replace_media_content = xml_element.elements['replaceMediaContent'].text
			end
			if xml_element.elements['additionalParameters'] != nil
				self.additional_parameters = xml_element.elements['additionalParameters'].text
			end
		end

	end


end
