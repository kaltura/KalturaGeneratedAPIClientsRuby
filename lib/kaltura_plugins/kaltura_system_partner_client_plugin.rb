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

	class KalturaSystemPartnerUsageItem < KalturaObjectBase
		# Partner ID
		attr_accessor :partner_id
		# Partner name
		attr_accessor :partner_name
		# Partner status
		attr_accessor :partner_status
		# Partner package
		attr_accessor :partner_package
		# Partner creation date (Unix timestamp)
		attr_accessor :partner_created_at
		# Number of player loads in the specific date range
		attr_accessor :views
		# Number of plays in the specific date range
		attr_accessor :plays
		# Number of new entries created during specific date range
		attr_accessor :entries_count
		# Total number of entries
		attr_accessor :total_entries_count
		# Number of new video entries created during specific date range
		attr_accessor :video_entries_count
		# Number of new image entries created during specific date range
		attr_accessor :image_entries_count
		# Number of new audio entries created during specific date range
		attr_accessor :audio_entries_count
		# Number of new mix entries created during specific date range
		attr_accessor :mix_entries_count
		# The total bandwidth usage during the given date range (in MB)
		attr_accessor :bandwidth
		# The total storage consumption (in MB)
		attr_accessor :total_storage
		# The change in storage consumption (new uploads) during the given date range (in MB)
		attr_accessor :storage
		# The peak amount of storage consumption during the given date range for the specific publisher
		attr_accessor :peak_storage
		# The average amount of storage consumption during the given date range for the specific publisher
		attr_accessor :avg_storage
		# The combined amount of bandwidth and storage consumed during the given date range for the specific publisher
		attr_accessor :combined_bandwidth_storage
		# Amount of deleted storage in MB
		attr_accessor :deleted_storage
		# Amount of transcoding usage in MB
		attr_accessor :transcoding_usage

		def partner_id=(val)
			@partner_id = val.to_i
		end
		def partner_status=(val)
			@partner_status = val.to_i
		end
		def partner_package=(val)
			@partner_package = val.to_i
		end
		def partner_created_at=(val)
			@partner_created_at = val.to_i
		end
		def views=(val)
			@views = val.to_i
		end
		def plays=(val)
			@plays = val.to_i
		end
		def entries_count=(val)
			@entries_count = val.to_i
		end
		def total_entries_count=(val)
			@total_entries_count = val.to_i
		end
		def video_entries_count=(val)
			@video_entries_count = val.to_i
		end
		def image_entries_count=(val)
			@image_entries_count = val.to_i
		end
		def audio_entries_count=(val)
			@audio_entries_count = val.to_i
		end
		def mix_entries_count=(val)
			@mix_entries_count = val.to_i
		end
		def bandwidth=(val)
			@bandwidth = val.to_f
		end
		def total_storage=(val)
			@total_storage = val.to_f
		end
		def storage=(val)
			@storage = val.to_f
		end
		def peak_storage=(val)
			@peak_storage = val.to_f
		end
		def avg_storage=(val)
			@avg_storage = val.to_f
		end
		def combined_bandwidth_storage=(val)
			@combined_bandwidth_storage = val.to_f
		end
		def deleted_storage=(val)
			@deleted_storage = val.to_f
		end
		def transcoding_usage=(val)
			@transcoding_usage = val.to_f
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['partnerName'] != nil
				self.partner_name = xml_element.elements['partnerName'].text
			end
			if xml_element.elements['partnerStatus'] != nil
				self.partner_status = xml_element.elements['partnerStatus'].text
			end
			if xml_element.elements['partnerPackage'] != nil
				self.partner_package = xml_element.elements['partnerPackage'].text
			end
			if xml_element.elements['partnerCreatedAt'] != nil
				self.partner_created_at = xml_element.elements['partnerCreatedAt'].text
			end
			if xml_element.elements['views'] != nil
				self.views = xml_element.elements['views'].text
			end
			if xml_element.elements['plays'] != nil
				self.plays = xml_element.elements['plays'].text
			end
			if xml_element.elements['entriesCount'] != nil
				self.entries_count = xml_element.elements['entriesCount'].text
			end
			if xml_element.elements['totalEntriesCount'] != nil
				self.total_entries_count = xml_element.elements['totalEntriesCount'].text
			end
			if xml_element.elements['videoEntriesCount'] != nil
				self.video_entries_count = xml_element.elements['videoEntriesCount'].text
			end
			if xml_element.elements['imageEntriesCount'] != nil
				self.image_entries_count = xml_element.elements['imageEntriesCount'].text
			end
			if xml_element.elements['audioEntriesCount'] != nil
				self.audio_entries_count = xml_element.elements['audioEntriesCount'].text
			end
			if xml_element.elements['mixEntriesCount'] != nil
				self.mix_entries_count = xml_element.elements['mixEntriesCount'].text
			end
			if xml_element.elements['bandwidth'] != nil
				self.bandwidth = xml_element.elements['bandwidth'].text
			end
			if xml_element.elements['totalStorage'] != nil
				self.total_storage = xml_element.elements['totalStorage'].text
			end
			if xml_element.elements['storage'] != nil
				self.storage = xml_element.elements['storage'].text
			end
			if xml_element.elements['peakStorage'] != nil
				self.peak_storage = xml_element.elements['peakStorage'].text
			end
			if xml_element.elements['avgStorage'] != nil
				self.avg_storage = xml_element.elements['avgStorage'].text
			end
			if xml_element.elements['combinedBandwidthStorage'] != nil
				self.combined_bandwidth_storage = xml_element.elements['combinedBandwidthStorage'].text
			end
			if xml_element.elements['deletedStorage'] != nil
				self.deleted_storage = xml_element.elements['deletedStorage'].text
			end
			if xml_element.elements['transcodingUsage'] != nil
				self.transcoding_usage = xml_element.elements['transcodingUsage'].text
			end
		end

	end

	class KalturaSystemPartnerUsageFilter < KalturaFilter
		# Date range from
		attr_accessor :from_date
		# Date range to
		attr_accessor :to_date
		# Time zone offset
		attr_accessor :timezone_offset

		def from_date=(val)
			@from_date = val.to_i
		end
		def to_date=(val)
			@to_date = val.to_i
		end
		def timezone_offset=(val)
			@timezone_offset = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['fromDate'] != nil
				self.from_date = xml_element.elements['fromDate'].text
			end
			if xml_element.elements['toDate'] != nil
				self.to_date = xml_element.elements['toDate'].text
			end
			if xml_element.elements['timezoneOffset'] != nil
				self.timezone_offset = xml_element.elements['timezoneOffset'].text
			end
		end

	end

	class KalturaSystemPartnerUsageListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaSystemPartnerUsageItem')
			end
		end

	end

	class KalturaSystemPartnerFilter < KalturaPartnerFilter
		attr_accessor :partner_parent_id_equal
		attr_accessor :partner_parent_id_in

		def partner_parent_id_equal=(val)
			@partner_parent_id_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['partnerParentIdEqual'] != nil
				self.partner_parent_id_equal = xml_element.elements['partnerParentIdEqual'].text
			end
			if xml_element.elements['partnerParentIdIn'] != nil
				self.partner_parent_id_in = xml_element.elements['partnerParentIdIn'].text
			end
		end

	end


	class KalturaClient < KalturaClientBase
	end

end
