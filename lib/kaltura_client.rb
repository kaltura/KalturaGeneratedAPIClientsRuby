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
require 'kaltura_client_base.rb'
require 'kaltura_enums.rb'
require 'kaltura_types.rb'

module Kaltura


	# Manage access control profiles
	#  
	class KalturaAccessControlProfileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new access control profile
		# 	 
		def add(access_control_profile)
			kparams = {}
			client.add_param(kparams, 'accessControlProfile', access_control_profile)
			client.queue_service_action_call('accesscontrolprofile', 'add', 'KalturaAccessControlProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get access control profile by id
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('accesscontrolprofile', 'get', 'KalturaAccessControlProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update access control profile by id
		# 	 
		def update(id, access_control_profile)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'accessControlProfile', access_control_profile)
			client.queue_service_action_call('accesscontrolprofile', 'update', 'KalturaAccessControlProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete access control profile by id
		# 	 
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('accesscontrolprofile', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List access control profiles by filter and pager
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('accesscontrolprofile', 'list', 'KalturaAccessControlProfileListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Add & Manage Access Controls
	#  
	class KalturaAccessControlService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new Access Control Profile
		# 	 
		def add(access_control)
			kparams = {}
			client.add_param(kparams, 'accessControl', access_control)
			client.queue_service_action_call('accesscontrol', 'add', 'KalturaAccessControl', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get Access Control Profile by id
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('accesscontrol', 'get', 'KalturaAccessControl', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update Access Control Profile by id
		# 	 
		def update(id, access_control)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'accessControl', access_control)
			client.queue_service_action_call('accesscontrol', 'update', 'KalturaAccessControl', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete Access Control Profile by id
		# 	 
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('accesscontrol', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List Access Control Profiles by filter and pager
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('accesscontrol', 'list', 'KalturaAccessControlListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Manage details for the administrative user
	#  
	class KalturaAdminUserService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Update admin user password and email
		# 	 
		def update_password(email, password, new_email='', new_password='')
			kparams = {}
			client.add_param(kparams, 'email', email)
			client.add_param(kparams, 'password', password)
			client.add_param(kparams, 'newEmail', new_email)
			client.add_param(kparams, 'newPassword', new_password)
			client.queue_service_action_call('adminuser', 'updatePassword', 'KalturaAdminUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Reset admin user password and send it to the users email address
		# 	 
		def reset_password(email)
			kparams = {}
			client.add_param(kparams, 'email', email)
			client.queue_service_action_call('adminuser', 'resetPassword', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get an admin session using admin email and password (Used for login to the KMC application)
		# 	 
		def login(email, password, partner_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'email', email)
			client.add_param(kparams, 'password', password)
			client.add_param(kparams, 'partnerId', partner_id)
			client.queue_service_action_call('adminuser', 'login', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Set initial users password
		# 	 
		def set_initial_password(hash_key, new_password)
			kparams = {}
			client.add_param(kparams, 'hashKey', hash_key)
			client.add_param(kparams, 'newPassword', new_password)
			client.queue_service_action_call('adminuser', 'setInitialPassword', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Manage application authentication tokens
	#  
	class KalturaAppTokenService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new application authentication token
		# 	 
		def add(app_token)
			kparams = {}
			client.add_param(kparams, 'appToken', app_token)
			client.queue_service_action_call('apptoken', 'add', 'KalturaAppToken', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get application authentication token by id
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('apptoken', 'get', 'KalturaAppToken', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update application authentication token by id
		# 	 
		def update(id, app_token)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'appToken', app_token)
			client.queue_service_action_call('apptoken', 'update', 'KalturaAppToken', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete application authentication token by id
		# 	 
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('apptoken', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List application authentication tokens by filter and pager
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('apptoken', 'list', 'KalturaAppTokenListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Starts a new KS (kaltura Session) based on application authentication token id
		# 	 
		def start_session(id, token_hash, user_id=KalturaNotImplemented, type=KalturaNotImplemented, expiry=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'tokenHash', token_hash)
			client.add_param(kparams, 'userId', user_id)
			client.add_param(kparams, 'type', type)
			client.add_param(kparams, 'expiry', expiry)
			client.queue_service_action_call('apptoken', 'startSession', 'KalturaSessionInfo', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Base Entry Service
	#  
	class KalturaBaseEntryService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Generic add entry, should be used when the uploaded entry type is not known.
		#      
		def add(entry, type=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entry', entry)
			client.add_param(kparams, 'type', type)
			client.queue_service_action_call('baseentry', 'add', 'KalturaBaseEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Attach content resource to entry in status NO_MEDIA
		#      
		def add_content(entry_id, resource)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'resource', resource)
			client.queue_service_action_call('baseentry', 'addContent', 'KalturaBaseEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Generic add entry using an uploaded file, should be used when the uploaded entry type is not known.
		#      
		def add_from_uploaded_file(entry, upload_token_id, type=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entry', entry)
			client.add_param(kparams, 'uploadTokenId', upload_token_id)
			client.add_param(kparams, 'type', type)
			client.queue_service_action_call('baseentry', 'addFromUploadedFile', 'KalturaBaseEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get base entry by ID.
		# 	 
		def get(entry_id, version=-1)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'version', version)
			client.queue_service_action_call('baseentry', 'get', 'KalturaBaseEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get remote storage existing paths for the asset.
		#      
		def get_remote_paths(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('baseentry', 'getRemotePaths', 'KalturaRemotePathListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update base entry. Only the properties that were set will be updated.
		# 	 
		def update(entry_id, base_entry)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'baseEntry', base_entry)
			client.queue_service_action_call('baseentry', 'update', 'KalturaBaseEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update the content resource associated with the entry.
		# 	 
		def update_content(entry_id, resource, conversion_profile_id=KalturaNotImplemented, advanced_options=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'resource', resource)
			client.add_param(kparams, 'conversionProfileId', conversion_profile_id)
			client.add_param(kparams, 'advancedOptions', advanced_options)
			client.queue_service_action_call('baseentry', 'updateContent', 'KalturaBaseEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get an array of KalturaBaseEntry objects by a comma-separated list of ids.
		# 	 
		def get_by_ids(entry_ids)
			kparams = {}
			client.add_param(kparams, 'entryIds', entry_ids)
			client.queue_service_action_call('baseentry', 'getByIds', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete an entry.
		# 	 
		def delete(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('baseentry', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List base entries by filter with paging support.
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('baseentry', 'list', 'KalturaBaseEntryListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List base entries by filter according to reference id
		# 	 
		def list_by_reference_id(ref_id, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'refId', ref_id)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('baseentry', 'listByReferenceId', 'KalturaBaseEntryListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Count base entries by filter.
		# 	 
		def count(filter=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('baseentry', 'count', 'int', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Upload a file to Kaltura, that can be used to create an entry.
		# 	 
		def upload(file_data)
			kparams = {}
			kfiles = {}
			client.add_param(kfiles, 'fileData', file_data)
			client.queue_service_action_call('baseentry', 'upload', 'string', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update entry thumbnail using a raw jpeg file.
		# 	 
		def update_thumbnail_jpeg(entry_id, file_data)
			kparams = {}
			kfiles = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kfiles, 'fileData', file_data)
			client.queue_service_action_call('baseentry', 'updateThumbnailJpeg', 'KalturaBaseEntry', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update entry thumbnail using url.
		# 	 
		def update_thumbnail_from_url(entry_id, url)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'url', url)
			client.queue_service_action_call('baseentry', 'updateThumbnailFromUrl', 'KalturaBaseEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update entry thumbnail from a different entry by a specified time offset (in seconds).
		# 	 
		def update_thumbnail_from_source_entry(entry_id, source_entry_id, time_offset)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'sourceEntryId', source_entry_id)
			client.add_param(kparams, 'timeOffset', time_offset)
			client.queue_service_action_call('baseentry', 'updateThumbnailFromSourceEntry', 'KalturaBaseEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Flag inappropriate entry for moderation.
		# 	 
		def flag(moderation_flag)
			kparams = {}
			client.add_param(kparams, 'moderationFlag', moderation_flag)
			client.queue_service_action_call('baseentry', 'flag', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Reject the entry and mark the pending flags (if any) as moderated (this will make the entry non-playable).
		# 	 
		def reject(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('baseentry', 'reject', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Approve the entry and mark the pending flags (if any) as moderated (this will make the entry playable).
		# 	 
		def approve(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('baseentry', 'approve', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List all pending flags for the entry.
		# 	 
		def list_flags(entry_id, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('baseentry', 'listFlags', 'KalturaModerationFlagListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Anonymously rank an entry, no validation is done on duplicate rankings.
		# 	 
		def anonymous_rank(entry_id, rank)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'rank', rank)
			client.queue_service_action_call('baseentry', 'anonymousRank', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# This action delivers entry-related data, based on the user's context: access control, restriction, playback format and storage information.
		# 	 
		def get_context_data(entry_id, context_data_params)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'contextDataParams', context_data_params)
			client.queue_service_action_call('baseentry', 'getContextData', 'KalturaEntryContextDataResult', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def export(entry_id, storage_profile_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'storageProfileId', storage_profile_id)
			client.queue_service_action_call('baseentry', 'export', 'KalturaBaseEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Index an entry by id.
		# 	 
		def index(id, should_update=true)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'shouldUpdate', should_update)
			client.queue_service_action_call('baseentry', 'index', 'int', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Clone an entry with optional attributes to apply to the clone
		# 	 
		def clone(entry_id, clone_options=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'cloneOptions', clone_options)
			client.queue_service_action_call('baseentry', 'clone', 'KalturaBaseEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Bulk upload service is used to upload & manage bulk uploads using CSV files.
	#  This service manages only entry bulk uploads.
	#  
	class KalturaBulkUploadService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new bulk upload batch job
		# 	 Conversion profile id can be specified in the API or in the CSV file, the one in the CSV file will be stronger.
		# 	 If no conversion profile was specified, partner's default will be used
		# 	 
		def add(conversion_profile_id, csv_file_data, bulk_upload_type=KalturaNotImplemented, uploaded_by=KalturaNotImplemented, file_name=KalturaNotImplemented)
			kparams = {}
			kfiles = {}
			client.add_param(kparams, 'conversionProfileId', conversion_profile_id)
			client.add_param(kfiles, 'csvFileData', csv_file_data)
			client.add_param(kparams, 'bulkUploadType', bulk_upload_type)
			client.add_param(kparams, 'uploadedBy', uploaded_by)
			client.add_param(kparams, 'fileName', file_name)
			client.queue_service_action_call('bulkupload', 'add', 'KalturaBulkUpload', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get bulk upload batch job by id
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('bulkupload', 'get', 'KalturaBulkUpload', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List bulk upload batch jobs
		# 	 
		def list(pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('bulkupload', 'list', 'KalturaBulkUploadListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# serve action returan the original file.
		# 	 
		def serve(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('bulkupload', 'serve', 'file', kparams)
			return client.get_serve_url()
		end

		# serveLog action returan the original file.
		# 	 
		def serve_log(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('bulkupload', 'serveLog', 'file', kparams)
			return client.get_serve_url()
		end

		# Aborts the bulk upload and all its child jobs
		# 	 
		def abort(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('bulkupload', 'abort', 'KalturaBulkUpload', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Add & Manage CategoryEntry - assign entry to category
	#  
	class KalturaCategoryEntryService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new CategoryEntry
		# 	 
		def add(category_entry)
			kparams = {}
			client.add_param(kparams, 'categoryEntry', category_entry)
			client.queue_service_action_call('categoryentry', 'add', 'KalturaCategoryEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete CategoryEntry
		# 	 
		def delete(entry_id, category_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'categoryId', category_id)
			client.queue_service_action_call('categoryentry', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List all categoryEntry
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('categoryentry', 'list', 'KalturaCategoryEntryListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Index CategoryEntry by Id
		# 	 
		def index(entry_id, category_id, should_update=true)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'categoryId', category_id)
			client.add_param(kparams, 'shouldUpdate', should_update)
			client.queue_service_action_call('categoryentry', 'index', 'int', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# activate CategoryEntry when it is pending moderation
		# 	 
		def activate(entry_id, category_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'categoryId', category_id)
			client.queue_service_action_call('categoryentry', 'activate', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# activate CategoryEntry when it is pending moderation
		# 	 
		def reject(entry_id, category_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'categoryId', category_id)
			client.queue_service_action_call('categoryentry', 'reject', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# update privacy context from the category
		# 	 
		def sync_privacy_context(entry_id, category_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'categoryId', category_id)
			client.queue_service_action_call('categoryentry', 'syncPrivacyContext', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def add_from_bulk_upload(bulk_upload_data, bulk_upload_category_entry_data=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'bulkUploadData', bulk_upload_data)
			client.add_param(kparams, 'bulkUploadCategoryEntryData', bulk_upload_category_entry_data)
			client.queue_service_action_call('categoryentry', 'addFromBulkUpload', 'KalturaBulkUpload', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Add & Manage Categories
	#  
	class KalturaCategoryService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new Category
		# 	 
		def add(category)
			kparams = {}
			client.add_param(kparams, 'category', category)
			client.queue_service_action_call('category', 'add', 'KalturaCategory', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get Category by id
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('category', 'get', 'KalturaCategory', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update Category
		# 	 
		def update(id, category)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'category', category)
			client.queue_service_action_call('category', 'update', 'KalturaCategory', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete a Category
		# 	 
		def delete(id, move_entries_to_parent_category=1)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'moveEntriesToParentCategory', move_entries_to_parent_category)
			client.queue_service_action_call('category', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List all categories
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('category', 'list', 'KalturaCategoryListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Index Category by id
		# 	 
		def index(id, should_update=true)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'shouldUpdate', should_update)
			client.queue_service_action_call('category', 'index', 'int', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Move categories that belong to the same parent category to a target categroy - enabled only for ks with disable entitlement
		# 	 
		def move(category_ids, target_category_parent_id)
			kparams = {}
			client.add_param(kparams, 'categoryIds', category_ids)
			client.add_param(kparams, 'targetCategoryParentId', target_category_parent_id)
			client.queue_service_action_call('category', 'move', 'KalturaCategoryListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Unlock categories
		# 	 
		def unlock_categories()
			kparams = {}
			client.queue_service_action_call('category', 'unlockCategories', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def add_from_bulk_upload(file_data, bulk_upload_data=KalturaNotImplemented, bulk_upload_category_data=KalturaNotImplemented)
			kparams = {}
			kfiles = {}
			client.add_param(kfiles, 'fileData', file_data)
			client.add_param(kparams, 'bulkUploadData', bulk_upload_data)
			client.add_param(kparams, 'bulkUploadCategoryData', bulk_upload_category_data)
			client.queue_service_action_call('category', 'addFromBulkUpload', 'KalturaBulkUpload', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Add & Manage CategoryUser - membership of a user in a category
	#  
	class KalturaCategoryUserService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new CategoryUser
		# 	 
		def add(category_user)
			kparams = {}
			client.add_param(kparams, 'categoryUser', category_user)
			client.queue_service_action_call('categoryuser', 'add', 'KalturaCategoryUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get CategoryUser by id
		# 	 
		def get(category_id, user_id)
			kparams = {}
			client.add_param(kparams, 'categoryId', category_id)
			client.add_param(kparams, 'userId', user_id)
			client.queue_service_action_call('categoryuser', 'get', 'KalturaCategoryUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update CategoryUser by id
		# 	 
		def update(category_id, user_id, category_user, override=false)
			kparams = {}
			client.add_param(kparams, 'categoryId', category_id)
			client.add_param(kparams, 'userId', user_id)
			client.add_param(kparams, 'categoryUser', category_user)
			client.add_param(kparams, 'override', override)
			client.queue_service_action_call('categoryuser', 'update', 'KalturaCategoryUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete a CategoryUser
		# 	 
		def delete(category_id, user_id)
			kparams = {}
			client.add_param(kparams, 'categoryId', category_id)
			client.add_param(kparams, 'userId', user_id)
			client.queue_service_action_call('categoryuser', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# activate CategoryUser
		# 	 
		def activate(category_id, user_id)
			kparams = {}
			client.add_param(kparams, 'categoryId', category_id)
			client.add_param(kparams, 'userId', user_id)
			client.queue_service_action_call('categoryuser', 'activate', 'KalturaCategoryUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# reject CategoryUser
		# 	 
		def deactivate(category_id, user_id)
			kparams = {}
			client.add_param(kparams, 'categoryId', category_id)
			client.add_param(kparams, 'userId', user_id)
			client.queue_service_action_call('categoryuser', 'deactivate', 'KalturaCategoryUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List all categories
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('categoryuser', 'list', 'KalturaCategoryUserListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Copy all memeber from parent category
		# 	 
		def copy_from_category(category_id)
			kparams = {}
			client.add_param(kparams, 'categoryId', category_id)
			client.queue_service_action_call('categoryuser', 'copyFromCategory', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Index CategoryUser by userid and category id
		# 	 
		def index(user_id, category_id, should_update=true)
			kparams = {}
			client.add_param(kparams, 'userId', user_id)
			client.add_param(kparams, 'categoryId', category_id)
			client.add_param(kparams, 'shouldUpdate', should_update)
			client.queue_service_action_call('categoryuser', 'index', 'int', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def add_from_bulk_upload(file_data, bulk_upload_data=KalturaNotImplemented, bulk_upload_category_user_data=KalturaNotImplemented)
			kparams = {}
			kfiles = {}
			client.add_param(kfiles, 'fileData', file_data)
			client.add_param(kparams, 'bulkUploadData', bulk_upload_data)
			client.add_param(kparams, 'bulkUploadCategoryUserData', bulk_upload_category_user_data)
			client.queue_service_action_call('categoryuser', 'addFromBulkUpload', 'KalturaBulkUpload', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Manage the connection between Conversion Profiles and Asset Params
	#  
	class KalturaConversionProfileAssetParamsService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Lists asset parmas of conversion profile by ID
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('conversionprofileassetparams', 'list', 'KalturaConversionProfileAssetParamsListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update asset parmas of conversion profile by ID
		# 	 
		def update(conversion_profile_id, asset_params_id, conversion_profile_asset_params)
			kparams = {}
			client.add_param(kparams, 'conversionProfileId', conversion_profile_id)
			client.add_param(kparams, 'assetParamsId', asset_params_id)
			client.add_param(kparams, 'conversionProfileAssetParams', conversion_profile_asset_params)
			client.queue_service_action_call('conversionprofileassetparams', 'update', 'KalturaConversionProfileAssetParams', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Add & Manage Conversion Profiles
	#  
	class KalturaConversionProfileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Set Conversion Profile to be the partner default
		# 	 
		def set_as_default(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('conversionprofile', 'setAsDefault', 'KalturaConversionProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get the partner's default conversion profile
		# 	 
		def get_default(type=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'type', type)
			client.queue_service_action_call('conversionprofile', 'getDefault', 'KalturaConversionProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Add new Conversion Profile
		# 	 
		def add(conversion_profile)
			kparams = {}
			client.add_param(kparams, 'conversionProfile', conversion_profile)
			client.queue_service_action_call('conversionprofile', 'add', 'KalturaConversionProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get Conversion Profile by ID
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('conversionprofile', 'get', 'KalturaConversionProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update Conversion Profile by ID
		# 	 
		def update(id, conversion_profile)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'conversionProfile', conversion_profile)
			client.queue_service_action_call('conversionprofile', 'update', 'KalturaConversionProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete Conversion Profile by ID
		# 	 
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('conversionprofile', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List Conversion Profiles by filter with paging support
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('conversionprofile', 'list', 'KalturaConversionProfileListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Data service lets you manage data content (textual content)
	#  
	class KalturaDataService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Adds a new data entry
		# 	 
		def add(data_entry)
			kparams = {}
			client.add_param(kparams, 'dataEntry', data_entry)
			client.queue_service_action_call('data', 'add', 'KalturaDataEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get data entry by ID.
		# 	 
		def get(entry_id, version=-1)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'version', version)
			client.queue_service_action_call('data', 'get', 'KalturaDataEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update data entry. Only the properties that were set will be updated.
		# 	 
		def update(entry_id, document_entry)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'documentEntry', document_entry)
			client.queue_service_action_call('data', 'update', 'KalturaDataEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete a data entry.
		# 	 
		def delete(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('data', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List data entries by filter with paging support.
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('data', 'list', 'KalturaDataListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# serve action returan the file from dataContent field.
		# 	 
		def serve(entry_id, version=-1, force_proxy=false)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'version', version)
			client.add_param(kparams, 'forceProxy', force_proxy)
			client.queue_service_action_call('data', 'serve', 'file', kparams)
			return client.get_serve_url()
		end
	end

	# delivery service is used to control delivery objects
	#  
	class KalturaDeliveryProfileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new delivery.
		# 	 
		def add(delivery)
			kparams = {}
			client.add_param(kparams, 'delivery', delivery)
			client.queue_service_action_call('deliveryprofile', 'add', 'KalturaDeliveryProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update exisiting delivery
		# 	 
		def update(id, delivery)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'delivery', delivery)
			client.queue_service_action_call('deliveryprofile', 'update', 'KalturaDeliveryProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get delivery by id
		# 	
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('deliveryprofile', 'get', 'KalturaDeliveryProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Add delivery based on existing delivery.
		# 	Must provide valid sourceDeliveryId
		# 	
		def clone(delivery_id)
			kparams = {}
			client.add_param(kparams, 'deliveryId', delivery_id)
			client.queue_service_action_call('deliveryprofile', 'clone', 'KalturaDeliveryProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a list of available delivery depends on the filter given
		# 	
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('deliveryprofile', 'list', 'KalturaDeliveryProfileListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Document service
	#  
	class KalturaDocumentService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new document entry after the specific document file was uploaded and the upload token id exists
		# 	 
		def add_from_uploaded_file(document_entry, upload_token_id)
			kparams = {}
			client.add_param(kparams, 'documentEntry', document_entry)
			client.add_param(kparams, 'uploadTokenId', upload_token_id)
			client.queue_service_action_call('document', 'addFromUploadedFile', 'KalturaDocumentEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Copy entry into new entry
		# 	 
		def add_from_entry(source_entry_id, document_entry=KalturaNotImplemented, source_flavor_params_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'sourceEntryId', source_entry_id)
			client.add_param(kparams, 'documentEntry', document_entry)
			client.add_param(kparams, 'sourceFlavorParamsId', source_flavor_params_id)
			client.queue_service_action_call('document', 'addFromEntry', 'KalturaDocumentEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Copy flavor asset into new entry
		# 	 
		def add_from_flavor_asset(source_flavor_asset_id, document_entry=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'sourceFlavorAssetId', source_flavor_asset_id)
			client.add_param(kparams, 'documentEntry', document_entry)
			client.queue_service_action_call('document', 'addFromFlavorAsset', 'KalturaDocumentEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Convert entry
		# 	 
		def convert(entry_id, conversion_profile_id=KalturaNotImplemented, dynamic_conversion_attributes=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'conversionProfileId', conversion_profile_id)
			client.add_param(kparams, 'dynamicConversionAttributes', dynamic_conversion_attributes)
			client.queue_service_action_call('document', 'convert', 'bigint', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get document entry by ID.
		# 	 
		def get(entry_id, version=-1)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'version', version)
			client.queue_service_action_call('document', 'get', 'KalturaDocumentEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update document entry. Only the properties that were set will be updated.
		# 	 
		def update(entry_id, document_entry)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'documentEntry', document_entry)
			client.queue_service_action_call('document', 'update', 'KalturaDocumentEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete a document entry.
		# 	 
		def delete(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('document', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List document entries by filter with paging support.
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('document', 'list', 'KalturaDocumentListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Upload a document file to Kaltura, then the file can be used to create a document entry. 
		# 	 
		def upload(file_data)
			kparams = {}
			kfiles = {}
			client.add_param(kfiles, 'fileData', file_data)
			client.queue_service_action_call('document', 'upload', 'string', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# This will queue a batch job for converting the document file to swf
		# 	 Returns the URL where the new swf will be available 
		# 	 
		def convert_ppt_to_swf(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('document', 'convertPptToSwf', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Serves the file content
		# 	 
		def serve(entry_id, flavor_asset_id=KalturaNotImplemented, force_proxy=false)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'flavorAssetId', flavor_asset_id)
			client.add_param(kparams, 'forceProxy', force_proxy)
			client.queue_service_action_call('document', 'serve', 'file', kparams)
			return client.get_serve_url()
		end

		# Serves the file content
		# 	 
		def serve_by_flavor_params_id(entry_id, flavor_params_id=KalturaNotImplemented, force_proxy=false)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'flavorParamsId', flavor_params_id)
			client.add_param(kparams, 'forceProxy', force_proxy)
			client.queue_service_action_call('document', 'serveByFlavorParamsId', 'file', kparams)
			return client.get_serve_url()
		end

		# Replace content associated with the given document entry.
		# 	 
		def update_content(entry_id, resource, conversion_profile_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'resource', resource)
			client.add_param(kparams, 'conversionProfileId', conversion_profile_id)
			client.queue_service_action_call('document', 'updateContent', 'KalturaDocumentEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Approves document replacement
		# 	 
		def approve_replace(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('document', 'approveReplace', 'KalturaDocumentEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Cancels document replacement
		# 	 
		def cancel_replace(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('document', 'cancelReplace', 'KalturaDocumentEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# EmailIngestionProfile service lets you manage email ingestion profile records
	#  
	class KalturaEmailIngestionProfileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# EmailIngestionProfile Add action allows you to add a EmailIngestionProfile to Kaltura DB
		# 	 
		def add(email_ip)
			kparams = {}
			client.add_param(kparams, 'EmailIP', email_ip)
			client.queue_service_action_call('emailingestionprofile', 'add', 'KalturaEmailIngestionProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a EmailIngestionProfile by email address
		# 	 
		def get_by_email_address(email_address)
			kparams = {}
			client.add_param(kparams, 'emailAddress', email_address)
			client.queue_service_action_call('emailingestionprofile', 'getByEmailAddress', 'KalturaEmailIngestionProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a EmailIngestionProfile by id
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('emailingestionprofile', 'get', 'KalturaEmailIngestionProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing EmailIngestionProfile
		# 	 
		def update(id, email_ip)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'EmailIP', email_ip)
			client.queue_service_action_call('emailingestionprofile', 'update', 'KalturaEmailIngestionProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete an existing EmailIngestionProfile
		# 	 
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('emailingestionprofile', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# add KalturaMediaEntry from email ingestion
		# 	 
		def add_media_entry(media_entry, upload_token_id, email_prof_id, from_address, email_msg_id)
			kparams = {}
			client.add_param(kparams, 'mediaEntry', media_entry)
			client.add_param(kparams, 'uploadTokenId', upload_token_id)
			client.add_param(kparams, 'emailProfId', email_prof_id)
			client.add_param(kparams, 'fromAddress', from_address)
			client.add_param(kparams, 'emailMsgId', email_msg_id)
			client.queue_service_action_call('emailingestionprofile', 'addMediaEntry', 'KalturaMediaEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Manage file assets
	#  
	class KalturaFileAssetService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new file asset
		# 	 
		def add(file_asset)
			kparams = {}
			client.add_param(kparams, 'fileAsset', file_asset)
			client.queue_service_action_call('fileasset', 'add', 'KalturaFileAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get file asset by id
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('fileasset', 'get', 'KalturaFileAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update file asset by id
		# 	 
		def update(id, file_asset)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'fileAsset', file_asset)
			client.queue_service_action_call('fileasset', 'update', 'KalturaFileAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete file asset by id
		# 	 
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('fileasset', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Serve file asset by id
		# 	 
		def serve(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('fileasset', 'serve', 'file', kparams)
			return client.get_serve_url()
		end

		# Set content of file asset
		#      
		def set_content(id, content_resource)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'contentResource', content_resource)
			client.queue_service_action_call('fileasset', 'setContent', 'KalturaFileAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List file assets by filter and pager
		# 	 
		def list(filter, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('fileasset', 'list', 'KalturaFileAssetListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Retrieve information and invoke actions on Flavor Asset
	#  
	class KalturaFlavorAssetService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add flavor asset
		#      
		def add(entry_id, flavor_asset)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'flavorAsset', flavor_asset)
			client.queue_service_action_call('flavorasset', 'add', 'KalturaFlavorAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update flavor asset
		#      
		def update(id, flavor_asset)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'flavorAsset', flavor_asset)
			client.queue_service_action_call('flavorasset', 'update', 'KalturaFlavorAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update content of flavor asset
		#      
		def set_content(id, content_resource)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'contentResource', content_resource)
			client.queue_service_action_call('flavorasset', 'setContent', 'KalturaFlavorAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get Flavor Asset by ID
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('flavorasset', 'get', 'KalturaFlavorAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get Flavor Assets for Entry
		# 	 
		def get_by_entry_id(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('flavorasset', 'getByEntryId', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List Flavor Assets by filter and pager
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('flavorasset', 'list', 'KalturaFlavorAssetListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get web playable Flavor Assets for Entry
		# 	 
		def get_web_playable_by_entry_id(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('flavorasset', 'getWebPlayableByEntryId', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Add and convert new Flavor Asset for Entry with specific Flavor Params
		# 	 
		def convert(entry_id, flavor_params_id, priority=0)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'flavorParamsId', flavor_params_id)
			client.add_param(kparams, 'priority', priority)
			client.queue_service_action_call('flavorasset', 'convert', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Reconvert Flavor Asset by ID
		# 	 
		def reconvert(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('flavorasset', 'reconvert', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete Flavor Asset by ID
		# 	 
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('flavorasset', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get download URL for the asset
		# 	 
		def get_url(id, storage_id=KalturaNotImplemented, force_proxy=false, options=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'storageId', storage_id)
			client.add_param(kparams, 'forceProxy', force_proxy)
			client.add_param(kparams, 'options', options)
			client.queue_service_action_call('flavorasset', 'getUrl', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get remote storage existing paths for the asset
		# 	 
		def get_remote_paths(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('flavorasset', 'getRemotePaths', 'KalturaRemotePathListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get download URL for the Flavor Asset
		# 	 
		def get_download_url(id, use_cdn=false)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'useCdn', use_cdn)
			client.queue_service_action_call('flavorasset', 'getDownloadUrl', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get Flavor Asset with the relevant Flavor Params (Flavor Params can exist without Flavor Asset & vice versa)
		# 	 
		def get_flavor_assets_with_params(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('flavorasset', 'getFlavorAssetsWithParams', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# manually export an asset
		# 	 
		def export(asset_id, storage_profile_id)
			kparams = {}
			client.add_param(kparams, 'assetId', asset_id)
			client.add_param(kparams, 'storageProfileId', storage_profile_id)
			client.queue_service_action_call('flavorasset', 'export', 'KalturaFlavorAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Set a given flavor as the original flavor
		# 	 
		def set_as_source(asset_id)
			kparams = {}
			client.add_param(kparams, 'assetId', asset_id)
			client.queue_service_action_call('flavorasset', 'setAsSource', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# delete all local file syncs for this asset
		# 	 
		def delete_local_content(asset_id)
			kparams = {}
			client.add_param(kparams, 'assetId', asset_id)
			client.queue_service_action_call('flavorasset', 'deleteLocalContent', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Flavor Params Output service
	#  
	class KalturaFlavorParamsOutputService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Get flavor params output object by ID
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('flavorparamsoutput', 'get', 'KalturaFlavorParamsOutput', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List flavor params output objects by filter and pager
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('flavorparamsoutput', 'list', 'KalturaFlavorParamsOutputListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Add & Manage Flavor Params
	#  
	class KalturaFlavorParamsService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new Flavor Params
		# 	 
		def add(flavor_params)
			kparams = {}
			client.add_param(kparams, 'flavorParams', flavor_params)
			client.queue_service_action_call('flavorparams', 'add', 'KalturaFlavorParams', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get Flavor Params by ID
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('flavorparams', 'get', 'KalturaFlavorParams', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update Flavor Params by ID
		# 	 
		def update(id, flavor_params)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'flavorParams', flavor_params)
			client.queue_service_action_call('flavorparams', 'update', 'KalturaFlavorParams', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete Flavor Params by ID
		# 	 
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('flavorparams', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List Flavor Params by filter with paging support (By default - all system default params will be listed too)
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('flavorparams', 'list', 'KalturaFlavorParamsListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get Flavor Params by Conversion Profile ID
		# 	 
		def get_by_conversion_profile_id(conversion_profile_id)
			kparams = {}
			client.add_param(kparams, 'conversionProfileId', conversion_profile_id)
			client.queue_service_action_call('flavorparams', 'getByConversionProfileId', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Add & Manage GroupUser
	#  
	class KalturaGroupUserService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new GroupUser
		# 	 
		def add(group_user)
			kparams = {}
			client.add_param(kparams, 'groupUser', group_user)
			client.queue_service_action_call('groupuser', 'add', 'KalturaGroupUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# delete by userId and groupId
		# 	 
		def delete(user_id, group_id)
			kparams = {}
			client.add_param(kparams, 'userId', user_id)
			client.add_param(kparams, 'groupId', group_id)
			client.queue_service_action_call('groupuser', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List all GroupUsers
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('groupuser', 'list', 'KalturaGroupUserListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Manage live channel segments
	#  
	class KalturaLiveChannelSegmentService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new live channel segment
		# 	 
		def add(live_channel_segment)
			kparams = {}
			client.add_param(kparams, 'liveChannelSegment', live_channel_segment)
			client.queue_service_action_call('livechannelsegment', 'add', 'KalturaLiveChannelSegment', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get live channel segment by id
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('livechannelsegment', 'get', 'KalturaLiveChannelSegment', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update live channel segment by id
		# 	 
		def update(id, live_channel_segment)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'liveChannelSegment', live_channel_segment)
			client.queue_service_action_call('livechannelsegment', 'update', 'KalturaLiveChannelSegment', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete live channel segment by id
		# 	 
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('livechannelsegment', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List live channel segments by filter and pager
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('livechannelsegment', 'list', 'KalturaLiveChannelSegmentListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Live Channel service lets you manage live channels
	#  
	class KalturaLiveChannelService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Adds new live channel.
		# 	 
		def add(live_channel)
			kparams = {}
			client.add_param(kparams, 'liveChannel', live_channel)
			client.queue_service_action_call('livechannel', 'add', 'KalturaLiveChannel', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get live channel by ID.
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('livechannel', 'get', 'KalturaLiveChannel', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update live channel. Only the properties that were set will be updated.
		# 	 
		def update(id, live_channel)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'liveChannel', live_channel)
			client.queue_service_action_call('livechannel', 'update', 'KalturaLiveChannel', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete a live channel.
		# 	 
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('livechannel', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List live channels by filter with paging support.
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('livechannel', 'list', 'KalturaLiveChannelListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delivering the status of a live channel (on-air/offline)
		# 	 
		def is_live(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('livechannel', 'isLive', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Append recorded video to live entry
		# 	 
		def append_recording(entry_id, asset_id, media_server_index, resource, duration, is_last_chunk=false)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'assetId', asset_id)
			client.add_param(kparams, 'mediaServerIndex', media_server_index)
			client.add_param(kparams, 'resource', resource)
			client.add_param(kparams, 'duration', duration)
			client.add_param(kparams, 'isLastChunk', is_last_chunk)
			client.queue_service_action_call('livechannel', 'appendRecording', 'KalturaLiveEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Register media server to live entry
		# 	 
		def register_media_server(entry_id, hostname, media_server_index, application_name=KalturaNotImplemented, live_entry_status=1)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'hostname', hostname)
			client.add_param(kparams, 'mediaServerIndex', media_server_index)
			client.add_param(kparams, 'applicationName', application_name)
			client.add_param(kparams, 'liveEntryStatus', live_entry_status)
			client.queue_service_action_call('livechannel', 'registerMediaServer', 'KalturaLiveEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Unregister media server from live entry
		# 	 
		def unregister_media_server(entry_id, hostname, media_server_index)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'hostname', hostname)
			client.add_param(kparams, 'mediaServerIndex', media_server_index)
			client.queue_service_action_call('livechannel', 'unregisterMediaServer', 'KalturaLiveEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Validates all registered media servers
		# 	 
		def validate_registered_media_servers(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('livechannel', 'validateRegisteredMediaServers', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaLiveReportsService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		def get_events(report_type, filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'reportType', report_type)
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('livereports', 'getEvents', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get_report(report_type, filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'reportType', report_type)
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('livereports', 'getReport', 'KalturaLiveStatsListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def export_to_csv(report_type, params)
			kparams = {}
			client.add_param(kparams, 'reportType', report_type)
			client.add_param(kparams, 'params', params)
			client.queue_service_action_call('livereports', 'exportToCsv', 'KalturaLiveReportExportResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Will serve a requested report
		# 	 
		def serve_report(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('livereports', 'serveReport', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Stats Service
	#  
	class KalturaLiveStatsService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Will write to the event log a single line representing the event
		# 	 KalturaStatsEvent $event
		# 	 
		def collect(event)
			kparams = {}
			client.add_param(kparams, 'event', event)
			client.queue_service_action_call('livestats', 'collect', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Live Stream service lets you manage live stream entries
	#  
	class KalturaLiveStreamService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Adds new live stream entry.
		# 	 The entry will be queued for provision.
		# 	 
		def add(live_stream_entry, source_type=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'liveStreamEntry', live_stream_entry)
			client.add_param(kparams, 'sourceType', source_type)
			client.queue_service_action_call('livestream', 'add', 'KalturaLiveStreamEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get live stream entry by ID.
		# 	 
		def get(entry_id, version=-1)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'version', version)
			client.queue_service_action_call('livestream', 'get', 'KalturaLiveStreamEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Authenticate live-stream entry against stream token and partner limitations
		# 	 
		def authenticate(entry_id, token)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'token', token)
			client.queue_service_action_call('livestream', 'authenticate', 'KalturaLiveStreamEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update live stream entry. Only the properties that were set will be updated.
		# 	 
		def update(entry_id, live_stream_entry)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'liveStreamEntry', live_stream_entry)
			client.queue_service_action_call('livestream', 'update', 'KalturaLiveStreamEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete a live stream entry.
		# 	 
		def delete(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('livestream', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List live stream entries by filter with paging support.
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('livestream', 'list', 'KalturaLiveStreamListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update live stream entry thumbnail using a raw jpeg file
		# 	 
		def update_offline_thumbnail_jpeg(entry_id, file_data)
			kparams = {}
			kfiles = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kfiles, 'fileData', file_data)
			client.queue_service_action_call('livestream', 'updateOfflineThumbnailJpeg', 'KalturaLiveStreamEntry', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update entry thumbnail using url
		# 	 
		def update_offline_thumbnail_from_url(entry_id, url)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'url', url)
			client.queue_service_action_call('livestream', 'updateOfflineThumbnailFromUrl', 'KalturaLiveStreamEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delivering the status of a live stream (on-air/offline) if it is possible
		# 	 
		def is_live(id, protocol)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'protocol', protocol)
			client.queue_service_action_call('livestream', 'isLive', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Add new pushPublish configuration to entry
		# 	 
		def add_live_stream_push_publish_configuration(entry_id, protocol, url=KalturaNotImplemented, live_stream_configuration=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'protocol', protocol)
			client.add_param(kparams, 'url', url)
			client.add_param(kparams, 'liveStreamConfiguration', live_stream_configuration)
			client.queue_service_action_call('livestream', 'addLiveStreamPushPublishConfiguration', 'KalturaLiveStreamEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Remove push publish configuration from entry
		# 	 
		def remove_live_stream_push_publish_configuration(entry_id, protocol)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'protocol', protocol)
			client.queue_service_action_call('livestream', 'removeLiveStreamPushPublishConfiguration', 'KalturaLiveStreamEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Append recorded video to live entry
		# 	 
		def append_recording(entry_id, asset_id, media_server_index, resource, duration, is_last_chunk=false)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'assetId', asset_id)
			client.add_param(kparams, 'mediaServerIndex', media_server_index)
			client.add_param(kparams, 'resource', resource)
			client.add_param(kparams, 'duration', duration)
			client.add_param(kparams, 'isLastChunk', is_last_chunk)
			client.queue_service_action_call('livestream', 'appendRecording', 'KalturaLiveEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Register media server to live entry
		# 	 
		def register_media_server(entry_id, hostname, media_server_index, application_name=KalturaNotImplemented, live_entry_status=1)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'hostname', hostname)
			client.add_param(kparams, 'mediaServerIndex', media_server_index)
			client.add_param(kparams, 'applicationName', application_name)
			client.add_param(kparams, 'liveEntryStatus', live_entry_status)
			client.queue_service_action_call('livestream', 'registerMediaServer', 'KalturaLiveEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Unregister media server from live entry
		# 	 
		def unregister_media_server(entry_id, hostname, media_server_index)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'hostname', hostname)
			client.add_param(kparams, 'mediaServerIndex', media_server_index)
			client.queue_service_action_call('livestream', 'unregisterMediaServer', 'KalturaLiveEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Validates all registered media servers
		# 	 
		def validate_registered_media_servers(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('livestream', 'validateRegisteredMediaServers', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Creates perioding metadata sync-point events on a live stream
		# 	 
		def create_periodic_sync_points(entry_id, interval, duration)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'interval', interval)
			client.add_param(kparams, 'duration', duration)
			client.queue_service_action_call('livestream', 'createPeriodicSyncPoints', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Media Info service
	#  
	class KalturaMediaInfoService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# List media info objects by filter and pager
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('mediainfo', 'list', 'KalturaMediaInfoListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Media service lets you upload and manage media files (images / videos & audio)
	#  
	class KalturaMediaService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add entry
		#      
		def add(entry)
			kparams = {}
			client.add_param(kparams, 'entry', entry)
			client.queue_service_action_call('media', 'add', 'KalturaMediaEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Add content to media entry which is not yet associated with content (therefore is in status NO_CONTENT).
		#      If the requirement is to replace the entry's associated content, use action updateContent.
		#      
		def add_content(entry_id, resource=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'resource', resource)
			client.queue_service_action_call('media', 'addContent', 'KalturaMediaEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Adds new media entry by importing an HTTP or FTP URL.
		# 	 The entry will be queued for import and then for conversion.
		# 	 
		def add_from_url(media_entry, url)
			kparams = {}
			client.add_param(kparams, 'mediaEntry', media_entry)
			client.add_param(kparams, 'url', url)
			client.queue_service_action_call('media', 'addFromUrl', 'KalturaMediaEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Adds new media entry by importing the media file from a search provider.
		# 	 This action should be used with the search service result.
		# 	 
		def add_from_search_result(media_entry=KalturaNotImplemented, search_result=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'mediaEntry', media_entry)
			client.add_param(kparams, 'searchResult', search_result)
			client.queue_service_action_call('media', 'addFromSearchResult', 'KalturaMediaEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Add new entry after the specific media file was uploaded and the upload token id exists
		# 	 
		def add_from_uploaded_file(media_entry, upload_token_id)
			kparams = {}
			client.add_param(kparams, 'mediaEntry', media_entry)
			client.add_param(kparams, 'uploadTokenId', upload_token_id)
			client.queue_service_action_call('media', 'addFromUploadedFile', 'KalturaMediaEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Add new entry after the file was recored on the server and the token id exists
		# 	 
		def add_from_recorded_webcam(media_entry, webcam_token_id)
			kparams = {}
			client.add_param(kparams, 'mediaEntry', media_entry)
			client.add_param(kparams, 'webcamTokenId', webcam_token_id)
			client.queue_service_action_call('media', 'addFromRecordedWebcam', 'KalturaMediaEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Copy entry into new entry
		# 	 
		def add_from_entry(source_entry_id, media_entry=KalturaNotImplemented, source_flavor_params_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'sourceEntryId', source_entry_id)
			client.add_param(kparams, 'mediaEntry', media_entry)
			client.add_param(kparams, 'sourceFlavorParamsId', source_flavor_params_id)
			client.queue_service_action_call('media', 'addFromEntry', 'KalturaMediaEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Copy flavor asset into new entry
		# 	 
		def add_from_flavor_asset(source_flavor_asset_id, media_entry=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'sourceFlavorAssetId', source_flavor_asset_id)
			client.add_param(kparams, 'mediaEntry', media_entry)
			client.queue_service_action_call('media', 'addFromFlavorAsset', 'KalturaMediaEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Convert entry
		# 	 
		def convert(entry_id, conversion_profile_id=KalturaNotImplemented, dynamic_conversion_attributes=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'conversionProfileId', conversion_profile_id)
			client.add_param(kparams, 'dynamicConversionAttributes', dynamic_conversion_attributes)
			client.queue_service_action_call('media', 'convert', 'bigint', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get media entry by ID.
		# 	 
		def get(entry_id, version=-1)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'version', version)
			client.queue_service_action_call('media', 'get', 'KalturaMediaEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get MRSS by entry id
		#      XML will return as an escaped string
		#      
		def get_mrss(entry_id, extending_items_array=KalturaNotImplemented, features=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'extendingItemsArray', extending_items_array)
			client.add_param(kparams, 'features', features)
			client.queue_service_action_call('media', 'getMrss', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update media entry. Only the properties that were set will be updated.
		# 	 
		def update(entry_id, media_entry)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'mediaEntry', media_entry)
			client.queue_service_action_call('media', 'update', 'KalturaMediaEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Replace content associated with the media entry.
		# 	 
		def update_content(entry_id, resource, conversion_profile_id=KalturaNotImplemented, advanced_options=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'resource', resource)
			client.add_param(kparams, 'conversionProfileId', conversion_profile_id)
			client.add_param(kparams, 'advancedOptions', advanced_options)
			client.queue_service_action_call('media', 'updateContent', 'KalturaMediaEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete a media entry.
		# 	 
		def delete(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('media', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Approves media replacement
		# 	 
		def approve_replace(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('media', 'approveReplace', 'KalturaMediaEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Cancels media replacement
		# 	 
		def cancel_replace(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('media', 'cancelReplace', 'KalturaMediaEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List media entries by filter with paging support.
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('media', 'list', 'KalturaMediaListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Count media entries by filter.
		# 	 
		def count(filter=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('media', 'count', 'int', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Upload a media file to Kaltura, then the file can be used to create a media entry.
		# 	 
		def upload(file_data)
			kparams = {}
			kfiles = {}
			client.add_param(kfiles, 'fileData', file_data)
			client.queue_service_action_call('media', 'upload', 'string', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update media entry thumbnail by a specified time offset (In seconds)
		# 	 If flavor params id not specified, source flavor will be used by default
		# 	 
		def update_thumbnail(entry_id, time_offset, flavor_params_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'timeOffset', time_offset)
			client.add_param(kparams, 'flavorParamsId', flavor_params_id)
			client.queue_service_action_call('media', 'updateThumbnail', 'KalturaMediaEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update media entry thumbnail from a different entry by a specified time offset (In seconds)
		# 	 If flavor params id not specified, source flavor will be used by default
		# 	 
		def update_thumbnail_from_source_entry(entry_id, source_entry_id, time_offset, flavor_params_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'sourceEntryId', source_entry_id)
			client.add_param(kparams, 'timeOffset', time_offset)
			client.add_param(kparams, 'flavorParamsId', flavor_params_id)
			client.queue_service_action_call('media', 'updateThumbnailFromSourceEntry', 'KalturaMediaEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update media entry thumbnail using a raw jpeg file
		# 	 
		def update_thumbnail_jpeg(entry_id, file_data)
			kparams = {}
			kfiles = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kfiles, 'fileData', file_data)
			client.queue_service_action_call('media', 'updateThumbnailJpeg', 'KalturaMediaEntry', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update entry thumbnail using url
		# 	 
		def update_thumbnail_from_url(entry_id, url)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'url', url)
			client.queue_service_action_call('media', 'updateThumbnailFromUrl', 'KalturaBaseEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Request a new conversion job, this can be used to convert the media entry to a different format
		# 	 
		def request_conversion(entry_id, file_format)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'fileFormat', file_format)
			client.queue_service_action_call('media', 'requestConversion', 'int', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Flag inappropriate media entry for moderation
		# 	 
		def flag(moderation_flag)
			kparams = {}
			client.add_param(kparams, 'moderationFlag', moderation_flag)
			client.queue_service_action_call('media', 'flag', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Reject the media entry and mark the pending flags (if any) as moderated (this will make the entry non playable)
		# 	 
		def reject(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('media', 'reject', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Approve the media entry and mark the pending flags (if any) as moderated (this will make the entry playable)
		# 	 
		def approve(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('media', 'approve', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List all pending flags for the media entry
		# 	 
		def list_flags(entry_id, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('media', 'listFlags', 'KalturaModerationFlagListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Anonymously rank a media entry, no validation is done on duplicate rankings
		# 	 
		def anonymous_rank(entry_id, rank)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'rank', rank)
			client.queue_service_action_call('media', 'anonymousRank', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Add new bulk upload batch job
		# 	 Conversion profile id can be specified in the API or in the CSV file, the one in the CSV file will be stronger.
		# 	 If no conversion profile was specified, partner's default will be used
		# 	 
		def bulk_upload_add(file_data, bulk_upload_data=KalturaNotImplemented, bulk_upload_entry_data=KalturaNotImplemented)
			kparams = {}
			kfiles = {}
			client.add_param(kfiles, 'fileData', file_data)
			client.add_param(kparams, 'bulkUploadData', bulk_upload_data)
			client.add_param(kparams, 'bulkUploadEntryData', bulk_upload_entry_data)
			client.queue_service_action_call('media', 'bulkUploadAdd', 'KalturaBulkUpload', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# A Mix is an XML unique format invented by Kaltura, it allows the user to create a mix of videos and images, in and out points, transitions, text overlays, soundtrack, effects and much more...
	#  Mixing service lets you create a new mix, manage its metadata and make basic manipulations.   
	#  
	class KalturaMixingService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Adds a new mix.
		# 	 If the dataContent is null, a default timeline will be created.
		# 	 
		def add(mix_entry)
			kparams = {}
			client.add_param(kparams, 'mixEntry', mix_entry)
			client.queue_service_action_call('mixing', 'add', 'KalturaMixEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get mix entry by id.
		# 	 
		def get(entry_id, version=-1)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'version', version)
			client.queue_service_action_call('mixing', 'get', 'KalturaMixEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update mix entry. Only the properties that were set will be updated.
		# 	 
		def update(entry_id, mix_entry)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'mixEntry', mix_entry)
			client.queue_service_action_call('mixing', 'update', 'KalturaMixEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete a mix entry.
		# 	 
		def delete(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('mixing', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List entries by filter with paging support.
		# 	 Return parameter is an array of mix entries.
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('mixing', 'list', 'KalturaMixListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Count mix entries by filter.
		# 	 
		def count(filter=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('mixing', 'count', 'int', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Clones an existing mix.
		# 	 
		def clone(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('mixing', 'clone', 'KalturaMixEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Appends a media entry to a the end of the mix timeline, this will save the mix timeline as a new version.
		# 	 
		def append_media_entry(mix_entry_id, media_entry_id)
			kparams = {}
			client.add_param(kparams, 'mixEntryId', mix_entry_id)
			client.add_param(kparams, 'mediaEntryId', media_entry_id)
			client.queue_service_action_call('mixing', 'appendMediaEntry', 'KalturaMixEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get the mixes in which the media entry is included
		# 	 
		def get_mixes_by_media_id(media_entry_id)
			kparams = {}
			client.add_param(kparams, 'mediaEntryId', media_entry_id)
			client.queue_service_action_call('mixing', 'getMixesByMediaId', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get all ready media entries that exist in the given mix id
		# 	 
		def get_ready_media_entries(mix_id, version=-1)
			kparams = {}
			client.add_param(kparams, 'mixId', mix_id)
			client.add_param(kparams, 'version', version)
			client.queue_service_action_call('mixing', 'getReadyMediaEntries', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Anonymously rank a mix entry, no validation is done on duplicate rankings
		# 	 
		def anonymous_rank(entry_id, rank)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'rank', rank)
			client.queue_service_action_call('mixing', 'anonymousRank', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Notification Service
	#  
	class KalturaNotificationService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Return the notifications for a specific entry id and type
		# 	 
		def get_client_notification(entry_id, type)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'type', type)
			client.queue_service_action_call('notification', 'getClientNotification', 'KalturaClientNotification', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# partner service allows you to change/manage your partner personal details and settings as well
	#  
	class KalturaPartnerService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Create a new Partner object
		# 	 
		def register(partner, cms_password='', template_partner_id=KalturaNotImplemented, silent=false)
			kparams = {}
			client.add_param(kparams, 'partner', partner)
			client.add_param(kparams, 'cmsPassword', cms_password)
			client.add_param(kparams, 'templatePartnerId', template_partner_id)
			client.add_param(kparams, 'silent', silent)
			client.queue_service_action_call('partner', 'register', 'KalturaPartner', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update details and settings of an existing partner
		# 	 
		def update(partner, allow_empty=false)
			kparams = {}
			client.add_param(kparams, 'partner', partner)
			client.add_param(kparams, 'allowEmpty', allow_empty)
			client.queue_service_action_call('partner', 'update', 'KalturaPartner', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve partner object by Id
		# 	 
		def get(id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('partner', 'get', 'KalturaPartner', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve partner secret and admin secret
		# 	 
		def get_secrets(partner_id, admin_email, cms_password)
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'adminEmail', admin_email)
			client.add_param(kparams, 'cmsPassword', cms_password)
			client.queue_service_action_call('partner', 'getSecrets', 'KalturaPartner', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve all info attributed to the partner
		# 	 This action expects no parameters. It returns information for the current KS partnerId.
		# 	 
		def get_info()
			kparams = {}
			client.queue_service_action_call('partner', 'getInfo', 'KalturaPartner', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get usage statistics for a partner
		# 	 Calculation is done according to partner's package
		# 	 Additional data returned is a graph points of streaming usage in a timeframe
		# 	 The resolution can be "days" or "months"
		# 	 
		def get_usage(year='', month=1, resolution=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'year', year)
			client.add_param(kparams, 'month', month)
			client.add_param(kparams, 'resolution', resolution)
			client.queue_service_action_call('partner', 'getUsage', 'KalturaPartnerUsage', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get usage statistics for a partner
		# 	 Calculation is done according to partner's package
		# 	 
		def get_statistics()
			kparams = {}
			client.queue_service_action_call('partner', 'getStatistics', 'KalturaPartnerStatistics', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a list of partner objects which the current user is allowed to access.
		# 	 
		def list_partners_for_user(partner_filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'partnerFilter', partner_filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('partner', 'listPartnersForUser', 'KalturaPartnerListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List partners by filter with paging support
		# 	 Current implementation will only list the sub partners of the partner initiating the api call (using the current KS).
		# 	 This action is only partially implemented to support listing sub partners of a VAR partner.
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('partner', 'list', 'KalturaPartnerListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List partner's current processes' statuses
		# 	 
		def list_feature_status()
			kparams = {}
			client.queue_service_action_call('partner', 'listFeatureStatus', 'KalturaFeatureStatusListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Count partner's existing sub-publishers (count includes the partner itself).
		# 	 
		def count(filter=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('partner', 'count', 'int', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# PermissionItem service lets you create and manage permission items
	#  
	class KalturaPermissionItemService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Adds a new permission item object to the account.
		# 	 This action is available only to Kaltura system administrators.
		# 	 
		def add(permission_item)
			kparams = {}
			client.add_param(kparams, 'permissionItem', permission_item)
			client.queue_service_action_call('permissionitem', 'add', 'KalturaPermissionItem', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieves a permission item object using its ID.
		# 	 
		def get(permission_item_id)
			kparams = {}
			client.add_param(kparams, 'permissionItemId', permission_item_id)
			client.queue_service_action_call('permissionitem', 'get', 'KalturaPermissionItem', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Updates an existing permission item object.
		# 	 This action is available only to Kaltura system administrators.
		# 	 
		def update(permission_item_id, permission_item)
			kparams = {}
			client.add_param(kparams, 'permissionItemId', permission_item_id)
			client.add_param(kparams, 'permissionItem', permission_item)
			client.queue_service_action_call('permissionitem', 'update', 'KalturaPermissionItem', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Deletes an existing permission item object.
		# 	 This action is available only to Kaltura system administrators.
		# 	 
		def delete(permission_item_id)
			kparams = {}
			client.add_param(kparams, 'permissionItemId', permission_item_id)
			client.queue_service_action_call('permissionitem', 'delete', 'KalturaPermissionItem', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Lists permission item objects that are associated with an account.
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('permissionitem', 'list', 'KalturaPermissionItemListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Permission service lets you create and manage user permissions
	#  
	class KalturaPermissionService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Adds a new permission object to the account.
		# 	 
		def add(permission)
			kparams = {}
			client.add_param(kparams, 'permission', permission)
			client.queue_service_action_call('permission', 'add', 'KalturaPermission', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieves a permission object using its ID.
		# 	 
		def get(permission_name)
			kparams = {}
			client.add_param(kparams, 'permissionName', permission_name)
			client.queue_service_action_call('permission', 'get', 'KalturaPermission', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Updates an existing permission object.
		# 	 
		def update(permission_name, permission)
			kparams = {}
			client.add_param(kparams, 'permissionName', permission_name)
			client.add_param(kparams, 'permission', permission)
			client.queue_service_action_call('permission', 'update', 'KalturaPermission', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Deletes an existing permission object.
		# 	 
		def delete(permission_name)
			kparams = {}
			client.add_param(kparams, 'permissionName', permission_name)
			client.queue_service_action_call('permission', 'delete', 'KalturaPermission', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Lists permission objects that are associated with an account.
		# 	 Blocked permissions are listed unless you use a filter to exclude them.
		# 	 Blocked permissions are listed unless you use a filter to exclude them.
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('permission', 'list', 'KalturaPermissionListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieves a list of permissions that apply to the current KS.
		# 	 
		def get_current_permissions()
			kparams = {}
			client.queue_service_action_call('permission', 'getCurrentPermissions', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Playlist service lets you create,manage and play your playlists
	#  Playlists could be static (containing a fixed list of entries) or dynamic (baseed on a filter)
	#  
	class KalturaPlaylistService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new playlist
		# 	 Note that all entries used in a playlist will become public and may appear in KalturaNetwork
		# 	 
		def add(playlist, update_stats=false)
			kparams = {}
			client.add_param(kparams, 'playlist', playlist)
			client.add_param(kparams, 'updateStats', update_stats)
			client.queue_service_action_call('playlist', 'add', 'KalturaPlaylist', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a playlist
		# 	 
		def get(id, version=-1)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'version', version)
			client.queue_service_action_call('playlist', 'get', 'KalturaPlaylist', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update existing playlist
		# 	 Note - you cannot change playlist type. updated playlist must be of the same type.
		# 	 
		def update(id, playlist, update_stats=false)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'playlist', playlist)
			client.add_param(kparams, 'updateStats', update_stats)
			client.queue_service_action_call('playlist', 'update', 'KalturaPlaylist', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete existing playlist
		# 	 
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('playlist', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Clone an existing playlist
		# 	 
		def clone(id, new_playlist=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'newPlaylist', new_playlist)
			client.queue_service_action_call('playlist', 'clone', 'KalturaPlaylist', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List available playlists
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('playlist', 'list', 'KalturaPlaylistListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve playlist for playing purpose
		# 	 
		def execute(id, detailed='', playlist_context=KalturaNotImplemented, filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'detailed', detailed)
			client.add_param(kparams, 'playlistContext', playlist_context)
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('playlist', 'execute', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve playlist for playing purpose, based on content
		# 	 
		def execute_from_content(playlist_type, playlist_content, detailed='', pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'playlistType', playlist_type)
			client.add_param(kparams, 'playlistContent', playlist_content)
			client.add_param(kparams, 'detailed', detailed)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('playlist', 'executeFromContent', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Revrieve playlist for playing purpose, based on media entry filters
		# 	 
		def execute_from_filters(filters, total_results, detailed='1', pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filters', filters)
			client.add_param(kparams, 'totalResults', total_results)
			client.add_param(kparams, 'detailed', detailed)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('playlist', 'executeFromFilters', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve playlist statistics
		# 	 
		def get_stats_from_content(playlist_type, playlist_content)
			kparams = {}
			client.add_param(kparams, 'playlistType', playlist_type)
			client.add_param(kparams, 'playlistContent', playlist_content)
			client.queue_service_action_call('playlist', 'getStatsFromContent', 'KalturaPlaylist', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# api for getting reports data by the report type and some inputFilter
	#  
	class KalturaReportService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# report getGraphs action allows to get a graph data for a specific report. 
		# 	 
		def get_graphs(report_type, report_input_filter, dimension=KalturaNotImplemented, object_ids=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'reportType', report_type)
			client.add_param(kparams, 'reportInputFilter', report_input_filter)
			client.add_param(kparams, 'dimension', dimension)
			client.add_param(kparams, 'objectIds', object_ids)
			client.queue_service_action_call('report', 'getGraphs', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# report getTotal action allows to get a graph data for a specific report. 
		# 	 
		def get_total(report_type, report_input_filter, object_ids=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'reportType', report_type)
			client.add_param(kparams, 'reportInputFilter', report_input_filter)
			client.add_param(kparams, 'objectIds', object_ids)
			client.queue_service_action_call('report', 'getTotal', 'KalturaReportTotal', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# report getBaseTotal action allows to get a the total base for storage reports  
		# 	 
		def get_base_total(report_type, report_input_filter, object_ids=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'reportType', report_type)
			client.add_param(kparams, 'reportInputFilter', report_input_filter)
			client.add_param(kparams, 'objectIds', object_ids)
			client.queue_service_action_call('report', 'getBaseTotal', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# report getTable action allows to get a graph data for a specific report. 
		# 	 
		def get_table(report_type, report_input_filter, pager, order=KalturaNotImplemented, object_ids=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'reportType', report_type)
			client.add_param(kparams, 'reportInputFilter', report_input_filter)
			client.add_param(kparams, 'pager', pager)
			client.add_param(kparams, 'order', order)
			client.add_param(kparams, 'objectIds', object_ids)
			client.queue_service_action_call('report', 'getTable', 'KalturaReportTable', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# will create a Csv file for the given report and return the URL to access it
		# 	 
		def get_url_for_report_as_csv(report_title, report_text, headers, report_type, report_input_filter, dimension=KalturaNotImplemented, pager=KalturaNotImplemented, order=KalturaNotImplemented, object_ids=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'reportTitle', report_title)
			client.add_param(kparams, 'reportText', report_text)
			client.add_param(kparams, 'headers', headers)
			client.add_param(kparams, 'reportType', report_type)
			client.add_param(kparams, 'reportInputFilter', report_input_filter)
			client.add_param(kparams, 'dimension', dimension)
			client.add_param(kparams, 'pager', pager)
			client.add_param(kparams, 'order', order)
			client.add_param(kparams, 'objectIds', object_ids)
			client.queue_service_action_call('report', 'getUrlForReportAsCsv', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Will serve a requested report
		# 	 
		def serve(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('report', 'serve', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def execute(id, params=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'params', params)
			client.queue_service_action_call('report', 'execute', 'KalturaReportResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get_csv(id, params=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'params', params)
			client.queue_service_action_call('report', 'getCsv', 'file', kparams)
			return client.get_serve_url()
		end

		# Returns report CSV file executed by string params with the following convention: param1=value1;param2=value2 
		# 	 
		def get_csv_from_string_params(id, params=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'params', params)
			client.queue_service_action_call('report', 'getCsvFromStringParams', 'file', kparams)
			return client.get_serve_url()
		end
	end

	# Manage response profiles
	#  
	class KalturaResponseProfileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new response profile
		# 	 
		def add(add_response_profile)
			kparams = {}
			client.add_param(kparams, 'addResponseProfile', add_response_profile)
			client.queue_service_action_call('responseprofile', 'add', 'KalturaResponseProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get response profile by id
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('responseprofile', 'get', 'KalturaResponseProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update response profile by id
		# 	 
		def update(id, update_response_profile)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'updateResponseProfile', update_response_profile)
			client.queue_service_action_call('responseprofile', 'update', 'KalturaResponseProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update response profile status by id
		# 	 
		def update_status(id, status)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'status', status)
			client.queue_service_action_call('responseprofile', 'updateStatus', 'KalturaResponseProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete response profile by id
		# 	 
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('responseprofile', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List response profiles by filter and pager
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('responseprofile', 'list', 'KalturaResponseProfileListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Recalculate response profile cached objects
		# 	 
		def recalculate(options)
			kparams = {}
			client.add_param(kparams, 'options', options)
			client.queue_service_action_call('responseprofile', 'recalculate', 'KalturaResponseProfileCacheRecalculateResults', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Clone an existing response profile
		# 	 
		def clone(id, profile)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'profile', profile)
			client.queue_service_action_call('responseprofile', 'clone', 'KalturaResponseProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Expose the schema definitions for syndication MRSS, bulk upload XML and other schema types. 
	#  
	class KalturaSchemaService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Serves the requested XSD according to the type and name. 
		# 	 
		def serve(type)
			kparams = {}
			client.add_param(kparams, 'type', type)
			client.queue_service_action_call('schema', 'serve', 'file', kparams)
			return client.get_serve_url()
		end
	end

	# Search service allows you to search for media in various media providers
	#  This service is being used mostly by the CW component
	#  
	class KalturaSearchService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Search for media in one of the supported media providers
		# 	 
		def search(search, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'search', search)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('search', 'search', 'KalturaSearchResultResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve extra information about media found in search action
		# 	 Some providers return only part of the fields needed to create entry from, use this action to get the rest of the fields.
		# 	 
		def get_media_info(search_result)
			kparams = {}
			client.add_param(kparams, 'searchResult', search_result)
			client.queue_service_action_call('search', 'getMediaInfo', 'KalturaSearchResult', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Search for media given a specific URL
		# 	 Kaltura supports a searchURL action on some of the media providers.
		# 	 This action will return a KalturaSearchResult object based on a given URL (assuming the media provider is supported)
		# 	 
		def search_url(media_type, url)
			kparams = {}
			client.add_param(kparams, 'mediaType', media_type)
			client.add_param(kparams, 'url', url)
			client.queue_service_action_call('search', 'searchUrl', 'KalturaSearchResult', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def external_login(search_source, user_name, password)
			kparams = {}
			client.add_param(kparams, 'searchSource', search_source)
			client.add_param(kparams, 'userName', user_name)
			client.add_param(kparams, 'password', password)
			client.queue_service_action_call('search', 'externalLogin', 'KalturaSearchAuthData', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Server Node service
	#  
	class KalturaServerNodeService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Adds a server node to the Kaltura DB.
		# 	 
		def add(server_node)
			kparams = {}
			client.add_param(kparams, 'serverNode', server_node)
			client.queue_service_action_call('servernode', 'add', 'KalturaServerNode', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get server node by id
		# 	 
		def get(server_node_id)
			kparams = {}
			client.add_param(kparams, 'serverNodeId', server_node_id)
			client.queue_service_action_call('servernode', 'get', 'KalturaServerNode', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update server node by id 
		# 	 
		def update(server_node_id, server_node)
			kparams = {}
			client.add_param(kparams, 'serverNodeId', server_node_id)
			client.add_param(kparams, 'serverNode', server_node)
			client.queue_service_action_call('servernode', 'update', 'KalturaServerNode', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# delete server node by id
		# 	 
		def delete(server_node_id)
			kparams = {}
			client.add_param(kparams, 'serverNodeId', server_node_id)
			client.queue_service_action_call('servernode', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Disable server node by id
		# 	 
		def disable(server_node_id)
			kparams = {}
			client.add_param(kparams, 'serverNodeId', server_node_id)
			client.queue_service_action_call('servernode', 'disable', 'KalturaServerNode', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Enable server node by id
		# 	 
		def enable(server_node_id)
			kparams = {}
			client.add_param(kparams, 'serverNodeId', server_node_id)
			client.queue_service_action_call('servernode', 'enable', 'KalturaServerNode', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('servernode', 'list', 'KalturaServerNodeListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update server node status
		# 	 
		def report_status(host_name, server_node=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'hostName', host_name)
			client.add_param(kparams, 'serverNode', server_node)
			client.queue_service_action_call('servernode', 'reportStatus', 'KalturaServerNode', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Session service
	#  
	class KalturaSessionService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Start a session with Kaltura's server.
		# 	 The result KS is the session key that you should pass to all services that requires a ticket.
		# 	 
		def start(secret, user_id='', type=0, partner_id=KalturaNotImplemented, expiry=86400, privileges=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'secret', secret)
			client.add_param(kparams, 'userId', user_id)
			client.add_param(kparams, 'type', type)
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'expiry', expiry)
			client.add_param(kparams, 'privileges', privileges)
			client.queue_service_action_call('session', 'start', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# End a session with the Kaltura server, making the current KS invalid.
		# 	 
		def end()
			kparams = {}
			client.queue_service_action_call('session', 'end', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Start an impersonated session with Kaltura's server.
		# 	 The result KS is the session key that you should pass to all services that requires a ticket.
		# 	 
		def impersonate(secret, impersonated_partner_id, user_id='', type=0, partner_id=KalturaNotImplemented, expiry=86400, privileges=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'secret', secret)
			client.add_param(kparams, 'impersonatedPartnerId', impersonated_partner_id)
			client.add_param(kparams, 'userId', user_id)
			client.add_param(kparams, 'type', type)
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'expiry', expiry)
			client.add_param(kparams, 'privileges', privileges)
			client.queue_service_action_call('session', 'impersonate', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Start an impersonated session with Kaltura's server.
		# 	 The result KS info contains the session key that you should pass to all services that requires a ticket.
		# 	 Type, expiry and privileges won't be changed if they're not set
		# 	 
		def impersonate_by_ks(session, type=KalturaNotImplemented, expiry=KalturaNotImplemented, privileges=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'session', session)
			client.add_param(kparams, 'type', type)
			client.add_param(kparams, 'expiry', expiry)
			client.add_param(kparams, 'privileges', privileges)
			client.queue_service_action_call('session', 'impersonateByKs', 'KalturaSessionInfo', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Parse session key and return its info
		# 	 
		def get(session=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'session', session)
			client.queue_service_action_call('session', 'get', 'KalturaSessionInfo', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Start a session for Kaltura's flash widgets
		# 	 
		def start_widget_session(widget_id, expiry=86400)
			kparams = {}
			client.add_param(kparams, 'widgetId', widget_id)
			client.add_param(kparams, 'expiry', expiry)
			client.queue_service_action_call('session', 'startWidgetSession', 'KalturaStartWidgetSessionResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Stats Service
	#  
	class KalturaStatsService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Will write to the event log a single line representing the event
		# 	 client version - will help interprete the line structure. different client versions might have slightly different data/data formats in the line
		# event_id - number is the row number in yuval's excel
		# datetime - same format as MySql's datetime - can change and should reflect the time zone
		# session id - can be some big random number or guid
		# partner id
		# entry id
		# unique viewer
		# widget id
		# ui_conf id
		# uid - the puser id as set by the ppartner
		# current point - in milliseconds
		# duration - milliseconds
		# user ip
		# process duration - in milliseconds
		# control id
		# seek
		# new point
		# referrer
		# 	
		# 	
		# 	 KalturaStatsEvent $event
		# 	 
		def collect(event)
			kparams = {}
			client.add_param(kparams, 'event', event)
			client.queue_service_action_call('stats', 'collect', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Will collect the kmcEvent sent form the KMC client
		# 	 // this will actually be an empty function because all events will be sent using GET and will anyway be logged in the apache log
		# 	 
		def kmc_collect(kmc_event)
			kparams = {}
			client.add_param(kparams, 'kmcEvent', kmc_event)
			client.queue_service_action_call('stats', 'kmcCollect', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def report_kce_error(kaltura_ce_error)
			kparams = {}
			client.add_param(kparams, 'kalturaCEError', kaltura_ce_error)
			client.queue_service_action_call('stats', 'reportKceError', 'KalturaCEError', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Use this action to report errors to the kaltura server.
		# 	 
		def report_error(error_code, error_message)
			kparams = {}
			client.add_param(kparams, 'errorCode', error_code)
			client.add_param(kparams, 'errorMessage', error_message)
			client.queue_service_action_call('stats', 'reportError', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Storage Profiles service
	#  
	class KalturaStorageProfileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Adds a storage profile to the Kaltura DB.
		# 	 
		def add(storage_profile)
			kparams = {}
			client.add_param(kparams, 'storageProfile', storage_profile)
			client.queue_service_action_call('storageprofile', 'add', 'KalturaStorageProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def update_status(storage_id, status)
			kparams = {}
			client.add_param(kparams, 'storageId', storage_id)
			client.add_param(kparams, 'status', status)
			client.queue_service_action_call('storageprofile', 'updateStatus', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get storage profile by id
		# 	 
		def get(storage_profile_id)
			kparams = {}
			client.add_param(kparams, 'storageProfileId', storage_profile_id)
			client.queue_service_action_call('storageprofile', 'get', 'KalturaStorageProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update storage profile by id 
		# 	 
		def update(storage_profile_id, storage_profile)
			kparams = {}
			client.add_param(kparams, 'storageProfileId', storage_profile_id)
			client.add_param(kparams, 'storageProfile', storage_profile)
			client.queue_service_action_call('storageprofile', 'update', 'KalturaStorageProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('storageprofile', 'list', 'KalturaStorageProfileListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Add & Manage Syndication Feeds
	#  
	class KalturaSyndicationFeedService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new Syndication Feed
		# 	 
		def add(syndication_feed)
			kparams = {}
			client.add_param(kparams, 'syndicationFeed', syndication_feed)
			client.queue_service_action_call('syndicationfeed', 'add', 'KalturaBaseSyndicationFeed', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get Syndication Feed by ID
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('syndicationfeed', 'get', 'KalturaBaseSyndicationFeed', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update Syndication Feed by ID
		# 	 
		def update(id, syndication_feed)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'syndicationFeed', syndication_feed)
			client.queue_service_action_call('syndicationfeed', 'update', 'KalturaBaseSyndicationFeed', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete Syndication Feed by ID
		# 	 
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('syndicationfeed', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List Syndication Feeds by filter with paging support
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('syndicationfeed', 'list', 'KalturaBaseSyndicationFeedListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# get entry count for a syndication feed
		# 	 
		def get_entry_count(feed_id)
			kparams = {}
			client.add_param(kparams, 'feedId', feed_id)
			client.queue_service_action_call('syndicationfeed', 'getEntryCount', 'KalturaSyndicationFeedEntryCount', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# request conversion for all entries that doesnt have the required flavor param
		# 	 returns a comma-separated ids of conversion jobs
		# 	 
		def request_conversion(feed_id)
			kparams = {}
			client.add_param(kparams, 'feedId', feed_id)
			client.queue_service_action_call('syndicationfeed', 'requestConversion', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# System service is used for internal system helpers & to retrieve system level information
	#  
	class KalturaSystemService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		def ping()
			kparams = {}
			client.queue_service_action_call('system', 'ping', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def ping_database()
			kparams = {}
			client.queue_service_action_call('system', 'pingDatabase', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get_time()
			kparams = {}
			client.queue_service_action_call('system', 'getTime', 'int', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get_version()
			kparams = {}
			client.queue_service_action_call('system', 'getVersion', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Retrieve information and invoke actions on Thumb Asset
	#  
	class KalturaThumbAssetService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add thumbnail asset
		#      
		def add(entry_id, thumb_asset)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'thumbAsset', thumb_asset)
			client.queue_service_action_call('thumbasset', 'add', 'KalturaThumbAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update content of thumbnail asset
		#      
		def set_content(id, content_resource)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'contentResource', content_resource)
			client.queue_service_action_call('thumbasset', 'setContent', 'KalturaThumbAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update thumbnail asset
		#      
		def update(id, thumb_asset)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'thumbAsset', thumb_asset)
			client.queue_service_action_call('thumbasset', 'update', 'KalturaThumbAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Serves thumbnail by entry id and thumnail params id
		# 	 
		def serve_by_entry_id(entry_id, thumb_param_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'thumbParamId', thumb_param_id)
			client.queue_service_action_call('thumbasset', 'serveByEntryId', 'file', kparams)
			return client.get_serve_url()
		end

		# Serves thumbnail by its id
		# 	 
		def serve(thumb_asset_id, version=KalturaNotImplemented, thumb_params=KalturaNotImplemented, options=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'thumbAssetId', thumb_asset_id)
			client.add_param(kparams, 'version', version)
			client.add_param(kparams, 'thumbParams', thumb_params)
			client.add_param(kparams, 'options', options)
			client.queue_service_action_call('thumbasset', 'serve', 'file', kparams)
			return client.get_serve_url()
		end

		# Tags the thumbnail as DEFAULT_THUMB and removes that tag from all other thumbnail assets of the entry.
		# 	 Create a new file sync link on the entry thumbnail that points to the thumbnail asset file sync.
		# 	 
		def set_as_default(thumb_asset_id)
			kparams = {}
			client.add_param(kparams, 'thumbAssetId', thumb_asset_id)
			client.queue_service_action_call('thumbasset', 'setAsDefault', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def generate_by_entry_id(entry_id, dest_thumb_params_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'destThumbParamsId', dest_thumb_params_id)
			client.queue_service_action_call('thumbasset', 'generateByEntryId', 'KalturaThumbAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def generate(entry_id, thumb_params, source_asset_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'thumbParams', thumb_params)
			client.add_param(kparams, 'sourceAssetId', source_asset_id)
			client.queue_service_action_call('thumbasset', 'generate', 'KalturaThumbAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def regenerate(thumb_asset_id)
			kparams = {}
			client.add_param(kparams, 'thumbAssetId', thumb_asset_id)
			client.queue_service_action_call('thumbasset', 'regenerate', 'KalturaThumbAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get(thumb_asset_id)
			kparams = {}
			client.add_param(kparams, 'thumbAssetId', thumb_asset_id)
			client.queue_service_action_call('thumbasset', 'get', 'KalturaThumbAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get_by_entry_id(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('thumbasset', 'getByEntryId', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List Thumbnail Assets by filter and pager
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('thumbasset', 'list', 'KalturaThumbAssetListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def add_from_url(entry_id, url)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'url', url)
			client.queue_service_action_call('thumbasset', 'addFromUrl', 'KalturaThumbAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def add_from_image(entry_id, file_data)
			kparams = {}
			kfiles = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kfiles, 'fileData', file_data)
			client.queue_service_action_call('thumbasset', 'addFromImage', 'KalturaThumbAsset', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def delete(thumb_asset_id)
			kparams = {}
			client.add_param(kparams, 'thumbAssetId', thumb_asset_id)
			client.queue_service_action_call('thumbasset', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get download URL for the asset
		# 	 
		def get_url(id, storage_id=KalturaNotImplemented, thumb_params=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'storageId', storage_id)
			client.add_param(kparams, 'thumbParams', thumb_params)
			client.queue_service_action_call('thumbasset', 'getUrl', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get remote storage existing paths for the asset
		# 	 
		def get_remote_paths(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('thumbasset', 'getRemotePaths', 'KalturaRemotePathListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Thumbnail Params Output service
	#  
	class KalturaThumbParamsOutputService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Get thumb params output object by ID
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('thumbparamsoutput', 'get', 'KalturaThumbParamsOutput', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List thumb params output objects by filter and pager
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('thumbparamsoutput', 'list', 'KalturaThumbParamsOutputListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Add & Manage Thumb Params
	#  
	class KalturaThumbParamsService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new Thumb Params
		# 	 
		def add(thumb_params)
			kparams = {}
			client.add_param(kparams, 'thumbParams', thumb_params)
			client.queue_service_action_call('thumbparams', 'add', 'KalturaThumbParams', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get Thumb Params by ID
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('thumbparams', 'get', 'KalturaThumbParams', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update Thumb Params by ID
		# 	 
		def update(id, thumb_params)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'thumbParams', thumb_params)
			client.queue_service_action_call('thumbparams', 'update', 'KalturaThumbParams', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete Thumb Params by ID
		# 	 
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('thumbparams', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List Thumb Params by filter with paging support (By default - all system default params will be listed too)
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('thumbparams', 'list', 'KalturaThumbParamsListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get Thumb Params by Conversion Profile ID
		# 	 
		def get_by_conversion_profile_id(conversion_profile_id)
			kparams = {}
			client.add_param(kparams, 'conversionProfileId', conversion_profile_id)
			client.queue_service_action_call('thumbparams', 'getByConversionProfileId', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# UiConf service lets you create and manage your UIConfs for the various flash components
	#  This service is used by the KMC-ApplicationStudio
	#  
	class KalturaUiConfService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# UIConf Add action allows you to add a UIConf to Kaltura DB
		# 	 
		def add(ui_conf)
			kparams = {}
			client.add_param(kparams, 'uiConf', ui_conf)
			client.queue_service_action_call('uiconf', 'add', 'KalturaUiConf', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing UIConf
		# 	 
		def update(id, ui_conf)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'uiConf', ui_conf)
			client.queue_service_action_call('uiconf', 'update', 'KalturaUiConf', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a UIConf by id
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('uiconf', 'get', 'KalturaUiConf', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete an existing UIConf
		# 	 
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('uiconf', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Clone an existing UIConf
		# 	 
		def clone(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('uiconf', 'clone', 'KalturaUiConf', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# retrieve a list of available template UIConfs
		# 	 
		def list_templates(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('uiconf', 'listTemplates', 'KalturaUiConfListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a list of available UIConfs
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('uiconf', 'list', 'KalturaUiConfListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a list of all available versions by object type
		# 	 
		def get_available_types()
			kparams = {}
			client.queue_service_action_call('uiconf', 'getAvailableTypes', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaUploadService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		def upload(file_data)
			kparams = {}
			kfiles = {}
			client.add_param(kfiles, 'fileData', file_data)
			client.queue_service_action_call('upload', 'upload', 'string', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get_uploaded_file_token_by_file_name(file_name)
			kparams = {}
			client.add_param(kparams, 'fileName', file_name)
			client.queue_service_action_call('upload', 'getUploadedFileTokenByFileName', 'KalturaUploadResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaUploadTokenService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Adds new upload token to upload a file
		# 	 
		def add(upload_token=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'uploadToken', upload_token)
			client.queue_service_action_call('uploadtoken', 'add', 'KalturaUploadToken', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get upload token by id
		# 	 
		def get(upload_token_id)
			kparams = {}
			client.add_param(kparams, 'uploadTokenId', upload_token_id)
			client.queue_service_action_call('uploadtoken', 'get', 'KalturaUploadToken', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Upload a file using the upload token id, returns an error on failure (an exception will be thrown when using one of the Kaltura clients)
		# 	 Chunks can be uploaded in parallel and they will be appended according to their resumeAt position.
		# 	 A parallel upload session should have three stages:
		# 	 1. A single upload with resume=false and finalChunk=false
		# 	 2. Parallel upload requests each with resume=true,finalChunk=false and the expected resumetAt position.
		# 	 If a chunk fails to upload it can be re-uploaded.
		# 	 3. After all of the chunks have been uploaded a final chunk (can be of zero size) should be uploaded 
		# 	 with resume=true, finalChunk=true and the expected resumeAt position. In case an UPLOAD_TOKEN_CANNOT_MATCH_EXPECTED_SIZE exception
		# 	 has been returned (indicating not all of the chunks were appended yet) the final request can be retried.     
		# 	 
		def upload(upload_token_id, file_data, resume=false, final_chunk=true, resume_at=-1)
			kparams = {}
			kfiles = {}
			client.add_param(kparams, 'uploadTokenId', upload_token_id)
			client.add_param(kfiles, 'fileData', file_data)
			client.add_param(kparams, 'resume', resume)
			client.add_param(kparams, 'finalChunk', final_chunk)
			client.add_param(kparams, 'resumeAt', resume_at)
			client.queue_service_action_call('uploadtoken', 'upload', 'KalturaUploadToken', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Deletes the upload token by upload token id
		# 	 
		def delete(upload_token_id)
			kparams = {}
			client.add_param(kparams, 'uploadTokenId', upload_token_id)
			client.queue_service_action_call('uploadtoken', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List upload token by filter with pager support. 
		# 	 When using a user session the service will be restricted to users objects only.
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('uploadtoken', 'list', 'KalturaUploadTokenListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaUserEntryService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Adds a user_entry to the Kaltura DB.
		# 	 
		def add(user_entry)
			kparams = {}
			client.add_param(kparams, 'userEntry', user_entry)
			client.queue_service_action_call('userentry', 'add', 'KalturaUserEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def update(id, user_entry)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'userEntry', user_entry)
			client.queue_service_action_call('userentry', 'update', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('userentry', 'delete', 'KalturaUserEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def list(filter, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('userentry', 'list', 'KalturaUserEntryListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('userentry', 'get', 'KalturaUserEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Submits the quiz so that it's status will be submitted and calculates the score for the quiz
		# 	 
		def submit_quiz(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('userentry', 'submitQuiz', 'KalturaQuizUserEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# UserRole service lets you create and manage user roles
	#  
	class KalturaUserRoleService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Adds a new user role object to the account.
		# 	 
		def add(user_role)
			kparams = {}
			client.add_param(kparams, 'userRole', user_role)
			client.queue_service_action_call('userrole', 'add', 'KalturaUserRole', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieves a user role object using its ID.
		# 	 
		def get(user_role_id)
			kparams = {}
			client.add_param(kparams, 'userRoleId', user_role_id)
			client.queue_service_action_call('userrole', 'get', 'KalturaUserRole', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Updates an existing user role object.
		# 	 
		def update(user_role_id, user_role)
			kparams = {}
			client.add_param(kparams, 'userRoleId', user_role_id)
			client.add_param(kparams, 'userRole', user_role)
			client.queue_service_action_call('userrole', 'update', 'KalturaUserRole', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Deletes an existing user role object.
		# 	 
		def delete(user_role_id)
			kparams = {}
			client.add_param(kparams, 'userRoleId', user_role_id)
			client.queue_service_action_call('userrole', 'delete', 'KalturaUserRole', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Lists user role objects that are associated with an account.
		# 	 Blocked user roles are listed unless you use a filter to exclude them.
		# 	 Deleted user roles are not listed unless you use a filter to include them.
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('userrole', 'list', 'KalturaUserRoleListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Creates a new user role object that is a duplicate of an existing role.
		# 	 
		def clone(user_role_id)
			kparams = {}
			client.add_param(kparams, 'userRoleId', user_role_id)
			client.queue_service_action_call('userrole', 'clone', 'KalturaUserRole', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Manage partner users on Kaltura's side
	#  The userId in kaltura is the unique Id in the partner's system, and the [partnerId,Id] couple are unique key in kaltura's DB
	#  
	class KalturaUserService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Adds a new user to an existing account in the Kaltura database.
		# 	 Input param $id is the unique identifier in the partner's system.
		# 	 
		def add(user)
			kparams = {}
			client.add_param(kparams, 'user', user)
			client.queue_service_action_call('user', 'add', 'KalturaUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Updates an existing user object.
		# 	 You can also use this action to update the userId.
		# 	 
		def update(user_id, user)
			kparams = {}
			client.add_param(kparams, 'userId', user_id)
			client.add_param(kparams, 'user', user)
			client.queue_service_action_call('user', 'update', 'KalturaUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieves a user object for a specified user ID.
		# 	 
		def get(user_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'userId', user_id)
			client.queue_service_action_call('user', 'get', 'KalturaUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieves a user object for a user's login ID and partner ID.
		# 	 A login ID is the email address used by a user to log into the system.
		# 	 
		def get_by_login_id(login_id)
			kparams = {}
			client.add_param(kparams, 'loginId', login_id)
			client.queue_service_action_call('user', 'getByLoginId', 'KalturaUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Deletes a user from a partner account.
		# 	 
		def delete(user_id)
			kparams = {}
			client.add_param(kparams, 'userId', user_id)
			client.queue_service_action_call('user', 'delete', 'KalturaUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Lists user objects that are associated with an account.
		# 	 Blocked users are listed unless you use a filter to exclude them.
		# 	 Deleted users are not listed unless you use a filter to include them.
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('user', 'list', 'KalturaUserListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Notifies that a user is banned from an account.
		# 	 
		def notify_ban(user_id)
			kparams = {}
			client.add_param(kparams, 'userId', user_id)
			client.queue_service_action_call('user', 'notifyBan', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Logs a user into a partner account with a partner ID, a partner user ID (puser), and a user password.
		# 	 
		def login(partner_id, user_id, password, expiry=86400, privileges='*')
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'userId', user_id)
			client.add_param(kparams, 'password', password)
			client.add_param(kparams, 'expiry', expiry)
			client.add_param(kparams, 'privileges', privileges)
			client.queue_service_action_call('user', 'login', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Logs a user into a partner account with a user login ID and a user password.
		# 	 
		def login_by_login_id(login_id, password, partner_id=KalturaNotImplemented, expiry=86400, privileges='*')
			kparams = {}
			client.add_param(kparams, 'loginId', login_id)
			client.add_param(kparams, 'password', password)
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'expiry', expiry)
			client.add_param(kparams, 'privileges', privileges)
			client.queue_service_action_call('user', 'loginByLoginId', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Updates a user's login data: email, password, name.
		# 	 
		def update_login_data(old_login_id, password, new_login_id='', new_password='', new_first_name=KalturaNotImplemented, new_last_name=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'oldLoginId', old_login_id)
			client.add_param(kparams, 'password', password)
			client.add_param(kparams, 'newLoginId', new_login_id)
			client.add_param(kparams, 'newPassword', new_password)
			client.add_param(kparams, 'newFirstName', new_first_name)
			client.add_param(kparams, 'newLastName', new_last_name)
			client.queue_service_action_call('user', 'updateLoginData', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Reset user's password and send the user an email to generate a new one.
		# 	 
		def reset_password(email)
			kparams = {}
			client.add_param(kparams, 'email', email)
			client.queue_service_action_call('user', 'resetPassword', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Set initial users password
		# 	 
		def set_initial_password(hash_key, new_password)
			kparams = {}
			client.add_param(kparams, 'hashKey', hash_key)
			client.add_param(kparams, 'newPassword', new_password)
			client.queue_service_action_call('user', 'setInitialPassword', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Enables a user to log into a partner account using an email address and a password
		# 	 
		def enable_login(user_id, login_id, password=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'userId', user_id)
			client.add_param(kparams, 'loginId', login_id)
			client.add_param(kparams, 'password', password)
			client.queue_service_action_call('user', 'enableLogin', 'KalturaUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Disables a user's ability to log into a partner account using an email address and a password.
		# 	 You may use either a userId or a loginId parameter for this action.
		# 	 
		def disable_login(user_id=KalturaNotImplemented, login_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'userId', user_id)
			client.add_param(kparams, 'loginId', login_id)
			client.queue_service_action_call('user', 'disableLogin', 'KalturaUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Index an entry by id.
		# 	 
		def index(id, should_update=true)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'shouldUpdate', should_update)
			client.queue_service_action_call('user', 'index', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def add_from_bulk_upload(file_data, bulk_upload_data=KalturaNotImplemented, bulk_upload_user_data=KalturaNotImplemented)
			kparams = {}
			kfiles = {}
			client.add_param(kfiles, 'fileData', file_data)
			client.add_param(kparams, 'bulkUploadData', bulk_upload_data)
			client.add_param(kparams, 'bulkUploadUserData', bulk_upload_user_data)
			client.queue_service_action_call('user', 'addFromBulkUpload', 'KalturaBulkUpload', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Action which checks whther user login 
		#      
		def check_login_data_exists(filter)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('user', 'checkLoginDataExists', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# widget service for full widget management
	#  
	class KalturaWidgetService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new widget, can be attached to entry or kshow
		# 	 SourceWidget is ignored.
		# 	 
		def add(widget)
			kparams = {}
			client.add_param(kparams, 'widget', widget)
			client.queue_service_action_call('widget', 'add', 'KalturaWidget', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update exisiting widget
		#  	 
		def update(id, widget)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'widget', widget)
			client.queue_service_action_call('widget', 'update', 'KalturaWidget', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get widget by id
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('widget', 'get', 'KalturaWidget', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Add widget based on existing widget.
		# 	 Must provide valid sourceWidgetId
		# 	 
		def clone(widget)
			kparams = {}
			client.add_param(kparams, 'widget', widget)
			client.queue_service_action_call('widget', 'clone', 'KalturaWidget', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a list of available widget depends on the filter given
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('widget', 'list', 'KalturaWidgetListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Internal Service is used for actions that are used internally in Kaltura applications and might be changed in the future without any notice.
	#  
	class KalturaXInternalService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Creates new download job for multiple entry ids (comma separated), an email will be sent when the job is done
		# 	 This sevice support the following entries: 
		# 	 - MediaEntry
		# 	 - Video will be converted using the flavor params id
		# 	 - Audio will be downloaded as MP3
		# 	 - Image will be downloaded as Jpeg
		# 	 - MixEntry will be flattened using the flavor params id
		# 	 - Other entry types are not supported
		# 	 Returns the admin email that the email message will be sent to 
		# 	 
		def x_add_bulk_download(entry_ids, flavor_params_id='')
			kparams = {}
			client.add_param(kparams, 'entryIds', entry_ids)
			client.add_param(kparams, 'flavorParamsId', flavor_params_id)
			client.queue_service_action_call('xinternal', 'xAddBulkDownload', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :access_control_profile_service
		def access_control_profile_service
			if (@access_control_profile_service == nil)
				@access_control_profile_service = KalturaAccessControlProfileService.new(self)
			end
			return @access_control_profile_service
		end
		
		attr_reader :access_control_service
		def access_control_service
			if (@access_control_service == nil)
				@access_control_service = KalturaAccessControlService.new(self)
			end
			return @access_control_service
		end
		
		attr_reader :admin_user_service
		def admin_user_service
			if (@admin_user_service == nil)
				@admin_user_service = KalturaAdminUserService.new(self)
			end
			return @admin_user_service
		end
		
		attr_reader :app_token_service
		def app_token_service
			if (@app_token_service == nil)
				@app_token_service = KalturaAppTokenService.new(self)
			end
			return @app_token_service
		end
		
		attr_reader :base_entry_service
		def base_entry_service
			if (@base_entry_service == nil)
				@base_entry_service = KalturaBaseEntryService.new(self)
			end
			return @base_entry_service
		end
		
		attr_reader :bulk_upload_service
		def bulk_upload_service
			if (@bulk_upload_service == nil)
				@bulk_upload_service = KalturaBulkUploadService.new(self)
			end
			return @bulk_upload_service
		end
		
		attr_reader :category_entry_service
		def category_entry_service
			if (@category_entry_service == nil)
				@category_entry_service = KalturaCategoryEntryService.new(self)
			end
			return @category_entry_service
		end
		
		attr_reader :category_service
		def category_service
			if (@category_service == nil)
				@category_service = KalturaCategoryService.new(self)
			end
			return @category_service
		end
		
		attr_reader :category_user_service
		def category_user_service
			if (@category_user_service == nil)
				@category_user_service = KalturaCategoryUserService.new(self)
			end
			return @category_user_service
		end
		
		attr_reader :conversion_profile_asset_params_service
		def conversion_profile_asset_params_service
			if (@conversion_profile_asset_params_service == nil)
				@conversion_profile_asset_params_service = KalturaConversionProfileAssetParamsService.new(self)
			end
			return @conversion_profile_asset_params_service
		end
		
		attr_reader :conversion_profile_service
		def conversion_profile_service
			if (@conversion_profile_service == nil)
				@conversion_profile_service = KalturaConversionProfileService.new(self)
			end
			return @conversion_profile_service
		end
		
		attr_reader :data_service
		def data_service
			if (@data_service == nil)
				@data_service = KalturaDataService.new(self)
			end
			return @data_service
		end
		
		attr_reader :delivery_profile_service
		def delivery_profile_service
			if (@delivery_profile_service == nil)
				@delivery_profile_service = KalturaDeliveryProfileService.new(self)
			end
			return @delivery_profile_service
		end
		
		attr_reader :document_service
		def document_service
			if (@document_service == nil)
				@document_service = KalturaDocumentService.new(self)
			end
			return @document_service
		end
		
		attr_reader :email_ingestion_profile_service
		def email_ingestion_profile_service
			if (@email_ingestion_profile_service == nil)
				@email_ingestion_profile_service = KalturaEmailIngestionProfileService.new(self)
			end
			return @email_ingestion_profile_service
		end
		
		attr_reader :file_asset_service
		def file_asset_service
			if (@file_asset_service == nil)
				@file_asset_service = KalturaFileAssetService.new(self)
			end
			return @file_asset_service
		end
		
		attr_reader :flavor_asset_service
		def flavor_asset_service
			if (@flavor_asset_service == nil)
				@flavor_asset_service = KalturaFlavorAssetService.new(self)
			end
			return @flavor_asset_service
		end
		
		attr_reader :flavor_params_output_service
		def flavor_params_output_service
			if (@flavor_params_output_service == nil)
				@flavor_params_output_service = KalturaFlavorParamsOutputService.new(self)
			end
			return @flavor_params_output_service
		end
		
		attr_reader :flavor_params_service
		def flavor_params_service
			if (@flavor_params_service == nil)
				@flavor_params_service = KalturaFlavorParamsService.new(self)
			end
			return @flavor_params_service
		end
		
		attr_reader :group_user_service
		def group_user_service
			if (@group_user_service == nil)
				@group_user_service = KalturaGroupUserService.new(self)
			end
			return @group_user_service
		end
		
		attr_reader :live_channel_segment_service
		def live_channel_segment_service
			if (@live_channel_segment_service == nil)
				@live_channel_segment_service = KalturaLiveChannelSegmentService.new(self)
			end
			return @live_channel_segment_service
		end
		
		attr_reader :live_channel_service
		def live_channel_service
			if (@live_channel_service == nil)
				@live_channel_service = KalturaLiveChannelService.new(self)
			end
			return @live_channel_service
		end
		
		attr_reader :live_reports_service
		def live_reports_service
			if (@live_reports_service == nil)
				@live_reports_service = KalturaLiveReportsService.new(self)
			end
			return @live_reports_service
		end
		
		attr_reader :live_stats_service
		def live_stats_service
			if (@live_stats_service == nil)
				@live_stats_service = KalturaLiveStatsService.new(self)
			end
			return @live_stats_service
		end
		
		attr_reader :live_stream_service
		def live_stream_service
			if (@live_stream_service == nil)
				@live_stream_service = KalturaLiveStreamService.new(self)
			end
			return @live_stream_service
		end
		
		attr_reader :media_info_service
		def media_info_service
			if (@media_info_service == nil)
				@media_info_service = KalturaMediaInfoService.new(self)
			end
			return @media_info_service
		end
		
		attr_reader :media_service
		def media_service
			if (@media_service == nil)
				@media_service = KalturaMediaService.new(self)
			end
			return @media_service
		end
		
		attr_reader :mixing_service
		def mixing_service
			if (@mixing_service == nil)
				@mixing_service = KalturaMixingService.new(self)
			end
			return @mixing_service
		end
		
		attr_reader :notification_service
		def notification_service
			if (@notification_service == nil)
				@notification_service = KalturaNotificationService.new(self)
			end
			return @notification_service
		end
		
		attr_reader :partner_service
		def partner_service
			if (@partner_service == nil)
				@partner_service = KalturaPartnerService.new(self)
			end
			return @partner_service
		end
		
		attr_reader :permission_item_service
		def permission_item_service
			if (@permission_item_service == nil)
				@permission_item_service = KalturaPermissionItemService.new(self)
			end
			return @permission_item_service
		end
		
		attr_reader :permission_service
		def permission_service
			if (@permission_service == nil)
				@permission_service = KalturaPermissionService.new(self)
			end
			return @permission_service
		end
		
		attr_reader :playlist_service
		def playlist_service
			if (@playlist_service == nil)
				@playlist_service = KalturaPlaylistService.new(self)
			end
			return @playlist_service
		end
		
		attr_reader :report_service
		def report_service
			if (@report_service == nil)
				@report_service = KalturaReportService.new(self)
			end
			return @report_service
		end
		
		attr_reader :response_profile_service
		def response_profile_service
			if (@response_profile_service == nil)
				@response_profile_service = KalturaResponseProfileService.new(self)
			end
			return @response_profile_service
		end
		
		attr_reader :schema_service
		def schema_service
			if (@schema_service == nil)
				@schema_service = KalturaSchemaService.new(self)
			end
			return @schema_service
		end
		
		attr_reader :search_service
		def search_service
			if (@search_service == nil)
				@search_service = KalturaSearchService.new(self)
			end
			return @search_service
		end
		
		attr_reader :server_node_service
		def server_node_service
			if (@server_node_service == nil)
				@server_node_service = KalturaServerNodeService.new(self)
			end
			return @server_node_service
		end
		
		attr_reader :session_service
		def session_service
			if (@session_service == nil)
				@session_service = KalturaSessionService.new(self)
			end
			return @session_service
		end
		
		attr_reader :stats_service
		def stats_service
			if (@stats_service == nil)
				@stats_service = KalturaStatsService.new(self)
			end
			return @stats_service
		end
		
		attr_reader :storage_profile_service
		def storage_profile_service
			if (@storage_profile_service == nil)
				@storage_profile_service = KalturaStorageProfileService.new(self)
			end
			return @storage_profile_service
		end
		
		attr_reader :syndication_feed_service
		def syndication_feed_service
			if (@syndication_feed_service == nil)
				@syndication_feed_service = KalturaSyndicationFeedService.new(self)
			end
			return @syndication_feed_service
		end
		
		attr_reader :system_service
		def system_service
			if (@system_service == nil)
				@system_service = KalturaSystemService.new(self)
			end
			return @system_service
		end
		
		attr_reader :thumb_asset_service
		def thumb_asset_service
			if (@thumb_asset_service == nil)
				@thumb_asset_service = KalturaThumbAssetService.new(self)
			end
			return @thumb_asset_service
		end
		
		attr_reader :thumb_params_output_service
		def thumb_params_output_service
			if (@thumb_params_output_service == nil)
				@thumb_params_output_service = KalturaThumbParamsOutputService.new(self)
			end
			return @thumb_params_output_service
		end
		
		attr_reader :thumb_params_service
		def thumb_params_service
			if (@thumb_params_service == nil)
				@thumb_params_service = KalturaThumbParamsService.new(self)
			end
			return @thumb_params_service
		end
		
		attr_reader :ui_conf_service
		def ui_conf_service
			if (@ui_conf_service == nil)
				@ui_conf_service = KalturaUiConfService.new(self)
			end
			return @ui_conf_service
		end
		
		attr_reader :upload_service
		def upload_service
			if (@upload_service == nil)
				@upload_service = KalturaUploadService.new(self)
			end
			return @upload_service
		end
		
		attr_reader :upload_token_service
		def upload_token_service
			if (@upload_token_service == nil)
				@upload_token_service = KalturaUploadTokenService.new(self)
			end
			return @upload_token_service
		end
		
		attr_reader :user_entry_service
		def user_entry_service
			if (@user_entry_service == nil)
				@user_entry_service = KalturaUserEntryService.new(self)
			end
			return @user_entry_service
		end
		
		attr_reader :user_role_service
		def user_role_service
			if (@user_role_service == nil)
				@user_role_service = KalturaUserRoleService.new(self)
			end
			return @user_role_service
		end
		
		attr_reader :user_service
		def user_service
			if (@user_service == nil)
				@user_service = KalturaUserService.new(self)
			end
			return @user_service
		end
		
		attr_reader :widget_service
		def widget_service
			if (@widget_service == nil)
				@widget_service = KalturaWidgetService.new(self)
			end
			return @widget_service
		end
		
		attr_reader :x_internal_service
		def x_internal_service
			if (@x_internal_service == nil)
				@x_internal_service = KalturaXInternalService.new(self)
			end
			return @x_internal_service
		end
		
		def initialize(client)
			super(client)
			self.client_tag = 'ruby:16-01-23'
			self.api_version = '3.3.0'
		end
		
		def client_tag=(value)
			@client_configuration['clientTag'] = value
		end
		
		def client_tag()
			if(@client_configuration.has_key?('clientTag'))
				return @client_configuration['clientTag']
			end
			
			return KalturaNotImplemented
		end
		
	
		def api_version=(value)
			@client_configuration['apiVersion'] = value
		end
		
		def api_version()
			if(@client_configuration.has_key?('apiVersion'))
				return @client_configuration['apiVersion']
			end
			
			return KalturaNotImplemented
		end
		
	
		def partner_id=(value)
			@request_configuration['partnerId'] = value
		end
		
		def partner_id()
			if(@request_configuration.has_key?('partnerId'))
				return @request_configuration['partnerId']
			end
			
			return KalturaNotImplemented
		end
		
	
		def ks=(value)
			@request_configuration['ks'] = value
		end
		
		def ks()
			if(@request_configuration.has_key?('ks'))
				return @request_configuration['ks']
			end
			
			return KalturaNotImplemented
		end
		
	
		def session_id=(value)
			@request_configuration['ks'] = value
		end
		
		def session_id()
			if(@request_configuration.has_key?('ks'))
				return @request_configuration['ks']
			end
			
			return KalturaNotImplemented
		end
		
	
		def response_profile=(value)
			@request_configuration['responseProfile'] = value
		end
		
		def response_profile()
			if(@request_configuration.has_key?('responseProfile'))
				return @request_configuration['responseProfile']
			end
			
			return KalturaNotImplemented
		end
		
	
		def reset_request()
			super
			@request_configuration.delete('responseProfile')
		end
	end

end
