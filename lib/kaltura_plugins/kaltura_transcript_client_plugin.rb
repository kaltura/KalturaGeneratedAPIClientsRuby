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
# Copyright (C) 2006-2015  Kaltura Inc.
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
require File.dirname(__FILE__) + '/kaltura_attachment_client_plugin.rb'

module Kaltura

	class KalturaTranscriptAssetOrderBy
		CREATED_AT_ASC = "+createdAt"
		DELETED_AT_ASC = "+deletedAt"
		SIZE_ASC = "+size"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		DELETED_AT_DESC = "-deletedAt"
		SIZE_DESC = "-size"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaTranscriptAsset < KalturaAttachmentAsset
		# The accuracy of the transcript - values between 0 and 1
		# 	 
		attr_accessor :accuracy
		# Was verified by human or machine
		# 	 
		attr_accessor :human_verified
		# The language of the transcript
		# 	 
		attr_accessor :language

		def accuracy=(val)
			@accuracy = val.to_f
		end
		def human_verified=(val)
			@human_verified = val.to_i
		end

		def from_xml(xml_element)
			super
			self.accuracy = xml_element.elements['accuracy'].text
			self.human_verified = xml_element.elements['humanVerified'].text
			self.language = xml_element.elements['language'].text
		end

	end

	class KalturaEntryTranscriptAssetSearchItem < KalturaSearchItem
		attr_accessor :content_like
		attr_accessor :content_multi_like_or
		attr_accessor :content_multi_like_and


		def from_xml(xml_element)
			super
			self.content_like = xml_element.elements['contentLike'].text
			self.content_multi_like_or = xml_element.elements['contentMultiLikeOr'].text
			self.content_multi_like_and = xml_element.elements['contentMultiLikeAnd'].text
		end

	end

	class KalturaTranscriptAssetListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaTranscriptAsset')
		end

	end

	class KalturaTranscriptAssetBaseFilter < KalturaAttachmentAssetFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaTranscriptAssetFilter < KalturaTranscriptAssetBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
