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
# Copyright (C) 2006-2020  Kaltura Inc.
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
require File.dirname(__FILE__) + '/kaltura_file_sync_client_plugin.rb'

module Kaltura


	class KalturaThumbnailService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Retrieves a thumbnail according to the required transformation
		# @return []
		def transform(transform_string)
			kparams = {}
			client.add_param(kparams, 'transformString', transform_string)
			client.queue_service_action_call('thumbnail_thumbnail', 'transform', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :thumbnail_service
		def thumbnail_service
			if (@thumbnail_service == nil)
				@thumbnail_service = KalturaThumbnailService.new(self)
			end
			return @thumbnail_service
		end
		
	end

end
