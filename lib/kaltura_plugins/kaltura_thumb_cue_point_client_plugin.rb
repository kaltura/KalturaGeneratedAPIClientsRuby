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

	class KalturaThumbCuePointOrderBy
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

	class KalturaTimedThumbAssetOrderBy
		CREATED_AT_ASC = "+createdAt"
		DELETED_AT_ASC = "+deletedAt"
		SIZE_ASC = "+size"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		DELETED_AT_DESC = "-deletedAt"
		SIZE_DESC = "-size"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaThumbCuePoint < KalturaCuePoint
		attr_accessor :asset_id
		attr_accessor :description
		attr_accessor :title
		# The sub type of the ThumbCuePoint
		attr_accessor :sub_type

		def sub_type=(val)
			@sub_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['assetId'] != nil
				self.asset_id = xml_element.elements['assetId'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['title'] != nil
				self.title = xml_element.elements['title'].text
			end
			if xml_element.elements['subType'] != nil
				self.sub_type = xml_element.elements['subType'].text
			end
		end

	end

	class KalturaTimedThumbAsset < KalturaThumbAsset
		# Associated thumb cue point ID
		attr_accessor :cue_point_id


		def from_xml(xml_element)
			super
			if xml_element.elements['cuePointId'] != nil
				self.cue_point_id = xml_element.elements['cuePointId'].text
			end
		end

	end

	class KalturaThumbCuePointBaseFilter < KalturaCuePointFilter
		attr_accessor :description_like
		attr_accessor :description_multi_like_or
		attr_accessor :description_multi_like_and
		attr_accessor :title_like
		attr_accessor :title_multi_like_or
		attr_accessor :title_multi_like_and
		attr_accessor :sub_type_equal
		attr_accessor :sub_type_in

		def sub_type_equal=(val)
			@sub_type_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['descriptionLike'] != nil
				self.description_like = xml_element.elements['descriptionLike'].text
			end
			if xml_element.elements['descriptionMultiLikeOr'] != nil
				self.description_multi_like_or = xml_element.elements['descriptionMultiLikeOr'].text
			end
			if xml_element.elements['descriptionMultiLikeAnd'] != nil
				self.description_multi_like_and = xml_element.elements['descriptionMultiLikeAnd'].text
			end
			if xml_element.elements['titleLike'] != nil
				self.title_like = xml_element.elements['titleLike'].text
			end
			if xml_element.elements['titleMultiLikeOr'] != nil
				self.title_multi_like_or = xml_element.elements['titleMultiLikeOr'].text
			end
			if xml_element.elements['titleMultiLikeAnd'] != nil
				self.title_multi_like_and = xml_element.elements['titleMultiLikeAnd'].text
			end
			if xml_element.elements['subTypeEqual'] != nil
				self.sub_type_equal = xml_element.elements['subTypeEqual'].text
			end
			if xml_element.elements['subTypeIn'] != nil
				self.sub_type_in = xml_element.elements['subTypeIn'].text
			end
		end

	end

	class KalturaThumbCuePointFilter < KalturaThumbCuePointBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaTimedThumbAssetBaseFilter < KalturaThumbAssetFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaTimedThumbAssetFilter < KalturaTimedThumbAssetBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
