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

	class KalturaDocumentType
		DOCUMENT = 11
		SWF = 12
		PDF = 13
	end

	class KalturaDocumentEntryOrderBy
		CREATED_AT_ASC = "+createdAt"
		END_DATE_ASC = "+endDate"
		MODERATION_COUNT_ASC = "+moderationCount"
		NAME_ASC = "+name"
		PARTNER_SORT_VALUE_ASC = "+partnerSortValue"
		RANK_ASC = "+rank"
		RECENT_ASC = "+recent"
		START_DATE_ASC = "+startDate"
		TOTAL_RANK_ASC = "+totalRank"
		UPDATED_AT_ASC = "+updatedAt"
		WEIGHT_ASC = "+weight"
		CREATED_AT_DESC = "-createdAt"
		END_DATE_DESC = "-endDate"
		MODERATION_COUNT_DESC = "-moderationCount"
		NAME_DESC = "-name"
		PARTNER_SORT_VALUE_DESC = "-partnerSortValue"
		RANK_DESC = "-rank"
		RECENT_DESC = "-recent"
		START_DATE_DESC = "-startDate"
		TOTAL_RANK_DESC = "-totalRank"
		UPDATED_AT_DESC = "-updatedAt"
		WEIGHT_DESC = "-weight"
	end

	class KalturaDocumentFlavorParamsOrderBy
	end

	class KalturaDocumentFlavorParamsOutputOrderBy
	end

	class KalturaImageFlavorParamsOrderBy
	end

	class KalturaImageFlavorParamsOutputOrderBy
	end

	class KalturaPdfFlavorParamsOrderBy
	end

	class KalturaPdfFlavorParamsOutputOrderBy
	end

	class KalturaSwfFlavorParamsOrderBy
	end

	class KalturaSwfFlavorParamsOutputOrderBy
	end

	class KalturaDocumentEntry < KalturaBaseEntry
		# The type of the document
		attr_accessor :document_type
		# Comma separated asset params ids that exists for this media entry
		attr_accessor :asset_params_ids

		def document_type=(val)
			@document_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['documentType'] != nil
				self.document_type = xml_element.elements['documentType'].text
			end
			if xml_element.elements['assetParamsIds'] != nil
				self.asset_params_ids = xml_element.elements['assetParamsIds'].text
			end
		end

	end

	class KalturaDocumentListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaDocumentEntry')
			end
		end

	end

	class KalturaDocumentFlavorParams < KalturaFlavorParams


		def from_xml(xml_element)
			super
		end

	end

	class KalturaImageFlavorParams < KalturaFlavorParams
		attr_accessor :density_width
		attr_accessor :density_height
		attr_accessor :size_width
		attr_accessor :size_height
		attr_accessor :depth

		def density_width=(val)
			@density_width = val.to_i
		end
		def density_height=(val)
			@density_height = val.to_i
		end
		def size_width=(val)
			@size_width = val.to_i
		end
		def size_height=(val)
			@size_height = val.to_i
		end
		def depth=(val)
			@depth = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['densityWidth'] != nil
				self.density_width = xml_element.elements['densityWidth'].text
			end
			if xml_element.elements['densityHeight'] != nil
				self.density_height = xml_element.elements['densityHeight'].text
			end
			if xml_element.elements['sizeWidth'] != nil
				self.size_width = xml_element.elements['sizeWidth'].text
			end
			if xml_element.elements['sizeHeight'] != nil
				self.size_height = xml_element.elements['sizeHeight'].text
			end
			if xml_element.elements['depth'] != nil
				self.depth = xml_element.elements['depth'].text
			end
		end

	end

	class KalturaPdfFlavorParams < KalturaFlavorParams
		attr_accessor :readonly

		def readonly=(val)
			@readonly = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['readonly'] != nil
				self.readonly = xml_element.elements['readonly'].text
			end
		end

	end

	class KalturaSwfFlavorParams < KalturaFlavorParams
		attr_accessor :flash_version
		attr_accessor :poly2bitmap

		def flash_version=(val)
			@flash_version = val.to_i
		end
		def poly2bitmap=(val)
			@poly2bitmap = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['flashVersion'] != nil
				self.flash_version = xml_element.elements['flashVersion'].text
			end
			if xml_element.elements['poly2Bitmap'] != nil
				self.poly2bitmap = xml_element.elements['poly2Bitmap'].text
			end
		end

	end

	class KalturaDocumentFlavorParamsOutput < KalturaFlavorParamsOutput


		def from_xml(xml_element)
			super
		end

	end

	class KalturaImageFlavorParamsOutput < KalturaFlavorParamsOutput
		attr_accessor :density_width
		attr_accessor :density_height
		attr_accessor :size_width
		attr_accessor :size_height
		attr_accessor :depth

		def density_width=(val)
			@density_width = val.to_i
		end
		def density_height=(val)
			@density_height = val.to_i
		end
		def size_width=(val)
			@size_width = val.to_i
		end
		def size_height=(val)
			@size_height = val.to_i
		end
		def depth=(val)
			@depth = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['densityWidth'] != nil
				self.density_width = xml_element.elements['densityWidth'].text
			end
			if xml_element.elements['densityHeight'] != nil
				self.density_height = xml_element.elements['densityHeight'].text
			end
			if xml_element.elements['sizeWidth'] != nil
				self.size_width = xml_element.elements['sizeWidth'].text
			end
			if xml_element.elements['sizeHeight'] != nil
				self.size_height = xml_element.elements['sizeHeight'].text
			end
			if xml_element.elements['depth'] != nil
				self.depth = xml_element.elements['depth'].text
			end
		end

	end

	class KalturaPdfFlavorParamsOutput < KalturaFlavorParamsOutput
		attr_accessor :readonly

		def readonly=(val)
			@readonly = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['readonly'] != nil
				self.readonly = xml_element.elements['readonly'].text
			end
		end

	end

	class KalturaSwfFlavorParamsOutput < KalturaFlavorParamsOutput
		attr_accessor :flash_version
		attr_accessor :poly2bitmap

		def flash_version=(val)
			@flash_version = val.to_i
		end
		def poly2bitmap=(val)
			@poly2bitmap = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['flashVersion'] != nil
				self.flash_version = xml_element.elements['flashVersion'].text
			end
			if xml_element.elements['poly2Bitmap'] != nil
				self.poly2bitmap = xml_element.elements['poly2Bitmap'].text
			end
		end

	end

	class KalturaDocumentEntryBaseFilter < KalturaBaseEntryFilter
		attr_accessor :document_type_equal
		attr_accessor :document_type_in
		attr_accessor :asset_params_ids_match_or
		attr_accessor :asset_params_ids_match_and

		def document_type_equal=(val)
			@document_type_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['documentTypeEqual'] != nil
				self.document_type_equal = xml_element.elements['documentTypeEqual'].text
			end
			if xml_element.elements['documentTypeIn'] != nil
				self.document_type_in = xml_element.elements['documentTypeIn'].text
			end
			if xml_element.elements['assetParamsIdsMatchOr'] != nil
				self.asset_params_ids_match_or = xml_element.elements['assetParamsIdsMatchOr'].text
			end
			if xml_element.elements['assetParamsIdsMatchAnd'] != nil
				self.asset_params_ids_match_and = xml_element.elements['assetParamsIdsMatchAnd'].text
			end
		end

	end

	class KalturaDocumentEntryFilter < KalturaDocumentEntryBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDocumentFlavorParamsBaseFilter < KalturaFlavorParamsFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaImageFlavorParamsBaseFilter < KalturaFlavorParamsFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaPdfFlavorParamsBaseFilter < KalturaFlavorParamsFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSwfFlavorParamsBaseFilter < KalturaFlavorParamsFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDocumentFlavorParamsFilter < KalturaDocumentFlavorParamsBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaImageFlavorParamsFilter < KalturaImageFlavorParamsBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaPdfFlavorParamsFilter < KalturaPdfFlavorParamsBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSwfFlavorParamsFilter < KalturaSwfFlavorParamsBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDocumentFlavorParamsOutputBaseFilter < KalturaFlavorParamsOutputFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaImageFlavorParamsOutputBaseFilter < KalturaFlavorParamsOutputFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaPdfFlavorParamsOutputBaseFilter < KalturaFlavorParamsOutputFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSwfFlavorParamsOutputBaseFilter < KalturaFlavorParamsOutputFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDocumentFlavorParamsOutputFilter < KalturaDocumentFlavorParamsOutputBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaImageFlavorParamsOutputFilter < KalturaImageFlavorParamsOutputBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaPdfFlavorParamsOutputFilter < KalturaPdfFlavorParamsOutputBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSwfFlavorParamsOutputFilter < KalturaSwfFlavorParamsOutputBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Document service lets you upload and manage document files
	class KalturaDocumentsService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Copy entry into new entry
		# @return [KalturaDocumentEntry]
		def add_from_entry(source_entry_id, document_entry=KalturaNotImplemented, source_flavor_params_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'sourceEntryId', source_entry_id)
			client.add_param(kparams, 'documentEntry', document_entry)
			client.add_param(kparams, 'sourceFlavorParamsId', source_flavor_params_id)
			client.queue_service_action_call('document_documents', 'addFromEntry', 'KalturaDocumentEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Copy flavor asset into new entry
		# @return [KalturaDocumentEntry]
		def add_from_flavor_asset(source_flavor_asset_id, document_entry=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'sourceFlavorAssetId', source_flavor_asset_id)
			client.add_param(kparams, 'documentEntry', document_entry)
			client.queue_service_action_call('document_documents', 'addFromFlavorAsset', 'KalturaDocumentEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Add new document entry after the specific document file was uploaded and the upload token id exists
		# @return [KalturaDocumentEntry]
		def add_from_uploaded_file(document_entry, upload_token_id)
			kparams = {}
			client.add_param(kparams, 'documentEntry', document_entry)
			client.add_param(kparams, 'uploadTokenId', upload_token_id)
			client.queue_service_action_call('document_documents', 'addFromUploadedFile', 'KalturaDocumentEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Approves document replacement
		# @return [KalturaDocumentEntry]
		def approve_replace(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('document_documents', 'approveReplace', 'KalturaDocumentEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Cancels document replacement
		# @return [KalturaDocumentEntry]
		def cancel_replace(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('document_documents', 'cancelReplace', 'KalturaDocumentEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Convert entry
		# @return [bigint]
		def convert(entry_id, conversion_profile_id=KalturaNotImplemented, dynamic_conversion_attributes=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'conversionProfileId', conversion_profile_id)
			client.add_param(kparams, 'dynamicConversionAttributes', dynamic_conversion_attributes)
			client.queue_service_action_call('document_documents', 'convert', 'bigint', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# This will queue a batch job for converting the document file to swf
		# 	 Returns the URL where the new swf will be available
		# @return [string]
		def convert_ppt_to_swf(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('document_documents', 'convertPptToSwf', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete a document entry.
		# @return []
		def delete(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('document_documents', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get document entry by ID.
		# @return [KalturaDocumentEntry]
		def get(entry_id, version=-1)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'version', version)
			client.queue_service_action_call('document_documents', 'get', 'KalturaDocumentEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List document entries by filter with paging support.
		# @return [KalturaDocumentListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('document_documents', 'list', 'KalturaDocumentListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Serves the file content
		# @return [file]
		def serve(entry_id, flavor_asset_id=KalturaNotImplemented, force_proxy=false)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'flavorAssetId', flavor_asset_id)
			client.add_param(kparams, 'forceProxy', force_proxy)
			client.queue_service_action_call('document_documents', 'serve', 'file', kparams)
			return client.get_serve_url()
		end

		# Serves the file content
		# @return [file]
		def serve_by_flavor_params_id(entry_id, flavor_params_id=KalturaNotImplemented, force_proxy=false)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'flavorParamsId', flavor_params_id)
			client.add_param(kparams, 'forceProxy', force_proxy)
			client.queue_service_action_call('document_documents', 'serveByFlavorParamsId', 'file', kparams)
			return client.get_serve_url()
		end

		# Update document entry. Only the properties that were set will be updated.
		# @return [KalturaDocumentEntry]
		def update(entry_id, document_entry)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'documentEntry', document_entry)
			client.queue_service_action_call('document_documents', 'update', 'KalturaDocumentEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Replace content associated with the given document entry.
		# @return [KalturaDocumentEntry]
		def update_content(entry_id, resource, conversion_profile_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'resource', resource)
			client.add_param(kparams, 'conversionProfileId', conversion_profile_id)
			client.queue_service_action_call('document_documents', 'updateContent', 'KalturaDocumentEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Upload a document file to Kaltura, then the file can be used to create a document entry.
		# @return [string]
		def upload(file_data)
			kparams = {}
			kfiles = {}
			client.add_param(kfiles, 'fileData', file_data)
			client.queue_service_action_call('document_documents', 'upload', 'string', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :documents_service
		def documents_service
			if (@documents_service == nil)
				@documents_service = KalturaDocumentsService.new(self)
			end
			return @documents_service
		end
		
	end

end
