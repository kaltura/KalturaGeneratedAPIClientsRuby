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

	class KalturaTag < KalturaObjectBase
		attr_accessor :id
		attr_accessor :tag
		attr_accessor :tagged_object_type
		attr_accessor :partner_id
		attr_accessor :instance_count
		attr_accessor :created_at
		attr_accessor :updated_at

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def instance_count=(val)
			@instance_count = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['tag'] != nil
				self.tag = xml_element.elements['tag'].text
			end
			if xml_element.elements['taggedObjectType'] != nil
				self.tagged_object_type = xml_element.elements['taggedObjectType'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['instanceCount'] != nil
				self.instance_count = xml_element.elements['instanceCount'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
		end

	end

	class KalturaIndexTagsByPrivacyContextJobData < KalturaJobData
		attr_accessor :changed_category_id
		attr_accessor :deleted_privacy_contexts
		attr_accessor :added_privacy_contexts

		def changed_category_id=(val)
			@changed_category_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['changedCategoryId'] != nil
				self.changed_category_id = xml_element.elements['changedCategoryId'].text
			end
			if xml_element.elements['deletedPrivacyContexts'] != nil
				self.deleted_privacy_contexts = xml_element.elements['deletedPrivacyContexts'].text
			end
			if xml_element.elements['addedPrivacyContexts'] != nil
				self.added_privacy_contexts = xml_element.elements['addedPrivacyContexts'].text
			end
		end

	end

	class KalturaTagFilter < KalturaFilter
		attr_accessor :object_type_equal
		attr_accessor :tag_equal
		attr_accessor :tag_starts_with
		attr_accessor :instance_count_equal
		attr_accessor :instance_count_in

		def instance_count_equal=(val)
			@instance_count_equal = val.to_i
		end
		def instance_count_in=(val)
			@instance_count_in = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['objectTypeEqual'] != nil
				self.object_type_equal = xml_element.elements['objectTypeEqual'].text
			end
			if xml_element.elements['tagEqual'] != nil
				self.tag_equal = xml_element.elements['tagEqual'].text
			end
			if xml_element.elements['tagStartsWith'] != nil
				self.tag_starts_with = xml_element.elements['tagStartsWith'].text
			end
			if xml_element.elements['instanceCountEqual'] != nil
				self.instance_count_equal = xml_element.elements['instanceCountEqual'].text
			end
			if xml_element.elements['instanceCountIn'] != nil
				self.instance_count_in = xml_element.elements['instanceCountIn'].text
			end
		end

	end

	class KalturaTagListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaTag')
			end
		end

	end


	# Search object tags
	class KalturaTagService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Action goes over all tags with instanceCount==0 and checks whether they need to be removed from the DB. Returns number of removed tags.
		# @return [int]
		def delete_pending()
			kparams = {}
			client.queue_service_action_call('tagsearch_tag', 'deletePending', 'int', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return []
		def index_category_entry_tags(category_id, pc_to_decrement, pc_to_increment)
			kparams = {}
			client.add_param(kparams, 'categoryId', category_id)
			client.add_param(kparams, 'pcToDecrement', pc_to_decrement)
			client.add_param(kparams, 'pcToIncrement', pc_to_increment)
			client.queue_service_action_call('tagsearch_tag', 'indexCategoryEntryTags', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return [KalturaTagListResponse]
		def search(tag_filter, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'tagFilter', tag_filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('tagsearch_tag', 'search', 'KalturaTagListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :tag_service
		def tag_service
			if (@tag_service == nil)
				@tag_service = KalturaTagService.new(self)
			end
			return @tag_service
		end
		
	end

end
