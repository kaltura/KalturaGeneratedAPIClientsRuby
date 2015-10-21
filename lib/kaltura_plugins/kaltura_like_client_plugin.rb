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
# Copyright (C) 2006-2015  Kaltura Inc.
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

	class KalturaLikeOrderBy
	end

	class KalturaLike < KalturaObjectBase
		# The id of the entry that the like belongs to
		# 	 
		attr_accessor :entry_id
		# The id of user that the like belongs to
		# 	 
		attr_accessor :user_id


		def from_xml(xml_element)
			super
			self.entry_id = xml_element.elements['entryId'].text
			self.user_id = xml_element.elements['userId'].text
		end

	end

	class KalturaLikeListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaLike')
		end

	end

	class KalturaLikeBaseFilter < KalturaRelatedFilter
		attr_accessor :entry_id_equal
		attr_accessor :user_id_equal


		def from_xml(xml_element)
			super
			self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			self.user_id_equal = xml_element.elements['userIdEqual'].text
		end

	end

	class KalturaLikeFilter < KalturaLikeBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Allows user to 'like' or 'unlike' and entry
	#  
	class KalturaLikeService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		def like(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('like_like', 'like', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def unlike(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('like_like', 'unlike', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def check_like_exists(entry_id, user_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'userId', user_id)
			client.queue_service_action_call('like_like', 'checkLikeExists', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('like_like', 'list', 'KalturaLikeListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :like_service
		def like_service
			if (@like_service == nil)
				@like_service = KalturaLikeService.new(self)
			end
			return @like_service
		end
		
	end

end
