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
require File.dirname(__FILE__) + '/kaltura_bulk_upload_xml_client_plugin.rb'

module Kaltura

	# Represents the Bulk service input for filter bulk upload
	class KalturaBulkServiceFilterDataBase < KalturaBulkServiceData
		# Filter for extracting the objects list to upload
		attr_accessor :filter


		def from_xml(xml_element)
			super
			if xml_element.elements['filter'] != nil
				self.filter = KalturaClientBase.object_from_xml(xml_element.elements['filter'], 'KalturaFilter')
			end
		end

	end

	class KalturaBulkUploadResultJob < KalturaBulkUploadResult
		# ID of object being processed by the job
		attr_accessor :job_object_id

		def job_object_id=(val)
			@job_object_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['jobObjectId'] != nil
				self.job_object_id = xml_element.elements['jobObjectId'].text
			end
		end

	end

	# Represents the Bulk service input for filter bulk upload
	class KalturaBulkServiceFilterData < KalturaBulkServiceFilterDataBase
		# Template object for new object creation
		attr_accessor :template_object


		def from_xml(xml_element)
			super
			if xml_element.elements['templateObject'] != nil
				self.template_object = KalturaClientBase.object_from_xml(xml_element.elements['templateObject'], 'KalturaObjectBase')
			end
		end

	end

	# Represents the Bulk upload job data for filter bulk upload
	class KalturaBulkUploadFilterJobData < KalturaBulkUploadJobData
		# Filter for extracting the objects list to upload
		attr_accessor :filter
		# Template object for new object creation
		attr_accessor :template_object


		def from_xml(xml_element)
			super
			if xml_element.elements['filter'] != nil
				self.filter = KalturaClientBase.object_from_xml(xml_element.elements['filter'], 'KalturaFilter')
			end
			if xml_element.elements['templateObject'] != nil
				self.template_object = KalturaClientBase.object_from_xml(xml_element.elements['templateObject'], 'KalturaObjectBase')
			end
		end

	end


end
