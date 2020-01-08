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
# Copyright (C) 2006-2020  Kaltura Inc.
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

module Kaltura

	class KalturaConfMapsStatus
		STATUS_DISABLED = 0
		STATUS_ENABLED = 1
	end

	class KalturaConfMaps < KalturaObjectBase
		# Name of the map
		attr_accessor :name
		# Ini file content
		attr_accessor :content
		attr_accessor :raw_data
		attr_accessor :user_id
		# IsEditable - true / false
		attr_accessor :is_editable
		# Time of the last update
		attr_accessor :created_at
		# Regex that represent the host/s that this map affect
		attr_accessor :related_host
		attr_accessor :version
		attr_accessor :source_location
		attr_accessor :remarks
		# map status
		attr_accessor :status

		def is_editable=(val)
			@is_editable = to_b(val)
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def version=(val)
			@version = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['content'] != nil
				self.content = xml_element.elements['content'].text
			end
			if xml_element.elements['rawData'] != nil
				self.raw_data = xml_element.elements['rawData'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['isEditable'] != nil
				self.is_editable = xml_element.elements['isEditable'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['relatedHost'] != nil
				self.related_host = xml_element.elements['relatedHost'].text
			end
			if xml_element.elements['version'] != nil
				self.version = xml_element.elements['version'].text
			end
			if xml_element.elements['sourceLocation'] != nil
				self.source_location = xml_element.elements['sourceLocation'].text
			end
			if xml_element.elements['remarks'] != nil
				self.remarks = xml_element.elements['remarks'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
		end

	end

	class KalturaConfMapsListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaConfMaps')
			end
		end

	end

	class KalturaConfMapsBaseFilter < KalturaRelatedFilter
		attr_accessor :name_equal
		attr_accessor :related_host_equal
		attr_accessor :version_equal

		def version_equal=(val)
			@version_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['nameEqual'] != nil
				self.name_equal = xml_element.elements['nameEqual'].text
			end
			if xml_element.elements['relatedHostEqual'] != nil
				self.related_host_equal = xml_element.elements['relatedHostEqual'].text
			end
			if xml_element.elements['versionEqual'] != nil
				self.version_equal = xml_element.elements['versionEqual'].text
			end
		end

	end

	class KalturaConfMapsFilter < KalturaConfMapsBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	class KalturaClient < KalturaClientBase
	end

end
