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

	class KalturaRatingCountOrderBy
	end

	class KalturaRatingCount < KalturaObjectBase
		attr_accessor :entry_id
		attr_accessor :rank
		attr_accessor :count

		def rank=(val)
			@rank = val.to_i
		end
		def count=(val)
			@count = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['rank'] != nil
				self.rank = xml_element.elements['rank'].text
			end
			if xml_element.elements['count'] != nil
				self.count = xml_element.elements['count'].text
			end
		end

	end

	class KalturaRatingCountListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaRatingCount')
			end
		end

	end

	class KalturaRatingCountBaseFilter < KalturaRelatedFilter
		attr_accessor :entry_id_equal
		attr_accessor :rank_in


		def from_xml(xml_element)
			super
			if xml_element.elements['entryIdEqual'] != nil
				self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			end
			if xml_element.elements['rankIn'] != nil
				self.rank_in = xml_element.elements['rankIn'].text
			end
		end

	end

	class KalturaRatingCountFilter < KalturaRatingCountBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
