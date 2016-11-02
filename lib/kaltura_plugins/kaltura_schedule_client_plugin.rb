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
# Copyright (C) 2006-2016  Kaltura Inc.
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

	class KalturaScheduleEventClassificationType
		PUBLIC_EVENT = 1
		PRIVATE_EVENT = 2
		CONFIDENTIAL_EVENT = 3
	end

	class KalturaScheduleEventRecurrenceType
		NONE = 0
		RECURRING = 1
		RECURRENCE = 2
	end

	class KalturaScheduleEventStatus
		CANCELLED = 1
		ACTIVE = 2
		DELETED = 3
	end

	class KalturaScheduleEventType
		RECORD = 1
		LIVE_STREAM = 2
	end

	class KalturaScheduleResourceStatus
		DISABLED = 1
		ACTIVE = 2
		DELETED = 3
	end

	class KalturaCameraScheduleResourceOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaEntryScheduleEventOrderBy
		CREATED_AT_ASC = "+createdAt"
		END_DATE_ASC = "+endDate"
		PRIORITY_ASC = "+priority"
		START_DATE_ASC = "+startDate"
		SUMMARY_ASC = "+summary"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		END_DATE_DESC = "-endDate"
		PRIORITY_DESC = "-priority"
		START_DATE_DESC = "-startDate"
		SUMMARY_DESC = "-summary"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaLiveEntryScheduleResourceOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaLiveStreamScheduleEventOrderBy
		CREATED_AT_ASC = "+createdAt"
		END_DATE_ASC = "+endDate"
		PRIORITY_ASC = "+priority"
		START_DATE_ASC = "+startDate"
		SUMMARY_ASC = "+summary"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		END_DATE_DESC = "-endDate"
		PRIORITY_DESC = "-priority"
		START_DATE_DESC = "-startDate"
		SUMMARY_DESC = "-summary"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaLocationScheduleResourceOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaRecordScheduleEventOrderBy
		CREATED_AT_ASC = "+createdAt"
		END_DATE_ASC = "+endDate"
		PRIORITY_ASC = "+priority"
		START_DATE_ASC = "+startDate"
		SUMMARY_ASC = "+summary"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		END_DATE_DESC = "-endDate"
		PRIORITY_DESC = "-priority"
		START_DATE_DESC = "-startDate"
		SUMMARY_DESC = "-summary"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaScheduleEventOrderBy
		CREATED_AT_ASC = "+createdAt"
		END_DATE_ASC = "+endDate"
		PRIORITY_ASC = "+priority"
		START_DATE_ASC = "+startDate"
		SUMMARY_ASC = "+summary"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		END_DATE_DESC = "-endDate"
		PRIORITY_DESC = "-priority"
		START_DATE_DESC = "-startDate"
		SUMMARY_DESC = "-summary"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaScheduleEventRecurrenceDay
		FRIDAY = "FR"
		MONDAY = "MO"
		SATURDAY = "SA"
		SUNDAY = "SU"
		THURSDAY = "TH"
		TUESDAY = "TU"
		WEDNESDAY = "WE"
	end

	class KalturaScheduleEventRecurrenceFrequency
		DAILY = "days"
		HOURLY = "hours"
		MINUTELY = "minutes"
		MONTHLY = "months"
		SECONDLY = "seconds"
		WEEKLY = "weeks"
		YEARLY = "years"
	end

	class KalturaScheduleEventResourceOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaScheduleResourceOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaScheduleEventRecurrence < KalturaObjectBase
		attr_accessor :name
		attr_accessor :frequency
		attr_accessor :until
		attr_accessor :count
		attr_accessor :interval
		# Comma separated numbers between 0 to 59
		attr_accessor :by_second
		# Comma separated numbers between 0 to 59
		attr_accessor :by_minute
		# Comma separated numbers between 0 to 23
		attr_accessor :by_hour
		# Comma separated of KalturaScheduleEventRecurrenceDay
		# 	 Each byDay value can also be preceded by a positive (+n) or negative (-n) integer.
		# 	 If present, this indicates the nth occurrence of the specific day within the MONTHLY or YEARLY RRULE.
		# 	 For example, within a MONTHLY rule, +1MO (or simply 1MO) represents the first Monday within the month, whereas -1MO represents the last Monday of the month.
		# 	 If an integer modifier is not present, it means all days of this type within the specified frequency.
		# 	 For example, within a MONTHLY rule, MO represents all Mondays within the month.
		attr_accessor :by_day
		# Comma separated of numbers between -31 to 31, excluding 0.
		# 	 For example, -10 represents the tenth to the last day of the month.
		attr_accessor :by_month_day
		# Comma separated of numbers between -366 to 366, excluding 0.
		# 	 For example, -1 represents the last day of the year (December 31st) and -306 represents the 306th to the last day of the year (March 1st).
		attr_accessor :by_year_day
		# Comma separated of numbers between -53 to 53, excluding 0.
		# 	 This corresponds to weeks according to week numbering.
		# 	 A week is defined as a seven day period, starting on the day of the week defined to be the week start.
		# 	 Week number one of the calendar year is the first week which contains at least four (4) days in that calendar year.
		# 	 This rule part is only valid for YEARLY frequency.
		# 	 For example, 3 represents the third week of the year.
		attr_accessor :by_week_number
		# Comma separated numbers between 1 to 12
		attr_accessor :by_month
		# Comma separated of numbers between -366 to 366, excluding 0.
		# 	 Corresponds to the nth occurrence within the set of events specified by the rule.
		# 	 It must only be used in conjunction with another byrule part.
		# 	 For example "the last work day of the month" could be represented as: frequency=MONTHLY;byDay=MO,TU,WE,TH,FR;byOffset=-1
		# 	 Each byOffset value can include a positive (+n) or negative (-n) integer.
		# 	 If present, this indicates the nth occurrence of the specific occurrence within the set of events specified by the rule.
		attr_accessor :by_offset
		attr_accessor :week_start_day

		def until=(val)
			@until = val.to_i
		end
		def count=(val)
			@count = val.to_i
		end
		def interval=(val)
			@interval = val.to_i
		end

		def from_xml(xml_element)
			super
			self.name = xml_element.elements['name'].text
			self.frequency = xml_element.elements['frequency'].text
			self.until = xml_element.elements['until'].text
			self.count = xml_element.elements['count'].text
			self.interval = xml_element.elements['interval'].text
			self.by_second = xml_element.elements['bySecond'].text
			self.by_minute = xml_element.elements['byMinute'].text
			self.by_hour = xml_element.elements['byHour'].text
			self.by_day = xml_element.elements['byDay'].text
			self.by_month_day = xml_element.elements['byMonthDay'].text
			self.by_year_day = xml_element.elements['byYearDay'].text
			self.by_week_number = xml_element.elements['byWeekNumber'].text
			self.by_month = xml_element.elements['byMonth'].text
			self.by_offset = xml_element.elements['byOffset'].text
			self.week_start_day = xml_element.elements['weekStartDay'].text
		end

	end

	class KalturaScheduleEvent < KalturaObjectBase
		# Auto-generated unique identifier
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :parent_id
		# Defines a short summary or subject for the event
		attr_accessor :summary
		attr_accessor :description
		attr_accessor :status
		attr_accessor :start_date
		attr_accessor :end_date
		attr_accessor :reference_id
		attr_accessor :classification_type
		# Specifies the global position for the activity
		attr_accessor :geo_latitude
		# Specifies the global position for the activity
		attr_accessor :geo_longitude
		# Defines the intended venue for the activity
		attr_accessor :location
		attr_accessor :organizer
		attr_accessor :owner_id
		# The value for the priority field.
		attr_accessor :priority
		# Defines the revision sequence number.
		attr_accessor :sequence
		attr_accessor :recurrence_type
		# Duration in seconds
		attr_accessor :duration
		# Used to represent contact information or alternately a reference to contact information.
		attr_accessor :contact
		# Specifies non-processing information intended to provide a comment to the calendar user.
		attr_accessor :comment
		attr_accessor :tags
		# Creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Last update as Unix timestamp (In seconds)
		attr_accessor :updated_at
		attr_accessor :recurrence

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def parent_id=(val)
			@parent_id = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def start_date=(val)
			@start_date = val.to_i
		end
		def end_date=(val)
			@end_date = val.to_i
		end
		def classification_type=(val)
			@classification_type = val.to_i
		end
		def geo_latitude=(val)
			@geo_latitude = val.to_f
		end
		def geo_longitude=(val)
			@geo_longitude = val.to_f
		end
		def priority=(val)
			@priority = val.to_i
		end
		def sequence=(val)
			@sequence = val.to_i
		end
		def recurrence_type=(val)
			@recurrence_type = val.to_i
		end
		def duration=(val)
			@duration = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.parent_id = xml_element.elements['parentId'].text
			self.summary = xml_element.elements['summary'].text
			self.description = xml_element.elements['description'].text
			self.status = xml_element.elements['status'].text
			self.start_date = xml_element.elements['startDate'].text
			self.end_date = xml_element.elements['endDate'].text
			self.reference_id = xml_element.elements['referenceId'].text
			self.classification_type = xml_element.elements['classificationType'].text
			self.geo_latitude = xml_element.elements['geoLatitude'].text
			self.geo_longitude = xml_element.elements['geoLongitude'].text
			self.location = xml_element.elements['location'].text
			self.organizer = xml_element.elements['organizer'].text
			self.owner_id = xml_element.elements['ownerId'].text
			self.priority = xml_element.elements['priority'].text
			self.sequence = xml_element.elements['sequence'].text
			self.recurrence_type = xml_element.elements['recurrenceType'].text
			self.duration = xml_element.elements['duration'].text
			self.contact = xml_element.elements['contact'].text
			self.comment = xml_element.elements['comment'].text
			self.tags = xml_element.elements['tags'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.recurrence = KalturaClientBase.object_from_xml(xml_element.elements['recurrence'], 'KalturaScheduleEventRecurrence')
		end

	end

	class KalturaScheduleEventResource < KalturaObjectBase
		attr_accessor :event_id
		attr_accessor :resource_id
		attr_accessor :partner_id
		# Creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Last update as Unix timestamp (In seconds)
		attr_accessor :updated_at

		def event_id=(val)
			@event_id = val.to_i
		end
		def resource_id=(val)
			@resource_id = val.to_i
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

		def from_xml(xml_element)
			super
			self.event_id = xml_element.elements['eventId'].text
			self.resource_id = xml_element.elements['resourceId'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
		end

	end

	class KalturaScheduleResource < KalturaObjectBase
		# Auto-generated unique identifier
		attr_accessor :id
		attr_accessor :parent_id
		attr_accessor :partner_id
		# Defines a short name
		attr_accessor :name
		# Defines a unique system-name
		attr_accessor :system_name
		attr_accessor :description
		attr_accessor :status
		attr_accessor :tags
		# Creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Last update as Unix timestamp (In seconds)
		attr_accessor :updated_at

		def id=(val)
			@id = val.to_i
		end
		def parent_id=(val)
			@parent_id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.parent_id = xml_element.elements['parentId'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.name = xml_element.elements['name'].text
			self.system_name = xml_element.elements['systemName'].text
			self.description = xml_element.elements['description'].text
			self.status = xml_element.elements['status'].text
			self.tags = xml_element.elements['tags'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
		end

	end

	class KalturaCameraScheduleResource < KalturaScheduleResource
		# URL of the stream
		attr_accessor :stream_url


		def from_xml(xml_element)
			super
			self.stream_url = xml_element.elements['streamUrl'].text
		end

	end

	class KalturaEntryScheduleEvent < KalturaScheduleEvent
		# Entry to be used as template during content ingestion
		attr_accessor :template_entry_id
		# Entries that associated with this event
		attr_accessor :entry_ids
		# Categories that associated with this event
		attr_accessor :category_ids


		def from_xml(xml_element)
			super
			self.template_entry_id = xml_element.elements['templateEntryId'].text
			self.entry_ids = xml_element.elements['entryIds'].text
			self.category_ids = xml_element.elements['categoryIds'].text
		end

	end

	class KalturaLiveEntryScheduleResource < KalturaScheduleResource
		attr_accessor :entry_id


		def from_xml(xml_element)
			super
			self.entry_id = xml_element.elements['entryId'].text
		end

	end

	class KalturaLocationScheduleResource < KalturaScheduleResource


		def from_xml(xml_element)
			super
		end

	end

	class KalturaScheduleEventListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaScheduleEvent')
		end

	end

	class KalturaScheduleEventResourceListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaScheduleEventResource')
		end

	end

	class KalturaScheduleResourceListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaScheduleResource')
		end

	end

	class KalturaLiveStreamScheduleEvent < KalturaEntryScheduleEvent


		def from_xml(xml_element)
			super
		end

	end

	class KalturaRecordScheduleEvent < KalturaEntryScheduleEvent


		def from_xml(xml_element)
			super
		end

	end

	class KalturaScheduleEventBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :id_not_in
		attr_accessor :parent_id_equal
		attr_accessor :parent_id_in
		attr_accessor :parent_id_not_in
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :start_date_greater_than_or_equal
		attr_accessor :start_date_less_than_or_equal
		attr_accessor :end_date_greater_than_or_equal
		attr_accessor :end_date_less_than_or_equal
		attr_accessor :reference_id_equal
		attr_accessor :reference_id_in
		attr_accessor :owner_id_equal
		attr_accessor :owner_id_in
		attr_accessor :priority_equal
		attr_accessor :priority_in
		attr_accessor :priority_greater_than_or_equal
		attr_accessor :priority_less_than_or_equal
		attr_accessor :recurrence_type_equal
		attr_accessor :recurrence_type_in
		attr_accessor :tags_like
		attr_accessor :tags_multi_like_or
		attr_accessor :tags_multi_like_and
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def parent_id_equal=(val)
			@parent_id_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end
		def start_date_greater_than_or_equal=(val)
			@start_date_greater_than_or_equal = val.to_i
		end
		def start_date_less_than_or_equal=(val)
			@start_date_less_than_or_equal = val.to_i
		end
		def end_date_greater_than_or_equal=(val)
			@end_date_greater_than_or_equal = val.to_i
		end
		def end_date_less_than_or_equal=(val)
			@end_date_less_than_or_equal = val.to_i
		end
		def priority_equal=(val)
			@priority_equal = val.to_i
		end
		def priority_greater_than_or_equal=(val)
			@priority_greater_than_or_equal = val.to_i
		end
		def priority_less_than_or_equal=(val)
			@priority_less_than_or_equal = val.to_i
		end
		def recurrence_type_equal=(val)
			@recurrence_type_equal = val.to_i
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

		def from_xml(xml_element)
			super
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.id_not_in = xml_element.elements['idNotIn'].text
			self.parent_id_equal = xml_element.elements['parentIdEqual'].text
			self.parent_id_in = xml_element.elements['parentIdIn'].text
			self.parent_id_not_in = xml_element.elements['parentIdNotIn'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.start_date_greater_than_or_equal = xml_element.elements['startDateGreaterThanOrEqual'].text
			self.start_date_less_than_or_equal = xml_element.elements['startDateLessThanOrEqual'].text
			self.end_date_greater_than_or_equal = xml_element.elements['endDateGreaterThanOrEqual'].text
			self.end_date_less_than_or_equal = xml_element.elements['endDateLessThanOrEqual'].text
			self.reference_id_equal = xml_element.elements['referenceIdEqual'].text
			self.reference_id_in = xml_element.elements['referenceIdIn'].text
			self.owner_id_equal = xml_element.elements['ownerIdEqual'].text
			self.owner_id_in = xml_element.elements['ownerIdIn'].text
			self.priority_equal = xml_element.elements['priorityEqual'].text
			self.priority_in = xml_element.elements['priorityIn'].text
			self.priority_greater_than_or_equal = xml_element.elements['priorityGreaterThanOrEqual'].text
			self.priority_less_than_or_equal = xml_element.elements['priorityLessThanOrEqual'].text
			self.recurrence_type_equal = xml_element.elements['recurrenceTypeEqual'].text
			self.recurrence_type_in = xml_element.elements['recurrenceTypeIn'].text
			self.tags_like = xml_element.elements['tagsLike'].text
			self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
		end

	end

	class KalturaScheduleEventResourceBaseFilter < KalturaRelatedFilter
		attr_accessor :event_id_equal
		attr_accessor :event_id_in
		attr_accessor :resource_id_equal
		attr_accessor :resource_id_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal

		def event_id_equal=(val)
			@event_id_equal = val.to_i
		end
		def resource_id_equal=(val)
			@resource_id_equal = val.to_i
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

		def from_xml(xml_element)
			super
			self.event_id_equal = xml_element.elements['eventIdEqual'].text
			self.event_id_in = xml_element.elements['eventIdIn'].text
			self.resource_id_equal = xml_element.elements['resourceIdEqual'].text
			self.resource_id_in = xml_element.elements['resourceIdIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
		end

	end

	class KalturaScheduleResourceBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :id_not_in
		attr_accessor :parent_id_equal
		attr_accessor :parent_id_in
		attr_accessor :system_name_equal
		attr_accessor :system_name_in
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :tags_like
		attr_accessor :tags_multi_like_or
		attr_accessor :tags_multi_like_and
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def parent_id_equal=(val)
			@parent_id_equal = val.to_i
		end
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

		def from_xml(xml_element)
			super
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.id_not_in = xml_element.elements['idNotIn'].text
			self.parent_id_equal = xml_element.elements['parentIdEqual'].text
			self.parent_id_in = xml_element.elements['parentIdIn'].text
			self.system_name_equal = xml_element.elements['systemNameEqual'].text
			self.system_name_in = xml_element.elements['systemNameIn'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.tags_like = xml_element.elements['tagsLike'].text
			self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
		end

	end

	class KalturaScheduleEventFilter < KalturaScheduleEventBaseFilter
		attr_accessor :resource_ids_like
		attr_accessor :resource_ids_multi_like_or
		attr_accessor :resource_ids_multi_like_and
		attr_accessor :parent_resource_ids_like
		attr_accessor :parent_resource_ids_multi_like_or
		attr_accessor :parent_resource_ids_multi_like_and
		attr_accessor :template_entry_categories_ids_multi_like_and
		attr_accessor :template_entry_categories_ids_multi_like_or
		attr_accessor :resource_system_names_multi_like_or
		attr_accessor :template_entry_categories_ids_like
		attr_accessor :resource_system_names_multi_like_and
		attr_accessor :resource_system_names_like


		def from_xml(xml_element)
			super
			self.resource_ids_like = xml_element.elements['resourceIdsLike'].text
			self.resource_ids_multi_like_or = xml_element.elements['resourceIdsMultiLikeOr'].text
			self.resource_ids_multi_like_and = xml_element.elements['resourceIdsMultiLikeAnd'].text
			self.parent_resource_ids_like = xml_element.elements['parentResourceIdsLike'].text
			self.parent_resource_ids_multi_like_or = xml_element.elements['parentResourceIdsMultiLikeOr'].text
			self.parent_resource_ids_multi_like_and = xml_element.elements['parentResourceIdsMultiLikeAnd'].text
			self.template_entry_categories_ids_multi_like_and = xml_element.elements['templateEntryCategoriesIdsMultiLikeAnd'].text
			self.template_entry_categories_ids_multi_like_or = xml_element.elements['templateEntryCategoriesIdsMultiLikeOr'].text
			self.resource_system_names_multi_like_or = xml_element.elements['resourceSystemNamesMultiLikeOr'].text
			self.template_entry_categories_ids_like = xml_element.elements['templateEntryCategoriesIdsLike'].text
			self.resource_system_names_multi_like_and = xml_element.elements['resourceSystemNamesMultiLikeAnd'].text
			self.resource_system_names_like = xml_element.elements['resourceSystemNamesLike'].text
		end

	end

	class KalturaScheduleEventResourceFilter < KalturaScheduleEventResourceBaseFilter
		# Find event-resource objects that associated with the event, if none found, find by its parent event
		attr_accessor :event_id_or_its_parent_id_equal

		def event_id_or_its_parent_id_equal=(val)
			@event_id_or_its_parent_id_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			self.event_id_or_its_parent_id_equal = xml_element.elements['eventIdOrItsParentIdEqual'].text
		end

	end

	class KalturaScheduleResourceFilter < KalturaScheduleResourceBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaCameraScheduleResourceBaseFilter < KalturaScheduleResourceFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaEntryScheduleEventBaseFilter < KalturaScheduleEventFilter
		attr_accessor :template_entry_id_equal
		attr_accessor :entry_ids_like
		attr_accessor :entry_ids_multi_like_or
		attr_accessor :entry_ids_multi_like_and
		attr_accessor :category_ids_like
		attr_accessor :category_ids_multi_like_or
		attr_accessor :category_ids_multi_like_and


		def from_xml(xml_element)
			super
			self.template_entry_id_equal = xml_element.elements['templateEntryIdEqual'].text
			self.entry_ids_like = xml_element.elements['entryIdsLike'].text
			self.entry_ids_multi_like_or = xml_element.elements['entryIdsMultiLikeOr'].text
			self.entry_ids_multi_like_and = xml_element.elements['entryIdsMultiLikeAnd'].text
			self.category_ids_like = xml_element.elements['categoryIdsLike'].text
			self.category_ids_multi_like_or = xml_element.elements['categoryIdsMultiLikeOr'].text
			self.category_ids_multi_like_and = xml_element.elements['categoryIdsMultiLikeAnd'].text
		end

	end

	class KalturaLiveEntryScheduleResourceBaseFilter < KalturaScheduleResourceFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaLocationScheduleResourceBaseFilter < KalturaScheduleResourceFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaCameraScheduleResourceFilter < KalturaCameraScheduleResourceBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaEntryScheduleEventFilter < KalturaEntryScheduleEventBaseFilter
		attr_accessor :parent_category_ids_like
		attr_accessor :parent_category_ids_multi_like_or
		attr_accessor :parent_category_ids_multi_like_and


		def from_xml(xml_element)
			super
			self.parent_category_ids_like = xml_element.elements['parentCategoryIdsLike'].text
			self.parent_category_ids_multi_like_or = xml_element.elements['parentCategoryIdsMultiLikeOr'].text
			self.parent_category_ids_multi_like_and = xml_element.elements['parentCategoryIdsMultiLikeAnd'].text
		end

	end

	class KalturaLiveEntryScheduleResourceFilter < KalturaLiveEntryScheduleResourceBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaLocationScheduleResourceFilter < KalturaLocationScheduleResourceBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaLiveStreamScheduleEventBaseFilter < KalturaEntryScheduleEventFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaRecordScheduleEventBaseFilter < KalturaEntryScheduleEventFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaLiveStreamScheduleEventFilter < KalturaLiveStreamScheduleEventBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaRecordScheduleEventFilter < KalturaRecordScheduleEventBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# The ScheduleEvent service enables you to create and manage (update, delete, retrieve, etc.) scheduled recording events.
	class KalturaScheduleEventService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Allows you to add a new KalturaScheduleEvent object
		def add(schedule_event)
			kparams = {}
			client.add_param(kparams, 'scheduleEvent', schedule_event)
			client.queue_service_action_call('schedule_scheduleevent', 'add', 'KalturaScheduleEvent', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a KalturaScheduleEvent object by ID
		def get(schedule_event_id)
			kparams = {}
			client.add_param(kparams, 'scheduleEventId', schedule_event_id)
			client.queue_service_action_call('schedule_scheduleevent', 'get', 'KalturaScheduleEvent', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing KalturaScheduleEvent object
		def update(schedule_event_id, schedule_event)
			kparams = {}
			client.add_param(kparams, 'scheduleEventId', schedule_event_id)
			client.add_param(kparams, 'scheduleEvent', schedule_event)
			client.queue_service_action_call('schedule_scheduleevent', 'update', 'KalturaScheduleEvent', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Mark the KalturaScheduleEvent object as deleted
		def delete(schedule_event_id)
			kparams = {}
			client.add_param(kparams, 'scheduleEventId', schedule_event_id)
			client.queue_service_action_call('schedule_scheduleevent', 'delete', 'KalturaScheduleEvent', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Mark the KalturaScheduleEvent object as cancelled
		def cancel(schedule_event_id)
			kparams = {}
			client.add_param(kparams, 'scheduleEventId', schedule_event_id)
			client.queue_service_action_call('schedule_scheduleevent', 'cancel', 'KalturaScheduleEvent', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List KalturaScheduleEvent objects
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('schedule_scheduleevent', 'list', 'KalturaScheduleEventListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Add new bulk upload batch job
		def add_from_bulk_upload(file_data, bulk_upload_data=KalturaNotImplemented)
			kparams = {}
			kfiles = {}
			client.add_param(kfiles, 'fileData', file_data)
			client.add_param(kparams, 'bulkUploadData', bulk_upload_data)
			client.queue_service_action_call('schedule_scheduleevent', 'addFromBulkUpload', 'KalturaBulkUpload', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# The ScheduleResource service enables you to create and manage (update, delete, retrieve, etc.) the resources required for scheduled events (cameras, capture devices, etc.).
	class KalturaScheduleResourceService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Allows you to add a new KalturaScheduleResource object
		def add(schedule_resource)
			kparams = {}
			client.add_param(kparams, 'scheduleResource', schedule_resource)
			client.queue_service_action_call('schedule_scheduleresource', 'add', 'KalturaScheduleResource', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a KalturaScheduleResource object by ID
		def get(schedule_resource_id)
			kparams = {}
			client.add_param(kparams, 'scheduleResourceId', schedule_resource_id)
			client.queue_service_action_call('schedule_scheduleresource', 'get', 'KalturaScheduleResource', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing KalturaScheduleResource object
		def update(schedule_resource_id, schedule_resource)
			kparams = {}
			client.add_param(kparams, 'scheduleResourceId', schedule_resource_id)
			client.add_param(kparams, 'scheduleResource', schedule_resource)
			client.queue_service_action_call('schedule_scheduleresource', 'update', 'KalturaScheduleResource', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Mark the KalturaScheduleResource object as deleted
		def delete(schedule_resource_id)
			kparams = {}
			client.add_param(kparams, 'scheduleResourceId', schedule_resource_id)
			client.queue_service_action_call('schedule_scheduleresource', 'delete', 'KalturaScheduleResource', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List KalturaScheduleResource objects
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('schedule_scheduleresource', 'list', 'KalturaScheduleResourceListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Add new bulk upload batch job
		def add_from_bulk_upload(file_data, bulk_upload_data=KalturaNotImplemented)
			kparams = {}
			kfiles = {}
			client.add_param(kfiles, 'fileData', file_data)
			client.add_param(kparams, 'bulkUploadData', bulk_upload_data)
			client.queue_service_action_call('schedule_scheduleresource', 'addFromBulkUpload', 'KalturaBulkUpload', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# The ScheduleEventResource service enables you create and manage (update, delete, retrieve, etc.) the connections between recording events and the resources required for these events (cameras, capture devices, etc.).
	class KalturaScheduleEventResourceService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Allows you to add a new KalturaScheduleEventResource object
		def add(schedule_event_resource)
			kparams = {}
			client.add_param(kparams, 'scheduleEventResource', schedule_event_resource)
			client.queue_service_action_call('schedule_scheduleeventresource', 'add', 'KalturaScheduleEventResource', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a KalturaScheduleEventResource object by ID
		def get(schedule_event_id, schedule_resource_id)
			kparams = {}
			client.add_param(kparams, 'scheduleEventId', schedule_event_id)
			client.add_param(kparams, 'scheduleResourceId', schedule_resource_id)
			client.queue_service_action_call('schedule_scheduleeventresource', 'get', 'KalturaScheduleEventResource', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing KalturaScheduleEventResource object
		def update(schedule_event_id, schedule_resource_id, schedule_event_resource)
			kparams = {}
			client.add_param(kparams, 'scheduleEventId', schedule_event_id)
			client.add_param(kparams, 'scheduleResourceId', schedule_resource_id)
			client.add_param(kparams, 'scheduleEventResource', schedule_event_resource)
			client.queue_service_action_call('schedule_scheduleeventresource', 'update', 'KalturaScheduleEventResource', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Mark the KalturaScheduleEventResource object as deleted
		def delete(schedule_event_id, schedule_resource_id)
			kparams = {}
			client.add_param(kparams, 'scheduleEventId', schedule_event_id)
			client.add_param(kparams, 'scheduleResourceId', schedule_resource_id)
			client.queue_service_action_call('schedule_scheduleeventresource', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List KalturaScheduleEventResource objects
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('schedule_scheduleeventresource', 'list', 'KalturaScheduleEventResourceListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :schedule_event_service
		def schedule_event_service
			if (@schedule_event_service == nil)
				@schedule_event_service = KalturaScheduleEventService.new(self)
			end
			return @schedule_event_service
		end
		
		attr_reader :schedule_resource_service
		def schedule_resource_service
			if (@schedule_resource_service == nil)
				@schedule_resource_service = KalturaScheduleResourceService.new(self)
			end
			return @schedule_resource_service
		end
		
		attr_reader :schedule_event_resource_service
		def schedule_event_resource_service
			if (@schedule_event_resource_service == nil)
				@schedule_event_resource_service = KalturaScheduleEventResourceService.new(self)
			end
			return @schedule_event_resource_service
		end
		
	end

end
