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
# Copyright (C) 2006-2021  Kaltura Inc.
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

	class KalturaIntegrationProviderType
		CIELO24 = "cielo24.Cielo24"
		EXAMPLE = "exampleIntegration.Example"
		VOICEBASE = "voicebase.Voicebase"
	end

	class KalturaIntegrationTriggerType
		BPM_EVENT_NOTIFICATION = "bpmEventNotificationIntegration.BpmEventNotification"
		MANUAL = "1"
	end

	class KalturaIntegrationJobProviderData < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	class KalturaIntegrationJobTriggerData < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	class KalturaIntegrationJobData < KalturaJobData
		attr_accessor :callback_notification_url
		attr_accessor :provider_type
		# Additional data that relevant for the provider only
		attr_accessor :provider_data
		attr_accessor :trigger_type
		# Additional data that relevant for the trigger only
		attr_accessor :trigger_data


		def from_xml(xml_element)
			super
			if xml_element.elements['callbackNotificationUrl'] != nil
				self.callback_notification_url = xml_element.elements['callbackNotificationUrl'].text
			end
			if xml_element.elements['providerType'] != nil
				self.provider_type = xml_element.elements['providerType'].text
			end
			if xml_element.elements['providerData'] != nil
				self.provider_data = KalturaClientBase.object_from_xml(xml_element.elements['providerData'], 'KalturaIntegrationJobProviderData')
			end
			if xml_element.elements['triggerType'] != nil
				self.trigger_type = xml_element.elements['triggerType'].text
			end
			if xml_element.elements['triggerData'] != nil
				self.trigger_data = KalturaClientBase.object_from_xml(xml_element.elements['triggerData'], 'KalturaIntegrationJobTriggerData')
			end
		end

	end


	# Integration service lets you dispatch integration tasks
	class KalturaIntegrationService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Dispatch integration task
		# @return [int]
		def dispatch(data, object_type, object_id)
			kparams = {}
			client.add_param(kparams, 'data', data)
			client.add_param(kparams, 'objectType', object_type)
			client.add_param(kparams, 'objectId', object_id)
			client.queue_service_action_call('integration_integration', 'dispatch', 'int', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# @return []
		def notify(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('integration_integration', 'notify', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :integration_service
		def integration_service
			if (@integration_service == nil)
				@integration_service = KalturaIntegrationService.new(self)
			end
			return @integration_service
		end
		
	end

end
