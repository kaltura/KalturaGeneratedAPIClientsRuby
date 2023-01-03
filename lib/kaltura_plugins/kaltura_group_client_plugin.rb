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
# Copyright (C) 2006-2022  Kaltura Inc.
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

	class KalturaGroupProcessStatus
		NONE = 0
		PROCESSING = 1
	end

	class KalturaESearchGroupFieldName
		COMPANY = "company"
		COUNTRY = "country"
		CREATED_AT = "created_at"
		EMAIL = "email"
		EXTERNAL_ID = "external_id"
		FIRST_NAME = "first_name"
		GROUP_IDS = "group_ids"
		IS_ADMIN = "is_admin"
		IS_HASHED = "is_hashed"
		LAST_NAME = "last_name"
		LOGIN_ENABLED = "login_enabled"
		PERMISSION_NAMES = "permission_names"
		ROLE_IDS = "role_ids"
		SCREEN_NAME = "screen_name"
		TAGS = "tags"
		TITLE = "title"
		UPDATED_AT = "updated_at"
		USER_ID = "user_id"
	end

	class KalturaESearchGroupOrderByFieldName
		CREATED_AT = "created_at"
		MEMBERS_COUNT = "members_count"
		USER_ID = "puser_id"
		SCREEN_NAME = "screen_name"
		UPDATED_AT = "updated_at"
	end

	class KalturaESearchGroupBaseItem < KalturaESearchBaseItem


		def from_xml(xml_element)
			super
		end

	end

	class KalturaGroup < KalturaBaseUser
		attr_accessor :members_count
		attr_accessor :process_status

		def members_count=(val)
			@members_count = val.to_i
		end
		def process_status=(val)
			@process_status = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['membersCount'] != nil
				self.members_count = xml_element.elements['membersCount'].text
			end
			if xml_element.elements['processStatus'] != nil
				self.process_status = xml_element.elements['processStatus'].text
			end
		end

	end

	class KalturaESearchGroupOperator < KalturaESearchGroupBaseItem
		attr_accessor :operator
		attr_accessor :search_items

		def operator=(val)
			@operator = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['operator'] != nil
				self.operator = xml_element.elements['operator'].text
			end
			if xml_element.elements['searchItems'] != nil
				self.search_items = KalturaClientBase.object_from_xml(xml_element.elements['searchItems'], 'KalturaESearchGroupBaseItem')
			end
		end

	end

	class KalturaGroupListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaGroup')
			end
		end

	end

	class KalturaESearchAbstractGroupItem < KalturaESearchGroupBaseItem
		attr_accessor :search_term
		attr_accessor :item_type
		attr_accessor :range
		attr_accessor :add_highlight

		def item_type=(val)
			@item_type = val.to_i
		end
		def add_highlight=(val)
			@add_highlight = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['searchTerm'] != nil
				self.search_term = xml_element.elements['searchTerm'].text
			end
			if xml_element.elements['itemType'] != nil
				self.item_type = xml_element.elements['itemType'].text
			end
			if xml_element.elements['range'] != nil
				self.range = KalturaClientBase.object_from_xml(xml_element.elements['range'], 'KalturaESearchRange')
			end
			if xml_element.elements['addHighlight'] != nil
				self.add_highlight = xml_element.elements['addHighlight'].text
			end
		end

	end

	class KalturaESearchGroupItem < KalturaESearchAbstractGroupItem
		attr_accessor :field_name


		def from_xml(xml_element)
			super
			if xml_element.elements['fieldName'] != nil
				self.field_name = xml_element.elements['fieldName'].text
			end
		end

	end

	class KalturaESearchGroupMetadataItem < KalturaESearchAbstractGroupItem
		attr_accessor :xpath
		attr_accessor :metadata_profile_id
		attr_accessor :metadata_field_id

		def metadata_profile_id=(val)
			@metadata_profile_id = val.to_i
		end
		def metadata_field_id=(val)
			@metadata_field_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['xpath'] != nil
				self.xpath = xml_element.elements['xpath'].text
			end
			if xml_element.elements['metadataProfileId'] != nil
				self.metadata_profile_id = xml_element.elements['metadataProfileId'].text
			end
			if xml_element.elements['metadataFieldId'] != nil
				self.metadata_field_id = xml_element.elements['metadataFieldId'].text
			end
		end

	end

	class KalturaGroupFilter < KalturaUserFilter


		def from_xml(xml_element)
			super
		end

	end


	class KalturaGroupService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Adds a new group (user of type group).
		# @return [KalturaGroup]
		def add(group)
			kparams = {}
			client.add_param(kparams, 'group', group)
			client.queue_service_action_call('group_group', 'add', 'KalturaGroup', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# clone the group (groupId), and set group id with the neeGroupName.
		# @return [KalturaGroup]
		def clone(original_group_id, new_group_id, new_group_name=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'originalGroupId', original_group_id)
			client.add_param(kparams, 'newGroupId', new_group_id)
			client.add_param(kparams, 'newGroupName', new_group_name)
			client.queue_service_action_call('group_group', 'clone', 'KalturaGroup', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete group by ID
		# @return [KalturaGroup]
		def delete(group_id)
			kparams = {}
			client.add_param(kparams, 'groupId', group_id)
			client.queue_service_action_call('group_group', 'delete', 'KalturaGroup', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieves a group object for a specified group ID.
		# @return [KalturaGroup]
		def get(group_id)
			kparams = {}
			client.add_param(kparams, 'groupId', group_id)
			client.queue_service_action_call('group_group', 'get', 'KalturaGroup', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Lists group  objects that are associated with an account.
		# 	 Blocked users are listed unless you use a filter to exclude them.
		# 	 Deleted users are not listed unless you use a filter to include them.
		# @return [KalturaGroupListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('group_group', 'list', 'KalturaGroupListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update group by ID
		# @return [KalturaGroup]
		def update(group_id, group)
			kparams = {}
			client.add_param(kparams, 'groupId', group_id)
			client.add_param(kparams, 'group', group)
			client.queue_service_action_call('group_group', 'update', 'KalturaGroup', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :group_service
		def group_service
			if (@group_service == nil)
				@group_service = KalturaGroupService.new(self)
			end
			return @group_service
		end
		
	end

end
