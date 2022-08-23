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
# Copyright (C) 2006-2022  Kaltura Inc.
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
require File.dirname(__FILE__) + '/kaltura_file_sync_client_plugin.rb'

module Kaltura

	class KalturaTrackEntryEventType
		UPLOADED_FILE = 1
		WEBCAM_COMPLETED = 2
		IMPORT_STARTED = 3
		ADD_ENTRY = 4
		UPDATE_ENTRY = 5
		DELETED_ENTRY = 6
	end

	class KalturaUiConfAdminOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		NAME_ASC = "+name"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		NAME_DESC = "-name"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaTrackEntry < KalturaObjectBase
		attr_accessor :id
		attr_accessor :track_event_type
		attr_accessor :ps_version
		attr_accessor :context
		attr_accessor :partner_id
		attr_accessor :entry_id
		attr_accessor :host_name
		attr_accessor :user_id
		attr_accessor :changed_properties
		attr_accessor :param_str1
		attr_accessor :param_str2
		attr_accessor :param_str3
		attr_accessor :ks
		attr_accessor :description
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :user_ip
		attr_accessor :session_id

		def id=(val)
			@id = val.to_i
		end
		def track_event_type=(val)
			@track_event_type = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def session_id=(val)
			@session_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['trackEventType'] != nil
				self.track_event_type = xml_element.elements['trackEventType'].text
			end
			if xml_element.elements['psVersion'] != nil
				self.ps_version = xml_element.elements['psVersion'].text
			end
			if xml_element.elements['context'] != nil
				self.context = xml_element.elements['context'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['hostName'] != nil
				self.host_name = xml_element.elements['hostName'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['changedProperties'] != nil
				self.changed_properties = xml_element.elements['changedProperties'].text
			end
			if xml_element.elements['paramStr1'] != nil
				self.param_str1 = xml_element.elements['paramStr1'].text
			end
			if xml_element.elements['paramStr2'] != nil
				self.param_str2 = xml_element.elements['paramStr2'].text
			end
			if xml_element.elements['paramStr3'] != nil
				self.param_str3 = xml_element.elements['paramStr3'].text
			end
			if xml_element.elements['ks'] != nil
				self.ks = xml_element.elements['ks'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['userIp'] != nil
				self.user_ip = xml_element.elements['userIp'].text
			end
			if xml_element.elements['sessionId'] != nil
				self.session_id = xml_element.elements['sessionId'].text
			end
		end

	end

	class KalturaUiConfAdmin < KalturaUiConf
		attr_accessor :is_public

		def is_public=(val)
			@is_public = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['isPublic'] != nil
				self.is_public = xml_element.elements['isPublic'].text
			end
		end

	end

	class KalturaTrackEntryListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaTrackEntry')
			end
		end

	end

	class KalturaUiConfAdminListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaUiConfAdmin')
			end
		end

	end

	class KalturaUiConfAdminBaseFilter < KalturaUiConfFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUiConfAdminFilter < KalturaUiConfAdminBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	class KalturaClient < KalturaClientBase
	end

end
