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
require 'kaltura_enums.rb'

module Kaltura

	class KalturaAnnouncement < KalturaObjectBase
		attr_accessor :name
		attr_accessor :message
		attr_accessor :enabled
		attr_accessor :start_time
		attr_accessor :timezone
		attr_accessor :status
		attr_accessor :recipients
		attr_accessor :id

		def enabled=(val)
			@enabled = to_b(val)
		end
		def start_time=(val)
			@start_time = val.to_i
		end
		def id=(val)
			@id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['message'] != nil
				self.message = xml_element.elements['message'].text
			end
			if xml_element.elements['enabled'] != nil
				self.enabled = xml_element.elements['enabled'].text
			end
			if xml_element.elements['startTime'] != nil
				self.start_time = xml_element.elements['startTime'].text
			end
			if xml_element.elements['timezone'] != nil
				self.timezone = xml_element.elements['timezone'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['recipients'] != nil
				self.recipients = xml_element.elements['recipients'].text
			end
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
		end

	end

	class KalturaFilter < KalturaObjectBase
		attr_accessor :order_by

		def order_by=(val)
			@order_by = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['orderBy'] != nil
				self.order_by = xml_element.elements['orderBy'].text
			end
		end

	end

	class KalturaAnnouncementFilter < KalturaFilter


		def from_xml(xml_element)
			super
		end

	end

	# The KalturaFilterPager object enables paging management to be applied upon service list actions
	class KalturaFilterPager < KalturaObjectBase
		# The number of objects to retrieve. Possible range 1 ≤ value ≤ 50. If omitted or value < 1 - will be set to 25. If a value > 50 provided – will be set to 50
		attr_accessor :page_size
		# The page number for which {pageSize} of objects should be retrieved
		attr_accessor :page_index

		def page_size=(val)
			@page_size = val.to_i
		end
		def page_index=(val)
			@page_index = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['pageSize'] != nil
				self.page_size = xml_element.elements['pageSize'].text
			end
			if xml_element.elements['pageIndex'] != nil
				self.page_index = xml_element.elements['pageIndex'].text
			end
		end

	end

	# Base list wrapper
	class KalturaListResponse < KalturaObjectBase
		# Total items
		attr_accessor :total_count

		def total_count=(val)
			@total_count = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['totalCount'] != nil
				self.total_count = xml_element.elements['totalCount'].text
			end
		end

	end

	class KalturaRegionalChannel < KalturaObjectBase
		# The identifier of the linear media representing the channel
		attr_accessor :linear_channel_id
		# The number of the channel
		attr_accessor :channel_number

		def linear_channel_id=(val)
			@linear_channel_id = val.to_i
		end
		def channel_number=(val)
			@channel_number = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['linearChannelId'] != nil
				self.linear_channel_id = xml_element.elements['linearChannelId'].text
			end
			if xml_element.elements['channelNumber'] != nil
				self.channel_number = xml_element.elements['channelNumber'].text
			end
		end

	end

	class KalturaRegion < KalturaObjectBase
		# Region identifier
		attr_accessor :id
		# Region name
		attr_accessor :name
		# Region external identifier
		attr_accessor :external_id
		# Indicates whether this is the default region for the partner
		attr_accessor :is_default
		# List of associated linear channels
		attr_accessor :linear_channels

		def id=(val)
			@id = val.to_i
		end
		def is_default=(val)
			@is_default = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['externalId'] != nil
				self.external_id = xml_element.elements['externalId'].text
			end
			if xml_element.elements['isDefault'] != nil
				self.is_default = xml_element.elements['isDefault'].text
			end
			if xml_element.elements['linearChannels'] != nil
				self.linear_channels = KalturaClientBase.object_from_xml(xml_element.elements['linearChannels'], 'KalturaRegionalChannel')
			end
		end

	end

	# Regions list
	class KalturaRegionListResponse < KalturaListResponse
		# A list of regions
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaRegion')
			end
		end

	end

	# User asset rule - representing different type of rules on an asset(Parental, Geo, User Type, Device)
	class KalturaUserAssetRule < KalturaObjectBase
		# Unique rule identifier
		attr_accessor :id
		# Rule type - possible values: Rule type – Parental, Geo, UserType, Device
		attr_accessor :rule_type
		# Rule display name
		attr_accessor :name
		# Additional description for the specific rule
		attr_accessor :description

		def id=(val)
			@id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['ruleType'] != nil
				self.rule_type = xml_element.elements['ruleType'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
		end

	end

	# GenericRules list
	class KalturaUserAssetRuleListResponse < KalturaListResponse
		# A list of generic rules
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaUserAssetRule')
			end
		end

	end

	# A representation to return an array of values
	class KalturaValue < KalturaObjectBase
		attr_accessor :description


		def from_xml(xml_element)
			super
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
		end

	end

	# A string representation to return an array of longs
	class KalturaLongValue < KalturaValue
		attr_accessor :value

		def value=(val)
			@value = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	# A string representation to return an array of doubles
	class KalturaDoubleValue < KalturaValue
		attr_accessor :value

		def value=(val)
			@value = val.to_f
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	# A string representation to return an array of booleans
	class KalturaBooleanValue < KalturaValue
		attr_accessor :value

		def value=(val)
			@value = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	# A string representation to return an array of ints
	class KalturaIntegerValue < KalturaValue
		attr_accessor :value

		def value=(val)
			@value = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	# A string representation to return an array of strings
	class KalturaStringValue < KalturaValue
		attr_accessor :value


		def from_xml(xml_element)
			super
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	# CDN Adapter
	class KalturaCDNAdapterProfile < KalturaObjectBase
		# CDN adapter identifier
		attr_accessor :id
		# CDNR adapter name
		attr_accessor :name
		# CDN adapter active status
		attr_accessor :is_active
		# CDN adapter URL
		attr_accessor :adapter_url
		# CDN adapter base URL
		attr_accessor :base_url
		# CDN adapter settings
		attr_accessor :settings
		# CDN adapter alias
		attr_accessor :system_name
		# CDN shared secret
		attr_accessor :shared_secret

		def id=(val)
			@id = val.to_i
		end
		def is_active=(val)
			@is_active = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['isActive'] != nil
				self.is_active = xml_element.elements['isActive'].text
			end
			if xml_element.elements['adapterUrl'] != nil
				self.adapter_url = xml_element.elements['adapterUrl'].text
			end
			if xml_element.elements['baseUrl'] != nil
				self.base_url = xml_element.elements['baseUrl'].text
			end
			if xml_element.elements['settings'] != nil
				self.settings = KalturaClientBase.object_from_xml(xml_element.elements['settings'], 'KalturaStringValue')
			end
			if xml_element.elements['systemName'] != nil
				self.system_name = xml_element.elements['systemName'].text
			end
			if xml_element.elements['sharedSecret'] != nil
				self.shared_secret = xml_element.elements['sharedSecret'].text
			end
		end

	end

	class KalturaCDNAdapterProfileListResponse < KalturaListResponse
		# Adapters
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaCDNAdapterProfile')
			end
		end

	end

	# Slim Asset Details
	class KalturaSlimAsset < KalturaObjectBase
		# Internal identifier of the asset
		attr_accessor :id
		# The type of the asset. Possible values: media, recording, epg
		attr_accessor :type


		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
		end

	end

	# Slim user data
	class KalturaBaseOTTUser < KalturaObjectBase
		# User identifier
		attr_accessor :id
		# Username
		attr_accessor :username
		# First name
		attr_accessor :first_name
		# Last name
		attr_accessor :last_name


		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['username'] != nil
				self.username = xml_element.elements['username'].text
			end
			if xml_element.elements['firstName'] != nil
				self.first_name = xml_element.elements['firstName'].text
			end
			if xml_element.elements['lastName'] != nil
				self.last_name = xml_element.elements['lastName'].text
			end
		end

	end

	# Country details
	class KalturaCountry < KalturaObjectBase
		# Country identifier
		attr_accessor :id
		# Country name
		attr_accessor :name
		# Country code
		attr_accessor :code

		def id=(val)
			@id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['code'] != nil
				self.code = xml_element.elements['code'].text
			end
		end

	end

	# User type
	class KalturaOTTUserType < KalturaObjectBase
		# User type identifier
		attr_accessor :id
		# User type description
		attr_accessor :description

		def id=(val)
			@id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
		end

	end

	# User
	class KalturaOTTUser < KalturaBaseOTTUser
		# Household identifier
		attr_accessor :household_id
		# Email
		attr_accessor :email
		# Address
		attr_accessor :address
		# City
		attr_accessor :city
		# Country
		attr_accessor :country
		# Zip code
		attr_accessor :zip
		# Phone
		attr_accessor :phone
		# Affiliate code
		attr_accessor :affiliate_code
		# External user identifier
		attr_accessor :external_id
		# User type
		attr_accessor :user_type
		# Dynamic data
		attr_accessor :dynamic_data
		# Is the user the household master
		attr_accessor :is_household_master
		# Suspention state
		attr_accessor :suspention_state
		# User state
		attr_accessor :user_state

		def household_id=(val)
			@household_id = val.to_i
		end
		def is_household_master=(val)
			@is_household_master = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['householdId'] != nil
				self.household_id = xml_element.elements['householdId'].text
			end
			if xml_element.elements['email'] != nil
				self.email = xml_element.elements['email'].text
			end
			if xml_element.elements['address'] != nil
				self.address = xml_element.elements['address'].text
			end
			if xml_element.elements['city'] != nil
				self.city = xml_element.elements['city'].text
			end
			if xml_element.elements['country'] != nil
				self.country = KalturaClientBase.object_from_xml(xml_element.elements['country'], 'KalturaCountry')
			end
			if xml_element.elements['zip'] != nil
				self.zip = xml_element.elements['zip'].text
			end
			if xml_element.elements['phone'] != nil
				self.phone = xml_element.elements['phone'].text
			end
			if xml_element.elements['affiliateCode'] != nil
				self.affiliate_code = xml_element.elements['affiliateCode'].text
			end
			if xml_element.elements['externalId'] != nil
				self.external_id = xml_element.elements['externalId'].text
			end
			if xml_element.elements['userType'] != nil
				self.user_type = KalturaClientBase.object_from_xml(xml_element.elements['userType'], 'KalturaOTTUserType')
			end
			if xml_element.elements['dynamicData'] != nil
				self.dynamic_data = KalturaClientBase.object_from_xml(xml_element.elements['dynamicData'], 'KalturaStringValue')
			end
			if xml_element.elements['isHouseholdMaster'] != nil
				self.is_household_master = xml_element.elements['isHouseholdMaster'].text
			end
			if xml_element.elements['suspentionState'] != nil
				self.suspention_state = xml_element.elements['suspentionState'].text
			end
			if xml_element.elements['userState'] != nil
				self.user_state = xml_element.elements['userState'].text
			end
		end

	end

	class KalturaBookmarkPlayerData < KalturaObjectBase
		# Action
		attr_accessor :action
		# Average Bitrate
		attr_accessor :average_bitrate
		# Total Bitrate
		attr_accessor :total_bitrate
		# Current Bitrate
		attr_accessor :current_bitrate
		# Identifier of the file
		attr_accessor :file_id

		def average_bitrate=(val)
			@average_bitrate = val.to_i
		end
		def total_bitrate=(val)
			@total_bitrate = val.to_i
		end
		def current_bitrate=(val)
			@current_bitrate = val.to_i
		end
		def file_id=(val)
			@file_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['action'] != nil
				self.action = xml_element.elements['action'].text
			end
			if xml_element.elements['averageBitrate'] != nil
				self.average_bitrate = xml_element.elements['averageBitrate'].text
			end
			if xml_element.elements['totalBitrate'] != nil
				self.total_bitrate = xml_element.elements['totalBitrate'].text
			end
			if xml_element.elements['currentBitrate'] != nil
				self.current_bitrate = xml_element.elements['currentBitrate'].text
			end
			if xml_element.elements['fileId'] != nil
				self.file_id = xml_element.elements['fileId'].text
			end
		end

	end

	class KalturaBookmark < KalturaSlimAsset
		# User identifier
		attr_accessor :user_id
		# The position of the user in the specific asset (in seconds)
		attr_accessor :position
		# Indicates who is the owner of this position
		attr_accessor :position_owner
		# Specifies whether the user&#39;s current position exceeded 95% of the duration
		attr_accessor :finished_watching
		# Insert only player data
		attr_accessor :player_data

		def position=(val)
			@position = val.to_i
		end
		def finished_watching=(val)
			@finished_watching = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['position'] != nil
				self.position = xml_element.elements['position'].text
			end
			if xml_element.elements['positionOwner'] != nil
				self.position_owner = xml_element.elements['positionOwner'].text
			end
			if xml_element.elements['finishedWatching'] != nil
				self.finished_watching = xml_element.elements['finishedWatching'].text
			end
			if xml_element.elements['playerData'] != nil
				self.player_data = KalturaClientBase.object_from_xml(xml_element.elements['playerData'], 'KalturaBookmarkPlayerData')
			end
		end

	end

	# List of assets and their bookmarks
	class KalturaBookmarkListResponse < KalturaListResponse
		# Assets
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaBookmark')
			end
		end

	end

	class KalturaStringValueArray < KalturaObjectBase
		# List of string values
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaStringValue')
			end
		end

	end

	# Image details
	class KalturaMediaImage < KalturaObjectBase
		# Image aspect ratio
		attr_accessor :ratio
		# Image width
		attr_accessor :width
		# Image height
		attr_accessor :height
		# Image URL
		attr_accessor :url
		# Image Version
		attr_accessor :version
		# Image ID
		attr_accessor :id
		# Determined whether image was taken from default configuration or not
		attr_accessor :is_default

		def width=(val)
			@width = val.to_i
		end
		def height=(val)
			@height = val.to_i
		end
		def version=(val)
			@version = val.to_i
		end
		def is_default=(val)
			@is_default = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['ratio'] != nil
				self.ratio = xml_element.elements['ratio'].text
			end
			if xml_element.elements['width'] != nil
				self.width = xml_element.elements['width'].text
			end
			if xml_element.elements['height'] != nil
				self.height = xml_element.elements['height'].text
			end
			if xml_element.elements['url'] != nil
				self.url = xml_element.elements['url'].text
			end
			if xml_element.elements['version'] != nil
				self.version = xml_element.elements['version'].text
			end
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['isDefault'] != nil
				self.is_default = xml_element.elements['isDefault'].text
			end
		end

	end

	# Media file details
	class KalturaMediaFile < KalturaObjectBase
		# Unique identifier for the asset
		attr_accessor :asset_id
		# File unique identifier
		attr_accessor :id
		# Device types as defined in the system
		attr_accessor :type
		# URL of the media file to be played
		attr_accessor :url
		# Duration of the media file
		attr_accessor :duration
		# External identifier for the media file
		attr_accessor :external_id

		def asset_id=(val)
			@asset_id = val.to_i
		end
		def id=(val)
			@id = val.to_i
		end
		def duration=(val)
			@duration = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['assetId'] != nil
				self.asset_id = xml_element.elements['assetId'].text
			end
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['url'] != nil
				self.url = xml_element.elements['url'].text
			end
			if xml_element.elements['duration'] != nil
				self.duration = xml_element.elements['duration'].text
			end
			if xml_element.elements['externalId'] != nil
				self.external_id = xml_element.elements['externalId'].text
			end
		end

	end

	# Buzz score
	class KalturaBuzzScore < KalturaObjectBase
		# Normalized average score
		attr_accessor :normalized_avg_score
		# Update date
		attr_accessor :update_date
		# Average score
		attr_accessor :avg_score

		def normalized_avg_score=(val)
			@normalized_avg_score = val.to_f
		end
		def update_date=(val)
			@update_date = val.to_i
		end
		def avg_score=(val)
			@avg_score = val.to_f
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['normalizedAvgScore'] != nil
				self.normalized_avg_score = xml_element.elements['normalizedAvgScore'].text
			end
			if xml_element.elements['updateDate'] != nil
				self.update_date = xml_element.elements['updateDate'].text
			end
			if xml_element.elements['avgScore'] != nil
				self.avg_score = xml_element.elements['avgScore'].text
			end
		end

	end

	# Asset statistics
	class KalturaAssetStatistics < KalturaObjectBase
		# Unique identifier for the asset
		attr_accessor :asset_id
		# Total number of likes for this asset
		attr_accessor :likes
		# Total number of views for this asset
		attr_accessor :views
		# Number of people that rated the asset
		attr_accessor :rating_count
		# Average rating for the asset
		attr_accessor :rating
		# Buzz score
		attr_accessor :buzz_score

		def asset_id=(val)
			@asset_id = val.to_i
		end
		def likes=(val)
			@likes = val.to_i
		end
		def views=(val)
			@views = val.to_i
		end
		def rating_count=(val)
			@rating_count = val.to_i
		end
		def rating=(val)
			@rating = val.to_f
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['assetId'] != nil
				self.asset_id = xml_element.elements['assetId'].text
			end
			if xml_element.elements['likes'] != nil
				self.likes = xml_element.elements['likes'].text
			end
			if xml_element.elements['views'] != nil
				self.views = xml_element.elements['views'].text
			end
			if xml_element.elements['ratingCount'] != nil
				self.rating_count = xml_element.elements['ratingCount'].text
			end
			if xml_element.elements['rating'] != nil
				self.rating = xml_element.elements['rating'].text
			end
			if xml_element.elements['buzzScore'] != nil
				self.buzz_score = KalturaClientBase.object_from_xml(xml_element.elements['buzzScore'], 'KalturaBuzzScore')
			end
		end

	end

	# Slim asset info
	class KalturaBaseAssetInfo < KalturaObjectBase
		# Unique identifier for the asset
		attr_accessor :id
		# Identifies the asset type (EPG, Movie, TV Series, etc). 
		#             Possible values: 0 – EPG linear programs, or any asset type ID according to the asset types IDs defined in the system.
		attr_accessor :type
		# Asset name
		attr_accessor :name
		# Asset description
		attr_accessor :description
		# Collection of images details that can be used to represent this asset
		attr_accessor :images
		# Files
		attr_accessor :media_files

		def id=(val)
			@id = val.to_i
		end
		def type=(val)
			@type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['images'] != nil
				self.images = KalturaClientBase.object_from_xml(xml_element.elements['images'], 'KalturaMediaImage')
			end
			if xml_element.elements['mediaFiles'] != nil
				self.media_files = KalturaClientBase.object_from_xml(xml_element.elements['mediaFiles'], 'KalturaMediaFile')
			end
		end

	end

	# Asset info
	class KalturaAsset < KalturaBaseAssetInfo
		# Dynamic collection of key-value pairs according to the String Meta defined in the system
		attr_accessor :metas
		# Dynamic collection of key-value pairs according to the Tag Types defined in the system
		attr_accessor :tags
		# Date and time represented as epoch. For VOD – since when the asset is available in the catalog. For EPG/Linear – when the program is aired (can be in the future).
		attr_accessor :start_date
		# Date and time represented as epoch. For VOD – till when the asset be available in the catalog. For EPG/Linear – program end time and date
		attr_accessor :end_date
		# Enable cDVR
		attr_accessor :enable_cdvr
		# Enable catch-up
		attr_accessor :enable_catch_up
		# Enable start over
		attr_accessor :enable_start_over
		# Enable trick-play
		attr_accessor :enable_trick_play

		def start_date=(val)
			@start_date = val.to_i
		end
		def end_date=(val)
			@end_date = val.to_i
		end
		def enable_cdvr=(val)
			@enable_cdvr = to_b(val)
		end
		def enable_catch_up=(val)
			@enable_catch_up = to_b(val)
		end
		def enable_start_over=(val)
			@enable_start_over = to_b(val)
		end
		def enable_trick_play=(val)
			@enable_trick_play = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['metas'] != nil
				self.metas = KalturaClientBase.object_from_xml(xml_element.elements['metas'], 'KalturaValue')
			end
			if xml_element.elements['tags'] != nil
				self.tags = KalturaClientBase.object_from_xml(xml_element.elements['tags'], 'KalturaStringValueArray')
			end
			if xml_element.elements['startDate'] != nil
				self.start_date = xml_element.elements['startDate'].text
			end
			if xml_element.elements['endDate'] != nil
				self.end_date = xml_element.elements['endDate'].text
			end
			if xml_element.elements['enableCdvr'] != nil
				self.enable_cdvr = xml_element.elements['enableCdvr'].text
			end
			if xml_element.elements['enableCatchUp'] != nil
				self.enable_catch_up = xml_element.elements['enableCatchUp'].text
			end
			if xml_element.elements['enableStartOver'] != nil
				self.enable_start_over = xml_element.elements['enableStartOver'].text
			end
			if xml_element.elements['enableTrickPlay'] != nil
				self.enable_trick_play = xml_element.elements['enableTrickPlay'].text
			end
		end

	end

	# Asset wrapper
	class KalturaAssetListResponse < KalturaListResponse
		# Assets
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaAsset')
			end
		end

	end

	# Program-asset info
	class KalturaProgramAsset < KalturaAsset
		# EPG channel identifier
		attr_accessor :epg_channel_id
		# EPG identifier
		attr_accessor :epg_id
		# Ralated media identifier
		attr_accessor :related_media_id
		# Unique identifier for the program
		attr_accessor :crid

		def epg_channel_id=(val)
			@epg_channel_id = val.to_i
		end
		def related_media_id=(val)
			@related_media_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['epgChannelId'] != nil
				self.epg_channel_id = xml_element.elements['epgChannelId'].text
			end
			if xml_element.elements['epgId'] != nil
				self.epg_id = xml_element.elements['epgId'].text
			end
			if xml_element.elements['relatedMediaId'] != nil
				self.related_media_id = xml_element.elements['relatedMediaId'].text
			end
			if xml_element.elements['crid'] != nil
				self.crid = xml_element.elements['crid'].text
			end
		end

	end

	# Media-asset info
	class KalturaMediaAsset < KalturaAsset
		# Date and time represented as epoch.
		attr_accessor :system_start_date
		# Date and time represented as epoch.
		attr_accessor :system_final_date
		# External identifiers
		attr_accessor :external_ids
		# Catch-up buffer
		attr_accessor :catch_up_buffer
		# Trick-play buffer
		attr_accessor :trick_play_buffer
		# Enable Recording playback for non entitled channel
		attr_accessor :enable_recording_playback_non_entitled_channel
		# Enable Recording playback for non existing channel
		attr_accessor :enable_recording_playback_non_existing_channel

		def system_start_date=(val)
			@system_start_date = val.to_i
		end
		def system_final_date=(val)
			@system_final_date = val.to_i
		end
		def catch_up_buffer=(val)
			@catch_up_buffer = val.to_i
		end
		def trick_play_buffer=(val)
			@trick_play_buffer = val.to_i
		end
		def enable_recording_playback_non_entitled_channel=(val)
			@enable_recording_playback_non_entitled_channel = to_b(val)
		end
		def enable_recording_playback_non_existing_channel=(val)
			@enable_recording_playback_non_existing_channel = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['systemStartDate'] != nil
				self.system_start_date = xml_element.elements['systemStartDate'].text
			end
			if xml_element.elements['systemFinalDate'] != nil
				self.system_final_date = xml_element.elements['systemFinalDate'].text
			end
			if xml_element.elements['externalIds'] != nil
				self.external_ids = xml_element.elements['externalIds'].text
			end
			if xml_element.elements['catchUpBuffer'] != nil
				self.catch_up_buffer = xml_element.elements['catchUpBuffer'].text
			end
			if xml_element.elements['trickPlayBuffer'] != nil
				self.trick_play_buffer = xml_element.elements['trickPlayBuffer'].text
			end
			if xml_element.elements['enableRecordingPlaybackNonEntitledChannel'] != nil
				self.enable_recording_playback_non_entitled_channel = xml_element.elements['enableRecordingPlaybackNonEntitledChannel'].text
			end
			if xml_element.elements['enableRecordingPlaybackNonExistingChannel'] != nil
				self.enable_recording_playback_non_existing_channel = xml_element.elements['enableRecordingPlaybackNonExistingChannel'].text
			end
		end

	end

	# Asset Comment
	class KalturaAssetComment < KalturaObjectBase
		# Comment ID
		attr_accessor :id
		# Asset identifier
		attr_accessor :asset_id
		# Asset Type
		attr_accessor :asset_type
		# Header
		attr_accessor :header
		# Sub Header
		attr_accessor :sub_header
		# Text
		attr_accessor :text
		# CreateDate
		attr_accessor :create_date
		# Writer
		attr_accessor :writer

		def id=(val)
			@id = val.to_i
		end
		def create_date=(val)
			@create_date = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['assetId'] != nil
				self.asset_id = xml_element.elements['assetId'].text
			end
			if xml_element.elements['assetType'] != nil
				self.asset_type = xml_element.elements['assetType'].text
			end
			if xml_element.elements['header'] != nil
				self.header = xml_element.elements['header'].text
			end
			if xml_element.elements['subHeader'] != nil
				self.sub_header = xml_element.elements['subHeader'].text
			end
			if xml_element.elements['text'] != nil
				self.text = xml_element.elements['text'].text
			end
			if xml_element.elements['createDate'] != nil
				self.create_date = xml_element.elements['createDate'].text
			end
			if xml_element.elements['writer'] != nil
				self.writer = xml_element.elements['writer'].text
			end
		end

	end

	# Asset Comment Response
	class KalturaAssetCommentListResponse < KalturaListResponse
		# Assets
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaAssetComment')
			end
		end

	end

	class KalturaSeriesRecording < KalturaObjectBase
		# Kaltura unique ID representing the series recording identifier
		attr_accessor :id
		# Kaltura EpgId
		attr_accessor :epg_id
		# Kaltura ChannelId
		attr_accessor :channel_id
		# Kaltura SeriesId
		attr_accessor :series_id
		# Kaltura SeasonNumber
		attr_accessor :season_number
		# Recording Type: single/series/season
		attr_accessor :type
		# Specifies when was the series recording created. Date and time represented as epoch.
		attr_accessor :create_date
		# Specifies when was the series recording last updated. Date and time represented as epoch.
		attr_accessor :update_date
		# List of the season numbers to exclude.
		attr_accessor :excluded_seasons

		def id=(val)
			@id = val.to_i
		end
		def epg_id=(val)
			@epg_id = val.to_i
		end
		def channel_id=(val)
			@channel_id = val.to_i
		end
		def season_number=(val)
			@season_number = val.to_i
		end
		def create_date=(val)
			@create_date = val.to_i
		end
		def update_date=(val)
			@update_date = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['epgId'] != nil
				self.epg_id = xml_element.elements['epgId'].text
			end
			if xml_element.elements['channelId'] != nil
				self.channel_id = xml_element.elements['channelId'].text
			end
			if xml_element.elements['seriesId'] != nil
				self.series_id = xml_element.elements['seriesId'].text
			end
			if xml_element.elements['seasonNumber'] != nil
				self.season_number = xml_element.elements['seasonNumber'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['createDate'] != nil
				self.create_date = xml_element.elements['createDate'].text
			end
			if xml_element.elements['updateDate'] != nil
				self.update_date = xml_element.elements['updateDate'].text
			end
			if xml_element.elements['excludedSeasons'] != nil
				self.excluded_seasons = KalturaClientBase.object_from_xml(xml_element.elements['excludedSeasons'], 'KalturaIntegerValue')
			end
		end

	end

	# Series Recordings info wrapper
	class KalturaSeriesRecordingListResponse < KalturaListResponse
		# Series Recordings
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaSeriesRecording')
			end
		end

	end

	# Premium service
	class KalturaPremiumService < KalturaObjectBase
		# Service identifier
		attr_accessor :id
		# Service name / description
		attr_accessor :name

		def id=(val)
			@id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
		end

	end

	# Houshold premium service
	class KalturaHouseholdPremiumService < KalturaPremiumService


		def from_xml(xml_element)
			super
		end

	end

	# Premium services list
	class KalturaHouseholdPremiumServiceListResponse < KalturaListResponse
		# A list of premium services
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaHouseholdPremiumService')
			end
		end

	end

	# C-DVR Adapter
	class KalturaCDVRAdapterProfile < KalturaObjectBase
		# C-DVR adapter identifier
		attr_accessor :id
		# C-DVR adapter name
		attr_accessor :name
		# C-DVR adapter active status
		attr_accessor :is_active
		# C-DVR adapter adapter URL
		attr_accessor :adapter_url
		# C-DVR adapter extra parameters
		attr_accessor :settings
		# C-DVR adapter external identifier
		attr_accessor :external_identifier
		# C-DVR shared secret
		attr_accessor :shared_secret
		# Indicates whether the C-DVR adapter supports dynamic URLs
		attr_accessor :dynamic_links_support

		def id=(val)
			@id = val.to_i
		end
		def is_active=(val)
			@is_active = to_b(val)
		end
		def dynamic_links_support=(val)
			@dynamic_links_support = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['isActive'] != nil
				self.is_active = xml_element.elements['isActive'].text
			end
			if xml_element.elements['adapterUrl'] != nil
				self.adapter_url = xml_element.elements['adapterUrl'].text
			end
			if xml_element.elements['settings'] != nil
				self.settings = KalturaClientBase.object_from_xml(xml_element.elements['settings'], 'KalturaStringValue')
			end
			if xml_element.elements['externalIdentifier'] != nil
				self.external_identifier = xml_element.elements['externalIdentifier'].text
			end
			if xml_element.elements['sharedSecret'] != nil
				self.shared_secret = xml_element.elements['sharedSecret'].text
			end
			if xml_element.elements['dynamicLinksSupport'] != nil
				self.dynamic_links_support = xml_element.elements['dynamicLinksSupport'].text
			end
		end

	end

	# C-DVR adapter profiles
	class KalturaCDVRAdapterProfileListResponse < KalturaListResponse
		# C-DVR adapter profiles
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaCDVRAdapterProfile')
			end
		end

	end

	# Bulk export task
	class KalturaExportTask < KalturaObjectBase
		# Task identifier
		attr_accessor :id
		# Alias for the task used to solicit an export using API
		attr_accessor :alias
		# Task display name
		attr_accessor :name
		# The data type exported in this task
		attr_accessor :data_type
		# Filter to apply on the export, utilize KSQL.
		#             Note: KSQL currently applies to media assets only. It cannot be used for USERS filtering
		attr_accessor :filter
		# Type of export batch – full or incremental
		attr_accessor :export_type
		# How often the export should occur, reasonable minimum threshold should apply, configurable in minutes
		attr_accessor :frequency
		# The URL for sending a notification when the task&#39;s export process is done
		attr_accessor :notification_url
		# List of media type identifiers (as configured in TVM) to export. used only in case data_type = vod
		attr_accessor :vod_types
		# Indicates if the task is active or not
		attr_accessor :is_active

		def id=(val)
			@id = val.to_i
		end
		def frequency=(val)
			@frequency = val.to_i
		end
		def is_active=(val)
			@is_active = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['alias'] != nil
				self.alias = xml_element.elements['alias'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['dataType'] != nil
				self.data_type = xml_element.elements['dataType'].text
			end
			if xml_element.elements['filter'] != nil
				self.filter = xml_element.elements['filter'].text
			end
			if xml_element.elements['exportType'] != nil
				self.export_type = xml_element.elements['exportType'].text
			end
			if xml_element.elements['frequency'] != nil
				self.frequency = xml_element.elements['frequency'].text
			end
			if xml_element.elements['notificationUrl'] != nil
				self.notification_url = xml_element.elements['notificationUrl'].text
			end
			if xml_element.elements['vodTypes'] != nil
				self.vod_types = KalturaClientBase.object_from_xml(xml_element.elements['vodTypes'], 'KalturaIntegerValue')
			end
			if xml_element.elements['isActive'] != nil
				self.is_active = xml_element.elements['isActive'].text
			end
		end

	end

	# Export task list wrapper
	class KalturaExportTaskListResponse < KalturaListResponse
		# Export task items
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaExportTask')
			end
		end

	end

	# Holder object for channel enrichment enum
	class KalturaChannelEnrichmentHolder < KalturaObjectBase
		attr_accessor :type


		def from_xml(xml_element)
			super
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
		end

	end

	# OSS Adapter
	class KalturaExternalChannelProfile < KalturaObjectBase
		# External channel id
		attr_accessor :id
		# External channel name
		attr_accessor :name
		# External channel active status
		attr_accessor :is_active
		# External channel external identifier
		attr_accessor :external_identifier
		# Filter expression
		attr_accessor :filter_expression
		# Recommendation engine id
		attr_accessor :recommendation_engine_id
		# Enrichments
		attr_accessor :enrichments

		def id=(val)
			@id = val.to_i
		end
		def is_active=(val)
			@is_active = to_b(val)
		end
		def recommendation_engine_id=(val)
			@recommendation_engine_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['isActive'] != nil
				self.is_active = xml_element.elements['isActive'].text
			end
			if xml_element.elements['externalIdentifier'] != nil
				self.external_identifier = xml_element.elements['externalIdentifier'].text
			end
			if xml_element.elements['filterExpression'] != nil
				self.filter_expression = xml_element.elements['filterExpression'].text
			end
			if xml_element.elements['recommendationEngineId'] != nil
				self.recommendation_engine_id = xml_element.elements['recommendationEngineId'].text
			end
			if xml_element.elements['enrichments'] != nil
				self.enrichments = KalturaClientBase.object_from_xml(xml_element.elements['enrichments'], 'KalturaChannelEnrichmentHolder')
			end
		end

	end

	# External channel profiles
	class KalturaExternalChannelProfileListResponse < KalturaListResponse
		# External channel profiles
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaExternalChannelProfile')
			end
		end

	end

	# PaymentGW
	class KalturaRecommendationProfile < KalturaObjectBase
		# recommendation engine id
		attr_accessor :id
		# recommendation engine name
		attr_accessor :name
		# recommendation engine is active status
		attr_accessor :is_active
		# recommendation engine adapter URL
		attr_accessor :adapter_url
		# recommendation engine extra parameters
		attr_accessor :recommendation_engine_settings
		# recommendation engine external identifier
		attr_accessor :external_identifier
		# Shared Secret
		attr_accessor :shared_secret

		def id=(val)
			@id = val.to_i
		end
		def is_active=(val)
			@is_active = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['isActive'] != nil
				self.is_active = xml_element.elements['isActive'].text
			end
			if xml_element.elements['adapterUrl'] != nil
				self.adapter_url = xml_element.elements['adapterUrl'].text
			end
			if xml_element.elements['recommendationEngineSettings'] != nil
				self.recommendation_engine_settings = KalturaClientBase.object_from_xml(xml_element.elements['recommendationEngineSettings'], 'KalturaStringValue')
			end
			if xml_element.elements['externalIdentifier'] != nil
				self.external_identifier = xml_element.elements['externalIdentifier'].text
			end
			if xml_element.elements['sharedSecret'] != nil
				self.shared_secret = xml_element.elements['sharedSecret'].text
			end
		end

	end

	# List of recommendation profiles.
	class KalturaRecommendationProfileListResponse < KalturaListResponse
		# Recommendation profiles list
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaRecommendationProfile')
			end
		end

	end

	class KalturaRegistrySettings < KalturaObjectBase
		# Permission item identifier
		attr_accessor :key
		# Permission item name
		attr_accessor :value


		def from_xml(xml_element)
			super
			if xml_element.elements['key'] != nil
				self.key = xml_element.elements['key'].text
			end
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	# List of registry settings.
	class KalturaRegistrySettingsListResponse < KalturaListResponse
		# Registry settings list
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaRegistrySettings')
			end
		end

	end

	class KalturaHouseholdPaymentMethod < KalturaObjectBase
		# Household payment method identifier (internal)
		attr_accessor :id
		# Payment-gateway identifier
		attr_accessor :payment_gateway_id
		# Payment method name
		attr_accessor :name
		# Indicates whether the payment method allow multiple instances
		attr_accessor :allow_multi_instance

		def id=(val)
			@id = val.to_i
		end
		def payment_gateway_id=(val)
			@payment_gateway_id = val.to_i
		end
		def allow_multi_instance=(val)
			@allow_multi_instance = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['paymentGatewayId'] != nil
				self.payment_gateway_id = xml_element.elements['paymentGatewayId'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['allowMultiInstance'] != nil
				self.allow_multi_instance = xml_element.elements['allowMultiInstance'].text
			end
		end

	end

	# List of household payment methods.
	class KalturaHouseholdPaymentMethodListResponse < KalturaListResponse
		# Follow data list
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaHouseholdPaymentMethod')
			end
		end

	end

	class KalturaPaymentMethodProfile < KalturaObjectBase
		# Payment method identifier (internal)
		attr_accessor :id
		# Payment gateway identifier (internal)
		attr_accessor :payment_gateway_id
		# Payment method name
		attr_accessor :name
		# Indicates whether the payment method allow multiple instances
		attr_accessor :allow_multi_instance

		def id=(val)
			@id = val.to_i
		end
		def payment_gateway_id=(val)
			@payment_gateway_id = val.to_i
		end
		def allow_multi_instance=(val)
			@allow_multi_instance = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['paymentGatewayId'] != nil
				self.payment_gateway_id = xml_element.elements['paymentGatewayId'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['allowMultiInstance'] != nil
				self.allow_multi_instance = xml_element.elements['allowMultiInstance'].text
			end
		end

	end

	# List of payment method profiles.
	class KalturaPaymentMethodProfileListResponse < KalturaListResponse
		# Payment method profiles list
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaPaymentMethodProfile')
			end
		end

	end

	# Price
	class KalturaPrice < KalturaObjectBase
		# Price
		attr_accessor :amount
		# Currency
		attr_accessor :currency
		# Currency Sign
		attr_accessor :currency_sign

		def amount=(val)
			@amount = val.to_f
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['amount'] != nil
				self.amount = xml_element.elements['amount'].text
			end
			if xml_element.elements['currency'] != nil
				self.currency = xml_element.elements['currency'].text
			end
			if xml_element.elements['currencySign'] != nil
				self.currency_sign = xml_element.elements['currencySign'].text
			end
		end

	end

	class KalturaProductPrice < KalturaObjectBase
		# Product identifier
		attr_accessor :product_id
		# Product Type
		attr_accessor :product_type
		# Product price
		attr_accessor :price
		# Product purchase status
		attr_accessor :purchase_status


		def from_xml(xml_element)
			super
			if xml_element.elements['productId'] != nil
				self.product_id = xml_element.elements['productId'].text
			end
			if xml_element.elements['productType'] != nil
				self.product_type = xml_element.elements['productType'].text
			end
			if xml_element.elements['price'] != nil
				self.price = KalturaClientBase.object_from_xml(xml_element.elements['price'], 'KalturaPrice')
			end
			if xml_element.elements['purchaseStatus'] != nil
				self.purchase_status = xml_element.elements['purchaseStatus'].text
			end
		end

	end

	# Container for translation
	class KalturaTranslationToken < KalturaObjectBase
		# Language code
		attr_accessor :language
		# Translated value
		attr_accessor :value


		def from_xml(xml_element)
			super
			if xml_element.elements['language'] != nil
				self.language = xml_element.elements['language'].text
			end
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	# PPV price details
	class KalturaPpvPrice < KalturaProductPrice
		# Media file identifier
		attr_accessor :file_id
		# The associated PPV module identifier
		attr_accessor :ppv_module_id
		# Denotes whether this object is available only as part of a subscription or can be sold separately
		attr_accessor :is_subscription_only
		# The full price of the item (with no discounts)
		attr_accessor :full_price
		# The identifier of the relevant subscription
		attr_accessor :subscription_id
		# The identifier of the relevant collection
		attr_accessor :collection_id
		# The identifier of the relevant pre paid
		attr_accessor :pre_paid_id
		# A list of the descriptions of the PPV module on different languages (language code and translation)
		attr_accessor :ppv_descriptions
		# If the item already purchased - the identifier of the user (in the household) who purchased this item
		attr_accessor :purchase_user_id
		# If the item already purchased - the identifier of the purchased file
		attr_accessor :purchased_media_file_id
		# Related media files identifiers (different types)
		attr_accessor :related_media_file_ids
		# If the item already purchased - since when the user can start watching the item
		attr_accessor :start_date
		# If the item already purchased - until when the user can watch the item
		attr_accessor :end_date
		# Discount end date
		attr_accessor :discount_end_date
		# If the item already purchased and played - the name of the device on which it was first played
		attr_accessor :first_device_name
		# If waiver period is enabled - donates whether the user is still in the cancelation window
		attr_accessor :is_in_cancelation_period
		# The PPV product code
		attr_accessor :ppv_product_code

		def file_id=(val)
			@file_id = val.to_i
		end
		def is_subscription_only=(val)
			@is_subscription_only = to_b(val)
		end
		def purchased_media_file_id=(val)
			@purchased_media_file_id = val.to_i
		end
		def start_date=(val)
			@start_date = val.to_i
		end
		def end_date=(val)
			@end_date = val.to_i
		end
		def discount_end_date=(val)
			@discount_end_date = val.to_i
		end
		def is_in_cancelation_period=(val)
			@is_in_cancelation_period = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['fileId'] != nil
				self.file_id = xml_element.elements['fileId'].text
			end
			if xml_element.elements['ppvModuleId'] != nil
				self.ppv_module_id = xml_element.elements['ppvModuleId'].text
			end
			if xml_element.elements['isSubscriptionOnly'] != nil
				self.is_subscription_only = xml_element.elements['isSubscriptionOnly'].text
			end
			if xml_element.elements['fullPrice'] != nil
				self.full_price = KalturaClientBase.object_from_xml(xml_element.elements['fullPrice'], 'KalturaPrice')
			end
			if xml_element.elements['subscriptionId'] != nil
				self.subscription_id = xml_element.elements['subscriptionId'].text
			end
			if xml_element.elements['collectionId'] != nil
				self.collection_id = xml_element.elements['collectionId'].text
			end
			if xml_element.elements['prePaidId'] != nil
				self.pre_paid_id = xml_element.elements['prePaidId'].text
			end
			if xml_element.elements['ppvDescriptions'] != nil
				self.ppv_descriptions = KalturaClientBase.object_from_xml(xml_element.elements['ppvDescriptions'], 'KalturaTranslationToken')
			end
			if xml_element.elements['purchaseUserId'] != nil
				self.purchase_user_id = xml_element.elements['purchaseUserId'].text
			end
			if xml_element.elements['purchasedMediaFileId'] != nil
				self.purchased_media_file_id = xml_element.elements['purchasedMediaFileId'].text
			end
			if xml_element.elements['relatedMediaFileIds'] != nil
				self.related_media_file_ids = KalturaClientBase.object_from_xml(xml_element.elements['relatedMediaFileIds'], 'KalturaIntegerValue')
			end
			if xml_element.elements['startDate'] != nil
				self.start_date = xml_element.elements['startDate'].text
			end
			if xml_element.elements['endDate'] != nil
				self.end_date = xml_element.elements['endDate'].text
			end
			if xml_element.elements['discountEndDate'] != nil
				self.discount_end_date = xml_element.elements['discountEndDate'].text
			end
			if xml_element.elements['firstDeviceName'] != nil
				self.first_device_name = xml_element.elements['firstDeviceName'].text
			end
			if xml_element.elements['isInCancelationPeriod'] != nil
				self.is_in_cancelation_period = xml_element.elements['isInCancelationPeriod'].text
			end
			if xml_element.elements['ppvProductCode'] != nil
				self.ppv_product_code = xml_element.elements['ppvProductCode'].text
			end
		end

	end

	# PPV item price details
	class KalturaPPVItemPriceDetails < KalturaObjectBase
		# The associated PPV module identifier
		attr_accessor :ppv_module_id
		# Denotes whether this object is available only as part of a subscription or can be sold separately
		attr_accessor :is_subscription_only
		# The calculated price of the item after discounts (as part of a purchased subscription by the user or by using a coupon)
		attr_accessor :price
		# The full price of the item (with no discounts)
		attr_accessor :full_price
		# Subscription purchase status
		attr_accessor :purchase_status
		# The identifier of the relevant subscription
		attr_accessor :subscription_id
		# The identifier of the relevant collection
		attr_accessor :collection_id
		# The identifier of the relevant pre paid
		attr_accessor :pre_paid_id
		# A list of the descriptions of the PPV module on different languages (language code and translation)
		attr_accessor :ppv_descriptions
		# If the item already purchased - the identifier of the user (in the household) who purchased this item
		attr_accessor :purchase_user_id
		# If the item already purchased - the identifier of the purchased file
		attr_accessor :purchased_media_file_id
		# Related media files identifiers (different types)
		attr_accessor :related_media_file_ids
		# If the item already purchased - since when the user can start watching the item
		attr_accessor :start_date
		# If the item already purchased - until when the user can watch the item
		attr_accessor :end_date
		# Discount end date
		attr_accessor :discount_end_date
		# If the item already purchased and played - the name of the device on which it was first played
		attr_accessor :first_device_name
		# If waiver period is enabled - donates whether the user is still in the cancelation window
		attr_accessor :is_in_cancelation_period
		# The PPV product code
		attr_accessor :ppv_product_code

		def is_subscription_only=(val)
			@is_subscription_only = to_b(val)
		end
		def purchased_media_file_id=(val)
			@purchased_media_file_id = val.to_i
		end
		def start_date=(val)
			@start_date = val.to_i
		end
		def end_date=(val)
			@end_date = val.to_i
		end
		def discount_end_date=(val)
			@discount_end_date = val.to_i
		end
		def is_in_cancelation_period=(val)
			@is_in_cancelation_period = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['ppvModuleId'] != nil
				self.ppv_module_id = xml_element.elements['ppvModuleId'].text
			end
			if xml_element.elements['isSubscriptionOnly'] != nil
				self.is_subscription_only = xml_element.elements['isSubscriptionOnly'].text
			end
			if xml_element.elements['price'] != nil
				self.price = KalturaClientBase.object_from_xml(xml_element.elements['price'], 'KalturaPrice')
			end
			if xml_element.elements['fullPrice'] != nil
				self.full_price = KalturaClientBase.object_from_xml(xml_element.elements['fullPrice'], 'KalturaPrice')
			end
			if xml_element.elements['purchaseStatus'] != nil
				self.purchase_status = xml_element.elements['purchaseStatus'].text
			end
			if xml_element.elements['subscriptionId'] != nil
				self.subscription_id = xml_element.elements['subscriptionId'].text
			end
			if xml_element.elements['collectionId'] != nil
				self.collection_id = xml_element.elements['collectionId'].text
			end
			if xml_element.elements['prePaidId'] != nil
				self.pre_paid_id = xml_element.elements['prePaidId'].text
			end
			if xml_element.elements['ppvDescriptions'] != nil
				self.ppv_descriptions = KalturaClientBase.object_from_xml(xml_element.elements['ppvDescriptions'], 'KalturaTranslationToken')
			end
			if xml_element.elements['purchaseUserId'] != nil
				self.purchase_user_id = xml_element.elements['purchaseUserId'].text
			end
			if xml_element.elements['purchasedMediaFileId'] != nil
				self.purchased_media_file_id = xml_element.elements['purchasedMediaFileId'].text
			end
			if xml_element.elements['relatedMediaFileIds'] != nil
				self.related_media_file_ids = KalturaClientBase.object_from_xml(xml_element.elements['relatedMediaFileIds'], 'KalturaIntegerValue')
			end
			if xml_element.elements['startDate'] != nil
				self.start_date = xml_element.elements['startDate'].text
			end
			if xml_element.elements['endDate'] != nil
				self.end_date = xml_element.elements['endDate'].text
			end
			if xml_element.elements['discountEndDate'] != nil
				self.discount_end_date = xml_element.elements['discountEndDate'].text
			end
			if xml_element.elements['firstDeviceName'] != nil
				self.first_device_name = xml_element.elements['firstDeviceName'].text
			end
			if xml_element.elements['isInCancelationPeriod'] != nil
				self.is_in_cancelation_period = xml_element.elements['isInCancelationPeriod'].text
			end
			if xml_element.elements['ppvProductCode'] != nil
				self.ppv_product_code = xml_element.elements['ppvProductCode'].text
			end
		end

	end

	# PPV price details
	class KalturaItemPrice < KalturaProductPrice
		# Media file identifier
		attr_accessor :file_id
		# PPV price details
		attr_accessor :ppv_price_details

		def file_id=(val)
			@file_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['fileId'] != nil
				self.file_id = xml_element.elements['fileId'].text
			end
			if xml_element.elements['ppvPriceDetails'] != nil
				self.ppv_price_details = KalturaClientBase.object_from_xml(xml_element.elements['ppvPriceDetails'], 'KalturaPPVItemPriceDetails')
			end
		end

	end

	# Subscription price details
	class KalturaSubscriptionPrice < KalturaProductPrice


		def from_xml(xml_element)
			super
		end

	end

	class KalturaHouseholdPaymentGateway < KalturaObjectBase
		# payment gateway id
		attr_accessor :id
		# payment gateway name
		attr_accessor :name
		# Payment gateway default (true/false)
		attr_accessor :is_default
		# distinction payment gateway selected by account or household
		attr_accessor :selected_by

		def id=(val)
			@id = val.to_i
		end
		def is_default=(val)
			@is_default = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['isDefault'] != nil
				self.is_default = xml_element.elements['isDefault'].text
			end
			if xml_element.elements['selectedBy'] != nil
				self.selected_by = xml_element.elements['selectedBy'].text
			end
		end

	end

	# List of household payment gateways.
	class KalturaHouseholdPaymentGatewayListResponse < KalturaListResponse
		# Follow data list
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaHouseholdPaymentGateway')
			end
		end

	end

	# Payment gateway base profile
	class KalturaPaymentGatewayBaseProfile < KalturaObjectBase
		# payment gateway id
		attr_accessor :id
		# payment gateway name
		attr_accessor :name
		# Payment gateway default (true/false)
		attr_accessor :is_default
		# distinction payment gateway selected by account or household
		attr_accessor :selected_by

		def id=(val)
			@id = val.to_i
		end
		def is_default=(val)
			@is_default = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['isDefault'] != nil
				self.is_default = xml_element.elements['isDefault'].text
			end
			if xml_element.elements['selectedBy'] != nil
				self.selected_by = xml_element.elements['selectedBy'].text
			end
		end

	end

	# Payment gateway profile
	class KalturaPaymentGatewayProfile < KalturaPaymentGatewayBaseProfile
		# Payment gateway is active status
		attr_accessor :is_active
		# Payment gateway adapter URL
		attr_accessor :adapter_url
		# Payment gateway transact URL
		attr_accessor :transact_url
		# Payment gateway status URL
		attr_accessor :status_url
		# Payment gateway renew URL
		attr_accessor :renew_url
		# Payment gateway extra parameters
		attr_accessor :payment_gatewaye_settings
		# Payment gateway external identifier
		attr_accessor :external_identifier
		# Pending Interval in minutes
		attr_accessor :pending_interval
		# Pending Retries
		attr_accessor :pending_retries
		# Shared Secret
		attr_accessor :shared_secret
		# Renew Interval Minutes
		attr_accessor :renew_interval_minutes
		# Renew Start Minutes
		attr_accessor :renew_start_minutes

		def is_active=(val)
			@is_active = val.to_i
		end
		def pending_interval=(val)
			@pending_interval = val.to_i
		end
		def pending_retries=(val)
			@pending_retries = val.to_i
		end
		def renew_interval_minutes=(val)
			@renew_interval_minutes = val.to_i
		end
		def renew_start_minutes=(val)
			@renew_start_minutes = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['isActive'] != nil
				self.is_active = xml_element.elements['isActive'].text
			end
			if xml_element.elements['adapterUrl'] != nil
				self.adapter_url = xml_element.elements['adapterUrl'].text
			end
			if xml_element.elements['transactUrl'] != nil
				self.transact_url = xml_element.elements['transactUrl'].text
			end
			if xml_element.elements['statusUrl'] != nil
				self.status_url = xml_element.elements['statusUrl'].text
			end
			if xml_element.elements['renewUrl'] != nil
				self.renew_url = xml_element.elements['renewUrl'].text
			end
			if xml_element.elements['paymentGatewayeSettings'] != nil
				self.payment_gatewaye_settings = KalturaClientBase.object_from_xml(xml_element.elements['paymentGatewayeSettings'], 'KalturaStringValue')
			end
			if xml_element.elements['externalIdentifier'] != nil
				self.external_identifier = xml_element.elements['externalIdentifier'].text
			end
			if xml_element.elements['pendingInterval'] != nil
				self.pending_interval = xml_element.elements['pendingInterval'].text
			end
			if xml_element.elements['pendingRetries'] != nil
				self.pending_retries = xml_element.elements['pendingRetries'].text
			end
			if xml_element.elements['sharedSecret'] != nil
				self.shared_secret = xml_element.elements['sharedSecret'].text
			end
			if xml_element.elements['renewIntervalMinutes'] != nil
				self.renew_interval_minutes = xml_element.elements['renewIntervalMinutes'].text
			end
			if xml_element.elements['renewStartMinutes'] != nil
				self.renew_start_minutes = xml_element.elements['renewStartMinutes'].text
			end
		end

	end

	# PaymentGatewayProfile list
	class KalturaPaymentGatewayProfileListResponse < KalturaListResponse
		# A list of payment-gateway profiles
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaPaymentGatewayProfile')
			end
		end

	end

	# Parental rule
	class KalturaParentalRule < KalturaObjectBase
		# Unique parental rule identifier
		attr_accessor :id
		# Rule display name
		attr_accessor :name
		# Explanatory description
		attr_accessor :description
		# Rule order within the full list of rules
		attr_accessor :order
		# Media asset tag ID to in which to look for corresponding trigger values
		attr_accessor :media_tag
		# EPG asset tag ID to in which to look for corresponding trigger values
		attr_accessor :epg_tag
		# Content that correspond to this rule is not available for guests
		attr_accessor :block_anonymous_access
		# Rule type – Movies, TV series or both
		attr_accessor :rule_type
		# Media tag values that trigger rule
		attr_accessor :media_tag_values
		# EPG tag values that trigger rule
		attr_accessor :epg_tag_values
		# Is the rule the default rule of the account
		attr_accessor :is_default
		# Where was this rule defined account, household or user
		attr_accessor :origin

		def id=(val)
			@id = val.to_i
		end
		def order=(val)
			@order = val.to_i
		end
		def media_tag=(val)
			@media_tag = val.to_i
		end
		def epg_tag=(val)
			@epg_tag = val.to_i
		end
		def block_anonymous_access=(val)
			@block_anonymous_access = to_b(val)
		end
		def is_default=(val)
			@is_default = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['order'] != nil
				self.order = xml_element.elements['order'].text
			end
			if xml_element.elements['mediaTag'] != nil
				self.media_tag = xml_element.elements['mediaTag'].text
			end
			if xml_element.elements['epgTag'] != nil
				self.epg_tag = xml_element.elements['epgTag'].text
			end
			if xml_element.elements['blockAnonymousAccess'] != nil
				self.block_anonymous_access = xml_element.elements['blockAnonymousAccess'].text
			end
			if xml_element.elements['ruleType'] != nil
				self.rule_type = xml_element.elements['ruleType'].text
			end
			if xml_element.elements['mediaTagValues'] != nil
				self.media_tag_values = KalturaClientBase.object_from_xml(xml_element.elements['mediaTagValues'], 'KalturaStringValue')
			end
			if xml_element.elements['epgTagValues'] != nil
				self.epg_tag_values = KalturaClientBase.object_from_xml(xml_element.elements['epgTagValues'], 'KalturaStringValue')
			end
			if xml_element.elements['isDefault'] != nil
				self.is_default = xml_element.elements['isDefault'].text
			end
			if xml_element.elements['origin'] != nil
				self.origin = xml_element.elements['origin'].text
			end
		end

	end

	# ParentalRules list
	class KalturaParentalRuleListResponse < KalturaListResponse
		# A list of parental rules
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaParentalRule')
			end
		end

	end

	class KalturaRecording < KalturaObjectBase
		# Kaltura unique ID representing the recording identifier
		attr_accessor :id
		# Recording state: scheduled/recording/recorded/canceled/failed/does_not_exists/deleted
		attr_accessor :status
		# Kaltura unique ID representing the program identifier
		attr_accessor :asset_id
		# Recording Type: single/season/series
		attr_accessor :type
		# Specifies until when the recording is available for viewing. Date and time represented as epoch.
		attr_accessor :viewable_until_date
		# Specifies whether or not the recording is protected
		attr_accessor :is_protected
		# Specifies when was the recording created. Date and time represented as epoch.
		attr_accessor :create_date
		# Specifies when was the recording last updated. Date and time represented as epoch.
		attr_accessor :update_date

		def id=(val)
			@id = val.to_i
		end
		def asset_id=(val)
			@asset_id = val.to_i
		end
		def viewable_until_date=(val)
			@viewable_until_date = val.to_i
		end
		def is_protected=(val)
			@is_protected = to_b(val)
		end
		def create_date=(val)
			@create_date = val.to_i
		end
		def update_date=(val)
			@update_date = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['assetId'] != nil
				self.asset_id = xml_element.elements['assetId'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['viewableUntilDate'] != nil
				self.viewable_until_date = xml_element.elements['viewableUntilDate'].text
			end
			if xml_element.elements['isProtected'] != nil
				self.is_protected = xml_element.elements['isProtected'].text
			end
			if xml_element.elements['createDate'] != nil
				self.create_date = xml_element.elements['createDate'].text
			end
			if xml_element.elements['updateDate'] != nil
				self.update_date = xml_element.elements['updateDate'].text
			end
		end

	end

	# Recordings info wrapper
	class KalturaRecordingListResponse < KalturaListResponse
		# Recordings
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaRecording')
			end
		end

	end

	# Billing Transaction
	class KalturaBillingTransaction < KalturaObjectBase
		# Reciept Code
		attr_accessor :reciept_code
		# Purchased Item Name
		attr_accessor :purchased_item_name
		# Purchased Item Code
		attr_accessor :purchased_item_code
		# Item Type
		attr_accessor :item_type
		# Billing Action
		attr_accessor :billing_action
		# price
		attr_accessor :price
		# Action Date
		attr_accessor :action_date
		# Start Date
		attr_accessor :start_date
		# End Date
		attr_accessor :end_date
		# Payment Method
		attr_accessor :payment_method
		# Payment Method Extra Details
		attr_accessor :payment_method_extra_details
		# Is Recurring
		attr_accessor :is_recurring
		# Billing Provider Ref
		attr_accessor :billing_provider_ref
		# Purchase ID
		attr_accessor :purchase_id
		# Remarks
		attr_accessor :remarks

		def action_date=(val)
			@action_date = val.to_i
		end
		def start_date=(val)
			@start_date = val.to_i
		end
		def end_date=(val)
			@end_date = val.to_i
		end
		def is_recurring=(val)
			@is_recurring = to_b(val)
		end
		def billing_provider_ref=(val)
			@billing_provider_ref = val.to_i
		end
		def purchase_id=(val)
			@purchase_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['recieptCode'] != nil
				self.reciept_code = xml_element.elements['recieptCode'].text
			end
			if xml_element.elements['purchasedItemName'] != nil
				self.purchased_item_name = xml_element.elements['purchasedItemName'].text
			end
			if xml_element.elements['purchasedItemCode'] != nil
				self.purchased_item_code = xml_element.elements['purchasedItemCode'].text
			end
			if xml_element.elements['itemType'] != nil
				self.item_type = xml_element.elements['itemType'].text
			end
			if xml_element.elements['billingAction'] != nil
				self.billing_action = xml_element.elements['billingAction'].text
			end
			if xml_element.elements['price'] != nil
				self.price = KalturaClientBase.object_from_xml(xml_element.elements['price'], 'KalturaPrice')
			end
			if xml_element.elements['actionDate'] != nil
				self.action_date = xml_element.elements['actionDate'].text
			end
			if xml_element.elements['startDate'] != nil
				self.start_date = xml_element.elements['startDate'].text
			end
			if xml_element.elements['endDate'] != nil
				self.end_date = xml_element.elements['endDate'].text
			end
			if xml_element.elements['paymentMethod'] != nil
				self.payment_method = xml_element.elements['paymentMethod'].text
			end
			if xml_element.elements['paymentMethodExtraDetails'] != nil
				self.payment_method_extra_details = xml_element.elements['paymentMethodExtraDetails'].text
			end
			if xml_element.elements['isRecurring'] != nil
				self.is_recurring = xml_element.elements['isRecurring'].text
			end
			if xml_element.elements['billingProviderRef'] != nil
				self.billing_provider_ref = xml_element.elements['billingProviderRef'].text
			end
			if xml_element.elements['purchaseId'] != nil
				self.purchase_id = xml_element.elements['purchaseId'].text
			end
			if xml_element.elements['remarks'] != nil
				self.remarks = xml_element.elements['remarks'].text
			end
		end

	end

	# Billing Transactions
	class KalturaBillingTransactionListResponse < KalturaListResponse
		# Transactions
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaBillingTransaction')
			end
		end

	end

	class KalturaPermissionItem < KalturaObjectBase
		# Permission item identifier
		attr_accessor :id
		# Permission item name
		attr_accessor :name

		def id=(val)
			@id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
		end

	end

	class KalturaPermission < KalturaObjectBase
		# Permission identifier
		attr_accessor :id
		# Permission name
		attr_accessor :name
		# List of permission items associated with the permission
		attr_accessor :permission_items

		def id=(val)
			@id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['permissionItems'] != nil
				self.permission_items = KalturaClientBase.object_from_xml(xml_element.elements['permissionItems'], 'KalturaPermissionItem')
			end
		end

	end

	class KalturaUserRole < KalturaObjectBase
		# User role identifier
		attr_accessor :id
		# User role name
		attr_accessor :name
		# List of permissions associated with the user role
		attr_accessor :permissions

		def id=(val)
			@id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['permissions'] != nil
				self.permissions = KalturaClientBase.object_from_xml(xml_element.elements['permissions'], 'KalturaPermission')
			end
		end

	end

	# User-roles list
	class KalturaUserRoleListResponse < KalturaListResponse
		# A list of generic rules
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaUserRole')
			end
		end

	end

	class KalturaGroupPermission < KalturaPermission
		# Permission identifier
		attr_accessor :group


		def from_xml(xml_element)
			super
			if xml_element.elements['group'] != nil
				self.group = xml_element.elements['group'].text
			end
		end

	end

	class KalturaApiArgumentPermissionItem < KalturaPermissionItem
		# API service name
		attr_accessor :service
		# API action name
		attr_accessor :action
		# API parameter name
		attr_accessor :parameter


		def from_xml(xml_element)
			super
			if xml_element.elements['service'] != nil
				self.service = xml_element.elements['service'].text
			end
			if xml_element.elements['action'] != nil
				self.action = xml_element.elements['action'].text
			end
			if xml_element.elements['parameter'] != nil
				self.parameter = xml_element.elements['parameter'].text
			end
		end

	end

	class KalturaApiParameterPermissionItem < KalturaPermissionItem
		# API object name
		attr_accessor :object
		# API parameter name
		attr_accessor :parameter
		# API action type
		attr_accessor :action


		def from_xml(xml_element)
			super
			if xml_element.elements['object'] != nil
				self.object = xml_element.elements['object'].text
			end
			if xml_element.elements['parameter'] != nil
				self.parameter = xml_element.elements['parameter'].text
			end
			if xml_element.elements['action'] != nil
				self.action = xml_element.elements['action'].text
			end
		end

	end

	class KalturaApiActionPermissionItem < KalturaPermissionItem
		# API service name
		attr_accessor :service
		# API action name
		attr_accessor :action


		def from_xml(xml_element)
			super
			if xml_element.elements['service'] != nil
				self.service = xml_element.elements['service'].text
			end
			if xml_element.elements['action'] != nil
				self.action = xml_element.elements['action'].text
			end
		end

	end

	class KalturaInboxMessage < KalturaObjectBase
		# message id
		attr_accessor :id
		# message
		attr_accessor :message
		# Status
		attr_accessor :status
		# Type
		attr_accessor :type
		# Created at
		attr_accessor :created_at
		# url
		attr_accessor :url

		def created_at=(val)
			@created_at = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['message'] != nil
				self.message = xml_element.elements['message'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
			if xml_element.elements['url'] != nil
				self.url = xml_element.elements['url'].text
			end
		end

	end

	# List of inbox message.
	class KalturaInboxMessageListResponse < KalturaListResponse
		# Follow data list
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaInboxMessage')
			end
		end

	end

	class KalturaFollowDataBase < KalturaObjectBase
		# Announcement Id
		attr_accessor :announcement_id
		# Status
		attr_accessor :status
		# Title
		attr_accessor :title
		# Timestamp
		attr_accessor :timestamp
		# Follow Phrase
		attr_accessor :follow_phrase

		def announcement_id=(val)
			@announcement_id = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def timestamp=(val)
			@timestamp = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['announcementId'] != nil
				self.announcement_id = xml_element.elements['announcementId'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['title'] != nil
				self.title = xml_element.elements['title'].text
			end
			if xml_element.elements['timestamp'] != nil
				self.timestamp = xml_element.elements['timestamp'].text
			end
			if xml_element.elements['followPhrase'] != nil
				self.follow_phrase = xml_element.elements['followPhrase'].text
			end
		end

	end

	class KalturaFollowTvSeries < KalturaFollowDataBase
		# Asset Id
		attr_accessor :asset_id

		def asset_id=(val)
			@asset_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['assetId'] != nil
				self.asset_id = xml_element.elements['assetId'].text
			end
		end

	end

	# List of message follow data.
	class KalturaFollowTvSeriesListResponse < KalturaListResponse
		# Follow data list
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaFollowTvSeries')
			end
		end

	end

	# List of message announcements from DB.
	class KalturaAnnouncementListResponse < KalturaListResponse
		# Announcements
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaAnnouncement')
			end
		end

	end

	class KalturaFeed < KalturaObjectBase
		attr_accessor :asset_id

		def asset_id=(val)
			@asset_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['assetId'] != nil
				self.asset_id = xml_element.elements['assetId'].text
			end
		end

	end

	class KalturaPersonalFeed < KalturaFeed


		def from_xml(xml_element)
			super
		end

	end

	# List of message follow data.
	class KalturaPersonalFeedListResponse < KalturaListResponse
		# Follow data list
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaPersonalFeed')
			end
		end

	end

	class KalturaTopic < KalturaObjectBase
		# message id
		attr_accessor :id
		# message
		attr_accessor :name
		# message
		attr_accessor :subscribers_amount
		# automaticIssueNotification
		attr_accessor :automatic_issue_notification
		# lastMessageSentDateSec
		attr_accessor :last_message_sent_date_sec

		def last_message_sent_date_sec=(val)
			@last_message_sent_date_sec = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['subscribersAmount'] != nil
				self.subscribers_amount = xml_element.elements['subscribersAmount'].text
			end
			if xml_element.elements['automaticIssueNotification'] != nil
				self.automatic_issue_notification = xml_element.elements['automaticIssueNotification'].text
			end
			if xml_element.elements['lastMessageSentDateSec'] != nil
				self.last_message_sent_date_sec = xml_element.elements['lastMessageSentDateSec'].text
			end
		end

	end

	# List of inbox message.
	class KalturaTopicListResponse < KalturaListResponse
		# Follow data list
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaTopic')
			end
		end

	end

	# Prices list
	class KalturaProductPriceListResponse < KalturaListResponse
		# A list of prices
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaProductPrice')
			end
		end

	end

	# ItemPrice list
	class KalturaItemPriceListResponse < KalturaListResponse
		# A list of item prices
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaItemPrice')
			end
		end

	end

	# Slim channel
	class KalturaBaseChannel < KalturaObjectBase
		# Unique identifier for the channel
		attr_accessor :id
		# Channel name
		attr_accessor :name

		def id=(val)
			@id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
		end

	end

	# Channel details
	class KalturaChannel < KalturaBaseChannel
		# Cannel description
		attr_accessor :description
		# Channel images
		attr_accessor :images
		# Asset types in the channel.
		#             -26 is EPG
		attr_accessor :asset_types
		# Filter expression
		attr_accessor :filter_expression
		# active status
		attr_accessor :is_active
		# Channel order
		attr_accessor :order

		def is_active=(val)
			@is_active = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['images'] != nil
				self.images = KalturaClientBase.object_from_xml(xml_element.elements['images'], 'KalturaMediaImage')
			end
			if xml_element.elements['assetTypes'] != nil
				self.asset_types = KalturaClientBase.object_from_xml(xml_element.elements['assetTypes'], 'KalturaIntegerValue')
			end
			if xml_element.elements['filterExpression'] != nil
				self.filter_expression = xml_element.elements['filterExpression'].text
			end
			if xml_element.elements['isActive'] != nil
				self.is_active = xml_element.elements['isActive'].text
			end
			if xml_element.elements['order'] != nil
				self.order = xml_element.elements['order'].text
			end
		end

	end

	# Price details
	class KalturaPriceDetails < KalturaObjectBase
		# The price code identifier
		attr_accessor :id
		# The price code name
		attr_accessor :name
		# The price
		attr_accessor :price
		# A list of the descriptions for this price on different languages (language code and translation)
		attr_accessor :descriptions

		def id=(val)
			@id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['price'] != nil
				self.price = KalturaClientBase.object_from_xml(xml_element.elements['price'], 'KalturaPrice')
			end
			if xml_element.elements['descriptions'] != nil
				self.descriptions = KalturaClientBase.object_from_xml(xml_element.elements['descriptions'], 'KalturaTranslationToken')
			end
		end

	end

	# Discount module
	class KalturaDiscountModule < KalturaObjectBase
		# The discount percentage
		attr_accessor :percent
		# The first date the discount is available
		attr_accessor :start_date
		# The last date the discount is available
		attr_accessor :end_date

		def percent=(val)
			@percent = val.to_f
		end
		def start_date=(val)
			@start_date = val.to_i
		end
		def end_date=(val)
			@end_date = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['percent'] != nil
				self.percent = xml_element.elements['percent'].text
			end
			if xml_element.elements['startDate'] != nil
				self.start_date = xml_element.elements['startDate'].text
			end
			if xml_element.elements['endDate'] != nil
				self.end_date = xml_element.elements['endDate'].text
			end
		end

	end

	# Coupons group details
	class KalturaCouponsGroup < KalturaObjectBase
		# Coupon group identifier
		attr_accessor :id
		# Coupon group name
		attr_accessor :name
		# A list of the descriptions of the coupon group on different languages (language code and translation)
		attr_accessor :descriptions
		# The first date the coupons in this coupons group are valid
		attr_accessor :start_date
		# The last date the coupons in this coupons group are valid
		attr_accessor :end_date
		# Maximum number of uses for each coupon in the group
		attr_accessor :max_uses_number
		# Maximum number of uses for each coupon in the group on a renewable subscription
		attr_accessor :max_uses_number_on_renewable_sub

		def start_date=(val)
			@start_date = val.to_i
		end
		def end_date=(val)
			@end_date = val.to_i
		end
		def max_uses_number=(val)
			@max_uses_number = val.to_i
		end
		def max_uses_number_on_renewable_sub=(val)
			@max_uses_number_on_renewable_sub = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['descriptions'] != nil
				self.descriptions = KalturaClientBase.object_from_xml(xml_element.elements['descriptions'], 'KalturaTranslationToken')
			end
			if xml_element.elements['startDate'] != nil
				self.start_date = xml_element.elements['startDate'].text
			end
			if xml_element.elements['endDate'] != nil
				self.end_date = xml_element.elements['endDate'].text
			end
			if xml_element.elements['maxUsesNumber'] != nil
				self.max_uses_number = xml_element.elements['maxUsesNumber'].text
			end
			if xml_element.elements['maxUsesNumberOnRenewableSub'] != nil
				self.max_uses_number_on_renewable_sub = xml_element.elements['maxUsesNumberOnRenewableSub'].text
			end
		end

	end

	# Pricing usage module
	class KalturaUsageModule < KalturaObjectBase
		# Usage module identifier
		attr_accessor :id
		# Usage module name
		attr_accessor :name
		# The maximum number of times an item in this usage module can be viewed
		attr_accessor :max_views_number
		# The amount time an item is available for viewing since a user started watching the item
		attr_accessor :view_life_cycle
		# The amount time an item is available for viewing
		attr_accessor :full_life_cycle
		# Identifies a specific coupon linked to this object
		attr_accessor :coupon_id
		# Time period during which the end user can waive his rights to cancel a purchase. When the time period is passed, the purchase can no longer be cancelled
		attr_accessor :waiver_period
		# Indicates whether or not the end user has the right to waive his rights to cancel a purchase
		attr_accessor :is_waiver_enabled
		# Indicates that usage is targeted for offline playback
		attr_accessor :is_offline_playback

		def id=(val)
			@id = val.to_i
		end
		def max_views_number=(val)
			@max_views_number = val.to_i
		end
		def view_life_cycle=(val)
			@view_life_cycle = val.to_i
		end
		def full_life_cycle=(val)
			@full_life_cycle = val.to_i
		end
		def coupon_id=(val)
			@coupon_id = val.to_i
		end
		def waiver_period=(val)
			@waiver_period = val.to_i
		end
		def is_waiver_enabled=(val)
			@is_waiver_enabled = to_b(val)
		end
		def is_offline_playback=(val)
			@is_offline_playback = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['maxViewsNumber'] != nil
				self.max_views_number = xml_element.elements['maxViewsNumber'].text
			end
			if xml_element.elements['viewLifeCycle'] != nil
				self.view_life_cycle = xml_element.elements['viewLifeCycle'].text
			end
			if xml_element.elements['fullLifeCycle'] != nil
				self.full_life_cycle = xml_element.elements['fullLifeCycle'].text
			end
			if xml_element.elements['couponId'] != nil
				self.coupon_id = xml_element.elements['couponId'].text
			end
			if xml_element.elements['waiverPeriod'] != nil
				self.waiver_period = xml_element.elements['waiverPeriod'].text
			end
			if xml_element.elements['isWaiverEnabled'] != nil
				self.is_waiver_enabled = xml_element.elements['isWaiverEnabled'].text
			end
			if xml_element.elements['isOfflinePlayback'] != nil
				self.is_offline_playback = xml_element.elements['isOfflinePlayback'].text
			end
		end

	end

	# Price plan
	class KalturaPricePlan < KalturaUsageModule
		# Denotes whether or not this object can be renewed
		attr_accessor :is_renewable
		# Defines the number of times the module will be renewed (for the life_cycle period)
		attr_accessor :renewals_number
		# Unique identifier associated with this object&#39;s price
		attr_accessor :price_id
		# The discount module identifier of the price plan
		attr_accessor :discount_id

		def is_renewable=(val)
			@is_renewable = to_b(val)
		end
		def renewals_number=(val)
			@renewals_number = val.to_i
		end
		def price_id=(val)
			@price_id = val.to_i
		end
		def discount_id=(val)
			@discount_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['isRenewable'] != nil
				self.is_renewable = xml_element.elements['isRenewable'].text
			end
			if xml_element.elements['renewalsNumber'] != nil
				self.renewals_number = xml_element.elements['renewalsNumber'].text
			end
			if xml_element.elements['priceId'] != nil
				self.price_id = xml_element.elements['priceId'].text
			end
			if xml_element.elements['discountId'] != nil
				self.discount_id = xml_element.elements['discountId'].text
			end
		end

	end

	# Preview module
	class KalturaPreviewModule < KalturaObjectBase
		# Preview module identifier
		attr_accessor :id
		# Preview module name
		attr_accessor :name
		# Preview module life cycle - for how long the preview module is active
		attr_accessor :life_cycle
		# The time you can&#39;t buy the item to which the preview module is assigned to again
		attr_accessor :non_renewable_period

		def id=(val)
			@id = val.to_i
		end
		def life_cycle=(val)
			@life_cycle = val.to_i
		end
		def non_renewable_period=(val)
			@non_renewable_period = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['lifeCycle'] != nil
				self.life_cycle = xml_element.elements['lifeCycle'].text
			end
			if xml_element.elements['nonRenewablePeriod'] != nil
				self.non_renewable_period = xml_element.elements['nonRenewablePeriod'].text
			end
		end

	end

	# Subscription details
	class KalturaSubscription < KalturaObjectBase
		# Subscription identifier
		attr_accessor :id
		# A list of channels associated with this subscription
		attr_accessor :channels
		# The first date the subscription is available for purchasing
		attr_accessor :start_date
		# The last date the subscription is available for purchasing
		attr_accessor :end_date
		# A list of file types identifiers that are supported in this subscription
		attr_accessor :file_types
		# Denotes whether or not this subscription can be renewed
		attr_accessor :is_renewable
		# Defines the number of times this subscription will be renewed
		attr_accessor :renewals_number
		# Indicates whether the subscription will renew forever
		attr_accessor :is_infinite_renewal
		# The price of the subscription
		attr_accessor :price
		# The internal discount module for the subscription
		attr_accessor :discount_module
		# Coupons group for the subscription
		attr_accessor :coupons_group
		# A list of the name of the subscription on different languages (language code and translation)
		attr_accessor :names
		# A list of the descriptions of the subscriptions on different languages (language code and translation)
		attr_accessor :descriptions
		# Identifier of the media associated with the subscription
		attr_accessor :media_id
		# Subscription order (when returned in methods that retrieve subscriptions)
		attr_accessor :prority_in_order
		# Product code for the subscription
		attr_accessor :product_code
		# Subscription price plans
		attr_accessor :price_plans
		# Subscription preview module
		attr_accessor :preview_module
		# The household limitation module identifier associated with this subscription
		attr_accessor :household_limitations_id
		# The subscription grace period in minutes
		attr_accessor :grace_period_minutes
		# List of premium services included in the subscription
		attr_accessor :premium_services
		# The maximum number of times an item in this usage module can be viewed
		attr_accessor :max_views_number
		# The amount time an item is available for viewing since a user started watching the item
		attr_accessor :view_life_cycle
		# Time period during which the end user can waive his rights to cancel a purchase. When the time period is passed, the purchase can no longer be cancelled
		attr_accessor :waiver_period
		# Indicates whether or not the end user has the right to waive his rights to cancel a purchase
		attr_accessor :is_waiver_enabled
		# List of permitted user types for the subscription
		attr_accessor :user_types

		def start_date=(val)
			@start_date = val.to_i
		end
		def end_date=(val)
			@end_date = val.to_i
		end
		def is_renewable=(val)
			@is_renewable = to_b(val)
		end
		def renewals_number=(val)
			@renewals_number = val.to_i
		end
		def is_infinite_renewal=(val)
			@is_infinite_renewal = to_b(val)
		end
		def media_id=(val)
			@media_id = val.to_i
		end
		def prority_in_order=(val)
			@prority_in_order = val.to_i
		end
		def household_limitations_id=(val)
			@household_limitations_id = val.to_i
		end
		def grace_period_minutes=(val)
			@grace_period_minutes = val.to_i
		end
		def max_views_number=(val)
			@max_views_number = val.to_i
		end
		def view_life_cycle=(val)
			@view_life_cycle = val.to_i
		end
		def waiver_period=(val)
			@waiver_period = val.to_i
		end
		def is_waiver_enabled=(val)
			@is_waiver_enabled = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['channels'] != nil
				self.channels = KalturaClientBase.object_from_xml(xml_element.elements['channels'], 'KalturaBaseChannel')
			end
			if xml_element.elements['startDate'] != nil
				self.start_date = xml_element.elements['startDate'].text
			end
			if xml_element.elements['endDate'] != nil
				self.end_date = xml_element.elements['endDate'].text
			end
			if xml_element.elements['fileTypes'] != nil
				self.file_types = KalturaClientBase.object_from_xml(xml_element.elements['fileTypes'], 'KalturaIntegerValue')
			end
			if xml_element.elements['isRenewable'] != nil
				self.is_renewable = xml_element.elements['isRenewable'].text
			end
			if xml_element.elements['renewalsNumber'] != nil
				self.renewals_number = xml_element.elements['renewalsNumber'].text
			end
			if xml_element.elements['isInfiniteRenewal'] != nil
				self.is_infinite_renewal = xml_element.elements['isInfiniteRenewal'].text
			end
			if xml_element.elements['price'] != nil
				self.price = KalturaClientBase.object_from_xml(xml_element.elements['price'], 'KalturaPriceDetails')
			end
			if xml_element.elements['discountModule'] != nil
				self.discount_module = KalturaClientBase.object_from_xml(xml_element.elements['discountModule'], 'KalturaDiscountModule')
			end
			if xml_element.elements['couponsGroup'] != nil
				self.coupons_group = KalturaClientBase.object_from_xml(xml_element.elements['couponsGroup'], 'KalturaCouponsGroup')
			end
			if xml_element.elements['names'] != nil
				self.names = KalturaClientBase.object_from_xml(xml_element.elements['names'], 'KalturaTranslationToken')
			end
			if xml_element.elements['descriptions'] != nil
				self.descriptions = KalturaClientBase.object_from_xml(xml_element.elements['descriptions'], 'KalturaTranslationToken')
			end
			if xml_element.elements['mediaId'] != nil
				self.media_id = xml_element.elements['mediaId'].text
			end
			if xml_element.elements['prorityInOrder'] != nil
				self.prority_in_order = xml_element.elements['prorityInOrder'].text
			end
			if xml_element.elements['productCode'] != nil
				self.product_code = xml_element.elements['productCode'].text
			end
			if xml_element.elements['pricePlans'] != nil
				self.price_plans = KalturaClientBase.object_from_xml(xml_element.elements['pricePlans'], 'KalturaPricePlan')
			end
			if xml_element.elements['previewModule'] != nil
				self.preview_module = KalturaClientBase.object_from_xml(xml_element.elements['previewModule'], 'KalturaPreviewModule')
			end
			if xml_element.elements['householdLimitationsId'] != nil
				self.household_limitations_id = xml_element.elements['householdLimitationsId'].text
			end
			if xml_element.elements['gracePeriodMinutes'] != nil
				self.grace_period_minutes = xml_element.elements['gracePeriodMinutes'].text
			end
			if xml_element.elements['premiumServices'] != nil
				self.premium_services = KalturaClientBase.object_from_xml(xml_element.elements['premiumServices'], 'KalturaPremiumService')
			end
			if xml_element.elements['maxViewsNumber'] != nil
				self.max_views_number = xml_element.elements['maxViewsNumber'].text
			end
			if xml_element.elements['viewLifeCycle'] != nil
				self.view_life_cycle = xml_element.elements['viewLifeCycle'].text
			end
			if xml_element.elements['waiverPeriod'] != nil
				self.waiver_period = xml_element.elements['waiverPeriod'].text
			end
			if xml_element.elements['isWaiverEnabled'] != nil
				self.is_waiver_enabled = xml_element.elements['isWaiverEnabled'].text
			end
			if xml_element.elements['userTypes'] != nil
				self.user_types = KalturaClientBase.object_from_xml(xml_element.elements['userTypes'], 'KalturaOTTUserType')
			end
		end

	end

	# Subscriptions list
	class KalturaSubscriptionListResponse < KalturaListResponse
		# A list of subscriptions
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaSubscription')
			end
		end

	end

	# Prices list
	class KalturaProductsPriceListResponse < KalturaListResponse
		# A list of prices
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaProductPrice')
			end
		end

	end

	# Entitlement
	class KalturaEntitlement < KalturaObjectBase
		# Entitlement type
		attr_accessor :type
		# Entitlement identifier
		attr_accessor :entitlement_id
		# The current number of uses
		attr_accessor :current_uses
		# The end date of the entitlement
		attr_accessor :end_date
		# Current date
		attr_accessor :current_date
		# The last date the item was viewed
		attr_accessor :last_view_date
		# Purchase date
		attr_accessor :purchase_date
		# Purchase identifier (for subscriptions and collections only)
		attr_accessor :purchase_id
		# Payment Method
		attr_accessor :payment_method
		# The UDID of the device from which the purchase was made
		attr_accessor :device_udid
		# The name of the device from which the purchase was made
		attr_accessor :device_name
		# Indicates whether a cancelation window period is enabled
		attr_accessor :is_cancelation_window_enabled
		# The maximum number of uses available for this item (only for subscription and PPV)
		attr_accessor :max_uses
		# The date of the next renewal (only for subscription)
		attr_accessor :next_renewal_date
		# Indicates whether the subscription is renewable in this purchase (only for subscription)
		attr_accessor :is_renewable_for_purchase
		# Indicates whether a subscription is renewable (only for subscription)
		attr_accessor :is_renewable
		# Media file identifier (only for PPV)
		attr_accessor :media_file_id
		# Media identifier (only for PPV)
		attr_accessor :media_id
		# Indicates whether the user is currently in his grace period entitlement
		attr_accessor :is_in_grace_period

		def current_uses=(val)
			@current_uses = val.to_i
		end
		def end_date=(val)
			@end_date = val.to_i
		end
		def current_date=(val)
			@current_date = val.to_i
		end
		def last_view_date=(val)
			@last_view_date = val.to_i
		end
		def purchase_date=(val)
			@purchase_date = val.to_i
		end
		def purchase_id=(val)
			@purchase_id = val.to_i
		end
		def is_cancelation_window_enabled=(val)
			@is_cancelation_window_enabled = to_b(val)
		end
		def max_uses=(val)
			@max_uses = val.to_i
		end
		def next_renewal_date=(val)
			@next_renewal_date = val.to_i
		end
		def is_renewable_for_purchase=(val)
			@is_renewable_for_purchase = to_b(val)
		end
		def is_renewable=(val)
			@is_renewable = to_b(val)
		end
		def media_file_id=(val)
			@media_file_id = val.to_i
		end
		def media_id=(val)
			@media_id = val.to_i
		end
		def is_in_grace_period=(val)
			@is_in_grace_period = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['entitlementId'] != nil
				self.entitlement_id = xml_element.elements['entitlementId'].text
			end
			if xml_element.elements['currentUses'] != nil
				self.current_uses = xml_element.elements['currentUses'].text
			end
			if xml_element.elements['endDate'] != nil
				self.end_date = xml_element.elements['endDate'].text
			end
			if xml_element.elements['currentDate'] != nil
				self.current_date = xml_element.elements['currentDate'].text
			end
			if xml_element.elements['lastViewDate'] != nil
				self.last_view_date = xml_element.elements['lastViewDate'].text
			end
			if xml_element.elements['purchaseDate'] != nil
				self.purchase_date = xml_element.elements['purchaseDate'].text
			end
			if xml_element.elements['purchaseId'] != nil
				self.purchase_id = xml_element.elements['purchaseId'].text
			end
			if xml_element.elements['paymentMethod'] != nil
				self.payment_method = xml_element.elements['paymentMethod'].text
			end
			if xml_element.elements['deviceUdid'] != nil
				self.device_udid = xml_element.elements['deviceUdid'].text
			end
			if xml_element.elements['deviceName'] != nil
				self.device_name = xml_element.elements['deviceName'].text
			end
			if xml_element.elements['isCancelationWindowEnabled'] != nil
				self.is_cancelation_window_enabled = xml_element.elements['isCancelationWindowEnabled'].text
			end
			if xml_element.elements['maxUses'] != nil
				self.max_uses = xml_element.elements['maxUses'].text
			end
			if xml_element.elements['nextRenewalDate'] != nil
				self.next_renewal_date = xml_element.elements['nextRenewalDate'].text
			end
			if xml_element.elements['isRenewableForPurchase'] != nil
				self.is_renewable_for_purchase = xml_element.elements['isRenewableForPurchase'].text
			end
			if xml_element.elements['isRenewable'] != nil
				self.is_renewable = xml_element.elements['isRenewable'].text
			end
			if xml_element.elements['mediaFileId'] != nil
				self.media_file_id = xml_element.elements['mediaFileId'].text
			end
			if xml_element.elements['mediaId'] != nil
				self.media_id = xml_element.elements['mediaId'].text
			end
			if xml_element.elements['isInGracePeriod'] != nil
				self.is_in_grace_period = xml_element.elements['isInGracePeriod'].text
			end
		end

	end

	# Entitlements list
	class KalturaEntitlementListResponse < KalturaListResponse
		# A list of entitlements
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaEntitlement')
			end
		end

	end

	# Home network details
	class KalturaHomeNetwork < KalturaObjectBase
		# Home network identifier
		attr_accessor :external_id
		# Home network name
		attr_accessor :name
		# Home network description
		attr_accessor :description
		# Is home network is active
		attr_accessor :is_active

		def is_active=(val)
			@is_active = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['externalId'] != nil
				self.external_id = xml_element.elements['externalId'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['isActive'] != nil
				self.is_active = xml_element.elements['isActive'].text
			end
		end

	end

	# Home networks
	class KalturaHomeNetworkListResponse < KalturaListResponse
		# Home networks
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaHomeNetwork')
			end
		end

	end

	# Favorite details
	class KalturaFavorite < KalturaObjectBase
		# AssetInfo Model
		attr_accessor :asset_id
		# Extra Value
		attr_accessor :extra_data
		# Specifies when was the favorite created. Date and time represented as epoch.
		attr_accessor :create_date

		def asset_id=(val)
			@asset_id = val.to_i
		end
		def create_date=(val)
			@create_date = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['assetId'] != nil
				self.asset_id = xml_element.elements['assetId'].text
			end
			if xml_element.elements['extraData'] != nil
				self.extra_data = xml_element.elements['extraData'].text
			end
			if xml_element.elements['createDate'] != nil
				self.create_date = xml_element.elements['createDate'].text
			end
		end

	end

	# Favorite list
	class KalturaFavoriteListResponse < KalturaListResponse
		# A list of favorites
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaFavorite')
			end
		end

	end

	# Users list
	class KalturaOTTUserListResponse < KalturaListResponse
		# A list of users
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaOTTUser')
			end
		end

	end

	# List of assets statistics
	class KalturaAssetStatisticsListResponse < KalturaListResponse
		# Assets
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaAssetStatistics')
			end
		end

	end

	# Slim assets wrapper
	class KalturaSlimAssetInfoWrapper < KalturaListResponse
		# Assets
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaBaseAssetInfo')
			end
		end

	end

	# Watch history asset info
	class KalturaAssetHistory < KalturaObjectBase
		# Asset identifier
		attr_accessor :asset_id
		# Position in seconds of the relevant asset
		attr_accessor :position
		# Duration in seconds of the relevant asset
		attr_accessor :duration
		# The date when the media was last watched
		attr_accessor :watched_date
		# Boolean which specifies whether the user finished watching the movie or not
		attr_accessor :finished_watching

		def asset_id=(val)
			@asset_id = val.to_i
		end
		def position=(val)
			@position = val.to_i
		end
		def duration=(val)
			@duration = val.to_i
		end
		def watched_date=(val)
			@watched_date = val.to_i
		end
		def finished_watching=(val)
			@finished_watching = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['assetId'] != nil
				self.asset_id = xml_element.elements['assetId'].text
			end
			if xml_element.elements['position'] != nil
				self.position = xml_element.elements['position'].text
			end
			if xml_element.elements['duration'] != nil
				self.duration = xml_element.elements['duration'].text
			end
			if xml_element.elements['watchedDate'] != nil
				self.watched_date = xml_element.elements['watchedDate'].text
			end
			if xml_element.elements['finishedWatching'] != nil
				self.finished_watching = xml_element.elements['finishedWatching'].text
			end
		end

	end

	# Watch history asset wrapper
	class KalturaAssetHistoryListResponse < KalturaListResponse
		# WatchHistoryAssets Models
		attr_accessor :objects


		def from_xml(xml_element)
			super
			if xml_element.elements['objects'] != nil
				self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaAssetHistory')
			end
		end

	end

	# Application token
	class KalturaAppToken < KalturaObjectBase
		# The id of the application token
		attr_accessor :id
		# Expiry time of current token (unix timestamp in seconds)
		attr_accessor :expiry
		# Partner identifier
		attr_accessor :partner_id
		# Expiry duration of KS (Kaltura Session) that created using the current token (in seconds)
		attr_accessor :session_duration
		# The hash type of the token
		attr_accessor :hash_type
		# Comma separated privileges to be applied on KS (Kaltura Session) that created using the current token
		attr_accessor :session_privileges
		# Type of KS (Kaltura Session) that created using the current token
		attr_accessor :session_type
		# Application token status
		attr_accessor :status
		# The application token
		attr_accessor :token
		# User id of KS (Kaltura Session) that created using the current token
		attr_accessor :session_user_id

		def expiry=(val)
			@expiry = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def session_duration=(val)
			@session_duration = val.to_i
		end
		def session_type=(val)
			@session_type = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['expiry'] != nil
				self.expiry = xml_element.elements['expiry'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['sessionDuration'] != nil
				self.session_duration = xml_element.elements['sessionDuration'].text
			end
			if xml_element.elements['hashType'] != nil
				self.hash_type = xml_element.elements['hashType'].text
			end
			if xml_element.elements['sessionPrivileges'] != nil
				self.session_privileges = xml_element.elements['sessionPrivileges'].text
			end
			if xml_element.elements['sessionType'] != nil
				self.session_type = xml_element.elements['sessionType'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['token'] != nil
				self.token = xml_element.elements['token'].text
			end
			if xml_element.elements['sessionUserId'] != nil
				self.session_user_id = xml_element.elements['sessionUserId'].text
			end
		end

	end

	# Kaltura Session
	class KalturaSession < KalturaObjectBase
		# KS
		attr_accessor :ks
		# Session type
		attr_accessor :session_type
		# Partner identifier
		attr_accessor :partner_id
		# User identifier
		attr_accessor :user_id
		# Expiry
		attr_accessor :expiry
		# Privileges
		attr_accessor :privileges
		# udid
		attr_accessor :udid

		def session_type=(val)
			@session_type = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def expiry=(val)
			@expiry = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['ks'] != nil
				self.ks = xml_element.elements['ks'].text
			end
			if xml_element.elements['sessionType'] != nil
				self.session_type = xml_element.elements['sessionType'].text
			end
			if xml_element.elements['partnerId'] != nil
				self.partner_id = xml_element.elements['partnerId'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['expiry'] != nil
				self.expiry = xml_element.elements['expiry'].text
			end
			if xml_element.elements['privileges'] != nil
				self.privileges = xml_element.elements['privileges'].text
			end
			if xml_element.elements['udid'] != nil
				self.udid = xml_element.elements['udid'].text
			end
		end

	end

	# Kaltura Session
	class KalturaSessionInfo < KalturaSession


		def from_xml(xml_element)
			super
		end

	end

	class KalturaAssetFilter < KalturaFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaBundleFilter < KalturaAssetFilter
		# Bundle Id.
		attr_accessor :id_equal
		# Comma separated list of asset types to search within. 
		#             Possible values: 0 – EPG linear programs entries, any media type ID (according to media type IDs defined dynamically in the system).
		#             If omitted – all types should be included.
		attr_accessor :type_in
		# bundleType - possible values: Subscription or Collection
		attr_accessor :bundle_type_equal

		def id_equal=(val)
			@id_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['typeIn'] != nil
				self.type_in = xml_element.elements['typeIn'].text
			end
			if xml_element.elements['bundleTypeEqual'] != nil
				self.bundle_type_equal = xml_element.elements['bundleTypeEqual'].text
			end
		end

	end

	class KalturaChannelExternalFilter < KalturaAssetFilter
		# External Channel Id.
		attr_accessor :id_equal
		# UtcOffsetEqual
		attr_accessor :utc_offset_equal
		# FreeTextEqual
		attr_accessor :free_text

		def id_equal=(val)
			@id_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['utcOffsetEqual'] != nil
				self.utc_offset_equal = xml_element.elements['utcOffsetEqual'].text
			end
			if xml_element.elements['freeText'] != nil
				self.free_text = xml_element.elements['freeText'].text
			end
		end

	end

	class KalturaChannelFilter < KalturaAssetFilter
		# Channel Id
		attr_accessor :id_equal
		attr_accessor :k_sql

		def id_equal=(val)
			@id_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['kSql'] != nil
				self.k_sql = xml_element.elements['kSql'].text
			end
		end

	end

	class KalturaRelatedFilter < KalturaAssetFilter
		# Search assets using dynamic criteria. Provided collection of nested expressions with key, comparison operators, value, and logical conjunction.
		#             Possible keys: any Tag or Meta defined in the system and the following reserved keys: start_date, end_date. 
		#             epg_id, media_id - for specific asset IDs.
		#             geo_block - only valid value is "true": When enabled, only assets that are not restriced to the user by geo-block rules will return.
		#             parental_rules - only valid value is "true": When enabled, only assets that the user doesn&#39;t need to provide PIN code will return.
		#             epg_channel_id – the channel identifier of the EPG program.
		#             entitled_assets - valid values: "free", "entitled", "both". free - gets only free to watch assets. entitled - only those that the user is implicitly entitled to watch.
		#             Comparison operators: for numerical fields =, >, >=, <, <=, : (in). For alpha-numerical fields =, != (not), ~ (like), !~, ^ (starts with). Logical conjunction: and, or. 
		#             Search values are limited to 20 characters each.
		#             (maximum length of entire filter is 1024 characters)
		attr_accessor :k_sql
		# the ID of the asset for which to return related assets
		attr_accessor :id_equal
		# Comma separated list of asset types to search within. 
		#             Possible values: 0 – EPG linear programs entries, any media type ID (according to media type IDs defined dynamically in the system).
		#             If omitted – all types should be included.
		attr_accessor :type_in


		def from_xml(xml_element)
			super
			if xml_element.elements['kSql'] != nil
				self.k_sql = xml_element.elements['kSql'].text
			end
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['typeIn'] != nil
				self.type_in = xml_element.elements['typeIn'].text
			end
		end

	end

	class KalturaRelatedExternalFilter < KalturaAssetFilter
		# the External ID of the asset for which to return related assets
		attr_accessor :id_equal
		# Comma separated list of asset types to search within. 
		#             Possible values: 0 – EPG linear programs entries, any media type ID (according to media type IDs defined dynamically in the system).
		#             If omitted – all types should be included.
		attr_accessor :type_in
		# UtcOffsetEqual
		attr_accessor :utc_offset_equal
		# FreeText
		attr_accessor :free_text

		def id_equal=(val)
			@id_equal = val.to_i
		end
		def utc_offset_equal=(val)
			@utc_offset_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['idEqual'] != nil
				self.id_equal = xml_element.elements['idEqual'].text
			end
			if xml_element.elements['typeIn'] != nil
				self.type_in = xml_element.elements['typeIn'].text
			end
			if xml_element.elements['utcOffsetEqual'] != nil
				self.utc_offset_equal = xml_element.elements['utcOffsetEqual'].text
			end
			if xml_element.elements['freeText'] != nil
				self.free_text = xml_element.elements['freeText'].text
			end
		end

	end

	class KalturaSearchAssetFilter < KalturaAssetFilter
		# Search assets using dynamic criteria. Provided collection of nested expressions with key, comparison operators, value, and logical conjunction.
		#             Possible keys: any Tag or Meta defined in the system and the following reserved keys: start_date, end_date. 
		#             epg_id, media_id - for specific asset IDs.
		#             geo_block - only valid value is "true": When enabled, only assets that are not restriced to the user by geo-block rules will return.
		#             parental_rules - only valid value is "true": When enabled, only assets that the user doesn&#39;t need to provide PIN code will return.
		#             epg_channel_id – the channel identifier of the EPG program.
		#             entitled_assets - valid values: "free", "entitled", "both". free - gets only free to watch assets. entitled - only those that the user is implicitly entitled to watch.
		#             Comparison operators: for numerical fields =, >, >=, <, <=, : (in). For alpha-numerical fields =, != (not), ~ (like), !~, ^ (starts with). Logical conjunction: and, or. 
		#             Search values are limited to 20 characters each.
		#             (maximum length of entire filter is 1024 characters)
		attr_accessor :k_sql
		# Comma separated list of asset types to search within. 
		#             Possible values: 0 – EPG linear programs entries, any media type ID (according to media type IDs defined dynamically in the system).
		#             If omitted – all types should be included.
		attr_accessor :type_in
		# Comma separated list of EPG channel ids to search within.
		attr_accessor :id_in


		def from_xml(xml_element)
			super
			if xml_element.elements['kSql'] != nil
				self.k_sql = xml_element.elements['kSql'].text
			end
			if xml_element.elements['typeIn'] != nil
				self.type_in = xml_element.elements['typeIn'].text
			end
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
		end

	end

	class KalturaSearchExternalFilter < KalturaAssetFilter
		# Query
		attr_accessor :query
		# UtcOffsetEqual
		attr_accessor :utc_offset_equal
		# Comma separated list of asset types to search within. 
		#             Possible values: 0 – EPG linear programs entries, any media type ID (according to media type IDs defined dynamically in the system).
		#             If omitted – all types should be included.
		attr_accessor :type_in

		def utc_offset_equal=(val)
			@utc_offset_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['query'] != nil
				self.query = xml_element.elements['query'].text
			end
			if xml_element.elements['utcOffsetEqual'] != nil
				self.utc_offset_equal = xml_element.elements['utcOffsetEqual'].text
			end
			if xml_element.elements['typeIn'] != nil
				self.type_in = xml_element.elements['typeIn'].text
			end
		end

	end

	class KalturaAssetFileContext < KalturaObjectBase
		# viewLifeCycle
		attr_accessor :view_life_cycle
		# fullLifeCycle
		attr_accessor :full_life_cycle
		# isOfflinePlayBack
		attr_accessor :is_offline_play_back

		def is_offline_play_back=(val)
			@is_offline_play_back = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['viewLifeCycle'] != nil
				self.view_life_cycle = xml_element.elements['viewLifeCycle'].text
			end
			if xml_element.elements['fullLifeCycle'] != nil
				self.full_life_cycle = xml_element.elements['fullLifeCycle'].text
			end
			if xml_element.elements['isOfflinePlayBack'] != nil
				self.is_offline_play_back = xml_element.elements['isOfflinePlayBack'].text
			end
		end

	end

	class KalturaAssetStatisticsQuery < KalturaObjectBase
		# Comma separated list of asset identifiers.
		attr_accessor :asset_id_in
		# Asset type
		attr_accessor :asset_type_equal
		# The beginning of the time window to get the statistics for (in epoch).
		attr_accessor :start_date_greater_than_or_equal
		# /// The end of the time window to get the statistics for (in epoch).
		attr_accessor :end_date_greater_than_or_equal

		def start_date_greater_than_or_equal=(val)
			@start_date_greater_than_or_equal = val.to_i
		end
		def end_date_greater_than_or_equal=(val)
			@end_date_greater_than_or_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['assetIdIn'] != nil
				self.asset_id_in = xml_element.elements['assetIdIn'].text
			end
			if xml_element.elements['assetTypeEqual'] != nil
				self.asset_type_equal = xml_element.elements['assetTypeEqual'].text
			end
			if xml_element.elements['startDateGreaterThanOrEqual'] != nil
				self.start_date_greater_than_or_equal = xml_element.elements['startDateGreaterThanOrEqual'].text
			end
			if xml_element.elements['endDateGreaterThanOrEqual'] != nil
				self.end_date_greater_than_or_equal = xml_element.elements['endDateGreaterThanOrEqual'].text
			end
		end

	end

	class KalturaCDNPartnerSettings < KalturaObjectBase
		# Default CDN adapter identifier
		attr_accessor :default_adapter_id
		# Default recording CDN adapter identifier
		attr_accessor :default_recording_adapter_id

		def default_adapter_id=(val)
			@default_adapter_id = val.to_i
		end
		def default_recording_adapter_id=(val)
			@default_recording_adapter_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['defaultAdapterId'] != nil
				self.default_adapter_id = xml_element.elements['defaultAdapterId'].text
			end
			if xml_element.elements['defaultRecordingAdapterId'] != nil
				self.default_recording_adapter_id = xml_element.elements['defaultRecordingAdapterId'].text
			end
		end

	end

	class KalturaRegionFilter < KalturaFilter
		# List of comma separated regions external identifiers
		attr_accessor :external_id_in


		def from_xml(xml_element)
			super
			if xml_element.elements['externalIdIn'] != nil
				self.external_id_in = xml_element.elements['externalIdIn'].text
			end
		end

	end

	class KalturaAssetCommentFilter < KalturaFilter
		# Asset Id
		attr_accessor :asset_id_equal
		# Asset Type
		attr_accessor :asset_type_equal

		def asset_id_equal=(val)
			@asset_id_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['assetIdEqual'] != nil
				self.asset_id_equal = xml_element.elements['assetIdEqual'].text
			end
			if xml_element.elements['assetTypeEqual'] != nil
				self.asset_type_equal = xml_element.elements['assetTypeEqual'].text
			end
		end

	end

	class KalturaKeyValue < KalturaObjectBase
		attr_accessor :key
		attr_accessor :value


		def from_xml(xml_element)
			super
			if xml_element.elements['key'] != nil
				self.key = xml_element.elements['key'].text
			end
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
		end

	end

	class KalturaPaymentGatewayConfiguration < KalturaObjectBase
		# Payment gateway configuration
		attr_accessor :payment_gatewaye_configuration


		def from_xml(xml_element)
			super
			if xml_element.elements['paymentGatewayeConfiguration'] != nil
				self.payment_gatewaye_configuration = KalturaClientBase.object_from_xml(xml_element.elements['paymentGatewayeConfiguration'], 'KalturaKeyValue')
			end
		end

	end

	class KalturaProductPriceFilter < KalturaFilter
		# Comma separated subscriptions identifiers
		attr_accessor :subscription_id_in
		# Comma separated media files identifiers
		attr_accessor :file_id_in
		# A flag that indicates if only the lowest price of an item should return
		attr_accessor :is_lowest
		# Discount coupon code
		attr_accessor :coupon_code_equal

		def is_lowest=(val)
			@is_lowest = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['subscriptionIdIn'] != nil
				self.subscription_id_in = xml_element.elements['subscriptionIdIn'].text
			end
			if xml_element.elements['fileIdIn'] != nil
				self.file_id_in = xml_element.elements['fileIdIn'].text
			end
			if xml_element.elements['isLowest'] != nil
				self.is_lowest = xml_element.elements['isLowest'].text
			end
			if xml_element.elements['couponCodeEqual'] != nil
				self.coupon_code_equal = xml_element.elements['couponCodeEqual'].text
			end
		end

	end

	# Filtering recordings
	class KalturaSeriesRecordingFilter < KalturaFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaHouseholdQuota < KalturaObjectBase
		# Household identifier
		attr_accessor :household_id
		# Total quota that is allocated to the household
		attr_accessor :total_quota
		# Available quota that household has remaining
		attr_accessor :available_quota

		def household_id=(val)
			@household_id = val.to_i
		end
		def total_quota=(val)
			@total_quota = val.to_i
		end
		def available_quota=(val)
			@available_quota = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['householdId'] != nil
				self.household_id = xml_element.elements['householdId'].text
			end
			if xml_element.elements['totalQuota'] != nil
				self.total_quota = xml_element.elements['totalQuota'].text
			end
			if xml_element.elements['availableQuota'] != nil
				self.available_quota = xml_element.elements['availableQuota'].text
			end
		end

	end

	class KalturaInboxMessageFilter < KalturaFilter
		# List of inbox message types to search within.
		attr_accessor :type_in
		# createdAtGreaterThanOrEqual
		attr_accessor :created_at_greater_than_or_equal
		# createdAtLessThanOrEqual
		attr_accessor :created_at_less_than_or_equal

		def created_at_greater_than_or_equal=(val)
			@created_at_greater_than_or_equal = val.to_i
		end
		def created_at_less_than_or_equal=(val)
			@created_at_less_than_or_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['typeIn'] != nil
				self.type_in = xml_element.elements['typeIn'].text
			end
			if xml_element.elements['createdAtGreaterThanOrEqual'] != nil
				self.created_at_greater_than_or_equal = xml_element.elements['createdAtGreaterThanOrEqual'].text
			end
			if xml_element.elements['createdAtLessThanOrEqual'] != nil
				self.created_at_less_than_or_equal = xml_element.elements['createdAtLessThanOrEqual'].text
			end
		end

	end

	class KalturaMessageTemplate < KalturaObjectBase
		# The message template with placeholders
		attr_accessor :message
		# Default date format for the date & time entries used in the template
		attr_accessor :date_format
		# Template type. Possible values: Series
		attr_accessor :asset_type
		# Sound file name to play upon message arrival to the device (if supported by target device)
		attr_accessor :sound
		# an optional action
		attr_accessor :action
		# URL template for deep linking. Example - /app/location/{mediaId}
		attr_accessor :url

		def asset_type=(val)
			@asset_type = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['message'] != nil
				self.message = xml_element.elements['message'].text
			end
			if xml_element.elements['dateFormat'] != nil
				self.date_format = xml_element.elements['dateFormat'].text
			end
			if xml_element.elements['assetType'] != nil
				self.asset_type = xml_element.elements['assetType'].text
			end
			if xml_element.elements['sound'] != nil
				self.sound = xml_element.elements['sound'].text
			end
			if xml_element.elements['action'] != nil
				self.action = xml_element.elements['action'].text
			end
			if xml_element.elements['url'] != nil
				self.url = xml_element.elements['url'].text
			end
		end

	end

	class KalturaFollowTvSeriesFilter < KalturaFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaPersonalFeedFilter < KalturaFilter


		def from_xml(xml_element)
			super
		end

	end

	# PPV details
	class KalturaPpv < KalturaObjectBase
		# PPV identifier
		attr_accessor :id
		# the name for the ppv
		attr_accessor :name
		# The price of the ppv
		attr_accessor :price
		# A list of file types identifiers that are supported in this ppv
		attr_accessor :file_types
		# The internal discount module for the ppv
		attr_accessor :discount_modules
		# Coupons group for the ppv
		attr_accessor :coupons_group
		# A list of the descriptions of the ppv on different languages (language code and translation)
		attr_accessor :descriptions
		# Product code for the ppv
		attr_accessor :product_code
		# Indicates whether or not this ppv can be purchased standalone or only as part of a subscription
		attr_accessor :is_subscription_only
		# Indicates whether or not this ppv can be consumed only on the first device
		attr_accessor :first_device_limitation
		# PPV usage module
		attr_accessor :usage_module

		def is_subscription_only=(val)
			@is_subscription_only = to_b(val)
		end
		def first_device_limitation=(val)
			@first_device_limitation = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['price'] != nil
				self.price = KalturaClientBase.object_from_xml(xml_element.elements['price'], 'KalturaPriceDetails')
			end
			if xml_element.elements['fileTypes'] != nil
				self.file_types = KalturaClientBase.object_from_xml(xml_element.elements['fileTypes'], 'KalturaIntegerValue')
			end
			if xml_element.elements['discountModules'] != nil
				self.discount_modules = KalturaClientBase.object_from_xml(xml_element.elements['discountModules'], 'KalturaDiscountModule')
			end
			if xml_element.elements['couponsGroup'] != nil
				self.coupons_group = KalturaClientBase.object_from_xml(xml_element.elements['couponsGroup'], 'KalturaCouponsGroup')
			end
			if xml_element.elements['descriptions'] != nil
				self.descriptions = KalturaClientBase.object_from_xml(xml_element.elements['descriptions'], 'KalturaTranslationToken')
			end
			if xml_element.elements['productCode'] != nil
				self.product_code = xml_element.elements['productCode'].text
			end
			if xml_element.elements['isSubscriptionOnly'] != nil
				self.is_subscription_only = xml_element.elements['isSubscriptionOnly'].text
			end
			if xml_element.elements['firstDeviceLimitation'] != nil
				self.first_device_limitation = xml_element.elements['firstDeviceLimitation'].text
			end
			if xml_element.elements['usageModule'] != nil
				self.usage_module = KalturaClientBase.object_from_xml(xml_element.elements['usageModule'], 'KalturaUsageModule')
			end
		end

	end

	# Filtering recordings
	class KalturaRecordingFilter < KalturaFilter
		# Recording Statuses
		attr_accessor :status_in
		# KSQL expression
		attr_accessor :filter_expression


		def from_xml(xml_element)
			super
			if xml_element.elements['statusIn'] != nil
				self.status_in = xml_element.elements['statusIn'].text
			end
			if xml_element.elements['filterExpression'] != nil
				self.filter_expression = xml_element.elements['filterExpression'].text
			end
		end

	end

	class KalturaLicensedUrl < KalturaObjectBase
		# Main licensed URL
		attr_accessor :main_url
		# An alternate URL to use in case the main fails
		attr_accessor :alt_url


		def from_xml(xml_element)
			super
			if xml_element.elements['mainUrl'] != nil
				self.main_url = xml_element.elements['mainUrl'].text
			end
			if xml_element.elements['altUrl'] != nil
				self.alt_url = xml_element.elements['altUrl'].text
			end
		end

	end

	class KalturaLicensedUrlBaseRequest < KalturaObjectBase
		# Asset identifier
		attr_accessor :asset_id


		def from_xml(xml_element)
			super
			if xml_element.elements['assetId'] != nil
				self.asset_id = xml_element.elements['assetId'].text
			end
		end

	end

	class KalturaLicensedUrlMediaRequest < KalturaLicensedUrlBaseRequest
		# Identifier of the content to get the link for (file identifier)
		attr_accessor :content_id
		# Base URL for the licensed URLs
		attr_accessor :base_url

		def content_id=(val)
			@content_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['contentId'] != nil
				self.content_id = xml_element.elements['contentId'].text
			end
			if xml_element.elements['baseUrl'] != nil
				self.base_url = xml_element.elements['baseUrl'].text
			end
		end

	end

	class KalturaLicensedUrlEpgRequest < KalturaLicensedUrlMediaRequest
		# The stream type to get the URL for
		attr_accessor :stream_type
		# The start date of the stream (epoch)
		attr_accessor :start_date

		def start_date=(val)
			@start_date = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['streamType'] != nil
				self.stream_type = xml_element.elements['streamType'].text
			end
			if xml_element.elements['startDate'] != nil
				self.start_date = xml_element.elements['startDate'].text
			end
		end

	end

	class KalturaLicensedUrlRecordingRequest < KalturaLicensedUrlBaseRequest
		# The file type for the URL
		attr_accessor :file_type


		def from_xml(xml_element)
			super
			if xml_element.elements['fileType'] != nil
				self.file_type = xml_element.elements['fileType'].text
			end
		end

	end

	class KalturaRegistryResponse < KalturaObjectBase
		# Announcement Id
		attr_accessor :announcement_id
		# Key
		attr_accessor :key
		# URL
		attr_accessor :url

		def announcement_id=(val)
			@announcement_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['announcementId'] != nil
				self.announcement_id = xml_element.elements['announcementId'].text
			end
			if xml_element.elements['key'] != nil
				self.key = xml_element.elements['key'].text
			end
			if xml_element.elements['url'] != nil
				self.url = xml_element.elements['url'].text
			end
		end

	end

	class KalturaNotificationsPartnerSettings < KalturaObjectBase
		# Push notification capability is enabled for the account
		attr_accessor :push_notification_enabled
		# System announcement capability is enabled for the account
		attr_accessor :push_system_announcements_enabled
		# Window start time (UTC) for send automated push messages
		attr_accessor :push_start_hour
		# Window end time (UTC) for send automated push messages
		attr_accessor :push_end_hour
		# Inbox enabled
		attr_accessor :inbox_enabled
		# Message TTL in days
		attr_accessor :message_ttl_days
		# Automatic issue follow notification
		attr_accessor :automatic_issue_follow_notification
		# Topic expiration duration in days
		attr_accessor :topic_expiration_duration_days

		def push_notification_enabled=(val)
			@push_notification_enabled = to_b(val)
		end
		def push_system_announcements_enabled=(val)
			@push_system_announcements_enabled = to_b(val)
		end
		def push_start_hour=(val)
			@push_start_hour = val.to_i
		end
		def push_end_hour=(val)
			@push_end_hour = val.to_i
		end
		def inbox_enabled=(val)
			@inbox_enabled = to_b(val)
		end
		def message_ttl_days=(val)
			@message_ttl_days = val.to_i
		end
		def automatic_issue_follow_notification=(val)
			@automatic_issue_follow_notification = to_b(val)
		end
		def topic_expiration_duration_days=(val)
			@topic_expiration_duration_days = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['pushNotificationEnabled'] != nil
				self.push_notification_enabled = xml_element.elements['pushNotificationEnabled'].text
			end
			if xml_element.elements['pushSystemAnnouncementsEnabled'] != nil
				self.push_system_announcements_enabled = xml_element.elements['pushSystemAnnouncementsEnabled'].text
			end
			if xml_element.elements['pushStartHour'] != nil
				self.push_start_hour = xml_element.elements['pushStartHour'].text
			end
			if xml_element.elements['pushEndHour'] != nil
				self.push_end_hour = xml_element.elements['pushEndHour'].text
			end
			if xml_element.elements['inboxEnabled'] != nil
				self.inbox_enabled = xml_element.elements['inboxEnabled'].text
			end
			if xml_element.elements['messageTTLDays'] != nil
				self.message_ttl_days = xml_element.elements['messageTTLDays'].text
			end
			if xml_element.elements['automaticIssueFollowNotification'] != nil
				self.automatic_issue_follow_notification = xml_element.elements['automaticIssueFollowNotification'].text
			end
			if xml_element.elements['topicExpirationDurationDays'] != nil
				self.topic_expiration_duration_days = xml_element.elements['topicExpirationDurationDays'].text
			end
		end

	end

	class KalturaNotificationsSettings < KalturaObjectBase
		# Specify if the user want to receive push notifications or not
		attr_accessor :push_notification_enabled
		# Specify if the user will be notified for followed content via push. (requires push_notification_enabled to be enabled)
		attr_accessor :push_follow_enabled

		def push_notification_enabled=(val)
			@push_notification_enabled = to_b(val)
		end
		def push_follow_enabled=(val)
			@push_follow_enabled = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['pushNotificationEnabled'] != nil
				self.push_notification_enabled = xml_element.elements['pushNotificationEnabled'].text
			end
			if xml_element.elements['pushFollowEnabled'] != nil
				self.push_follow_enabled = xml_element.elements['pushFollowEnabled'].text
			end
		end

	end

	class KalturaPaymentMethodProfileFilter < KalturaFilter
		# Payment gateway identifier to list the payment methods for
		attr_accessor :payment_gateway_id_equal

		def payment_gateway_id_equal=(val)
			@payment_gateway_id_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['paymentGatewayIdEqual'] != nil
				self.payment_gateway_id_equal = xml_element.elements['paymentGatewayIdEqual'].text
			end
		end

	end

	class KalturaTimeShiftedTvPartnerSettings < KalturaObjectBase
		# Is catch-up enabled
		attr_accessor :catch_up_enabled
		# Is c-dvr enabled
		attr_accessor :cdvr_enabled
		# Is start-over enabled
		attr_accessor :start_over_enabled
		# Is trick-play enabled
		attr_accessor :trick_play_enabled
		# Is recording schedule window enabled
		attr_accessor :recording_schedule_window_enabled
		# Is recording protection enabled
		attr_accessor :protection_enabled
		# Catch-up buffer length
		attr_accessor :catch_up_buffer_length
		# Trick play buffer length
		attr_accessor :trick_play_buffer_length
		# Recording schedule window. Indicates how long (in minutes) after the program starts it is allowed to schedule the recording
		attr_accessor :recording_schedule_window
		# Indicates how long (in seconds) before the program starts the recording will begin
		attr_accessor :padding_before_program_starts
		# Indicates how long (in seconds) after the program ends the recording will end
		attr_accessor :padding_after_program_ends
		# Specify the time in days that a recording should be protected. Start time begins at protection request.
		attr_accessor :protection_period
		# Indicates how many percent of the quota can be used for protection
		attr_accessor :protection_quota_percentage
		# Specify the time in days that a recording should be kept for user. Start time begins with the program end date.
		attr_accessor :recording_lifetime_period
		# The time in days before the recording lifetime is due from which the client should be able to warn user about deletion.
		attr_accessor :cleanup_notice_peroid
		# Is recording of series enabled
		attr_accessor :series_recording_enabled
		# Is recording playback for non-entitled channel enables
		attr_accessor :non_entitled_channel_playback_enabled
		# Is recording playback for non-existing channel enables
		attr_accessor :non_existing_channel_playback_enabled

		def catch_up_enabled=(val)
			@catch_up_enabled = to_b(val)
		end
		def cdvr_enabled=(val)
			@cdvr_enabled = to_b(val)
		end
		def start_over_enabled=(val)
			@start_over_enabled = to_b(val)
		end
		def trick_play_enabled=(val)
			@trick_play_enabled = to_b(val)
		end
		def recording_schedule_window_enabled=(val)
			@recording_schedule_window_enabled = to_b(val)
		end
		def protection_enabled=(val)
			@protection_enabled = to_b(val)
		end
		def catch_up_buffer_length=(val)
			@catch_up_buffer_length = val.to_i
		end
		def trick_play_buffer_length=(val)
			@trick_play_buffer_length = val.to_i
		end
		def recording_schedule_window=(val)
			@recording_schedule_window = val.to_i
		end
		def padding_before_program_starts=(val)
			@padding_before_program_starts = val.to_i
		end
		def padding_after_program_ends=(val)
			@padding_after_program_ends = val.to_i
		end
		def protection_period=(val)
			@protection_period = val.to_i
		end
		def protection_quota_percentage=(val)
			@protection_quota_percentage = val.to_i
		end
		def recording_lifetime_period=(val)
			@recording_lifetime_period = val.to_i
		end
		def cleanup_notice_peroid=(val)
			@cleanup_notice_peroid = val.to_i
		end
		def series_recording_enabled=(val)
			@series_recording_enabled = to_b(val)
		end
		def non_entitled_channel_playback_enabled=(val)
			@non_entitled_channel_playback_enabled = to_b(val)
		end
		def non_existing_channel_playback_enabled=(val)
			@non_existing_channel_playback_enabled = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['catchUpEnabled'] != nil
				self.catch_up_enabled = xml_element.elements['catchUpEnabled'].text
			end
			if xml_element.elements['cdvrEnabled'] != nil
				self.cdvr_enabled = xml_element.elements['cdvrEnabled'].text
			end
			if xml_element.elements['startOverEnabled'] != nil
				self.start_over_enabled = xml_element.elements['startOverEnabled'].text
			end
			if xml_element.elements['trickPlayEnabled'] != nil
				self.trick_play_enabled = xml_element.elements['trickPlayEnabled'].text
			end
			if xml_element.elements['recordingScheduleWindowEnabled'] != nil
				self.recording_schedule_window_enabled = xml_element.elements['recordingScheduleWindowEnabled'].text
			end
			if xml_element.elements['protectionEnabled'] != nil
				self.protection_enabled = xml_element.elements['protectionEnabled'].text
			end
			if xml_element.elements['catchUpBufferLength'] != nil
				self.catch_up_buffer_length = xml_element.elements['catchUpBufferLength'].text
			end
			if xml_element.elements['trickPlayBufferLength'] != nil
				self.trick_play_buffer_length = xml_element.elements['trickPlayBufferLength'].text
			end
			if xml_element.elements['recordingScheduleWindow'] != nil
				self.recording_schedule_window = xml_element.elements['recordingScheduleWindow'].text
			end
			if xml_element.elements['paddingBeforeProgramStarts'] != nil
				self.padding_before_program_starts = xml_element.elements['paddingBeforeProgramStarts'].text
			end
			if xml_element.elements['paddingAfterProgramEnds'] != nil
				self.padding_after_program_ends = xml_element.elements['paddingAfterProgramEnds'].text
			end
			if xml_element.elements['protectionPeriod'] != nil
				self.protection_period = xml_element.elements['protectionPeriod'].text
			end
			if xml_element.elements['protectionQuotaPercentage'] != nil
				self.protection_quota_percentage = xml_element.elements['protectionQuotaPercentage'].text
			end
			if xml_element.elements['recordingLifetimePeriod'] != nil
				self.recording_lifetime_period = xml_element.elements['recordingLifetimePeriod'].text
			end
			if xml_element.elements['cleanupNoticePeroid'] != nil
				self.cleanup_notice_peroid = xml_element.elements['cleanupNoticePeroid'].text
			end
			if xml_element.elements['seriesRecordingEnabled'] != nil
				self.series_recording_enabled = xml_element.elements['seriesRecordingEnabled'].text
			end
			if xml_element.elements['nonEntitledChannelPlaybackEnabled'] != nil
				self.non_entitled_channel_playback_enabled = xml_element.elements['nonEntitledChannelPlaybackEnabled'].text
			end
			if xml_element.elements['nonExistingChannelPlaybackEnabled'] != nil
				self.non_existing_channel_playback_enabled = xml_element.elements['nonExistingChannelPlaybackEnabled'].text
			end
		end

	end

	class KalturaTopicFilter < KalturaFilter


		def from_xml(xml_element)
			super
		end

	end

	# An item of user asset list
	class KalturaUserAssetsListItem < KalturaObjectBase
		# Asset identifier
		attr_accessor :id
		# The order index of the asset in the list
		attr_accessor :order_index
		# The type of the asset
		attr_accessor :type
		# The identifier of the user who added the item to the list
		attr_accessor :user_id
		# The type of the list
		attr_accessor :list_type

		def order_index=(val)
			@order_index = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['orderIndex'] != nil
				self.order_index = xml_element.elements['orderIndex'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['listType'] != nil
				self.list_type = xml_element.elements['listType'].text
			end
		end

	end

	# Device family details
	class KalturaDeviceFamilyBase < KalturaObjectBase
		# Device family identifier
		attr_accessor :id
		# Device family name
		attr_accessor :name
		# Max number of devices allowed for this family
		attr_accessor :device_limit
		# Max number of streams allowed for this family
		attr_accessor :concurrent_limit

		def id=(val)
			@id = val.to_i
		end
		def device_limit=(val)
			@device_limit = val.to_i
		end
		def concurrent_limit=(val)
			@concurrent_limit = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['deviceLimit'] != nil
				self.device_limit = xml_element.elements['deviceLimit'].text
			end
			if xml_element.elements['concurrentLimit'] != nil
				self.concurrent_limit = xml_element.elements['concurrentLimit'].text
			end
		end

	end

	# Device details
	class KalturaHouseholdDevice < KalturaObjectBase
		# Household identifier
		attr_accessor :household_id
		# Device UDID
		attr_accessor :udid
		# Device name
		attr_accessor :name
		# Device brand name
		attr_accessor :brand
		# Device brand identifier
		attr_accessor :brand_id
		# Device activation date (epoch)
		attr_accessor :activated_on
		# Device state
		attr_accessor :status

		def household_id=(val)
			@household_id = val.to_i
		end
		def brand_id=(val)
			@brand_id = val.to_i
		end
		def activated_on=(val)
			@activated_on = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['householdId'] != nil
				self.household_id = xml_element.elements['householdId'].text
			end
			if xml_element.elements['udid'] != nil
				self.udid = xml_element.elements['udid'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['brand'] != nil
				self.brand = xml_element.elements['brand'].text
			end
			if xml_element.elements['brandId'] != nil
				self.brand_id = xml_element.elements['brandId'].text
			end
			if xml_element.elements['activatedOn'] != nil
				self.activated_on = xml_element.elements['activatedOn'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
		end

	end

	# Device family limitations details
	class KalturaHouseholdDeviceFamilyLimitations < KalturaDeviceFamilyBase
		# Allowed device change frequency code
		attr_accessor :frequency

		def frequency=(val)
			@frequency = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['frequency'] != nil
				self.frequency = xml_element.elements['frequency'].text
			end
		end

	end

	# Household limitations details
	class KalturaHouseholdLimitations < KalturaObjectBase
		# Household limitation module identifier
		attr_accessor :id
		# Household limitation module name
		attr_accessor :name
		# Max number of streams allowed for the household
		attr_accessor :concurrent_limit
		# Max number of devices allowed for the household
		attr_accessor :device_limit
		# Allowed device change frequency code
		attr_accessor :device_frequency
		# Allowed device change frequency description
		attr_accessor :device_frequency_description
		# Allowed user change frequency code
		attr_accessor :user_frequency
		# Allowed user change frequency description
		attr_accessor :user_frequency_description
		# Allowed NPVR Quota in Seconds
		attr_accessor :npvr_quota_in_seconds
		# Max number of users allowed for the household
		attr_accessor :users_limit
		# Device families limitations
		attr_accessor :device_families_limitations

		def id=(val)
			@id = val.to_i
		end
		def concurrent_limit=(val)
			@concurrent_limit = val.to_i
		end
		def device_limit=(val)
			@device_limit = val.to_i
		end
		def device_frequency=(val)
			@device_frequency = val.to_i
		end
		def user_frequency=(val)
			@user_frequency = val.to_i
		end
		def npvr_quota_in_seconds=(val)
			@npvr_quota_in_seconds = val.to_i
		end
		def users_limit=(val)
			@users_limit = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['concurrentLimit'] != nil
				self.concurrent_limit = xml_element.elements['concurrentLimit'].text
			end
			if xml_element.elements['deviceLimit'] != nil
				self.device_limit = xml_element.elements['deviceLimit'].text
			end
			if xml_element.elements['deviceFrequency'] != nil
				self.device_frequency = xml_element.elements['deviceFrequency'].text
			end
			if xml_element.elements['deviceFrequencyDescription'] != nil
				self.device_frequency_description = xml_element.elements['deviceFrequencyDescription'].text
			end
			if xml_element.elements['userFrequency'] != nil
				self.user_frequency = xml_element.elements['userFrequency'].text
			end
			if xml_element.elements['userFrequencyDescription'] != nil
				self.user_frequency_description = xml_element.elements['userFrequencyDescription'].text
			end
			if xml_element.elements['npvrQuotaInSeconds'] != nil
				self.npvr_quota_in_seconds = xml_element.elements['npvrQuotaInSeconds'].text
			end
			if xml_element.elements['usersLimit'] != nil
				self.users_limit = xml_element.elements['usersLimit'].text
			end
			if xml_element.elements['deviceFamiliesLimitations'] != nil
				self.device_families_limitations = KalturaClientBase.object_from_xml(xml_element.elements['deviceFamiliesLimitations'], 'KalturaHouseholdDeviceFamilyLimitations')
			end
		end

	end

	# Bulk export tasks filter
	class KalturaExportTaskFilter < KalturaFilter
		# Comma separated tasks identifiers
		attr_accessor :id_in


		def from_xml(xml_element)
			super
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
		end

	end

	# Partner  base configuration
	class KalturaPartnerConfiguration < KalturaObjectBase


		def from_xml(xml_element)
			super
		end

	end

	# Partner billing configuration
	class KalturaBillingPartnerConfig < KalturaPartnerConfiguration
		# configuration value
		attr_accessor :value
		# partner configuration type
		attr_accessor :type


		def from_xml(xml_element)
			super
			if xml_element.elements['value'] != nil
				self.value = xml_element.elements['value'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
		end

	end

	# OSS adapter basic
	class KalturaOSSAdapterBaseProfile < KalturaObjectBase
		# OSS adapter id
		attr_accessor :id
		# OSS adapter name
		attr_accessor :name

		def id=(val)
			@id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
		end

	end

	# OSS Adapter
	class KalturaOSSAdapterProfile < KalturaOSSAdapterBaseProfile
		# OSS adapter active status
		attr_accessor :is_active
		# OSS adapter adapter URL
		attr_accessor :adapter_url
		# OSS adapter extra parameters
		attr_accessor :oss_adapter_settings
		# OSS adapter external identifier
		attr_accessor :external_identifier
		# Shared Secret
		attr_accessor :shared_secret

		def is_active=(val)
			@is_active = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['isActive'] != nil
				self.is_active = xml_element.elements['isActive'].text
			end
			if xml_element.elements['adapterUrl'] != nil
				self.adapter_url = xml_element.elements['adapterUrl'].text
			end
			if xml_element.elements['ossAdapterSettings'] != nil
				self.oss_adapter_settings = KalturaClientBase.object_from_xml(xml_element.elements['ossAdapterSettings'], 'KalturaStringValue')
			end
			if xml_element.elements['externalIdentifier'] != nil
				self.external_identifier = xml_element.elements['externalIdentifier'].text
			end
			if xml_element.elements['sharedSecret'] != nil
				self.shared_secret = xml_element.elements['sharedSecret'].text
			end
		end

	end

	# Login response
	class KalturaLoginSession < KalturaObjectBase
		# Access token in a KS format
		attr_accessor :ks
		# Refresh Token
		attr_accessor :refresh_token


		def from_xml(xml_element)
			super
			if xml_element.elements['ks'] != nil
				self.ks = xml_element.elements['ks'].text
			end
			if xml_element.elements['refreshToken'] != nil
				self.refresh_token = xml_element.elements['refreshToken'].text
			end
		end

	end

	# User asset rule filter
	class KalturaUserAssetRuleFilter < KalturaFilter
		# Asset identifier to filter by
		attr_accessor :asset_id_equal
		# Asset type to filter by - 0 = EPG, 1 = media
		attr_accessor :asset_type_equal

		def asset_id_equal=(val)
			@asset_id_equal = val.to_i
		end
		def asset_type_equal=(val)
			@asset_type_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['assetIdEqual'] != nil
				self.asset_id_equal = xml_element.elements['assetIdEqual'].text
			end
			if xml_element.elements['assetTypeEqual'] != nil
				self.asset_type_equal = xml_element.elements['assetTypeEqual'].text
			end
		end

	end

	class KalturaAssetHistoryFilter < KalturaFilter
		# Comma separated list of asset types to search within.
		#             Possible values: 0 – EPG linear programs entries, any media type ID (according to media type IDs defined dynamically in the system).
		#             If omitted – all types should be included.
		attr_accessor :type_in
		# Comma separated list of asset identifiers.
		attr_accessor :asset_id_in
		# Which type of recently watched media to include in the result – those that finished watching, those that are in progress or both.
		#             If omitted or specified filter = all – return all types.
		#             Allowed values: progress – return medias that are in-progress, done – return medias that finished watching.
		attr_accessor :status_equal


		def from_xml(xml_element)
			super
			if xml_element.elements['typeIn'] != nil
				self.type_in = xml_element.elements['typeIn'].text
			end
			if xml_element.elements['assetIdIn'] != nil
				self.asset_id_in = xml_element.elements['assetIdIn'].text
			end
			if xml_element.elements['statusEqual'] != nil
				self.status_equal = xml_element.elements['statusEqual'].text
			end
		end

	end

	# Household details
	class KalturaHousehold < KalturaObjectBase
		# Household identifier
		attr_accessor :id
		# Household name
		attr_accessor :name
		# Household description
		attr_accessor :description
		# Household external identifier
		attr_accessor :external_id
		# Household limitation module identifier
		attr_accessor :household_limitations_id
		# The max number of the devices that can be added to the household
		attr_accessor :devices_limit
		# The max number of the users that can be added to the household
		attr_accessor :users_limit
		# The max number of concurrent streams in the household
		attr_accessor :concurrent_limit
		# The households region identifier
		attr_accessor :region_id
		# Household state
		attr_accessor :state
		# Is household frequency enabled
		attr_accessor :is_frequency_enabled
		# The next time a device is allowed to be removed from the household (epoch)
		attr_accessor :frequency_next_device_action
		# The next time a user is allowed to be removed from the household (epoch)
		attr_accessor :frequency_next_user_action
		# Household restriction
		attr_accessor :restriction

		def id=(val)
			@id = val.to_i
		end
		def household_limitations_id=(val)
			@household_limitations_id = val.to_i
		end
		def devices_limit=(val)
			@devices_limit = val.to_i
		end
		def users_limit=(val)
			@users_limit = val.to_i
		end
		def concurrent_limit=(val)
			@concurrent_limit = val.to_i
		end
		def region_id=(val)
			@region_id = val.to_i
		end
		def is_frequency_enabled=(val)
			@is_frequency_enabled = to_b(val)
		end
		def frequency_next_device_action=(val)
			@frequency_next_device_action = val.to_i
		end
		def frequency_next_user_action=(val)
			@frequency_next_user_action = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['description'] != nil
				self.description = xml_element.elements['description'].text
			end
			if xml_element.elements['externalId'] != nil
				self.external_id = xml_element.elements['externalId'].text
			end
			if xml_element.elements['householdLimitationsId'] != nil
				self.household_limitations_id = xml_element.elements['householdLimitationsId'].text
			end
			if xml_element.elements['devicesLimit'] != nil
				self.devices_limit = xml_element.elements['devicesLimit'].text
			end
			if xml_element.elements['usersLimit'] != nil
				self.users_limit = xml_element.elements['usersLimit'].text
			end
			if xml_element.elements['concurrentLimit'] != nil
				self.concurrent_limit = xml_element.elements['concurrentLimit'].text
			end
			if xml_element.elements['regionId'] != nil
				self.region_id = xml_element.elements['regionId'].text
			end
			if xml_element.elements['state'] != nil
				self.state = xml_element.elements['state'].text
			end
			if xml_element.elements['isFrequencyEnabled'] != nil
				self.is_frequency_enabled = xml_element.elements['isFrequencyEnabled'].text
			end
			if xml_element.elements['frequencyNextDeviceAction'] != nil
				self.frequency_next_device_action = xml_element.elements['frequencyNextDeviceAction'].text
			end
			if xml_element.elements['frequencyNextUserAction'] != nil
				self.frequency_next_user_action = xml_element.elements['frequencyNextUserAction'].text
			end
			if xml_element.elements['restriction'] != nil
				self.restriction = xml_element.elements['restriction'].text
			end
		end

	end

	# Device pin
	class KalturaDevicePin < KalturaObjectBase
		# Device pin
		attr_accessor :pin


		def from_xml(xml_element)
			super
			if xml_element.elements['pin'] != nil
				self.pin = xml_element.elements['pin'].text
			end
		end

	end

	# Filtering Assets requests
	class KalturaBookmarkFilter < KalturaFilter
		# Comma separated list of assets identifiers
		attr_accessor :asset_id_in
		# Asset type
		attr_accessor :asset_type_equal


		def from_xml(xml_element)
			super
			if xml_element.elements['assetIdIn'] != nil
				self.asset_id_in = xml_element.elements['assetIdIn'].text
			end
			if xml_element.elements['assetTypeEqual'] != nil
				self.asset_type_equal = xml_element.elements['assetTypeEqual'].text
			end
		end

	end

	# PIN and its origin of definition
	class KalturaPin < KalturaObjectBase
		# PIN code
		attr_accessor :pin
		# Where the PIN was defined at – account, household or user
		attr_accessor :origin
		# PIN type
		attr_accessor :type


		def from_xml(xml_element)
			super
			if xml_element.elements['pin'] != nil
				self.pin = xml_element.elements['pin'].text
			end
			if xml_element.elements['origin'] != nil
				self.origin = xml_element.elements['origin'].text
			end
			if xml_element.elements['type'] != nil
				self.type = xml_element.elements['type'].text
			end
		end

	end

	# Purchase settings and PIN
	class KalturaPurchaseSettings < KalturaPin
		# Purchase permission - block, ask or allow
		attr_accessor :permission


		def from_xml(xml_element)
			super
			if xml_element.elements['permission'] != nil
				self.permission = xml_element.elements['permission'].text
			end
		end

	end

	# Household details
	class KalturaHouseholdUser < KalturaObjectBase
		# The identifier of the household
		attr_accessor :household_id
		# The identifier of the user
		attr_accessor :user_id
		# True if the user added as master use
		attr_accessor :is_master
		# The username of the household master for adding a user in status pending for the household master to approve
		attr_accessor :household_master_username
		# The status of the user in the household
		attr_accessor :status

		def household_id=(val)
			@household_id = val.to_i
		end
		def is_master=(val)
			@is_master = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['householdId'] != nil
				self.household_id = xml_element.elements['householdId'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['isMaster'] != nil
				self.is_master = xml_element.elements['isMaster'].text
			end
			if xml_element.elements['householdMasterUsername'] != nil
				self.household_master_username = xml_element.elements['householdMasterUsername'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
		end

	end

	class KalturaSubscriptionFilter < KalturaFilter
		# Comma separated subscription identifiers or file identifier (only 1) to get the subscriptions by
		attr_accessor :subscription_id_in
		# Media-file identifier to get the subscriptions by
		attr_accessor :media_file_id_equal

		def media_file_id_equal=(val)
			@media_file_id_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['subscriptionIdIn'] != nil
				self.subscription_id_in = xml_element.elements['subscriptionIdIn'].text
			end
			if xml_element.elements['mediaFileIdEqual'] != nil
				self.media_file_id_equal = xml_element.elements['mediaFileIdEqual'].text
			end
		end

	end

	# Category details
	class KalturaOTTCategory < KalturaObjectBase
		# Unique identifier for the category
		attr_accessor :id
		# Category name
		attr_accessor :name
		# Category parent identifier
		attr_accessor :parent_category_id
		# Child categories
		attr_accessor :child_categories
		# Category channels
		attr_accessor :channels
		# Category images
		attr_accessor :images

		def id=(val)
			@id = val.to_i
		end
		def parent_category_id=(val)
			@parent_category_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['parentCategoryId'] != nil
				self.parent_category_id = xml_element.elements['parentCategoryId'].text
			end
			if xml_element.elements['childCategories'] != nil
				self.child_categories = KalturaClientBase.object_from_xml(xml_element.elements['childCategories'], 'KalturaOTTCategory')
			end
			if xml_element.elements['channels'] != nil
				self.channels = KalturaClientBase.object_from_xml(xml_element.elements['channels'], 'KalturaChannel')
			end
			if xml_element.elements['images'] != nil
				self.images = KalturaClientBase.object_from_xml(xml_element.elements['images'], 'KalturaMediaImage')
			end
		end

	end

	# Coupon details container
	class KalturaCoupon < KalturaObjectBase
		# Coupons group details
		attr_accessor :coupons_group
		# Coupon status
		attr_accessor :status


		def from_xml(xml_element)
			super
			if xml_element.elements['couponsGroup'] != nil
				self.coupons_group = KalturaClientBase.object_from_xml(xml_element.elements['couponsGroup'], 'KalturaCouponsGroup')
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
		end

	end

	# Entitlements filter
	class KalturaEntitlementFilter < KalturaFilter
		# The type of the entitlements to return
		attr_accessor :entitlement_type_equal
		# Reference type to filter by
		attr_accessor :entity_reference_equal
		# Is expired
		attr_accessor :is_expired_equal

		def is_expired_equal=(val)
			@is_expired_equal = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['entitlementTypeEqual'] != nil
				self.entitlement_type_equal = xml_element.elements['entitlementTypeEqual'].text
			end
			if xml_element.elements['entityReferenceEqual'] != nil
				self.entity_reference_equal = xml_element.elements['entityReferenceEqual'].text
			end
			if xml_element.elements['isExpiredEqual'] != nil
				self.is_expired_equal = xml_element.elements['isExpiredEqual'].text
			end
		end

	end

	# Favorite request filter
	class KalturaFavoriteFilter < KalturaFilter
		# Media type to filter by the favorite assets
		attr_accessor :media_type_in
		# Media identifiers from which to filter the favorite assets
		attr_accessor :media_id_in

		def media_type_in=(val)
			@media_type_in = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['mediaTypeIn'] != nil
				self.media_type_in = xml_element.elements['mediaTypeIn'].text
			end
			if xml_element.elements['mediaIdIn'] != nil
				self.media_id_in = xml_element.elements['mediaIdIn'].text
			end
		end

	end

	class KalturaSocial < KalturaObjectBase
		# Facebook identifier
		attr_accessor :id
		# Full name
		attr_accessor :name
		# First name
		attr_accessor :first_name
		# Last name
		attr_accessor :last_name
		# User email
		attr_accessor :email
		# Gender
		attr_accessor :gender
		# User identifier
		attr_accessor :user_id
		# User birthday
		attr_accessor :birthday
		# User model status
		#             Possible values: UNKNOWN, OK, ERROR, NOACTION, NOTEXIST, CONFLICT, MERGE, MERGEOK, NEWUSER, MINFRIENDS, INVITEOK, INVITEERROR, ACCESSDENIED, WRONGPASSWORDORUSERNAME, UNMERGEOK
		attr_accessor :status
		# Profile picture URL
		attr_accessor :picture_url


		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['name'] != nil
				self.name = xml_element.elements['name'].text
			end
			if xml_element.elements['firstName'] != nil
				self.first_name = xml_element.elements['firstName'].text
			end
			if xml_element.elements['lastName'] != nil
				self.last_name = xml_element.elements['lastName'].text
			end
			if xml_element.elements['email'] != nil
				self.email = xml_element.elements['email'].text
			end
			if xml_element.elements['gender'] != nil
				self.gender = xml_element.elements['gender'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
			if xml_element.elements['birthday'] != nil
				self.birthday = xml_element.elements['birthday'].text
			end
			if xml_element.elements['status'] != nil
				self.status = xml_element.elements['status'].text
			end
			if xml_element.elements['pictureUrl'] != nil
				self.picture_url = xml_element.elements['pictureUrl'].text
			end
		end

	end

	class KalturaFacebookSocial < KalturaSocial


		def from_xml(xml_element)
			super
		end

	end

	class KalturaLoginResponse < KalturaObjectBase
		# User
		attr_accessor :user
		# Kaltura login session details
		attr_accessor :login_session


		def from_xml(xml_element)
			super
			if xml_element.elements['user'] != nil
				self.user = KalturaClientBase.object_from_xml(xml_element.elements['user'], 'KalturaOTTUser')
			end
			if xml_element.elements['loginSession'] != nil
				self.login_session = KalturaClientBase.object_from_xml(xml_element.elements['loginSession'], 'KalturaLoginSession')
			end
		end

	end

	# Returns social configuration for the partner
	class KalturaSocialConfig < KalturaObjectBase
		# The application identifier
		attr_accessor :app_id
		# List of application permissions
		attr_accessor :permissions


		def from_xml(xml_element)
			super
			if xml_element.elements['appId'] != nil
				self.app_id = xml_element.elements['appId'].text
			end
			if xml_element.elements['permissions'] != nil
				self.permissions = xml_element.elements['permissions'].text
			end
		end

	end

	class KalturaPurchaseBase < KalturaObjectBase
		# Identifier for the package from which this content is offered
		attr_accessor :product_id
		# Identifier for the content to purchase. Relevant only if Product type = PPV
		attr_accessor :content_id
		# Package type. Possible values: PPV, Subscription, Collection
		attr_accessor :product_type

		def product_id=(val)
			@product_id = val.to_i
		end
		def content_id=(val)
			@content_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['productId'] != nil
				self.product_id = xml_element.elements['productId'].text
			end
			if xml_element.elements['contentId'] != nil
				self.content_id = xml_element.elements['contentId'].text
			end
			if xml_element.elements['productType'] != nil
				self.product_type = xml_element.elements['productType'].text
			end
		end

	end

	class KalturaPurchase < KalturaPurchaseBase
		# Identifier for paying currency, according to ISO 4217
		attr_accessor :currency
		# Net sum to charge – as a one-time transaction. Price must match the previously provided price for the specified content.
		attr_accessor :price
		# Identifier for a pre-entered payment method. If not provided – the household’s default payment method is used
		attr_accessor :payment_method_id
		# Identifier for a pre-associated payment gateway. If not provided – the account’s default payment gateway is used
		attr_accessor :payment_gateway_id
		# Coupon code
		attr_accessor :coupon

		def price=(val)
			@price = val.to_f
		end
		def payment_method_id=(val)
			@payment_method_id = val.to_i
		end
		def payment_gateway_id=(val)
			@payment_gateway_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['currency'] != nil
				self.currency = xml_element.elements['currency'].text
			end
			if xml_element.elements['price'] != nil
				self.price = xml_element.elements['price'].text
			end
			if xml_element.elements['paymentMethodId'] != nil
				self.payment_method_id = xml_element.elements['paymentMethodId'].text
			end
			if xml_element.elements['paymentGatewayId'] != nil
				self.payment_gateway_id = xml_element.elements['paymentGatewayId'].text
			end
			if xml_element.elements['coupon'] != nil
				self.coupon = xml_element.elements['coupon'].text
			end
		end

	end

	class KalturaPurchaseSession < KalturaPurchase
		# Preview module identifier (relevant only for subscription)
		attr_accessor :preview_module_id

		def preview_module_id=(val)
			@preview_module_id = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['previewModuleId'] != nil
				self.preview_module_id = xml_element.elements['previewModuleId'].text
			end
		end

	end

	class KalturaExternalReceipt < KalturaPurchaseBase
		# A unique identifier that was provided by the In-App billing service to validate the purchase
		attr_accessor :receipt_id
		# The payment gateway name for the In-App billing service to be used. Possible values: Google/Apple
		attr_accessor :payment_gateway_name


		def from_xml(xml_element)
			super
			if xml_element.elements['receiptId'] != nil
				self.receipt_id = xml_element.elements['receiptId'].text
			end
			if xml_element.elements['paymentGatewayName'] != nil
				self.payment_gateway_name = xml_element.elements['paymentGatewayName'].text
			end
		end

	end

	class KalturaTransaction < KalturaObjectBase
		# Kaltura unique ID representing the transaction
		attr_accessor :id
		# Transaction reference ID received from the payment gateway. 
		#             Value is available only if the payment gateway provides this information.
		attr_accessor :payment_gateway_reference_id
		# Response ID received from by the payment gateway. 
		#             Value is available only if the payment gateway provides this information.
		attr_accessor :payment_gateway_response_id
		# Transaction state: OK/Pending/Failed
		attr_accessor :state
		# Adapter failure reason code
		#             Insufficient funds = 20, Invalid account = 21, User unknown = 22, Reason unknown = 23, Unknown payment gateway response = 24,
		#             No response from payment gateway = 25, Exceeded retry limit = 26, Illegal client request = 27, Expired = 28
		attr_accessor :fail_reason_code
		# Entitlement creation date
		attr_accessor :created_at

		def fail_reason_code=(val)
			@fail_reason_code = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['id'] != nil
				self.id = xml_element.elements['id'].text
			end
			if xml_element.elements['paymentGatewayReferenceId'] != nil
				self.payment_gateway_reference_id = xml_element.elements['paymentGatewayReferenceId'].text
			end
			if xml_element.elements['paymentGatewayResponseId'] != nil
				self.payment_gateway_response_id = xml_element.elements['paymentGatewayResponseId'].text
			end
			if xml_element.elements['state'] != nil
				self.state = xml_element.elements['state'].text
			end
			if xml_element.elements['failReasonCode'] != nil
				self.fail_reason_code = xml_element.elements['failReasonCode'].text
			end
			if xml_element.elements['createdAt'] != nil
				self.created_at = xml_element.elements['createdAt'].text
			end
		end

	end

	class KalturaTransactionStatus < KalturaObjectBase
		# Payment gateway adapter application state for the transaction to update
		attr_accessor :adapter_transaction_status
		# External transaction identifier
		attr_accessor :external_id
		# Payment gateway transaction status
		attr_accessor :external_status
		# Payment gateway message
		attr_accessor :external_message
		# The reason the transaction failed
		attr_accessor :fail_reason

		def fail_reason=(val)
			@fail_reason = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['adapterTransactionStatus'] != nil
				self.adapter_transaction_status = xml_element.elements['adapterTransactionStatus'].text
			end
			if xml_element.elements['externalId'] != nil
				self.external_id = xml_element.elements['externalId'].text
			end
			if xml_element.elements['externalStatus'] != nil
				self.external_status = xml_element.elements['externalStatus'].text
			end
			if xml_element.elements['externalMessage'] != nil
				self.external_message = xml_element.elements['externalMessage'].text
			end
			if xml_element.elements['failReason'] != nil
				self.fail_reason = xml_element.elements['failReason'].text
			end
		end

	end

	# Log in pin code details
	class KalturaUserLoginPin < KalturaObjectBase
		# Generated login pin code
		attr_accessor :pin_code
		# Login pin expiration time (epoch)
		attr_accessor :expiration_time
		# User Identifier
		attr_accessor :user_id

		def expiration_time=(val)
			@expiration_time = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['pinCode'] != nil
				self.pin_code = xml_element.elements['pinCode'].text
			end
			if xml_element.elements['expirationTime'] != nil
				self.expiration_time = xml_element.elements['expirationTime'].text
			end
			if xml_element.elements['userId'] != nil
				self.user_id = xml_element.elements['userId'].text
			end
		end

	end

	class KalturaParentalRuleFilter < KalturaFilter
		# Reference type to filter by
		attr_accessor :entity_reference_equal


		def from_xml(xml_element)
			super
			if xml_element.elements['entityReferenceEqual'] != nil
				self.entity_reference_equal = xml_element.elements['entityReferenceEqual'].text
			end
		end

	end

	# Transactions filter
	class KalturaTransactionHistoryFilter < KalturaFilter
		# Reference type to filter by
		attr_accessor :entity_reference_equal
		# Filter transactions later than specific date
		attr_accessor :start_date_greater_than_or_equal
		# Filter transactions earlier than specific date
		attr_accessor :end_date_less_than_or_equal

		def start_date_greater_than_or_equal=(val)
			@start_date_greater_than_or_equal = val.to_i
		end
		def end_date_less_than_or_equal=(val)
			@end_date_less_than_or_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['entityReferenceEqual'] != nil
				self.entity_reference_equal = xml_element.elements['entityReferenceEqual'].text
			end
			if xml_element.elements['startDateGreaterThanOrEqual'] != nil
				self.start_date_greater_than_or_equal = xml_element.elements['startDateGreaterThanOrEqual'].text
			end
			if xml_element.elements['endDateLessThanOrEqual'] != nil
				self.end_date_less_than_or_equal = xml_element.elements['endDateLessThanOrEqual'].text
			end
		end

	end

	# User roles filter
	class KalturaUserRoleFilter < KalturaFilter
		# Comma separated roles identifiers
		attr_accessor :id_in


		def from_xml(xml_element)
			super
			if xml_element.elements['idIn'] != nil
				self.id_in = xml_element.elements['idIn'].text
			end
		end

	end

	# OTT User filter
	class KalturaOTTUserFilter < KalturaFilter
		# User Filter By
		attr_accessor :user_by_equal
		# The User identifiers
		attr_accessor :value_equal


		def from_xml(xml_element)
			super
			if xml_element.elements['userByEqual'] != nil
				self.user_by_equal = xml_element.elements['userByEqual'].text
			end
			if xml_element.elements['valueEqual'] != nil
				self.value_equal = xml_element.elements['valueEqual'].text
			end
		end

	end


end
