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
require File.dirname(__FILE__) + '/kaltura_drm_client_plugin.rb'

module Kaltura

	class KalturaWidevineRepositorySyncMode
		MODIFY = 0
	end

	class KalturaWidevineFlavorAssetOrderBy
		CREATED_AT_ASC = "+createdAt"
		DELETED_AT_ASC = "+deletedAt"
		SIZE_ASC = "+size"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		DELETED_AT_DESC = "-deletedAt"
		SIZE_DESC = "-size"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaWidevineFlavorParamsOrderBy
	end

	class KalturaWidevineFlavorParamsOutputOrderBy
	end

	class KalturaWidevineProfileOrderBy
		ID_ASC = "+id"
		NAME_ASC = "+name"
		ID_DESC = "-id"
		NAME_DESC = "-name"
	end

	class KalturaWidevineProfile < KalturaDrmProfile
		attr_accessor :key
		attr_accessor :iv
		attr_accessor :owner
		attr_accessor :portal
		attr_accessor :max_gop
		attr_accessor :reg_server_host

		def max_gop=(val)
			@max_gop = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['key'] != nil
				self.key = xml_element.elements['key'].text
			end
			if xml_element.elements['iv'] != nil
				self.iv = xml_element.elements['iv'].text
			end
			if xml_element.elements['owner'] != nil
				self.owner = xml_element.elements['owner'].text
			end
			if xml_element.elements['portal'] != nil
				self.portal = xml_element.elements['portal'].text
			end
			if xml_element.elements['maxGop'] != nil
				self.max_gop = xml_element.elements['maxGop'].text
			end
			if xml_element.elements['regServerHost'] != nil
				self.reg_server_host = xml_element.elements['regServerHost'].text
			end
		end

	end

	class KalturaWidevineRepositorySyncJobData < KalturaJobData
		attr_accessor :sync_mode
		attr_accessor :wv_asset_ids
		attr_accessor :modified_attributes
		attr_accessor :monitor_sync_completion

		def sync_mode=(val)
			@sync_mode = val.to_i
		end
		def monitor_sync_completion=(val)
			@monitor_sync_completion = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['syncMode'] != nil
				self.sync_mode = xml_element.elements['syncMode'].text
			end
			if xml_element.elements['wvAssetIds'] != nil
				self.wv_asset_ids = xml_element.elements['wvAssetIds'].text
			end
			if xml_element.elements['modifiedAttributes'] != nil
				self.modified_attributes = xml_element.elements['modifiedAttributes'].text
			end
			if xml_element.elements['monitorSyncCompletion'] != nil
				self.monitor_sync_completion = xml_element.elements['monitorSyncCompletion'].text
			end
		end

	end

	class KalturaWidevineFlavorAsset < KalturaFlavorAsset
		# License distribution window start date
		attr_accessor :widevine_distribution_start_date
		# License distribution window end date
		attr_accessor :widevine_distribution_end_date
		# Widevine unique asset id
		attr_accessor :widevine_asset_id

		def widevine_distribution_start_date=(val)
			@widevine_distribution_start_date = val.to_i
		end
		def widevine_distribution_end_date=(val)
			@widevine_distribution_end_date = val.to_i
		end
		def widevine_asset_id=(val)
			@widevine_asset_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['widevineDistributionStartDate'] != nil
				self.widevine_distribution_start_date = xml_element.elements['widevineDistributionStartDate'].text
			end
			if xml_element.elements['widevineDistributionEndDate'] != nil
				self.widevine_distribution_end_date = xml_element.elements['widevineDistributionEndDate'].text
			end
			if xml_element.elements['widevineAssetId'] != nil
				self.widevine_asset_id = xml_element.elements['widevineAssetId'].text
			end
		end

	end

	class KalturaWidevineFlavorParams < KalturaFlavorParams


		def from_xml(xml_element)
			super
		end

	end

	class KalturaWidevineFlavorParamsOutput < KalturaFlavorParamsOutput
		# License distribution window start date
		attr_accessor :widevine_distribution_start_date
		# License distribution window end date
		attr_accessor :widevine_distribution_end_date

		def widevine_distribution_start_date=(val)
			@widevine_distribution_start_date = val.to_i
		end
		def widevine_distribution_end_date=(val)
			@widevine_distribution_end_date = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['widevineDistributionStartDate'] != nil
				self.widevine_distribution_start_date = xml_element.elements['widevineDistributionStartDate'].text
			end
			if xml_element.elements['widevineDistributionEndDate'] != nil
				self.widevine_distribution_end_date = xml_element.elements['widevineDistributionEndDate'].text
			end
		end

	end

	class KalturaWidevineProfileBaseFilter < KalturaDrmProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaWidevineProfileFilter < KalturaWidevineProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaWidevineFlavorAssetBaseFilter < KalturaFlavorAssetFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaWidevineFlavorParamsBaseFilter < KalturaFlavorParamsFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaWidevineFlavorAssetFilter < KalturaWidevineFlavorAssetBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaWidevineFlavorParamsFilter < KalturaWidevineFlavorParamsBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaWidevineFlavorParamsOutputBaseFilter < KalturaFlavorParamsOutputFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaWidevineFlavorParamsOutputFilter < KalturaWidevineFlavorParamsOutputBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# WidevineDrmService serves as a license proxy to a Widevine license server
	class KalturaWidevineDrmService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Get license for encrypted content playback
		# @return [string]
		def get_license(flavor_asset_id, referrer=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'flavorAssetId', flavor_asset_id)
			client.add_param(kparams, 'referrer', referrer)
			client.queue_service_action_call('widevine_widevinedrm', 'getLicense', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :widevine_drm_service
		def widevine_drm_service
			if (@widevine_drm_service == nil)
				@widevine_drm_service = KalturaWidevineDrmService.new(self)
			end
			return @widevine_drm_service
		end
		
	end

end
