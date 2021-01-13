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
require File.dirname(__FILE__) + '/kaltura_file_sync_client_plugin.rb'

module Kaltura

	class KalturaBaseInteractivity < KalturaObjectBase
		attr_accessor :data
		attr_accessor :version
		attr_accessor :entry_id
		# Interactivity update date as Unix timestamp (In seconds)
		attr_accessor :updated_at

		def version=(val)
			@version = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['data'] != nil
				self.data = xml_element.elements['data'].text
			end
			if xml_element.elements['version'] != nil
				self.version = xml_element.elements['version'].text
			end
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
		end

	end

	class KalturaInteractivityDataFieldsFilter < KalturaObjectBase
		# A string containing CSV list of fields to include
		attr_accessor :fields


		def from_xml(xml_element)
			super
			if xml_element.elements['fields'] != nil
				self.fields = xml_element.elements['fields'].text
			end
		end

	end

	class KalturaInteractivityRootFilter < KalturaInteractivityDataFieldsFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaInteractivityNodeFilter < KalturaInteractivityDataFieldsFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaInteractivityInteractionFilter < KalturaInteractivityDataFieldsFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaInteractivityDataFilter < KalturaObjectBase
		attr_accessor :root_filter
		attr_accessor :node_filter
		attr_accessor :interaction_filter


		def from_xml(xml_element)
			super
			if xml_element.elements['rootFilter'] != nil
				self.root_filter = KalturaClientBase.object_from_xml(xml_element.elements['rootFilter'], 'KalturaInteractivityRootFilter')
			end
			if xml_element.elements['nodeFilter'] != nil
				self.node_filter = KalturaClientBase.object_from_xml(xml_element.elements['nodeFilter'], 'KalturaInteractivityNodeFilter')
			end
			if xml_element.elements['interactionFilter'] != nil
				self.interaction_filter = KalturaClientBase.object_from_xml(xml_element.elements['interactionFilter'], 'KalturaInteractivityInteractionFilter')
			end
		end

	end

	class KalturaInteractivity < KalturaBaseInteractivity


		def from_xml(xml_element)
			super
		end

	end

	class KalturaVolatileInteractivity < KalturaBaseInteractivity


		def from_xml(xml_element)
			super
		end

	end


	class KalturaInteractivityService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add a interactivity object
		# @return [KalturaInteractivity]
		def add(entry_id, kaltura_interactivity)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'kalturaInteractivity', kaltura_interactivity)
			client.queue_service_action_call('interactivity_interactivity', 'add', 'KalturaInteractivity', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete a interactivity object by entry id
		# @return []
		def delete(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('interactivity_interactivity', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a interactivity object by entry id
		# @return [KalturaInteractivity]
		def get(entry_id, data_filter=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'dataFilter', data_filter)
			client.queue_service_action_call('interactivity_interactivity', 'get', 'KalturaInteractivity', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing interactivity object
		# @return [KalturaInteractivity]
		def update(entry_id, version, kaltura_interactivity)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'version', version)
			client.add_param(kparams, 'kalturaInteractivity', kaltura_interactivity)
			client.queue_service_action_call('interactivity_interactivity', 'update', 'KalturaInteractivity', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaVolatileInteractivityService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# add a volatile interactivity object
		# @return [KalturaVolatileInteractivity]
		def add(entry_id, kaltura_volatile_interactivity)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'kalturaVolatileInteractivity', kaltura_volatile_interactivity)
			client.queue_service_action_call('interactivity_volatileinteractivity', 'add', 'KalturaVolatileInteractivity', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete a volatile interactivity object by entry id
		# @return []
		def delete(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('interactivity_volatileinteractivity', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a volatile interactivity object by entry id
		# @return [KalturaVolatileInteractivity]
		def get(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('interactivity_volatileinteractivity', 'get', 'KalturaVolatileInteractivity', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update a volatile interactivity object
		# @return [KalturaVolatileInteractivity]
		def update(entry_id, version, kaltura_volatile_interactivity)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'version', version)
			client.add_param(kparams, 'kalturaVolatileInteractivity', kaltura_volatile_interactivity)
			client.queue_service_action_call('interactivity_volatileinteractivity', 'update', 'KalturaVolatileInteractivity', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :interactivity_service
		def interactivity_service
			if (@interactivity_service == nil)
				@interactivity_service = KalturaInteractivityService.new(self)
			end
			return @interactivity_service
		end
		
		attr_reader :volatile_interactivity_service
		def volatile_interactivity_service
			if (@volatile_interactivity_service == nil)
				@volatile_interactivity_service = KalturaVolatileInteractivityService.new(self)
			end
			return @volatile_interactivity_service
		end
		
	end

end
