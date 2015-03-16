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

module Kaltura

	class KalturaScheduledTaskProfileStatus
		DISABLED = 1
		ACTIVE = 2
		DELETED = 3
		SUSPENDED = 4
		DRY_RUN_ONLY = 5
	end

	class KalturaScheduledTaskProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		LAST_EXECUTION_STARTED_AT_ASC = "+lastExecutionStartedAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		LAST_EXECUTION_STARTED_AT_DESC = "-lastExecutionStartedAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaScheduledTaskJobData < KalturaJobData
		attr_accessor :max_results
		attr_accessor :results_file_path
		attr_accessor :reference_time

		def max_results=(val)
			@max_results = val.to_i
		end
		def reference_time=(val)
			@reference_time = val.to_i
		end
	end

	class KalturaScheduledTaskProfileBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :system_name_equal
		attr_accessor :system_name_in
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :last_execution_started_at_greater_than_or_equal
		attr_accessor :last_execution_started_at_less_than_or_equal

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
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
		def last_execution_started_at_greater_than_or_equal=(val)
			@last_execution_started_at_greater_than_or_equal = val.to_i
		end
		def last_execution_started_at_less_than_or_equal=(val)
			@last_execution_started_at_less_than_or_equal = val.to_i
		end
	end

	class KalturaScheduledTaskProfileFilter < KalturaScheduledTaskProfileBaseFilter

	end


end
