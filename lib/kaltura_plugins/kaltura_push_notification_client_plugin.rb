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
require File.dirname(__FILE__) + '/kaltura_event_notification_client_plugin.rb'

module Kaltura

	class KalturaPushNotificationCommandType
		CLEAR_QUEUE = "CLEAR_QUEUE"
	end

	class KalturaPushNotificationTemplateOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaPushEventNotificationParameter < KalturaEventNotificationParameter
		attr_accessor :queue_key_token


		def from_xml(xml_element)
			super
			if xml_element.elements['queueKeyToken'] != nil
				self.queue_key_token = xml_element.elements['queueKeyToken'].text
			end
		end

	end

	class KalturaPushNotificationData < KalturaObjectBase
		attr_accessor :queue_name
		attr_accessor :queue_key
		attr_accessor :url


		def from_xml(xml_element)
			super
			if xml_element.elements['queueName'] != nil
				self.queue_name = xml_element.elements['queueName'].text
			end
			if xml_element.elements['queueKey'] != nil
				self.queue_key = xml_element.elements['queueKey'].text
			end
			if xml_element.elements['url'] != nil
				self.url = xml_element.elements['url'].text
			end
		end

	end

	# Object which contains contextual entry-related data.
	class KalturaPushNotificationParams < KalturaObjectBase
		# User params
		attr_accessor :user_params


		def from_xml(xml_element)
			super
			if xml_element.elements['userParams'] != nil
				self.user_params = KalturaClientBase.object_from_xml(xml_element.elements['userParams'], 'KalturaPushEventNotificationParameter')
			end
		end

	end

	class KalturaPushNotificationTemplate < KalturaEventNotificationTemplate
		# Define the content dynamic parameters
		attr_accessor :queue_name_parameters
		# Define the content dynamic parameters
		attr_accessor :queue_key_parameters
		# Kaltura API object type
		attr_accessor :api_object_type
		# Kaltura Object format
		attr_accessor :object_format
		# Kaltura response-profile id
		attr_accessor :response_profile_id

		def object_format=(val)
			@object_format = val.to_i
		end
		def response_profile_id=(val)
			@response_profile_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['queueNameParameters'] != nil
				self.queue_name_parameters = KalturaClientBase.object_from_xml(xml_element.elements['queueNameParameters'], 'KalturaPushEventNotificationParameter')
			end
			if xml_element.elements['queueKeyParameters'] != nil
				self.queue_key_parameters = KalturaClientBase.object_from_xml(xml_element.elements['queueKeyParameters'], 'KalturaPushEventNotificationParameter')
			end
			if xml_element.elements['apiObjectType'] != nil
				self.api_object_type = xml_element.elements['apiObjectType'].text
			end
			if xml_element.elements['objectFormat'] != nil
				self.object_format = xml_element.elements['objectFormat'].text
			end
			if xml_element.elements['responseProfileId'] != nil
				self.response_profile_id = xml_element.elements['responseProfileId'].text
			end
		end

	end

	class KalturaPushNotificationTemplateBaseFilter < KalturaEventNotificationTemplateFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaPushNotificationTemplateFilter < KalturaPushNotificationTemplateBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
