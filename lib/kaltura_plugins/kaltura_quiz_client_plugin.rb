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
require File.dirname(__FILE__) + '/kaltura_cue_point_client_plugin.rb'

module Kaltura

	class KalturaAnswerCuePointOrderBy
		CREATED_AT_ASC = "+createdAt"
		IS_CORRECT_ASC = "+isCorrect"
		PARTNER_SORT_VALUE_ASC = "+partnerSortValue"
		START_TIME_ASC = "+startTime"
		TRIGGERED_AT_ASC = "+triggeredAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		IS_CORRECT_DESC = "-isCorrect"
		PARTNER_SORT_VALUE_DESC = "-partnerSortValue"
		START_TIME_DESC = "-startTime"
		TRIGGERED_AT_DESC = "-triggeredAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaQuestionCuePointOrderBy
		CREATED_AT_ASC = "+createdAt"
		PARTNER_SORT_VALUE_ASC = "+partnerSortValue"
		QUESTION_ASC = "+question"
		START_TIME_ASC = "+startTime"
		TRIGGERED_AT_ASC = "+triggeredAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		PARTNER_SORT_VALUE_DESC = "-partnerSortValue"
		QUESTION_DESC = "-question"
		START_TIME_DESC = "-startTime"
		TRIGGERED_AT_DESC = "-triggeredAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	# A representation of an optional answer for question cue point
	#  
	class KalturaOptionalAnswer < KalturaObjectBase
		attr_accessor :key
		attr_accessor :text
		attr_accessor :weight
		attr_accessor :is_correct

		def weight=(val)
			@weight = val.to_f
		end
		def is_correct=(val)
			@is_correct = val.to_i
		end
	end

	class KalturaQuiz < KalturaObjectBase
		attr_accessor :version
		# Array of key value ui related objects
		# 	 
		attr_accessor :ui_attributes
		attr_accessor :show_result_on_answer
		attr_accessor :show_correct_key_on_answer
		attr_accessor :allow_answer_update
		attr_accessor :show_correct_after_submission

		def version=(val)
			@version = val.to_i
		end
		def show_result_on_answer=(val)
			@show_result_on_answer = val.to_i
		end
		def show_correct_key_on_answer=(val)
			@show_correct_key_on_answer = val.to_i
		end
		def allow_answer_update=(val)
			@allow_answer_update = val.to_i
		end
		def show_correct_after_submission=(val)
			@show_correct_after_submission = val.to_i
		end
	end

	class KalturaAnswerCuePoint < KalturaCuePoint
		attr_accessor :parent_id
		attr_accessor :quiz_user_entry_id
		attr_accessor :answer_key
		attr_accessor :is_correct
		# Array of string
		# 	 
		attr_accessor :correct_answer_keys
		attr_accessor :explanation

		def is_correct=(val)
			@is_correct = val.to_i
		end
	end

	class KalturaQuestionCuePoint < KalturaCuePoint
		# Array of key value answerKey->optionAnswer objects
		# 	 
		attr_accessor :optional_answers
		attr_accessor :hint
		attr_accessor :question
		attr_accessor :explanation

	end

	class KalturaQuizAdvancedFilter < KalturaSearchItem
		attr_accessor :is_quiz

		def is_quiz=(val)
			@is_quiz = val.to_i
		end
	end

	class KalturaQuizListResponse < KalturaListResponse
		attr_accessor :objects

	end

	class KalturaQuizFilter < KalturaRelatedFilter
		# This filter should be in use for retrieving only a specific quiz entry (identified by its entryId).
		# 	 
		attr_accessor :entry_id_equal
		# This filter should be in use for retrieving few specific quiz entries (string should include comma separated list of entryId strings).
		# 	 
		attr_accessor :entry_id_in

	end

	class KalturaAnswerCuePointBaseFilter < KalturaCuePointFilter

	end

	class KalturaQuestionCuePointBaseFilter < KalturaCuePointFilter
		attr_accessor :question_like
		attr_accessor :question_multi_like_or
		attr_accessor :question_multi_like_and

	end

	class KalturaAnswerCuePointFilter < KalturaAnswerCuePointBaseFilter

	end

	class KalturaQuestionCuePointFilter < KalturaQuestionCuePointBaseFilter

	end


end
