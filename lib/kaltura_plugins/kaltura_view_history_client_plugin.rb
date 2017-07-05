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

	class KalturaViewHistoryUserEntry < KalturaUserEntry
		# Playback context
		attr_accessor :playback_context
		# Last playback time reached by user
		attr_accessor :last_time_reached
		attr_accessor :last_update_time

		def last_time_reached=(val)
			@last_time_reached = val.to_i
		end
		def last_update_time=(val)
			@last_update_time = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['playbackContext'] != nil
				self.playback_context = xml_element.elements['playbackContext'].text
			end
			if xml_element.elements['lastTimeReached'] != nil
				self.last_time_reached = xml_element.elements['lastTimeReached'].text
			end
			if xml_element.elements['lastUpdateTime'] != nil
				self.last_update_time = xml_element.elements['lastUpdateTime'].text
			end
		end

	end

	class KalturaViewHistoryUserEntryAdvancedFilter < KalturaSearchItem
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :user_id_equal
		attr_accessor :user_id_in
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :extended_status_equal
		attr_accessor :extended_status_in


		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['userIdEqual'] != nil
				self.user_id_equal = xml_element.elements['userIdEqual'].text
			end
			if xml_element.elements['userIdIn'] != nil
				self.user_id_in = xml_element.elements['userIdIn'].text
			end
			if xml_element.elements['updatedAtGreaterThanOrEqual'] != nil
				self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['updatedAtLessThanOrEqual'] != nil
				self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			end
			if xml_element.elements['extendedStatusEqual'] != nil
				self.extended_status_equal = xml_element.elements['extendedStatusEqual'].text
			end
			if xml_element.elements['extendedStatusIn'] != nil
				self.extended_status_in = xml_element.elements['extendedStatusIn'].text
			end
		end

	end

	class KalturaViewHistoryUserEntryFilter < KalturaUserEntryFilter


		def from_xml(xml_element)
			super
		end

	end


end
