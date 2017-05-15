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

	class KalturaUnicornDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaUnicornDistributionProviderOrderBy
	end

	class KalturaUnicornDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUnicornDistributionJobProviderData < KalturaConfigurableDistributionJobProviderData
		# The Catalog GUID the video is in or will be ingested into.
		attr_accessor :catalog_guid
		# The Title assigned to the video. The Foreign Key will be used if no title is provided.
		attr_accessor :title
		# Indicates that the media content changed and therefore the job should wait for HTTP callback notification to be closed.
		attr_accessor :media_changed
		# Flavor asset version.
		attr_accessor :flavor_asset_version
		# The schema and host name to the Kaltura server, e.g. http://www.kaltura.com
		attr_accessor :notification_base_url

		def media_changed=(val)
			@media_changed = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['catalogGuid'] != nil
				self.catalog_guid = xml_element.elements['catalogGuid'].text
			end
			if xml_element.elements['title'] != nil
				self.title = xml_element.elements['title'].text
			end
			if xml_element.elements['mediaChanged'] != nil
				self.media_changed = xml_element.elements['mediaChanged'].text
			end
			if xml_element.elements['flavorAssetVersion'] != nil
				self.flavor_asset_version = xml_element.elements['flavorAssetVersion'].text
			end
			if xml_element.elements['notificationBaseUrl'] != nil
				self.notification_base_url = xml_element.elements['notificationBaseUrl'].text
			end
		end

	end

	class KalturaUnicornDistributionProfile < KalturaConfigurableDistributionProfile
		# The email address associated with the Upload User, used to authorize the incoming request.
		attr_accessor :username
		# The password used in association with the email to determine if the Upload User is authorized the incoming request.
		attr_accessor :password
		# The name of the Domain that the Upload User should have access to, Used for authentication.
		attr_accessor :domain_name
		# The Channel GUID assigned to this Publication Rule. Must be a valid Channel in the Domain that was used in authentication.
		attr_accessor :channel_guid
		# The API host URL that the Upload User should have access to, Used for HTTP content submission.
		attr_accessor :api_host_url
		# The GUID of the Customer Domain in the Unicorn system obtained by contacting your Unicorn representative.
		attr_accessor :domain_guid
		# The GUID for the application in which to record metrics and enforce business rules obtained through your Unicorn representative.
		attr_accessor :ad_free_application_guid
		# The flavor-params that will be used for the remote asset.
		attr_accessor :remote_asset_params_id
		# The remote storage that should be used for the remote asset.
		attr_accessor :storage_profile_id

		def remote_asset_params_id=(val)
			@remote_asset_params_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['username'] != nil
				self.username = xml_element.elements['username'].text
			end
			if xml_element.elements['password'] != nil
				self.password = xml_element.elements['password'].text
			end
			if xml_element.elements['domainName'] != nil
				self.domain_name = xml_element.elements['domainName'].text
			end
			if xml_element.elements['channelGuid'] != nil
				self.channel_guid = xml_element.elements['channelGuid'].text
			end
			if xml_element.elements['apiHostUrl'] != nil
				self.api_host_url = xml_element.elements['apiHostUrl'].text
			end
			if xml_element.elements['domainGuid'] != nil
				self.domain_guid = xml_element.elements['domainGuid'].text
			end
			if xml_element.elements['adFreeApplicationGuid'] != nil
				self.ad_free_application_guid = xml_element.elements['adFreeApplicationGuid'].text
			end
			if xml_element.elements['remoteAssetParamsId'] != nil
				self.remote_asset_params_id = xml_element.elements['remoteAssetParamsId'].text
			end
			if xml_element.elements['storageProfileId'] != nil
				self.storage_profile_id = xml_element.elements['storageProfileId'].text
			end
		end

	end

	class KalturaUnicornDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUnicornDistributionProviderFilter < KalturaUnicornDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUnicornDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUnicornDistributionProfileFilter < KalturaUnicornDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Unicorn Service
	class KalturaUnicornService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# @return []
		def notify(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('unicorndistribution_unicorn', 'notify', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :unicorn_service
		def unicorn_service
			if (@unicorn_service == nil)
				@unicorn_service = KalturaUnicornService.new(self)
			end
			return @unicorn_service
		end
		
	end

end
