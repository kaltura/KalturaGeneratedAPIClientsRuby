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

module Kaltura

	class KalturaSipSourceType
		PICTURE_IN_PICTURE = 1
		TALKING_HEADS = 2
		SCREEN_SHARE = 3
	end

	class KalturaSipServerNodeOrderBy
		CREATED_AT_ASC = "+createdAt"
		HEARTBEAT_TIME_ASC = "+heartbeatTime"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		HEARTBEAT_TIME_DESC = "-heartbeatTime"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaSipEntryServerNode < KalturaEntryServerNode
		attr_accessor :sip_room_id
		attr_accessor :sip_primary_adp_id
		attr_accessor :sip_secondary_adp_id


		def from_xml(xml_element)
			super
			if xml_element.elements['sipRoomId'] != nil
				self.sip_room_id = xml_element.elements['sipRoomId'].text
			end
			if xml_element.elements['sipPrimaryAdpId'] != nil
				self.sip_primary_adp_id = xml_element.elements['sipPrimaryAdpId'].text
			end
			if xml_element.elements['sipSecondaryAdpId'] != nil
				self.sip_secondary_adp_id = xml_element.elements['sipSecondaryAdpId'].text
			end
		end

	end

	class KalturaSipServerNode < KalturaServerNode


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSipEntryServerNodeBaseFilter < KalturaEntryServerNodeFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSipServerNodeBaseFilter < KalturaServerNodeFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSipEntryServerNodeFilter < KalturaSipEntryServerNodeBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSipServerNodeFilter < KalturaSipServerNodeBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	class KalturaPexipService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# @return [string]
		def generate_sip_url(entry_id, regenerate=false, source_type=1)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'regenerate', regenerate)
			client.add_param(kparams, 'sourceType', source_type)
			client.queue_service_action_call('sip_pexip', 'generateSipUrl', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return []
		def handle_incoming_call()
			kparams = {}
			client.queue_service_action_call('sip_pexip', 'handleIncomingCall', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return [array]
		def list_rooms(offset=0, page_size=500, active_only=false)
			kparams = {}
			client.add_param(kparams, 'offset', offset)
			client.add_param(kparams, 'pageSize', page_size)
			client.add_param(kparams, 'activeOnly', active_only)
			client.queue_service_action_call('sip_pexip', 'listRooms', 'KalturaStringValue', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :pexip_service
		def pexip_service
			if (@pexip_service == nil)
				@pexip_service = KalturaPexipService.new(self)
			end
			return @pexip_service
		end
		
	end

end
