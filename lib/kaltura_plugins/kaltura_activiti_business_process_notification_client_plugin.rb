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
require File.dirname(__FILE__) + '/kaltura_business_process_notification_client_plugin.rb'

module Kaltura

	class KalturaActivitiBusinessProcessServerOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaActivitiBusinessProcessServerProtocol
		HTTP = "http"
		HTTPS = "https"
	end

	class KalturaActivitiBusinessProcessServer < KalturaBusinessProcessServer
		attr_accessor :host
		attr_accessor :port
		attr_accessor :protocol
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
			if xml_element.elements['protocol'] != nil
				self.protocol = xml_element.elements['protocol'].text
			end
			if xml_element.elements['username'] != nil
				self.username = xml_element.elements['username'].text
			end
			if xml_element.elements['password'] != nil
				self.password = xml_element.elements['password'].text
			end
		end

	end

	class KalturaActivitiBusinessProcessServerBaseFilter < KalturaBusinessProcessServerFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaActivitiBusinessProcessServerFilter < KalturaActivitiBusinessProcessServerBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
