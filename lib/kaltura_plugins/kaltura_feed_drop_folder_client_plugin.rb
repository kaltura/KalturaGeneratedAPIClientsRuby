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
require File.dirname(__FILE__) + '/kaltura_drop_folder_client_plugin.rb'

module Kaltura

	class KalturaFeedItemInfo < KalturaObjectBase
		attr_accessor :item_xpath
		attr_accessor :item_publish_date_xpath
		attr_accessor :item_unique_identifier_xpath
		attr_accessor :item_content_file_size_xpath
		attr_accessor :item_content_url_xpath
		attr_accessor :item_content_bitrate_xpath
		attr_accessor :item_hash_xpath
		attr_accessor :item_content_xpath
		attr_accessor :content_bitrate_attribute_name


		def from_xml(xml_element)
			super
			if xml_element.elements['itemXPath'] != nil
				self.item_xpath = xml_element.elements['itemXPath'].text
			end
			if xml_element.elements['itemPublishDateXPath'] != nil
				self.item_publish_date_xpath = xml_element.elements['itemPublishDateXPath'].text
			end
			if xml_element.elements['itemUniqueIdentifierXPath'] != nil
				self.item_unique_identifier_xpath = xml_element.elements['itemUniqueIdentifierXPath'].text
			end
			if xml_element.elements['itemContentFileSizeXPath'] != nil
				self.item_content_file_size_xpath = xml_element.elements['itemContentFileSizeXPath'].text
			end
			if xml_element.elements['itemContentUrlXPath'] != nil
				self.item_content_url_xpath = xml_element.elements['itemContentUrlXPath'].text
			end
			if xml_element.elements['itemContentBitrateXPath'] != nil
				self.item_content_bitrate_xpath = xml_element.elements['itemContentBitrateXPath'].text
			end
			if xml_element.elements['itemHashXPath'] != nil
				self.item_hash_xpath = xml_element.elements['itemHashXPath'].text
			end
			if xml_element.elements['itemContentXpath'] != nil
				self.item_content_xpath = xml_element.elements['itemContentXpath'].text
			end
			if xml_element.elements['contentBitrateAttributeName'] != nil
				self.content_bitrate_attribute_name = xml_element.elements['contentBitrateAttributeName'].text
			end
		end

	end

	class KalturaFeedDropFolder < KalturaDropFolder
		attr_accessor :item_handling_limit
		attr_accessor :feed_item_info

		def item_handling_limit=(val)
			@item_handling_limit = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['itemHandlingLimit'] != nil
				self.item_handling_limit = xml_element.elements['itemHandlingLimit'].text
			end
			if xml_element.elements['feedItemInfo'] != nil
				self.feed_item_info = KalturaClientBase.object_from_xml(xml_element.elements['feedItemInfo'], 'KalturaFeedItemInfo')
			end
		end

	end

	class KalturaFeedDropFolderFile < KalturaDropFolderFile
		# MD5 or Sha1 encrypted string
		attr_accessor :hash
		# Path of the original Feed content XML
		attr_accessor :feed_xml_path


		def from_xml(xml_element)
			super
			if xml_element.elements['hash'] != nil
				self.hash = xml_element.elements['hash'].text
			end
			if xml_element.elements['feedXmlPath'] != nil
				self.feed_xml_path = xml_element.elements['feedXmlPath'].text
			end
		end

	end


end
