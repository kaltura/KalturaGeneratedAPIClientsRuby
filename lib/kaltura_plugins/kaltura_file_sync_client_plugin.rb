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

module Kaltura

	class KalturaFileSyncStatus
		ERROR = -1
		PENDING = 1
		READY = 2
		DELETED = 3
		PURGED = 4
	end

	class KalturaFileSyncType
		FILE = 1
		LINK = 2
		URL = 3
	end

	class KalturaFileSyncOrderBy
		CREATED_AT_ASC = "+createdAt"
		FILE_SIZE_ASC = "+fileSize"
		READY_AT_ASC = "+readyAt"
		SYNC_TIME_ASC = "+syncTime"
		UPDATED_AT_ASC = "+updatedAt"
		VERSION_ASC = "+version"
		CREATED_AT_DESC = "-createdAt"
		FILE_SIZE_DESC = "-fileSize"
		READY_AT_DESC = "-readyAt"
		SYNC_TIME_DESC = "-syncTime"
		UPDATED_AT_DESC = "-updatedAt"
		VERSION_DESC = "-version"
	end

	class KalturaFileSync < KalturaObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :file_object_type
		attr_accessor :object_id
		attr_accessor :version
		attr_accessor :object_sub_type
		attr_accessor :dc
		attr_accessor :original
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :ready_at
		attr_accessor :sync_time
		attr_accessor :status
		attr_accessor :file_type
		attr_accessor :linked_id
		attr_accessor :link_count
		attr_accessor :file_root
		attr_accessor :file_path
		attr_accessor :file_size
		attr_accessor :file_url
		attr_accessor :file_content
		attr_accessor :file_disc_size
		attr_accessor :is_current_dc
		attr_accessor :is_dir
		attr_accessor :original_id

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def object_sub_type=(val)
			@object_sub_type = val.to_i
		end
		def original=(val)
			@original = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def ready_at=(val)
			@ready_at = val.to_i
		end
		def sync_time=(val)
			@sync_time = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def file_type=(val)
			@file_type = val.to_i
		end
		def linked_id=(val)
			@linked_id = val.to_i
		end
		def link_count=(val)
			@link_count = val.to_i
		end
		def file_size=(val)
			@file_size = val.to_f
		end
		def file_disc_size=(val)
			@file_disc_size = val.to_f
		end
		def is_current_dc=(val)
			@is_current_dc = to_b(val)
		end
		def is_dir=(val)
			@is_dir = to_b(val)
		end
		def original_id=(val)
			@original_id = val.to_i
		end

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.file_object_type = xml_element.elements['fileObjectType'].text
			self.object_id = xml_element.elements['objectId'].text
			self.version = xml_element.elements['version'].text
			self.object_sub_type = xml_element.elements['objectSubType'].text
			self.dc = xml_element.elements['dc'].text
			self.original = xml_element.elements['original'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.ready_at = xml_element.elements['readyAt'].text
			self.sync_time = xml_element.elements['syncTime'].text
			self.status = xml_element.elements['status'].text
			self.file_type = xml_element.elements['fileType'].text
			self.linked_id = xml_element.elements['linkedId'].text
			self.link_count = xml_element.elements['linkCount'].text
			self.file_root = xml_element.elements['fileRoot'].text
			self.file_path = xml_element.elements['filePath'].text
			self.file_size = xml_element.elements['fileSize'].text
			self.file_url = xml_element.elements['fileUrl'].text
			self.file_content = xml_element.elements['fileContent'].text
			self.file_disc_size = xml_element.elements['fileDiscSize'].text
			self.is_current_dc = xml_element.elements['isCurrentDc'].text
			self.is_dir = xml_element.elements['isDir'].text
			self.original_id = xml_element.elements['originalId'].text
		end

	end

	class KalturaFileSyncBaseFilter < KalturaFilter
		attr_accessor :partner_id_equal
		attr_accessor :file_object_type_equal
		attr_accessor :file_object_type_in
		attr_accessor :object_id_equal
		attr_accessor :object_id_in
		attr_accessor :version_equal
		attr_accessor :version_in
		attr_accessor :object_sub_type_equal
		attr_accessor :object_sub_type_in
		attr_accessor :dc_equal
		attr_accessor :dc_in
		attr_accessor :original_equal
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :ready_at_greater_than_or_equal
		attr_accessor :ready_at_less_than_or_equal
		attr_accessor :sync_time_greater_than_or_equal
		attr_accessor :sync_time_less_than_or_equal
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :file_type_equal
		attr_accessor :file_type_in
		attr_accessor :linked_id_equal
		attr_accessor :link_count_greater_than_or_equal
		attr_accessor :link_count_less_than_or_equal
		attr_accessor :file_size_greater_than_or_equal
		attr_accessor :file_size_less_than_or_equal

		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
		end
		def object_sub_type_equal=(val)
			@object_sub_type_equal = val.to_i
		end
		def original_equal=(val)
			@original_equal = val.to_i
		end
		def created_at_greater_than_or_equal=(val)
			@created_at_greater_than_or_equal = val.to_i
		end
		def created_at_less_than_or_equal=(val)
			@created_at_less_than_or_equal = val.to_i
		end
		def updated_at_greater_than_or_equal=(val)
			@updated_at_greater_than_or_equal = val.to_i
		end
		def updated_at_less_than_or_equal=(val)
			@updated_at_less_than_or_equal = val.to_i
		end
		def ready_at_greater_than_or_equal=(val)
			@ready_at_greater_than_or_equal = val.to_i
		end
		def ready_at_less_than_or_equal=(val)
			@ready_at_less_than_or_equal = val.to_i
		end
		def sync_time_greater_than_or_equal=(val)
			@sync_time_greater_than_or_equal = val.to_i
		end
		def sync_time_less_than_or_equal=(val)
			@sync_time_less_than_or_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end
		def file_type_equal=(val)
			@file_type_equal = val.to_i
		end
		def linked_id_equal=(val)
			@linked_id_equal = val.to_i
		end
		def link_count_greater_than_or_equal=(val)
			@link_count_greater_than_or_equal = val.to_i
		end
		def link_count_less_than_or_equal=(val)
			@link_count_less_than_or_equal = val.to_i
		end
		def file_size_greater_than_or_equal=(val)
			@file_size_greater_than_or_equal = val.to_f
		end
		def file_size_less_than_or_equal=(val)
			@file_size_less_than_or_equal = val.to_f
		end

		def from_xml(xml_element)
			super
			self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			self.file_object_type_equal = xml_element.elements['fileObjectTypeEqual'].text
			self.file_object_type_in = xml_element.elements['fileObjectTypeIn'].text
			self.object_id_equal = xml_element.elements['objectIdEqual'].text
			self.object_id_in = xml_element.elements['objectIdIn'].text
			self.version_equal = xml_element.elements['versionEqual'].text
			self.version_in = xml_element.elements['versionIn'].text
			self.object_sub_type_equal = xml_element.elements['objectSubTypeEqual'].text
			self.object_sub_type_in = xml_element.elements['objectSubTypeIn'].text
			self.dc_equal = xml_element.elements['dcEqual'].text
			self.dc_in = xml_element.elements['dcIn'].text
			self.original_equal = xml_element.elements['originalEqual'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.ready_at_greater_than_or_equal = xml_element.elements['readyAtGreaterThanOrEqual'].text
			self.ready_at_less_than_or_equal = xml_element.elements['readyAtLessThanOrEqual'].text
			self.sync_time_greater_than_or_equal = xml_element.elements['syncTimeGreaterThanOrEqual'].text
			self.sync_time_less_than_or_equal = xml_element.elements['syncTimeLessThanOrEqual'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.file_type_equal = xml_element.elements['fileTypeEqual'].text
			self.file_type_in = xml_element.elements['fileTypeIn'].text
			self.linked_id_equal = xml_element.elements['linkedIdEqual'].text
			self.link_count_greater_than_or_equal = xml_element.elements['linkCountGreaterThanOrEqual'].text
			self.link_count_less_than_or_equal = xml_element.elements['linkCountLessThanOrEqual'].text
			self.file_size_greater_than_or_equal = xml_element.elements['fileSizeGreaterThanOrEqual'].text
			self.file_size_less_than_or_equal = xml_element.elements['fileSizeLessThanOrEqual'].text
		end

	end

	class KalturaFileSyncListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaFileSync')
		end

	end

	class KalturaFileSyncFilter < KalturaFileSyncBaseFilter
		attr_accessor :current_dc

		def current_dc=(val)
			@current_dc = val.to_i
		end

		def from_xml(xml_element)
			super
			self.current_dc = xml_element.elements['currentDc'].text
		end

	end


end
