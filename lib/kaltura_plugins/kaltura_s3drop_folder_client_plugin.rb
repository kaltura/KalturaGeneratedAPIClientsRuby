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

module Kaltura

	class KalturaS3DropFolder < KalturaDropFolder
		attr_accessor :s3host
		attr_accessor :s3region
		attr_accessor :s3user_id
		attr_accessor :s3password


		def from_xml(xml_element)
			super
			if xml_element.elements['s3Host'] != nil
				self.s3host = xml_element.elements['s3Host'].text
			end
			if xml_element.elements['s3Region'] != nil
				self.s3region = xml_element.elements['s3Region'].text
			end
			if xml_element.elements['s3UserId'] != nil
				self.s3user_id = xml_element.elements['s3UserId'].text
			end
			if xml_element.elements['s3Password'] != nil
				self.s3password = xml_element.elements['s3Password'].text
			end
		end

	end

	class KalturaS3DropFolderFile < KalturaDropFolderFile


		def from_xml(xml_element)
			super
		end

	end


end
