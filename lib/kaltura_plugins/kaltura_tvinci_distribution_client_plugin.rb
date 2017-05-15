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

	class KalturaTvinciDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaTvinciDistributionProviderOrderBy
	end

	class KalturaTvinciDistributionTag < KalturaObjectBase
		attr_accessor :tagname
		attr_accessor :extension
		attr_accessor :protocol
		attr_accessor :format
		attr_accessor :filename
		attr_accessor :ppvmodule


		def from_xml(xml_element)
			super
			if xml_element.elements['tagname'] != nil
				self.tagname = xml_element.elements['tagname'].text
			end
			if xml_element.elements['extension'] != nil
				self.extension = xml_element.elements['extension'].text
			end
			if xml_element.elements['protocol'] != nil
				self.protocol = xml_element.elements['protocol'].text
			end
			if xml_element.elements['format'] != nil
				self.format = xml_element.elements['format'].text
			end
			if xml_element.elements['filename'] != nil
				self.filename = xml_element.elements['filename'].text
			end
			if xml_element.elements['ppvmodule'] != nil
				self.ppvmodule = xml_element.elements['ppvmodule'].text
			end
		end

	end

	class KalturaTvinciDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaTvinciDistributionJobProviderData < KalturaConfigurableDistributionJobProviderData
		attr_accessor :xml


		def from_xml(xml_element)
			super
			if xml_element.elements['xml'] != nil
				self.xml = xml_element.elements['xml'].text
			end
		end

	end

	class KalturaTvinciDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :ingest_url
		attr_accessor :username
		attr_accessor :password
		# Tags array for Tvinci distribution
		attr_accessor :tags
		attr_accessor :xslt_file


		def from_xml(xml_element)
			super
			if xml_element.elements['ingestUrl'] != nil
				self.ingest_url = xml_element.elements['ingestUrl'].text
			end
			if xml_element.elements['username'] != nil
				self.username = xml_element.elements['username'].text
			end
			if xml_element.elements['password'] != nil
				self.password = xml_element.elements['password'].text
			end
			if xml_element.elements['tags'] != nil
				self.tags = KalturaClientBase.object_from_xml(xml_element.elements['tags'], 'KalturaTvinciDistributionTag')
			end
			if xml_element.elements['xsltFile'] != nil
				self.xslt_file = xml_element.elements['xsltFile'].text
			end
		end

	end

	class KalturaTvinciDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaTvinciDistributionProviderFilter < KalturaTvinciDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaTvinciDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaTvinciDistributionProfileFilter < KalturaTvinciDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
