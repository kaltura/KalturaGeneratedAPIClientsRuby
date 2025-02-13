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
require File.dirname(__FILE__) + '/kaltura_bulk_upload_client_plugin.rb'

module Kaltura

	class KalturaBulkUploadCsvVersion
		V1 = 1
		V2 = 2
		V3 = 3
	end

	# Represents the Bulk upload job data for xml bulk upload
	class KalturaBulkUploadCsvJobData < KalturaBulkUploadJobData
		# The version of the csv file
		attr_accessor :csv_version
		# Array containing CSV headers
		attr_accessor :columns
		# The object in process
		attr_accessor :process_object_id
		# The type of the object in process
		attr_accessor :process_object_type

		def csv_version=(val)
			@csv_version = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['csvVersion'] != nil
				self.csv_version = xml_element.elements['csvVersion'].text
			end
			if xml_element.elements['columns'] != nil
				self.columns = KalturaClientBase.object_from_xml(xml_element.elements['columns'], 'KalturaString')
			end
			if xml_element.elements['processObjectId'] != nil
				self.process_object_id = xml_element.elements['processObjectId'].text
			end
			if xml_element.elements['processObjectType'] != nil
				self.process_object_type = xml_element.elements['processObjectType'].text
			end
		end

	end


end
