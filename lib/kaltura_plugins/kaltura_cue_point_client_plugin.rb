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

	class KalturaCuePointStatus
		READY = 1
		DELETED = 2
		HANDLED = 3
		PENDING = 4
	end

	class KalturaQuizOutputType
		PDF = 1
	end

	class KalturaThumbCuePointSubType
		SLIDE = 1
		CHAPTER = 2
	end

	class KalturaCuePointOrderBy
		CREATED_AT_ASC = "+createdAt"
		PARTNER_SORT_VALUE_ASC = "+partnerSortValue"
		START_TIME_ASC = "+startTime"
		TRIGGERED_AT_ASC = "+triggeredAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		PARTNER_SORT_VALUE_DESC = "-partnerSortValue"
		START_TIME_DESC = "-startTime"
		TRIGGERED_AT_DESC = "-triggeredAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaCuePointType
		AD = "adCuePoint.Ad"
		ANNOTATION = "annotation.Annotation"
		CODE = "codeCuePoint.Code"
		EVENT = "eventCuePoint.Event"
		QUIZ_ANSWER = "quiz.QUIZ_ANSWER"
		QUIZ_QUESTION = "quiz.QUIZ_QUESTION"
		THUMB = "thumbCuePoint.Thumb"
	end

	class KalturaCuePoint < KalturaObjectBase
		attr_accessor :id
		attr_accessor :cue_point_type
		attr_accessor :status
		attr_accessor :entry_id
		attr_accessor :partner_id
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :triggered_at
		attr_accessor :tags
		# Start time in milliseconds
		attr_accessor :start_time
		attr_accessor :user_id
		attr_accessor :partner_data
		attr_accessor :partner_sort_value
		attr_accessor :force_stop
		attr_accessor :thumb_offset
		attr_accessor :system_name

		def status=(val)
			@status = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def triggered_at=(val)
			@triggered_at = val.to_i
		end
		def start_time=(val)
			@start_time = val.to_i
		end
		def partner_sort_value=(val)
			@partner_sort_value = val.to_i
		end
		def force_stop=(val)
			@force_stop = val.to_i
		end
		def thumb_offset=(val)
			@thumb_offset = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['cuePointType'] != nil
				self.cue_point_type = xml_element.elements['cuePointType'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['triggeredAt'] != nil
				self.triggered_at = xml_element.elements['triggeredAt'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['startTime'] != nil
				self.start_time = xml_element.elements['startTime'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['partnerData'] != nil
				self.partner_data = xml_element.elements['partnerData'].text
			end
			if xml_element.elements['partnerSortValue'] != nil
				self.partner_sort_value = xml_element.elements['partnerSortValue'].text
			end
			if xml_element.elements['forceStop'] != nil
				self.force_stop = xml_element.elements['forceStop'].text
			end
			if xml_element.elements['thumbOffset'] != nil
				self.thumb_offset = xml_element.elements['thumbOffset'].text
			end
			if xml_element.elements['systemName'] != nil
				self.system_name = xml_element.elements['systemName'].text
			end
		end

	end

	class KalturaCuePointListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaCuePoint')
			end
		end

	end

	class KalturaCuePointBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :cue_point_type_equal
		attr_accessor :cue_point_type_in
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :entry_id_equal
		attr_accessor :entry_id_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :triggered_at_greater_than_or_equal
		attr_accessor :triggered_at_less_than_or_equal
		attr_accessor :tags_like
		attr_accessor :tags_multi_like_or
		attr_accessor :tags_multi_like_and
		attr_accessor :start_time_greater_than_or_equal
		attr_accessor :start_time_less_than_or_equal
		attr_accessor :user_id_equal
		attr_accessor :user_id_in
		attr_accessor :partner_sort_value_equal
		attr_accessor :partner_sort_value_in
		attr_accessor :partner_sort_value_greater_than_or_equal
		attr_accessor :partner_sort_value_less_than_or_equal
		attr_accessor :force_stop_equal
		attr_accessor :system_name_equal
		attr_accessor :system_name_in

		def status_equal=(val)
			@status_equal = val.to_i
		end
		def created_at_greater_than_or_equal=(val)
			@created_at_greater_than_or_equal = val.to_i
		end
		def created_at_less_than_or_equal=(val)
			@created_at_less_than_or_equal = val.to_i
		end
		def updated_at_greater_than_or_equal=(val)
			@updated_at_greater_than_or_equal = val.to_i
		end
		def updated_at_less_than_or_equal=(val)
			@updated_at_less_than_or_equal = val.to_i
		end
		def triggered_at_greater_than_or_equal=(val)
			@triggered_at_greater_than_or_equal = val.to_i
		end
		def triggered_at_less_than_or_equal=(val)
			@triggered_at_less_than_or_equal = val.to_i
		end
		def start_time_greater_than_or_equal=(val)
			@start_time_greater_than_or_equal = val.to_i
		end
		def start_time_less_than_or_equal=(val)
			@start_time_less_than_or_equal = val.to_i
		end
		def partner_sort_value_equal=(val)
			@partner_sort_value_equal = val.to_i
		end
		def partner_sort_value_greater_than_or_equal=(val)
			@partner_sort_value_greater_than_or_equal = val.to_i
		end
		def partner_sort_value_less_than_or_equal=(val)
			@partner_sort_value_less_than_or_equal = val.to_i
		end
		def force_stop_equal=(val)
			@force_stop_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['cuePointTypeEqual'] != nil
				self.cue_point_type_equal = xml_element.elements['cuePointTypeEqual'].text
			end
			if xml_element.elements['cuePointTypeIn'] != nil
				self.cue_point_type_in = xml_element.elements['cuePointTypeIn'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['entryIdEqual'] != nil
				self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			end
			if xml_element.elements['entryIdIn'] != nil
				self.entry_id_in = xml_element.elements['entryIdIn'].text
			end
			if xml_element.elements['createdAtGreaterThanOrEqual'] != nil
				self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['createdAtLessThanOrEqual'] != nil
				self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			end
			if xml_element.elements['updatedAtGreaterThanOrEqual'] != nil
				self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['updatedAtLessThanOrEqual'] != nil
				self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			end
			if xml_element.elements['triggeredAtGreaterThanOrEqual'] != nil
				self.triggered_at_greater_than_or_equal = xml_element.elements['triggeredAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['triggeredAtLessThanOrEqual'] != nil
				self.triggered_at_less_than_or_equal = xml_element.elements['triggeredAtLessThanOrEqual'].text
			end
			if xml_element.elements['tagsLike'] != nil
				self.tags_like = xml_element.elements['tagsLike'].text
			end
			if xml_element.elements['tagsMultiLikeOr'] != nil
				self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			end
			if xml_element.elements['tagsMultiLikeAnd'] != nil
				self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
			end
			if xml_element.elements['startTimeGreaterThanOrEqual'] != nil
				self.start_time_greater_than_or_equal = xml_element.elements['startTimeGreaterThanOrEqual'].text
			end
			if xml_element.elements['startTimeLessThanOrEqual'] != nil
				self.start_time_less_than_or_equal = xml_element.elements['startTimeLessThanOrEqual'].text
			end
			if xml_element.elements['userIdEqual'] != nil
				self.user_id_equal = xml_element.elements['userIdEqual'].text
			end
			if xml_element.elements['userIdIn'] != nil
				self.user_id_in = xml_element.elements['userIdIn'].text
			end
			if xml_element.elements['partnerSortValueEqual'] != nil
				self.partner_sort_value_equal = xml_element.elements['partnerSortValueEqual'].text
			end
			if xml_element.elements['partnerSortValueIn'] != nil
				self.partner_sort_value_in = xml_element.elements['partnerSortValueIn'].text
			end
			if xml_element.elements['partnerSortValueGreaterThanOrEqual'] != nil
				self.partner_sort_value_greater_than_or_equal = xml_element.elements['partnerSortValueGreaterThanOrEqual'].text
			end
			if xml_element.elements['partnerSortValueLessThanOrEqual'] != nil
				self.partner_sort_value_less_than_or_equal = xml_element.elements['partnerSortValueLessThanOrEqual'].text
			end
			if xml_element.elements['forceStopEqual'] != nil
				self.force_stop_equal = xml_element.elements['forceStopEqual'].text
			end
			if xml_element.elements['systemNameEqual'] != nil
				self.system_name_equal = xml_element.elements['systemNameEqual'].text
			end
			if xml_element.elements['systemNameIn'] != nil
				self.system_name_in = xml_element.elements['systemNameIn'].text
			end
		end

	end

	class KalturaCuePointFilter < KalturaCuePointBaseFilter
		attr_accessor :free_text
		attr_accessor :user_id_equal_current
		attr_accessor :user_id_current

		def user_id_equal_current=(val)
			@user_id_equal_current = val.to_i
		end
		def user_id_current=(val)
			@user_id_current = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['freeText'] != nil
				self.free_text = xml_element.elements['freeText'].text
			end
			if xml_element.elements['userIdEqualCurrent'] != nil
				self.user_id_equal_current = xml_element.elements['userIdEqualCurrent'].text
			end
			if xml_element.elements['userIdCurrent'] != nil
				self.user_id_current = xml_element.elements['userIdCurrent'].text
			end
		end

	end


	# Cue Point service
	class KalturaCuePointService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Allows you to add an cue point object associated with an entry
		# @return [KalturaCuePoint]
		def add(cue_point)
			kparams = {}
			client.add_param(kparams, 'cuePoint', cue_point)
			client.queue_service_action_call('cuepoint_cuepoint', 'add', 'KalturaCuePoint', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Allows you to add multiple cue points objects by uploading XML that contains multiple cue point definitions
		# @return [KalturaCuePointListResponse]
		def add_from_bulk(file_data)
			kparams = {}
			kfiles = {}
			client.add_param(kfiles, 'fileData', file_data)
			client.queue_service_action_call('cuepoint_cuepoint', 'addFromBulk', 'KalturaCuePointListResponse', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Clone cuePoint with id to given entry
		# @return [KalturaCuePoint]
		def clone(id, entry_id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('cuepoint_cuepoint', 'clone', 'KalturaCuePoint', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# count cue point objects by filter
		# @return [int]
		def count(filter=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('cuepoint_cuepoint', 'count', 'int', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# delete cue point by id, and delete all children cue points
		# @return []
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('cuepoint_cuepoint', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve an CuePoint object by id
		# @return [KalturaCuePoint]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('cuepoint_cuepoint', 'get', 'KalturaCuePoint', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List cue point objects by filter and pager
		# @return [KalturaCuePointListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('cuepoint_cuepoint', 'list', 'KalturaCuePointListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Download multiple cue points objects as XML definitions
		# @return [file]
		def serve_bulk(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('cuepoint_cuepoint', 'serveBulk', 'file', kparams)
			return client.get_serve_url()
		end

		# Update cue point by id
		# @return [KalturaCuePoint]
		def update(id, cue_point)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'cuePoint', cue_point)
			client.queue_service_action_call('cuepoint_cuepoint', 'update', 'KalturaCuePoint', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update cuePoint status by id
		# @return []
		def update_status(id, status)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'status', status)
			client.queue_service_action_call('cuepoint_cuepoint', 'updateStatus', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :cue_point_service
		def cue_point_service
			if (@cue_point_service == nil)
				@cue_point_service = KalturaCuePointService.new(self)
			end
			return @cue_point_service
		end
		
	end

end
