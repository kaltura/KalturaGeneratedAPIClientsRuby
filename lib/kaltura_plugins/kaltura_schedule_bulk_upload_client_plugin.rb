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
require File.dirname(__FILE__) + '/kaltura_bulk_upload_client_plugin.rb'
require File.dirname(__FILE__) + '/kaltura_schedule_client_plugin.rb'

module Kaltura

	class KalturaBulkUploadResultScheduleEvent < KalturaBulkUploadResult
		attr_accessor :reference_id


		def from_xml(xml_element)
			super
			if xml_element.elements['referenceId'] != nil
				self.reference_id = xml_element.elements['referenceId'].text
			end
		end

	end

	class KalturaBulkUploadResultScheduleResource < KalturaBulkUploadResult
		attr_accessor :resource_id
		attr_accessor :name
		attr_accessor :type
		attr_accessor :system_name
		attr_accessor :description
		attr_accessor :tags
		attr_accessor :parent_type
		attr_accessor :parent_system_name


		def from_xml(xml_element)
			super
			if xml_element.elements['resourceId'] != nil
				self.resource_id = xml_element.elements['resourceId'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['systemName'] != nil
				self.system_name = xml_element.elements['systemName'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['parentType'] != nil
				self.parent_type = xml_element.elements['parentType'].text
			end
			if xml_element.elements['parentSystemName'] != nil
				self.parent_system_name = xml_element.elements['parentSystemName'].text
			end
		end

	end

	# Represents the Bulk upload job data for iCal bulk upload
	class KalturaBulkUploadICalJobData < KalturaBulkUploadJobData
		# The type of the events that ill be created by this upload
		attr_accessor :events_type

		def events_type=(val)
			@events_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['eventsType'] != nil
				self.events_type = xml_element.elements['eventsType'].text
			end
		end

	end


end
