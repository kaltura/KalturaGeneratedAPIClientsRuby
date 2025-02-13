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
require File.dirname(__FILE__) + '/kaltura_scheduled_task_client_plugin.rb'
require File.dirname(__FILE__) + '/kaltura_event_notification_client_plugin.rb'

module Kaltura

	class KalturaDispatchEventNotificationObjectTask < KalturaObjectTask
		# The event notification template id to dispatch
		attr_accessor :event_notification_template_id

		def event_notification_template_id=(val)
			@event_notification_template_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['eventNotificationTemplateId'] != nil
				self.event_notification_template_id = xml_element.elements['eventNotificationTemplateId'].text
			end
		end

	end


end
