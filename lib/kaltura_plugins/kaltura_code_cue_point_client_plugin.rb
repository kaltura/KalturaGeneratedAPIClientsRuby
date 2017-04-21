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

	class KalturaCodeCuePointOrderBy
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

	class KalturaCodeCuePoint < KalturaCuePoint
		attr_accessor :code
		attr_accessor :description
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
			if xml_element.elements['code'] != nil
				self.code = xml_element.elements['code'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['endTime'] != nil
				self.end_time = xml_element.elements['endTime'].text
			end
			if xml_element.elements['duration'] != nil
				self.duration = xml_element.elements['duration'].text
			end
		end

	end

	class KalturaCodeCuePointBaseFilter < KalturaCuePointFilter
		attr_accessor :code_like
		attr_accessor :code_multi_like_or
		attr_accessor :code_multi_like_and
		attr_accessor :code_equal
		attr_accessor :code_in
		attr_accessor :description_like
		attr_accessor :description_multi_like_or
		attr_accessor :description_multi_like_and
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
			if xml_element.elements['codeLike'] != nil
				self.code_like = xml_element.elements['codeLike'].text
			end
			if xml_element.elements['codeMultiLikeOr'] != nil
				self.code_multi_like_or = xml_element.elements['codeMultiLikeOr'].text
			end
			if xml_element.elements['codeMultiLikeAnd'] != nil
				self.code_multi_like_and = xml_element.elements['codeMultiLikeAnd'].text
			end
			if xml_element.elements['codeEqual'] != nil
				self.code_equal = xml_element.elements['codeEqual'].text
			end
			if xml_element.elements['codeIn'] != nil
				self.code_in = xml_element.elements['codeIn'].text
			end
			if xml_element.elements['descriptionLike'] != nil
				self.description_like = xml_element.elements['descriptionLike'].text
			end
			if xml_element.elements['descriptionMultiLikeOr'] != nil
				self.description_multi_like_or = xml_element.elements['descriptionMultiLikeOr'].text
			end
			if xml_element.elements['descriptionMultiLikeAnd'] != nil
				self.description_multi_like_and = xml_element.elements['descriptionMultiLikeAnd'].text
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

	class KalturaCodeCuePointFilter < KalturaCodeCuePointBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
