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

	class KalturaMsnDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaMsnDistributionProviderOrderBy
	end

	class KalturaMsnDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMsnDistributionJobProviderData < KalturaConfigurableDistributionJobProviderData
		attr_accessor :xml


		def from_xml(xml_element)
			super
			if xml_element.elements['xml'] != nil
				self.xml = xml_element.elements['xml'].text
			end
		end

	end

	class KalturaMsnDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :username
		attr_accessor :password
		attr_accessor :domain
		attr_accessor :cs_id
		attr_accessor :source
		attr_accessor :source_friendly_name
		attr_accessor :page_group
		attr_accessor :source_flavor_params_id
		attr_accessor :wmv_flavor_params_id
		attr_accessor :flv_flavor_params_id
		attr_accessor :sl_flavor_params_id
		attr_accessor :sl_hd_flavor_params_id
		attr_accessor :msnvideo_cat
		attr_accessor :msnvideo_top
		attr_accessor :msnvideo_top_cat

		def source_flavor_params_id=(val)
			@source_flavor_params_id = val.to_i
		end
		def wmv_flavor_params_id=(val)
			@wmv_flavor_params_id = val.to_i
		end
		def flv_flavor_params_id=(val)
			@flv_flavor_params_id = val.to_i
		end
		def sl_flavor_params_id=(val)
			@sl_flavor_params_id = val.to_i
		end
		def sl_hd_flavor_params_id=(val)
			@sl_hd_flavor_params_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['username'] != nil
				self.username = xml_element.elements['username'].text
			end
			if xml_element.elements['password'] != nil
				self.password = xml_element.elements['password'].text
			end
			if xml_element.elements['domain'] != nil
				self.domain = xml_element.elements['domain'].text
			end
			if xml_element.elements['csId'] != nil
				self.cs_id = xml_element.elements['csId'].text
			end
			if xml_element.elements['source'] != nil
				self.source = xml_element.elements['source'].text
			end
			if xml_element.elements['sourceFriendlyName'] != nil
				self.source_friendly_name = xml_element.elements['sourceFriendlyName'].text
			end
			if xml_element.elements['pageGroup'] != nil
				self.page_group = xml_element.elements['pageGroup'].text
			end
			if xml_element.elements['sourceFlavorParamsId'] != nil
				self.source_flavor_params_id = xml_element.elements['sourceFlavorParamsId'].text
			end
			if xml_element.elements['wmvFlavorParamsId'] != nil
				self.wmv_flavor_params_id = xml_element.elements['wmvFlavorParamsId'].text
			end
			if xml_element.elements['flvFlavorParamsId'] != nil
				self.flv_flavor_params_id = xml_element.elements['flvFlavorParamsId'].text
			end
			if xml_element.elements['slFlavorParamsId'] != nil
				self.sl_flavor_params_id = xml_element.elements['slFlavorParamsId'].text
			end
			if xml_element.elements['slHdFlavorParamsId'] != nil
				self.sl_hd_flavor_params_id = xml_element.elements['slHdFlavorParamsId'].text
			end
			if xml_element.elements['msnvideoCat'] != nil
				self.msnvideo_cat = xml_element.elements['msnvideoCat'].text
			end
			if xml_element.elements['msnvideoTop'] != nil
				self.msnvideo_top = xml_element.elements['msnvideoTop'].text
			end
			if xml_element.elements['msnvideoTopCat'] != nil
				self.msnvideo_top_cat = xml_element.elements['msnvideoTopCat'].text
			end
		end

	end

	class KalturaMsnDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMsnDistributionProviderFilter < KalturaMsnDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMsnDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaMsnDistributionProfileFilter < KalturaMsnDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
