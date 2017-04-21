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

module Kaltura

	class KalturaWowzaMediaServerNodeOrderBy
		CREATED_AT_ASC = "+createdAt"
		HEARTBEAT_TIME_ASC = "+heartbeatTime"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		HEARTBEAT_TIME_DESC = "-heartbeatTime"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaWowzaMediaServerNode < KalturaMediaServerNode
		# Wowza Media server app prefix
		attr_accessor :app_prefix
		# Wowza Media server transcoder configuration overide
		attr_accessor :transcoder
		# Wowza Media server GPU index id
		attr_accessor :gpu_id
		# Live service port
		attr_accessor :live_service_port
		# Live service protocol
		attr_accessor :live_service_protocol
		# Wowza media server live service internal domain
		attr_accessor :live_service_internal_domain

		def gpu_id=(val)
			@gpu_id = val.to_i
		end
		def live_service_port=(val)
			@live_service_port = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['appPrefix'] != nil
				self.app_prefix = xml_element.elements['appPrefix'].text
			end
			if xml_element.elements['transcoder'] != nil
				self.transcoder = xml_element.elements['transcoder'].text
			end
			if xml_element.elements['GPUID'] != nil
				self.gpu_id = xml_element.elements['GPUID'].text
			end
			if xml_element.elements['liveServicePort'] != nil
				self.live_service_port = xml_element.elements['liveServicePort'].text
			end
			if xml_element.elements['liveServiceProtocol'] != nil
				self.live_service_protocol = xml_element.elements['liveServiceProtocol'].text
			end
			if xml_element.elements['liveServiceInternalDomain'] != nil
				self.live_service_internal_domain = xml_element.elements['liveServiceInternalDomain'].text
			end
		end

	end

	class KalturaWowzaMediaServerNodeBaseFilter < KalturaMediaServerNodeFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaWowzaMediaServerNodeFilter < KalturaWowzaMediaServerNodeBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	class KalturaClient < KalturaClientBase
	end

end
