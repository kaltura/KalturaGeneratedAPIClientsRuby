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
# Copyright (C) 2006-2016  Kaltura Inc.
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

	class KalturaQuestionCuePointOrderBy
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

		def from_xml(xml_element)
			super
			self.key = xml_element.elements['key'].text
			self.text = xml_element.elements['text'].text
			self.weight = xml_element.elements['weight'].text
			self.is_correct = xml_element.elements['isCorrect'].text
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
		attr_accessor :allow_download
		attr_accessor :show_grade_after_submission

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
		def allow_download=(val)
			@allow_download = val.to_i
		end
		def show_grade_after_submission=(val)
			@show_grade_after_submission = val.to_i
		end

		def from_xml(xml_element)
			super
			self.version = xml_element.elements['version'].text
			self.ui_attributes = KalturaClientBase.object_from_xml(xml_element.elements['uiAttributes'], 'KalturaKeyValue')
			self.show_result_on_answer = xml_element.elements['showResultOnAnswer'].text
			self.show_correct_key_on_answer = xml_element.elements['showCorrectKeyOnAnswer'].text
			self.allow_answer_update = xml_element.elements['allowAnswerUpdate'].text
			self.show_correct_after_submission = xml_element.elements['showCorrectAfterSubmission'].text
			self.allow_download = xml_element.elements['allowDownload'].text
			self.show_grade_after_submission = xml_element.elements['showGradeAfterSubmission'].text
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

		def from_xml(xml_element)
			super
			self.parent_id = xml_element.elements['parentId'].text
			self.quiz_user_entry_id = xml_element.elements['quizUserEntryId'].text
			self.answer_key = xml_element.elements['answerKey'].text
			self.is_correct = xml_element.elements['isCorrect'].text
			self.correct_answer_keys = KalturaClientBase.object_from_xml(xml_element.elements['correctAnswerKeys'], 'KalturaString')
			self.explanation = xml_element.elements['explanation'].text
		end

	end

	class KalturaQuestionCuePoint < KalturaCuePoint
		# Array of key value answerKey->optionAnswer objects
		# 	 
		attr_accessor :optional_answers
		attr_accessor :hint
		attr_accessor :question
		attr_accessor :explanation


		def from_xml(xml_element)
			super
			self.optional_answers = KalturaClientBase.object_from_xml(xml_element.elements['optionalAnswers'], 'KalturaOptionalAnswer')
			self.hint = xml_element.elements['hint'].text
			self.question = xml_element.elements['question'].text
			self.explanation = xml_element.elements['explanation'].text
		end

	end

	class KalturaQuizAdvancedFilter < KalturaSearchItem
		attr_accessor :is_quiz

		def is_quiz=(val)
			@is_quiz = val.to_i
		end

		def from_xml(xml_element)
			super
			self.is_quiz = xml_element.elements['isQuiz'].text
		end

	end

	class KalturaQuizListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaQuiz')
		end

	end

	class KalturaQuizFilter < KalturaRelatedFilter
		# This filter should be in use for retrieving only a specific quiz entry (identified by its entryId).
		# 	 
		attr_accessor :entry_id_equal
		# This filter should be in use for retrieving few specific quiz entries (string should include comma separated list of entryId strings).
		# 	 
		attr_accessor :entry_id_in


		def from_xml(xml_element)
			super
			self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			self.entry_id_in = xml_element.elements['entryIdIn'].text
		end

	end

	class KalturaAnswerCuePointBaseFilter < KalturaCuePointFilter
		attr_accessor :parent_id_equal
		attr_accessor :parent_id_in
		attr_accessor :quiz_user_entry_id_equal
		attr_accessor :quiz_user_entry_id_in


		def from_xml(xml_element)
			super
			self.parent_id_equal = xml_element.elements['parentIdEqual'].text
			self.parent_id_in = xml_element.elements['parentIdIn'].text
			self.quiz_user_entry_id_equal = xml_element.elements['quizUserEntryIdEqual'].text
			self.quiz_user_entry_id_in = xml_element.elements['quizUserEntryIdIn'].text
		end

	end

	class KalturaQuestionCuePointBaseFilter < KalturaCuePointFilter
		attr_accessor :question_like
		attr_accessor :question_multi_like_or
		attr_accessor :question_multi_like_and


		def from_xml(xml_element)
			super
			self.question_like = xml_element.elements['questionLike'].text
			self.question_multi_like_or = xml_element.elements['questionMultiLikeOr'].text
			self.question_multi_like_and = xml_element.elements['questionMultiLikeAnd'].text
		end

	end

	class KalturaAnswerCuePointFilter < KalturaAnswerCuePointBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaQuestionCuePointFilter < KalturaQuestionCuePointBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Allows user to handle quizzes
	#  
	class KalturaQuizService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Allows to add a quiz to an entry
		# 	 
		def add(entry_id, quiz)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'quiz', quiz)
			client.queue_service_action_call('quiz_quiz', 'add', 'KalturaQuiz', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Allows to update a quiz
		# 	 
		def update(entry_id, quiz)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'quiz', quiz)
			client.queue_service_action_call('quiz_quiz', 'update', 'KalturaQuiz', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Allows to get a quiz
		# 	 
		def get(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('quiz_quiz', 'get', 'KalturaQuiz', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List quiz objects by filter and pager
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('quiz_quiz', 'list', 'KalturaQuizListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# creates a pdf from quiz object
		# 	 The Output type defines the file format in which the quiz will be generated
		# 	 Currently only PDF files are supported
		# 	 
		def serve(entry_id, quiz_output_type)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'quizOutputType', quiz_output_type)
			client.queue_service_action_call('quiz_quiz', 'serve', 'file', kparams)
			return client.get_serve_url()
		end

		# sends a with an api request for pdf from quiz object
		# 	 
		def get_url(entry_id, quiz_output_type)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'quizOutputType', quiz_output_type)
			client.queue_service_action_call('quiz_quiz', 'getUrl', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :quiz_service
		def quiz_service
			if (@quiz_service == nil)
				@quiz_service = KalturaQuizService.new(self)
			end
			return @quiz_service
		end
		
	end

end
