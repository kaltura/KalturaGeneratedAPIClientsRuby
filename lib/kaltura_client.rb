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
require 'kaltura_client_base.rb'
require 'kaltura_enums.rb'
require 'kaltura_types.rb'

module Kaltura


	class KalturaAnnouncementService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add a new future scheduled system announcement push notification
		# @return [KalturaAnnouncement]
		def add(announcement)
			kparams = {}
			client.add_param(kparams, 'announcement', announcement)
			client.queue_service_action_call('announcement', 'add', 'KalturaAnnouncement', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete an existing announcing. Announcement cannot be delete while being sent.
		# @return [bool]
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('announcement', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Enable system announcements
		# @return [bool]
		def enable_system_announcements()
			kparams = {}
			client.queue_service_action_call('announcement', 'enableSystemAnnouncements', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Lists all announcements in the system.
		# @return [KalturaAnnouncementListResponse]
		def list(filter, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('announcement', 'list', 'KalturaAnnouncementListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update an existing future system announcement push notification. Announcement can only be updated only before sending
		# @return [KalturaAnnouncement]
		def update(announcement_id, announcement)
			kparams = {}
			client.add_param(kparams, 'announcementId', announcement_id)
			client.add_param(kparams, 'announcement', announcement)
			client.queue_service_action_call('announcement', 'update', 'KalturaAnnouncement', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update a system announcement status
		# @return [bool]
		def update_status(id, status)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'status', status)
			client.queue_service_action_call('announcement', 'updateStatus', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaAppTokenService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new application authentication token
		# @return [KalturaAppToken]
		def add(app_token)
			kparams = {}
			client.add_param(kparams, 'appToken', app_token)
			client.queue_service_action_call('apptoken', 'add', 'KalturaAppToken', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete application authentication token by id
		# @return [bool]
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('apptoken', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get application authentication token by id
		# @return [KalturaAppToken]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('apptoken', 'get', 'KalturaAppToken', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Starts a new KS (Kaltura Session) based on application authentication token id
		# @return [KalturaSessionInfo]
		def start_session(id, token_hash, user_id=KalturaNotImplemented, type=KalturaNotImplemented, expiry=KalturaNotImplemented, udid=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'tokenHash', token_hash)
			client.add_param(kparams, 'userId', user_id)
			client.add_param(kparams, 'type', type)
			client.add_param(kparams, 'expiry', expiry)
			client.add_param(kparams, 'udid', udid)
			client.queue_service_action_call('apptoken', 'startSession', 'KalturaSessionInfo', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaAssetCommentService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add asset comments by asset id
		# @return [KalturaAssetComment]
		def add(comment)
			kparams = {}
			client.add_param(kparams, 'comment', comment)
			client.queue_service_action_call('assetcomment', 'add', 'KalturaAssetComment', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Returns asset comments by asset id
		# @return [KalturaAssetCommentListResponse]
		def list(filter, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('assetcomment', 'list', 'KalturaAssetCommentListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaAssetService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Returns media or EPG asset by media / EPG internal or external identifier
		# @return [KalturaAsset]
		def get(id, asset_reference_type)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'assetReferenceType', asset_reference_type)
			client.queue_service_action_call('asset', 'get', 'KalturaAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Returns media or EPG assets. Filters by media identifiers or by EPG internal or external identifier.
		# @return [KalturaAssetListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('asset', 'list', 'KalturaAssetListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaAssetFileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# get KalturaAssetFileContext
		# @return [KalturaAssetFileContext]
		def get_context(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('assetfile', 'getContext', 'KalturaAssetFileContext', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaAssetHistoryService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Get recently watched media for user, ordered by recently watched first.
		# @return [KalturaAssetHistoryListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('assethistory', 'list', 'KalturaAssetHistoryListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaAssetStatisticsService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Returns statistics for given list of assets by type and / or time period
		# @return [KalturaAssetStatisticsListResponse]
		def query(query)
			kparams = {}
			client.add_param(kparams, 'query', query)
			client.queue_service_action_call('assetstatistics', 'query', 'KalturaAssetStatisticsListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaBookmarkService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Report player position and action for the user on the watched asset. Player position is used to later allow resume watching.
		# @return [bool]
		def add(bookmark)
			kparams = {}
			client.add_param(kparams, 'bookmark', bookmark)
			client.queue_service_action_call('bookmark', 'add', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Returns player position record/s for the requested asset and the requesting user. 
		#             If default user makes the request – player position records are provided for all of the users in the household.
		#             If non-default user makes the request - player position records are provided for the requesting user and the default user of the household.
		# @return [KalturaBookmarkListResponse]
		def list(filter)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('bookmark', 'list', 'KalturaBookmarkListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaCdnAdapterProfileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Insert new CDN adapter for partner
		# @return [KalturaCDNAdapterProfile]
		def add(adapter)
			kparams = {}
			client.add_param(kparams, 'adapter', adapter)
			client.queue_service_action_call('cdnadapterprofile', 'add', 'KalturaCDNAdapterProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete CDN adapter by CDN adapter id
		# @return [bool]
		def delete(adapter_id)
			kparams = {}
			client.add_param(kparams, 'adapterId', adapter_id)
			client.queue_service_action_call('cdnadapterprofile', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Generate CDN adapter shared secret
		# @return [KalturaCDNAdapterProfile]
		def generate_shared_secret(adapter_id)
			kparams = {}
			client.add_param(kparams, 'adapterId', adapter_id)
			client.queue_service_action_call('cdnadapterprofile', 'generateSharedSecret', 'KalturaCDNAdapterProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Returns all CDN adapters for partner
		# @return [KalturaCDNAdapterProfileListResponse]
		def list()
			kparams = {}
			client.queue_service_action_call('cdnadapterprofile', 'list', 'KalturaCDNAdapterProfileListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update CDN adapter details
		# @return [KalturaCDNAdapterProfile]
		def update(adapter_id, adapter)
			kparams = {}
			client.add_param(kparams, 'adapterId', adapter_id)
			client.add_param(kparams, 'adapter', adapter)
			client.queue_service_action_call('cdnadapterprofile', 'update', 'KalturaCDNAdapterProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaCdnPartnerSettingsService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Retrieve the partner’s CDN settings (default adapters)
		# @return [KalturaCDNPartnerSettings]
		def get()
			kparams = {}
			client.queue_service_action_call('cdnpartnersettings', 'get', 'KalturaCDNPartnerSettings', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Configure the partner’s CDN settings (default adapters)
		# @return [KalturaCDNPartnerSettings]
		def update(settings)
			kparams = {}
			client.add_param(kparams, 'settings', settings)
			client.queue_service_action_call('cdnpartnersettings', 'update', 'KalturaCDNPartnerSettings', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaCDVRAdapterProfileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Insert new C-DVR adapter for partner
		# @return [KalturaCDVRAdapterProfile]
		def add(adapter)
			kparams = {}
			client.add_param(kparams, 'adapter', adapter)
			client.queue_service_action_call('cdvradapterprofile', 'add', 'KalturaCDVRAdapterProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete C-DVR adapter by C-DVR adapter id
		# @return [bool]
		def delete(adapter_id)
			kparams = {}
			client.add_param(kparams, 'adapterId', adapter_id)
			client.queue_service_action_call('cdvradapterprofile', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Generate C-DVR adapter shared secret
		# @return [KalturaCDVRAdapterProfile]
		def generate_shared_secret(adapter_id)
			kparams = {}
			client.add_param(kparams, 'adapterId', adapter_id)
			client.queue_service_action_call('cdvradapterprofile', 'generateSharedSecret', 'KalturaCDVRAdapterProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Returns all C-DVR adapters for partner
		# @return [KalturaCDVRAdapterProfileListResponse]
		def list()
			kparams = {}
			client.queue_service_action_call('cdvradapterprofile', 'list', 'KalturaCDVRAdapterProfileListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update C-DVR adapter details
		# @return [KalturaCDVRAdapterProfile]
		def update(adapter_id, adapter)
			kparams = {}
			client.add_param(kparams, 'adapterId', adapter_id)
			client.add_param(kparams, 'adapter', adapter)
			client.queue_service_action_call('cdvradapterprofile', 'update', 'KalturaCDVRAdapterProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaChannelService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Insert new channel for partner. Currently supports only KSQL channel
		# @return [KalturaChannel]
		def add(channel)
			kparams = {}
			client.add_param(kparams, 'channel', channel)
			client.queue_service_action_call('channel', 'add', 'KalturaChannel', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete channel by its channel id
		# @return [bool]
		def delete(channel_id)
			kparams = {}
			client.add_param(kparams, 'channelId', channel_id)
			client.queue_service_action_call('channel', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Returns channel info
		# @return [KalturaChannel]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('channel', 'get', 'KalturaChannel', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update channel details. Currently supports only KSQL channel
		# @return [KalturaChannel]
		def update(channel_id, channel)
			kparams = {}
			client.add_param(kparams, 'channelId', channel_id)
			client.add_param(kparams, 'channel', channel)
			client.queue_service_action_call('channel', 'update', 'KalturaChannel', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaCouponService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Returns information about a coupon
		# @return [KalturaCoupon]
		def get(code)
			kparams = {}
			client.add_param(kparams, 'code', code)
			client.queue_service_action_call('coupon', 'get', 'KalturaCoupon', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaEntitlementService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Immediately cancel a subscription, PPV or collection. Cancel is possible only if within cancellation window and content not already consumed
		# @return [bool]
		def cancel(asset_id, transaction_type)
			kparams = {}
			client.add_param(kparams, 'assetId', asset_id)
			client.add_param(kparams, 'transactionType', transaction_type)
			client.queue_service_action_call('entitlement', 'cancel', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Cancel a household service subscription at the next renewal. The subscription stays valid till the next renewal.
		# @return []
		def cancel_renewal(subscription_id)
			kparams = {}
			client.add_param(kparams, 'subscriptionId', subscription_id)
			client.queue_service_action_call('entitlement', 'cancelRenewal', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Reconcile the user household&#39;s entitlements with an external entitlements source. This request is frequency protected to avoid too frequent calls per household.
		# @return [bool]
		def external_reconcile()
			kparams = {}
			client.queue_service_action_call('entitlement', 'externalReconcile', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Immediately cancel a subscription, PPV or collection. Cancel applies regardless of cancellation window and content consumption status
		# @return [bool]
		def force_cancel(asset_id, transaction_type)
			kparams = {}
			client.add_param(kparams, 'assetId', asset_id)
			client.add_param(kparams, 'transactionType', transaction_type)
			client.queue_service_action_call('entitlement', 'forceCancel', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Grant household for an entitlement for a PPV or Subscription.
		# @return [bool]
		def grant(product_id, product_type, history, content_id=0)
			kparams = {}
			client.add_param(kparams, 'productId', product_id)
			client.add_param(kparams, 'productType', product_type)
			client.add_param(kparams, 'history', history)
			client.add_param(kparams, 'contentId', content_id)
			client.queue_service_action_call('entitlement', 'grant', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Gets all the entitled media items for a household
		# @return [KalturaEntitlementListResponse]
		def list(filter, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('entitlement', 'list', 'KalturaEntitlementListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaExportTaskService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Adds a new bulk export task
		# @return [KalturaExportTask]
		def add(task)
			kparams = {}
			client.add_param(kparams, 'task', task)
			client.queue_service_action_call('exporttask', 'add', 'KalturaExportTask', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Deletes an existing bulk export task by task identifier
		# @return [bool]
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('exporttask', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Gets an existing bulk export task by task identifier
		# @return [KalturaExportTask]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('exporttask', 'get', 'KalturaExportTask', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Returns bulk export tasks by tasks identifiers
		# @return [KalturaExportTaskListResponse]
		def list(filter=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('exporttask', 'list', 'KalturaExportTaskListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Updates an existing bulk export task by task identifier
		# @return [KalturaExportTask]
		def update(id, task)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'task', task)
			client.queue_service_action_call('exporttask', 'update', 'KalturaExportTask', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaExternalChannelProfileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Insert new External channel for partner
		# @return [KalturaExternalChannelProfile]
		def add(external_channel)
			kparams = {}
			client.add_param(kparams, 'externalChannel', external_channel)
			client.queue_service_action_call('externalchannelprofile', 'add', 'KalturaExternalChannelProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete External channel by External channel id
		# @return [bool]
		def delete(external_channel_id)
			kparams = {}
			client.add_param(kparams, 'externalChannelId', external_channel_id)
			client.queue_service_action_call('externalchannelprofile', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Returns all External channels for partner
		# @return [KalturaExternalChannelProfileListResponse]
		def list()
			kparams = {}
			client.queue_service_action_call('externalchannelprofile', 'list', 'KalturaExternalChannelProfileListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update External channel details
		# @return [KalturaExternalChannelProfile]
		def update(external_channel_id, external_channel)
			kparams = {}
			client.add_param(kparams, 'externalChannelId', external_channel_id)
			client.add_param(kparams, 'externalChannel', external_channel)
			client.queue_service_action_call('externalchannelprofile', 'update', 'KalturaExternalChannelProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaFavoriteService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add media to user&#39;s favorite list
		# @return [KalturaFavorite]
		def add(favorite)
			kparams = {}
			client.add_param(kparams, 'favorite', favorite)
			client.queue_service_action_call('favorite', 'add', 'KalturaFavorite', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Remove media from user&#39;s favorite list
		# @return [bool]
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('favorite', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieving users&#39; favorites
		# @return [KalturaFavoriteListResponse]
		def list(filter=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('favorite', 'list', 'KalturaFavoriteListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaFollowTvSeriesService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add a user&#39;s tv series follow.
		#             Possible status codes: UserAlreadyFollowing = 8013, NotFound = 500007, InvalidAssetId = 4024
		# @return [KalturaFollowTvSeries]
		def add(follow_tv_series)
			kparams = {}
			client.add_param(kparams, 'followTvSeries', follow_tv_series)
			client.queue_service_action_call('followtvseries', 'add', 'KalturaFollowTvSeries', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete a user&#39;s tv series follow.
		#             Possible status codes: UserNotFollowing = 8012, NotFound = 500007, InvalidAssetId = 4024, AnnouncementNotFound = 8006
		# @return [bool]
		def delete(asset_id)
			kparams = {}
			client.add_param(kparams, 'assetId', asset_id)
			client.queue_service_action_call('followtvseries', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List user&#39;s tv series follows.
		#             Possible status codes:
		# @return [KalturaFollowTvSeriesListResponse]
		def list(filter, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('followtvseries', 'list', 'KalturaFollowTvSeriesListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaHomeNetworkService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add a new home network to a household
		# @return [KalturaHomeNetwork]
		def add(home_network)
			kparams = {}
			client.add_param(kparams, 'homeNetwork', home_network)
			client.queue_service_action_call('homenetwork', 'add', 'KalturaHomeNetwork', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete household’s existing home network
		# @return [bool]
		def delete(external_id)
			kparams = {}
			client.add_param(kparams, 'externalId', external_id)
			client.queue_service_action_call('homenetwork', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve the household’s home networks
		# @return [KalturaHomeNetworkListResponse]
		def list()
			kparams = {}
			client.queue_service_action_call('homenetwork', 'list', 'KalturaHomeNetworkListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update and existing home network for a household
		# @return [KalturaHomeNetwork]
		def update(external_id, home_network)
			kparams = {}
			client.add_param(kparams, 'externalId', external_id)
			client.add_param(kparams, 'homeNetwork', home_network)
			client.queue_service_action_call('homenetwork', 'update', 'KalturaHomeNetwork', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaHouseholdService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Creates a household for the user
		# @return [KalturaHousehold]
		def add(household)
			kparams = {}
			client.add_param(kparams, 'household', household)
			client.queue_service_action_call('household', 'add', 'KalturaHousehold', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Fully delete a household. Delete all of the household information, including users, devices, transactions and assets.
		# @return [bool]
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('household', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Returns the household model
		# @return [KalturaHousehold]
		def get(id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('household', 'get', 'KalturaHousehold', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Reset a household’s time limitation for removing user or device
		# @return [KalturaHousehold]
		def reset_frequency(frequency_type)
			kparams = {}
			client.add_param(kparams, 'frequencyType', frequency_type)
			client.queue_service_action_call('household', 'resetFrequency', 'KalturaHousehold', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Resumed a given household service to its previous service settings
		# @return [bool]
		def resume()
			kparams = {}
			client.queue_service_action_call('household', 'resume', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Suspend a given household service. Sets the household status to “suspended".The household service settings are maintained for later resume
		# @return [bool]
		def suspend()
			kparams = {}
			client.queue_service_action_call('household', 'suspend', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update the household name and description
		# @return [KalturaHousehold]
		def update(household)
			kparams = {}
			client.add_param(kparams, 'household', household)
			client.queue_service_action_call('household', 'update', 'KalturaHousehold', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaHouseholdDeviceService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Registers a device to a household using pin code
		# @return [KalturaHouseholdDevice]
		def add(device)
			kparams = {}
			client.add_param(kparams, 'device', device)
			client.queue_service_action_call('householddevice', 'add', 'KalturaHouseholdDevice', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Registers a device to a household using pin code
		# @return [KalturaHouseholdDevice]
		def add_by_pin(device_name, pin)
			kparams = {}
			client.add_param(kparams, 'deviceName', device_name)
			client.add_param(kparams, 'pin', pin)
			client.queue_service_action_call('householddevice', 'addByPin', 'KalturaHouseholdDevice', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Removes a device from household
		# @return [bool]
		def delete(udid)
			kparams = {}
			client.add_param(kparams, 'udid', udid)
			client.queue_service_action_call('householddevice', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Generates device pin to use when adding a device to household by pin
		# @return [KalturaDevicePin]
		def generate_pin(udid, brand_id)
			kparams = {}
			client.add_param(kparams, 'udid', udid)
			client.add_param(kparams, 'brandId', brand_id)
			client.queue_service_action_call('householddevice', 'generatePin', 'KalturaDevicePin', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Returns device registration status to the supplied household
		# @return [KalturaHouseholdDevice]
		def get()
			kparams = {}
			client.queue_service_action_call('householddevice', 'get', 'KalturaHouseholdDevice', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update the name of the device by UDID
		# @return [KalturaHouseholdDevice]
		def update(udid, device)
			kparams = {}
			client.add_param(kparams, 'udid', udid)
			client.add_param(kparams, 'device', device)
			client.queue_service_action_call('householddevice', 'update', 'KalturaHouseholdDevice', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update the name of the device by UDID
		# @return [bool]
		def update_status(udid, status)
			kparams = {}
			client.add_param(kparams, 'udid', udid)
			client.add_param(kparams, 'status', status)
			client.queue_service_action_call('householddevice', 'updateStatus', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaHouseholdLimitationsService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Get the limitation module by id
		# @return [KalturaHouseholdLimitations]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('householdlimitations', 'get', 'KalturaHouseholdLimitations', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaHouseholdPaymentGatewayService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Disable payment-gateway on the household
		# @return [bool]
		def delete(payment_gateway_id)
			kparams = {}
			client.add_param(kparams, 'paymentGatewayId', payment_gateway_id)
			client.queue_service_action_call('householdpaymentgateway', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Enable a payment-gateway provider for the household.
		# @return [bool]
		def set(payment_gateway_id)
			kparams = {}
			client.add_param(kparams, 'paymentGatewayId', payment_gateway_id)
			client.queue_service_action_call('householdpaymentgateway', 'set', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get a household’s billing account identifier (charge ID) for a given payment gateway
		# @return [string]
		def get_charge_id(payment_gateway_external_id)
			kparams = {}
			client.add_param(kparams, 'paymentGatewayExternalId', payment_gateway_external_id)
			client.queue_service_action_call('householdpaymentgateway', 'getChargeID', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Gets the Payment Gateway Configuration for the payment gateway identifier given
		# @return [KalturaPaymentGatewayConfiguration]
		def invoke(payment_gateway_id, intent, extra_parameters)
			kparams = {}
			client.add_param(kparams, 'paymentGatewayId', payment_gateway_id)
			client.add_param(kparams, 'intent', intent)
			client.add_param(kparams, 'extraParameters', extra_parameters)
			client.queue_service_action_call('householdpaymentgateway', 'invoke', 'KalturaPaymentGatewayConfiguration', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get a list of all configured Payment Gateways providers available for the account. For each payment is provided with the household associated payment methods.
		# @return [KalturaHouseholdPaymentGatewayListResponse]
		def list()
			kparams = {}
			client.queue_service_action_call('householdpaymentgateway', 'list', 'KalturaHouseholdPaymentGatewayListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Set user billing account identifier (charge ID), for a specific household and a specific payment gateway
		# @return [bool]
		def set_charge_id(payment_gateway_external_id, charge_id)
			kparams = {}
			client.add_param(kparams, 'paymentGatewayExternalId', payment_gateway_external_id)
			client.add_param(kparams, 'chargeId', charge_id)
			client.queue_service_action_call('householdpaymentgateway', 'setChargeID', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaHouseholdPaymentMethodService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Force remove of a payment method of the household.
		# @return [bool]
		def force_remove(payment_gateway_id, payment_method_id)
			kparams = {}
			client.add_param(kparams, 'paymentGatewayId', payment_gateway_id)
			client.add_param(kparams, 'paymentMethodId', payment_method_id)
			client.queue_service_action_call('householdpaymentmethod', 'forceRemove', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get a list of all configured Payment Gateways providers available for the account. For each payment is provided with the household associated payment methods.
		# @return [KalturaHouseholdPaymentMethodListResponse]
		def list()
			kparams = {}
			client.queue_service_action_call('householdpaymentmethod', 'list', 'KalturaHouseholdPaymentMethodListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Removes a payment method of the household.
		# @return [bool]
		def remove(payment_gateway_id, payment_method_id)
			kparams = {}
			client.add_param(kparams, 'paymentGatewayId', payment_gateway_id)
			client.add_param(kparams, 'paymentMethodId', payment_method_id)
			client.queue_service_action_call('householdpaymentmethod', 'remove', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Set a payment method as default for the household.
		# @return [bool]
		def set_as_default(payment_gateway_id, payment_method_id)
			kparams = {}
			client.add_param(kparams, 'paymentGatewayId', payment_gateway_id)
			client.add_param(kparams, 'paymentMethodId', payment_method_id)
			client.queue_service_action_call('householdpaymentmethod', 'setAsDefault', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaHouseholdPremiumServiceService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Returns all the premium services allowed for the household
		# @return [KalturaHouseholdPremiumServiceListResponse]
		def list()
			kparams = {}
			client.queue_service_action_call('householdpremiumservice', 'list', 'KalturaHouseholdPremiumServiceListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaHouseholdQuotaService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Returns the household&#39;s quota data
		# @return [KalturaHouseholdQuota]
		def get()
			kparams = {}
			client.queue_service_action_call('householdquota', 'get', 'KalturaHouseholdQuota', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaHouseholdUserService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Adds a user to household
		# @return [KalturaHouseholdUser]
		def add(household_user)
			kparams = {}
			client.add_param(kparams, 'householdUser', household_user)
			client.queue_service_action_call('householduser', 'add', 'KalturaHouseholdUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Removes a user from household
		# @return [bool]
		def delete(user_id)
			kparams = {}
			client.add_param(kparams, 'userId', user_id)
			client.queue_service_action_call('householduser', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaInboxMessageService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# TBD
		# @return [KalturaInboxMessage]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('inboxmessage', 'get', 'KalturaInboxMessage', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List inbox messages
		# @return [KalturaInboxMessageListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('inboxmessage', 'list', 'KalturaInboxMessageListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# TBD
		# @return [bool]
		def update_status(id, status)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'status', status)
			client.queue_service_action_call('inboxmessage', 'updateStatus', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaLicensedUrlService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Get the URL for playing an asset - EPG or media (not available for recording for now).
		# @return [KalturaLicensedUrl]
		def get(request)
			kparams = {}
			client.add_param(kparams, 'request', request)
			client.queue_service_action_call('licensedurl', 'get', 'KalturaLicensedUrl', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaMessageTemplateService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Retrieve a message template used in push notifications and inbox
		# @return [KalturaMessageTemplate]
		def get(asset_type)
			kparams = {}
			client.add_param(kparams, 'assetType', asset_type)
			client.queue_service_action_call('messagetemplate', 'get', 'KalturaMessageTemplate', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Set the account’s push notifications and inbox messages templates
		# @return [KalturaMessageTemplate]
		def update(asset_type, template)
			kparams = {}
			client.add_param(kparams, 'assetType', asset_type)
			client.add_param(kparams, 'template', template)
			client.queue_service_action_call('messagetemplate', 'update', 'KalturaMessageTemplate', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaNotificationService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# TBD
		# @return [bool]
		def initiate_cleanup()
			kparams = {}
			client.queue_service_action_call('notification', 'initiateCleanup', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# TBD
		# @return [KalturaRegistryResponse]
		def register(identifier, type)
			kparams = {}
			client.add_param(kparams, 'identifier', identifier)
			client.add_param(kparams, 'type', type)
			client.queue_service_action_call('notification', 'register', 'KalturaRegistryResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Registers the device push token to the push service
		# @return [bool]
		def set_device_push_token(push_token)
			kparams = {}
			client.add_param(kparams, 'pushToken', push_token)
			client.queue_service_action_call('notification', 'setDevicePushToken', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaNotificationsPartnerSettingsService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Retrieve the partner notification settings.
		# @return [KalturaNotificationsPartnerSettings]
		def get()
			kparams = {}
			client.queue_service_action_call('notificationspartnersettings', 'get', 'KalturaNotificationsPartnerSettings', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update the account notification settings
		# @return [bool]
		def update(settings)
			kparams = {}
			client.add_param(kparams, 'settings', settings)
			client.queue_service_action_call('notificationspartnersettings', 'update', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaNotificationsSettingsService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Retrieve the user’s notification settings.
		# @return [KalturaNotificationsSettings]
		def get()
			kparams = {}
			client.queue_service_action_call('notificationssettings', 'get', 'KalturaNotificationsSettings', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update the user’s notification settings.
		# @return [bool]
		def update(settings)
			kparams = {}
			client.add_param(kparams, 'settings', settings)
			client.queue_service_action_call('notificationssettings', 'update', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaOssAdapterProfileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Insert new OSS adapter for partner
		# @return [KalturaOSSAdapterProfile]
		def add(oss_adapter)
			kparams = {}
			client.add_param(kparams, 'ossAdapter', oss_adapter)
			client.queue_service_action_call('ossadapterprofile', 'add', 'KalturaOSSAdapterProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete OSS adapter by OSS adapter id
		# @return [bool]
		def delete(oss_adapter_id)
			kparams = {}
			client.add_param(kparams, 'ossAdapterId', oss_adapter_id)
			client.queue_service_action_call('ossadapterprofile', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Generate oss adapter shared secret
		# @return [KalturaOSSAdapterProfile]
		def generate_shared_secret(oss_adapter_id)
			kparams = {}
			client.add_param(kparams, 'ossAdapterId', oss_adapter_id)
			client.queue_service_action_call('ossadapterprofile', 'generateSharedSecret', 'KalturaOSSAdapterProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update OSS adapter details
		# @return [KalturaOSSAdapterProfile]
		def update(oss_adapter_id, oss_adapter)
			kparams = {}
			client.add_param(kparams, 'ossAdapterId', oss_adapter_id)
			client.add_param(kparams, 'ossAdapter', oss_adapter)
			client.queue_service_action_call('ossadapterprofile', 'update', 'KalturaOSSAdapterProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaOttCategoryService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Retrieve the list of categories (hierarchical) and their associated channels
		# @return [KalturaOTTCategory]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('ottcategory', 'get', 'KalturaOTTCategory', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaOttUserService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Activate the account by activation token
		# @return [KalturaOTTUser]
		def activate(partner_id, username, activation_token)
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'username', username)
			client.add_param(kparams, 'activationToken', activation_token)
			client.queue_service_action_call('ottuser', 'activate', 'KalturaOTTUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Edit user details.
		# @return [bool]
		def add_role(role_id)
			kparams = {}
			client.add_param(kparams, 'roleId', role_id)
			client.queue_service_action_call('ottuser', 'addRole', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Returns tokens (KS and refresh token) for anonymous access
		# @return [KalturaLoginSession]
		def anonymous_login(partner_id, udid=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'udid', udid)
			client.queue_service_action_call('ottuser', 'anonymousLogin', 'KalturaLoginSession', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Permanently delete a user. User to delete cannot be an exclusive household master, and cannot be default user.
		# @return [bool]
		def delete()
			kparams = {}
			client.queue_service_action_call('ottuser', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieving users&#39; data
		# @return [KalturaOTTUser]
		def get()
			kparams = {}
			client.queue_service_action_call('ottuser', 'get', 'KalturaOTTUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Resend the activation token to a user
		# @return [KalturaStringValue]
		def get_encrypted_user_id()
			kparams = {}
			client.queue_service_action_call('ottuser', 'getEncryptedUserId', 'KalturaStringValue', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve user by external identifier or username
		# @return [KalturaOTTUserListResponse]
		def list(filter)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('ottuser', 'list', 'KalturaOTTUserListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# User sign-in via a time-expired sign-in PIN.
		# @return [KalturaLoginResponse]
		def login(partner_id, username=KalturaNotImplemented, password=KalturaNotImplemented, extra_params=KalturaNotImplemented, udid=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'username', username)
			client.add_param(kparams, 'password', password)
			client.add_param(kparams, 'extraParams', extra_params)
			client.add_param(kparams, 'udid', udid)
			client.queue_service_action_call('ottuser', 'login', 'KalturaLoginResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# User sign-in via a time-expired sign-in PIN.
		# @return [KalturaLoginResponse]
		def login_with_pin(partner_id, pin, udid=KalturaNotImplemented, secret=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'pin', pin)
			client.add_param(kparams, 'udid', udid)
			client.add_param(kparams, 'secret', secret)
			client.queue_service_action_call('ottuser', 'loginWithPin', 'KalturaLoginResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Logout the calling user.
		# @return [bool]
		def logout()
			kparams = {}
			client.queue_service_action_call('ottuser', 'logout', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Returns new Kaltura session (ks) for the user, using the supplied refresh_token (only if it&#39;s valid and not expired)
		# @return [KalturaLoginSession]
		def refresh_session(refresh_token, udid=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'refreshToken', refresh_token)
			client.add_param(kparams, 'udid', udid)
			client.queue_service_action_call('ottuser', 'refreshSession', 'KalturaLoginSession', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Sign up a new user.
		# @return [KalturaOTTUser]
		def register(partner_id, user, password)
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'user', user)
			client.add_param(kparams, 'password', password)
			client.queue_service_action_call('ottuser', 'register', 'KalturaOTTUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Resend the activation token to a user
		# @return [bool]
		def resend_activation_token(partner_id, username)
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'username', username)
			client.queue_service_action_call('ottuser', 'resendActivationToken', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Send an e-mail with URL to enable the user to set new password.
		# @return [bool]
		def reset_password(partner_id, username)
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'username', username)
			client.queue_service_action_call('ottuser', 'resetPassword', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Renew the user&#39;s password after validating the token that sent as part of URL in e-mail.
		# @return [KalturaOTTUser]
		def set_initial_password(partner_id, token, password)
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'token', token)
			client.add_param(kparams, 'password', password)
			client.queue_service_action_call('ottuser', 'setInitialPassword', 'KalturaOTTUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Given a user name and existing password, change to a new password.
		# @return [KalturaOTTUser]
		def update(user)
			kparams = {}
			client.add_param(kparams, 'user', user)
			client.queue_service_action_call('ottuser', 'update', 'KalturaOTTUser', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Given a user name and existing password, change to a new password.
		# @return [bool]
		def update_login_data(username, old_password, new_password)
			kparams = {}
			client.add_param(kparams, 'username', username)
			client.add_param(kparams, 'oldPassword', old_password)
			client.add_param(kparams, 'newPassword', new_password)
			client.queue_service_action_call('ottuser', 'updateLoginData', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaParentalRuleService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Disables a parental rule that was previously defined by the household master. Disable can be at specific user or household level.
		# @return [bool]
		def disable(rule_id, entity_reference)
			kparams = {}
			client.add_param(kparams, 'ruleId', rule_id)
			client.add_param(kparams, 'entityReference', entity_reference)
			client.queue_service_action_call('parentalrule', 'disable', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Disables a parental rule that was defined at account level. Disable can be at specific user or household level.
		# @return [bool]
		def disable_default(entity_reference)
			kparams = {}
			client.add_param(kparams, 'entityReference', entity_reference)
			client.queue_service_action_call('parentalrule', 'disableDefault', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Enable a parental rules for a user
		# @return [bool]
		def enable(rule_id, entity_reference)
			kparams = {}
			client.add_param(kparams, 'ruleId', rule_id)
			client.add_param(kparams, 'entityReference', entity_reference)
			client.queue_service_action_call('parentalrule', 'enable', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Return the parental rules that applies for the user or household. Can include rules that have been associated in account, household, or user level.
		#             Association level is also specified in the response.
		# @return [KalturaParentalRuleListResponse]
		def list(filter)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('parentalrule', 'list', 'KalturaParentalRuleListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaPartnerConfigurationService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Update Partner Configuration
		# @return [bool]
		def update(configuration)
			kparams = {}
			client.add_param(kparams, 'configuration', configuration)
			client.queue_service_action_call('partnerconfiguration', 'update', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaPaymentGatewayProfileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Insert new payment gateway for partner
		# @return [KalturaPaymentGatewayProfile]
		def add(payment_gateway)
			kparams = {}
			client.add_param(kparams, 'paymentGateway', payment_gateway)
			client.queue_service_action_call('paymentgatewayprofile', 'add', 'KalturaPaymentGatewayProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete payment gateway by payment gateway id
		# @return [bool]
		def delete(payment_gateway_id)
			kparams = {}
			client.add_param(kparams, 'paymentGatewayId', payment_gateway_id)
			client.queue_service_action_call('paymentgatewayprofile', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Generate payment gateway shared secret
		# @return [KalturaPaymentGatewayProfile]
		def generate_shared_secret(payment_gateway_id)
			kparams = {}
			client.add_param(kparams, 'paymentGatewayId', payment_gateway_id)
			client.queue_service_action_call('paymentgatewayprofile', 'generateSharedSecret', 'KalturaPaymentGatewayProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Gets the Payment Gateway Configuration for the payment gateway identifier given
		# @return [KalturaPaymentGatewayConfiguration]
		def get_configuration(alias_param, intent, extra_parameters)
			kparams = {}
			client.add_param(kparams, 'alias', alias_param)
			client.add_param(kparams, 'intent', intent)
			client.add_param(kparams, 'extraParameters', extra_parameters)
			client.queue_service_action_call('paymentgatewayprofile', 'getConfiguration', 'KalturaPaymentGatewayConfiguration', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Returns all payment gateways for partner : id + name
		# @return [KalturaPaymentGatewayProfileListResponse]
		def list()
			kparams = {}
			client.queue_service_action_call('paymentgatewayprofile', 'list', 'KalturaPaymentGatewayProfileListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update payment gateway details
		# @return [KalturaPaymentGatewayProfile]
		def update(payment_gateway_id, payment_gateway)
			kparams = {}
			client.add_param(kparams, 'paymentGatewayId', payment_gateway_id)
			client.add_param(kparams, 'paymentGateway', payment_gateway)
			client.queue_service_action_call('paymentgatewayprofile', 'update', 'KalturaPaymentGatewayProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaPaymentMethodProfileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# TBD
		# @return [KalturaPaymentMethodProfile]
		def add(payment_method)
			kparams = {}
			client.add_param(kparams, 'paymentMethod', payment_method)
			client.queue_service_action_call('paymentmethodprofile', 'add', 'KalturaPaymentMethodProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete payment method profile
		# @return [bool]
		def delete(payment_method_id)
			kparams = {}
			client.add_param(kparams, 'paymentMethodId', payment_method_id)
			client.queue_service_action_call('paymentmethodprofile', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# TBD
		# @return [KalturaPaymentMethodProfileListResponse]
		def list(filter)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('paymentmethodprofile', 'list', 'KalturaPaymentMethodProfileListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update payment method
		# @return [KalturaPaymentMethodProfile]
		def update(payment_method_id, payment_method)
			kparams = {}
			client.add_param(kparams, 'paymentMethodId', payment_method_id)
			client.add_param(kparams, 'paymentMethod', payment_method)
			client.queue_service_action_call('paymentmethodprofile', 'update', 'KalturaPaymentMethodProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaPersonalFeedService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# List user&#39;s feeds.
		#             Possible status codes:
		# @return [KalturaPersonalFeedListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('personalfeed', 'list', 'KalturaPersonalFeedListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaPinService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Retrieve the parental or purchase PIN that applies for the household or user. Includes specification of where the PIN was defined at – account, household or user  level
		# @return [KalturaPin]
		def get(by, type, rule_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'by', by)
			client.add_param(kparams, 'type', type)
			client.add_param(kparams, 'ruleId', rule_id)
			client.queue_service_action_call('pin', 'get', 'KalturaPin', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Set the parental or purchase PIN that applies for the user or the household.
		# @return [KalturaPin]
		def update(by, type, pin, rule_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'by', by)
			client.add_param(kparams, 'type', type)
			client.add_param(kparams, 'pin', pin)
			client.add_param(kparams, 'ruleId', rule_id)
			client.queue_service_action_call('pin', 'update', 'KalturaPin', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Validate a purchase or parental PIN for a user.
		# @return [bool]
		def validate(pin, type, rule_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'pin', pin)
			client.add_param(kparams, 'type', type)
			client.add_param(kparams, 'ruleId', rule_id)
			client.queue_service_action_call('pin', 'validate', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaPpvService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Returns ppv object by internal identifier
		# @return [KalturaPpv]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('ppv', 'get', 'KalturaPpv', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaProductPriceService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Returns a price and a purchase status for each subscription or/and media file, for a given user (if passed) and with the consideration of a coupon code (if passed).
		# @return [KalturaProductPriceListResponse]
		def list(filter)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('productprice', 'list', 'KalturaProductPriceListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaPurchaseSettingsService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Retrieve the purchase settings.
		#             Includes specification of where these settings were defined – account, household or user
		# @return [KalturaPurchaseSettings]
		def get(by)
			kparams = {}
			client.add_param(kparams, 'by', by)
			client.queue_service_action_call('purchasesettings', 'get', 'KalturaPurchaseSettings', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Set a purchase PIN for the household or user
		# @return [KalturaPurchaseSettings]
		def update(entity_reference, settings)
			kparams = {}
			client.add_param(kparams, 'entityReference', entity_reference)
			client.add_param(kparams, 'settings', settings)
			client.queue_service_action_call('purchasesettings', 'update', 'KalturaPurchaseSettings', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaRecommendationProfileService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Insert new recommendation engine for partner
		# @return [KalturaRecommendationProfile]
		def add(recommendation_engine)
			kparams = {}
			client.add_param(kparams, 'recommendationEngine', recommendation_engine)
			client.queue_service_action_call('recommendationprofile', 'add', 'KalturaRecommendationProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete recommendation engine by recommendation engine id
		# @return [bool]
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('recommendationprofile', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Generate recommendation engine  shared secret
		# @return [KalturaRecommendationProfile]
		def generate_shared_secret(recommendation_engine_id)
			kparams = {}
			client.add_param(kparams, 'recommendationEngineId', recommendation_engine_id)
			client.queue_service_action_call('recommendationprofile', 'generateSharedSecret', 'KalturaRecommendationProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Returns all recommendation engines for partner
		# @return [KalturaRecommendationProfileListResponse]
		def list()
			kparams = {}
			client.queue_service_action_call('recommendationprofile', 'list', 'KalturaRecommendationProfileListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update recommendation engine details
		# @return [KalturaRecommendationProfile]
		def update(recommendation_engine_id, recommendation_engine)
			kparams = {}
			client.add_param(kparams, 'recommendationEngineId', recommendation_engine_id)
			client.add_param(kparams, 'recommendationEngine', recommendation_engine)
			client.queue_service_action_call('recommendationprofile', 'update', 'KalturaRecommendationProfile', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaRecordingService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Issue a record request for a program
		# @return [KalturaRecording]
		def add(recording)
			kparams = {}
			client.add_param(kparams, 'recording', recording)
			client.queue_service_action_call('recording', 'add', 'KalturaRecording', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Cancel a previously requested recording. Cancel recording can be called for recording in status Scheduled or Recording Only
		# @return [KalturaRecording]
		def cancel(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('recording', 'cancel', 'KalturaRecording', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete one or more user recording(s). Delete recording can be called only for recordings in status Recorded
		# @return [KalturaRecording]
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('recording', 'delete', 'KalturaRecording', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Returns recording object by internal identifier
		# @return [KalturaRecording]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('recording', 'get', 'KalturaRecording', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Return a list of recordings for the household with optional filter by status and KSQL.
		# @return [KalturaRecordingListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('recording', 'list', 'KalturaRecordingListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Protects an existing recording from the cleanup process for the defined protection period
		# @return [KalturaRecording]
		def protect(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('recording', 'protect', 'KalturaRecording', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaRegionService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Returns all regions for the partner
		# @return [KalturaRegionListResponse]
		def list(filter)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('region', 'list', 'KalturaRegionListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaRegistrySettingsService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Retrieve the registry settings.
		# @return [KalturaRegistrySettingsListResponse]
		def list()
			kparams = {}
			client.queue_service_action_call('registrysettings', 'list', 'KalturaRegistrySettingsListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaSeriesRecordingService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Issue a record request for a complete season or series
		# @return [KalturaSeriesRecording]
		def add(recording)
			kparams = {}
			client.add_param(kparams, 'recording', recording)
			client.queue_service_action_call('seriesrecording', 'add', 'KalturaSeriesRecording', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Cancel a previously requested series recording. Cancel series recording can be called for recording in status Scheduled or Recording Only
		# @return [KalturaSeriesRecording]
		def cancel(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('seriesrecording', 'cancel', 'KalturaSeriesRecording', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Cancel EPG recording that was recorded as part of series
		# @return [KalturaSeriesRecording]
		def cancel_by_epg_id(id, epg_id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'epgId', epg_id)
			client.queue_service_action_call('seriesrecording', 'cancelByEpgId', 'KalturaSeriesRecording', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Cancel Season recording epgs that was recorded as part of series
		# @return [KalturaSeriesRecording]
		def cancel_by_season_number(id, season_number)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'seasonNumber', season_number)
			client.queue_service_action_call('seriesrecording', 'cancelBySeasonNumber', 'KalturaSeriesRecording', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete series recording(s). Delete series recording can be called recordings in any status
		# @return [KalturaSeriesRecording]
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('seriesrecording', 'delete', 'KalturaSeriesRecording', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete Season recording epgs that was recorded as part of series
		# @return [KalturaSeriesRecording]
		def delete_by_season_number(id, season_number)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'seasonNumber', season_number)
			client.queue_service_action_call('seriesrecording', 'deleteBySeasonNumber', 'KalturaSeriesRecording', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Return a list of series recordings for the household with optional filter by status and KSQL.
		# @return [KalturaSeriesRecordingListResponse]
		def list(filter=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('seriesrecording', 'list', 'KalturaSeriesRecordingListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaSessionService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Parses KS
		# @return [KalturaSession]
		def get(session=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'session', session)
			client.queue_service_action_call('session', 'get', 'KalturaSession', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Switching the user in the session by generating a new session for a new user within the same household
		# @return [KalturaLoginSession]
		def switch_user(user_id_to_switch)
			kparams = {}
			client.add_param(kparams, 'userIdToSwitch', user_id_to_switch)
			client.queue_service_action_call('session', 'switchUser', 'KalturaLoginSession', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaSocialService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Return the user object with social information according to a provided external social token
		# @return [KalturaSocial]
		def get(type)
			kparams = {}
			client.add_param(kparams, 'type', type)
			client.queue_service_action_call('social', 'get', 'KalturaSocial', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Return the user object with social information according to a provided external social token
		# @return [KalturaSocial]
		def get_by_token(partner_id, token, type)
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'token', token)
			client.add_param(kparams, 'type', type)
			client.queue_service_action_call('social', 'getByToken', 'KalturaSocial', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Retrieve the social network’s configuration information
		# @return [KalturaSocialConfig]
		def get_configuration(partner_id, type)
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'type', type)
			client.queue_service_action_call('social', 'getConfiguration', 'KalturaSocialConfig', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Login using social token
		# @return [KalturaLoginResponse]
		def login(partner_id, token, type, udid=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'token', token)
			client.add_param(kparams, 'type', type)
			client.add_param(kparams, 'udid', udid)
			client.queue_service_action_call('social', 'login', 'KalturaLoginResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Connect an existing user in the system to an external social network user
		# @return [KalturaSocial]
		def merge(token, type)
			kparams = {}
			client.add_param(kparams, 'token', token)
			client.add_param(kparams, 'type', type)
			client.queue_service_action_call('social', 'merge', 'KalturaSocial', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Create a new user in the system using a provided external social token
		# @return [KalturaSocial]
		def register(partner_id, token, type)
			kparams = {}
			client.add_param(kparams, 'partnerId', partner_id)
			client.add_param(kparams, 'token', token)
			client.add_param(kparams, 'type', type)
			client.queue_service_action_call('social', 'register', 'KalturaSocial', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Disconnect an existing user in the system from its external social network user
		# @return [KalturaSocial]
		def unmerge(type)
			kparams = {}
			client.add_param(kparams, 'type', type)
			client.queue_service_action_call('social', 'unmerge', 'KalturaSocial', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaSubscriptionService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Returns a list of subscriptions requested by Subscription ID or file ID
		# @return [KalturaSubscriptionListResponse]
		def list(filter)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('subscription', 'list', 'KalturaSubscriptionListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaSystemService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Returns country details by the provided IP, if not provided - by the client IP
		# @return [KalturaCountry]
		def get_country(ip=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'ip', ip)
			client.queue_service_action_call('system', 'getCountry', 'KalturaCountry', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Returns current server timestamp
		# @return [bigint]
		def get_time()
			kparams = {}
			client.queue_service_action_call('system', 'getTime', 'bigint', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Returns current server version
		# @return [string]
		def get_version()
			kparams = {}
			client.queue_service_action_call('system', 'getVersion', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Returns true
		# @return [bool]
		def ping()
			kparams = {}
			client.queue_service_action_call('system', 'ping', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaTimeShiftedTvPartnerSettingsService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Retrieve the account’s time-shifted TV settings (catch-up and C-DVR, Trick-play, Start-over)
		# @return [KalturaTimeShiftedTvPartnerSettings]
		def get()
			kparams = {}
			client.queue_service_action_call('timeshiftedtvpartnersettings', 'get', 'KalturaTimeShiftedTvPartnerSettings', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Configure the account’s time-shifted TV settings (catch-up and C-DVR, Trick-play, Start-over)
		# @return [bool]
		def update(settings)
			kparams = {}
			client.add_param(kparams, 'settings', settings)
			client.queue_service_action_call('timeshiftedtvpartnersettings', 'update', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaTopicService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# TBD
		# @return [bool]
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('topic', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# TBD
		# @return [KalturaTopic]
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('topic', 'get', 'KalturaTopic', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# TBD
		# @return [KalturaTopicListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('topic', 'list', 'KalturaTopicListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# TBD
		# @return [bool]
		def update_status(id, automatic_issue_notification)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'automaticIssueNotification', automatic_issue_notification)
			client.queue_service_action_call('topic', 'updateStatus', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaTransactionService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Retrieve the purchase session identifier
		# @return [bigint]
		def get_purchase_session_id(purchase_session)
			kparams = {}
			client.add_param(kparams, 'purchaseSession', purchase_session)
			client.queue_service_action_call('transaction', 'getPurchaseSessionId', 'bigint', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Purchase specific product or subscription for a household. Upon successful charge entitlements to use the requested product or subscription are granted.
		# @return [KalturaTransaction]
		def purchase(purchase)
			kparams = {}
			client.add_param(kparams, 'purchase', purchase)
			client.queue_service_action_call('transaction', 'purchase', 'KalturaTransaction', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# This method shall set the waiver flag on the user entitlement table and the waiver date field to the current date.
		# @return [bool]
		def set_waiver(asset_id, transaction_type)
			kparams = {}
			client.add_param(kparams, 'assetId', asset_id)
			client.add_param(kparams, 'transactionType', transaction_type)
			client.queue_service_action_call('transaction', 'setWaiver', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Updates a pending purchase transaction state.
		# @return []
		def update_status(payment_gateway_id, external_transaction_id, signature, status)
			kparams = {}
			client.add_param(kparams, 'paymentGatewayId', payment_gateway_id)
			client.add_param(kparams, 'externalTransactionId', external_transaction_id)
			client.add_param(kparams, 'signature', signature)
			client.add_param(kparams, 'status', status)
			client.queue_service_action_call('transaction', 'updateStatus', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Verifies PPV/Subscription/Collection client purchase (such as InApp) and entitles the user.
		# @return [KalturaTransaction]
		def validate_receipt(external_receipt)
			kparams = {}
			client.add_param(kparams, 'externalReceipt', external_receipt)
			client.queue_service_action_call('transaction', 'validateReceipt', 'KalturaTransaction', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaTransactionHistoryService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Gets user or household transaction history.
		# @return [KalturaBillingTransactionListResponse]
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('transactionhistory', 'list', 'KalturaBillingTransactionListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaUserAssetRuleService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Retrieve all the rules (parental, geo, device or user-type) that applies for this user and asset.
		# @return [KalturaUserAssetRuleListResponse]
		def list(filter)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('userassetrule', 'list', 'KalturaUserAssetRuleListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaUserAssetsListItemService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Adds a new item to user’s private asset list
		# @return [KalturaUserAssetsListItem]
		def add(user_assets_list_item)
			kparams = {}
			client.add_param(kparams, 'userAssetsListItem', user_assets_list_item)
			client.queue_service_action_call('userassetslistitem', 'add', 'KalturaUserAssetsListItem', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Deletes an item from user’s private asset list
		# @return [bool]
		def delete(asset_id, list_type)
			kparams = {}
			client.add_param(kparams, 'assetId', asset_id)
			client.add_param(kparams, 'listType', list_type)
			client.queue_service_action_call('userassetslistitem', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get an item from user’s private asset list
		# @return [KalturaUserAssetsListItem]
		def get(asset_id, list_type, item_type)
			kparams = {}
			client.add_param(kparams, 'assetId', asset_id)
			client.add_param(kparams, 'listType', list_type)
			client.add_param(kparams, 'itemType', item_type)
			client.queue_service_action_call('userassetslistitem', 'get', 'KalturaUserAssetsListItem', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaUserLoginPinService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Generate a time and usage expiry login-PIN that can allow a single login per PIN. If an active login-PIN already exists. Calling this API again for same user will add another login-PIN
		# @return [KalturaUserLoginPin]
		def add(secret=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'secret', secret)
			client.queue_service_action_call('userloginpin', 'add', 'KalturaUserLoginPin', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Immediately expire all active login-PINs for a user
		# @return [bool]
		def delete(pin_code)
			kparams = {}
			client.add_param(kparams, 'pinCode', pin_code)
			client.queue_service_action_call('userloginpin', 'delete', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Immediately expire all active login-PINs for a user
		# @return [bool]
		def delete_all()
			kparams = {}
			client.queue_service_action_call('userloginpin', 'deleteAll', 'bool', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Set a time and usage expiry login-PIN that can allow a single login per PIN. If an active login-PIN already exists. Calling this API again for same user will add another login-PIN
		# @return [KalturaUserLoginPin]
		def update(pin_code, secret=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'pinCode', pin_code)
			client.add_param(kparams, 'secret', secret)
			client.queue_service_action_call('userloginpin', 'update', 'KalturaUserLoginPin', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaUserRoleService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Retrieving user roles by identifiers, if filter is empty, returns all partner roles
		# @return [KalturaUserRoleListResponse]
		def list(filter=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.queue_service_action_call('userrole', 'list', 'KalturaUserRoleListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :announcement_service
		def announcement_service
			if (@announcement_service == nil)
				@announcement_service = KalturaAnnouncementService.new(self)
			end
			return @announcement_service
		end
		
		attr_reader :app_token_service
		def app_token_service
			if (@app_token_service == nil)
				@app_token_service = KalturaAppTokenService.new(self)
			end
			return @app_token_service
		end
		
		attr_reader :asset_comment_service
		def asset_comment_service
			if (@asset_comment_service == nil)
				@asset_comment_service = KalturaAssetCommentService.new(self)
			end
			return @asset_comment_service
		end
		
		attr_reader :asset_service
		def asset_service
			if (@asset_service == nil)
				@asset_service = KalturaAssetService.new(self)
			end
			return @asset_service
		end
		
		attr_reader :asset_file_service
		def asset_file_service
			if (@asset_file_service == nil)
				@asset_file_service = KalturaAssetFileService.new(self)
			end
			return @asset_file_service
		end
		
		attr_reader :asset_history_service
		def asset_history_service
			if (@asset_history_service == nil)
				@asset_history_service = KalturaAssetHistoryService.new(self)
			end
			return @asset_history_service
		end
		
		attr_reader :asset_statistics_service
		def asset_statistics_service
			if (@asset_statistics_service == nil)
				@asset_statistics_service = KalturaAssetStatisticsService.new(self)
			end
			return @asset_statistics_service
		end
		
		attr_reader :bookmark_service
		def bookmark_service
			if (@bookmark_service == nil)
				@bookmark_service = KalturaBookmarkService.new(self)
			end
			return @bookmark_service
		end
		
		attr_reader :cdn_adapter_profile_service
		def cdn_adapter_profile_service
			if (@cdn_adapter_profile_service == nil)
				@cdn_adapter_profile_service = KalturaCdnAdapterProfileService.new(self)
			end
			return @cdn_adapter_profile_service
		end
		
		attr_reader :cdn_partner_settings_service
		def cdn_partner_settings_service
			if (@cdn_partner_settings_service == nil)
				@cdn_partner_settings_service = KalturaCdnPartnerSettingsService.new(self)
			end
			return @cdn_partner_settings_service
		end
		
		attr_reader :c_dvr_adapter_profile_service
		def c_dvr_adapter_profile_service
			if (@c_dvr_adapter_profile_service == nil)
				@c_dvr_adapter_profile_service = KalturaCDVRAdapterProfileService.new(self)
			end
			return @c_dvr_adapter_profile_service
		end
		
		attr_reader :channel_service
		def channel_service
			if (@channel_service == nil)
				@channel_service = KalturaChannelService.new(self)
			end
			return @channel_service
		end
		
		attr_reader :coupon_service
		def coupon_service
			if (@coupon_service == nil)
				@coupon_service = KalturaCouponService.new(self)
			end
			return @coupon_service
		end
		
		attr_reader :entitlement_service
		def entitlement_service
			if (@entitlement_service == nil)
				@entitlement_service = KalturaEntitlementService.new(self)
			end
			return @entitlement_service
		end
		
		attr_reader :export_task_service
		def export_task_service
			if (@export_task_service == nil)
				@export_task_service = KalturaExportTaskService.new(self)
			end
			return @export_task_service
		end
		
		attr_reader :external_channel_profile_service
		def external_channel_profile_service
			if (@external_channel_profile_service == nil)
				@external_channel_profile_service = KalturaExternalChannelProfileService.new(self)
			end
			return @external_channel_profile_service
		end
		
		attr_reader :favorite_service
		def favorite_service
			if (@favorite_service == nil)
				@favorite_service = KalturaFavoriteService.new(self)
			end
			return @favorite_service
		end
		
		attr_reader :follow_tv_series_service
		def follow_tv_series_service
			if (@follow_tv_series_service == nil)
				@follow_tv_series_service = KalturaFollowTvSeriesService.new(self)
			end
			return @follow_tv_series_service
		end
		
		attr_reader :home_network_service
		def home_network_service
			if (@home_network_service == nil)
				@home_network_service = KalturaHomeNetworkService.new(self)
			end
			return @home_network_service
		end
		
		attr_reader :household_service
		def household_service
			if (@household_service == nil)
				@household_service = KalturaHouseholdService.new(self)
			end
			return @household_service
		end
		
		attr_reader :household_device_service
		def household_device_service
			if (@household_device_service == nil)
				@household_device_service = KalturaHouseholdDeviceService.new(self)
			end
			return @household_device_service
		end
		
		attr_reader :household_limitations_service
		def household_limitations_service
			if (@household_limitations_service == nil)
				@household_limitations_service = KalturaHouseholdLimitationsService.new(self)
			end
			return @household_limitations_service
		end
		
		attr_reader :household_payment_gateway_service
		def household_payment_gateway_service
			if (@household_payment_gateway_service == nil)
				@household_payment_gateway_service = KalturaHouseholdPaymentGatewayService.new(self)
			end
			return @household_payment_gateway_service
		end
		
		attr_reader :household_payment_method_service
		def household_payment_method_service
			if (@household_payment_method_service == nil)
				@household_payment_method_service = KalturaHouseholdPaymentMethodService.new(self)
			end
			return @household_payment_method_service
		end
		
		attr_reader :household_premium_service_service
		def household_premium_service_service
			if (@household_premium_service_service == nil)
				@household_premium_service_service = KalturaHouseholdPremiumServiceService.new(self)
			end
			return @household_premium_service_service
		end
		
		attr_reader :household_quota_service
		def household_quota_service
			if (@household_quota_service == nil)
				@household_quota_service = KalturaHouseholdQuotaService.new(self)
			end
			return @household_quota_service
		end
		
		attr_reader :household_user_service
		def household_user_service
			if (@household_user_service == nil)
				@household_user_service = KalturaHouseholdUserService.new(self)
			end
			return @household_user_service
		end
		
		attr_reader :inbox_message_service
		def inbox_message_service
			if (@inbox_message_service == nil)
				@inbox_message_service = KalturaInboxMessageService.new(self)
			end
			return @inbox_message_service
		end
		
		attr_reader :licensed_url_service
		def licensed_url_service
			if (@licensed_url_service == nil)
				@licensed_url_service = KalturaLicensedUrlService.new(self)
			end
			return @licensed_url_service
		end
		
		attr_reader :message_template_service
		def message_template_service
			if (@message_template_service == nil)
				@message_template_service = KalturaMessageTemplateService.new(self)
			end
			return @message_template_service
		end
		
		attr_reader :notification_service
		def notification_service
			if (@notification_service == nil)
				@notification_service = KalturaNotificationService.new(self)
			end
			return @notification_service
		end
		
		attr_reader :notifications_partner_settings_service
		def notifications_partner_settings_service
			if (@notifications_partner_settings_service == nil)
				@notifications_partner_settings_service = KalturaNotificationsPartnerSettingsService.new(self)
			end
			return @notifications_partner_settings_service
		end
		
		attr_reader :notifications_settings_service
		def notifications_settings_service
			if (@notifications_settings_service == nil)
				@notifications_settings_service = KalturaNotificationsSettingsService.new(self)
			end
			return @notifications_settings_service
		end
		
		attr_reader :oss_adapter_profile_service
		def oss_adapter_profile_service
			if (@oss_adapter_profile_service == nil)
				@oss_adapter_profile_service = KalturaOssAdapterProfileService.new(self)
			end
			return @oss_adapter_profile_service
		end
		
		attr_reader :ott_category_service
		def ott_category_service
			if (@ott_category_service == nil)
				@ott_category_service = KalturaOttCategoryService.new(self)
			end
			return @ott_category_service
		end
		
		attr_reader :ott_user_service
		def ott_user_service
			if (@ott_user_service == nil)
				@ott_user_service = KalturaOttUserService.new(self)
			end
			return @ott_user_service
		end
		
		attr_reader :parental_rule_service
		def parental_rule_service
			if (@parental_rule_service == nil)
				@parental_rule_service = KalturaParentalRuleService.new(self)
			end
			return @parental_rule_service
		end
		
		attr_reader :partner_configuration_service
		def partner_configuration_service
			if (@partner_configuration_service == nil)
				@partner_configuration_service = KalturaPartnerConfigurationService.new(self)
			end
			return @partner_configuration_service
		end
		
		attr_reader :payment_gateway_profile_service
		def payment_gateway_profile_service
			if (@payment_gateway_profile_service == nil)
				@payment_gateway_profile_service = KalturaPaymentGatewayProfileService.new(self)
			end
			return @payment_gateway_profile_service
		end
		
		attr_reader :payment_method_profile_service
		def payment_method_profile_service
			if (@payment_method_profile_service == nil)
				@payment_method_profile_service = KalturaPaymentMethodProfileService.new(self)
			end
			return @payment_method_profile_service
		end
		
		attr_reader :personal_feed_service
		def personal_feed_service
			if (@personal_feed_service == nil)
				@personal_feed_service = KalturaPersonalFeedService.new(self)
			end
			return @personal_feed_service
		end
		
		attr_reader :pin_service
		def pin_service
			if (@pin_service == nil)
				@pin_service = KalturaPinService.new(self)
			end
			return @pin_service
		end
		
		attr_reader :ppv_service
		def ppv_service
			if (@ppv_service == nil)
				@ppv_service = KalturaPpvService.new(self)
			end
			return @ppv_service
		end
		
		attr_reader :product_price_service
		def product_price_service
			if (@product_price_service == nil)
				@product_price_service = KalturaProductPriceService.new(self)
			end
			return @product_price_service
		end
		
		attr_reader :purchase_settings_service
		def purchase_settings_service
			if (@purchase_settings_service == nil)
				@purchase_settings_service = KalturaPurchaseSettingsService.new(self)
			end
			return @purchase_settings_service
		end
		
		attr_reader :recommendation_profile_service
		def recommendation_profile_service
			if (@recommendation_profile_service == nil)
				@recommendation_profile_service = KalturaRecommendationProfileService.new(self)
			end
			return @recommendation_profile_service
		end
		
		attr_reader :recording_service
		def recording_service
			if (@recording_service == nil)
				@recording_service = KalturaRecordingService.new(self)
			end
			return @recording_service
		end
		
		attr_reader :region_service
		def region_service
			if (@region_service == nil)
				@region_service = KalturaRegionService.new(self)
			end
			return @region_service
		end
		
		attr_reader :registry_settings_service
		def registry_settings_service
			if (@registry_settings_service == nil)
				@registry_settings_service = KalturaRegistrySettingsService.new(self)
			end
			return @registry_settings_service
		end
		
		attr_reader :series_recording_service
		def series_recording_service
			if (@series_recording_service == nil)
				@series_recording_service = KalturaSeriesRecordingService.new(self)
			end
			return @series_recording_service
		end
		
		attr_reader :session_service
		def session_service
			if (@session_service == nil)
				@session_service = KalturaSessionService.new(self)
			end
			return @session_service
		end
		
		attr_reader :social_service
		def social_service
			if (@social_service == nil)
				@social_service = KalturaSocialService.new(self)
			end
			return @social_service
		end
		
		attr_reader :subscription_service
		def subscription_service
			if (@subscription_service == nil)
				@subscription_service = KalturaSubscriptionService.new(self)
			end
			return @subscription_service
		end
		
		attr_reader :system_service
		def system_service
			if (@system_service == nil)
				@system_service = KalturaSystemService.new(self)
			end
			return @system_service
		end
		
		attr_reader :time_shifted_tv_partner_settings_service
		def time_shifted_tv_partner_settings_service
			if (@time_shifted_tv_partner_settings_service == nil)
				@time_shifted_tv_partner_settings_service = KalturaTimeShiftedTvPartnerSettingsService.new(self)
			end
			return @time_shifted_tv_partner_settings_service
		end
		
		attr_reader :topic_service
		def topic_service
			if (@topic_service == nil)
				@topic_service = KalturaTopicService.new(self)
			end
			return @topic_service
		end
		
		attr_reader :transaction_service
		def transaction_service
			if (@transaction_service == nil)
				@transaction_service = KalturaTransactionService.new(self)
			end
			return @transaction_service
		end
		
		attr_reader :transaction_history_service
		def transaction_history_service
			if (@transaction_history_service == nil)
				@transaction_history_service = KalturaTransactionHistoryService.new(self)
			end
			return @transaction_history_service
		end
		
		attr_reader :user_asset_rule_service
		def user_asset_rule_service
			if (@user_asset_rule_service == nil)
				@user_asset_rule_service = KalturaUserAssetRuleService.new(self)
			end
			return @user_asset_rule_service
		end
		
		attr_reader :user_assets_list_item_service
		def user_assets_list_item_service
			if (@user_assets_list_item_service == nil)
				@user_assets_list_item_service = KalturaUserAssetsListItemService.new(self)
			end
			return @user_assets_list_item_service
		end
		
		attr_reader :user_login_pin_service
		def user_login_pin_service
			if (@user_login_pin_service == nil)
				@user_login_pin_service = KalturaUserLoginPinService.new(self)
			end
			return @user_login_pin_service
		end
		
		attr_reader :user_role_service
		def user_role_service
			if (@user_role_service == nil)
				@user_role_service = KalturaUserRoleService.new(self)
			end
			return @user_role_service
		end
		
		def initialize(client)
			super(client)
			self.client_tag = 'ruby:17-07-06'
			self.api_version = '3.6.287.20330'
		end
		
		def client_tag=(value)
			@client_configuration['clientTag'] = value
		end
		
		def set_client_tag(value)
			self.client_tag = value
		end
		
		def client_tag()
			if(@client_configuration.has_key?('clientTag'))
				return @client_configuration['clientTag']
			end
			
			return KalturaNotImplemented
		end
		
		def get_client_tag()
			return self.client_tag
		end
		
	
		def api_version=(value)
			@client_configuration['apiVersion'] = value
		end
		
		def set_api_version(value)
			self.api_version = value
		end
		
		def api_version()
			if(@client_configuration.has_key?('apiVersion'))
				return @client_configuration['apiVersion']
			end
			
			return KalturaNotImplemented
		end
		
		def get_api_version()
			return self.api_version
		end
		
	
		def partner_id=(value)
			@request_configuration['partnerId'] = value
		end
		
		def set_partner_id(value)
			self.partner_id = value
		end
		
		def partner_id()
			if(@request_configuration.has_key?('partnerId'))
				return @request_configuration['partnerId']
			end
			
			return KalturaNotImplemented
		end
		
		def get_partner_id()
			return self.partner_id
		end
		
	
		def user_id=(value)
			@request_configuration['userId'] = value
		end
		
		def set_user_id(value)
			self.user_id = value
		end
		
		def user_id()
			if(@request_configuration.has_key?('userId'))
				return @request_configuration['userId']
			end
			
			return KalturaNotImplemented
		end
		
		def get_user_id()
			return self.user_id
		end
		
	
		def language=(value)
			@request_configuration['language'] = value
		end
		
		def set_language(value)
			self.language = value
		end
		
		def language()
			if(@request_configuration.has_key?('language'))
				return @request_configuration['language']
			end
			
			return KalturaNotImplemented
		end
		
		def get_language()
			return self.language
		end
		
	
		def ks=(value)
			@request_configuration['ks'] = value
		end
		
		def set_ks(value)
			self.ks = value
		end
		
		def ks()
			if(@request_configuration.has_key?('ks'))
				return @request_configuration['ks']
			end
			
			return KalturaNotImplemented
		end
		
		def get_ks()
			return self.ks
		end
		
	
		def session_id=(value)
			@request_configuration['ks'] = value
		end
		
		def set_session_id(value)
			self.session_id = value
		end
		
		def session_id()
			if(@request_configuration.has_key?('ks'))
				return @request_configuration['ks']
			end
			
			return KalturaNotImplemented
		end
		
		def get_session_id()
			return self.session_id
		end
		
	
		def reset_request()
			super
		end
	end

end
