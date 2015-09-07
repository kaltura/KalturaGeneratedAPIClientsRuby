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

	class KalturaMetadataProfileCreateMode
		API = 1
		KMC = 2
		APP = 3
	end

	class KalturaMetadataProfileStatus
		ACTIVE = 1
		DEPRECATED = 2
		TRANSFORMING = 3
	end

	class KalturaMetadataStatus
		VALID = 1
		INVALID = 2
		DELETED = 3
	end

	class KalturaMetadataObjectType
		AD_CUE_POINT = "adCuePointMetadata.AdCuePoint"
		ANNOTATION = "annotationMetadata.Annotation"
		CODE_CUE_POINT = "codeCuePointMetadata.CodeCuePoint"
		THUMB_CUE_POINT = "thumbCuePointMetadata.thumbCuePoint"
		ENTRY = "1"
		CATEGORY = "2"
		USER = "3"
		PARTNER = "4"
		DYNAMIC_OBJECT = "5"
	end

	class KalturaMetadataOrderBy
		CREATED_AT_ASC = "+createdAt"
		METADATA_PROFILE_VERSION_ASC = "+metadataProfileVersion"
		UPDATED_AT_ASC = "+updatedAt"
		VERSION_ASC = "+version"
		CREATED_AT_DESC = "-createdAt"
		METADATA_PROFILE_VERSION_DESC = "-metadataProfileVersion"
		UPDATED_AT_DESC = "-updatedAt"
		VERSION_DESC = "-version"
	end

	class KalturaMetadataProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaMetadata < KalturaObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :metadata_profile_id
		attr_accessor :metadata_profile_version
		attr_accessor :metadata_object_type
		attr_accessor :object_id
		attr_accessor :version
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :status
		attr_accessor :xml

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def metadata_profile_id=(val)
			@metadata_profile_id = val.to_i
		end
		def metadata_profile_version=(val)
			@metadata_profile_version = val.to_i
		end
		def version=(val)
			@version = val.to_i
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

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.metadata_profile_id = xml_element.elements['metadataProfileId'].text
			self.metadata_profile_version = xml_element.elements['metadataProfileVersion'].text
			self.metadata_object_type = xml_element.elements['metadataObjectType'].text
			self.object_id = xml_element.elements['objectId'].text
			self.version = xml_element.elements['version'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.status = xml_element.elements['status'].text
			self.xml = xml_element.elements['xml'].text
		end

	end

	class KalturaMetadataProfile < KalturaObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :metadata_object_type
		attr_accessor :version
		attr_accessor :name
		attr_accessor :system_name
		attr_accessor :description
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :status
		attr_accessor :xsd
		attr_accessor :views
		attr_accessor :xslt
		attr_accessor :create_mode
		attr_accessor :disable_re_indexing

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def version=(val)
			@version = val.to_i
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
		def create_mode=(val)
			@create_mode = val.to_i
		end
		def disable_re_indexing=(val)
			@disable_re_indexing = to_b(val)
		end

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.metadata_object_type = xml_element.elements['metadataObjectType'].text
			self.version = xml_element.elements['version'].text
			self.name = xml_element.elements['name'].text
			self.system_name = xml_element.elements['systemName'].text
			self.description = xml_element.elements['description'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.status = xml_element.elements['status'].text
			self.xsd = xml_element.elements['xsd'].text
			self.views = xml_element.elements['views'].text
			self.xslt = xml_element.elements['xslt'].text
			self.create_mode = xml_element.elements['createMode'].text
			self.disable_re_indexing = xml_element.elements['disableReIndexing'].text
		end

	end

	class KalturaMetadataProfileField < KalturaObjectBase
		attr_accessor :id
		attr_accessor :x_path
		attr_accessor :key
		attr_accessor :label

		def id=(val)
			@id = val.to_i
		end

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.x_path = xml_element.elements['xPath'].text
			self.key = xml_element.elements['key'].text
			self.label = xml_element.elements['label'].text
		end

	end

	class KalturaImportMetadataJobData < KalturaJobData
		attr_accessor :src_file_url
		attr_accessor :dest_file_local_path
		attr_accessor :metadata_id

		def metadata_id=(val)
			@metadata_id = val.to_i
		end

		def from_xml(xml_element)
			super
			self.src_file_url = xml_element.elements['srcFileUrl'].text
			self.dest_file_local_path = xml_element.elements['destFileLocalPath'].text
			self.metadata_id = xml_element.elements['metadataId'].text
		end

	end

	class KalturaMetadataListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaMetadata')
		end

	end

	class KalturaMetadataProfileBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :partner_id_equal
		attr_accessor :metadata_object_type_equal
		attr_accessor :metadata_object_type_in
		attr_accessor :version_equal
		attr_accessor :name_equal
		attr_accessor :system_name_equal
		attr_accessor :system_name_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :create_mode_equal
		attr_accessor :create_mode_not_equal
		attr_accessor :create_mode_in
		attr_accessor :create_mode_not_in

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
		end
		def version_equal=(val)
			@version_equal = val.to_i
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
		def create_mode_equal=(val)
			@create_mode_equal = val.to_i
		end
		def create_mode_not_equal=(val)
			@create_mode_not_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			self.id_equal = xml_element.elements['idEqual'].text
			self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			self.metadata_object_type_equal = xml_element.elements['metadataObjectTypeEqual'].text
			self.metadata_object_type_in = xml_element.elements['metadataObjectTypeIn'].text
			self.version_equal = xml_element.elements['versionEqual'].text
			self.name_equal = xml_element.elements['nameEqual'].text
			self.system_name_equal = xml_element.elements['systemNameEqual'].text
			self.system_name_in = xml_element.elements['systemNameIn'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.create_mode_equal = xml_element.elements['createModeEqual'].text
			self.create_mode_not_equal = xml_element.elements['createModeNotEqual'].text
			self.create_mode_in = xml_element.elements['createModeIn'].text
			self.create_mode_not_in = xml_element.elements['createModeNotIn'].text
		end

	end

	class KalturaMetadataProfileFieldListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaMetadataProfileField')
		end

	end

	class KalturaMetadataProfileListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaMetadataProfile')
		end

	end

	class KalturaMetadataResponseProfileMapping < KalturaResponseProfileMapping


		def from_xml(xml_element)
			super
		end

	end

	class KalturaTransformMetadataJobData < KalturaJobData
		attr_accessor :src_xsl_path
		attr_accessor :src_version
		attr_accessor :dest_version
		attr_accessor :dest_xsd_path
		attr_accessor :metadata_profile_id

		def src_version=(val)
			@src_version = val.to_i
		end
		def dest_version=(val)
			@dest_version = val.to_i
		end
		def metadata_profile_id=(val)
			@metadata_profile_id = val.to_i
		end

		def from_xml(xml_element)
			super
			self.src_xsl_path = xml_element.elements['srcXslPath'].text
			self.src_version = xml_element.elements['srcVersion'].text
			self.dest_version = xml_element.elements['destVersion'].text
			self.dest_xsd_path = xml_element.elements['destXsdPath'].text
			self.metadata_profile_id = xml_element.elements['metadataProfileId'].text
		end

	end

	class KalturaCompareMetadataCondition < KalturaCompareCondition
		# May contain the full xpath to the field in three formats
		# 	 1. Slashed xPath, e.g. /metadata/myElementName
		# 	 2. Using local-name function, e.g. /[local-name()='metadata']/[local-name()='myElementName']
		# 	 3. Using only the field name, e.g. myElementName, it will be searched as //myElementName
		# 	 
		attr_accessor :x_path
		# Metadata profile id
		# 	 
		attr_accessor :profile_id
		# Metadata profile system name
		# 	 
		attr_accessor :profile_system_name

		def profile_id=(val)
			@profile_id = val.to_i
		end

		def from_xml(xml_element)
			super
			self.x_path = xml_element.elements['xPath'].text
			self.profile_id = xml_element.elements['profileId'].text
			self.profile_system_name = xml_element.elements['profileSystemName'].text
		end

	end

	class KalturaDynamicObjectSearchItem < KalturaSearchOperator
		attr_accessor :field


		def from_xml(xml_element)
			super
			self.field = xml_element.elements['field'].text
		end

	end

	class KalturaMatchMetadataCondition < KalturaMatchCondition
		# May contain the full xpath to the field in three formats
		# 	 1. Slashed xPath, e.g. /metadata/myElementName
		# 	 2. Using local-name function, e.g. /[local-name()='metadata']/[local-name()='myElementName']
		# 	 3. Using only the field name, e.g. myElementName, it will be searched as //myElementName
		# 	 
		attr_accessor :x_path
		# Metadata profile id
		# 	 
		attr_accessor :profile_id
		# Metadata profile system name
		# 	 
		attr_accessor :profile_system_name

		def profile_id=(val)
			@profile_id = val.to_i
		end

		def from_xml(xml_element)
			super
			self.x_path = xml_element.elements['xPath'].text
			self.profile_id = xml_element.elements['profileId'].text
			self.profile_system_name = xml_element.elements['profileSystemName'].text
		end

	end

	class KalturaMetadataBaseFilter < KalturaRelatedFilter
		attr_accessor :partner_id_equal
		attr_accessor :metadata_profile_id_equal
		attr_accessor :metadata_profile_version_equal
		attr_accessor :metadata_profile_version_greater_than_or_equal
		attr_accessor :metadata_profile_version_less_than_or_equal
		# When null, default is KalturaMetadataObjectType::ENTRY
		# 	 
		attr_accessor :metadata_object_type_equal
		attr_accessor :object_id_equal
		attr_accessor :object_id_in
		attr_accessor :version_equal
		attr_accessor :version_greater_than_or_equal
		attr_accessor :version_less_than_or_equal
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :status_equal
		attr_accessor :status_in

		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
		end
		def metadata_profile_id_equal=(val)
			@metadata_profile_id_equal = val.to_i
		end
		def metadata_profile_version_equal=(val)
			@metadata_profile_version_equal = val.to_i
		end
		def metadata_profile_version_greater_than_or_equal=(val)
			@metadata_profile_version_greater_than_or_equal = val.to_i
		end
		def metadata_profile_version_less_than_or_equal=(val)
			@metadata_profile_version_less_than_or_equal = val.to_i
		end
		def version_equal=(val)
			@version_equal = val.to_i
		end
		def version_greater_than_or_equal=(val)
			@version_greater_than_or_equal = val.to_i
		end
		def version_less_than_or_equal=(val)
			@version_less_than_or_equal = val.to_i
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
			self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			self.metadata_profile_id_equal = xml_element.elements['metadataProfileIdEqual'].text
			self.metadata_profile_version_equal = xml_element.elements['metadataProfileVersionEqual'].text
			self.metadata_profile_version_greater_than_or_equal = xml_element.elements['metadataProfileVersionGreaterThanOrEqual'].text
			self.metadata_profile_version_less_than_or_equal = xml_element.elements['metadataProfileVersionLessThanOrEqual'].text
			self.metadata_object_type_equal = xml_element.elements['metadataObjectTypeEqual'].text
			self.object_id_equal = xml_element.elements['objectIdEqual'].text
			self.object_id_in = xml_element.elements['objectIdIn'].text
			self.version_equal = xml_element.elements['versionEqual'].text
			self.version_greater_than_or_equal = xml_element.elements['versionGreaterThanOrEqual'].text
			self.version_less_than_or_equal = xml_element.elements['versionLessThanOrEqual'].text
			self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
		end

	end

	class KalturaMetadataFieldChangedCondition < KalturaMatchCondition
		# May contain the full xpath to the field in three formats
		# 	 1. Slashed xPath, e.g. /metadata/myElementName
		# 	 2. Using local-name function, e.g. /[local-name()='metadata']/[local-name()='myElementName']
		# 	 3. Using only the field name, e.g. myElementName, it will be searched as //myElementName
		# 	 
		attr_accessor :x_path
		# Metadata profile id
		# 	 
		attr_accessor :profile_id
		# Metadata profile system name
		# 	 
		attr_accessor :profile_system_name
		attr_accessor :version_a
		attr_accessor :version_b

		def profile_id=(val)
			@profile_id = val.to_i
		end

		def from_xml(xml_element)
			super
			self.x_path = xml_element.elements['xPath'].text
			self.profile_id = xml_element.elements['profileId'].text
			self.profile_system_name = xml_element.elements['profileSystemName'].text
			self.version_a = xml_element.elements['versionA'].text
			self.version_b = xml_element.elements['versionB'].text
		end

	end

	class KalturaMetadataProfileFilter < KalturaMetadataProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMetadataSearchItem < KalturaSearchOperator
		attr_accessor :metadata_profile_id
		attr_accessor :order_by

		def metadata_profile_id=(val)
			@metadata_profile_id = val.to_i
		end

		def from_xml(xml_element)
			super
			self.metadata_profile_id = xml_element.elements['metadataProfileId'].text
			self.order_by = xml_element.elements['orderBy'].text
		end

	end

	class KalturaMetadataFilter < KalturaMetadataBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Metadata service
	#  
	class KalturaMetadataService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Allows you to add a metadata object and metadata content associated with Kaltura object
		# 	 
		def add(metadata_profile_id, object_type, object_id, xml_data)
			kparams = {}
			client.add_param(kparams, 'metadataProfileId', metadata_profile_id)
			client.add_param(kparams, 'objectType', object_type)
			client.add_param(kparams, 'objectId', object_id)
			client.add_param(kparams, 'xmlData', xml_data)
			client.queue_service_action_call('metadata_metadata', 'add', 'KalturaMetadata', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Allows you to add a metadata object and metadata file associated with Kaltura object
		# 	 
		def add_from_file(metadata_profile_id, object_type, object_id, xml_file)
			kparams = {}
			kfiles = {}
			client.add_param(kparams, 'metadataProfileId', metadata_profile_id)
			client.add_param(kparams, 'objectType', object_type)
			client.add_param(kparams, 'objectId', object_id)
			client.add_param(kfiles, 'xmlFile', xml_file)
			client.queue_service_action_call('metadata_metadata', 'addFromFile', 'KalturaMetadata', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Allows you to add a metadata xml data from remote URL
		# 	 
		def add_from_url(metadata_profile_id, object_type, object_id, url)
			kparams = {}
			client.add_param(kparams, 'metadataProfileId', metadata_profile_id)
			client.add_param(kparams, 'objectType', object_type)
			client.add_param(kparams, 'objectId', object_id)
			client.add_param(kparams, 'url', url)
			client.queue_service_action_call('metadata_metadata', 'addFromUrl', 'KalturaMetadata', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Allows you to add a metadata xml data from remote URL.
		# 	 Enables different permissions than addFromUrl action.
		# 	 
		def add_from_bulk(metadata_profile_id, object_type, object_id, url)
			kparams = {}
			client.add_param(kparams, 'metadataProfileId', metadata_profile_id)
			client.add_param(kparams, 'objectType', object_type)
			client.add_param(kparams, 'objectId', object_id)
			client.add_param(kparams, 'url', url)
			client.queue_service_action_call('metadata_metadata', 'addFromBulk', 'KalturaMetadata', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a metadata object by id
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('metadata_metadata', 'get', 'KalturaMetadata', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing metadata object with new XML content
		# 	 
		def update(id, xml_data=KalturaNotImplemented, version=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'xmlData', xml_data)
			client.add_param(kparams, 'version', version)
			client.queue_service_action_call('metadata_metadata', 'update', 'KalturaMetadata', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing metadata object with new XML file
		# 	 
		def update_from_file(id, xml_file=KalturaNotImplemented)
			kparams = {}
			kfiles = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kfiles, 'xmlFile', xml_file)
			client.queue_service_action_call('metadata_metadata', 'updateFromFile', 'KalturaMetadata', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List metadata objects by filter and pager
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('metadata_metadata', 'list', 'KalturaMetadataListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete an existing metadata
		# 	 
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('metadata_metadata', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Mark existing metadata as invalid
		# 	 Used by batch metadata transform
		# 	 
		def invalidate(id, version=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'version', version)
			client.queue_service_action_call('metadata_metadata', 'invalidate', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Index metadata by id, will also index the related object
		# 	 
		def index(id, should_update)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'shouldUpdate', should_update)
			client.queue_service_action_call('metadata_metadata', 'index', 'int', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Serves metadata XML file
		# 	 
		def serve(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('metadata_metadata', 'serve', 'file', kparams)
			return client.get_serve_url()
		end

		# Action transforms current metadata object XML using a provided XSL.
		# 	 
		def update_from_xsl(id, xsl_file)
			kparams = {}
			kfiles = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kfiles, 'xslFile', xsl_file)
			client.queue_service_action_call('metadata_metadata', 'updateFromXSL', 'KalturaMetadata', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Metadata Profile service
	#  
	class KalturaMetadataProfileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Allows you to add a metadata profile object and metadata profile content associated with Kaltura object type
		# 	 
		def add(metadata_profile, xsd_data, views_data=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'metadataProfile', metadata_profile)
			client.add_param(kparams, 'xsdData', xsd_data)
			client.add_param(kparams, 'viewsData', views_data)
			client.queue_service_action_call('metadata_metadataprofile', 'add', 'KalturaMetadataProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Allows you to add a metadata profile object and metadata profile file associated with Kaltura object type
		# 	 
		def add_from_file(metadata_profile, xsd_file, views_file=KalturaNotImplemented)
			kparams = {}
			kfiles = {}
			client.add_param(kparams, 'metadataProfile', metadata_profile)
			client.add_param(kfiles, 'xsdFile', xsd_file)
			client.add_param(kfiles, 'viewsFile', views_file)
			client.queue_service_action_call('metadata_metadataprofile', 'addFromFile', 'KalturaMetadataProfile', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a metadata profile object by id
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('metadata_metadataprofile', 'get', 'KalturaMetadataProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing metadata object
		# 	 
		def update(id, metadata_profile, xsd_data=KalturaNotImplemented, views_data=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'metadataProfile', metadata_profile)
			client.add_param(kparams, 'xsdData', xsd_data)
			client.add_param(kparams, 'viewsData', views_data)
			client.queue_service_action_call('metadata_metadataprofile', 'update', 'KalturaMetadataProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List metadata profile objects by filter and pager
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('metadata_metadataprofile', 'list', 'KalturaMetadataProfileListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List metadata profile fields by metadata profile id
		# 	 
		def list_fields(metadata_profile_id)
			kparams = {}
			client.add_param(kparams, 'metadataProfileId', metadata_profile_id)
			client.queue_service_action_call('metadata_metadataprofile', 'listFields', 'KalturaMetadataProfileFieldListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete an existing metadata profile
		# 	 
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('metadata_metadataprofile', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing metadata object definition file
		# 	 
		def revert(id, to_version)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'toVersion', to_version)
			client.queue_service_action_call('metadata_metadataprofile', 'revert', 'KalturaMetadataProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing metadata object definition file
		# 	 
		def update_definition_from_file(id, xsd_file)
			kparams = {}
			kfiles = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kfiles, 'xsdFile', xsd_file)
			client.queue_service_action_call('metadata_metadataprofile', 'updateDefinitionFromFile', 'KalturaMetadataProfile', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing metadata object views file
		# 	 
		def update_views_from_file(id, views_file)
			kparams = {}
			kfiles = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kfiles, 'viewsFile', views_file)
			client.queue_service_action_call('metadata_metadataprofile', 'updateViewsFromFile', 'KalturaMetadataProfile', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing metadata object xslt file
		# 	 
		def update_transformation_from_file(id, xslt_file)
			kparams = {}
			kfiles = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kfiles, 'xsltFile', xslt_file)
			client.queue_service_action_call('metadata_metadataprofile', 'updateTransformationFromFile', 'KalturaMetadataProfile', kparams, kfiles)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Serves metadata profile XSD file
		# 	 
		def serve(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('metadata_metadataprofile', 'serve', 'file', kparams)
			return client.get_serve_url()
		end

		# Serves metadata profile view file
		# 	 
		def serve_view(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('metadata_metadataprofile', 'serveView', 'file', kparams)
			return client.get_serve_url()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :metadata_service
		def metadata_service
			if (@metadata_service == nil)
				@metadata_service = KalturaMetadataService.new(self)
			end
			return @metadata_service
		end
		
		attr_reader :metadata_profile_service
		def metadata_profile_service
			if (@metadata_profile_service == nil)
				@metadata_profile_service = KalturaMetadataProfileService.new(self)
			end
			return @metadata_profile_service
		end
		
	end

end
