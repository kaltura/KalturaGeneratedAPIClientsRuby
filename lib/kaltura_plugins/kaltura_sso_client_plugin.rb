# ===================================================================================================
#                           _  __     _ _
#                          | |/ /__ _| | |_ _  _ _ _ __ _
#                          | ' </ _` | |  _| || | '_/ _` |
#                          |_|\_\__,_|_|\__|\_,_|_| \__,_|
#
# This file is part of the Kaltura Collaborative Media Suite which allows users
# to do with audio, video, and animation what Wiki platforms allow them to do with
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

module Kaltura

	class KalturaSsoStatus
		DISABLED = 1
		ACTIVE = 2
		DELETED = 3
	end

	class KalturaSso < KalturaObjectBase
		attr_accessor :id
		attr_accessor :application_type
		attr_accessor :partner_id
		attr_accessor :domain
		attr_accessor :status
		# Creation date as Unix timestamp (In seconds)
		attr_accessor :created_at
		# Last update date as Unix timestamp (In seconds)
		attr_accessor :updated_at
		# Redirect URL for a specific application type and (partner id or domain)
		attr_accessor :redirect_url
		attr_accessor :data

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['applicationType'] != nil
				self.application_type = xml_element.elements['applicationType'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['domain'] != nil
				self.domain = xml_element.elements['domain'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['updatedAt'] != nil
				self.updated_at = xml_element.elements['updatedAt'].text
			end
			if xml_element.elements['redirectUrl'] != nil
				self.redirect_url = xml_element.elements['redirectUrl'].text
			end
			if xml_element.elements['data'] != nil
				self.data = xml_element.elements['data'].text
			end
		end

	end

	class KalturaSsoListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaSso')
			end
		end

	end

	class KalturaSsoBaseFilter < KalturaRelatedFilter
		attr_accessor :id_equal
		attr_accessor :id_in
		attr_accessor :application_type_equal
		attr_accessor :partner_id_equal
		attr_accessor :domain_equal
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :created_at_greater_than_or_equal
		attr_accessor :created_at_less_than_or_equal
		attr_accessor :redirect_url_equal

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def partner_id_equal=(val)
			@partner_id_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end
		def created_at_greater_than_or_equal=(val)
			@created_at_greater_than_or_equal = val.to_i
		end
		def created_at_less_than_or_equal=(val)
			@created_at_less_than_or_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
			if xml_element.elements['applicationTypeEqual'] != nil
				self.application_type_equal = xml_element.elements['applicationTypeEqual'].text
			end
			if xml_element.elements['partnerIdEqual'] != nil
				self.partner_id_equal = xml_element.elements['partnerIdEqual'].text
			end
			if xml_element.elements['domainEqual'] != nil
				self.domain_equal = xml_element.elements['domainEqual'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['createdAtGreaterThanOrEqual'] != nil
				self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['createdAtLessThanOrEqual'] != nil
				self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			end
			if xml_element.elements['redirectUrlEqual'] != nil
				self.redirect_url_equal = xml_element.elements['redirectUrlEqual'].text
			end
		end

	end

	class KalturaSsoFilter < KalturaSsoBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	class KalturaSsoService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Adds a new sso configuration.
		# @return [KalturaSso]
		def add(sso)
			kparams = {}
			client.add_param(kparams, 'sso', sso)
			client.queue_service_action_call('sso_sso', 'add', 'KalturaSso', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete sso by ID
		# @return [KalturaSso]
		def delete(sso_id)
			kparams = {}
			client.add_param(kparams, 'ssoId', sso_id)
			client.queue_service_action_call('sso_sso', 'delete', 'KalturaSso', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieves sso object
		# @return [KalturaSso]
		def get(sso_id)
			kparams = {}
			client.add_param(kparams, 'ssoId', sso_id)
			client.queue_service_action_call('sso_sso', 'get', 'KalturaSso', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Lists sso objects that are associated with an account.
		# @return [KalturaSsoListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('sso_sso', 'list', 'KalturaSsoListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Login with SSO, getting redirect url according to application type and partner Id
		# 	 or according to application type and domain
		# @return [string]
		def login(user_id, application_type, partner_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'userId', user_id)
			client.add_param(kparams, 'applicationType', application_type)
			client.add_param(kparams, 'partnerId', partner_id)
			client.queue_service_action_call('sso_sso', 'login', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update sso by ID
		# @return [KalturaSso]
		def update(sso_id, sso)
			kparams = {}
			client.add_param(kparams, 'ssoId', sso_id)
			client.add_param(kparams, 'sso', sso)
			client.queue_service_action_call('sso_sso', 'update', 'KalturaSso', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :sso_service
		def sso_service
			if (@sso_service == nil)
				@sso_service = KalturaSsoService.new(self)
			end
			return @sso_service
		end
		
	end

end
