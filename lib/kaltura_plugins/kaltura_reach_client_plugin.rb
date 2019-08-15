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
# Copyright (C) 2006-2019  Kaltura Inc.
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
require File.dirname(__FILE__) + '/kaltura_event_notification_client_plugin.rb'

module Kaltura

	class KalturaEntryVendorTaskCreationMode
		MANUAL = 1
		AUTOMATIC = 2
	end

	class KalturaEntryVendorTaskStatus
		PENDING = 1
		READY = 2
		PROCESSING = 3
		PENDING_MODERATION = 4
		REJECTED = 5
		ERROR = 6
		ABORTED = 7
		PENDING_ENTRY_READY = 8
	end

	class KalturaReachProfileContentDeletionPolicy
		DO_NOTHING = 1
		DELETE_ONCE_PROCESSED = 2
		DELETE_AFTER_WEEK = 3
		DELETE_AFTER_MONTH = 4
		DELETE_AFTER_THREE_MONTHS = 5
	end

	class KalturaReachProfileStatus
		DISABLED = 1
		ACTIVE = 2
		DELETED = 3
	end

	class KalturaReachProfileType
		FREE_TRIAL = 1
		PAID = 2
	end

	class KalturaVendorCatalogItemOutputFormat
		SRT = 1
		DFXP = 2
	end

	class KalturaVendorCatalogItemStatus
		DEPRECATED = 1
		ACTIVE = 2
		DELETED = 3
	end

	class KalturaVendorServiceFeature
		CAPTIONS = 1
		TRANSLATION = 2
		ALIGNMENT = 3
		AUDIO_DESCRIPTION = 4
		CHAPTERING = 5
	end

	class KalturaVendorServiceTurnAroundTime
		BEST_EFFORT = -1
		IMMEDIATE = 0
		THIRTY_MINUTES = 1800
		TWO_HOURS = 7200
		THREE_HOURS = 10800
		SIX_HOURS = 21600
		EIGHT_HOURS = 28800
		TWELVE_HOURS = 43200
		TWENTY_FOUR_HOURS = 86400
		FORTY_EIGHT_HOURS = 172800
		FOUR_DAYS = 345600
		FIVE_DAYS = 432000
		TEN_DAYS = 864000
	end

	class KalturaVendorServiceType
		HUMAN = 1
		MACHINE = 2
	end

	class KalturaVendorTaskProcessingRegion
		US = 1
		EU = 2
	end

	class KalturaCatalogItemLanguage
		AR = "Arabic"
		YUE = "Cantonese"
		ZH = "Chinese"
		DA = "Danish"
		NL = "Dutch"
		EN = "English"
		EN_US = "English (American)"
		EN_GB = "English (British)"
		FI = "Finnish"
		FR = "French"
		DE = "German"
		HE = "Hebrew"
		HI = "Hindi"
		IS = "Icelandic"
		IT = "Italian"
		JA = "Japanese"
		KO = "Korean"
		CMN = "Mandarin Chinese"
		NO = "Norwegian"
		PL = "Polish"
		PT = "Portuguese"
		RU = "Russian"
		ES = "Spanish"
		SV = "Swedish"
		TH = "Thai"
		TR = "Turkish"
	end

	class KalturaEntryVendorTaskOrderBy
		CREATED_AT_ASC = "+createdAt"
		FINISH_TIME_ASC = "+finishTime"
		ID_ASC = "+id"
		PRICE_ASC = "+price"
		QUEUE_TIME_ASC = "+queueTime"
		STATUS_ASC = "+status"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		FINISH_TIME_DESC = "-finishTime"
		ID_DESC = "-id"
		PRICE_DESC = "-price"
		QUEUE_TIME_DESC = "-queueTime"
		STATUS_DESC = "-status"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaReachProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaVendorCaptionsCatalogItemOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaVendorCatalogItemOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaVendorCatalogItemPriceFunction
		PRICE_PER_MINUTE = "kReachUtils::calcPricePerMinute"
		PRICE_PER_SECOND = "kReachUtils::calcPricePerSecond"
	end

	class KalturaVendorCreditRecurrenceFrequency
		DAILY = "day"
		MONTHLY = "month"
		WEEKLY = "week"
		YEARLY = "year"
	end

	class KalturaVendorTranslationCatalogItemOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaBaseVendorCredit < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDictionary < KalturaObjectBase
		attr_accessor :language
		attr_accessor :data


		def from_xml(xml_element)
			super
			if xml_element.elements['language'] != nil
				self.language = xml_element.elements['language'].text
			end
			if xml_element.elements['data'] != nil
				self.data = xml_element.elements['data'].text
			end
		end

	end

	class KalturaVendorTaskData < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	class KalturaEntryVendorTask < KalturaObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :vendor_partner_id
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :queue_time
		attr_accessor :finish_time
		attr_accessor :entry_id
		attr_accessor :status
		# The profile id from which this task base config is taken from
		attr_accessor :reach_profile_id
		# The catalog item Id containing the task description
		attr_accessor :catalog_item_id
		# The charged price to execute this task
		attr_accessor :price
		# The ID of the user who created this task
		attr_accessor :user_id
		# The user ID that approved this task for execution (in case moderation is requested)
		attr_accessor :moderating_user
		# Err description provided by provider in case job execution has failed
		attr_accessor :err_description
		# Access key generated by Kaltura to allow vendors to ingest the end result to the destination
		attr_accessor :access_key
		# Vendor generated by Kaltura representing the entry vendor task version correlated to the entry version
		attr_accessor :version
		# User generated notes that should be taken into account by the vendor while executing the task
		attr_accessor :notes
		attr_accessor :dictionary
		# Task context
		attr_accessor :context
		# Task result accuracy percentage
		attr_accessor :accuracy
		# Task main object generated by executing the task
		attr_accessor :output_object_id
		# Json object containing extra task data required by the requester
		attr_accessor :partner_data
		# Task creation mode
		attr_accessor :creation_mode
		attr_accessor :task_job_data

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def vendor_partner_id=(val)
			@vendor_partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def queue_time=(val)
			@queue_time = val.to_i
		end
		def finish_time=(val)
			@finish_time = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def reach_profile_id=(val)
			@reach_profile_id = val.to_i
		end
		def catalog_item_id=(val)
			@catalog_item_id = val.to_i
		end
		def price=(val)
			@price = val.to_f
		end
		def accuracy=(val)
			@accuracy = val.to_i
		end
		def creation_mode=(val)
			@creation_mode = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['vendorPartnerId'] != nil
				self.vendor_partner_id = xml_element.elements['vendorPartnerId'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['queueTime'] != nil
				self.queue_time = xml_element.elements['queueTime'].text
			end
			if xml_element.elements['finishTime'] != nil
				self.finish_time = xml_element.elements['finishTime'].text
			end
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['reachProfileId'] != nil
				self.reach_profile_id = xml_element.elements['reachProfileId'].text
			end
			if xml_element.elements['catalogItemId'] != nil
				self.catalog_item_id = xml_element.elements['catalogItemId'].text
			end
			if xml_element.elements['price'] != nil
				self.price = xml_element.elements['price'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['moderatingUser'] != nil
				self.moderating_user = xml_element.elements['moderatingUser'].text
			end
			if xml_element.elements['errDescription'] != nil
				self.err_description = xml_element.elements['errDescription'].text
			end
			if xml_element.elements['accessKey'] != nil
				self.access_key = xml_element.elements['accessKey'].text
			end
			if xml_element.elements['version'] != nil
				self.version = xml_element.elements['version'].text
			end
			if xml_element.elements['notes'] != nil
				self.notes = xml_element.elements['notes'].text
			end
			if xml_element.elements['dictionary'] != nil
				self.dictionary = xml_element.elements['dictionary'].text
			end
			if xml_element.elements['context'] != nil
				self.context = xml_element.elements['context'].text
			end
			if xml_element.elements['accuracy'] != nil
				self.accuracy = xml_element.elements['accuracy'].text
			end
			if xml_element.elements['outputObjectId'] != nil
				self.output_object_id = xml_element.elements['outputObjectId'].text
			end
			if xml_element.elements['partnerData'] != nil
				self.partner_data = xml_element.elements['partnerData'].text
			end
			if xml_element.elements['creationMode'] != nil
				self.creation_mode = xml_element.elements['creationMode'].text
			end
			if xml_element.elements['taskJobData'] != nil
				self.task_job_data = KalturaClientBase.object_from_xml(xml_element.elements['taskJobData'], 'KalturaVendorTaskData')
			end
		end

	end

	class KalturaReachProfile < KalturaObjectBase
		attr_accessor :id
		# The name of the profile
		attr_accessor :name
		attr_accessor :partner_id
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :status
		attr_accessor :profile_type
		attr_accessor :default_output_format
		attr_accessor :enable_machine_moderation
		attr_accessor :enable_human_moderation
		attr_accessor :auto_display_machine_captions_on_player
		attr_accessor :auto_display_human_captions_on_player
		attr_accessor :enable_metadata_extraction
		attr_accessor :enable_speaker_change_indication
		attr_accessor :enable_audio_tags
		attr_accessor :enable_profanity_removal
		attr_accessor :max_characters_per_caption_line
		attr_accessor :content_deletion_policy
		attr_accessor :rules
		attr_accessor :credit
		attr_accessor :used_credit
		attr_accessor :dictionaries
		# Comma separated flavorParamsIds that the vendor should look for it matching asset when trying to download the asset
		attr_accessor :flavor_params_ids
		# Indicates in which region the task processing should task place
		attr_accessor :vendor_task_processing_region

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def profile_type=(val)
			@profile_type = val.to_i
		end
		def default_output_format=(val)
			@default_output_format = val.to_i
		end
		def enable_machine_moderation=(val)
			@enable_machine_moderation = val.to_i
		end
		def enable_human_moderation=(val)
			@enable_human_moderation = val.to_i
		end
		def auto_display_machine_captions_on_player=(val)
			@auto_display_machine_captions_on_player = val.to_i
		end
		def auto_display_human_captions_on_player=(val)
			@auto_display_human_captions_on_player = val.to_i
		end
		def enable_metadata_extraction=(val)
			@enable_metadata_extraction = val.to_i
		end
		def enable_speaker_change_indication=(val)
			@enable_speaker_change_indication = val.to_i
		end
		def enable_audio_tags=(val)
			@enable_audio_tags = val.to_i
		end
		def enable_profanity_removal=(val)
			@enable_profanity_removal = val.to_i
		end
		def max_characters_per_caption_line=(val)
			@max_characters_per_caption_line = val.to_i
		end
		def content_deletion_policy=(val)
			@content_deletion_policy = val.to_i
		end
		def used_credit=(val)
			@used_credit = val.to_f
		end
		def vendor_task_processing_region=(val)
			@vendor_task_processing_region = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['profileType'] != nil
				self.profile_type = xml_element.elements['profileType'].text
			end
			if xml_element.elements['defaultOutputFormat'] != nil
				self.default_output_format = xml_element.elements['defaultOutputFormat'].text
			end
			if xml_element.elements['enableMachineModeration'] != nil
				self.enable_machine_moderation = xml_element.elements['enableMachineModeration'].text
			end
			if xml_element.elements['enableHumanModeration'] != nil
				self.enable_human_moderation = xml_element.elements['enableHumanModeration'].text
			end
			if xml_element.elements['autoDisplayMachineCaptionsOnPlayer'] != nil
				self.auto_display_machine_captions_on_player = xml_element.elements['autoDisplayMachineCaptionsOnPlayer'].text
			end
			if xml_element.elements['autoDisplayHumanCaptionsOnPlayer'] != nil
				self.auto_display_human_captions_on_player = xml_element.elements['autoDisplayHumanCaptionsOnPlayer'].text
			end
			if xml_element.elements['enableMetadataExtraction'] != nil
				self.enable_metadata_extraction = xml_element.elements['enableMetadataExtraction'].text
			end
			if xml_element.elements['enableSpeakerChangeIndication'] != nil
				self.enable_speaker_change_indication = xml_element.elements['enableSpeakerChangeIndication'].text
			end
			if xml_element.elements['enableAudioTags'] != nil
				self.enable_audio_tags = xml_element.elements['enableAudioTags'].text
			end
			if xml_element.elements['enableProfanityRemoval'] != nil
				self.enable_profanity_removal = xml_element.elements['enableProfanityRemoval'].text
			end
			if xml_element.elements['maxCharactersPerCaptionLine'] != nil
				self.max_characters_per_caption_line = xml_element.elements['maxCharactersPerCaptionLine'].text
			end
			if xml_element.elements['contentDeletionPolicy'] != nil
				self.content_deletion_policy = xml_element.elements['contentDeletionPolicy'].text
			end
			if xml_element.elements['rules'] != nil
				self.rules = KalturaClientBase.object_from_xml(xml_element.elements['rules'], 'KalturaRule')
			end
			if xml_element.elements['credit'] != nil
				self.credit = KalturaClientBase.object_from_xml(xml_element.elements['credit'], 'KalturaBaseVendorCredit')
			end
			if xml_element.elements['usedCredit'] != nil
				self.used_credit = xml_element.elements['usedCredit'].text
			end
			if xml_element.elements['dictionaries'] != nil
				self.dictionaries = KalturaClientBase.object_from_xml(xml_element.elements['dictionaries'], 'KalturaDictionary')
			end
			if xml_element.elements['flavorParamsIds'] != nil
				self.flavor_params_ids = xml_element.elements['flavorParamsIds'].text
			end
			if xml_element.elements['vendorTaskProcessingRegion'] != nil
				self.vendor_task_processing_region = xml_element.elements['vendorTaskProcessingRegion'].text
			end
		end

	end

	class KalturaVendorCatalogItemPricing < KalturaObjectBase
		attr_accessor :price_per_unit
		attr_accessor :price_function

		def price_per_unit=(val)
			@price_per_unit = val.to_f
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['pricePerUnit'] != nil
				self.price_per_unit = xml_element.elements['pricePerUnit'].text
			end
			if xml_element.elements['priceFunction'] != nil
				self.price_function = xml_element.elements['priceFunction'].text
			end
		end

	end

	class KalturaVendorCatalogItem < KalturaObjectBase
		attr_accessor :id
		attr_accessor :vendor_partner_id
		attr_accessor :name
		attr_accessor :system_name
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :status
		attr_accessor :service_type
		attr_accessor :service_feature
		attr_accessor :turn_around_time
		attr_accessor :pricing

		def id=(val)
			@id = val.to_i
		end
		def vendor_partner_id=(val)
			@vendor_partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def service_type=(val)
			@service_type = val.to_i
		end
		def service_feature=(val)
			@service_feature = val.to_i
		end
		def turn_around_time=(val)
			@turn_around_time = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['vendorPartnerId'] != nil
				self.vendor_partner_id = xml_element.elements['vendorPartnerId'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['systemName'] != nil
				self.system_name = xml_element.elements['systemName'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['serviceType'] != nil
				self.service_type = xml_element.elements['serviceType'].text
			end
			if xml_element.elements['serviceFeature'] != nil
				self.service_feature = xml_element.elements['serviceFeature'].text
			end
			if xml_element.elements['turnAroundTime'] != nil
				self.turn_around_time = xml_element.elements['turnAroundTime'].text
			end
			if xml_element.elements['pricing'] != nil
				self.pricing = KalturaClientBase.object_from_xml(xml_element.elements['pricing'], 'KalturaVendorCatalogItemPricing')
			end
		end

	end

	class KalturaAddEntryVendorTaskAction < KalturaRuleAction
		# Catalog Item Id
		attr_accessor :catalog_item_ids


		def from_xml(xml_element)
			super
			if xml_element.elements['catalogItemIds'] != nil
				self.catalog_item_ids = xml_element.elements['catalogItemIds'].text
			end
		end

	end

	class KalturaAlignmentVendorTaskData < KalturaVendorTaskData
		# The id of the text transcript object the vendor should use while runing the alignment task
		attr_accessor :text_transcript_asset_id
		# Optional - The id of the json transcript object the vendor should update once alignment task processing is done
		attr_accessor :json_transcript_asset_id
		# Optional - The id of the caption asset object the vendor should update once alignment task processing is done
		attr_accessor :caption_asset_id


		def from_xml(xml_element)
			super
			if xml_element.elements['textTranscriptAssetId'] != nil
				self.text_transcript_asset_id = xml_element.elements['textTranscriptAssetId'].text
			end
			if xml_element.elements['jsonTranscriptAssetId'] != nil
				self.json_transcript_asset_id = xml_element.elements['jsonTranscriptAssetId'].text
			end
			if xml_element.elements['captionAssetId'] != nil
				self.caption_asset_id = xml_element.elements['captionAssetId'].text
			end
		end

	end

	class KalturaCatalogItemAdvancedFilter < KalturaSearchItem
		attr_accessor :service_type_equal
		attr_accessor :service_type_in
		attr_accessor :service_feature_equal
		attr_accessor :service_feature_in
		attr_accessor :turn_around_time_equal
		attr_accessor :turn_around_time_in
		attr_accessor :source_language_equal
		attr_accessor :target_language_equal

		def service_type_equal=(val)
			@service_type_equal = val.to_i
		end
		def service_feature_equal=(val)
			@service_feature_equal = val.to_i
		end
		def turn_around_time_equal=(val)
			@turn_around_time_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['serviceTypeEqual'] != nil
				self.service_type_equal = xml_element.elements['serviceTypeEqual'].text
			end
			if xml_element.elements['serviceTypeIn'] != nil
				self.service_type_in = xml_element.elements['serviceTypeIn'].text
			end
			if xml_element.elements['serviceFeatureEqual'] != nil
				self.service_feature_equal = xml_element.elements['serviceFeatureEqual'].text
			end
			if xml_element.elements['serviceFeatureIn'] != nil
				self.service_feature_in = xml_element.elements['serviceFeatureIn'].text
			end
			if xml_element.elements['turnAroundTimeEqual'] != nil
				self.turn_around_time_equal = xml_element.elements['turnAroundTimeEqual'].text
			end
			if xml_element.elements['turnAroundTimeIn'] != nil
				self.turn_around_time_in = xml_element.elements['turnAroundTimeIn'].text
			end
			if xml_element.elements['sourceLanguageEqual'] != nil
				self.source_language_equal = xml_element.elements['sourceLanguageEqual'].text
			end
			if xml_element.elements['targetLanguageEqual'] != nil
				self.target_language_equal = xml_element.elements['targetLanguageEqual'].text
			end
		end

	end

	class KalturaCategoryEntryCondition < KalturaCondition
		# Category id to check condition for
		attr_accessor :category_id
		# Category id's to check condition for
		attr_accessor :category_ids
		# Minimum category user level permission to validate
		attr_accessor :category_user_permission
		# Comparing operator
		attr_accessor :comparison

		def category_id=(val)
			@category_id = val.to_i
		end
		def category_user_permission=(val)
			@category_user_permission = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['categoryId'] != nil
				self.category_id = xml_element.elements['categoryId'].text
			end
			if xml_element.elements['categoryIds'] != nil
				self.category_ids = xml_element.elements['categoryIds'].text
			end
			if xml_element.elements['categoryUserPermission'] != nil
				self.category_user_permission = xml_element.elements['categoryUserPermission'].text
			end
			if xml_element.elements['comparison'] != nil
				self.comparison = xml_element.elements['comparison'].text
			end
		end

	end

	class KalturaEntryVendorTaskListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaEntryVendorTask')
			end
		end

	end

	class KalturaReachProfileListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaReachProfile')
			end
		end

	end

	class KalturaUnlimitedVendorCredit < KalturaBaseVendorCredit
		attr_accessor :credit
		attr_accessor :from_date
		attr_accessor :to_date

		def credit=(val)
			@credit = val.to_i
		end
		def from_date=(val)
			@from_date = val.to_i
		end
		def to_date=(val)
			@to_date = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['credit'] != nil
				self.credit = xml_element.elements['credit'].text
			end
			if xml_element.elements['fromDate'] != nil
				self.from_date = xml_element.elements['fromDate'].text
			end
			if xml_element.elements['toDate'] != nil
				self.to_date = xml_element.elements['toDate'].text
			end
		end

	end

	class KalturaVendorAlignmentCatalogItem < KalturaVendorCatalogItem
		attr_accessor :source_language
		attr_accessor :output_format

		def output_format=(val)
			@output_format = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['sourceLanguage'] != nil
				self.source_language = xml_element.elements['sourceLanguage'].text
			end
			if xml_element.elements['outputFormat'] != nil
				self.output_format = xml_element.elements['outputFormat'].text
			end
		end

	end

	class KalturaVendorAudioDescriptionCatalogItem < KalturaVendorCatalogItem
		attr_accessor :source_language
		attr_accessor :flavor_params_id
		attr_accessor :clear_audio_flavor_params_id

		def flavor_params_id=(val)
			@flavor_params_id = val.to_i
		end
		def clear_audio_flavor_params_id=(val)
			@clear_audio_flavor_params_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['sourceLanguage'] != nil
				self.source_language = xml_element.elements['sourceLanguage'].text
			end
			if xml_element.elements['flavorParamsId'] != nil
				self.flavor_params_id = xml_element.elements['flavorParamsId'].text
			end
			if xml_element.elements['clearAudioFlavorParamsId'] != nil
				self.clear_audio_flavor_params_id = xml_element.elements['clearAudioFlavorParamsId'].text
			end
		end

	end

	class KalturaVendorCaptionsCatalogItem < KalturaVendorCatalogItem
		attr_accessor :source_language
		attr_accessor :output_format
		attr_accessor :enable_speaker_id
		attr_accessor :fixed_price_addons

		def output_format=(val)
			@output_format = val.to_i
		end
		def enable_speaker_id=(val)
			@enable_speaker_id = val.to_i
		end
		def fixed_price_addons=(val)
			@fixed_price_addons = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['sourceLanguage'] != nil
				self.source_language = xml_element.elements['sourceLanguage'].text
			end
			if xml_element.elements['outputFormat'] != nil
				self.output_format = xml_element.elements['outputFormat'].text
			end
			if xml_element.elements['enableSpeakerId'] != nil
				self.enable_speaker_id = xml_element.elements['enableSpeakerId'].text
			end
			if xml_element.elements['fixedPriceAddons'] != nil
				self.fixed_price_addons = xml_element.elements['fixedPriceAddons'].text
			end
		end

	end

	class KalturaVendorCatalogItemListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaVendorCatalogItem')
			end
		end

	end

	class KalturaVendorChapteringCatalogItem < KalturaVendorCatalogItem
		attr_accessor :source_language


		def from_xml(xml_element)
			super
			if xml_element.elements['sourceLanguage'] != nil
				self.source_language = xml_element.elements['sourceLanguage'].text
			end
		end

	end

	class KalturaVendorCredit < KalturaBaseVendorCredit
		attr_accessor :credit
		attr_accessor :from_date
		attr_accessor :overage_credit
		attr_accessor :add_on

		def credit=(val)
			@credit = val.to_i
		end
		def from_date=(val)
			@from_date = val.to_i
		end
		def overage_credit=(val)
			@overage_credit = val.to_i
		end
		def add_on=(val)
			@add_on = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['credit'] != nil
				self.credit = xml_element.elements['credit'].text
			end
			if xml_element.elements['fromDate'] != nil
				self.from_date = xml_element.elements['fromDate'].text
			end
			if xml_element.elements['overageCredit'] != nil
				self.overage_credit = xml_element.elements['overageCredit'].text
			end
			if xml_element.elements['addOn'] != nil
				self.add_on = xml_element.elements['addOn'].text
			end
		end

	end

	class KalturaEntryVendorTaskBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :vendor_partner_id_equal
		attr_accessor :vendor_partner_id_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :queue_time_greater_than_or_equal
		attr_accessor :queue_time_less_than_or_equal
		attr_accessor :finish_time_greater_than_or_equal
		attr_accessor :finish_time_less_than_or_equal
		attr_accessor :entry_id_equal
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :reach_profile_id_equal
		attr_accessor :reach_profile_id_in
		attr_accessor :catalog_item_id_equal
		attr_accessor :catalog_item_id_in
		attr_accessor :user_id_equal
		attr_accessor :context_equal

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def vendor_partner_id_equal=(val)
			@vendor_partner_id_equal = val.to_i
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
		def queue_time_greater_than_or_equal=(val)
			@queue_time_greater_than_or_equal = val.to_i
		end
		def queue_time_less_than_or_equal=(val)
			@queue_time_less_than_or_equal = val.to_i
		end
		def finish_time_greater_than_or_equal=(val)
			@finish_time_greater_than_or_equal = val.to_i
		end
		def finish_time_less_than_or_equal=(val)
			@finish_time_less_than_or_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end
		def reach_profile_id_equal=(val)
			@reach_profile_id_equal = val.to_i
		end
		def catalog_item_id_equal=(val)
			@catalog_item_id_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['vendorPartnerIdEqual'] != nil
				self.vendor_partner_id_equal = xml_element.elements['vendorPartnerIdEqual'].text
			end
			if xml_element.elements['vendorPartnerIdIn'] != nil
				self.vendor_partner_id_in = xml_element.elements['vendorPartnerIdIn'].text
			end
			if xml_element.elements['createdAtGreaterThanOrEqual'] != nil
				self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['createdAtLessThanOrEqual'] != nil
				self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			end
			if xml_element.elements['updatedAtGreaterThanOrEqual'] != nil
				self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['updatedAtLessThanOrEqual'] != nil
				self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			end
			if xml_element.elements['queueTimeGreaterThanOrEqual'] != nil
				self.queue_time_greater_than_or_equal = xml_element.elements['queueTimeGreaterThanOrEqual'].text
			end
			if xml_element.elements['queueTimeLessThanOrEqual'] != nil
				self.queue_time_less_than_or_equal = xml_element.elements['queueTimeLessThanOrEqual'].text
			end
			if xml_element.elements['finishTimeGreaterThanOrEqual'] != nil
				self.finish_time_greater_than_or_equal = xml_element.elements['finishTimeGreaterThanOrEqual'].text
			end
			if xml_element.elements['finishTimeLessThanOrEqual'] != nil
				self.finish_time_less_than_or_equal = xml_element.elements['finishTimeLessThanOrEqual'].text
			end
			if xml_element.elements['entryIdEqual'] != nil
				self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['reachProfileIdEqual'] != nil
				self.reach_profile_id_equal = xml_element.elements['reachProfileIdEqual'].text
			end
			if xml_element.elements['reachProfileIdIn'] != nil
				self.reach_profile_id_in = xml_element.elements['reachProfileIdIn'].text
			end
			if xml_element.elements['catalogItemIdEqual'] != nil
				self.catalog_item_id_equal = xml_element.elements['catalogItemIdEqual'].text
			end
			if xml_element.elements['catalogItemIdIn'] != nil
				self.catalog_item_id_in = xml_element.elements['catalogItemIdIn'].text
			end
			if xml_element.elements['userIdEqual'] != nil
				self.user_id_equal = xml_element.elements['userIdEqual'].text
			end
			if xml_element.elements['contextEqual'] != nil
				self.context_equal = xml_element.elements['contextEqual'].text
			end
		end

	end

	class KalturaEntryVendorTaskFilter < KalturaEntryVendorTaskBaseFilter
		attr_accessor :free_text


		def from_xml(xml_element)
			super
			if xml_element.elements['freeText'] != nil
				self.free_text = xml_element.elements['freeText'].text
			end
		end

	end

	class KalturaEntryVendorTaskCsvJobData < KalturaExportCsvJobData
		# The filter should return the list of users that need to be specified in the csv.
		attr_accessor :filter


		def from_xml(xml_element)
			super
			if xml_element.elements['filter'] != nil
				self.filter = KalturaClientBase.object_from_xml(xml_element.elements['filter'], 'KalturaEntryVendorTaskFilter')
			end
		end

	end

	class KalturaReachProfileBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :profile_type_equal
		attr_accessor :profile_type_in

		def id_equal=(val)
			@id_equal = val.to_i
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
		def status_equal=(val)
			@status_equal = val.to_i
		end
		def profile_type_equal=(val)
			@profile_type_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['createdAtGreaterThanOrEqual'] != nil
				self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['createdAtLessThanOrEqual'] != nil
				self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			end
			if xml_element.elements['updatedAtGreaterThanOrEqual'] != nil
				self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['updatedAtLessThanOrEqual'] != nil
				self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['profileTypeEqual'] != nil
				self.profile_type_equal = xml_element.elements['profileTypeEqual'].text
			end
			if xml_element.elements['profileTypeIn'] != nil
				self.profile_type_in = xml_element.elements['profileTypeIn'].text
			end
		end

	end

	class KalturaReachReportInputFilter < KalturaReportInputFilter
		attr_accessor :service_type
		attr_accessor :service_feature
		attr_accessor :turn_around_time

		def service_type=(val)
			@service_type = val.to_i
		end
		def service_feature=(val)
			@service_feature = val.to_i
		end
		def turn_around_time=(val)
			@turn_around_time = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['serviceType'] != nil
				self.service_type = xml_element.elements['serviceType'].text
			end
			if xml_element.elements['serviceFeature'] != nil
				self.service_feature = xml_element.elements['serviceFeature'].text
			end
			if xml_element.elements['turnAroundTime'] != nil
				self.turn_around_time = xml_element.elements['turnAroundTime'].text
			end
		end

	end

	class KalturaTimeRangeVendorCredit < KalturaVendorCredit
		attr_accessor :to_date

		def to_date=(val)
			@to_date = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['toDate'] != nil
				self.to_date = xml_element.elements['toDate'].text
			end
		end

	end

	class KalturaVendorCatalogItemBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :id_not_in
		attr_accessor :vendor_partner_id_equal
		attr_accessor :vendor_partner_id_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :service_type_equal
		attr_accessor :service_type_in
		attr_accessor :service_feature_equal
		attr_accessor :service_feature_in
		attr_accessor :turn_around_time_equal
		attr_accessor :turn_around_time_in

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def vendor_partner_id_equal=(val)
			@vendor_partner_id_equal = val.to_i
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
		def status_equal=(val)
			@status_equal = val.to_i
		end
		def service_type_equal=(val)
			@service_type_equal = val.to_i
		end
		def service_feature_equal=(val)
			@service_feature_equal = val.to_i
		end
		def turn_around_time_equal=(val)
			@turn_around_time_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['idNotIn'] != nil
				self.id_not_in = xml_element.elements['idNotIn'].text
			end
			if xml_element.elements['vendorPartnerIdEqual'] != nil
				self.vendor_partner_id_equal = xml_element.elements['vendorPartnerIdEqual'].text
			end
			if xml_element.elements['vendorPartnerIdIn'] != nil
				self.vendor_partner_id_in = xml_element.elements['vendorPartnerIdIn'].text
			end
			if xml_element.elements['createdAtGreaterThanOrEqual'] != nil
				self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['createdAtLessThanOrEqual'] != nil
				self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			end
			if xml_element.elements['updatedAtGreaterThanOrEqual'] != nil
				self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['updatedAtLessThanOrEqual'] != nil
				self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['serviceTypeEqual'] != nil
				self.service_type_equal = xml_element.elements['serviceTypeEqual'].text
			end
			if xml_element.elements['serviceTypeIn'] != nil
				self.service_type_in = xml_element.elements['serviceTypeIn'].text
			end
			if xml_element.elements['serviceFeatureEqual'] != nil
				self.service_feature_equal = xml_element.elements['serviceFeatureEqual'].text
			end
			if xml_element.elements['serviceFeatureIn'] != nil
				self.service_feature_in = xml_element.elements['serviceFeatureIn'].text
			end
			if xml_element.elements['turnAroundTimeEqual'] != nil
				self.turn_around_time_equal = xml_element.elements['turnAroundTimeEqual'].text
			end
			if xml_element.elements['turnAroundTimeIn'] != nil
				self.turn_around_time_in = xml_element.elements['turnAroundTimeIn'].text
			end
		end

	end

	class KalturaVendorTranslationCatalogItem < KalturaVendorCaptionsCatalogItem
		attr_accessor :target_language


		def from_xml(xml_element)
			super
			if xml_element.elements['targetLanguage'] != nil
				self.target_language = xml_element.elements['targetLanguage'].text
			end
		end

	end

	class KalturaReachProfileFilter < KalturaReachProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaReoccurringVendorCredit < KalturaTimeRangeVendorCredit
		attr_accessor :frequency


		def from_xml(xml_element)
			super
			if xml_element.elements['frequency'] != nil
				self.frequency = xml_element.elements['frequency'].text
			end
		end

	end

	class KalturaVendorCatalogItemFilter < KalturaVendorCatalogItemBaseFilter
		attr_accessor :partner_id_equal

		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['partnerIdEqual'] != nil
				self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			end
		end

	end

	class KalturaVendorCaptionsCatalogItemBaseFilter < KalturaVendorCatalogItemFilter
		attr_accessor :source_language_equal
		attr_accessor :source_language_in
		attr_accessor :output_format_equal
		attr_accessor :output_format_in

		def output_format_equal=(val)
			@output_format_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['sourceLanguageEqual'] != nil
				self.source_language_equal = xml_element.elements['sourceLanguageEqual'].text
			end
			if xml_element.elements['sourceLanguageIn'] != nil
				self.source_language_in = xml_element.elements['sourceLanguageIn'].text
			end
			if xml_element.elements['outputFormatEqual'] != nil
				self.output_format_equal = xml_element.elements['outputFormatEqual'].text
			end
			if xml_element.elements['outputFormatIn'] != nil
				self.output_format_in = xml_element.elements['outputFormatIn'].text
			end
		end

	end

	class KalturaVendorAlignmentCatalogItemFilter < KalturaVendorCaptionsCatalogItemBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaVendorAudioDescriptionCatalogItemFilter < KalturaVendorCaptionsCatalogItemBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaVendorCaptionsCatalogItemFilter < KalturaVendorCaptionsCatalogItemBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaVendorChapteringCatalogItemFilter < KalturaVendorCaptionsCatalogItemBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaVendorTranslationCatalogItemBaseFilter < KalturaVendorCaptionsCatalogItemFilter
		attr_accessor :target_language_equal
		attr_accessor :target_language_in


		def from_xml(xml_element)
			super
			if xml_element.elements['targetLanguageEqual'] != nil
				self.target_language_equal = xml_element.elements['targetLanguageEqual'].text
			end
			if xml_element.elements['targetLanguageIn'] != nil
				self.target_language_in = xml_element.elements['targetLanguageIn'].text
			end
		end

	end

	class KalturaVendorTranslationCatalogItemFilter < KalturaVendorTranslationCatalogItemBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Vendor Catalog Item Service
	class KalturaVendorCatalogItemService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Allows you to add an service catalog item
		# @return [KalturaVendorCatalogItem]
		def add(vendor_catalog_item)
			kparams = {}
			client.add_param(kparams, 'vendorCatalogItem', vendor_catalog_item)
			client.queue_service_action_call('reach_vendorcatalogitem', 'add', 'KalturaVendorCatalogItem', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete vedor catalog item object
		# @return []
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('reach_vendorcatalogitem', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve specific catalog item by id
		# @return [KalturaVendorCatalogItem]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('reach_vendorcatalogitem', 'get', 'KalturaVendorCatalogItem', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List KalturaVendorCatalogItem objects
		# @return [KalturaVendorCatalogItemListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('reach_vendorcatalogitem', 'list', 'KalturaVendorCatalogItemListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing vedor catalog item object
		# @return [KalturaVendorCatalogItem]
		def update(id, vendor_catalog_item)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'vendorCatalogItem', vendor_catalog_item)
			client.queue_service_action_call('reach_vendorcatalogitem', 'update', 'KalturaVendorCatalogItem', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update vendor catalog item status by id
		# @return [KalturaVendorCatalogItem]
		def update_status(id, status)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'status', status)
			client.queue_service_action_call('reach_vendorcatalogitem', 'updateStatus', 'KalturaVendorCatalogItem', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Reach Profile Service
	class KalturaReachProfileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Allows you to add a partner specific reach profile
		# @return [KalturaReachProfile]
		def add(reach_profile)
			kparams = {}
			client.add_param(kparams, 'reachProfile', reach_profile)
			client.queue_service_action_call('reach_reachprofile', 'add', 'KalturaReachProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete vednor profile by id
		# @return []
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('reach_reachprofile', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve specific reach profile by id
		# @return [KalturaReachProfile]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('reach_reachprofile', 'get', 'KalturaReachProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List KalturaReachProfile objects
		# @return [KalturaReachProfileListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('reach_reachprofile', 'list', 'KalturaReachProfileListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# sync vednor profile credit
		# @return [KalturaReachProfile]
		def sync_credit(reach_profile_id)
			kparams = {}
			client.add_param(kparams, 'reachProfileId', reach_profile_id)
			client.queue_service_action_call('reach_reachprofile', 'syncCredit', 'KalturaReachProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing reach profile object
		# @return [KalturaReachProfile]
		def update(id, reach_profile)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'reachProfile', reach_profile)
			client.queue_service_action_call('reach_reachprofile', 'update', 'KalturaReachProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update reach profile status by id
		# @return [KalturaReachProfile]
		def update_status(id, status)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'status', status)
			client.queue_service_action_call('reach_reachprofile', 'updateStatus', 'KalturaReachProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Entry Vendor Task Service
	class KalturaEntryVendorTaskService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Cancel entry task. will only occur for task in PENDING or PENDING_MODERATION status
		# @return [KalturaEntryVendorTask]
		def abort(id, abort_reason=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'abortReason', abort_reason)
			client.queue_service_action_call('reach_entryvendortask', 'abort', 'KalturaEntryVendorTask', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Allows you to add a entry vendor task
		# @return [KalturaEntryVendorTask]
		def add(entry_vendor_task)
			kparams = {}
			client.add_param(kparams, 'entryVendorTask', entry_vendor_task)
			client.queue_service_action_call('reach_entryvendortask', 'add', 'KalturaEntryVendorTask', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Approve entry vendor task for execution.
		# @return [KalturaEntryVendorTask]
		def approve(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('reach_entryvendortask', 'approve', 'KalturaEntryVendorTask', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# add batch job that sends an email with a link to download an updated CSV that contains list of users
		# @return [string]
		def export_to_csv(filter)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('reach_entryvendortask', 'exportToCsv', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Extend access key in case the existing one has expired.
		# @return [KalturaEntryVendorTask]
		def extend_access_key(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('reach_entryvendortask', 'extendAccessKey', 'KalturaEntryVendorTask', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve specific entry vendor task by id
		# @return [KalturaEntryVendorTask]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('reach_entryvendortask', 'get', 'KalturaEntryVendorTask', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# get KalturaEntryVendorTask objects for specific vendor partner
		# @return [KalturaEntryVendorTaskListResponse]
		def get_jobs(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('reach_entryvendortask', 'getJobs', 'KalturaEntryVendorTaskListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List KalturaEntryVendorTask objects
		# @return [KalturaEntryVendorTaskListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('reach_entryvendortask', 'list', 'KalturaEntryVendorTaskListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Reject entry vendor task for execution.
		# @return [KalturaEntryVendorTask]
		def reject(id, reject_reason=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'rejectReason', reject_reason)
			client.queue_service_action_call('reach_entryvendortask', 'reject', 'KalturaEntryVendorTask', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Will serve a requested csv
		# @return [string]
		def serve_csv(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('reach_entryvendortask', 'serveCsv', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update entry vendor task. Only the properties that were set will be updated.
		# @return [KalturaEntryVendorTask]
		def update(id, entry_vendor_task)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'entryVendorTask', entry_vendor_task)
			client.queue_service_action_call('reach_entryvendortask', 'update', 'KalturaEntryVendorTask', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update entry vendor task. Only the properties that were set will be updated.
		# @return [KalturaEntryVendorTask]
		def update_job(id, entry_vendor_task)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'entryVendorTask', entry_vendor_task)
			client.queue_service_action_call('reach_entryvendortask', 'updateJob', 'KalturaEntryVendorTask', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Partner Catalog Item Service
	class KalturaPartnerCatalogItemService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Assign existing catalogItem to specific account
		# @return [KalturaVendorCatalogItem]
		def add(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('reach_partnercatalogitem', 'add', 'KalturaVendorCatalogItem', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Remove existing catalogItem from specific account
		# @return []
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('reach_partnercatalogitem', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :vendor_catalog_item_service
		def vendor_catalog_item_service
			if (@vendor_catalog_item_service == nil)
				@vendor_catalog_item_service = KalturaVendorCatalogItemService.new(self)
			end
			return @vendor_catalog_item_service
		end
		
		attr_reader :reach_profile_service
		def reach_profile_service
			if (@reach_profile_service == nil)
				@reach_profile_service = KalturaReachProfileService.new(self)
			end
			return @reach_profile_service
		end
		
		attr_reader :entry_vendor_task_service
		def entry_vendor_task_service
			if (@entry_vendor_task_service == nil)
				@entry_vendor_task_service = KalturaEntryVendorTaskService.new(self)
			end
			return @entry_vendor_task_service
		end
		
		attr_reader :partner_catalog_item_service
		def partner_catalog_item_service
			if (@partner_catalog_item_service == nil)
				@partner_catalog_item_service = KalturaPartnerCatalogItemService.new(self)
			end
			return @partner_catalog_item_service
		end
		
	end

end
