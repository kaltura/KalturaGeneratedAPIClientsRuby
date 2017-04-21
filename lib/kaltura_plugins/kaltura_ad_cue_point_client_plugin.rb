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
require File.dirname(__FILE__) + '/kaltura_cue_point_client_plugin.rb'

module Kaltura

	class KalturaAdCuePointOrderBy
		CREATED_AT_ASC = "+createdAt"
		DURATION_ASC = "+duration"
		END_TIME_ASC = "+endTime"
		PARTNER_SORT_VALUE_ASC = "+partnerSortValue"
		START_TIME_ASC = "+startTime"
		TRIGGERED_AT_ASC = "+triggeredAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		DURATION_DESC = "-duration"
		END_TIME_DESC = "-endTime"
		PARTNER_SORT_VALUE_DESC = "-partnerSortValue"
		START_TIME_DESC = "-startTime"
		TRIGGERED_AT_DESC = "-triggeredAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaAdProtocolType
		CUSTOM = "0"
		VAST = "1"
		VAST_2_0 = "2"
		VPAID = "3"
	end

	class KalturaAdType
		VIDEO = "1"
		OVERLAY = "2"
	end

	class KalturaAdCuePoint < KalturaCuePoint
		attr_accessor :protocol_type
		attr_accessor :source_url
		attr_accessor :ad_type
		attr_accessor :title
		attr_accessor :end_time
		# Duration in milliseconds
		attr_accessor :duration

		def end_time=(val)
			@end_time = val.to_i
		end
		def duration=(val)
			@duration = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['protocolType'] != nil
				self.protocol_type = xml_element.elements['protocolType'].text
			end
			if xml_element.elements['sourceUrl'] != nil
				self.source_url = xml_element.elements['sourceUrl'].text
			end
			if xml_element.elements['adType'] != nil
				self.ad_type = xml_element.elements['adType'].text
			end
			if xml_element.elements['title'] != nil
				self.title = xml_element.elements['title'].text
			end
			if xml_element.elements['endTime'] != nil
				self.end_time = xml_element.elements['endTime'].text
			end
			if xml_element.elements['duration'] != nil
				self.duration = xml_element.elements['duration'].text
			end
		end

	end

	class KalturaAdCuePointBaseFilter < KalturaCuePointFilter
		attr_accessor :protocol_type_equal
		attr_accessor :protocol_type_in
		attr_accessor :title_like
		attr_accessor :title_multi_like_or
		attr_accessor :title_multi_like_and
		attr_accessor :end_time_greater_than_or_equal
		attr_accessor :end_time_less_than_or_equal
		attr_accessor :duration_greater_than_or_equal
		attr_accessor :duration_less_than_or_equal

		def end_time_greater_than_or_equal=(val)
			@end_time_greater_than_or_equal = val.to_i
		end
		def end_time_less_than_or_equal=(val)
			@end_time_less_than_or_equal = val.to_i
		end
		def duration_greater_than_or_equal=(val)
			@duration_greater_than_or_equal = val.to_i
		end
		def duration_less_than_or_equal=(val)
			@duration_less_than_or_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['protocolTypeEqual'] != nil
				self.protocol_type_equal = xml_element.elements['protocolTypeEqual'].text
			end
			if xml_element.elements['protocolTypeIn'] != nil
				self.protocol_type_in = xml_element.elements['protocolTypeIn'].text
			end
			if xml_element.elements['titleLike'] != nil
				self.title_like = xml_element.elements['titleLike'].text
			end
			if xml_element.elements['titleMultiLikeOr'] != nil
				self.title_multi_like_or = xml_element.elements['titleMultiLikeOr'].text
			end
			if xml_element.elements['titleMultiLikeAnd'] != nil
				self.title_multi_like_and = xml_element.elements['titleMultiLikeAnd'].text
			end
			if xml_element.elements['endTimeGreaterThanOrEqual'] != nil
				self.end_time_greater_than_or_equal = xml_element.elements['endTimeGreaterThanOrEqual'].text
			end
			if xml_element.elements['endTimeLessThanOrEqual'] != nil
				self.end_time_less_than_or_equal = xml_element.elements['endTimeLessThanOrEqual'].text
			end
			if xml_element.elements['durationGreaterThanOrEqual'] != nil
				self.duration_greater_than_or_equal = xml_element.elements['durationGreaterThanOrEqual'].text
			end
			if xml_element.elements['durationLessThanOrEqual'] != nil
				self.duration_less_than_or_equal = xml_element.elements['durationLessThanOrEqual'].text
			end
		end

	end

	class KalturaAdCuePointFilter < KalturaAdCuePointBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
