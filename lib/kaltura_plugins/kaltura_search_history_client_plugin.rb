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
require File.dirname(__FILE__) + '/kaltura_elastic_search_client_plugin.rb'

module Kaltura

	class KalturaESearchHistory < KalturaObjectBase
		attr_accessor :search_term
		attr_accessor :searched_object
		attr_accessor :timestamp

		def timestamp=(val)
			@timestamp = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['searchTerm'] != nil
				self.search_term = xml_element.elements['searchTerm'].text
			end
			if xml_element.elements['searchedObject'] != nil
				self.searched_object = xml_element.elements['searchedObject'].text
			end
			if xml_element.elements['timestamp'] != nil
				self.timestamp = xml_element.elements['timestamp'].text
			end
		end

	end

	class KalturaESearchHistoryFilter < KalturaESearchBaseFilter
		attr_accessor :search_term_starts_with
		attr_accessor :searched_object_in


		def from_xml(xml_element)
			super
			if xml_element.elements['searchTermStartsWith'] != nil
				self.search_term_starts_with = xml_element.elements['searchTermStartsWith'].text
			end
			if xml_element.elements['searchedObjectIn'] != nil
				self.searched_object_in = xml_element.elements['searchedObjectIn'].text
			end
		end

	end

	class KalturaESearchHistoryListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaESearchHistory')
			end
		end

	end


	class KalturaSearchHistoryService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# @return []
		def delete(search_term)
			kparams = {}
			client.add_param(kparams, 'searchTerm', search_term)
			client.queue_service_action_call('searchhistory_searchhistory', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return [KalturaESearchHistoryListResponse]
		def list(filter=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('searchhistory_searchhistory', 'list', 'KalturaESearchHistoryListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :search_history_service
		def search_history_service
			if (@search_history_service == nil)
				@search_history_service = KalturaSearchHistoryService.new(self)
			end
			return @search_history_service
		end
		
	end

end
