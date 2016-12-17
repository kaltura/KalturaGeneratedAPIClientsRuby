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
require File.dirname(__FILE__) + '/kaltura_metadata_client_plugin.rb'

module Kaltura

	class KalturaDistributionAction
		SUBMIT = 1
		UPDATE = 2
		DELETE = 3
		FETCH_REPORT = 4
	end

	class KalturaDistributionErrorType
		MISSING_FLAVOR = 1
		MISSING_THUMBNAIL = 2
		MISSING_METADATA = 3
		INVALID_DATA = 4
		MISSING_ASSET = 5
		CONDITION_NOT_MET = 6
	end

	class KalturaDistributionFieldRequiredStatus
		NOT_REQUIRED = 0
		REQUIRED_BY_PROVIDER = 1
		REQUIRED_BY_PARTNER = 2
		REQUIRED_FOR_AUTOMATIC_DISTRIBUTION = 3
	end

	class KalturaDistributionProfileActionStatus
		DISABLED = 1
		AUTOMATIC = 2
		MANUAL = 3
	end

	class KalturaDistributionProfileStatus
		DISABLED = 1
		ENABLED = 2
		DELETED = 3
	end

	class KalturaDistributionProtocol
		FTP = 1
		SCP = 2
		SFTP = 3
		HTTP = 4
		HTTPS = 5
		ASPERA = 10
	end

	class KalturaDistributionValidationErrorType
		CUSTOM_ERROR = 0
		STRING_EMPTY = 1
		STRING_TOO_LONG = 2
		STRING_TOO_SHORT = 3
		INVALID_FORMAT = 4
	end

	class KalturaEntryDistributionFlag
		NONE = 0
		SUBMIT_REQUIRED = 1
		DELETE_REQUIRED = 2
		UPDATE_REQUIRED = 3
		ENABLE_REQUIRED = 4
		DISABLE_REQUIRED = 5
	end

	class KalturaEntryDistributionStatus
		PENDING = 0
		QUEUED = 1
		READY = 2
		DELETED = 3
		SUBMITTING = 4
		UPDATING = 5
		DELETING = 6
		ERROR_SUBMITTING = 7
		ERROR_UPDATING = 8
		ERROR_DELETING = 9
		REMOVED = 10
		IMPORT_SUBMITTING = 11
		IMPORT_UPDATING = 12
	end

	class KalturaEntryDistributionSunStatus
		BEFORE_SUNRISE = 1
		AFTER_SUNRISE = 2
		AFTER_SUNSET = 3
	end

	class KalturaGenericDistributionProviderParser
		XSL = 1
		XPATH = 2
		REGEX = 3
	end

	class KalturaGenericDistributionProviderStatus
		ACTIVE = 2
		DELETED = 3
	end

	class KalturaConfigurableDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaDistributionProviderOrderBy
	end

	class KalturaDistributionProviderType
		FACEBOOK = "facebookDistribution.FACEBOOK"
		IDETIC = "ideticDistribution.IDETIC"
		YOUTUBE_API = "youtubeApiDistribution.YOUTUBE_API"
		GENERIC = "1"
		SYNDICATION = "2"
	end

	class KalturaEntryDistributionOrderBy
		CREATED_AT_ASC = "+createdAt"
		SUBMITTED_AT_ASC = "+submittedAt"
		SUNRISE_ASC = "+sunrise"
		SUNSET_ASC = "+sunset"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		SUBMITTED_AT_DESC = "-submittedAt"
		SUNRISE_DESC = "-sunrise"
		SUNSET_DESC = "-sunset"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaGenericDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaGenericDistributionProviderActionOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaGenericDistributionProviderOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaSyndicationDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaSyndicationDistributionProviderOrderBy
	end

	# Abstract class for asset distribution condition
	class KalturaAssetDistributionCondition < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAssetDistributionRule < KalturaObjectBase
		# The validation error description that will be set on the "data" property on KalturaDistributionValidationErrorMissingAsset if rule was not fulfilled
		attr_accessor :validation_error
		# An array of asset distribution conditions
		attr_accessor :asset_distribution_conditions


		def from_xml(xml_element)
			super
			self.validation_error = xml_element.elements['validationError'].text
			self.asset_distribution_conditions = KalturaClientBase.object_from_xml(xml_element.elements['assetDistributionConditions'], 'KalturaAssetDistributionCondition')
		end

	end

	class KalturaDistributionFieldConfig < KalturaObjectBase
		# A value taken from a connector field enum which associates the current configuration to that connector field
		#      Field enum class should be returned by the provider's getFieldEnumClass function.
		attr_accessor :field_name
		# A string that will be shown to the user as the field name in error messages related to the current field
		attr_accessor :user_friendly_field_name
		# An XSLT string that extracts the right value from the Kaltura entry MRSS XML.
		#      The value of the current connector field will be the one that is returned from transforming the Kaltura entry MRSS XML using this XSLT string.
		attr_accessor :entry_mrss_xslt
		# Is the field required to have a value for submission ?
		attr_accessor :is_required
		# Trigger distribution update when this field changes or not ?
		attr_accessor :update_on_change
		# Entry column or metadata xpath that should trigger an update
		attr_accessor :update_params
		# Is this field config is the default for the distribution provider?
		attr_accessor :is_default
		# Is an error on this field going to trigger deletion of distributed content?
		attr_accessor :trigger_delete_on_error

		def is_required=(val)
			@is_required = val.to_i
		end
		def update_on_change=(val)
			@update_on_change = to_b(val)
		end
		def is_default=(val)
			@is_default = to_b(val)
		end
		def trigger_delete_on_error=(val)
			@trigger_delete_on_error = to_b(val)
		end

		def from_xml(xml_element)
			super
			self.field_name = xml_element.elements['fieldName'].text
			self.user_friendly_field_name = xml_element.elements['userFriendlyFieldName'].text
			self.entry_mrss_xslt = xml_element.elements['entryMrssXslt'].text
			self.is_required = xml_element.elements['isRequired'].text
			self.update_on_change = xml_element.elements['updateOnChange'].text
			self.update_params = KalturaClientBase.object_from_xml(xml_element.elements['updateParams'], 'KalturaString')
			self.is_default = xml_element.elements['isDefault'].text
			self.trigger_delete_on_error = xml_element.elements['triggerDeleteOnError'].text
		end

	end

	class KalturaDistributionJobProviderData < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDistributionThumbDimensions < KalturaObjectBase
		attr_accessor :width
		attr_accessor :height

		def width=(val)
			@width = val.to_i
		end
		def height=(val)
			@height = val.to_i
		end

		def from_xml(xml_element)
			super
			self.width = xml_element.elements['width'].text
			self.height = xml_element.elements['height'].text
		end

	end

	class KalturaDistributionProfile < KalturaObjectBase
		# Auto generated unique id
		attr_accessor :id
		# Profile creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Profile last update date as Unix timestamp (In seconds)
		attr_accessor :updated_at
		attr_accessor :partner_id
		attr_accessor :provider_type
		attr_accessor :name
		attr_accessor :status
		attr_accessor :submit_enabled
		attr_accessor :update_enabled
		attr_accessor :delete_enabled
		attr_accessor :report_enabled
		# Comma separated flavor params ids that should be auto converted
		attr_accessor :auto_create_flavors
		# Comma separated thumbnail params ids that should be auto generated
		attr_accessor :auto_create_thumb
		# Comma separated flavor params ids that should be submitted if ready
		attr_accessor :optional_flavor_params_ids
		# Comma separated flavor params ids that required to be ready before submission
		attr_accessor :required_flavor_params_ids
		# Thumbnail dimensions that should be submitted if ready
		attr_accessor :optional_thumb_dimensions
		# Thumbnail dimensions that required to be readt before submission
		attr_accessor :required_thumb_dimensions
		# Asset Distribution Rules for assets that should be submitted if ready
		attr_accessor :optional_asset_distribution_rules
		# Assets Asset Distribution Rules for assets that are required to be ready before submission
		attr_accessor :required_asset_distribution_rules
		# If entry distribution sunrise not specified that will be the default since entry creation time, in seconds
		attr_accessor :sunrise_default_offset
		# If entry distribution sunset not specified that will be the default since entry creation time, in seconds
		attr_accessor :sunset_default_offset
		# The best external storage to be used to download the asset files from
		attr_accessor :recommended_storage_profile_for_download
		# The best Kaltura data center to be used to download the asset files to
		attr_accessor :recommended_dc_for_download
		# The best Kaltura data center to be used to execute the distribution job
		attr_accessor :recommended_dc_for_execute

		def id=(val)
			@id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def submit_enabled=(val)
			@submit_enabled = val.to_i
		end
		def update_enabled=(val)
			@update_enabled = val.to_i
		end
		def delete_enabled=(val)
			@delete_enabled = val.to_i
		end
		def report_enabled=(val)
			@report_enabled = val.to_i
		end
		def sunrise_default_offset=(val)
			@sunrise_default_offset = val.to_i
		end
		def sunset_default_offset=(val)
			@sunset_default_offset = val.to_i
		end
		def recommended_storage_profile_for_download=(val)
			@recommended_storage_profile_for_download = val.to_i
		end
		def recommended_dc_for_download=(val)
			@recommended_dc_for_download = val.to_i
		end
		def recommended_dc_for_execute=(val)
			@recommended_dc_for_execute = val.to_i
		end

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.provider_type = xml_element.elements['providerType'].text
			self.name = xml_element.elements['name'].text
			self.status = xml_element.elements['status'].text
			self.submit_enabled = xml_element.elements['submitEnabled'].text
			self.update_enabled = xml_element.elements['updateEnabled'].text
			self.delete_enabled = xml_element.elements['deleteEnabled'].text
			self.report_enabled = xml_element.elements['reportEnabled'].text
			self.auto_create_flavors = xml_element.elements['autoCreateFlavors'].text
			self.auto_create_thumb = xml_element.elements['autoCreateThumb'].text
			self.optional_flavor_params_ids = xml_element.elements['optionalFlavorParamsIds'].text
			self.required_flavor_params_ids = xml_element.elements['requiredFlavorParamsIds'].text
			self.optional_thumb_dimensions = KalturaClientBase.object_from_xml(xml_element.elements['optionalThumbDimensions'], 'KalturaDistributionThumbDimensions')
			self.required_thumb_dimensions = KalturaClientBase.object_from_xml(xml_element.elements['requiredThumbDimensions'], 'KalturaDistributionThumbDimensions')
			self.optional_asset_distribution_rules = KalturaClientBase.object_from_xml(xml_element.elements['optionalAssetDistributionRules'], 'KalturaAssetDistributionRule')
			self.required_asset_distribution_rules = KalturaClientBase.object_from_xml(xml_element.elements['requiredAssetDistributionRules'], 'KalturaAssetDistributionRule')
			self.sunrise_default_offset = xml_element.elements['sunriseDefaultOffset'].text
			self.sunset_default_offset = xml_element.elements['sunsetDefaultOffset'].text
			self.recommended_storage_profile_for_download = xml_element.elements['recommendedStorageProfileForDownload'].text
			self.recommended_dc_for_download = xml_element.elements['recommendedDcForDownload'].text
			self.recommended_dc_for_execute = xml_element.elements['recommendedDcForExecute'].text
		end

	end

	class KalturaDistributionProvider < KalturaObjectBase
		attr_accessor :type
		attr_accessor :name
		attr_accessor :schedule_update_enabled
		attr_accessor :availability_update_enabled
		attr_accessor :delete_instead_update
		attr_accessor :interval_before_sunrise
		attr_accessor :interval_before_sunset
		attr_accessor :update_required_entry_fields
		attr_accessor :update_required_metadata_xpaths

		def schedule_update_enabled=(val)
			@schedule_update_enabled = to_b(val)
		end
		def availability_update_enabled=(val)
			@availability_update_enabled = to_b(val)
		end
		def delete_instead_update=(val)
			@delete_instead_update = to_b(val)
		end
		def interval_before_sunrise=(val)
			@interval_before_sunrise = val.to_i
		end
		def interval_before_sunset=(val)
			@interval_before_sunset = val.to_i
		end

		def from_xml(xml_element)
			super
			self.type = xml_element.elements['type'].text
			self.name = xml_element.elements['name'].text
			self.schedule_update_enabled = xml_element.elements['scheduleUpdateEnabled'].text
			self.availability_update_enabled = xml_element.elements['availabilityUpdateEnabled'].text
			self.delete_instead_update = xml_element.elements['deleteInsteadUpdate'].text
			self.interval_before_sunrise = xml_element.elements['intervalBeforeSunrise'].text
			self.interval_before_sunset = xml_element.elements['intervalBeforeSunset'].text
			self.update_required_entry_fields = xml_element.elements['updateRequiredEntryFields'].text
			self.update_required_metadata_xpaths = xml_element.elements['updateRequiredMetadataXPaths'].text
		end

	end

	class KalturaDistributionRemoteMediaFile < KalturaObjectBase
		attr_accessor :version
		attr_accessor :asset_id
		attr_accessor :remote_id


		def from_xml(xml_element)
			super
			self.version = xml_element.elements['version'].text
			self.asset_id = xml_element.elements['assetId'].text
			self.remote_id = xml_element.elements['remoteId'].text
		end

	end

	class KalturaDistributionValidationError < KalturaObjectBase
		attr_accessor :action
		attr_accessor :error_type
		attr_accessor :description

		def action=(val)
			@action = val.to_i
		end
		def error_type=(val)
			@error_type = val.to_i
		end

		def from_xml(xml_element)
			super
			self.action = xml_element.elements['action'].text
			self.error_type = xml_element.elements['errorType'].text
			self.description = xml_element.elements['description'].text
		end

	end

	class KalturaEntryDistribution < KalturaObjectBase
		# Auto generated unique id
		attr_accessor :id
		# Entry distribution creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Entry distribution last update date as Unix timestamp (In seconds)
		attr_accessor :updated_at
		# Entry distribution submission date as Unix timestamp (In seconds)
		attr_accessor :submitted_at
		attr_accessor :entry_id
		attr_accessor :partner_id
		attr_accessor :distribution_profile_id
		attr_accessor :status
		attr_accessor :sun_status
		attr_accessor :dirty_status
		# Comma separated thumbnail asset ids
		attr_accessor :thumb_asset_ids
		# Comma separated flavor asset ids
		attr_accessor :flavor_asset_ids
		# Comma separated asset ids
		attr_accessor :asset_ids
		# Entry distribution publish time as Unix timestamp (In seconds)
		attr_accessor :sunrise
		# Entry distribution un-publish time as Unix timestamp (In seconds)
		attr_accessor :sunset
		# The id as returned from the distributed destination
		attr_accessor :remote_id
		# The plays as retrieved from the remote destination reports
		attr_accessor :plays
		# The views as retrieved from the remote destination reports
		attr_accessor :views
		attr_accessor :validation_errors
		attr_accessor :error_type
		attr_accessor :error_number
		attr_accessor :error_description
		attr_accessor :has_submit_results_log
		attr_accessor :has_submit_sent_data_log
		attr_accessor :has_update_results_log
		attr_accessor :has_update_sent_data_log
		attr_accessor :has_delete_results_log
		attr_accessor :has_delete_sent_data_log

		def id=(val)
			@id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def submitted_at=(val)
			@submitted_at = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def distribution_profile_id=(val)
			@distribution_profile_id = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def sun_status=(val)
			@sun_status = val.to_i
		end
		def dirty_status=(val)
			@dirty_status = val.to_i
		end
		def sunrise=(val)
			@sunrise = val.to_i
		end
		def sunset=(val)
			@sunset = val.to_i
		end
		def plays=(val)
			@plays = val.to_i
		end
		def views=(val)
			@views = val.to_i
		end
		def error_type=(val)
			@error_type = val.to_i
		end
		def error_number=(val)
			@error_number = val.to_i
		end
		def has_submit_results_log=(val)
			@has_submit_results_log = val.to_i
		end
		def has_submit_sent_data_log=(val)
			@has_submit_sent_data_log = val.to_i
		end
		def has_update_results_log=(val)
			@has_update_results_log = val.to_i
		end
		def has_update_sent_data_log=(val)
			@has_update_sent_data_log = val.to_i
		end
		def has_delete_results_log=(val)
			@has_delete_results_log = val.to_i
		end
		def has_delete_sent_data_log=(val)
			@has_delete_sent_data_log = val.to_i
		end

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.submitted_at = xml_element.elements['submittedAt'].text
			self.entry_id = xml_element.elements['entryId'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.distribution_profile_id = xml_element.elements['distributionProfileId'].text
			self.status = xml_element.elements['status'].text
			self.sun_status = xml_element.elements['sunStatus'].text
			self.dirty_status = xml_element.elements['dirtyStatus'].text
			self.thumb_asset_ids = xml_element.elements['thumbAssetIds'].text
			self.flavor_asset_ids = xml_element.elements['flavorAssetIds'].text
			self.asset_ids = xml_element.elements['assetIds'].text
			self.sunrise = xml_element.elements['sunrise'].text
			self.sunset = xml_element.elements['sunset'].text
			self.remote_id = xml_element.elements['remoteId'].text
			self.plays = xml_element.elements['plays'].text
			self.views = xml_element.elements['views'].text
			self.validation_errors = KalturaClientBase.object_from_xml(xml_element.elements['validationErrors'], 'KalturaDistributionValidationError')
			self.error_type = xml_element.elements['errorType'].text
			self.error_number = xml_element.elements['errorNumber'].text
			self.error_description = xml_element.elements['errorDescription'].text
			self.has_submit_results_log = xml_element.elements['hasSubmitResultsLog'].text
			self.has_submit_sent_data_log = xml_element.elements['hasSubmitSentDataLog'].text
			self.has_update_results_log = xml_element.elements['hasUpdateResultsLog'].text
			self.has_update_sent_data_log = xml_element.elements['hasUpdateSentDataLog'].text
			self.has_delete_results_log = xml_element.elements['hasDeleteResultsLog'].text
			self.has_delete_sent_data_log = xml_element.elements['hasDeleteSentDataLog'].text
		end

	end

	class KalturaGenericDistributionProfileAction < KalturaObjectBase
		attr_accessor :protocol
		attr_accessor :server_url
		attr_accessor :server_path
		attr_accessor :username
		attr_accessor :password
		attr_accessor :ftp_passive_mode
		attr_accessor :http_field_name
		attr_accessor :http_file_name

		def protocol=(val)
			@protocol = val.to_i
		end
		def ftp_passive_mode=(val)
			@ftp_passive_mode = to_b(val)
		end

		def from_xml(xml_element)
			super
			self.protocol = xml_element.elements['protocol'].text
			self.server_url = xml_element.elements['serverUrl'].text
			self.server_path = xml_element.elements['serverPath'].text
			self.username = xml_element.elements['username'].text
			self.password = xml_element.elements['password'].text
			self.ftp_passive_mode = xml_element.elements['ftpPassiveMode'].text
			self.http_field_name = xml_element.elements['httpFieldName'].text
			self.http_file_name = xml_element.elements['httpFileName'].text
		end

	end

	class KalturaGenericDistributionProviderAction < KalturaObjectBase
		# Auto generated
		attr_accessor :id
		# Generic distribution provider action creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Generic distribution provider action last update date as Unix timestamp (In seconds)
		attr_accessor :updated_at
		attr_accessor :generic_distribution_provider_id
		attr_accessor :action
		attr_accessor :status
		attr_accessor :results_parser
		attr_accessor :protocol
		attr_accessor :server_address
		attr_accessor :remote_path
		attr_accessor :remote_username
		attr_accessor :remote_password
		attr_accessor :editable_fields
		attr_accessor :mandatory_fields
		attr_accessor :mrss_transformer
		attr_accessor :mrss_validator
		attr_accessor :results_transformer

		def id=(val)
			@id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def generic_distribution_provider_id=(val)
			@generic_distribution_provider_id = val.to_i
		end
		def action=(val)
			@action = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def results_parser=(val)
			@results_parser = val.to_i
		end
		def protocol=(val)
			@protocol = val.to_i
		end

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.generic_distribution_provider_id = xml_element.elements['genericDistributionProviderId'].text
			self.action = xml_element.elements['action'].text
			self.status = xml_element.elements['status'].text
			self.results_parser = xml_element.elements['resultsParser'].text
			self.protocol = xml_element.elements['protocol'].text
			self.server_address = xml_element.elements['serverAddress'].text
			self.remote_path = xml_element.elements['remotePath'].text
			self.remote_username = xml_element.elements['remoteUsername'].text
			self.remote_password = xml_element.elements['remotePassword'].text
			self.editable_fields = xml_element.elements['editableFields'].text
			self.mandatory_fields = xml_element.elements['mandatoryFields'].text
			self.mrss_transformer = xml_element.elements['mrssTransformer'].text
			self.mrss_validator = xml_element.elements['mrssValidator'].text
			self.results_transformer = xml_element.elements['resultsTransformer'].text
		end

	end

	class KalturaGenericDistributionProvider < KalturaDistributionProvider
		# Auto generated
		attr_accessor :id
		# Generic distribution provider creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Generic distribution provider last update date as Unix timestamp (In seconds)
		attr_accessor :updated_at
		attr_accessor :partner_id
		attr_accessor :is_default
		attr_accessor :status
		attr_accessor :optional_flavor_params_ids
		attr_accessor :required_flavor_params_ids
		attr_accessor :optional_thumb_dimensions
		attr_accessor :required_thumb_dimensions
		attr_accessor :editable_fields
		attr_accessor :mandatory_fields

		def id=(val)
			@id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def is_default=(val)
			@is_default = to_b(val)
		end
		def status=(val)
			@status = val.to_i
		end

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.is_default = xml_element.elements['isDefault'].text
			self.status = xml_element.elements['status'].text
			self.optional_flavor_params_ids = xml_element.elements['optionalFlavorParamsIds'].text
			self.required_flavor_params_ids = xml_element.elements['requiredFlavorParamsIds'].text
			self.optional_thumb_dimensions = KalturaClientBase.object_from_xml(xml_element.elements['optionalThumbDimensions'], 'KalturaDistributionThumbDimensions')
			self.required_thumb_dimensions = KalturaClientBase.object_from_xml(xml_element.elements['requiredThumbDimensions'], 'KalturaDistributionThumbDimensions')
			self.editable_fields = xml_element.elements['editableFields'].text
			self.mandatory_fields = xml_element.elements['mandatoryFields'].text
		end

	end

	# Defines the condition to match a property and value on core asset object (or one if its inherited objects)
	class KalturaAssetDistributionPropertyCondition < KalturaAssetDistributionCondition
		# The property name to look for, this will match to a getter on the asset object.
		# 	 Should be camelCase naming convention (defining "myPropertyName" will look for getMyPropertyName())
		attr_accessor :property_name
		# The value to compare
		attr_accessor :property_value


		def from_xml(xml_element)
			super
			self.property_name = xml_element.elements['propertyName'].text
			self.property_value = xml_element.elements['propertyValue'].text
		end

	end

	class KalturaConfigurableDistributionJobProviderData < KalturaDistributionJobProviderData
		attr_accessor :field_values


		def from_xml(xml_element)
			super
			self.field_values = xml_element.elements['fieldValues'].text
		end

	end

	class KalturaConfigurableDistributionProfile < KalturaDistributionProfile
		attr_accessor :field_config_array
		attr_accessor :item_xpaths_to_extend
		# When checking custom XSLT conditions using the fieldConfigArray - address only categories associated with the entry via the categoryEntry object
		attr_accessor :use_category_entries

		def use_category_entries=(val)
			@use_category_entries = to_b(val)
		end

		def from_xml(xml_element)
			super
			self.field_config_array = KalturaClientBase.object_from_xml(xml_element.elements['fieldConfigArray'], 'KalturaDistributionFieldConfig')
			self.item_xpaths_to_extend = KalturaClientBase.object_from_xml(xml_element.elements['itemXpathsToExtend'], 'KalturaExtendingItemMrssParameter')
			self.use_category_entries = xml_element.elements['useCategoryEntries'].text
		end

	end

	class KalturaContentDistributionSearchItem < KalturaSearchItem
		attr_accessor :no_distribution_profiles
		attr_accessor :distribution_profile_id
		attr_accessor :distribution_sun_status
		attr_accessor :entry_distribution_flag
		attr_accessor :entry_distribution_status
		attr_accessor :has_entry_distribution_validation_errors
		# Comma seperated validation error types
		attr_accessor :entry_distribution_validation_errors

		def no_distribution_profiles=(val)
			@no_distribution_profiles = to_b(val)
		end
		def distribution_profile_id=(val)
			@distribution_profile_id = val.to_i
		end
		def distribution_sun_status=(val)
			@distribution_sun_status = val.to_i
		end
		def entry_distribution_flag=(val)
			@entry_distribution_flag = val.to_i
		end
		def entry_distribution_status=(val)
			@entry_distribution_status = val.to_i
		end
		def has_entry_distribution_validation_errors=(val)
			@has_entry_distribution_validation_errors = to_b(val)
		end

		def from_xml(xml_element)
			super
			self.no_distribution_profiles = xml_element.elements['noDistributionProfiles'].text
			self.distribution_profile_id = xml_element.elements['distributionProfileId'].text
			self.distribution_sun_status = xml_element.elements['distributionSunStatus'].text
			self.entry_distribution_flag = xml_element.elements['entryDistributionFlag'].text
			self.entry_distribution_status = xml_element.elements['entryDistributionStatus'].text
			self.has_entry_distribution_validation_errors = xml_element.elements['hasEntryDistributionValidationErrors'].text
			self.entry_distribution_validation_errors = xml_element.elements['entryDistributionValidationErrors'].text
		end

	end

	class KalturaDistributionJobData < KalturaJobData
		attr_accessor :distribution_profile_id
		attr_accessor :distribution_profile
		attr_accessor :entry_distribution_id
		attr_accessor :entry_distribution
		# Id of the media in the remote system
		attr_accessor :remote_id
		attr_accessor :provider_type
		# Additional data that relevant for the provider only
		attr_accessor :provider_data
		# The results as returned from the remote destination
		attr_accessor :results
		# The data as sent to the remote destination
		attr_accessor :sent_data
		# Stores array of media files that submitted to the destination site
		# 	 Could be used later for media update
		attr_accessor :media_files

		def distribution_profile_id=(val)
			@distribution_profile_id = val.to_i
		end
		def entry_distribution_id=(val)
			@entry_distribution_id = val.to_i
		end

		def from_xml(xml_element)
			super
			self.distribution_profile_id = xml_element.elements['distributionProfileId'].text
			self.distribution_profile = KalturaClientBase.object_from_xml(xml_element.elements['distributionProfile'], 'KalturaDistributionProfile')
			self.entry_distribution_id = xml_element.elements['entryDistributionId'].text
			self.entry_distribution = KalturaClientBase.object_from_xml(xml_element.elements['entryDistribution'], 'KalturaEntryDistribution')
			self.remote_id = xml_element.elements['remoteId'].text
			self.provider_type = xml_element.elements['providerType'].text
			self.provider_data = KalturaClientBase.object_from_xml(xml_element.elements['providerData'], 'KalturaDistributionJobProviderData')
			self.results = xml_element.elements['results'].text
			self.sent_data = xml_element.elements['sentData'].text
			self.media_files = KalturaClientBase.object_from_xml(xml_element.elements['mediaFiles'], 'KalturaDistributionRemoteMediaFile')
		end

	end

	class KalturaDistributionProfileBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :status_equal
		attr_accessor :status_in

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

		def from_xml(xml_element)
			super
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
		end

	end

	class KalturaDistributionProfileListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaDistributionProfile')
		end

	end

	class KalturaDistributionProviderBaseFilter < KalturaFilter
		attr_accessor :type_equal
		attr_accessor :type_in


		def from_xml(xml_element)
			super
			self.type_equal = xml_element.elements['typeEqual'].text
			self.type_in = xml_element.elements['typeIn'].text
		end

	end

	class KalturaDistributionProviderListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaDistributionProvider')
		end

	end

	class KalturaDistributionValidationErrorConditionNotMet < KalturaDistributionValidationError
		attr_accessor :condition_name


		def from_xml(xml_element)
			super
			self.condition_name = xml_element.elements['conditionName'].text
		end

	end

	class KalturaDistributionValidationErrorInvalidData < KalturaDistributionValidationError
		attr_accessor :field_name
		attr_accessor :validation_error_type
		# Parameter of the validation error
		# 	 For example, minimum value for KalturaDistributionValidationErrorType::STRING_TOO_SHORT validation error
		attr_accessor :validation_error_param

		def validation_error_type=(val)
			@validation_error_type = val.to_i
		end

		def from_xml(xml_element)
			super
			self.field_name = xml_element.elements['fieldName'].text
			self.validation_error_type = xml_element.elements['validationErrorType'].text
			self.validation_error_param = xml_element.elements['validationErrorParam'].text
		end

	end

	class KalturaDistributionValidationErrorMissingAsset < KalturaDistributionValidationError
		attr_accessor :data


		def from_xml(xml_element)
			super
			self.data = xml_element.elements['data'].text
		end

	end

	class KalturaDistributionValidationErrorMissingFlavor < KalturaDistributionValidationError
		attr_accessor :flavor_params_id


		def from_xml(xml_element)
			super
			self.flavor_params_id = xml_element.elements['flavorParamsId'].text
		end

	end

	class KalturaDistributionValidationErrorMissingMetadata < KalturaDistributionValidationError
		attr_accessor :field_name


		def from_xml(xml_element)
			super
			self.field_name = xml_element.elements['fieldName'].text
		end

	end

	class KalturaDistributionValidationErrorMissingThumbnail < KalturaDistributionValidationError
		attr_accessor :dimensions


		def from_xml(xml_element)
			super
			self.dimensions = KalturaClientBase.object_from_xml(xml_element.elements['dimensions'], 'KalturaDistributionThumbDimensions')
		end

	end

	class KalturaEntryDistributionListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaEntryDistribution')
		end

	end

	class KalturaGenericDistributionJobProviderData < KalturaDistributionJobProviderData
		attr_accessor :xml
		attr_accessor :result_parse_data
		attr_accessor :result_parser_type

		def result_parser_type=(val)
			@result_parser_type = val.to_i
		end

		def from_xml(xml_element)
			super
			self.xml = xml_element.elements['xml'].text
			self.result_parse_data = xml_element.elements['resultParseData'].text
			self.result_parser_type = xml_element.elements['resultParserType'].text
		end

	end

	class KalturaGenericDistributionProfile < KalturaDistributionProfile
		attr_accessor :generic_provider_id
		attr_accessor :submit_action
		attr_accessor :update_action
		attr_accessor :delete_action
		attr_accessor :fetch_report_action
		attr_accessor :update_required_entry_fields
		attr_accessor :update_required_metadata_xpaths

		def generic_provider_id=(val)
			@generic_provider_id = val.to_i
		end

		def from_xml(xml_element)
			super
			self.generic_provider_id = xml_element.elements['genericProviderId'].text
			self.submit_action = KalturaClientBase.object_from_xml(xml_element.elements['submitAction'], 'KalturaGenericDistributionProfileAction')
			self.update_action = KalturaClientBase.object_from_xml(xml_element.elements['updateAction'], 'KalturaGenericDistributionProfileAction')
			self.delete_action = KalturaClientBase.object_from_xml(xml_element.elements['deleteAction'], 'KalturaGenericDistributionProfileAction')
			self.fetch_report_action = KalturaClientBase.object_from_xml(xml_element.elements['fetchReportAction'], 'KalturaGenericDistributionProfileAction')
			self.update_required_entry_fields = xml_element.elements['updateRequiredEntryFields'].text
			self.update_required_metadata_xpaths = xml_element.elements['updateRequiredMetadataXPaths'].text
		end

	end

	class KalturaGenericDistributionProviderActionBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :generic_distribution_provider_id_equal
		attr_accessor :generic_distribution_provider_id_in
		attr_accessor :action_equal
		attr_accessor :action_in

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
		def generic_distribution_provider_id_equal=(val)
			@generic_distribution_provider_id_equal = val.to_i
		end
		def action_equal=(val)
			@action_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.generic_distribution_provider_id_equal = xml_element.elements['genericDistributionProviderIdEqual'].text
			self.generic_distribution_provider_id_in = xml_element.elements['genericDistributionProviderIdIn'].text
			self.action_equal = xml_element.elements['actionEqual'].text
			self.action_in = xml_element.elements['actionIn'].text
		end

	end

	class KalturaGenericDistributionProviderActionListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaGenericDistributionProviderAction')
		end

	end

	class KalturaGenericDistributionProviderListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaGenericDistributionProvider')
		end

	end

	class KalturaSyndicationDistributionProfile < KalturaDistributionProfile
		attr_accessor :xsl
		attr_accessor :feed_id


		def from_xml(xml_element)
			super
			self.xsl = xml_element.elements['xsl'].text
			self.feed_id = xml_element.elements['feedId'].text
		end

	end

	class KalturaSyndicationDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDistributionDeleteJobData < KalturaDistributionJobData
		# Flag signifying that the associated distribution item should not be moved to 'removed' status
		attr_accessor :keep_distribution_item

		def keep_distribution_item=(val)
			@keep_distribution_item = to_b(val)
		end

		def from_xml(xml_element)
			super
			self.keep_distribution_item = xml_element.elements['keepDistributionItem'].text
		end

	end

	class KalturaDistributionFetchReportJobData < KalturaDistributionJobData
		attr_accessor :plays
		attr_accessor :views

		def plays=(val)
			@plays = val.to_i
		end
		def views=(val)
			@views = val.to_i
		end

		def from_xml(xml_element)
			super
			self.plays = xml_element.elements['plays'].text
			self.views = xml_element.elements['views'].text
		end

	end

	class KalturaDistributionProfileFilter < KalturaDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDistributionProviderFilter < KalturaDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDistributionSubmitJobData < KalturaDistributionJobData


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDistributionUpdateJobData < KalturaDistributionJobData


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDistributionValidationErrorInvalidMetadata < KalturaDistributionValidationErrorInvalidData
		attr_accessor :metadata_profile_id

		def metadata_profile_id=(val)
			@metadata_profile_id = val.to_i
		end

		def from_xml(xml_element)
			super
			self.metadata_profile_id = xml_element.elements['metadataProfileId'].text
		end

	end

	class KalturaEntryDistributionBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :submitted_at_greater_than_or_equal
		attr_accessor :submitted_at_less_than_or_equal
		attr_accessor :entry_id_equal
		attr_accessor :entry_id_in
		attr_accessor :distribution_profile_id_equal
		attr_accessor :distribution_profile_id_in
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :dirty_status_equal
		attr_accessor :dirty_status_in
		attr_accessor :sunrise_greater_than_or_equal
		attr_accessor :sunrise_less_than_or_equal
		attr_accessor :sunset_greater_than_or_equal
		attr_accessor :sunset_less_than_or_equal

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
		def submitted_at_greater_than_or_equal=(val)
			@submitted_at_greater_than_or_equal = val.to_i
		end
		def submitted_at_less_than_or_equal=(val)
			@submitted_at_less_than_or_equal = val.to_i
		end
		def distribution_profile_id_equal=(val)
			@distribution_profile_id_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end
		def dirty_status_equal=(val)
			@dirty_status_equal = val.to_i
		end
		def sunrise_greater_than_or_equal=(val)
			@sunrise_greater_than_or_equal = val.to_i
		end
		def sunrise_less_than_or_equal=(val)
			@sunrise_less_than_or_equal = val.to_i
		end
		def sunset_greater_than_or_equal=(val)
			@sunset_greater_than_or_equal = val.to_i
		end
		def sunset_less_than_or_equal=(val)
			@sunset_less_than_or_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.submitted_at_greater_than_or_equal = xml_element.elements['submittedAtGreaterThanOrEqual'].text
			self.submitted_at_less_than_or_equal = xml_element.elements['submittedAtLessThanOrEqual'].text
			self.entry_id_equal = xml_element.elements['entryIdEqual'].text
			self.entry_id_in = xml_element.elements['entryIdIn'].text
			self.distribution_profile_id_equal = xml_element.elements['distributionProfileIdEqual'].text
			self.distribution_profile_id_in = xml_element.elements['distributionProfileIdIn'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.dirty_status_equal = xml_element.elements['dirtyStatusEqual'].text
			self.dirty_status_in = xml_element.elements['dirtyStatusIn'].text
			self.sunrise_greater_than_or_equal = xml_element.elements['sunriseGreaterThanOrEqual'].text
			self.sunrise_less_than_or_equal = xml_element.elements['sunriseLessThanOrEqual'].text
			self.sunset_greater_than_or_equal = xml_element.elements['sunsetGreaterThanOrEqual'].text
			self.sunset_less_than_or_equal = xml_element.elements['sunsetLessThanOrEqual'].text
		end

	end

	class KalturaGenericDistributionProviderActionFilter < KalturaGenericDistributionProviderActionBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaConfigurableDistributionProfileBaseFilter < KalturaDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDistributionDisableJobData < KalturaDistributionUpdateJobData


		def from_xml(xml_element)
			super
		end

	end

	class KalturaDistributionEnableJobData < KalturaDistributionUpdateJobData


		def from_xml(xml_element)
			super
		end

	end

	class KalturaEntryDistributionFilter < KalturaEntryDistributionBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaGenericDistributionProfileBaseFilter < KalturaDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaGenericDistributionProviderBaseFilter < KalturaDistributionProviderFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :is_default_equal
		attr_accessor :is_default_in
		attr_accessor :status_equal
		attr_accessor :status_in

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
		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
		end
		def is_default_equal=(val)
			@is_default_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			self.id_equal = xml_element.elements['idEqual'].text
			self.id_in = xml_element.elements['idIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			self.partner_id_in = xml_element.elements['partnerIdIn'].text
			self.is_default_equal = xml_element.elements['isDefaultEqual'].text
			self.is_default_in = xml_element.elements['isDefaultIn'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
		end

	end

	class KalturaSyndicationDistributionProfileBaseFilter < KalturaDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSyndicationDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaConfigurableDistributionProfileFilter < KalturaConfigurableDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaGenericDistributionProfileFilter < KalturaGenericDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaGenericDistributionProviderFilter < KalturaGenericDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSyndicationDistributionProfileFilter < KalturaSyndicationDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaSyndicationDistributionProviderFilter < KalturaSyndicationDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Distribution Profile service
	class KalturaDistributionProfileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new Distribution Profile
		# @return [KalturaDistributionProfile]
		def add(distribution_profile)
			kparams = {}
			client.add_param(kparams, 'distributionProfile', distribution_profile)
			client.queue_service_action_call('contentdistribution_distributionprofile', 'add', 'KalturaDistributionProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get Distribution Profile by id
		# @return [KalturaDistributionProfile]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('contentdistribution_distributionprofile', 'get', 'KalturaDistributionProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update Distribution Profile by id
		# @return [KalturaDistributionProfile]
		def update(id, distribution_profile)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'distributionProfile', distribution_profile)
			client.queue_service_action_call('contentdistribution_distributionprofile', 'update', 'KalturaDistributionProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update Distribution Profile status by id
		# @return [KalturaDistributionProfile]
		def update_status(id, status)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'status', status)
			client.queue_service_action_call('contentdistribution_distributionprofile', 'updateStatus', 'KalturaDistributionProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete Distribution Profile by id
		# @return []
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('contentdistribution_distributionprofile', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List all distribution providers
		# @return [KalturaDistributionProfileListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('contentdistribution_distributionprofile', 'list', 'KalturaDistributionProfileListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return [KalturaDistributionProfileListResponse]
		def list_by_partner(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('contentdistribution_distributionprofile', 'listByPartner', 'KalturaDistributionProfileListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Entry Distribution service
	class KalturaEntryDistributionService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new Entry Distribution
		# @return [KalturaEntryDistribution]
		def add(entry_distribution)
			kparams = {}
			client.add_param(kparams, 'entryDistribution', entry_distribution)
			client.queue_service_action_call('contentdistribution_entrydistribution', 'add', 'KalturaEntryDistribution', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get Entry Distribution by id
		# @return [KalturaEntryDistribution]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('contentdistribution_entrydistribution', 'get', 'KalturaEntryDistribution', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Validates Entry Distribution by id for submission
		# @return [KalturaEntryDistribution]
		def validate(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('contentdistribution_entrydistribution', 'validate', 'KalturaEntryDistribution', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update Entry Distribution by id
		# @return [KalturaEntryDistribution]
		def update(id, entry_distribution)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'entryDistribution', entry_distribution)
			client.queue_service_action_call('contentdistribution_entrydistribution', 'update', 'KalturaEntryDistribution', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete Entry Distribution by id
		# @return []
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('contentdistribution_entrydistribution', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List all distribution providers
		# @return [KalturaEntryDistributionListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('contentdistribution_entrydistribution', 'list', 'KalturaEntryDistributionListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Submits Entry Distribution to the remote destination
		# @return [KalturaEntryDistribution]
		def submit_add(id, submit_when_ready=false)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'submitWhenReady', submit_when_ready)
			client.queue_service_action_call('contentdistribution_entrydistribution', 'submitAdd', 'KalturaEntryDistribution', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Submits Entry Distribution changes to the remote destination
		# @return [KalturaEntryDistribution]
		def submit_update(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('contentdistribution_entrydistribution', 'submitUpdate', 'KalturaEntryDistribution', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Submits Entry Distribution report request
		# @return [KalturaEntryDistribution]
		def submit_fetch_report(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('contentdistribution_entrydistribution', 'submitFetchReport', 'KalturaEntryDistribution', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Deletes Entry Distribution from the remote destination
		# @return [KalturaEntryDistribution]
		def submit_delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('contentdistribution_entrydistribution', 'submitDelete', 'KalturaEntryDistribution', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retries last submit action
		# @return [KalturaEntryDistribution]
		def retry_submit(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('contentdistribution_entrydistribution', 'retrySubmit', 'KalturaEntryDistribution', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Serves entry distribution sent data
		# @return [file]
		def serve_sent_data(id, action_type)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'actionType', action_type)
			client.queue_service_action_call('contentdistribution_entrydistribution', 'serveSentData', 'file', kparams)
			return client.get_serve_url()
		end

		# Serves entry distribution returned data
		# @return [file]
		def serve_returned_data(id, action_type)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'actionType', action_type)
			client.queue_service_action_call('contentdistribution_entrydistribution', 'serveReturnedData', 'file', kparams)
			return client.get_serve_url()
		end
	end

	# Distribution Provider service
	class KalturaDistributionProviderService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# List all distribution providers
		# @return [KalturaDistributionProviderListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('contentdistribution_distributionprovider', 'list', 'KalturaDistributionProviderListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Generic Distribution Provider service
	class KalturaGenericDistributionProviderService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new Generic Distribution Provider
		# @return [KalturaGenericDistributionProvider]
		def add(generic_distribution_provider)
			kparams = {}
			client.add_param(kparams, 'genericDistributionProvider', generic_distribution_provider)
			client.queue_service_action_call('contentdistribution_genericdistributionprovider', 'add', 'KalturaGenericDistributionProvider', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get Generic Distribution Provider by id
		# @return [KalturaGenericDistributionProvider]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('contentdistribution_genericdistributionprovider', 'get', 'KalturaGenericDistributionProvider', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update Generic Distribution Provider by id
		# @return [KalturaGenericDistributionProvider]
		def update(id, generic_distribution_provider)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'genericDistributionProvider', generic_distribution_provider)
			client.queue_service_action_call('contentdistribution_genericdistributionprovider', 'update', 'KalturaGenericDistributionProvider', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete Generic Distribution Provider by id
		# @return []
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('contentdistribution_genericdistributionprovider', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List all distribution providers
		# @return [KalturaGenericDistributionProviderListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('contentdistribution_genericdistributionprovider', 'list', 'KalturaGenericDistributionProviderListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Generic Distribution Provider Actions service
	class KalturaGenericDistributionProviderActionService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new Generic Distribution Provider Action
		# @return [KalturaGenericDistributionProviderAction]
		def add(generic_distribution_provider_action)
			kparams = {}
			client.add_param(kparams, 'genericDistributionProviderAction', generic_distribution_provider_action)
			client.queue_service_action_call('contentdistribution_genericdistributionprovideraction', 'add', 'KalturaGenericDistributionProviderAction', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Add MRSS transform file to generic distribution provider action
		# @return [KalturaGenericDistributionProviderAction]
		def add_mrss_transform(id, xsl_data)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'xslData', xsl_data)
			client.queue_service_action_call('contentdistribution_genericdistributionprovideraction', 'addMrssTransform', 'KalturaGenericDistributionProviderAction', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Add MRSS transform file to generic distribution provider action
		# @return [KalturaGenericDistributionProviderAction]
		def add_mrss_transform_from_file(id, xsl_file)
			kparams = {}
			kfiles = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kfiles, 'xslFile', xsl_file)
			client.queue_service_action_call('contentdistribution_genericdistributionprovideraction', 'addMrssTransformFromFile', 'KalturaGenericDistributionProviderAction', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Add MRSS validate file to generic distribution provider action
		# @return [KalturaGenericDistributionProviderAction]
		def add_mrss_validate(id, xsd_data)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'xsdData', xsd_data)
			client.queue_service_action_call('contentdistribution_genericdistributionprovideraction', 'addMrssValidate', 'KalturaGenericDistributionProviderAction', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Add MRSS validate file to generic distribution provider action
		# @return [KalturaGenericDistributionProviderAction]
		def add_mrss_validate_from_file(id, xsd_file)
			kparams = {}
			kfiles = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kfiles, 'xsdFile', xsd_file)
			client.queue_service_action_call('contentdistribution_genericdistributionprovideraction', 'addMrssValidateFromFile', 'KalturaGenericDistributionProviderAction', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Add results transform file to generic distribution provider action
		# @return [KalturaGenericDistributionProviderAction]
		def add_results_transform(id, transform_data)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'transformData', transform_data)
			client.queue_service_action_call('contentdistribution_genericdistributionprovideraction', 'addResultsTransform', 'KalturaGenericDistributionProviderAction', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Add MRSS transform file to generic distribution provider action
		# @return [KalturaGenericDistributionProviderAction]
		def add_results_transform_from_file(id, transform_file)
			kparams = {}
			kfiles = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kfiles, 'transformFile', transform_file)
			client.queue_service_action_call('contentdistribution_genericdistributionprovideraction', 'addResultsTransformFromFile', 'KalturaGenericDistributionProviderAction', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get Generic Distribution Provider Action by id
		# @return [KalturaGenericDistributionProviderAction]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('contentdistribution_genericdistributionprovideraction', 'get', 'KalturaGenericDistributionProviderAction', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get Generic Distribution Provider Action by provider id
		# @return [KalturaGenericDistributionProviderAction]
		def get_by_provider_id(generic_distribution_provider_id, action_type)
			kparams = {}
			client.add_param(kparams, 'genericDistributionProviderId', generic_distribution_provider_id)
			client.add_param(kparams, 'actionType', action_type)
			client.queue_service_action_call('contentdistribution_genericdistributionprovideraction', 'getByProviderId', 'KalturaGenericDistributionProviderAction', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update Generic Distribution Provider Action by provider id
		# @return [KalturaGenericDistributionProviderAction]
		def update_by_provider_id(generic_distribution_provider_id, action_type, generic_distribution_provider_action)
			kparams = {}
			client.add_param(kparams, 'genericDistributionProviderId', generic_distribution_provider_id)
			client.add_param(kparams, 'actionType', action_type)
			client.add_param(kparams, 'genericDistributionProviderAction', generic_distribution_provider_action)
			client.queue_service_action_call('contentdistribution_genericdistributionprovideraction', 'updateByProviderId', 'KalturaGenericDistributionProviderAction', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update Generic Distribution Provider Action by id
		# @return [KalturaGenericDistributionProviderAction]
		def update(id, generic_distribution_provider_action)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'genericDistributionProviderAction', generic_distribution_provider_action)
			client.queue_service_action_call('contentdistribution_genericdistributionprovideraction', 'update', 'KalturaGenericDistributionProviderAction', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete Generic Distribution Provider Action by id
		# @return []
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('contentdistribution_genericdistributionprovideraction', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete Generic Distribution Provider Action by provider id
		# @return []
		def delete_by_provider_id(generic_distribution_provider_id, action_type)
			kparams = {}
			client.add_param(kparams, 'genericDistributionProviderId', generic_distribution_provider_id)
			client.add_param(kparams, 'actionType', action_type)
			client.queue_service_action_call('contentdistribution_genericdistributionprovideraction', 'deleteByProviderId', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List all distribution providers
		# @return [KalturaGenericDistributionProviderActionListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('contentdistribution_genericdistributionprovideraction', 'list', 'KalturaGenericDistributionProviderActionListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :distribution_profile_service
		def distribution_profile_service
			if (@distribution_profile_service == nil)
				@distribution_profile_service = KalturaDistributionProfileService.new(self)
			end
			return @distribution_profile_service
		end
		
		attr_reader :entry_distribution_service
		def entry_distribution_service
			if (@entry_distribution_service == nil)
				@entry_distribution_service = KalturaEntryDistributionService.new(self)
			end
			return @entry_distribution_service
		end
		
		attr_reader :distribution_provider_service
		def distribution_provider_service
			if (@distribution_provider_service == nil)
				@distribution_provider_service = KalturaDistributionProviderService.new(self)
			end
			return @distribution_provider_service
		end
		
		attr_reader :generic_distribution_provider_service
		def generic_distribution_provider_service
			if (@generic_distribution_provider_service == nil)
				@generic_distribution_provider_service = KalturaGenericDistributionProviderService.new(self)
			end
			return @generic_distribution_provider_service
		end
		
		attr_reader :generic_distribution_provider_action_service
		def generic_distribution_provider_action_service
			if (@generic_distribution_provider_action_service == nil)
				@generic_distribution_provider_action_service = KalturaGenericDistributionProviderActionService.new(self)
			end
			return @generic_distribution_provider_action_service
		end
		
	end

end
