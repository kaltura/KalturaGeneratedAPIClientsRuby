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
require File.dirname(__FILE__) + '/kaltura_elastic_search_client_plugin.rb'

module Kaltura

	class KalturaBumper < KalturaObjectBase
		attr_accessor :entry_id
		attr_accessor :url
		attr_accessor :sources


		def from_xml(xml_element)
			super
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['url'] != nil
				self.url = xml_element.elements['url'].text
			end
			if xml_element.elements['sources'] != nil
				self.sources = KalturaClientBase.object_from_xml(xml_element.elements['sources'], 'KalturaPlaybackSource')
			end
		end

	end


	class KalturaBumperService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Adds a bumper to an entry
		# @return [KalturaBumper]
		def add(entry_id, bumper)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'bumper', bumper)
			client.queue_service_action_call('bumper_bumper', 'add', 'KalturaBumper', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete bumper by EntryId
		# @return [KalturaBumper]
		def delete(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('bumper_bumper', 'delete', 'KalturaBumper', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Allows to get the bumper
		# @return [KalturaBumper]
		def get(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('bumper_bumper', 'get', 'KalturaBumper', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Allows to update a bumper
		# @return [KalturaBumper]
		def update(entry_id, bumper)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'bumper', bumper)
			client.queue_service_action_call('bumper_bumper', 'update', 'KalturaBumper', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :bumper_service
		def bumper_service
			if (@bumper_service == nil)
				@bumper_service = KalturaBumperService.new(self)
			end
			return @bumper_service
		end
		
	end

end
