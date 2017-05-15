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
require File.dirname(__FILE__) + '/kaltura_metadata_client_plugin.rb'

module Kaltura

	class KalturaDropFolderContentFileHandlerMatchPolicy
		ADD_AS_NEW = 1
		MATCH_EXISTING_OR_ADD_AS_NEW = 2
		MATCH_EXISTING_OR_KEEP_IN_FOLDER = 3
	end

	class KalturaDropFolderFileDeletePolicy
		MANUAL_DELETE = 1
		AUTO_DELETE = 2
		AUTO_DELETE_WHEN_ENTRY_IS_READY = 3
	end

	class KalturaDropFolderFileStatus
		UPLOADING = 1
		PENDING = 2
		WAITING = 3
		HANDLED = 4
		IGNORE = 5
		DELETED = 6
		PURGED = 7
		NO_MATCH = 8
		ERROR_HANDLING = 9
		ERROR_DELETING = 10
		DOWNLOADING = 11
		ERROR_DOWNLOADING = 12
		PROCESSING = 13
		PARSED = 14
		DETECTED = 15
	end

	class KalturaDropFolderStatus
		DISABLED = 0
		ENABLED = 1
		DELETED = 2
		ERROR = 3
	end

	class KalturaDropFolderErrorCode
		ERROR_CONNECT = "1"
		ERROR_AUTENTICATE = "2"
		ERROR_GET_PHISICAL_FILE_LIST = "3"
		ERROR_GET_DB_FILE_LIST = "4"
		DROP_FOLDER_APP_ERROR = "5"
		CONTENT_MATCH_POLICY_UNDEFINED = "6"
	end

	class KalturaDropFolderFileErrorCode
		ERROR_ADDING_BULK_UPLOAD = "dropFolderXmlBulkUpload.ERROR_ADDING_BULK_UPLOAD"
		ERROR_ADD_CONTENT_RESOURCE = "dropFolderXmlBulkUpload.ERROR_ADD_CONTENT_RESOURCE"
		ERROR_IN_BULK_UPLOAD = "dropFolderXmlBulkUpload.ERROR_IN_BULK_UPLOAD"
		ERROR_WRITING_TEMP_FILE = "dropFolderXmlBulkUpload.ERROR_WRITING_TEMP_FILE"
		LOCAL_FILE_WRONG_CHECKSUM = "dropFolderXmlBulkUpload.LOCAL_FILE_WRONG_CHECKSUM"
		LOCAL_FILE_WRONG_SIZE = "dropFolderXmlBulkUpload.LOCAL_FILE_WRONG_SIZE"
		MALFORMED_XML_FILE = "dropFolderXmlBulkUpload.MALFORMED_XML_FILE"
		XML_FILE_SIZE_EXCEED_LIMIT = "dropFolderXmlBulkUpload.XML_FILE_SIZE_EXCEED_LIMIT"
		ERROR_UPDATE_ENTRY = "1"
		ERROR_ADD_ENTRY = "2"
		FLAVOR_NOT_FOUND = "3"
		FLAVOR_MISSING_IN_FILE_NAME = "4"
		SLUG_REGEX_NO_MATCH = "5"
		ERROR_READING_FILE = "6"
		ERROR_DOWNLOADING_FILE = "7"
		ERROR_UPDATE_FILE = "8"
		ERROR_ADDING_CONTENT_PROCESSOR = "10"
		ERROR_IN_CONTENT_PROCESSOR = "11"
		ERROR_DELETING_FILE = "12"
		FILE_NO_MATCH = "13"
	end

	class KalturaDropFolderFileHandlerType
		XML = "dropFolderXmlBulkUpload.XML"
		ICAL = "scheduleDropFolder.ICAL"
		CONTENT = "1"
	end

	class KalturaDropFolderFileOrderBy
		CREATED_AT_ASC = "+createdAt"
		FILE_NAME_ASC = "+fileName"
		FILE_SIZE_ASC = "+fileSize"
		FILE_SIZE_LAST_SET_AT_ASC = "+fileSizeLastSetAt"
		ID_ASC = "+id"
		PARSED_FLAVOR_ASC = "+parsedFlavor"
		PARSED_SLUG_ASC = "+parsedSlug"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		FILE_NAME_DESC = "-fileName"
		FILE_SIZE_DESC = "-fileSize"
		FILE_SIZE_LAST_SET_AT_DESC = "-fileSizeLastSetAt"
		ID_DESC = "-id"
		PARSED_FLAVOR_DESC = "-parsedFlavor"
		PARSED_SLUG_DESC = "-parsedSlug"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaDropFolderOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		NAME_ASC = "+name"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		NAME_DESC = "-name"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaDropFolderType
		FEED = "FeedDropFolder.FEED"
		WEBEX = "WebexDropFolder.WEBEX"
		LOCAL = "1"
		FTP = "2"
		SCP = "3"
		SFTP = "4"
		S3 = "6"
	end

	class KalturaFtpDropFolderOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		NAME_ASC = "+name"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		NAME_DESC = "-name"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaRemoteDropFolderOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		NAME_ASC = "+name"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		NAME_DESC = "-name"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaScpDropFolderOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		NAME_ASC = "+name"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		NAME_DESC = "-name"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaSftpDropFolderOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		NAME_ASC = "+name"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		NAME_DESC = "-name"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaSshDropFolderOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		NAME_ASC = "+name"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		NAME_DESC = "-name"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaDropFolderFileHandlerConfig < KalturaObjectBase
		attr_accessor :handler_type


		def from_xml(xml_element)
			super
			if xml_element.elements['handlerType'] != nil
				self.handler_type = xml_element.elements['handlerType'].text
			end
		end

	end

	class KalturaDropFolder < KalturaObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :name
		attr_accessor :description
		attr_accessor :type
		attr_accessor :status
		attr_accessor :conversion_profile_id
		attr_accessor :dc
		attr_accessor :path
		# The ammount of time, in seconds, that should pass so that a file with no change in size we'll be treated as "finished uploading to folder"
		attr_accessor :file_size_check_interval
		attr_accessor :file_delete_policy
		attr_accessor :auto_file_delete_days
		attr_accessor :file_handler_type
		attr_accessor :file_name_patterns
		attr_accessor :file_handler_config
		attr_accessor :tags
		attr_accessor :error_code
		attr_accessor :error_description
		attr_accessor :ignore_file_name_patterns
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :last_accessed_at
		attr_accessor :incremental
		attr_accessor :last_file_timestamp
		attr_accessor :metadata_profile_id
		attr_accessor :categories_metadata_field_name
		attr_accessor :enforce_entitlement
		attr_accessor :should_validate_ks

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def conversion_profile_id=(val)
			@conversion_profile_id = val.to_i
		end
		def dc=(val)
			@dc = val.to_i
		end
		def file_size_check_interval=(val)
			@file_size_check_interval = val.to_i
		end
		def file_delete_policy=(val)
			@file_delete_policy = val.to_i
		end
		def auto_file_delete_days=(val)
			@auto_file_delete_days = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def last_accessed_at=(val)
			@last_accessed_at = val.to_i
		end
		def incremental=(val)
			@incremental = to_b(val)
		end
		def last_file_timestamp=(val)
			@last_file_timestamp = val.to_i
		end
		def metadata_profile_id=(val)
			@metadata_profile_id = val.to_i
		end
		def enforce_entitlement=(val)
			@enforce_entitlement = to_b(val)
		end
		def should_validate_ks=(val)
			@should_validate_ks = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['conversionProfileId'] != nil
				self.conversion_profile_id = xml_element.elements['conversionProfileId'].text
			end
			if xml_element.elements['dc'] != nil
				self.dc = xml_element.elements['dc'].text
			end
			if xml_element.elements['path'] != nil
				self.path = xml_element.elements['path'].text
			end
			if xml_element.elements['fileSizeCheckInterval'] != nil
				self.file_size_check_interval = xml_element.elements['fileSizeCheckInterval'].text
			end
			if xml_element.elements['fileDeletePolicy'] != nil
				self.file_delete_policy = xml_element.elements['fileDeletePolicy'].text
			end
			if xml_element.elements['autoFileDeleteDays'] != nil
				self.auto_file_delete_days = xml_element.elements['autoFileDeleteDays'].text
			end
			if xml_element.elements['fileHandlerType'] != nil
				self.file_handler_type = xml_element.elements['fileHandlerType'].text
			end
			if xml_element.elements['fileNamePatterns'] != nil
				self.file_name_patterns = xml_element.elements['fileNamePatterns'].text
			end
			if xml_element.elements['fileHandlerConfig'] != nil
				self.file_handler_config = KalturaClientBase.object_from_xml(xml_element.elements['fileHandlerConfig'], 'KalturaDropFolderFileHandlerConfig')
			end
			if xml_element.elements['tags'] != nil
				self.tags = xml_element.elements['tags'].text
			end
			if xml_element.elements['errorCode'] != nil
				self.error_code = xml_element.elements['errorCode'].text
			end
			if xml_element.elements['errorDescription'] != nil
				self.error_description = xml_element.elements['errorDescription'].text
			end
			if xml_element.elements['ignoreFileNamePatterns'] != nil
				self.ignore_file_name_patterns = xml_element.elements['ignoreFileNamePatterns'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['lastAccessedAt'] != nil
				self.last_accessed_at = xml_element.elements['lastAccessedAt'].text
			end
			if xml_element.elements['incremental'] != nil
				self.incremental = xml_element.elements['incremental'].text
			end
			if xml_element.elements['lastFileTimestamp'] != nil
				self.last_file_timestamp = xml_element.elements['lastFileTimestamp'].text
			end
			if xml_element.elements['metadataProfileId'] != nil
				self.metadata_profile_id = xml_element.elements['metadataProfileId'].text
			end
			if xml_element.elements['categoriesMetadataFieldName'] != nil
				self.categories_metadata_field_name = xml_element.elements['categoriesMetadataFieldName'].text
			end
			if xml_element.elements['enforceEntitlement'] != nil
				self.enforce_entitlement = xml_element.elements['enforceEntitlement'].text
			end
			if xml_element.elements['shouldValidateKS'] != nil
				self.should_validate_ks = xml_element.elements['shouldValidateKS'].text
			end
		end

	end

	class KalturaDropFolderFile < KalturaObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :drop_folder_id
		attr_accessor :file_name
		attr_accessor :file_size
		attr_accessor :file_size_last_set_at
		attr_accessor :status
		attr_accessor :type
		attr_accessor :parsed_slug
		attr_accessor :parsed_flavor
		attr_accessor :parsed_user_id
		attr_accessor :lead_drop_folder_file_id
		attr_accessor :deleted_drop_folder_file_id
		attr_accessor :entry_id
		attr_accessor :error_code
		attr_accessor :error_description
		attr_accessor :last_modification_time
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :upload_start_detected_at
		attr_accessor :upload_end_detected_at
		attr_accessor :import_started_at
		attr_accessor :import_ended_at
		attr_accessor :batch_job_id

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def drop_folder_id=(val)
			@drop_folder_id = val.to_i
		end
		def file_size=(val)
			@file_size = val.to_f
		end
		def file_size_last_set_at=(val)
			@file_size_last_set_at = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def lead_drop_folder_file_id=(val)
			@lead_drop_folder_file_id = val.to_i
		end
		def deleted_drop_folder_file_id=(val)
			@deleted_drop_folder_file_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def upload_start_detected_at=(val)
			@upload_start_detected_at = val.to_i
		end
		def upload_end_detected_at=(val)
			@upload_end_detected_at = val.to_i
		end
		def import_started_at=(val)
			@import_started_at = val.to_i
		end
		def import_ended_at=(val)
			@import_ended_at = val.to_i
		end
		def batch_job_id=(val)
			@batch_job_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['dropFolderId'] != nil
				self.drop_folder_id = xml_element.elements['dropFolderId'].text
			end
			if xml_element.elements['fileName'] != nil
				self.file_name = xml_element.elements['fileName'].text
			end
			if xml_element.elements['fileSize'] != nil
				self.file_size = xml_element.elements['fileSize'].text
			end
			if xml_element.elements['fileSizeLastSetAt'] != nil
				self.file_size_last_set_at = xml_element.elements['fileSizeLastSetAt'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['parsedSlug'] != nil
				self.parsed_slug = xml_element.elements['parsedSlug'].text
			end
			if xml_element.elements['parsedFlavor'] != nil
				self.parsed_flavor = xml_element.elements['parsedFlavor'].text
			end
			if xml_element.elements['parsedUserId'] != nil
				self.parsed_user_id = xml_element.elements['parsedUserId'].text
			end
			if xml_element.elements['leadDropFolderFileId'] != nil
				self.lead_drop_folder_file_id = xml_element.elements['leadDropFolderFileId'].text
			end
			if xml_element.elements['deletedDropFolderFileId'] != nil
				self.deleted_drop_folder_file_id = xml_element.elements['deletedDropFolderFileId'].text
			end
			if xml_element.elements['entryId'] != nil
				self.entry_id = xml_element.elements['entryId'].text
			end
			if xml_element.elements['errorCode'] != nil
				self.error_code = xml_element.elements['errorCode'].text
			end
			if xml_element.elements['errorDescription'] != nil
				self.error_description = xml_element.elements['errorDescription'].text
			end
			if xml_element.elements['lastModificationTime'] != nil
				self.last_modification_time = xml_element.elements['lastModificationTime'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['uploadStartDetectedAt'] != nil
				self.upload_start_detected_at = xml_element.elements['uploadStartDetectedAt'].text
			end
			if xml_element.elements['uploadEndDetectedAt'] != nil
				self.upload_end_detected_at = xml_element.elements['uploadEndDetectedAt'].text
			end
			if xml_element.elements['importStartedAt'] != nil
				self.import_started_at = xml_element.elements['importStartedAt'].text
			end
			if xml_element.elements['importEndedAt'] != nil
				self.import_ended_at = xml_element.elements['importEndedAt'].text
			end
			if xml_element.elements['batchJobId'] != nil
				self.batch_job_id = xml_element.elements['batchJobId'].text
			end
		end

	end

	class KalturaDropFolderBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :name_like
		attr_accessor :type_equal
		attr_accessor :type_in
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :conversion_profile_id_equal
		attr_accessor :conversion_profile_id_in
		attr_accessor :dc_equal
		attr_accessor :dc_in
		attr_accessor :path_equal
		attr_accessor :path_like
		attr_accessor :file_handler_type_equal
		attr_accessor :file_handler_type_in
		attr_accessor :file_name_patterns_like
		attr_accessor :file_name_patterns_multi_like_or
		attr_accessor :file_name_patterns_multi_like_and
		attr_accessor :tags_like
		attr_accessor :tags_multi_like_or
		attr_accessor :tags_multi_like_and
		attr_accessor :error_code_equal
		attr_accessor :error_code_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end
		def conversion_profile_id_equal=(val)
			@conversion_profile_id_equal = val.to_i
		end
		def dc_equal=(val)
			@dc_equal = val.to_i
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

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['partnerIdEqual'] != nil
				self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			end
			if xml_element.elements['partnerIdIn'] != nil
				self.partner_id_in = xml_element.elements['partnerIdIn'].text
			end
			if xml_element.elements['nameLike'] != nil
				self.name_like = xml_element.elements['nameLike'].text
			end
			if xml_element.elements['typeEqual'] != nil
				self.type_equal = xml_element.elements['typeEqual'].text
			end
			if xml_element.elements['typeIn'] != nil
				self.type_in = xml_element.elements['typeIn'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['conversionProfileIdEqual'] != nil
				self.conversion_profile_id_equal = xml_element.elements['conversionProfileIdEqual'].text
			end
			if xml_element.elements['conversionProfileIdIn'] != nil
				self.conversion_profile_id_in = xml_element.elements['conversionProfileIdIn'].text
			end
			if xml_element.elements['dcEqual'] != nil
				self.dc_equal = xml_element.elements['dcEqual'].text
			end
			if xml_element.elements['dcIn'] != nil
				self.dc_in = xml_element.elements['dcIn'].text
			end
			if xml_element.elements['pathEqual'] != nil
				self.path_equal = xml_element.elements['pathEqual'].text
			end
			if xml_element.elements['pathLike'] != nil
				self.path_like = xml_element.elements['pathLike'].text
			end
			if xml_element.elements['fileHandlerTypeEqual'] != nil
				self.file_handler_type_equal = xml_element.elements['fileHandlerTypeEqual'].text
			end
			if xml_element.elements['fileHandlerTypeIn'] != nil
				self.file_handler_type_in = xml_element.elements['fileHandlerTypeIn'].text
			end
			if xml_element.elements['fileNamePatternsLike'] != nil
				self.file_name_patterns_like = xml_element.elements['fileNamePatternsLike'].text
			end
			if xml_element.elements['fileNamePatternsMultiLikeOr'] != nil
				self.file_name_patterns_multi_like_or = xml_element.elements['fileNamePatternsMultiLikeOr'].text
			end
			if xml_element.elements['fileNamePatternsMultiLikeAnd'] != nil
				self.file_name_patterns_multi_like_and = xml_element.elements['fileNamePatternsMultiLikeAnd'].text
			end
			if xml_element.elements['tagsLike'] != nil
				self.tags_like = xml_element.elements['tagsLike'].text
			end
			if xml_element.elements['tagsMultiLikeOr'] != nil
				self.tags_multi_like_or = xml_element.elements['tagsMultiLikeOr'].text
			end
			if xml_element.elements['tagsMultiLikeAnd'] != nil
				self.tags_multi_like_and = xml_element.elements['tagsMultiLikeAnd'].text
			end
			if xml_element.elements['errorCodeEqual'] != nil
				self.error_code_equal = xml_element.elements['errorCodeEqual'].text
			end
			if xml_element.elements['errorCodeIn'] != nil
				self.error_code_in = xml_element.elements['errorCodeIn'].text
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
		end

	end

	class KalturaDropFolderContentFileHandlerConfig < KalturaDropFolderFileHandlerConfig
		attr_accessor :content_match_policy
		# Regular expression that defines valid file names to be handled.
		# 	 The following might be extracted from the file name and used if defined:
		# 	 - (?P<referenceId>\w+) - will be used as the drop folder file's parsed slug.
		# 	 - (?P<flavorName>\w+)  - will be used as the drop folder file's parsed flavor.
		attr_accessor :slug_regex

		def content_match_policy=(val)
			@content_match_policy = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['contentMatchPolicy'] != nil
				self.content_match_policy = xml_element.elements['contentMatchPolicy'].text
			end
			if xml_element.elements['slugRegex'] != nil
				self.slug_regex = xml_element.elements['slugRegex'].text
			end
		end

	end

	class KalturaDropFolderContentProcessorJobData < KalturaJobData
		attr_accessor :drop_folder_id
		attr_accessor :drop_folder_file_ids
		attr_accessor :parsed_slug
		attr_accessor :content_match_policy
		attr_accessor :conversion_profile_id
		attr_accessor :parsed_user_id

		def drop_folder_id=(val)
			@drop_folder_id = val.to_i
		end
		def content_match_policy=(val)
			@content_match_policy = val.to_i
		end
		def conversion_profile_id=(val)
			@conversion_profile_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['dropFolderId'] != nil
				self.drop_folder_id = xml_element.elements['dropFolderId'].text
			end
			if xml_element.elements['dropFolderFileIds'] != nil
				self.drop_folder_file_ids = xml_element.elements['dropFolderFileIds'].text
			end
			if xml_element.elements['parsedSlug'] != nil
				self.parsed_slug = xml_element.elements['parsedSlug'].text
			end
			if xml_element.elements['contentMatchPolicy'] != nil
				self.content_match_policy = xml_element.elements['contentMatchPolicy'].text
			end
			if xml_element.elements['conversionProfileId'] != nil
				self.conversion_profile_id = xml_element.elements['conversionProfileId'].text
			end
			if xml_element.elements['parsedUserId'] != nil
				self.parsed_user_id = xml_element.elements['parsedUserId'].text
			end
		end

	end

	class KalturaDropFolderFileBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :drop_folder_id_equal
		attr_accessor :drop_folder_id_in
		attr_accessor :file_name_equal
		attr_accessor :file_name_in
		attr_accessor :file_name_like
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :status_not_in
		attr_accessor :parsed_slug_equal
		attr_accessor :parsed_slug_in
		attr_accessor :parsed_slug_like
		attr_accessor :parsed_flavor_equal
		attr_accessor :parsed_flavor_in
		attr_accessor :parsed_flavor_like
		attr_accessor :lead_drop_folder_file_id_equal
		attr_accessor :deleted_drop_folder_file_id_equal
		attr_accessor :entry_id_equal
		attr_accessor :error_code_equal
		attr_accessor :error_code_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
		end
		def drop_folder_id_equal=(val)
			@drop_folder_id_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end
		def lead_drop_folder_file_id_equal=(val)
			@lead_drop_folder_file_id_equal = val.to_i
		end
		def deleted_drop_folder_file_id_equal=(val)
			@deleted_drop_folder_file_id_equal = val.to_i
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

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['partnerIdEqual'] != nil
				self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			end
			if xml_element.elements['partnerIdIn'] != nil
				self.partner_id_in = xml_element.elements['partnerIdIn'].text
			end
			if xml_element.elements['dropFolderIdEqual'] != nil
				self.drop_folder_id_equal = xml_element.elements['dropFolderIdEqual'].text
			end
			if xml_element.elements['dropFolderIdIn'] != nil
				self.drop_folder_id_in = xml_element.elements['dropFolderIdIn'].text
			end
			if xml_element.elements['fileNameEqual'] != nil
				self.file_name_equal = xml_element.elements['fileNameEqual'].text
			end
			if xml_element.elements['fileNameIn'] != nil
				self.file_name_in = xml_element.elements['fileNameIn'].text
			end
			if xml_element.elements['fileNameLike'] != nil
				self.file_name_like = xml_element.elements['fileNameLike'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['statusNotIn'] != nil
				self.status_not_in = xml_element.elements['statusNotIn'].text
			end
			if xml_element.elements['parsedSlugEqual'] != nil
				self.parsed_slug_equal = xml_element.elements['parsedSlugEqual'].text
			end
			if xml_element.elements['parsedSlugIn'] != nil
				self.parsed_slug_in = xml_element.elements['parsedSlugIn'].text
			end
			if xml_element.elements['parsedSlugLike'] != nil
				self.parsed_slug_like = xml_element.elements['parsedSlugLike'].text
			end
			if xml_element.elements['parsedFlavorEqual'] != nil
				self.parsed_flavor_equal = xml_element.elements['parsedFlavorEqual'].text
			end
			if xml_element.elements['parsedFlavorIn'] != nil
				self.parsed_flavor_in = xml_element.elements['parsedFlavorIn'].text
			end
			if xml_element.elements['parsedFlavorLike'] != nil
				self.parsed_flavor_like = xml_element.elements['parsedFlavorLike'].text
			end
			if xml_element.elements['leadDropFolderFileIdEqual'] != nil
				self.lead_drop_folder_file_id_equal = xml_element.elements['leadDropFolderFileIdEqual'].text
			end
			if xml_element.elements['deletedDropFolderFileIdEqual'] != nil
				self.deleted_drop_folder_file_id_equal = xml_element.elements['deletedDropFolderFileIdEqual'].text
			end
			if xml_element.elements['entryIdEqual'] != nil
				self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			end
			if xml_element.elements['errorCodeEqual'] != nil
				self.error_code_equal = xml_element.elements['errorCodeEqual'].text
			end
			if xml_element.elements['errorCodeIn'] != nil
				self.error_code_in = xml_element.elements['errorCodeIn'].text
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
		end

	end

	class KalturaDropFolderFileListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaDropFolderFile')
			end
		end

	end

	class KalturaDropFolderListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaDropFolder')
			end
		end

	end

	class KalturaRemoteDropFolder < KalturaDropFolder


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDropFolderFileFilter < KalturaDropFolderFileBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDropFolderFilter < KalturaDropFolderBaseFilter
		attr_accessor :current_dc

		def current_dc=(val)
			@current_dc = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['currentDc'] != nil
				self.current_dc = xml_element.elements['currentDc'].text
			end
		end

	end

	class KalturaFtpDropFolder < KalturaRemoteDropFolder
		attr_accessor :host
		attr_accessor :port
		attr_accessor :username
		attr_accessor :password

		def port=(val)
			@port = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['host'] != nil
				self.host = xml_element.elements['host'].text
			end
			if xml_element.elements['port'] != nil
				self.port = xml_element.elements['port'].text
			end
			if xml_element.elements['username'] != nil
				self.username = xml_element.elements['username'].text
			end
			if xml_element.elements['password'] != nil
				self.password = xml_element.elements['password'].text
			end
		end

	end

	class KalturaSshDropFolder < KalturaRemoteDropFolder
		attr_accessor :host
		attr_accessor :port
		attr_accessor :username
		attr_accessor :password
		attr_accessor :private_key
		attr_accessor :public_key
		attr_accessor :pass_phrase

		def port=(val)
			@port = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['host'] != nil
				self.host = xml_element.elements['host'].text
			end
			if xml_element.elements['port'] != nil
				self.port = xml_element.elements['port'].text
			end
			if xml_element.elements['username'] != nil
				self.username = xml_element.elements['username'].text
			end
			if xml_element.elements['password'] != nil
				self.password = xml_element.elements['password'].text
			end
			if xml_element.elements['privateKey'] != nil
				self.private_key = xml_element.elements['privateKey'].text
			end
			if xml_element.elements['publicKey'] != nil
				self.public_key = xml_element.elements['publicKey'].text
			end
			if xml_element.elements['passPhrase'] != nil
				self.pass_phrase = xml_element.elements['passPhrase'].text
			end
		end

	end

	# Used to ingest media that dropped through drop folder
	class KalturaDropFolderFileResource < KalturaDataCenterContentResource
		# Id of the drop folder file object
		attr_accessor :drop_folder_file_id

		def drop_folder_file_id=(val)
			@drop_folder_file_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['dropFolderFileId'] != nil
				self.drop_folder_file_id = xml_element.elements['dropFolderFileId'].text
			end
		end

	end

	class KalturaDropFolderImportJobData < KalturaSshImportJobData
		attr_accessor :drop_folder_file_id

		def drop_folder_file_id=(val)
			@drop_folder_file_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['dropFolderFileId'] != nil
				self.drop_folder_file_id = xml_element.elements['dropFolderFileId'].text
			end
		end

	end

	class KalturaRemoteDropFolderBaseFilter < KalturaDropFolderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaScpDropFolder < KalturaSshDropFolder


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSftpDropFolder < KalturaSshDropFolder


		def from_xml(xml_element)
			super
		end

	end

	class KalturaRemoteDropFolderFilter < KalturaRemoteDropFolderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFtpDropFolderBaseFilter < KalturaRemoteDropFolderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSshDropFolderBaseFilter < KalturaRemoteDropFolderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaFtpDropFolderFilter < KalturaFtpDropFolderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSshDropFolderFilter < KalturaSshDropFolderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaScpDropFolderBaseFilter < KalturaSshDropFolderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSftpDropFolderBaseFilter < KalturaSshDropFolderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaScpDropFolderFilter < KalturaScpDropFolderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSftpDropFolderFilter < KalturaSftpDropFolderBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# DropFolder service lets you create and manage drop folders
	class KalturaDropFolderService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Allows you to add a new KalturaDropFolder object
		# @return [KalturaDropFolder]
		def add(drop_folder)
			kparams = {}
			client.add_param(kparams, 'dropFolder', drop_folder)
			client.queue_service_action_call('dropfolder_dropfolder', 'add', 'KalturaDropFolder', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Mark the KalturaDropFolder object as deleted
		# @return [KalturaDropFolder]
		def delete(drop_folder_id)
			kparams = {}
			client.add_param(kparams, 'dropFolderId', drop_folder_id)
			client.queue_service_action_call('dropfolder_dropfolder', 'delete', 'KalturaDropFolder', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# freeExclusive KalturaDropFolder object
		# @return [KalturaDropFolder]
		def free_exclusive_drop_folder(drop_folder_id, status, error_code=KalturaNotImplemented, error_description=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'dropFolderId', drop_folder_id)
			client.add_param(kparams, 'status', status)
			client.add_param(kparams, 'errorCode', error_code)
			client.add_param(kparams, 'errorDescription', error_description)
			client.queue_service_action_call('dropfolder_dropfolder', 'freeExclusiveDropFolder', 'KalturaDropFolder', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a KalturaDropFolder object by ID
		# @return [KalturaDropFolder]
		def get(drop_folder_id)
			kparams = {}
			client.add_param(kparams, 'dropFolderId', drop_folder_id)
			client.queue_service_action_call('dropfolder_dropfolder', 'get', 'KalturaDropFolder', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# getExclusive KalturaDropFolder object
		# @return [KalturaDropFolder]
		def get_exclusive_drop_folder(tag, max_time)
			kparams = {}
			client.add_param(kparams, 'tag', tag)
			client.add_param(kparams, 'maxTime', max_time)
			client.queue_service_action_call('dropfolder_dropfolder', 'getExclusiveDropFolder', 'KalturaDropFolder', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List KalturaDropFolder objects
		# @return [KalturaDropFolderListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('dropfolder_dropfolder', 'list', 'KalturaDropFolderListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing KalturaDropFolder object
		# @return [KalturaDropFolder]
		def update(drop_folder_id, drop_folder)
			kparams = {}
			client.add_param(kparams, 'dropFolderId', drop_folder_id)
			client.add_param(kparams, 'dropFolder', drop_folder)
			client.queue_service_action_call('dropfolder_dropfolder', 'update', 'KalturaDropFolder', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# DropFolderFile service lets you create and manage drop folder files
	class KalturaDropFolderFileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Allows you to add a new KalturaDropFolderFile object
		# @return [KalturaDropFolderFile]
		def add(drop_folder_file)
			kparams = {}
			client.add_param(kparams, 'dropFolderFile', drop_folder_file)
			client.queue_service_action_call('dropfolder_dropfolderfile', 'add', 'KalturaDropFolderFile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Mark the KalturaDropFolderFile object as deleted
		# @return [KalturaDropFolderFile]
		def delete(drop_folder_file_id)
			kparams = {}
			client.add_param(kparams, 'dropFolderFileId', drop_folder_file_id)
			client.queue_service_action_call('dropfolder_dropfolderfile', 'delete', 'KalturaDropFolderFile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a KalturaDropFolderFile object by ID
		# @return [KalturaDropFolderFile]
		def get(drop_folder_file_id)
			kparams = {}
			client.add_param(kparams, 'dropFolderFileId', drop_folder_file_id)
			client.queue_service_action_call('dropfolder_dropfolderfile', 'get', 'KalturaDropFolderFile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Set the KalturaDropFolderFile status to ignore (KalturaDropFolderFileStatus::IGNORE)
		# @return [KalturaDropFolderFile]
		def ignore(drop_folder_file_id)
			kparams = {}
			client.add_param(kparams, 'dropFolderFileId', drop_folder_file_id)
			client.queue_service_action_call('dropfolder_dropfolderfile', 'ignore', 'KalturaDropFolderFile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List KalturaDropFolderFile objects
		# @return [KalturaDropFolderFileListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('dropfolder_dropfolderfile', 'list', 'KalturaDropFolderFileListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing KalturaDropFolderFile object
		# @return [KalturaDropFolderFile]
		def update(drop_folder_file_id, drop_folder_file)
			kparams = {}
			client.add_param(kparams, 'dropFolderFileId', drop_folder_file_id)
			client.add_param(kparams, 'dropFolderFile', drop_folder_file)
			client.queue_service_action_call('dropfolder_dropfolderfile', 'update', 'KalturaDropFolderFile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update status of KalturaDropFolderFile
		# @return [KalturaDropFolderFile]
		def update_status(drop_folder_file_id, status)
			kparams = {}
			client.add_param(kparams, 'dropFolderFileId', drop_folder_file_id)
			client.add_param(kparams, 'status', status)
			client.queue_service_action_call('dropfolder_dropfolderfile', 'updateStatus', 'KalturaDropFolderFile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :drop_folder_service
		def drop_folder_service
			if (@drop_folder_service == nil)
				@drop_folder_service = KalturaDropFolderService.new(self)
			end
			return @drop_folder_service
		end
		
		attr_reader :drop_folder_file_service
		def drop_folder_file_service
			if (@drop_folder_file_service == nil)
				@drop_folder_file_service = KalturaDropFolderFileService.new(self)
			end
			return @drop_folder_file_service
		end
		
	end

end
