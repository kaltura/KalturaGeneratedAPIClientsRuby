# ===================================================================================================
#                           _  __     _ _
#                          | |/ /__ _| | |_ _  _ _ _ __ _
#                          | ' </ _` | |  _| || | '_/ _` |
#                          |_|\_\__,_|_|\__|\_,_|_| \__,_|
#
# This file is part of the Kaltura Collaborative Media Suite which allows users
# to do with audio, video, and animation what Wiki platforms allow them to do with
# text.
#
# Copyright (C) 2006-2023  Kaltura Inc.
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

	# This class represents object-specific data passed to the 
	#  bulk upload job.
	class KalturaBulkServiceData < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end


	# Bulk upload service is used to upload & manage bulk uploads
	class KalturaBulkService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Aborts the bulk upload and all its child jobs
		# @return [KalturaBulkUpload]
		def abort(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('bulkupload_bulk', 'abort', 'KalturaBulkUpload', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get bulk upload batch job by id
		# @return [KalturaBulkUpload]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('bulkupload_bulk', 'get', 'KalturaBulkUpload', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List bulk upload batch jobs
		# @return [KalturaBulkUploadListResponse]
		def list(bulk_upload_filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'bulkUploadFilter', bulk_upload_filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('bulkupload_bulk', 'list', 'KalturaBulkUploadListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# serve action returns the original file.
		# @return [file]
		def serve(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('bulkupload_bulk', 'serve', 'file', kparams)
			return client.get_serve_url()
		end

		# serveLog action returns the log file for the bulk-upload job.
		# @return [file]
		def serve_log(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('bulkupload_bulk', 'serveLog', 'file', kparams)
			return client.get_serve_url()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :bulk_service
		def bulk_service
			if (@bulk_service == nil)
				@bulk_service = KalturaBulkService.new(self)
			end
			return @bulk_service
		end
		
	end

end
