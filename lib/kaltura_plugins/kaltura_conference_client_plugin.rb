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

module Kaltura

	class KalturaConferenceRoomStatus
		CREATED = 1
		READY = 2
		ENDED = 3
	end

	class KalturaConferenceServerNodeOrderBy
		CREATED_AT_ASC = "+createdAt"
		HEARTBEAT_TIME_ASC = "+heartbeatTime"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		HEARTBEAT_TIME_DESC = "-heartbeatTime"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaRoomDetails < KalturaObjectBase
		attr_accessor :server_url
		attr_accessor :entry_id
		attr_accessor :token
		attr_accessor :expiry
		attr_accessor :server_name

		def expiry=(val)
			@expiry = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['serverUrl'] != nil
				self.server_url = xml_element.elements['serverUrl'].text
			end
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['token'] != nil
				self.token = xml_element.elements['token'].text
			end
			if xml_element.elements['expiry'] != nil
				self.expiry = xml_element.elements['expiry'].text
			end
			if xml_element.elements['serverName'] != nil
				self.server_name = xml_element.elements['serverName'].text
			end
		end

	end

	class KalturaConferenceEntryServerNode < KalturaEntryServerNode
		attr_accessor :conf_room_status
		attr_accessor :registered

		def conf_room_status=(val)
			@conf_room_status = val.to_i
		end
		def registered=(val)
			@registered = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['confRoomStatus'] != nil
				self.conf_room_status = xml_element.elements['confRoomStatus'].text
			end
			if xml_element.elements['registered'] != nil
				self.registered = xml_element.elements['registered'].text
			end
		end

	end

	class KalturaConferenceServerNode < KalturaServerNode
		attr_accessor :service_base_url


		def from_xml(xml_element)
			super
			if xml_element.elements['serviceBaseUrl'] != nil
				self.service_base_url = xml_element.elements['serviceBaseUrl'].text
			end
		end

	end

	class KalturaConferenceEntryServerNodeBaseFilter < KalturaEntryServerNodeFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaConferenceServerNodeBaseFilter < KalturaServerNodeFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaConferenceEntryServerNodeFilter < KalturaConferenceEntryServerNodeBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaConferenceServerNodeFilter < KalturaConferenceServerNodeBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
