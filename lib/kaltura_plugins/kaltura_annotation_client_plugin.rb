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
require File.dirname(__FILE__) + '/kaltura_cue_point_client_plugin.rb'

module Kaltura

	class KalturaAnnotationOrderBy
		CREATED_AT_ASC = "+createdAt"
		DURATION_ASC = "+duration"
		END_TIME_ASC = "+endTime"
		PARTNER_SORT_VALUE_ASC = "+partnerSortValue"
		START_TIME_ASC = "+startTime"
		TRIGGERED_AT_ASC = "+triggeredAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		DURATION_DESC = "-duration"
		END_TIME_DESC = "-endTime"
		PARTNER_SORT_VALUE_DESC = "-partnerSortValue"
		START_TIME_DESC = "-startTime"
		TRIGGERED_AT_DESC = "-triggeredAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaAnnotation < KalturaCuePoint
		attr_accessor :parent_id
		attr_accessor :text
		# End time in milliseconds
		attr_accessor :end_time
		# Duration in milliseconds
		attr_accessor :duration
		# Depth in the tree
		attr_accessor :depth
		# Number of all descendants
		attr_accessor :children_count
		# Number of children, first generation only.
		attr_accessor :direct_children_count
		# Is the annotation public.
		attr_accessor :is_public
		# Should the cue point get indexed on the entry.
		attr_accessor :searchable_on_entry

		def end_time=(val)
			@end_time = val.to_i
		end
		def duration=(val)
			@duration = val.to_i
		end
		def depth=(val)
			@depth = val.to_i
		end
		def children_count=(val)
			@children_count = val.to_i
		end
		def direct_children_count=(val)
			@direct_children_count = val.to_i
		end
		def is_public=(val)
			@is_public = val.to_i
		end
		def searchable_on_entry=(val)
			@searchable_on_entry = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['parentId'] != nil
				self.parent_id = xml_element.elements['parentId'].text
			end
			if xml_element.elements['text'] != nil
				self.text = xml_element.elements['text'].text
			end
			if xml_element.elements['endTime'] != nil
				self.end_time = xml_element.elements['endTime'].text
			end
			if xml_element.elements['duration'] != nil
				self.duration = xml_element.elements['duration'].text
			end
			if xml_element.elements['depth'] != nil
				self.depth = xml_element.elements['depth'].text
			end
			if xml_element.elements['childrenCount'] != nil
				self.children_count = xml_element.elements['childrenCount'].text
			end
			if xml_element.elements['directChildrenCount'] != nil
				self.direct_children_count = xml_element.elements['directChildrenCount'].text
			end
			if xml_element.elements['isPublic'] != nil
				self.is_public = xml_element.elements['isPublic'].text
			end
			if xml_element.elements['searchableOnEntry'] != nil
				self.searchable_on_entry = xml_element.elements['searchableOnEntry'].text
			end
		end

	end

	class KalturaAnnotationListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaAnnotation')
			end
		end

	end

	class KalturaAnnotationBaseFilter < KalturaCuePointFilter
		attr_accessor :parent_id_equal
		attr_accessor :parent_id_in
		attr_accessor :text_like
		attr_accessor :text_multi_like_or
		attr_accessor :text_multi_like_and
		attr_accessor :end_time_greater_than_or_equal
		attr_accessor :end_time_less_than_or_equal
		attr_accessor :duration_greater_than_or_equal
		attr_accessor :duration_less_than_or_equal
		attr_accessor :is_public_equal

		def end_time_greater_than_or_equal=(val)
			@end_time_greater_than_or_equal = val.to_i
		end
		def end_time_less_than_or_equal=(val)
			@end_time_less_than_or_equal = val.to_i
		end
		def duration_greater_than_or_equal=(val)
			@duration_greater_than_or_equal = val.to_i
		end
		def duration_less_than_or_equal=(val)
			@duration_less_than_or_equal = val.to_i
		end
		def is_public_equal=(val)
			@is_public_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['parentIdEqual'] != nil
				self.parent_id_equal = xml_element.elements['parentIdEqual'].text
			end
			if xml_element.elements['parentIdIn'] != nil
				self.parent_id_in = xml_element.elements['parentIdIn'].text
			end
			if xml_element.elements['textLike'] != nil
				self.text_like = xml_element.elements['textLike'].text
			end
			if xml_element.elements['textMultiLikeOr'] != nil
				self.text_multi_like_or = xml_element.elements['textMultiLikeOr'].text
			end
			if xml_element.elements['textMultiLikeAnd'] != nil
				self.text_multi_like_and = xml_element.elements['textMultiLikeAnd'].text
			end
			if xml_element.elements['endTimeGreaterThanOrEqual'] != nil
				self.end_time_greater_than_or_equal = xml_element.elements['endTimeGreaterThanOrEqual'].text
			end
			if xml_element.elements['endTimeLessThanOrEqual'] != nil
				self.end_time_less_than_or_equal = xml_element.elements['endTimeLessThanOrEqual'].text
			end
			if xml_element.elements['durationGreaterThanOrEqual'] != nil
				self.duration_greater_than_or_equal = xml_element.elements['durationGreaterThanOrEqual'].text
			end
			if xml_element.elements['durationLessThanOrEqual'] != nil
				self.duration_less_than_or_equal = xml_element.elements['durationLessThanOrEqual'].text
			end
			if xml_element.elements['isPublicEqual'] != nil
				self.is_public_equal = xml_element.elements['isPublicEqual'].text
			end
		end

	end

	class KalturaAnnotationFilter < KalturaAnnotationBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Annotation service - Video Annotation
	class KalturaAnnotationService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Allows you to add an annotation object associated with an entry
		# @return [KalturaAnnotation]
		def add(annotation)
			kparams = {}
			client.add_param(kparams, 'annotation', annotation)
			client.queue_service_action_call('annotation_annotation', 'add', 'KalturaAnnotation', kparams)
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
			client.queue_service_action_call('annotation_annotation', 'addFromBulk', 'KalturaCuePointListResponse', kparams, kfiles)
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
			client.queue_service_action_call('annotation_annotation', 'clone', 'KalturaCuePoint', kparams)
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
			client.queue_service_action_call('annotation_annotation', 'count', 'int', kparams)
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
			client.queue_service_action_call('annotation_annotation', 'delete', '', kparams)
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
			client.queue_service_action_call('annotation_annotation', 'get', 'KalturaCuePoint', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List annotation objects by filter and pager
		# @return [KalturaAnnotationListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('annotation_annotation', 'list', 'KalturaAnnotationListResponse', kparams)
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
			client.queue_service_action_call('annotation_annotation', 'serveBulk', 'file', kparams)
			return client.get_serve_url()
		end

		# Update annotation by id
		# @return [KalturaAnnotation]
		def update(id, annotation)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'annotation', annotation)
			client.queue_service_action_call('annotation_annotation', 'update', 'KalturaAnnotation', kparams)
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
			client.queue_service_action_call('annotation_annotation', 'updateStatus', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :annotation_service
		def annotation_service
			if (@annotation_service == nil)
				@annotation_service = KalturaAnnotationService.new(self)
			end
			return @annotation_service
		end
		
	end

end
