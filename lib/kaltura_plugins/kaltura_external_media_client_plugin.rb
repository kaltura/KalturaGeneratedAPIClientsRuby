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

	class KalturaExternalMediaEntryOrderBy
		CREATED_AT_ASC = "+createdAt"
		DURATION_ASC = "+duration"
		END_DATE_ASC = "+endDate"
		LAST_PLAYED_AT_ASC = "+lastPlayedAt"
		MEDIA_TYPE_ASC = "+mediaType"
		MODERATION_COUNT_ASC = "+moderationCount"
		NAME_ASC = "+name"
		PARTNER_SORT_VALUE_ASC = "+partnerSortValue"
		PLAYS_ASC = "+plays"
		RANK_ASC = "+rank"
		RECENT_ASC = "+recent"
		START_DATE_ASC = "+startDate"
		TOTAL_RANK_ASC = "+totalRank"
		UPDATED_AT_ASC = "+updatedAt"
		VIEWS_ASC = "+views"
		WEIGHT_ASC = "+weight"
		CREATED_AT_DESC = "-createdAt"
		DURATION_DESC = "-duration"
		END_DATE_DESC = "-endDate"
		LAST_PLAYED_AT_DESC = "-lastPlayedAt"
		MEDIA_TYPE_DESC = "-mediaType"
		MODERATION_COUNT_DESC = "-moderationCount"
		NAME_DESC = "-name"
		PARTNER_SORT_VALUE_DESC = "-partnerSortValue"
		PLAYS_DESC = "-plays"
		RANK_DESC = "-rank"
		RECENT_DESC = "-recent"
		START_DATE_DESC = "-startDate"
		TOTAL_RANK_DESC = "-totalRank"
		UPDATED_AT_DESC = "-updatedAt"
		VIEWS_DESC = "-views"
		WEIGHT_DESC = "-weight"
	end

	class KalturaExternalMediaSourceType
		INTERCALL = "InterCall"
		YOUTUBE = "YouTube"
	end

	class KalturaExternalMediaEntry < KalturaMediaEntry
		# The source type of the external media
		attr_accessor :external_source_type
		# Comma separated asset params ids that exists for this external media entry
		attr_accessor :asset_params_ids


		def from_xml(xml_element)
			super
			if xml_element.elements['externalSourceType'] != nil
				self.external_source_type = xml_element.elements['externalSourceType'].text
			end
			if xml_element.elements['assetParamsIds'] != nil
				self.asset_params_ids = xml_element.elements['assetParamsIds'].text
			end
		end

	end

	class KalturaExternalMediaEntryListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaExternalMediaEntry')
			end
		end

	end

	class KalturaExternalMediaEntryBaseFilter < KalturaMediaEntryFilter
		attr_accessor :external_source_type_equal
		attr_accessor :external_source_type_in
		attr_accessor :asset_params_ids_match_or
		attr_accessor :asset_params_ids_match_and


		def from_xml(xml_element)
			super
			if xml_element.elements['externalSourceTypeEqual'] != nil
				self.external_source_type_equal = xml_element.elements['externalSourceTypeEqual'].text
			end
			if xml_element.elements['externalSourceTypeIn'] != nil
				self.external_source_type_in = xml_element.elements['externalSourceTypeIn'].text
			end
			if xml_element.elements['assetParamsIdsMatchOr'] != nil
				self.asset_params_ids_match_or = xml_element.elements['assetParamsIdsMatchOr'].text
			end
			if xml_element.elements['assetParamsIdsMatchAnd'] != nil
				self.asset_params_ids_match_and = xml_element.elements['assetParamsIdsMatchAnd'].text
			end
		end

	end

	class KalturaExternalMediaEntryFilter < KalturaExternalMediaEntryBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# External media service lets you upload and manage embed codes and external playable content
	class KalturaExternalMediaService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add external media entry
		# @return [KalturaExternalMediaEntry]
		def add(entry)
			kparams = {}
			client.add_param(kparams, 'entry', entry)
			client.queue_service_action_call('externalmedia_externalmedia', 'add', 'KalturaExternalMediaEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Count media entries by filter.
		# @return [int]
		def count(filter=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('externalmedia_externalmedia', 'count', 'int', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete a external media entry.
		# @return []
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('externalmedia_externalmedia', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get external media entry by ID.
		# @return [KalturaExternalMediaEntry]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('externalmedia_externalmedia', 'get', 'KalturaExternalMediaEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List media entries by filter with paging support.
		# @return [KalturaExternalMediaEntryListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('externalmedia_externalmedia', 'list', 'KalturaExternalMediaEntryListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update external media entry. Only the properties that were set will be updated.
		# @return [KalturaExternalMediaEntry]
		def update(id, entry)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'entry', entry)
			client.queue_service_action_call('externalmedia_externalmedia', 'update', 'KalturaExternalMediaEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :external_media_service
		def external_media_service
			if (@external_media_service == nil)
				@external_media_service = KalturaExternalMediaService.new(self)
			end
			return @external_media_service
		end
		
	end

end
