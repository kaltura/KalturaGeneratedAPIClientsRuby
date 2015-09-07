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
require File.dirname(__FILE__) + '/kaltura_file_sync_client_plugin.rb'

module Kaltura

	class KalturaTrackEntryEventType
		UPLOADED_FILE = 1
		WEBCAM_COMPLETED = 2
		IMPORT_STARTED = 3
		ADD_ENTRY = 4
		UPDATE_ENTRY = 5
		DELETED_ENTRY = 6
	end

	class KalturaUiConfAdminOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaTrackEntry < KalturaObjectBase
		attr_accessor :id
		attr_accessor :track_event_type
		attr_accessor :ps_version
		attr_accessor :context
		attr_accessor :partner_id
		attr_accessor :entry_id
		attr_accessor :host_name
		attr_accessor :user_id
		attr_accessor :changed_properties
		attr_accessor :param_str1
		attr_accessor :param_str2
		attr_accessor :param_str3
		attr_accessor :ks
		attr_accessor :description
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :user_ip

		def id=(val)
			@id = val.to_i
		end
		def track_event_type=(val)
			@track_event_type = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end

		def from_xml(xml_element)
			super
			self.id = xml_element.elements['id'].text
			self.track_event_type = xml_element.elements['trackEventType'].text
			self.ps_version = xml_element.elements['psVersion'].text
			self.context = xml_element.elements['context'].text
			self.partner_id = xml_element.elements['partnerId'].text
			self.entry_id = xml_element.elements['entryId'].text
			self.host_name = xml_element.elements['hostName'].text
			self.user_id = xml_element.elements['userId'].text
			self.changed_properties = xml_element.elements['changedProperties'].text
			self.param_str1 = xml_element.elements['paramStr1'].text
			self.param_str2 = xml_element.elements['paramStr2'].text
			self.param_str3 = xml_element.elements['paramStr3'].text
			self.ks = xml_element.elements['ks'].text
			self.description = xml_element.elements['description'].text
			self.created_at = xml_element.elements['createdAt'].text
			self.updated_at = xml_element.elements['updatedAt'].text
			self.user_ip = xml_element.elements['userIp'].text
		end

	end

	class KalturaUiConfAdmin < KalturaUiConf
		attr_accessor :is_public

		def is_public=(val)
			@is_public = to_b(val)
		end

		def from_xml(xml_element)
			super
			self.is_public = xml_element.elements['isPublic'].text
		end

	end

	class KalturaTrackEntryListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaTrackEntry')
		end

	end

	class KalturaUiConfAdminListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaUiConfAdmin')
		end

	end

	class KalturaUiConfAdminBaseFilter < KalturaUiConfFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaUiConfAdminFilter < KalturaUiConfAdminBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Entry Admin service
	#  
	class KalturaEntryAdminService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Get base entry by ID with no filters.
		# 	 
		def get(entry_id, version=-1)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'version', version)
			client.queue_service_action_call('adminconsole_entryadmin', 'get', 'KalturaBaseEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get base entry by flavor ID with no filters.
		# 	 
		def get_by_flavor_id(flavor_id, version=-1)
			kparams = {}
			client.add_param(kparams, 'flavorId', flavor_id)
			client.add_param(kparams, 'version', version)
			client.queue_service_action_call('adminconsole_entryadmin', 'getByFlavorId', 'KalturaBaseEntry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get base entry by ID with no filters.
		# 	 
		def get_tracks(entry_id)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.queue_service_action_call('adminconsole_entryadmin', 'getTracks', 'KalturaTrackEntryListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# UiConf Admin service
	#  
	class KalturaUiConfAdminService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Adds new UIConf with no partner limitation
		# 	 
		def add(ui_conf)
			kparams = {}
			client.add_param(kparams, 'uiConf', ui_conf)
			client.queue_service_action_call('adminconsole_uiconfadmin', 'add', 'KalturaUiConfAdmin', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing UIConf with no partner limitation
		# 	 
		def update(id, ui_conf)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'uiConf', ui_conf)
			client.queue_service_action_call('adminconsole_uiconfadmin', 'update', 'KalturaUiConfAdmin', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a UIConf by id with no partner limitation
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('adminconsole_uiconfadmin', 'get', 'KalturaUiConfAdmin', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete an existing UIConf with no partner limitation
		# 	 
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('adminconsole_uiconfadmin', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve a list of available UIConfs  with no partner limitation
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('adminconsole_uiconfadmin', 'list', 'KalturaUiConfAdminListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaReportAdminService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		def add(report)
			kparams = {}
			client.add_param(kparams, 'report', report)
			client.queue_service_action_call('adminconsole_reportadmin', 'add', 'KalturaReport', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('adminconsole_reportadmin', 'get', 'KalturaReport', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('adminconsole_reportadmin', 'list', 'KalturaReportListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def update(id, report)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'report', report)
			client.queue_service_action_call('adminconsole_reportadmin', 'update', 'KalturaReport', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('adminconsole_reportadmin', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def execute_debug(id, params=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'params', params)
			client.queue_service_action_call('adminconsole_reportadmin', 'executeDebug', 'KalturaReportResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get_parameters(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('adminconsole_reportadmin', 'getParameters', 'array', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get_csv_url(id, report_partner_id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'reportPartnerId', report_partner_id)
			client.queue_service_action_call('adminconsole_reportadmin', 'getCsvUrl', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :entry_admin_service
		def entry_admin_service
			if (@entry_admin_service == nil)
				@entry_admin_service = KalturaEntryAdminService.new(self)
			end
			return @entry_admin_service
		end
		
		attr_reader :ui_conf_admin_service
		def ui_conf_admin_service
			if (@ui_conf_admin_service == nil)
				@ui_conf_admin_service = KalturaUiConfAdminService.new(self)
			end
			return @ui_conf_admin_service
		end
		
		attr_reader :report_admin_service
		def report_admin_service
			if (@report_admin_service == nil)
				@report_admin_service = KalturaReportAdminService.new(self)
			end
			return @report_admin_service
		end
		
	end

end
