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
require File.dirname(__FILE__) + '/kaltura_drop_folder_client_plugin.rb'
require File.dirname(__FILE__) + '/kaltura_feed_drop_folder_client_plugin.rb'

module Kaltura

	class KalturaApFeedDropFolder < KalturaFeedDropFolder
		attr_accessor :ap_api_key
		attr_accessor :items_to_expand


		def from_xml(xml_element)
			super
			if xml_element.elements['apApiKey'] != nil
				self.ap_api_key = xml_element.elements['apApiKey'].text
			end
			if xml_element.elements['itemsToExpand'] != nil
				self.items_to_expand = KalturaClientBase.object_from_xml(xml_element.elements['itemsToExpand'], 'KalturaStringValue')
			end
		end

	end


end
