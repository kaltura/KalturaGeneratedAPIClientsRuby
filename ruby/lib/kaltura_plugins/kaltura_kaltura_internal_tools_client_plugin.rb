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

	class KalturaInternalToolsSession < KalturaObjectBase
		attr_accessor :partner_id
		attr_accessor :valid_until
		attr_accessor :partner_pattern
		attr_accessor :type
		attr_accessor :error
		attr_accessor :rand
		attr_accessor :user
		attr_accessor :privileges

		def partner_id=(val)
			@partner_id = val.to_i
		end
		def valid_until=(val)
			@valid_until = val.to_i
		end
		def type=(val)
			@type = val.to_i
		end
		def rand=(val)
			@rand = val.to_i
		end
	end


	# Internal Tools Service
	#  
	class KalturaKalturaInternalToolsSystemHelperService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# KS from Secure String
		# 	 
		def from_secure_string(str)
			kparams = {}
			client.add_param(kparams, 'str', str);
			client.queue_service_action_call('kalturainternaltools_kalturainternaltoolssystemhelper', 'fromSecureString', kparams);
			if (client.is_multirequest)
				return nil;
			end
			return client.do_queue();
		end

		# from ip to country
		# 	 
		def iptocountry(remote_addr)
			kparams = {}
			client.add_param(kparams, 'remote_addr', remote_addr);
			client.queue_service_action_call('kalturainternaltools_kalturainternaltoolssystemhelper', 'iptocountry', kparams);
			if (client.is_multirequest)
				return nil;
			end
			return client.do_queue();
		end

		def get_remote_address()
			kparams = {}
			client.queue_service_action_call('kalturainternaltools_kalturainternaltoolssystemhelper', 'getRemoteAddress', kparams);
			if (client.is_multirequest)
				return nil;
			end
			return client.do_queue();
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :kaltura_internal_tools_system_helper_service
		def kaltura_internal_tools_system_helper_service
			if (@kaltura_internal_tools_system_helper_service == nil)
				@kaltura_internal_tools_system_helper_service = KalturaKalturaInternalToolsSystemHelperService.new(self)
			end
			return @kaltura_internal_tools_system_helper_service
		end
	end

end
