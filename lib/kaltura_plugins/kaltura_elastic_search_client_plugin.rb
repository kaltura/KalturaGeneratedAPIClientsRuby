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

	class KalturaESearchItemType
		EXACT_MATCH = 1
		PARTIAL = 2
		STARTS_WITH = 3
		EXISTS = 4
		RANGE = 5
	end

	class KalturaESearchOperatorType
		AND_OP = 1
		OR_OP = 2
		NOT_OP = 3
	end

	class KalturaESearchCaptionFieldName
		CONTENT = "content"
		END_TIME = "end_time"
		START_TIME = "start_time"
	end

	class KalturaESearchCategoryFieldName
		CONTRIBUTION_POLICY = "contribution_policy"
		CREATED_AT = "created_at"
		DEPTH = "depth"
		DESCRIPTION = "description"
		DIRECT_ENTRIES_COUNT = "direct_entries_count"
		DIRECT_SUB_CATEGORIES_COUNT = "direct_sub_categories_count"
		DISPLAY_IN_SEARCH = "display_in_search"
		ENTRIES_COUNT = "entries_count"
		FULL_IDS = "full_ids"
		FULL_NAME = "full_name"
		INHERITANCE_TYPE = "inheritance_type"
		INHERITED_PARENT_ID = "inherited_parent_id"
		MEMBERS_COUNT = "members_count"
		MODERATION = "moderation"
		NAME = "name"
		PARENT_ID = "parent_id"
		PENDING_ENTRIES_COUNT = "pending_entries_count"
		PENDING_MEMBERS_COUNT = "pending_members_count"
		PRIVACY = "privacy"
		PRIVACY_CONTEXT = "privacy_context"
		PRIVACY_CONTEXTS = "privacy_contexts"
		REFERENCE_ID = "reference_id"
		TAGS = "tags"
		UPDATED_AT = "updated_at"
		USER_ID = "user_id"
		USER_IDS = "user_ids"
	end

	class KalturaESearchCategoryOrderByFieldName
		CREATED_AT = "created_at"
		UPDATED_AT = "updated_at"
	end

	class KalturaESearchCuePointFieldName
		ANSWERS = "answers"
		END_TIME = "end_time"
		EXPLANATION = "explanation"
		HINT = "hint"
		ID = "id"
		NAME = "name"
		QUESTION = "question"
		START_TIME = "start_time"
		SUB_TYPE = "sub_type"
		TAGS = "tags"
		TEXT = "text"
	end

	class KalturaESearchEntryFieldName
		ACCESS_CONTROL_ID = "access_control_id"
		ADMIN_TAGS = "admin_tags"
		CATEGORIES = "categories"
		CATEGORY_IDS = "category_ids"
		CATEGORY_NAME = "category_name"
		CONVERSION_PROFILE_ID = "conversion_profile_id"
		CREATED_AT = "created_at"
		CREATOR_ID = "creator_kuser_id"
		CREDIT = "credit"
		DESCRIPTION = "description"
		END_DATE = "end_date"
		ENTITLED_USER_EDIT = "entitled_kusers_edit"
		ENTITLED_USER_PUBLISH = "entitled_kusers_publish"
		ENTRY_TYPE = "entry_type"
		EXTERNAL_SOURCE_TYPE = "external_source_type"
		ID = "id"
		IS_LIVE = "is_live"
		IS_QUIZ = "is_quiz"
		USER_ID = "kuser_id"
		LENGTH_IN_MSECS = "length_in_msecs"
		MEDIA_TYPE = "media_type"
		MODERATION_STATUS = "moderation_status"
		NAME = "name"
		PARENT_ENTRY_ID = "parent_id"
		PUSH_PUBLISH = "push_publish"
		RECORDED_ENTRY_ID = "recorded_entry_id"
		REDIRECT_ENTRY_ID = "redirect_entry_id"
		REFERENCE_ID = "reference_id"
		SITE_URL = "site_url"
		SOURCE_TYPE = "source_type"
		START_DATE = "start_date"
		TAGS = "tags"
		TEMPLATE_ENTRY_ID = "template_entry_id"
		UPDATED_AT = "updated_at"
		VIEWS = "views"
		VOTES = "votes"
	end

	class KalturaESearchEntryOrderByFieldName
		CREATED_AT = "created_at"
		END_DATE = "end_date"
		NAME = "name"
		START_DATE = "start_date"
		UPDATED_AT = "updated_at"
		VIEWS = "views"
		VOTES = "votes"
	end

	class KalturaESearchSortOrder
		ORDER_BY_ASC = "asc"
		ORDER_BY_DESC = "desc"
	end

	class KalturaESearchUserFieldName
		CREATED_AT = "created_at"
		EMAIL = "email"
		FIRST_NAME = "first_name"
		GROUP_IDS = "group_ids"
		LAST_NAME = "last_name"
		PERMISSION_NAMES = "permission_names"
		ROLE_IDS = "role_ids"
		SCREEN_NAME = "screen_name"
		TAGS = "tags"
		UPDATED_AT = "updated_at"
		TYPE = "user_type"
	end

	class KalturaESearchUserOrderByFieldName
		CREATED_AT = "created_at"
		UPDATED_AT = "updated_at"
	end

	class KalturaESearchBaseItem < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	class KalturaESearchCategoryBaseItem < KalturaESearchBaseItem


		def from_xml(xml_element)
			super
		end

	end

	class KalturaESearchEntryBaseItem < KalturaESearchBaseItem


		def from_xml(xml_element)
			super
		end

	end

	class KalturaESearchHighlight < KalturaObjectBase
		attr_accessor :field_name
		attr_accessor :hits


		def from_xml(xml_element)
			super
			if xml_element.elements['fieldName'] != nil
				self.field_name = xml_element.elements['fieldName'].text
			end
			if xml_element.elements['hits'] != nil
				self.hits = KalturaClientBase.object_from_xml(xml_element.elements['hits'], 'KalturaString')
			end
		end

	end

	class KalturaESearchItemData < KalturaObjectBase
		attr_accessor :highlight


		def from_xml(xml_element)
			super
			if xml_element.elements['highlight'] != nil
				self.highlight = KalturaClientBase.object_from_xml(xml_element.elements['highlight'], 'KalturaESearchHighlight')
			end
		end

	end

	class KalturaESearchItemDataResult < KalturaObjectBase
		attr_accessor :total_count
		attr_accessor :items
		attr_accessor :items_type

		def total_count=(val)
			@total_count = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['totalCount'] != nil
				self.total_count = xml_element.elements['totalCount'].text
			end
			if xml_element.elements['items'] != nil
				self.items = KalturaClientBase.object_from_xml(xml_element.elements['items'], 'KalturaESearchItemData')
			end
			if xml_element.elements['itemsType'] != nil
				self.items_type = xml_element.elements['itemsType'].text
			end
		end

	end

	class KalturaESearchOrderByItem < KalturaObjectBase
		attr_accessor :sort_order


		def from_xml(xml_element)
			super
			if xml_element.elements['sortOrder'] != nil
				self.sort_order = xml_element.elements['sortOrder'].text
			end
		end

	end

	class KalturaESearchOrderBy < KalturaObjectBase
		attr_accessor :order_items


		def from_xml(xml_element)
			super
			if xml_element.elements['orderItems'] != nil
				self.order_items = KalturaClientBase.object_from_xml(xml_element.elements['orderItems'], 'KalturaESearchOrderByItem')
			end
		end

	end

	class KalturaESearchParams < KalturaObjectBase
		attr_accessor :object_statuses
		attr_accessor :object_id
		attr_accessor :order_by
		attr_accessor :use_highlight

		def use_highlight=(val)
			@use_highlight = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['objectStatuses'] != nil
				self.object_statuses = xml_element.elements['objectStatuses'].text
			end
			if xml_element.elements['objectId'] != nil
				self.object_id = xml_element.elements['objectId'].text
			end
			if xml_element.elements['orderBy'] != nil
				self.order_by = KalturaClientBase.object_from_xml(xml_element.elements['orderBy'], 'KalturaESearchOrderBy')
			end
			if xml_element.elements['useHighlight'] != nil
				self.use_highlight = xml_element.elements['useHighlight'].text
			end
		end

	end

	class KalturaESearchRange < KalturaObjectBase
		attr_accessor :greater_than_or_equal
		attr_accessor :less_than_or_equal
		attr_accessor :greater_than
		attr_accessor :less_than

		def greater_than_or_equal=(val)
			@greater_than_or_equal = val.to_i
		end
		def less_than_or_equal=(val)
			@less_than_or_equal = val.to_i
		end
		def greater_than=(val)
			@greater_than = val.to_i
		end
		def less_than=(val)
			@less_than = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['greaterThanOrEqual'] != nil
				self.greater_than_or_equal = xml_element.elements['greaterThanOrEqual'].text
			end
			if xml_element.elements['lessThanOrEqual'] != nil
				self.less_than_or_equal = xml_element.elements['lessThanOrEqual'].text
			end
			if xml_element.elements['greaterThan'] != nil
				self.greater_than = xml_element.elements['greaterThan'].text
			end
			if xml_element.elements['lessThan'] != nil
				self.less_than = xml_element.elements['lessThan'].text
			end
		end

	end

	class KalturaESearchResult < KalturaObjectBase
		attr_accessor :object
		attr_accessor :highlight
		attr_accessor :items_data


		def from_xml(xml_element)
			super
			if xml_element.elements['object'] != nil
				self.object = KalturaClientBase.object_from_xml(xml_element.elements['object'], 'KalturaObjectBase')
			end
			if xml_element.elements['highlight'] != nil
				self.highlight = KalturaClientBase.object_from_xml(xml_element.elements['highlight'], 'KalturaESearchHighlight')
			end
			if xml_element.elements['itemsData'] != nil
				self.items_data = KalturaClientBase.object_from_xml(xml_element.elements['itemsData'], 'KalturaESearchItemDataResult')
			end
		end

	end

	class KalturaESearchResponse < KalturaObjectBase
		attr_accessor :total_count
		attr_accessor :objects

		def total_count=(val)
			@total_count = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['totalCount'] != nil
				self.total_count = xml_element.elements['totalCount'].text
			end
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaESearchResult')
			end
		end

	end

	class KalturaESearchUserBaseItem < KalturaESearchBaseItem


		def from_xml(xml_element)
			super
		end

	end

	class KalturaESearchCaptionItemData < KalturaESearchItemData
		attr_accessor :line
		attr_accessor :starts_at
		attr_accessor :ends_at
		attr_accessor :language
		attr_accessor :caption_asset_id

		def starts_at=(val)
			@starts_at = val.to_i
		end
		def ends_at=(val)
			@ends_at = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['line'] != nil
				self.line = xml_element.elements['line'].text
			end
			if xml_element.elements['startsAt'] != nil
				self.starts_at = xml_element.elements['startsAt'].text
			end
			if xml_element.elements['endsAt'] != nil
				self.ends_at = xml_element.elements['endsAt'].text
			end
			if xml_element.elements['language'] != nil
				self.language = xml_element.elements['language'].text
			end
			if xml_element.elements['captionAssetId'] != nil
				self.caption_asset_id = xml_element.elements['captionAssetId'].text
			end
		end

	end

	class KalturaESearchCategoryOrderByItem < KalturaESearchOrderByItem
		attr_accessor :sort_field


		def from_xml(xml_element)
			super
			if xml_element.elements['sortField'] != nil
				self.sort_field = xml_element.elements['sortField'].text
			end
		end

	end

	class KalturaESearchCategoryOperator < KalturaESearchCategoryBaseItem
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
				self.search_items = KalturaClientBase.object_from_xml(xml_element.elements['searchItems'], 'KalturaESearchCategoryBaseItem')
			end
		end

	end

	class KalturaESearchCategoryParams < KalturaESearchParams
		attr_accessor :search_operator


		def from_xml(xml_element)
			super
			if xml_element.elements['searchOperator'] != nil
				self.search_operator = KalturaClientBase.object_from_xml(xml_element.elements['searchOperator'], 'KalturaESearchCategoryOperator')
			end
		end

	end

	class KalturaESearchCategoryResult < KalturaESearchResult


		def from_xml(xml_element)
			super
		end

	end

	class KalturaESearchCuePointItemData < KalturaESearchItemData
		attr_accessor :cue_point_type
		attr_accessor :id
		attr_accessor :name
		attr_accessor :text
		attr_accessor :tags
		attr_accessor :start_time
		attr_accessor :end_time
		attr_accessor :sub_type
		attr_accessor :question
		attr_accessor :answers
		attr_accessor :hint
		attr_accessor :explanation
		attr_accessor :asset_id


		def from_xml(xml_element)
			super
			if xml_element.elements['cuePointType'] != nil
				self.cue_point_type = xml_element.elements['cuePointType'].text
			end
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['text'] != nil
				self.text = xml_element.elements['text'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['startTime'] != nil
				self.start_time = xml_element.elements['startTime'].text
			end
			if xml_element.elements['endTime'] != nil
				self.end_time = xml_element.elements['endTime'].text
			end
			if xml_element.elements['subType'] != nil
				self.sub_type = xml_element.elements['subType'].text
			end
			if xml_element.elements['question'] != nil
				self.question = xml_element.elements['question'].text
			end
			if xml_element.elements['answers'] != nil
				self.answers = xml_element.elements['answers'].text
			end
			if xml_element.elements['hint'] != nil
				self.hint = xml_element.elements['hint'].text
			end
			if xml_element.elements['explanation'] != nil
				self.explanation = xml_element.elements['explanation'].text
			end
			if xml_element.elements['assetId'] != nil
				self.asset_id = xml_element.elements['assetId'].text
			end
		end

	end

	class KalturaESearchEntryOrderByItem < KalturaESearchOrderByItem
		attr_accessor :sort_field


		def from_xml(xml_element)
			super
			if xml_element.elements['sortField'] != nil
				self.sort_field = xml_element.elements['sortField'].text
			end
		end

	end

	class KalturaESearchEntryOperator < KalturaESearchEntryBaseItem
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
				self.search_items = KalturaClientBase.object_from_xml(xml_element.elements['searchItems'], 'KalturaESearchEntryBaseItem')
			end
		end

	end

	class KalturaESearchEntryParams < KalturaESearchParams
		attr_accessor :search_operator


		def from_xml(xml_element)
			super
			if xml_element.elements['searchOperator'] != nil
				self.search_operator = KalturaClientBase.object_from_xml(xml_element.elements['searchOperator'], 'KalturaESearchEntryOperator')
			end
		end

	end

	class KalturaESearchEntryResult < KalturaESearchResult


		def from_xml(xml_element)
			super
		end

	end

	class KalturaESearchMetadataItemData < KalturaESearchItemData
		attr_accessor :xpath
		attr_accessor :metadata_profile_id
		attr_accessor :metadata_field_id
		attr_accessor :value_text
		attr_accessor :value_int

		def metadata_profile_id=(val)
			@metadata_profile_id = val.to_i
		end
		def metadata_field_id=(val)
			@metadata_field_id = val.to_i
		end
		def value_int=(val)
			@value_int = val.to_i
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
			if xml_element.elements['valueText'] != nil
				self.value_text = xml_element.elements['valueText'].text
			end
			if xml_element.elements['valueInt'] != nil
				self.value_int = xml_element.elements['valueInt'].text
			end
		end

	end

	class KalturaESearchMetadataOrderByItem < KalturaESearchOrderByItem
		attr_accessor :xpath
		attr_accessor :metadata_profile_id

		def metadata_profile_id=(val)
			@metadata_profile_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['xpath'] != nil
				self.xpath = xml_element.elements['xpath'].text
			end
			if xml_element.elements['metadataProfileId'] != nil
				self.metadata_profile_id = xml_element.elements['metadataProfileId'].text
			end
		end

	end

	class KalturaESearchUserOrderByItem < KalturaESearchOrderByItem
		attr_accessor :sort_field


		def from_xml(xml_element)
			super
			if xml_element.elements['sortField'] != nil
				self.sort_field = xml_element.elements['sortField'].text
			end
		end

	end

	class KalturaESearchUserOperator < KalturaESearchUserBaseItem
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
				self.search_items = KalturaClientBase.object_from_xml(xml_element.elements['searchItems'], 'KalturaESearchUserBaseItem')
			end
		end

	end

	class KalturaESearchUserParams < KalturaESearchParams
		attr_accessor :search_operator


		def from_xml(xml_element)
			super
			if xml_element.elements['searchOperator'] != nil
				self.search_operator = KalturaClientBase.object_from_xml(xml_element.elements['searchOperator'], 'KalturaESearchUserOperator')
			end
		end

	end

	class KalturaESearchUserResult < KalturaESearchResult


		def from_xml(xml_element)
			super
		end

	end

	class KalturaESearchAbstractCategoryItem < KalturaESearchCategoryBaseItem
		attr_accessor :search_term
		attr_accessor :item_type
		attr_accessor :range

		def item_type=(val)
			@item_type = val.to_i
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
		end

	end

	class KalturaESearchAbstractEntryItem < KalturaESearchEntryBaseItem
		attr_accessor :search_term
		attr_accessor :item_type
		attr_accessor :range

		def item_type=(val)
			@item_type = val.to_i
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
		end

	end

	class KalturaESearchAbstractUserItem < KalturaESearchUserBaseItem
		attr_accessor :search_term
		attr_accessor :item_type
		attr_accessor :range

		def item_type=(val)
			@item_type = val.to_i
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
		end

	end

	class KalturaESearchCategoryQuery < KalturaESearchCategoryBaseItem
		attr_accessor :e_search_query


		def from_xml(xml_element)
			super
			if xml_element.elements['eSearchQuery'] != nil
				self.e_search_query = xml_element.elements['eSearchQuery'].text
			end
		end

	end

	class KalturaESearchEntryQuery < KalturaESearchEntryBaseItem
		attr_accessor :e_search_query


		def from_xml(xml_element)
			super
			if xml_element.elements['eSearchQuery'] != nil
				self.e_search_query = xml_element.elements['eSearchQuery'].text
			end
		end

	end

	class KalturaESearchUserQuery < KalturaESearchUserBaseItem
		attr_accessor :e_search_query


		def from_xml(xml_element)
			super
			if xml_element.elements['eSearchQuery'] != nil
				self.e_search_query = xml_element.elements['eSearchQuery'].text
			end
		end

	end

	class KalturaESearchCaptionItem < KalturaESearchAbstractEntryItem
		attr_accessor :field_name


		def from_xml(xml_element)
			super
			if xml_element.elements['fieldName'] != nil
				self.field_name = xml_element.elements['fieldName'].text
			end
		end

	end

	class KalturaESearchCategoryItem < KalturaESearchAbstractCategoryItem
		attr_accessor :field_name


		def from_xml(xml_element)
			super
			if xml_element.elements['fieldName'] != nil
				self.field_name = xml_element.elements['fieldName'].text
			end
		end

	end

	class KalturaESearchCategoryMetadataItem < KalturaESearchAbstractCategoryItem
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

	class KalturaESearchCuePointItem < KalturaESearchAbstractEntryItem
		attr_accessor :field_name
		attr_accessor :cue_point_type


		def from_xml(xml_element)
			super
			if xml_element.elements['fieldName'] != nil
				self.field_name = xml_element.elements['fieldName'].text
			end
			if xml_element.elements['cuePointType'] != nil
				self.cue_point_type = xml_element.elements['cuePointType'].text
			end
		end

	end

	class KalturaESearchEntryItem < KalturaESearchAbstractEntryItem
		attr_accessor :field_name


		def from_xml(xml_element)
			super
			if xml_element.elements['fieldName'] != nil
				self.field_name = xml_element.elements['fieldName'].text
			end
		end

	end

	class KalturaESearchEntryMetadataItem < KalturaESearchAbstractEntryItem
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

	class KalturaESearchUnifiedItem < KalturaESearchAbstractEntryItem


		def from_xml(xml_element)
			super
		end

	end

	class KalturaESearchUserItem < KalturaESearchAbstractUserItem
		attr_accessor :field_name


		def from_xml(xml_element)
			super
			if xml_element.elements['fieldName'] != nil
				self.field_name = xml_element.elements['fieldName'].text
			end
		end

	end

	class KalturaESearchUserMetadataItem < KalturaESearchAbstractUserItem
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


	class KalturaESearchService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# @return [KalturaESearchResponse]
		def search_category(search_params, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'searchParams', search_params)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('elasticsearch_esearch', 'searchCategory', 'KalturaESearchResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return [KalturaESearchResponse]
		def search_entry(search_params, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'searchParams', search_params)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('elasticsearch_esearch', 'searchEntry', 'KalturaESearchResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return [KalturaESearchResponse]
		def search_user(search_params, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'searchParams', search_params)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('elasticsearch_esearch', 'searchUser', 'KalturaESearchResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :e_search_service
		def e_search_service
			if (@e_search_service == nil)
				@e_search_service = KalturaESearchService.new(self)
			end
			return @e_search_service
		end
		
	end

end
