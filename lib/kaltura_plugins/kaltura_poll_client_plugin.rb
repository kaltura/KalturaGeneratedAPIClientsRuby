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


	# Poll service
	#  The poll service works against the cache entirely no DB instance should be used here
	class KalturaPollService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add Action
		# @return [string]
		def add(poll_type='SINGLE_ANONYMOUS')
			kparams = {}
			client.add_param(kparams, 'pollType', poll_type)
			client.queue_service_action_call('poll_poll', 'add', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Vote Action
		# @return [string]
		def get_vote(poll_id, user_id)
			kparams = {}
			client.add_param(kparams, 'pollId', poll_id)
			client.add_param(kparams, 'userId', user_id)
			client.queue_service_action_call('poll_poll', 'getVote', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get Votes Action
		# @return [string]
		def get_votes(poll_id, answer_ids)
			kparams = {}
			client.add_param(kparams, 'pollId', poll_id)
			client.add_param(kparams, 'answerIds', answer_ids)
			client.queue_service_action_call('poll_poll', 'getVotes', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get resetVotes Action
		# @return []
		def reset_votes(poll_id)
			kparams = {}
			client.add_param(kparams, 'pollId', poll_id)
			client.queue_service_action_call('poll_poll', 'resetVotes', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Vote Action
		# @return [string]
		def vote(poll_id, user_id, answer_ids)
			kparams = {}
			client.add_param(kparams, 'pollId', poll_id)
			client.add_param(kparams, 'userId', user_id)
			client.add_param(kparams, 'answerIds', answer_ids)
			client.queue_service_action_call('poll_poll', 'vote', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :poll_service
		def poll_service
			if (@poll_service == nil)
				@poll_service = KalturaPollService.new(self)
			end
			return @poll_service
		end
		
	end

end
