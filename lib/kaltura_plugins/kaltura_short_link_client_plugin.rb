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

module Kaltura

	class KalturaShortLinkStatus
		DISABLED = 1
		ENABLED = 2
		DELETED = 3
	end

	class KalturaShortLinkOrderBy
		CREATED_AT_ASC = "+createdAt"
		EXPIRES_AT_ASC = "+expiresAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		EXPIRES_AT_DESC = "-expiresAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaShortLink < KalturaObjectBase
		attr_accessor :id
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :expires_at
		attr_accessor :partner_id
		attr_accessor :user_id
		attr_accessor :name
		attr_accessor :system_name
		attr_accessor :full_url
		attr_accessor :status

		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def expires_at=(val)
			@expires_at = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['expiresAt'] != nil
				self.expires_at = xml_element.elements['expiresAt'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['systemName'] != nil
				self.system_name = xml_element.elements['systemName'].text
			end
			if xml_element.elements['fullUrl'] != nil
				self.full_url = xml_element.elements['fullUrl'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
		end

	end

	class KalturaShortLinkBaseFilter < KalturaFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :updated_at_greater_than_or_equal
		attr_accessor :updated_at_less_than_or_equal
		attr_accessor :expires_at_greater_than_or_equal
		attr_accessor :expires_at_less_than_or_equal
		attr_accessor :partner_id_equal
		attr_accessor :partner_id_in
		attr_accessor :user_id_equal
		attr_accessor :user_id_in
		attr_accessor :system_name_equal
		attr_accessor :system_name_in
		attr_accessor :status_equal
		attr_accessor :status_in

		def created_at_greater_than_or_equal=(val)
			@created_at_greater_than_or_equal = val.to_i
		end
		def created_at_less_than_or_equal=(val)
			@created_at_less_than_or_equal = val.to_i
		end
		def updated_at_greater_than_or_equal=(val)
			@updated_at_greater_than_or_equal = val.to_i
		end
		def updated_at_less_than_or_equal=(val)
			@updated_at_less_than_or_equal = val.to_i
		end
		def expires_at_greater_than_or_equal=(val)
			@expires_at_greater_than_or_equal = val.to_i
		end
		def expires_at_less_than_or_equal=(val)
			@expires_at_less_than_or_equal = val.to_i
		end
		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['createdAtGreaterThanOrEqual'] != nil
				self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['createdAtLessThanOrEqual'] != nil
				self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			end
			if xml_element.elements['updatedAtGreaterThanOrEqual'] != nil
				self.updated_at_greater_than_or_equal = xml_element.elements['updatedAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['updatedAtLessThanOrEqual'] != nil
				self.updated_at_less_than_or_equal = xml_element.elements['updatedAtLessThanOrEqual'].text
			end
			if xml_element.elements['expiresAtGreaterThanOrEqual'] != nil
				self.expires_at_greater_than_or_equal = xml_element.elements['expiresAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['expiresAtLessThanOrEqual'] != nil
				self.expires_at_less_than_or_equal = xml_element.elements['expiresAtLessThanOrEqual'].text
			end
			if xml_element.elements['partnerIdEqual'] != nil
				self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			end
			if xml_element.elements['partnerIdIn'] != nil
				self.partner_id_in = xml_element.elements['partnerIdIn'].text
			end
			if xml_element.elements['userIdEqual'] != nil
				self.user_id_equal = xml_element.elements['userIdEqual'].text
			end
			if xml_element.elements['userIdIn'] != nil
				self.user_id_in = xml_element.elements['userIdIn'].text
			end
			if xml_element.elements['systemNameEqual'] != nil
				self.system_name_equal = xml_element.elements['systemNameEqual'].text
			end
			if xml_element.elements['systemNameIn'] != nil
				self.system_name_in = xml_element.elements['systemNameIn'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
		end

	end

	class KalturaShortLinkListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaShortLink')
			end
		end

	end

	class KalturaShortLinkFilter < KalturaShortLinkBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Short link service
	class KalturaShortLinkService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Allows you to add a short link object
		# @return [KalturaShortLink]
		def add(short_link)
			kparams = {}
			client.add_param(kparams, 'shortLink', short_link)
			client.queue_service_action_call('shortlink_shortlink', 'add', 'KalturaShortLink', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Mark the short link as deleted
		# @return [KalturaShortLink]
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('shortlink_shortlink', 'delete', 'KalturaShortLink', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve an short link object by id
		# @return [KalturaShortLink]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('shortlink_shortlink', 'get', 'KalturaShortLink', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Serves short link
		# @return [file]
		def goto(id, proxy=false)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'proxy', proxy)
			client.queue_service_action_call('shortlink_shortlink', 'goto', 'file', kparams)
			return client.get_serve_url()
		end

		# List short link objects by filter and pager
		# @return [KalturaShortLinkListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('shortlink_shortlink', 'list', 'KalturaShortLinkListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update exisitng short link
		# @return [KalturaShortLink]
		def update(id, short_link)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'shortLink', short_link)
			client.queue_service_action_call('shortlink_shortlink', 'update', 'KalturaShortLink', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :short_link_service
		def short_link_service
			if (@short_link_service == nil)
				@short_link_service = KalturaShortLinkService.new(self)
			end
			return @short_link_service
		end
		
	end

end
