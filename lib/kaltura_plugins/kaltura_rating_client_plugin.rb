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


	# Allows user to manipulate their entry rating
	class KalturaRatingService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# @return [int]
		def check_rating(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('rating_rating', 'checkRating', 'int', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return [KalturaRatingCountListResponse]
		def get_rating_counts(filter)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('rating_rating', 'getRatingCounts', 'KalturaRatingCountListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return [int]
		def rate(entry_id, rank)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'rank', rank)
			client.queue_service_action_call('rating_rating', 'rate', 'int', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return [bool]
		def remove_rating(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('rating_rating', 'removeRating', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :rating_service
		def rating_service
			if (@rating_service == nil)
				@rating_service = KalturaRatingService.new(self)
			end
			return @rating_service
		end
		
	end

end
