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
require File.dirname(__FILE__) + '/kaltura_cue_point_client_plugin.rb'

module Kaltura

	class KalturaEventCuePointOrderBy
		CREATED_AT_ASC = "+createdAt"
		INT_ID_ASC = "+intId"
		PARTNER_SORT_VALUE_ASC = "+partnerSortValue"
		START_TIME_ASC = "+startTime"
		TRIGGERED_AT_ASC = "+triggeredAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		INT_ID_DESC = "-intId"
		PARTNER_SORT_VALUE_DESC = "-partnerSortValue"
		START_TIME_DESC = "-startTime"
		TRIGGERED_AT_DESC = "-triggeredAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaEventType
		BROADCAST_START = "1"
		BROADCAST_END = "2"
	end

	class KalturaEventCuePoint < KalturaCuePoint
		attr_accessor :event_type


		def from_xml(xml_element)
			super
			if xml_element.elements['eventType'] != nil
				self.event_type = xml_element.elements['eventType'].text
			end
		end

	end

	class KalturaEventCuePointBaseFilter < KalturaCuePointFilter
		attr_accessor :event_type_equal
		attr_accessor :event_type_in


		def from_xml(xml_element)
			super
			if xml_element.elements['eventTypeEqual'] != nil
				self.event_type_equal = xml_element.elements['eventTypeEqual'].text
			end
			if xml_element.elements['eventTypeIn'] != nil
				self.event_type_in = xml_element.elements['eventTypeIn'].text
			end
		end

	end

	class KalturaEventCuePointFilter < KalturaEventCuePointBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
