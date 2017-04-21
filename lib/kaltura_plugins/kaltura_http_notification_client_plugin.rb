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

	class KalturaHttpNotificationAuthenticationMethod
		ANYSAFE = -18
		ANY = -17
		BASIC = 1
		DIGEST = 2
		GSSNEGOTIATE = 4
		NTLM = 8
	end

	class KalturaHttpNotificationMethod
		GET = 1
		POST = 2
		PUT = 3
		DELETE = 4
	end

	class KalturaHttpNotificationSslVersion
		V2 = 2
		V3 = 3
	end

	class KalturaHttpNotificationCertificateType
		DER = "DER"
		ENG = "ENG"
		PEM = "PEM"
	end

	class KalturaHttpNotificationSslKeyType
		DER = "DER"
		ENG = "ENG"
		PEM = "PEM"
	end

	class KalturaHttpNotificationTemplateOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		UPDATED_AT_DESC = "-updatedAt"
	end

	# Wrapper for sent notifications
	class KalturaHttpNotification < KalturaObjectBase
		# Object that triggered the notification
		attr_accessor :object
		# Object type that triggered the notification
		attr_accessor :event_object_type
		# ID of the batch job that execute the notification
		attr_accessor :event_notification_job_id
		# ID of the template that triggered the notification
		attr_accessor :template_id
		# Name of the template that triggered the notification
		attr_accessor :template_name
		# System name of the template that triggered the notification
		attr_accessor :template_system_name
		# Ecent type that triggered the notification
		attr_accessor :event_type

		def event_notification_job_id=(val)
			@event_notification_job_id = val.to_i
		end
		def template_id=(val)
			@template_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['object'] != nil
				self.object = KalturaClientBase.object_from_xml(xml_element.elements['object'], 'KalturaObjectBase')
			end
			if xml_element.elements['eventObjectType'] != nil
				self.event_object_type = xml_element.elements['eventObjectType'].text
			end
			if xml_element.elements['eventNotificationJobId'] != nil
				self.event_notification_job_id = xml_element.elements['eventNotificationJobId'].text
			end
			if xml_element.elements['templateId'] != nil
				self.template_id = xml_element.elements['templateId'].text
			end
			if xml_element.elements['templateName'] != nil
				self.template_name = xml_element.elements['templateName'].text
			end
			if xml_element.elements['templateSystemName'] != nil
				self.template_system_name = xml_element.elements['templateSystemName'].text
			end
			if xml_element.elements['eventType'] != nil
				self.event_type = xml_element.elements['eventType'].text
			end
		end

	end

	class KalturaHttpNotificationData < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	# If this class used as the template data, the fields will be taken from the content parameters
	class KalturaHttpNotificationDataFields < KalturaHttpNotificationData


		def from_xml(xml_element)
			super
		end

	end

	class KalturaHttpNotificationDataText < KalturaHttpNotificationData
		attr_accessor :content


		def from_xml(xml_element)
			super
			if xml_element.elements['content'] != nil
				self.content = KalturaClientBase.object_from_xml(xml_element.elements['content'], 'KalturaStringValue')
			end
		end

	end

	# Evaluates PHP statement, depends on the execution context
	class KalturaHttpNotificationObjectData < KalturaHttpNotificationData
		# Kaltura API object type
		attr_accessor :api_object_type
		# Data format
		attr_accessor :format
		# Ignore null attributes during serialization
		attr_accessor :ignore_null
		# PHP code
		attr_accessor :code

		def format=(val)
			@format = val.to_i
		end
		def ignore_null=(val)
			@ignore_null = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['apiObjectType'] != nil
				self.api_object_type = xml_element.elements['apiObjectType'].text
			end
			if xml_element.elements['format'] != nil
				self.format = xml_element.elements['format'].text
			end
			if xml_element.elements['ignoreNull'] != nil
				self.ignore_null = xml_element.elements['ignoreNull'].text
			end
			if xml_element.elements['code'] != nil
				self.code = xml_element.elements['code'].text
			end
		end

	end

	class KalturaHttpNotificationTemplate < KalturaEventNotificationTemplate
		# Remote server URL
		attr_accessor :url
		# Request method.
		attr_accessor :method
		# Data to send.
		attr_accessor :data
		# The maximum number of seconds to allow cURL functions to execute.
		attr_accessor :timeout
		# The number of seconds to wait while trying to connect.
		# 	 Must be larger than zero.
		attr_accessor :connect_timeout
		# A username to use for the connection.
		attr_accessor :username
		# A password to use for the connection.
		attr_accessor :password
		# The HTTP authentication method to use.
		attr_accessor :authentication_method
		# The SSL version (2 or 3) to use.
		# 	 By default PHP will try to determine this itself, although in some cases this must be set manually.
		attr_accessor :ssl_version
		# SSL certificate to verify the peer with.
		attr_accessor :ssl_certificate
		# The format of the certificate.
		attr_accessor :ssl_certificate_type
		# The password required to use the certificate.
		attr_accessor :ssl_certificate_password
		# The identifier for the crypto engine of the private SSL key specified in ssl key.
		attr_accessor :ssl_engine
		# The identifier for the crypto engine used for asymmetric crypto operations.
		attr_accessor :ssl_engine_default
		# The key type of the private SSL key specified in ssl key - PEM / DER / ENG.
		attr_accessor :ssl_key_type
		# Private SSL key.
		attr_accessor :ssl_key
		# The secret password needed to use the private SSL key specified in ssl key.
		attr_accessor :ssl_key_password
		# Adds a e-mail custom header
		attr_accessor :custom_headers

		def method=(val)
			@method = val.to_i
		end
		def timeout=(val)
			@timeout = val.to_i
		end
		def connect_timeout=(val)
			@connect_timeout = val.to_i
		end
		def authentication_method=(val)
			@authentication_method = val.to_i
		end
		def ssl_version=(val)
			@ssl_version = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['url'] != nil
				self.url = xml_element.elements['url'].text
			end
			if xml_element.elements['method'] != nil
				self.method = xml_element.elements['method'].text
			end
			if xml_element.elements['data'] != nil
				self.data = KalturaClientBase.object_from_xml(xml_element.elements['data'], 'KalturaHttpNotificationData')
			end
			if xml_element.elements['timeout'] != nil
				self.timeout = xml_element.elements['timeout'].text
			end
			if xml_element.elements['connectTimeout'] != nil
				self.connect_timeout = xml_element.elements['connectTimeout'].text
			end
			if xml_element.elements['username'] != nil
				self.username = xml_element.elements['username'].text
			end
			if xml_element.elements['password'] != nil
				self.password = xml_element.elements['password'].text
			end
			if xml_element.elements['authenticationMethod'] != nil
				self.authentication_method = xml_element.elements['authenticationMethod'].text
			end
			if xml_element.elements['sslVersion'] != nil
				self.ssl_version = xml_element.elements['sslVersion'].text
			end
			if xml_element.elements['sslCertificate'] != nil
				self.ssl_certificate = xml_element.elements['sslCertificate'].text
			end
			if xml_element.elements['sslCertificateType'] != nil
				self.ssl_certificate_type = xml_element.elements['sslCertificateType'].text
			end
			if xml_element.elements['sslCertificatePassword'] != nil
				self.ssl_certificate_password = xml_element.elements['sslCertificatePassword'].text
			end
			if xml_element.elements['sslEngine'] != nil
				self.ssl_engine = xml_element.elements['sslEngine'].text
			end
			if xml_element.elements['sslEngineDefault'] != nil
				self.ssl_engine_default = xml_element.elements['sslEngineDefault'].text
			end
			if xml_element.elements['sslKeyType'] != nil
				self.ssl_key_type = xml_element.elements['sslKeyType'].text
			end
			if xml_element.elements['sslKey'] != nil
				self.ssl_key = xml_element.elements['sslKey'].text
			end
			if xml_element.elements['sslKeyPassword'] != nil
				self.ssl_key_password = xml_element.elements['sslKeyPassword'].text
			end
			if xml_element.elements['customHeaders'] != nil
				self.custom_headers = KalturaClientBase.object_from_xml(xml_element.elements['customHeaders'], 'KalturaKeyValue')
			end
		end

	end

	class KalturaHttpNotificationDispatchJobData < KalturaEventNotificationDispatchJobData
		# Remote server URL
		attr_accessor :url
		# Request method.
		attr_accessor :method
		# Data to send.
		attr_accessor :data
		# The maximum number of seconds to allow cURL functions to execute.
		attr_accessor :timeout
		# The number of seconds to wait while trying to connect.
		# 	 Must be larger than zero.
		attr_accessor :connect_timeout
		# A username to use for the connection.
		attr_accessor :username
		# A password to use for the connection.
		attr_accessor :password
		# The HTTP authentication method to use.
		attr_accessor :authentication_method
		# The SSL version (2 or 3) to use.
		# 	 By default PHP will try to determine this itself, although in some cases this must be set manually.
		attr_accessor :ssl_version
		# SSL certificate to verify the peer with.
		attr_accessor :ssl_certificate
		# The format of the certificate.
		attr_accessor :ssl_certificate_type
		# The password required to use the certificate.
		attr_accessor :ssl_certificate_password
		# The identifier for the crypto engine of the private SSL key specified in ssl key.
		attr_accessor :ssl_engine
		# The identifier for the crypto engine used for asymmetric crypto operations.
		attr_accessor :ssl_engine_default
		# The key type of the private SSL key specified in ssl key - PEM / DER / ENG.
		attr_accessor :ssl_key_type
		# Private SSL key.
		attr_accessor :ssl_key
		# The secret password needed to use the private SSL key specified in ssl key.
		attr_accessor :ssl_key_password
		# Adds a e-mail custom header
		attr_accessor :custom_headers
		# The secret to sign the notification with
		attr_accessor :sign_secret

		def method=(val)
			@method = val.to_i
		end
		def timeout=(val)
			@timeout = val.to_i
		end
		def connect_timeout=(val)
			@connect_timeout = val.to_i
		end
		def authentication_method=(val)
			@authentication_method = val.to_i
		end
		def ssl_version=(val)
			@ssl_version = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['url'] != nil
				self.url = xml_element.elements['url'].text
			end
			if xml_element.elements['method'] != nil
				self.method = xml_element.elements['method'].text
			end
			if xml_element.elements['data'] != nil
				self.data = xml_element.elements['data'].text
			end
			if xml_element.elements['timeout'] != nil
				self.timeout = xml_element.elements['timeout'].text
			end
			if xml_element.elements['connectTimeout'] != nil
				self.connect_timeout = xml_element.elements['connectTimeout'].text
			end
			if xml_element.elements['username'] != nil
				self.username = xml_element.elements['username'].text
			end
			if xml_element.elements['password'] != nil
				self.password = xml_element.elements['password'].text
			end
			if xml_element.elements['authenticationMethod'] != nil
				self.authentication_method = xml_element.elements['authenticationMethod'].text
			end
			if xml_element.elements['sslVersion'] != nil
				self.ssl_version = xml_element.elements['sslVersion'].text
			end
			if xml_element.elements['sslCertificate'] != nil
				self.ssl_certificate = xml_element.elements['sslCertificate'].text
			end
			if xml_element.elements['sslCertificateType'] != nil
				self.ssl_certificate_type = xml_element.elements['sslCertificateType'].text
			end
			if xml_element.elements['sslCertificatePassword'] != nil
				self.ssl_certificate_password = xml_element.elements['sslCertificatePassword'].text
			end
			if xml_element.elements['sslEngine'] != nil
				self.ssl_engine = xml_element.elements['sslEngine'].text
			end
			if xml_element.elements['sslEngineDefault'] != nil
				self.ssl_engine_default = xml_element.elements['sslEngineDefault'].text
			end
			if xml_element.elements['sslKeyType'] != nil
				self.ssl_key_type = xml_element.elements['sslKeyType'].text
			end
			if xml_element.elements['sslKey'] != nil
				self.ssl_key = xml_element.elements['sslKey'].text
			end
			if xml_element.elements['sslKeyPassword'] != nil
				self.ssl_key_password = xml_element.elements['sslKeyPassword'].text
			end
			if xml_element.elements['customHeaders'] != nil
				self.custom_headers = KalturaClientBase.object_from_xml(xml_element.elements['customHeaders'], 'KalturaKeyValue')
			end
			if xml_element.elements['signSecret'] != nil
				self.sign_secret = xml_element.elements['signSecret'].text
			end
		end

	end

	class KalturaHttpNotificationTemplateBaseFilter < KalturaEventNotificationTemplateFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaHttpNotificationTemplateFilter < KalturaHttpNotificationTemplateBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
