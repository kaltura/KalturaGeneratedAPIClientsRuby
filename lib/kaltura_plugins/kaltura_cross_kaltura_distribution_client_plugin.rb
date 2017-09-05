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
require File.dirname(__FILE__) + '/kaltura_content_distribution_client_plugin.rb'

module Kaltura

	class KalturaCrossKalturaDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaCrossKalturaDistributionProviderOrderBy
	end

	class KalturaCrossKalturaDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaCrossKalturaDistributionJobProviderData < KalturaConfigurableDistributionJobProviderData
		# Key-value array where the keys are IDs of distributed flavor assets in the source account and the values are the matching IDs in the target account
		attr_accessor :distributed_flavor_assets
		# Key-value array where the keys are IDs of distributed thumb assets in the source account and the values are the matching IDs in the target account
		attr_accessor :distributed_thumb_assets
		# Key-value array where the keys are IDs of distributed metadata objects in the source account and the values are the matching IDs in the target account
		attr_accessor :distributed_metadata
		# Key-value array where the keys are IDs of distributed caption assets in the source account and the values are the matching IDs in the target account
		attr_accessor :distributed_caption_assets
		# Key-value array where the keys are IDs of distributed cue points in the source account and the values are the matching IDs in the target account
		attr_accessor :distributed_cue_points
		# Key-value array where the keys are IDs of distributed thumb cue points in the source account and the values are the matching IDs in the target account
		attr_accessor :distributed_thumb_cue_points
		# Key-value array where the keys are IDs of distributed timed thumb assets in the source account and the values are the matching IDs in the target account
		attr_accessor :distributed_timed_thumb_assets


		def from_xml(xml_element)
			super
			if xml_element.elements['distributedFlavorAssets'] != nil
				self.distributed_flavor_assets = xml_element.elements['distributedFlavorAssets'].text
			end
			if xml_element.elements['distributedThumbAssets'] != nil
				self.distributed_thumb_assets = xml_element.elements['distributedThumbAssets'].text
			end
			if xml_element.elements['distributedMetadata'] != nil
				self.distributed_metadata = xml_element.elements['distributedMetadata'].text
			end
			if xml_element.elements['distributedCaptionAssets'] != nil
				self.distributed_caption_assets = xml_element.elements['distributedCaptionAssets'].text
			end
			if xml_element.elements['distributedCuePoints'] != nil
				self.distributed_cue_points = xml_element.elements['distributedCuePoints'].text
			end
			if xml_element.elements['distributedThumbCuePoints'] != nil
				self.distributed_thumb_cue_points = xml_element.elements['distributedThumbCuePoints'].text
			end
			if xml_element.elements['distributedTimedThumbAssets'] != nil
				self.distributed_timed_thumb_assets = xml_element.elements['distributedTimedThumbAssets'].text
			end
		end

	end

	class KalturaCrossKalturaDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :target_service_url
		attr_accessor :target_account_id
		attr_accessor :target_login_id
		attr_accessor :target_login_password
		attr_accessor :metadata_xslt
		attr_accessor :metadata_xpaths_trigger_update
		attr_accessor :distribute_captions
		attr_accessor :distribute_cue_points
		attr_accessor :distribute_remote_flavor_asset_content
		attr_accessor :distribute_remote_thumb_asset_content
		attr_accessor :distribute_remote_caption_asset_content
		attr_accessor :map_access_control_profile_ids
		attr_accessor :map_conversion_profile_ids
		attr_accessor :map_metadata_profile_ids
		attr_accessor :map_storage_profile_ids
		attr_accessor :map_flavor_params_ids
		attr_accessor :map_thumb_params_ids
		attr_accessor :map_caption_params_ids

		def target_account_id=(val)
			@target_account_id = val.to_i
		end
		def distribute_captions=(val)
			@distribute_captions = to_b(val)
		end
		def distribute_cue_points=(val)
			@distribute_cue_points = to_b(val)
		end
		def distribute_remote_flavor_asset_content=(val)
			@distribute_remote_flavor_asset_content = to_b(val)
		end
		def distribute_remote_thumb_asset_content=(val)
			@distribute_remote_thumb_asset_content = to_b(val)
		end
		def distribute_remote_caption_asset_content=(val)
			@distribute_remote_caption_asset_content = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['targetServiceUrl'] != nil
				self.target_service_url = xml_element.elements['targetServiceUrl'].text
			end
			if xml_element.elements['targetAccountId'] != nil
				self.target_account_id = xml_element.elements['targetAccountId'].text
			end
			if xml_element.elements['targetLoginId'] != nil
				self.target_login_id = xml_element.elements['targetLoginId'].text
			end
			if xml_element.elements['targetLoginPassword'] != nil
				self.target_login_password = xml_element.elements['targetLoginPassword'].text
			end
			if xml_element.elements['metadataXslt'] != nil
				self.metadata_xslt = xml_element.elements['metadataXslt'].text
			end
			if xml_element.elements['metadataXpathsTriggerUpdate'] != nil
				self.metadata_xpaths_trigger_update = KalturaClientBase.object_from_xml(xml_element.elements['metadataXpathsTriggerUpdate'], 'KalturaStringValue')
			end
			if xml_element.elements['distributeCaptions'] != nil
				self.distribute_captions = xml_element.elements['distributeCaptions'].text
			end
			if xml_element.elements['distributeCuePoints'] != nil
				self.distribute_cue_points = xml_element.elements['distributeCuePoints'].text
			end
			if xml_element.elements['distributeRemoteFlavorAssetContent'] != nil
				self.distribute_remote_flavor_asset_content = xml_element.elements['distributeRemoteFlavorAssetContent'].text
			end
			if xml_element.elements['distributeRemoteThumbAssetContent'] != nil
				self.distribute_remote_thumb_asset_content = xml_element.elements['distributeRemoteThumbAssetContent'].text
			end
			if xml_element.elements['distributeRemoteCaptionAssetContent'] != nil
				self.distribute_remote_caption_asset_content = xml_element.elements['distributeRemoteCaptionAssetContent'].text
			end
			if xml_element.elements['mapAccessControlProfileIds'] != nil
				self.map_access_control_profile_ids = KalturaClientBase.object_from_xml(xml_element.elements['mapAccessControlProfileIds'], 'KalturaKeyValue')
			end
			if xml_element.elements['mapConversionProfileIds'] != nil
				self.map_conversion_profile_ids = KalturaClientBase.object_from_xml(xml_element.elements['mapConversionProfileIds'], 'KalturaKeyValue')
			end
			if xml_element.elements['mapMetadataProfileIds'] != nil
				self.map_metadata_profile_ids = KalturaClientBase.object_from_xml(xml_element.elements['mapMetadataProfileIds'], 'KalturaKeyValue')
			end
			if xml_element.elements['mapStorageProfileIds'] != nil
				self.map_storage_profile_ids = KalturaClientBase.object_from_xml(xml_element.elements['mapStorageProfileIds'], 'KalturaKeyValue')
			end
			if xml_element.elements['mapFlavorParamsIds'] != nil
				self.map_flavor_params_ids = KalturaClientBase.object_from_xml(xml_element.elements['mapFlavorParamsIds'], 'KalturaKeyValue')
			end
			if xml_element.elements['mapThumbParamsIds'] != nil
				self.map_thumb_params_ids = KalturaClientBase.object_from_xml(xml_element.elements['mapThumbParamsIds'], 'KalturaKeyValue')
			end
			if xml_element.elements['mapCaptionParamsIds'] != nil
				self.map_caption_params_ids = KalturaClientBase.object_from_xml(xml_element.elements['mapCaptionParamsIds'], 'KalturaKeyValue')
			end
		end

	end

	class KalturaCrossKalturaDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaCrossKalturaDistributionProviderFilter < KalturaCrossKalturaDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaCrossKalturaDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaCrossKalturaDistributionProfileFilter < KalturaCrossKalturaDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
