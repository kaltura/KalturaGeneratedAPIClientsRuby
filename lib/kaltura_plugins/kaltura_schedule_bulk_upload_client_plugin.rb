# ===================================================================================================
#                           _  __     _ _
#                          | |/ /__ _| | |_ _  _ _ _ __ _
#                          | ' </ _` | |  _| || | '_/ _` |
#                          |_|\_\__,_|_|\__|\_,_|_| \__,_|
#
# This file is part of the Kaltura Collaborative Media Suite which allows users
# to do with audio, video, and animation what Wiki platforms allow them to do with
# text.
#
# Copyright (C) 2006-2023  Kaltura Inc.
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
require File.dirname(__FILE__) + '/kaltura_bulk_upload_csv_client_plugin.rb'
require File.dirname(__FILE__) + '/kaltura_schedule_client_plugin.rb'

module Kaltura

	class KalturaBulkUploadResultScheduleEvent < KalturaBulkUploadResult
		attr_accessor :reference_id
		attr_accessor :template_entry_id
		attr_accessor :event_type
		attr_accessor :title
		attr_accessor :description
		attr_accessor :tags
		attr_accessor :category_ids
		# ID of the resource specified for the new event.
		attr_accessor :resource_id
		attr_accessor :start_time
		attr_accessor :duration
		attr_accessor :end_time
		attr_accessor :recurrence
		attr_accessor :co_editors
		attr_accessor :co_publishers
		attr_accessor :event_organizer_id
		attr_accessor :content_owner_id
		attr_accessor :template_entry_type

		def event_type=(val)
			@event_type = val.to_i
		end
		def start_time=(val)
			@start_time = val.to_i
		end
		def duration=(val)
			@duration = val.to_i
		end
		def end_time=(val)
			@end_time = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['referenceId'] != nil
				self.reference_id = xml_element.elements['referenceId'].text
			end
			if xml_element.elements['templateEntryId'] != nil
				self.template_entry_id = xml_element.elements['templateEntryId'].text
			end
			if xml_element.elements['eventType'] != nil
				self.event_type = xml_element.elements['eventType'].text
			end
			if xml_element.elements['title'] != nil
				self.title = xml_element.elements['title'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['categoryIds'] != nil
				self.category_ids = xml_element.elements['categoryIds'].text
			end
			if xml_element.elements['resourceId'] != nil
				self.resource_id = xml_element.elements['resourceId'].text
			end
			if xml_element.elements['startTime'] != nil
				self.start_time = xml_element.elements['startTime'].text
			end
			if xml_element.elements['duration'] != nil
				self.duration = xml_element.elements['duration'].text
			end
			if xml_element.elements['endTime'] != nil
				self.end_time = xml_element.elements['endTime'].text
			end
			if xml_element.elements['recurrence'] != nil
				self.recurrence = xml_element.elements['recurrence'].text
			end
			if xml_element.elements['coEditors'] != nil
				self.co_editors = xml_element.elements['coEditors'].text
			end
			if xml_element.elements['coPublishers'] != nil
				self.co_publishers = xml_element.elements['coPublishers'].text
			end
			if xml_element.elements['eventOrganizerId'] != nil
				self.event_organizer_id = xml_element.elements['eventOrganizerId'].text
			end
			if xml_element.elements['contentOwnerId'] != nil
				self.content_owner_id = xml_element.elements['contentOwnerId'].text
			end
			if xml_element.elements['templateEntryType'] != nil
				self.template_entry_type = xml_element.elements['templateEntryType'].text
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

	# Represents the abstract Bulk upload job data for general bulk upload
	class KalturaBulkUploadScheduleEventJobData < KalturaBulkUploadJobData


		def from_xml(xml_element)
			super
		end

	end

	# Represents the Bulk upload job data for iCal bulk upload
	class KalturaBulkUploadICalJobData < KalturaBulkUploadScheduleEventJobData
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

	# Represents the Bulk upload job data for CSV bulk upload
	class KalturaBulkUploadScheduleEventCsvJobData < KalturaBulkUploadScheduleEventJobData
		# The version of the csv file
		attr_accessor :csv_version
		# Array containing CSV headers
		attr_accessor :columns

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
		end

	end


end
