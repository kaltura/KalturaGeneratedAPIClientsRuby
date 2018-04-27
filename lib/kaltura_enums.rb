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
# Copyright (C) 2006-2018  Kaltura Inc.
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
module Kaltura

	class KalturaAppTokenStatus
		DISABLED = 1
		ACTIVE = 2
		DELETED = 3
	end

	class KalturaAppearInListType
		PARTNER_ONLY = 1
		CATEGORY_MEMBERS_ONLY = 3
	end

	class KalturaAssetParamsDeletePolicy
		KEEP = 0
		DELETE = 1
	end

	class KalturaAssetParamsOrigin
		CONVERT = 0
		INGEST = 1
		CONVERT_WHEN_MISSING = 2
	end

	class KalturaBatchJobErrorTypes
		APP = 0
		RUNTIME = 1
		HTTP = 2
		CURL = 3
		KALTURA_API = 4
		KALTURA_CLIENT = 5
	end

	class KalturaBatchJobStatus
		PENDING = 0
		QUEUED = 1
		PROCESSING = 2
		PROCESSED = 3
		MOVEFILE = 4
		FINISHED = 5
		FAILED = 6
		ABORTED = 7
		ALMOST_DONE = 8
		RETRY = 9
		FATAL = 10
		DONT_PROCESS = 11
		FINISHED_PARTIALLY = 12
	end

	class KalturaBitRateMode
		CBR = 1
		VBR = 2
	end

	class KalturaCategoryEntryStatus
		PENDING = 1
		ACTIVE = 2
		DELETED = 3
		REJECTED = 4
	end

	class KalturaCategoryStatus
		UPDATING = 1
		ACTIVE = 2
		DELETED = 3
		PURGED = 4
	end

	class KalturaCategoryUserPermissionLevel
		MANAGER = 0
		MODERATOR = 1
		CONTRIBUTOR = 2
		MEMBER = 3
		NONE = 4
	end

	class KalturaCategoryUserStatus
		ACTIVE = 1
		PENDING = 2
		NOT_ACTIVE = 3
		DELETED = 4
	end

	class KalturaChinaCacheAlgorithmType
		SHA1 = 1
		SHA256 = 2
	end

	class KalturaCommercialUseType
		NON_COMMERCIAL_USE = 0
		COMMERCIAL_USE = 1
	end

	class KalturaContributionPolicyType
		ALL = 1
		MEMBERS_WITH_CONTRIBUTION_PERMISSION = 2
	end

	class KalturaControlPanelCommandStatus
		PENDING = 1
		HANDLED = 2
		DONE = 3
		FAILED = 4
	end

	class KalturaControlPanelCommandTargetType
		DATA_CENTER = 1
		SCHEDULER = 2
		JOB_TYPE = 3
		JOB = 4
		BATCH = 5
	end

	class KalturaControlPanelCommandType
		KILL = 4
	end

	class KalturaCountryRestrictionType
		RESTRICT_COUNTRY_LIST = 0
		ALLOW_COUNTRY_LIST = 1
	end

	class KalturaDVRStatus
		DISABLED = 0
		ENABLED = 1
	end

	class KalturaDeliveryStatus
		ACTIVE = 0
		DELETED = 1
		STAGING_IN = 2
		STAGING_OUT = 3
	end

	class KalturaDirectoryRestrictionType
		DONT_DISPLAY = 0
		DISPLAY_WITH_LINK = 1
	end

	class KalturaEditorType
		SIMPLE = 1
		ADVANCED = 2
	end

	class KalturaEffectType
		VIDEO_FADE_IN = 1
		VIDEO_FADE_OUT = 2
	end

	class KalturaEmailIngestionProfileStatus
		INACTIVE = 0
		ACTIVE = 1
	end

	class KalturaEntryDisplayInSearchType
		SYSTEM = -1
		NONE = 0
		PARTNER_ONLY = 1
		KALTURA_NETWORK = 2
	end

	class KalturaEntryModerationStatus
		PENDING_MODERATION = 1
		APPROVED = 2
		REJECTED = 3
		DELETED = 4
		FLAGGED_FOR_REVIEW = 5
		AUTO_APPROVED = 6
	end

	class KalturaEntryServerNodeRecordingStatus
		STOPPED = 0
		ON_GOING = 1
		DONE = 2
		DISMISSED = 3
	end

	class KalturaEntryServerNodeStatus
		STOPPED = 0
		PLAYABLE = 1
		BROADCASTING = 2
		AUTHENTICATED = 3
		MARKED_FOR_DELETION = 4
	end

	class KalturaFeatureStatusType
		LOCK_CATEGORY = 1
		CATEGORY = 2
		CATEGORY_ENTRY = 3
		ENTRY = 4
		CATEGORY_USER = 5
		USER = 6
	end

	class KalturaFlavorAssetStatus
		ERROR = -1
		QUEUED = 0
		CONVERTING = 1
		READY = 2
		DELETED = 3
		NOT_APPLICABLE = 4
		TEMP = 5
		WAIT_FOR_CONVERT = 6
		IMPORTING = 7
		VALIDATING = 8
		EXPORTING = 9
	end

	class KalturaFlavorReadyBehaviorType
		NO_IMPACT = 0
		INHERIT_FLAVOR_PARAMS = 0
		REQUIRED = 1
		OPTIONAL = 2
	end

	class KalturaGender
		UNKNOWN = 0
		MALE = 1
		FEMALE = 2
	end

	class KalturaGroupUserStatus
		ACTIVE = 0
		DELETED = 1
	end

	class KalturaInheritanceType
		INHERIT = 1
		MANUAL = 2
	end

	class KalturaIpAddressRestrictionType
		RESTRICT_LIST = 0
		ALLOW_LIST = 1
	end

	class KalturaLicenseType
		UNKNOWN = -1
		NONE = 0
		COPYRIGHTED = 1
		PUBLIC_DOMAIN = 2
		CREATIVECOMMONS_ATTRIBUTION = 3
		CREATIVECOMMONS_ATTRIBUTION_SHARE_ALIKE = 4
		CREATIVECOMMONS_ATTRIBUTION_NO_DERIVATIVES = 5
		CREATIVECOMMONS_ATTRIBUTION_NON_COMMERCIAL = 6
		CREATIVECOMMONS_ATTRIBUTION_NON_COMMERCIAL_SHARE_ALIKE = 7
		CREATIVECOMMONS_ATTRIBUTION_NON_COMMERCIAL_NO_DERIVATIVES = 8
		GFDL = 9
		GPL = 10
		AFFERO_GPL = 11
		LGPL = 12
		BSD = 13
		APACHE = 14
		MOZILLA = 15
	end

	class KalturaLimitFlavorsRestrictionType
		RESTRICT_LIST = 0
		ALLOW_LIST = 1
	end

	class KalturaLivePublishStatus
		DISABLED = 0
		ENABLED = 1
	end

	class KalturaLiveReportExportType
		PARTNER_TOTAL_ALL = 1
		PARTNER_TOTAL_LIVE = 2
		ENTRY_TIME_LINE_ALL = 11
		ENTRY_TIME_LINE_LIVE = 12
		LOCATION_ALL = 21
		LOCATION_LIVE = 22
		SYNDICATION_ALL = 31
		SYNDICATION_LIVE = 32
	end

	class KalturaLiveStatsEventType
		LIVE = 1
		DVR = 2
	end

	class KalturaMailJobStatus
		PENDING = 1
		SENT = 2
		ERROR = 3
		QUEUED = 4
	end

	class KalturaMediaType
		VIDEO = 1
		IMAGE = 2
		AUDIO = 5
		LIVE_STREAM_FLASH = 201
		LIVE_STREAM_WINDOWS_MEDIA = 202
		LIVE_STREAM_REAL_MEDIA = 203
		LIVE_STREAM_QUICKTIME = 204
	end

	class KalturaModerationFlagType
		SEXUAL_CONTENT = 1
		VIOLENT_REPULSIVE = 2
		HARMFUL_DANGEROUS = 3
		SPAM_COMMERCIALS = 4
		COPYRIGHT = 5
		TERMS_OF_USE_VIOLATION = 6
	end

	class KalturaMrssExtensionMode
		APPEND = 1
		REPLACE = 2
	end

	class KalturaNotificationObjectType
		ENTRY = 1
		KSHOW = 2
		USER = 3
		BATCH_JOB = 4
	end

	class KalturaNotificationStatus
		PENDING = 1
		SENT = 2
		ERROR = 3
		SHOULD_RESEND = 4
		ERROR_RESENDING = 5
		SENT_SYNCH = 6
		QUEUED = 7
	end

	class KalturaNotificationType
		ENTRY_ADD = 1
		ENTR_UPDATE_PERMISSIONS = 2
		ENTRY_DELETE = 3
		ENTRY_BLOCK = 4
		ENTRY_UPDATE = 5
		ENTRY_UPDATE_THUMBNAIL = 6
		ENTRY_UPDATE_MODERATION = 7
		USER_ADD = 21
		USER_BANNED = 26
	end

	class KalturaNullableBoolean
		NULL_VALUE = -1
		FALSE_VALUE = 0
		TRUE_VALUE = 1
	end

	class KalturaPartnerGroupType
		PUBLISHER = 1
		VAR_GROUP = 2
		GROUP = 3
		TEMPLATE = 4
	end

	class KalturaPartnerStatus
		DELETED = 0
		ACTIVE = 1
		BLOCKED = 2
		FULL_BLOCK = 3
	end

	class KalturaPartnerType
		KMC = 1
		WIKI = 100
		WORDPRESS = 101
		DRUPAL = 102
		DEKIWIKI = 103
		MOODLE = 104
		COMMUNITY_EDITION = 105
		JOOMLA = 106
		BLACKBOARD = 107
		SAKAI = 108
		ADMIN_CONSOLE = 109
	end

	class KalturaPermissionStatus
		ACTIVE = 1
		BLOCKED = 2
		DELETED = 3
	end

	class KalturaPermissionType
		NORMAL = 1
		SPECIAL_FEATURE = 2
		PLUGIN = 3
		PARTNER_GROUP = 4
	end

	class KalturaPlaylistType
		STATIC_LIST = 3
		DYNAMIC = 10
		EXTERNAL = 101
	end

	class KalturaPrivacyType
		ALL = 1
		AUTHENTICATED_USERS = 2
		MEMBERS_ONLY = 3
	end

	class KalturaRecordStatus
		DISABLED = 0
		APPENDED = 1
		PER_SESSION = 2
	end

	class KalturaRecordingStatus
		STOPPED = 0
		PAUSED = 1
		ACTIVE = 2
		DISABLED = 3
	end

	class KalturaResponseProfileStatus
		DISABLED = 1
		ENABLED = 2
		DELETED = 3
	end

	class KalturaResponseProfileType
		INCLUDE_FIELDS = 1
		EXCLUDE_FIELDS = 2
	end

	class KalturaResponseType
		RESPONSE_TYPE_JSON = 1
		RESPONSE_TYPE_XML = 2
		RESPONSE_TYPE_PHP = 3
		RESPONSE_TYPE_PHP_ARRAY = 4
		RESPONSE_TYPE_HTML = 7
		RESPONSE_TYPE_MRSS = 8
		RESPONSE_TYPE_JSONP = 9
	end

	class KalturaSchedulerStatusType
		RUNNING_BATCHES_COUNT = 1
		RUNNING_BATCHES_CPU = 2
		RUNNING_BATCHES_MEMORY = 3
		RUNNING_BATCHES_NETWORK = 4
		RUNNING_BATCHES_DISC_IO = 5
		RUNNING_BATCHES_DISC_SPACE = 6
		RUNNING_BATCHES_IS_RUNNING = 7
	end

	class KalturaSearchOperatorType
		SEARCH_AND = 1
		SEARCH_OR = 2
	end

	class KalturaSearchProviderType
		FLICKR = 3
		YOUTUBE = 4
		MYSPACE = 7
		PHOTOBUCKET = 8
		JAMENDO = 9
		CCMIXTER = 10
		NYPL = 11
		CURRENT = 12
		MEDIA_COMMONS = 13
		KALTURA = 20
		KALTURA_USER_CLIPS = 21
		ARCHIVE_ORG = 22
		KALTURA_PARTNER = 23
		METACAFE = 24
		SEARCH_PROXY = 28
		PARTNER_SPECIFIC = 100
	end

	class KalturaServerNodeStatus
		ACTIVE = 1
		DISABLED = 2
		DELETED = 3
		NOT_REGISTERED = 4
	end

	class KalturaSessionType
		USER = 0
		ADMIN = 2
	end

	class KalturaSiteRestrictionType
		RESTRICT_SITE_LIST = 0
		ALLOW_SITE_LIST = 1
	end

	class KalturaStatsEventType
		WIDGET_LOADED = 1
		MEDIA_LOADED = 2
		PLAY = 3
		PLAY_REACHED_25 = 4
		PLAY_REACHED_50 = 5
		PLAY_REACHED_75 = 6
		PLAY_REACHED_100 = 7
		OPEN_EDIT = 8
		OPEN_VIRAL = 9
		OPEN_DOWNLOAD = 10
		OPEN_REPORT = 11
		BUFFER_START = 12
		BUFFER_END = 13
		OPEN_FULL_SCREEN = 14
		CLOSE_FULL_SCREEN = 15
		REPLAY = 16
		SEEK = 17
		OPEN_UPLOAD = 18
		SAVE_PUBLISH = 19
		CLOSE_EDITOR = 20
		PRE_BUMPER_PLAYED = 21
		POST_BUMPER_PLAYED = 22
		BUMPER_CLICKED = 23
		PREROLL_STARTED = 24
		MIDROLL_STARTED = 25
		POSTROLL_STARTED = 26
		OVERLAY_STARTED = 27
		PREROLL_CLICKED = 28
		MIDROLL_CLICKED = 29
		POSTROLL_CLICKED = 30
		OVERLAY_CLICKED = 31
		PREROLL_25 = 32
		PREROLL_50 = 33
		PREROLL_75 = 34
		MIDROLL_25 = 35
		MIDROLL_50 = 36
		MIDROLL_75 = 37
		POSTROLL_25 = 38
		POSTROLL_50 = 39
		POSTROLL_75 = 40
	end

	class KalturaStatsFeatureType
		NONE = 0
		RELATED = 1
	end

	class KalturaStatsKmcEventType
		CONTENT_PAGE_VIEW = 1001
		CONTENT_ADD_PLAYLIST = 1010
		CONTENT_EDIT_PLAYLIST = 1011
		CONTENT_DELETE_PLAYLIST = 1012
		CONTENT_EDIT_ENTRY = 1013
		CONTENT_CHANGE_THUMBNAIL = 1014
		CONTENT_ADD_TAGS = 1015
		CONTENT_REMOVE_TAGS = 1016
		CONTENT_ADD_ADMIN_TAGS = 1017
		CONTENT_REMOVE_ADMIN_TAGS = 1018
		CONTENT_DOWNLOAD = 1019
		CONTENT_APPROVE_MODERATION = 1020
		CONTENT_REJECT_MODERATION = 1021
		CONTENT_BULK_UPLOAD = 1022
		CONTENT_ADMIN_KCW_UPLOAD = 1023
		ACCOUNT_CHANGE_PARTNER_INFO = 1030
		ACCOUNT_CHANGE_LOGIN_INFO = 1031
		ACCOUNT_CONTACT_US_USAGE = 1032
		ACCOUNT_UPDATE_SERVER_SETTINGS = 1033
		ACCOUNT_ACCOUNT_OVERVIEW = 1034
		ACCOUNT_ACCESS_CONTROL = 1035
		ACCOUNT_TRANSCODING_SETTINGS = 1036
		ACCOUNT_ACCOUNT_UPGRADE = 1037
		ACCOUNT_SAVE_SERVER_SETTINGS = 1038
		ACCOUNT_ACCESS_CONTROL_DELETE = 1039
		ACCOUNT_SAVE_TRANSCODING_SETTINGS = 1040
		LOGIN = 1041
		DASHBOARD_IMPORT_CONTENT = 1042
		DASHBOARD_UPDATE_CONTENT = 1043
		DASHBOARD_ACCOUNT_CONTACT_US = 1044
		DASHBOARD_VIEW_REPORTS = 1045
		DASHBOARD_EMBED_PLAYER = 1046
		DASHBOARD_EMBED_PLAYLIST = 1047
		DASHBOARD_CUSTOMIZE_PLAYERS = 1048
		APP_STUDIO_NEW_PLAYER_SINGLE_VIDEO = 1050
		APP_STUDIO_NEW_PLAYER_PLAYLIST = 1051
		APP_STUDIO_NEW_PLAYER_MULTI_TAB_PLAYLIST = 1052
		APP_STUDIO_EDIT_PLAYER_SINGLE_VIDEO = 1053
		APP_STUDIO_EDIT_PLAYER_PLAYLIST = 1054
		APP_STUDIO_EDIT_PLAYER_MULTI_TAB_PLAYLIST = 1055
		APP_STUDIO_DUPLICATE_PLAYER = 1056
		CONTENT_CONTENT_GO_TO_PAGE = 1057
		CONTENT_DELETE_ITEM = 1058
		CONTENT_DELETE_MIX = 1059
		REPORTS_AND_ANALYTICS_BANDWIDTH_USAGE_TAB = 1070
		REPORTS_AND_ANALYTICS_CONTENT_REPORTS_TAB = 1071
		REPORTS_AND_ANALYTICS_USERS_AND_COMMUNITY_REPORTS_TAB = 1072
		REPORTS_AND_ANALYTICS_TOP_CONTRIBUTORS = 1073
		REPORTS_AND_ANALYTICS_MAP_OVERLAYS = 1074
		REPORTS_AND_ANALYTICS_TOP_SYNDICATIONS = 1075
		REPORTS_AND_ANALYTICS_TOP_CONTENT = 1076
		REPORTS_AND_ANALYTICS_CONTENT_DROPOFF = 1077
		REPORTS_AND_ANALYTICS_CONTENT_INTERACTIONS = 1078
		REPORTS_AND_ANALYTICS_CONTENT_CONTRIBUTIONS = 1079
		REPORTS_AND_ANALYTICS_VIDEO_DRILL_DOWN = 1080
		REPORTS_AND_ANALYTICS_CONTENT_DRILL_DOWN_INTERACTION = 1081
		REPORTS_AND_ANALYTICS_CONTENT_CONTRIBUTIONS_DRILLDOWN = 1082
		REPORTS_AND_ANALYTICS_VIDEO_DRILL_DOWN_DROPOFF = 1083
		REPORTS_AND_ANALYTICS_MAP_OVERLAYS_DRILLDOWN = 1084
		REPORTS_AND_ANALYTICS_TOP_SYNDICATIONS_DRILL_DOWN = 1085
		REPORTS_AND_ANALYTICS_BANDWIDTH_USAGE_VIEW_MONTHLY = 1086
		REPORTS_AND_ANALYTICS_BANDWIDTH_USAGE_VIEW_YEARLY = 1087
		CONTENT_ENTRY_DRILLDOWN = 1088
		CONTENT_OPEN_PREVIEW_AND_EMBED = 1089
	end

	class KalturaStorageProfileDeliveryStatus
		ACTIVE = 1
		BLOCKED = 2
	end

	class KalturaStorageProfileReadyBehavior
		NO_IMPACT = 0
		REQUIRED = 1
	end

	class KalturaStorageProfileStatus
		DISABLED = 1
		AUTOMATIC = 2
		MANUAL = 3
	end

	class KalturaSyndicationFeedStatus
		DELETED = -1
		ACTIVE = 1
	end

	class KalturaSyndicationFeedType
		GOOGLE_VIDEO = 1
		YAHOO = 2
		ITUNES = 3
		TUBE_MOGUL = 4
		KALTURA = 5
		KALTURA_XSLT = 6
		ROKU_DIRECT_PUBLISHER = 7
		OPERA_TV_SNAP = 8
	end

	class KalturaThumbAssetStatus
		ERROR = -1
		QUEUED = 0
		CAPTURING = 1
		READY = 2
		DELETED = 3
		IMPORTING = 7
		EXPORTING = 9
	end

	class KalturaThumbCropType
		RESIZE = 1
		RESIZE_WITH_PADDING = 2
		CROP = 3
		CROP_FROM_TOP = 4
		RESIZE_WITH_FORCE = 5
	end

	class KalturaUiConfCreationMode
		WIZARD = 2
		ADVANCED = 3
	end

	class KalturaUiConfObjType
		PLAYER = 1
		CONTRIBUTION_WIZARD = 2
		SIMPLE_EDITOR = 3
		ADVANCED_EDITOR = 4
		PLAYLIST = 5
		APP_STUDIO = 6
		KRECORD = 7
		PLAYER_V3 = 8
		KMC_ACCOUNT = 9
		KMC_ANALYTICS = 10
		KMC_CONTENT = 11
		KMC_DASHBOARD = 12
		KMC_LOGIN = 13
		PLAYER_SL = 14
		CLIENTSIDE_ENCODER = 15
		KMC_GENERAL = 16
		KMC_ROLES_AND_PERMISSIONS = 17
		CLIPPER = 18
		KSR = 19
		KUPLOAD = 20
		WEBCASTING = 21
	end

	class KalturaUpdateMethodType
		MANUAL = 0
		AUTOMATIC = 1
	end

	class KalturaUploadErrorCode
		NO_ERROR = 0
		GENERAL_ERROR = 1
		PARTIAL_UPLOAD = 2
	end

	class KalturaUploadTokenStatus
		PENDING = 0
		PARTIAL_UPLOAD = 1
		FULL_UPLOAD = 2
		CLOSED = 3
		TIMED_OUT = 4
		DELETED = 5
	end

	class KalturaUserAgentRestrictionType
		RESTRICT_LIST = 0
		ALLOW_LIST = 1
	end

	class KalturaUserJoinPolicyType
		AUTO_JOIN = 1
		REQUEST_TO_JOIN = 2
		NOT_ALLOWED = 3
	end

	class KalturaUserRoleStatus
		ACTIVE = 1
		BLOCKED = 2
		DELETED = 3
	end

	class KalturaUserStatus
		BLOCKED = 0
		ACTIVE = 1
		DELETED = 2
	end

	class KalturaUserType
		USER = 0
		GROUP = 1
	end

	class KalturaViewMode
		PREVIEW = 0
		ALLOW_ALL = 1
	end

	class KalturaWidgetSecurityType
		NONE = 1
		TIMEHASH = 2
	end

	class KalturaAccessControlOrderBy
		CREATED_AT_ASC = "+createdAt"
		CREATED_AT_DESC = "-createdAt"
	end

	class KalturaAccessControlProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaAdminUserOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
	end

	class KalturaAkamaiUniversalStreamType
		HD_IPHONE_IPAD_LIVE = "HD iPhone/iPad Live"
		UNIVERSAL_STREAMING_LIVE = "Universal Streaming Live"
	end

	class KalturaAmazonS3StorageProfileFilesPermissionLevel
		ACL_AUTHENTICATED_READ = "authenticated-read"
		ACL_PRIVATE = "private"
		ACL_PUBLIC_READ = "public-read"
		ACL_PUBLIC_READ_WRITE = "public-read-write"
	end

	class KalturaAmazonS3StorageProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaApiActionPermissionItemOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaApiParameterPermissionItemAction
		USAGE = "all"
		INSERT = "insert"
		READ = "read"
		UPDATE = "update"
	end

	class KalturaApiParameterPermissionItemOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaAppTokenHashType
		MD5 = "MD5"
		SHA1 = "SHA1"
		SHA256 = "SHA256"
		SHA512 = "SHA512"
	end

	class KalturaAppTokenOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaAssetOrderBy
		CREATED_AT_ASC = "+createdAt"
		DELETED_AT_ASC = "+deletedAt"
		SIZE_ASC = "+size"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		DELETED_AT_DESC = "-deletedAt"
		SIZE_DESC = "-size"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaAssetParamsOrderBy
	end

	class KalturaAssetParamsOutputOrderBy
	end

	class KalturaAssetType
		ATTACHMENT = "attachment.Attachment"
		CAPTION = "caption.Caption"
		DOCUMENT = "document.Document"
		IMAGE = "document.Image"
		PDF = "document.PDF"
		SWF = "document.SWF"
		TIMED_THUMB_ASSET = "thumbCuePoint.timedThumb"
		TRANSCRIPT = "transcript.Transcript"
		WIDEVINE_FLAVOR = "widevine.WidevineFlavor"
		FLAVOR = "1"
		THUMBNAIL = "2"
		LIVE = "3"
	end

	class KalturaAudioCodec
		NONE = ""
		AAC = "aac"
		AACHE = "aache"
		AC3 = "ac3"
		AMRNB = "amrnb"
		COPY = "copy"
		EAC3 = "eac3"
		MP3 = "mp3"
		MPEG2 = "mpeg2"
		PCM = "pcm"
		VORBIS = "vorbis"
		WMA = "wma"
		WMAPRO = "wmapro"
	end

	class KalturaBaseEntryCloneOptions
		AD_CUE_POINTS = "adCuePoint.AD_CUE_POINTS"
		ANNOTATION_CUE_POINTS = "annotation.ANNOTATION_CUE_POINTS"
		CODE_CUE_POINTS = "codeCuePoint.CODE_CUE_POINTS"
		THUMB_CUE_POINTS = "thumbCuePoint.THUMB_CUE_POINTS"
		USERS = "1"
		CATEGORIES = "2"
		CHILD_ENTRIES = "3"
		ACCESS_CONTROL = "4"
		METADATA = "5"
		FLAVORS = "6"
		CAPTIONS = "7"
	end

	class KalturaBaseEntryCompareAttribute
		ACCESS_CONTROL_ID = "accessControlId"
		CREATED_AT = "createdAt"
		END_DATE = "endDate"
		MODERATION_COUNT = "moderationCount"
		MODERATION_STATUS = "moderationStatus"
		PARTNER_ID = "partnerId"
		PARTNER_SORT_VALUE = "partnerSortValue"
		RANK = "rank"
		REPLACEMENT_STATUS = "replacementStatus"
		START_DATE = "startDate"
		STATUS = "status"
		TOTAL_RANK = "totalRank"
		TYPE = "type"
		UPDATED_AT = "updatedAt"
	end

	class KalturaBaseEntryMatchAttribute
		ADMIN_TAGS = "adminTags"
		CATEGORIES_IDS = "categoriesIds"
		CREATOR_ID = "creatorId"
		DESCRIPTION = "description"
		GROUP_ID = "groupId"
		ID = "id"
		NAME = "name"
		REFERENCE_ID = "referenceId"
		REPLACED_ENTRY_ID = "replacedEntryId"
		REPLACING_ENTRY_ID = "replacingEntryId"
		SEARCH_TEXT = "searchText"
		TAGS = "tags"
		USER_ID = "userId"
	end

	class KalturaBaseEntryOrderBy
		CREATED_AT_ASC = "+createdAt"
		END_DATE_ASC = "+endDate"
		MODERATION_COUNT_ASC = "+moderationCount"
		NAME_ASC = "+name"
		PARTNER_SORT_VALUE_ASC = "+partnerSortValue"
		RANK_ASC = "+rank"
		RECENT_ASC = "+recent"
		START_DATE_ASC = "+startDate"
		TOTAL_RANK_ASC = "+totalRank"
		UPDATED_AT_ASC = "+updatedAt"
		WEIGHT_ASC = "+weight"
		CREATED_AT_DESC = "-createdAt"
		END_DATE_DESC = "-endDate"
		MODERATION_COUNT_DESC = "-moderationCount"
		NAME_DESC = "-name"
		PARTNER_SORT_VALUE_DESC = "-partnerSortValue"
		RANK_DESC = "-rank"
		RECENT_DESC = "-recent"
		START_DATE_DESC = "-startDate"
		TOTAL_RANK_DESC = "-totalRank"
		UPDATED_AT_DESC = "-updatedAt"
		WEIGHT_DESC = "-weight"
	end

	class KalturaBaseSyndicationFeedOrderBy
		CREATED_AT_ASC = "+createdAt"
		NAME_ASC = "+name"
		PLAYLIST_ID_ASC = "+playlistId"
		TYPE_ASC = "+type"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		NAME_DESC = "-name"
		PLAYLIST_ID_DESC = "-playlistId"
		TYPE_DESC = "-type"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaBatchJobObjectType
		ENTRY_DISTRIBUTION = "contentDistribution.EntryDistribution"
		DROP_FOLDER_FILE = "dropFolderXmlBulkUpload.DropFolderFile"
		METADATA = "metadata.Metadata"
		METADATA_PROFILE = "metadata.MetadataProfile"
		SCHEDULED_TASK_PROFILE = "scheduledTask.ScheduledTaskProfile"
		ENTRY = "1"
		CATEGORY = "2"
		FILE_SYNC = "3"
		ASSET = "4"
	end

	class KalturaBatchJobOrderBy
		CREATED_AT_ASC = "+createdAt"
		ESTIMATED_EFFORT_ASC = "+estimatedEffort"
		EXECUTION_ATTEMPTS_ASC = "+executionAttempts"
		FINISH_TIME_ASC = "+finishTime"
		LOCK_VERSION_ASC = "+lockVersion"
		PRIORITY_ASC = "+priority"
		QUEUE_TIME_ASC = "+queueTime"
		STATUS_ASC = "+status"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ESTIMATED_EFFORT_DESC = "-estimatedEffort"
		EXECUTION_ATTEMPTS_DESC = "-executionAttempts"
		FINISH_TIME_DESC = "-finishTime"
		LOCK_VERSION_DESC = "-lockVersion"
		PRIORITY_DESC = "-priority"
		QUEUE_TIME_DESC = "-queueTime"
		STATUS_DESC = "-status"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaBatchJobType
		PARSE_MULTI_LANGUAGE_CAPTION_ASSET = "caption.parsemultilanguagecaptionasset"
		PARSE_CAPTION_ASSET = "captionSearch.parseCaptionAsset"
		DISTRIBUTION_DELETE = "contentDistribution.DistributionDelete"
		DISTRIBUTION_DISABLE = "contentDistribution.DistributionDisable"
		DISTRIBUTION_ENABLE = "contentDistribution.DistributionEnable"
		DISTRIBUTION_FETCH_REPORT = "contentDistribution.DistributionFetchReport"
		DISTRIBUTION_SUBMIT = "contentDistribution.DistributionSubmit"
		DISTRIBUTION_UPDATE = "contentDistribution.DistributionUpdate"
		DROP_FOLDER_CONTENT_PROCESSOR = "dropFolder.DropFolderContentProcessor"
		CONVERT = "0"
		DISTRIBUTION_SYNC = "contentDistribution.DistributionSync"
		DROP_FOLDER_WATCHER = "dropFolder.DropFolderWatcher"
		EVENT_NOTIFICATION_HANDLER = "eventNotification.EventNotificationHandler"
		INTEGRATION = "integration.Integration"
		SCHEDULED_TASK = "scheduledTask.ScheduledTask"
		INDEX_TAGS = "tagSearch.IndexTagsByPrivacyContext"
		TAG_RESOLVE = "tagSearch.TagResolve"
		VIRUS_SCAN = "virusScan.VirusScan"
		WIDEVINE_REPOSITORY_SYNC = "widevine.WidevineRepositorySync"
		IMPORT = "1"
		DELETE = "2"
		FLATTEN = "3"
		BULKUPLOAD = "4"
		DVDCREATOR = "5"
		DOWNLOAD = "6"
		OOCONVERT = "7"
		CONVERT_PROFILE = "10"
		POSTCONVERT = "11"
		EXTRACT_MEDIA = "14"
		MAIL = "15"
		NOTIFICATION = "16"
		CLEANUP = "17"
		SCHEDULER_HELPER = "18"
		BULKDOWNLOAD = "19"
		DB_CLEANUP = "20"
		PROVISION_PROVIDE = "21"
		CONVERT_COLLECTION = "22"
		STORAGE_EXPORT = "23"
		PROVISION_DELETE = "24"
		STORAGE_DELETE = "25"
		EMAIL_INGESTION = "26"
		METADATA_IMPORT = "27"
		METADATA_TRANSFORM = "28"
		FILESYNC_IMPORT = "29"
		CAPTURE_THUMB = "30"
		DELETE_FILE = "31"
		INDEX = "32"
		MOVE_CATEGORY_ENTRIES = "33"
		COPY = "34"
		CONCAT = "35"
		CONVERT_LIVE_SEGMENT = "36"
		COPY_PARTNER = "37"
		VALIDATE_LIVE_MEDIA_SERVERS = "38"
		SYNC_CATEGORY_PRIVACY_CONTEXT = "39"
		LIVE_REPORT_EXPORT = "40"
		RECALCULATE_CACHE = "41"
		LIVE_TO_VOD = "42"
		COPY_CAPTIONS = "43"
		CHUNKED_ENCODE_JOB_SCHEDULER = "44"
		SERVER_NODE_MONITOR = "45"
		USERS_CSV = "46"
		CLIP_CONCAT = "47"
		COPY_CUE_POINTS = "48"
	end

	class KalturaBulkUploadAction
		CANCEL = "scheduleBulkUpload.CANCEL"
		ADD = "1"
		UPDATE = "2"
		DELETE = "3"
		REPLACE = "4"
		TRANSFORM_XSLT = "5"
		ADD_OR_UPDATE = "6"
	end

	class KalturaBulkUploadObjectType
		SCHEDULE_EVENT = "scheduleBulkUpload.SCHEDULE_EVENT"
		SCHEDULE_RESOURCE = "scheduleBulkUpload.SCHEDULE_RESOURCE"
		ENTRY = "1"
		CATEGORY = "2"
		USER = "3"
		CATEGORY_USER = "4"
		CATEGORY_ENTRY = "5"
	end

	class KalturaBulkUploadOrderBy
	end

	class KalturaBulkUploadResultStatus
		ERROR = "1"
		OK = "2"
		IN_PROGRESS = "3"
	end

	class KalturaBulkUploadType
		CSV = "bulkUploadCsv.CSV"
		FILTER = "bulkUploadFilter.FILTER"
		XML = "bulkUploadXml.XML"
		DROP_FOLDER_XML = "dropFolderXmlBulkUpload.DROP_FOLDER_XML"
		ICAL = "scheduleBulkUpload.ICAL"
		DROP_FOLDER_ICAL = "scheduleDropFolder.DROP_FOLDER_ICAL"
	end

	class KalturaCategoryEntryAdvancedOrderBy
		CREATED_AT_ASC = "+createdAt"
		CREATED_AT_DESC = "-createdAt"
	end

	class KalturaCategoryEntryOrderBy
		CREATED_AT_ASC = "+createdAt"
		CREATED_AT_DESC = "-createdAt"
	end

	class KalturaCategoryIdentifierField
		FULL_NAME = "fullName"
		ID = "id"
		REFERENCE_ID = "referenceId"
	end

	class KalturaCategoryOrderBy
		CREATED_AT_ASC = "+createdAt"
		DEPTH_ASC = "+depth"
		DIRECT_ENTRIES_COUNT_ASC = "+directEntriesCount"
		DIRECT_SUB_CATEGORIES_COUNT_ASC = "+directSubCategoriesCount"
		ENTRIES_COUNT_ASC = "+entriesCount"
		FULL_NAME_ASC = "+fullName"
		MEMBERS_COUNT_ASC = "+membersCount"
		NAME_ASC = "+name"
		PARTNER_SORT_VALUE_ASC = "+partnerSortValue"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		DEPTH_DESC = "-depth"
		DIRECT_ENTRIES_COUNT_DESC = "-directEntriesCount"
		DIRECT_SUB_CATEGORIES_COUNT_DESC = "-directSubCategoriesCount"
		ENTRIES_COUNT_DESC = "-entriesCount"
		FULL_NAME_DESC = "-fullName"
		MEMBERS_COUNT_DESC = "-membersCount"
		NAME_DESC = "-name"
		PARTNER_SORT_VALUE_DESC = "-partnerSortValue"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaCategoryUserOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaCloneComponentSelectorType
		INCLUDE_COMPONENT = "0"
		EXCLUDE_COMPONENT = "1"
	end

	class KalturaConditionType
		EVENT_NOTIFICATION_FIELD = "eventNotification.BooleanField"
		EVENT_NOTIFICATION_OBJECT_CHANGED = "eventNotification.ObjectChanged"
		METADATA_FIELD_CHANGED = "metadata.FieldChanged"
		METADATA_FIELD_COMPARE = "metadata.FieldCompare"
		METADATA_FIELD_MATCH = "metadata.FieldMatch"
		AUTHENTICATED = "1"
		COUNTRY = "2"
		IP_ADDRESS = "3"
		SITE = "4"
		USER_AGENT = "5"
		FIELD_MATCH = "6"
		FIELD_COMPARE = "7"
		ASSET_PROPERTIES_COMPARE = "8"
		USER_ROLE = "9"
		GEO_DISTANCE = "10"
		OR_OPERATOR = "11"
		HASH = "12"
		DELIVERY_PROFILE = "13"
		ACTIVE_EDGE_VALIDATE = "14"
		ANONYMOUS_IP = "15"
		ASSET_TYPE = "16"
	end

	class KalturaContainerFormat
		_3GP = "3gp"
		APPLEHTTP = "applehttp"
		AVI = "avi"
		BMP = "bmp"
		COPY = "copy"
		FLV = "flv"
		HLS = "hls"
		ISMA = "isma"
		ISMV = "ismv"
		JPG = "jpg"
		M2TS = "m2ts"
		M4V = "m4v"
		MKV = "mkv"
		MOV = "mov"
		MP3 = "mp3"
		MP4 = "mp4"
		MPEG = "mpeg"
		MPEGTS = "mpegts"
		MXF = "mxf"
		OGG = "ogg"
		OGV = "ogv"
		PDF = "pdf"
		PNG = "png"
		SWF = "swf"
		WAV = "wav"
		WEBM = "webm"
		WMA = "wma"
		WMV = "wmv"
		WVM = "wvm"
	end

	class KalturaContextType
		PLAY = "1"
		DOWNLOAD = "2"
		THUMBNAIL = "3"
		METADATA = "4"
		EXPORT = "5"
		SERVE = "6"
	end

	class KalturaControlPanelCommandOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaConversionProfileAssetParamsOrderBy
	end

	class KalturaConversionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		CREATED_AT_DESC = "-createdAt"
	end

	class KalturaConversionProfileStatus
		DISABLED = "1"
		ENABLED = "2"
		DELETED = "3"
	end

	class KalturaConversionProfileType
		MEDIA = "1"
		LIVE_STREAM = "2"
	end

	class KalturaDataEntryCompareAttribute
		ACCESS_CONTROL_ID = "accessControlId"
		CREATED_AT = "createdAt"
		END_DATE = "endDate"
		MODERATION_COUNT = "moderationCount"
		MODERATION_STATUS = "moderationStatus"
		PARTNER_ID = "partnerId"
		PARTNER_SORT_VALUE = "partnerSortValue"
		RANK = "rank"
		REPLACEMENT_STATUS = "replacementStatus"
		START_DATE = "startDate"
		STATUS = "status"
		TOTAL_RANK = "totalRank"
		TYPE = "type"
		UPDATED_AT = "updatedAt"
	end

	class KalturaDataEntryMatchAttribute
		ADMIN_TAGS = "adminTags"
		CATEGORIES_IDS = "categoriesIds"
		CREATOR_ID = "creatorId"
		DESCRIPTION = "description"
		GROUP_ID = "groupId"
		ID = "id"
		NAME = "name"
		REFERENCE_ID = "referenceId"
		REPLACED_ENTRY_ID = "replacedEntryId"
		REPLACING_ENTRY_ID = "replacingEntryId"
		SEARCH_TEXT = "searchText"
		TAGS = "tags"
		USER_ID = "userId"
	end

	class KalturaDataEntryOrderBy
		CREATED_AT_ASC = "+createdAt"
		END_DATE_ASC = "+endDate"
		MODERATION_COUNT_ASC = "+moderationCount"
		NAME_ASC = "+name"
		PARTNER_SORT_VALUE_ASC = "+partnerSortValue"
		RANK_ASC = "+rank"
		RECENT_ASC = "+recent"
		START_DATE_ASC = "+startDate"
		TOTAL_RANK_ASC = "+totalRank"
		UPDATED_AT_ASC = "+updatedAt"
		WEIGHT_ASC = "+weight"
		CREATED_AT_DESC = "-createdAt"
		END_DATE_DESC = "-endDate"
		MODERATION_COUNT_DESC = "-moderationCount"
		NAME_DESC = "-name"
		PARTNER_SORT_VALUE_DESC = "-partnerSortValue"
		RANK_DESC = "-rank"
		RECENT_DESC = "-recent"
		START_DATE_DESC = "-startDate"
		TOTAL_RANK_DESC = "-totalRank"
		UPDATED_AT_DESC = "-updatedAt"
		WEIGHT_DESC = "-weight"
	end

	class KalturaDeliveryProfileAkamaiAppleHttpManifestOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaDeliveryProfileAkamaiHdsOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaDeliveryProfileAkamaiHttpOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaDeliveryProfileGenericAppleHttpOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaDeliveryProfileGenericHdsOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaDeliveryProfileGenericHttpOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaDeliveryProfileGenericRtmpOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaDeliveryProfileGenericSilverLightOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaDeliveryProfileLiveAppleHttpOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaDeliveryProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaDeliveryProfileRtmpOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaDeliveryProfileType
		EDGE_CAST_HTTP = "edgeCast.EDGE_CAST_HTTP"
		EDGE_CAST_RTMP = "edgeCast.EDGE_CAST_RTMP"
		KONTIKI_HTTP = "kontiki.KONTIKI_HTTP"
		VELOCIX_HDS = "velocix.VELOCIX_HDS"
		VELOCIX_HLS = "velocix.VELOCIX_HLS"
		APPLE_HTTP = "1"
		HDS = "3"
		HTTP = "4"
		RTMP = "5"
		RTSP = "6"
		SILVER_LIGHT = "7"
		AKAMAI_HLS_DIRECT = "10"
		AKAMAI_HLS_MANIFEST = "11"
		AKAMAI_HD = "12"
		AKAMAI_HDS = "13"
		AKAMAI_HTTP = "14"
		AKAMAI_RTMP = "15"
		AKAMAI_RTSP = "16"
		AKAMAI_SS = "17"
		GENERIC_HLS = "21"
		GENERIC_HDS = "23"
		GENERIC_HTTP = "24"
		GENERIC_HLS_MANIFEST = "25"
		GENERIC_HDS_MANIFEST = "26"
		GENERIC_SS = "27"
		GENERIC_RTMP = "28"
		LEVEL3_HLS = "31"
		LEVEL3_HTTP = "34"
		LEVEL3_RTMP = "35"
		LIMELIGHT_HTTP = "44"
		LIMELIGHT_RTMP = "45"
		LOCAL_PATH_APPLE_HTTP = "51"
		LOCAL_PATH_HDS = "53"
		LOCAL_PATH_HTTP = "54"
		LOCAL_PATH_RTMP = "55"
		VOD_PACKAGER_HLS = "61"
		VOD_PACKAGER_HDS = "63"
		VOD_PACKAGER_MSS = "67"
		VOD_PACKAGER_DASH = "68"
		VOD_PACKAGER_HLS_MANIFEST = "69"
		LIVE_HLS = "1001"
		LIVE_HDS = "1002"
		LIVE_DASH = "1003"
		LIVE_RTMP = "1005"
		LIVE_HLS_TO_MULTICAST = "1006"
		LIVE_PACKAGER_HLS = "1007"
		LIVE_PACKAGER_HDS = "1008"
		LIVE_PACKAGER_DASH = "1009"
		LIVE_PACKAGER_MSS = "1010"
		LIVE_AKAMAI_HDS = "1013"
	end

	class KalturaDeliveryServerNodeOrderBy
		CREATED_AT_ASC = "+createdAt"
		HEARTBEAT_TIME_ASC = "+heartbeatTime"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		HEARTBEAT_TIME_DESC = "-heartbeatTime"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaDocumentEntryCompareAttribute
		ACCESS_CONTROL_ID = "accessControlId"
		CREATED_AT = "createdAt"
		END_DATE = "endDate"
		MODERATION_COUNT = "moderationCount"
		MODERATION_STATUS = "moderationStatus"
		PARTNER_ID = "partnerId"
		PARTNER_SORT_VALUE = "partnerSortValue"
		RANK = "rank"
		REPLACEMENT_STATUS = "replacementStatus"
		START_DATE = "startDate"
		STATUS = "status"
		TOTAL_RANK = "totalRank"
		TYPE = "type"
		UPDATED_AT = "updatedAt"
	end

	class KalturaDocumentEntryMatchAttribute
		ADMIN_TAGS = "adminTags"
		CATEGORIES_IDS = "categoriesIds"
		CREATOR_ID = "creatorId"
		DESCRIPTION = "description"
		GROUP_ID = "groupId"
		ID = "id"
		NAME = "name"
		REFERENCE_ID = "referenceId"
		REPLACED_ENTRY_ID = "replacedEntryId"
		REPLACING_ENTRY_ID = "replacingEntryId"
		SEARCH_TEXT = "searchText"
		TAGS = "tags"
		USER_ID = "userId"
	end

	class KalturaDrmSchemeName
		PLAYREADY_CENC = "drm.PLAYREADY_CENC"
		WIDEVINE_CENC = "drm.WIDEVINE_CENC"
		FAIRPLAY = "fairplay.FAIRPLAY"
		PLAYREADY = "playReady.PLAYREADY"
		WIDEVINE = "widevine.WIDEVINE"
	end

	class KalturaDurationType
		LONG = "long"
		MEDIUM = "medium"
		NOT_AVAILABLE = "notavailable"
		SHORT = "short"
	end

	class KalturaESearchLanguage
		ARABIC = "Arabic"
		BASQUE = "Basque"
		BRAZILIAN = "Brazilian"
		BULGARIAN = "Bulgarian"
		CATALAN = "Catalan"
		CHINESE = "Chinese"
		CZECH = "Czech"
		DANISH = "Danish"
		DUTCH = "Dutch"
		ENGLISH = "English"
		FINNISH = "Finnish"
		FRENCH = "French"
		GALICIAN = "Galician"
		GERMAN = "German"
		GREEK = "Greek"
		HINDI = "Hindi"
		HUNGRIAN = "Hungarian"
		INDONESIAN = "Indonesian"
		ITALIAN = "Italian"
		JAPANESE = "Japanese"
		KOREAN = "Korean"
		LATVIAN = "Latvian"
		LITHUANIAN = "Lithuanian"
		NORWEGIAN = "Norwegian"
		PERSIAN = "Persian"
		PORTUGUESE = "Prtuguese"
		ROMANIAN = "Romanian"
		RUSSIAN = "Russian"
		SORANI = "Sorani"
		SPANISH = "Spanish"
		SWEDISH = "Swedish"
		THAI = "Thai"
		TURKISH = "Turkish"
	end

	class KalturaEdgeServerNodeOrderBy
		CREATED_AT_ASC = "+createdAt"
		HEARTBEAT_TIME_ASC = "+heartbeatTime"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		HEARTBEAT_TIME_DESC = "-heartbeatTime"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaEntryIdentifierField
		ID = "id"
		REFERENCE_ID = "referenceId"
	end

	class KalturaEntryReplacementStatus
		NONE = "0"
		APPROVED_BUT_NOT_READY = "1"
		READY_BUT_NOT_APPROVED = "2"
		NOT_READY_AND_NOT_APPROVED = "3"
		FAILED = "4"
	end

	class KalturaEntryServerNodeOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaEntryServerNodeType
		LIVE_PRIMARY = "0"
		LIVE_BACKUP = "1"
	end

	class KalturaEntryStatus
		ERROR_IMPORTING = "-2"
		ERROR_CONVERTING = "-1"
		SCAN_FAILURE = "virusScan.ScanFailure"
		IMPORT = "0"
		INFECTED = "virusScan.Infected"
		PRECONVERT = "1"
		READY = "2"
		DELETED = "3"
		PENDING = "4"
		MODERATE = "5"
		BLOCKED = "6"
		NO_CONTENT = "7"
	end

	class KalturaEntryType
		AUTOMATIC = "-1"
		EXTERNAL_MEDIA = "externalMedia.externalMedia"
		MEDIA_CLIP = "1"
		MIX = "2"
		PLAYLIST = "5"
		DATA = "6"
		LIVE_STREAM = "7"
		LIVE_CHANNEL = "8"
		DOCUMENT = "10"
	end

	class KalturaExternalMediaEntryCompareAttribute
		ACCESS_CONTROL_ID = "accessControlId"
		CREATED_AT = "createdAt"
		END_DATE = "endDate"
		LAST_PLAYED_AT = "lastPlayedAt"
		MEDIA_DATE = "mediaDate"
		MEDIA_TYPE = "mediaType"
		MODERATION_COUNT = "moderationCount"
		MODERATION_STATUS = "moderationStatus"
		MS_DURATION = "msDuration"
		PARTNER_ID = "partnerId"
		PARTNER_SORT_VALUE = "partnerSortValue"
		PLAYS = "plays"
		RANK = "rank"
		REPLACEMENT_STATUS = "replacementStatus"
		START_DATE = "startDate"
		STATUS = "status"
		TOTAL_RANK = "totalRank"
		TYPE = "type"
		UPDATED_AT = "updatedAt"
		VIEWS = "views"
	end

	class KalturaExternalMediaEntryMatchAttribute
		ADMIN_TAGS = "adminTags"
		CATEGORIES_IDS = "categoriesIds"
		CREATOR_ID = "creatorId"
		DESCRIPTION = "description"
		DURATION_TYPE = "durationType"
		FLAVOR_PARAMS_IDS = "flavorParamsIds"
		GROUP_ID = "groupId"
		ID = "id"
		NAME = "name"
		REFERENCE_ID = "referenceId"
		REPLACED_ENTRY_ID = "replacedEntryId"
		REPLACING_ENTRY_ID = "replacingEntryId"
		SEARCH_TEXT = "searchText"
		TAGS = "tags"
		USER_ID = "userId"
	end

	class KalturaFileAssetObjectType
		UI_CONF = "2"
		ENTRY = "3"
	end

	class KalturaFileAssetOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaFileAssetStatus
		PENDING = "0"
		UPLOADING = "1"
		READY = "2"
		DELETED = "3"
		ERROR = "4"
	end

	class KalturaFileSyncObjectType
		DISTRIBUTION_PROFILE = "contentDistribution.DistributionProfile"
		ENTRY_DISTRIBUTION = "contentDistribution.EntryDistribution"
		GENERIC_DISTRIBUTION_ACTION = "contentDistribution.GenericDistributionAction"
		EMAIL_NOTIFICATION_TEMPLATE = "emailNotification.EmailNotificationTemplate"
		HTTP_NOTIFICATION_TEMPLATE = "httpNotification.HttpNotificationTemplate"
		ENTRY = "1"
		UICONF = "2"
		BATCHJOB = "3"
		ASSET = "4"
		FLAVOR_ASSET = "4"
		METADATA = "5"
		METADATA_PROFILE = "6"
		SYNDICATION_FEED = "7"
		CONVERSION_PROFILE = "8"
		FILE_ASSET = "9"
	end

	class KalturaFlavorAssetOrderBy
		CREATED_AT_ASC = "+createdAt"
		DELETED_AT_ASC = "+deletedAt"
		SIZE_ASC = "+size"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		DELETED_AT_DESC = "-deletedAt"
		SIZE_DESC = "-size"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaFlavorParamsOrderBy
	end

	class KalturaFlavorParamsOutputOrderBy
	end

	class KalturaGenericSyndicationFeedOrderBy
		CREATED_AT_ASC = "+createdAt"
		NAME_ASC = "+name"
		PLAYLIST_ID_ASC = "+playlistId"
		TYPE_ASC = "+type"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		NAME_DESC = "-name"
		PLAYLIST_ID_DESC = "-playlistId"
		TYPE_DESC = "-type"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaGenericXsltSyndicationFeedOrderBy
		CREATED_AT_ASC = "+createdAt"
		NAME_ASC = "+name"
		PLAYLIST_ID_ASC = "+playlistId"
		TYPE_ASC = "+type"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		NAME_DESC = "-name"
		PLAYLIST_ID_DESC = "-playlistId"
		TYPE_DESC = "-type"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaGeoCoderType
		KALTURA = "1"
		MAX_MIND = "2"
		DIGITAL_ELEMENT = "3"
	end

	class KalturaGoogleSyndicationFeedAdultValues
		NO = "No"
		YES = "Yes"
	end

	class KalturaGoogleVideoSyndicationFeedOrderBy
		CREATED_AT_ASC = "+createdAt"
		NAME_ASC = "+name"
		PLAYLIST_ID_ASC = "+playlistId"
		TYPE_ASC = "+type"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		NAME_DESC = "-name"
		PLAYLIST_ID_DESC = "-playlistId"
		TYPE_DESC = "-type"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaGroupUserOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaITunesSyndicationFeedAdultValues
		CLEAN = "clean"
		NO = "no"
		YES = "yes"
	end

	class KalturaITunesSyndicationFeedCategories
		ARTS = "Arts"
		ARTS_DESIGN = "Arts/Design"
		ARTS_FASHION_BEAUTY = "Arts/Fashion &amp; Beauty"
		ARTS_FOOD = "Arts/Food"
		ARTS_LITERATURE = "Arts/Literature"
		ARTS_PERFORMING_ARTS = "Arts/Performing Arts"
		ARTS_VISUAL_ARTS = "Arts/Visual Arts"
		BUSINESS = "Business"
		BUSINESS_BUSINESS_NEWS = "Business/Business News"
		BUSINESS_CAREERS = "Business/Careers"
		BUSINESS_INVESTING = "Business/Investing"
		BUSINESS_MANAGEMENT_MARKETING = "Business/Management &amp; Marketing"
		BUSINESS_SHOPPING = "Business/Shopping"
		COMEDY = "Comedy"
		EDUCATION = "Education"
		EDUCATION_TECHNOLOGY = "Education/Education Technology"
		EDUCATION_HIGHER_EDUCATION = "Education/Higher Education"
		EDUCATION_K_12 = "Education/K-12"
		EDUCATION_LANGUAGE_COURSES = "Education/Language Courses"
		EDUCATION_TRAINING = "Education/Training"
		GAMES_HOBBIES = "Games &amp; Hobbies"
		GAMES_HOBBIES_AUTOMOTIVE = "Games &amp; Hobbies/Automotive"
		GAMES_HOBBIES_AVIATION = "Games &amp; Hobbies/Aviation"
		GAMES_HOBBIES_HOBBIES = "Games &amp; Hobbies/Hobbies"
		GAMES_HOBBIES_OTHER_GAMES = "Games &amp; Hobbies/Other Games"
		GAMES_HOBBIES_VIDEO_GAMES = "Games &amp; Hobbies/Video Games"
		GOVERNMENT_ORGANIZATIONS = "Government &amp; Organizations"
		GOVERNMENT_ORGANIZATIONS_LOCAL = "Government &amp; Organizations/Local"
		GOVERNMENT_ORGANIZATIONS_NATIONAL = "Government &amp; Organizations/National"
		GOVERNMENT_ORGANIZATIONS_NON_PROFIT = "Government &amp; Organizations/Non-Profit"
		GOVERNMENT_ORGANIZATIONS_REGIONAL = "Government &amp; Organizations/Regional"
		HEALTH = "Health"
		HEALTH_ALTERNATIVE_HEALTH = "Health/Alternative Health"
		HEALTH_FITNESS_NUTRITION = "Health/Fitness &amp; Nutrition"
		HEALTH_SELF_HELP = "Health/Self-Help"
		HEALTH_SEXUALITY = "Health/Sexuality"
		KIDS_FAMILY = "Kids &amp; Family"
		MUSIC = "Music"
		NEWS_POLITICS = "News &amp; Politics"
		RELIGION_SPIRITUALITY = "Religion &amp; Spirituality"
		RELIGION_SPIRITUALITY_BUDDHISM = "Religion &amp; Spirituality/Buddhism"
		RELIGION_SPIRITUALITY_CHRISTIANITY = "Religion &amp; Spirituality/Christianity"
		RELIGION_SPIRITUALITY_HINDUISM = "Religion &amp; Spirituality/Hinduism"
		RELIGION_SPIRITUALITY_ISLAM = "Religion &amp; Spirituality/Islam"
		RELIGION_SPIRITUALITY_JUDAISM = "Religion &amp; Spirituality/Judaism"
		RELIGION_SPIRITUALITY_OTHER = "Religion &amp; Spirituality/Other"
		RELIGION_SPIRITUALITY_SPIRITUALITY = "Religion &amp; Spirituality/Spirituality"
		SCIENCE_MEDICINE = "Science &amp; Medicine"
		SCIENCE_MEDICINE_MEDICINE = "Science &amp; Medicine/Medicine"
		SCIENCE_MEDICINE_NATURAL_SCIENCES = "Science &amp; Medicine/Natural Sciences"
		SCIENCE_MEDICINE_SOCIAL_SCIENCES = "Science &amp; Medicine/Social Sciences"
		SOCIETY_CULTURE = "Society &amp; Culture"
		SOCIETY_CULTURE_HISTORY = "Society &amp; Culture/History"
		SOCIETY_CULTURE_PERSONAL_JOURNALS = "Society &amp; Culture/Personal Journals"
		SOCIETY_CULTURE_PHILOSOPHY = "Society &amp; Culture/Philosophy"
		SOCIETY_CULTURE_PLACES_TRAVEL = "Society &amp; Culture/Places &amp; Travel"
		SPORTS_RECREATION = "Sports &amp; Recreation"
		SPORTS_RECREATION_AMATEUR = "Sports &amp; Recreation/Amateur"
		SPORTS_RECREATION_COLLEGE_HIGH_SCHOOL = "Sports &amp; Recreation/College &amp; High School"
		SPORTS_RECREATION_OUTDOOR = "Sports &amp; Recreation/Outdoor"
		SPORTS_RECREATION_PROFESSIONAL = "Sports &amp; Recreation/Professional"
		TV_FILM = "TV &amp; Film"
		TECHNOLOGY = "Technology"
		TECHNOLOGY_GADGETS = "Technology/Gadgets"
		TECHNOLOGY_PODCASTING = "Technology/Podcasting"
		TECHNOLOGY_SOFTWARE_HOW_TO = "Technology/Software How-To"
		TECHNOLOGY_TECH_NEWS = "Technology/Tech News"
	end

	class KalturaITunesSyndicationFeedOrderBy
		CREATED_AT_ASC = "+createdAt"
		NAME_ASC = "+name"
		PLAYLIST_ID_ASC = "+playlistId"
		TYPE_ASC = "+type"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		NAME_DESC = "-name"
		PLAYLIST_ID_DESC = "-playlistId"
		TYPE_DESC = "-type"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaLanguage
		ABQ = "Abaza"
		AB = "Abkhazian"
		ABE = "Abnaki Western"
		ABU = "Abure"
		ACN = "Achang"
		ACE = "Achinese"
		ACT = "Achterhooks"
		ACV = "Achumawi"
		ADJ = "Adioukrou"
		ADY = "Adyghe; Adygei"
		ADT = "Adynyamathanha"
		AAL = "Afade"
		AA = "Afar"
		AF = "Afrikaans"
		AGQ = "Aghem"
		AGX = "Aghul"
		AGU = "Aguacateco"
		AGR = "Aguaruna"
		AIN = "Ainu (Japan)"
		AKK = "Akkadian"
		AKL = "Aklanon"
		AKU = "Akum"
		AKZ = "Alabama"
		SQ = "Albanian"
		ALN = "Albanian (Gheg)"
		ALS = "Albanian (Tosk)"
		ALE = "Aleut"
		ALQ = "Algonquin"
		ALT = "Altai (Southern)"
		AM = "Amharic"
		RME = "Angloromani"
		APJ = "Apache (Jicarilla)"
		APW = "Apache (Western)"
		AR = "Arabic"
		ARB = "Arabic (standard)"
		B_T = "Arabic Tunisian Spoken"
		ARC = "Aramaic"
		SAM = "Aramaic Samaritan"
		ARP = "Arapaho"
		ARN = "Araucanian"
		ARI = "Arikara"
		HY = "Armenian"
		RUP = "Aromanian"
		AS_ = "Assamese"
		ASB = "Assiniboine"
		AII = "Assyrian Neo-Aramaic"
		AST = "Asturian"
		ATJ = "Atikamekw"
		AWA = "Awadhi"
		AY = "Aymara"
		AZ = "Azerbaijani"
		BCR = "Babine"
		BFQ = "Badaga"
		BDJ = "Bai"
		BAN = "Balinese"
		BCC = "Balochi Southern"
		BFT = "Balti"
		BAL = "Baluchi"
		BAS = "Basa (Cameroon)"
		BA = "Bashkir"
		EU = "Basque"
		BAR = "Bavarian"
		BEA = "Beaver"
		BEJ = "Beja"
		BEM = "Bemba (Zambia)"
		BN = "Bengali (Bangla)"
		BEW = "Betawi"
		KAP = "Bezhta"
		BHB = "Bhili"
		BHO = "Bhojpuri"
		DZ = "Bhutani"
		BH = "Bihari"
		BIK = "Bikol"
		BIN = "Bini"
		BPY = "Bishnupriya Manipuri"
		BI = "Bislama"
		BR = "Breton"
		BUG = "Buginese"
		BG = "Bulgarian"
		BUA = "Buriat"
		MY = "Burmese"
		BE = "Byelorussian (Belarusian)"
		CAD = "Caddo"
		KM = "Cambodian"
		YUE = "Cantonese"
		CRX = "Carrier"
		CAF = "Carrier Southern"
		CA = "Catalan"
		CHC = "Catawba"
		CAY = "Cayuga"
		CEB = "Cebuano"
		CHG = "Chagatai"
		CLD = "Chaldean Neo-Aramaic"
		CHR = "Cherokee"
		CHY = "Cheyenne"
		CIC = "Chickasaw"
		CLC = "Chilcotin"
		ZH = "Chinese"
		CHN = "Chinook jargon"
		CHP = "Chipewyan"
		CIW = "Chippewa"
		CHO = "Choctaw"
		CAA = "Chor"
		CKT = "Chukot"
		CIM = "Cimbrian"
		CLM = "Clallam Klallam"
		COJ = "Cochimi"
		COC = "Cocopa"
		KSH = "Colognian"
		COM = "Comanche"
		SWB = "Comorian"
		COO = "Comox"
		COP = "Coptic"
		CO = "Corsican"
		MUS = "Creek"
		CRH = "Crimean Tatar"
		HR = "Croatian"
		CUP = "Cupeo"
		CS = "Czech"
		DAK = "Dakota"
		DA = "Danish"
		DAR = "Dargwa"
		PRD = "Dari (Persian)"
		GBZ = "Dari Zoroastrian"
		DHV = "Dehu"
		DEL = "Delaware"
		DIN = "Dinka"
		DOI = "Dogri (generic)"
		DGR = "Dogrib"
		DLG = "Dolgan"
		DOH = "Dong"
		DUA = "Duala"
		DNG = "Dungan"
		NL = "Dutch"
		DYU = "Dyula"
		EEE = "E"
		EGL = "Emilian"
		EN = "English"
		EN_US = "English (American)"
		EN_GB = "English (British)"
		ENM = "English Middle (1100-1500)"
		MYV = "Erzya"
		EO = "Esperanto"
		ET = "Estonian"
		EVE = "Even"
		EVN = "Evenki"
		FO = "Faeroese"
		FAX = "Fala"
		FAN = "Fang (Equatorial Guinea)"
		FA = "Farsi"
		FJ = "Fiji"
		FIL = "Filipino"
		FI = "Finnish"
		FIT = "Finnish (Tornedalen)"
		FON = "Fon"
		FRP = "Franco-Prove"
		FRK = "Frankish"
		FR = "French"
		FY = "Frisian"
		FRR = "Frisian Northern"
		FUR = "Friulian"
		FVR = "Fur"
		GAA = "Ga"
		GV = "Gaelic (Manx)"
		GD = "Gaelic (Scottish)"
		GAG = "Gagauz"
		GL = "Galician"
		GAN = "Gan"
		GEZ = "Geez"
		KA = "Georgian"
		DE = "German"
		GEH = "German Hutterite"
		PDC = "German Pennsylvania"
		GIL = "Gilbertese"
		NIV = "Gilyak Nivkh"
		GIT = "Gitxsan"
		EL = "Greek"
		GRC = "Greek Ancient (to 1453)"
		KL = "Greenlandic"
		GN = "Guarani"
		GU = "Gujarati"
		GWI = "Gwichin"
		HAI = "Haida"
		HNN = "Hainanese"
		HAS = "Haisla"
		HAK = "Hakka"
		HUR = "Halkomelem"
		HAA = "Han"
		HNI = "Hani"
		HA = "Hausa"
		HAW = "Hawaiian"
		HE = "Hebrew"
		IW = "Hebrew"
		HEI = "Heiltsuk"
		HID = "Hidatsa"
		HIL = "Hiligaynon"
		HI = "Hindi"
		HMN = "Hmong"
		HKK = "Hokkien"
		HOP = "Hopi"
		CZH = "Huizhou Chinese"
		HU = "Hungarian"
		IS = "Icelandic"
		KPO = "Ikposo"
		ILO = "Iloko"
		SMN = "Inari Sami"
		IN = "Indonesian"
		ID = "Indonesian"
		IZH = "Ingrian"
		INH = "Ingush"
		IA = "Interlingua"
		IE = "Interlingue"
		IU = "Inuktitut"
		IK = "Inupiak"
		GA = "Irish"
		IT = "Italian"
		ITL = "Itelmen"
		JA = "Japanese"
		JV = "Javanese"
		CJY = "Jinyu Chinese"
		KAJ = "Jju"
		JCT = "Judeo-Crimean Tatar"
		JGE = "Judeo-Georgian"
		JUT = "Jutish"
		KBD = "Kabardian"
		KEA = "Kabuverdianu"
		KAB = "Kabyle"
		KFR = "Kachchi"
		KJV = "Kaikavian literary language (Kajkavian)"
		XAL = "Kalmyk Oirat"
		KN = "Kannada"
		KSK = "Kansa"
		KRC = "Karachay-Balkar"
		KIM = "Karagas"
		KDR = "Karaim"
		KAA = "Karakalpak"
		KRL = "Karelian"
		KS = "Kashmiri"
		CSB = "Kashubian"
		KKZ = "Kaska"
		KAW = "Kawi"
		KK = "Kazakh"
		KJH = "Khakas"
		KLJ = "Khalaj Turkic"
		KCA = "Khanty"
		KHA = "Khasi"
		KXM = "Khmer Northern"
		KIC = "Kickapoo"
		RW = "Kinyarwanda (Ruanda)"
		KIO = "Kiowa"
		KY = "Kirghiz"
		RN = "Kirundi (Rundi)"
		TLH = "Klingon tlhIngan-Hol"
		KFA = "Kodava"
		KOI = "Komi-Permyak"
		KOK = "Konkani (generic)"
		KNN = "Konkani (specific)"
		GOM = "Konkani Goan"
		KO = "Korean"
		KPY = "Koryak"
		KOS = "Kosraean"
		AVK = "Kotava"
		KPE = "Kpelle"
		DIH = "Kumiai"
		KUM = "Kumyk"
		KU = "Kurdish"
		KUT = "Kutenai"
		KWK = "Kwakiutl"
		GDM = "Laal"
		LLD = "Ladin"
		LAD = "Ladino"
		LAH = "Lahnda"
		LHU = "Lahu"
		LBE = "Lak"
		LKI = "Laki"
		LKT = "Lakota"
		LO = "Laothian"
		LA = "Latin"
		LV = "Latvian (Lettish)"
		LZZ = "Laz"
		LEZ = "Lezghian"
		LIJ = "Ligurian"
		LIL = "Lillooet"
		LIF = "Limbu"
		LI = "Limburgish ( Limburger)"
		LN = "Lingala"
		LT = "Lithuanian"
		JBO = "Lojban"
		LOM = "Loma (Liberia)"
		LMO = "Lombard"
		NDS = "Low German Low Saxon"
		LOZ = "Lozi"
		LUA = "Luba-Lulua"
		LUQ = "Lucumi"
		LUD = "Ludian"
		SMJ = "Lule Sami"
		LUN = "Lunda"
		LUO = "Luo (Kenya and Tanzania)"
		LUT = "Lushootseed"
		MK = "Macedonian"
		MAD = "Madurese"
		MAG = "Magahi"
		MAI = "Maithili"
		MG = "Malagasy"
		MS = "Malay"
		ML = "Malayalam"
		PQM = "Malecite-Passamaquoddy"
		MT = "Maltese"
		MNC = "Manchu"
		MID = "Mandaic"
		MHQ = "Mandan"
		CMN = "Mandarin Chinese"
		MNS = "Mansi"
		MI = "Maori"
		MRW = "Maranao"
		MR = "Marathi"
		CHM = "Mari (Russia)"
		MWR = "Marwari"
		MAS = "Masai"
		MFY = "Mayo"
		MNI = "Meitei"
		MEN = "Mende (Sierra Leone)"
		MEZ = "Menominee"
		MIC = "Micmac"
		MNP = "Min Bei Chinese"
		CDO = "Min Dong Chinese"
		MIN = "Minangkabau"
		XMF = "Mingrelian"
		MWL = "Mirandese"
		MOH = "Mohawk"
		MDF = "Moksha"
		MO = "Moldavian"
		MNW = "Mon"
		MN = "Mongolian"
		MFE = "Morisyen"
		MOS = "Mossi"
		MXI = "Mozarabic"
		MU = "Multilingual"
		MTQ = "Muong"
		NAQ = "Nama (Namibia)"
		GLD = "Nanai"
		NSK = "Naskapi"
		NA = "Nauru"
		NAP = "Neapolitan"
		NE = "Nepali"
		NEW_ = "Newari Nepal Bhasa"
		NIO = "Nganasan"
		NCG = "Nisgaa"
		NIU = "Niuean"
		NOG = "Nogai"
		NON = "Norse Old"
		NSO = "Northern Sotho Pedi Sepedi"
		NO = "Norwegian"
		NOV = "Novial"
		NYM = "Nyamwezi"
		NYO = "Nyoro"
		NYS = "Nyungah"
		OC = "Occitan"
		OJC = "Ojibwa Central"
		OJG = "Ojibwa Eastern"
		OJB = "Ojibwa Northwestern"
		OJS = "Ojibwa Severn"
		OJW = "Ojibwa Western"
		RYU = "Okinawan Central"
		ANG = "Old English"
		ONE = "Oneida"
		ONO = "Onondaga"
		OR_ = "Oriya"
		OM = "Oromo (Afan, Galla)"
		OTW = "Ottawa"
		PPI = "Paipai"
		PAU = "Palauan"
		PAM = "Pampanga"
		PAG = "Pangasinan"
		PAP = "Papiamento"
		PS = "Pashto (Pushto)"
		PRP = "Persian"
		PRS = "Persian (Dari)"
		PFL = "Pfaelzisch"
		PCD = "Picard"
		PMS = "Piedmontese"
		MYP = "Pirah"
		PIH = "Pitcairn-Norfolk"
		PDT = "Plautdietsch"
		PL = "Polish"
		PNT = "Pontic"
		PT = "Portuguese"
		POT = "Potawatomi"
		PRG = "Prussian"
		FUC = "Pulaar"
		PA = "Punjabi"
		QXQ = "Qashqai"
		ALC = "Qawasqar"
		QU = "Quechua"
		QUC = "Quich Central"
		RAP = "Rapanui"
		RAR = "Rarotongan"
		QTZ = "Reserved for local use."
		RM = "Rhaeto-Romance"
		RGN = "Romagnol"
		RMF = "Romani Kalo Finnish"
		RMO = "Romani Sinte"
		RO = "Romanian"
		RUO = "Romanian Istro"
		RUQ = "Romanian Megleno"
		ROM = "Romany"
		RCF = "Runion Creole French"
		RU = "Russian"
		RUE = "Rusyn"
		ACF = "Saint Lucian Creole French"
		SAH = "Sakha"
		SLR = "Salar"
		STR = "Salish Straits"
		SJD = "Sami Kildin"
		SM = "Samoan"
		SG = "Sangro"
		SA = "Sanskrit"
		SAT = "Santali"
		SRM = "Saramaccan"
		SDC = "Sardinian Sassarese"
		STQ = "Saterland Frisian"
		SXU = "Saxon Upper"
		SCO = "Scots"
		SEC = "Sechelt"
		TRV = "Seediq"
		SEK = "Sekani"
		SEL = "Selkup"
		SEE = "Seneca"
		SR = "Serbian"
		SH = "Serbo-Croatian"
		SEI = "Seri"
		ST = "Sesotho"
		TN = "Setswana"
		SJW = "Shawnee"
		SN = "Shona"
		CJS = "Shor"
		SHH = "Shoshoni"
		SHS = "Shuswap"
		SCN = "Sicilian"
		SID = "Sidamo"
		SZL = "Silesian"
		SD = "Sindhi"
		SI = "Sinhalese"
		SS = "Siswati"
		SMS = "Skolt Sami"
		SCS = "Slavey North"
		XSL = "Slavey South"
		SK = "Slovak"
		SL = "Slovenian"
		SO = "Somali"
		SNK = "Soninke"
		DSB = "Sorbian Lower"
		HSB = "Sorbian Upper"
		SMA = "Southern Sami"
		ES = "Spanish"
		SRN = "Sranan"
		STO = "Stoney"
		XSV = "Sudovian"
		SUX = "Sumerian"
		SU = "Sundanese"
		SVA = "Svan"
		SWG = "Swabian"
		SW = "Swahili (Kiswahili)"
		SV = "Swedish"
		SWL = "Swedish Sign Language"
		GSW = "Swiss German Alemannic Alsatian"
		SYR = "Syriac"
		TAB = "Tabassaran"
		SHY = "Tachawit"
		SHI = "Tachelhit"
		TL = "Tagalog"
		TBW = "Tagbanwa"
		TGX = "Tagish"
		THT = "Tahltan"
		TDD = "Tai Na"
		TG = "Tajik"
		TLY = "Talysh"
		TTQ = "Tamajaq Tawallammat"
		TAQ = "Tamasheq"
		TZM = "Tamazight Central Atlas"
		TA = "Tamil"
		TAR = "Tarahumara Central"
		TTT = "Tat Muslim"
		TT = "Tatar"
		TE = "Telugu"
		TEO = "Teo Chew"
		TET = "Tetum"
		TH = "Thai"
		NOD = "Thai (Northern)"
		TTS = "Thai Northeastern"
		THP = "Thompson"
		BO = "Tibetan"
		TIG = "Tigre"
		TI = "Tigrinya"
		TLI = "Tlingit"
		TCX = "Toda"
		OOD = "Tohono Oodham"
		TPI = "Tok Pisin"
		TO = "Tonga"
		TOG = "Tonga (Nyasa)"
		DDO = "Tsez"
		TSI = "Tsimshian"
		TS = "Tsonga"
		TCY = "Tulu"
		TUM = "Tumbuka"
		MZB = "Tumzabt"
		TPN = "Tupinamb"
		TUV = "Turkana"
		TR = "Turkish"
		OTA = "Turkish Ottoman"
		TK = "Turkmen"
		TUS = "Tuscarora"
		TVL = "Tuvalu"
		TYV = "Tuvinian"
		TW = "Twi"
		UBY = "Ubykh"
		UDI = "Udi"
		UDM = "Udmurt"
		UG = "Uighur"
		UK = "Ukrainian"
		UN = "Undefined"
		UR = "Urdu"
		UUM = "Urum"
		UZ = "Uzbek"
		VEC = "Venetian"
		VEP = "Veps"
		VI = "Vietnamese"
		VO = "Volapuk"
		VOR = "Voro"
		VOT = "Votic"
		VRO = "Vro"
		AUC = "Waorani"
		WAR = "Waray (Philippines)"
		CY = "Welsh"
		PES = "Western Farsi"
		AMW = "Western Neo-Aramaic"
		WIY = "Wiyot"
		WO = "Wolof"
		WUU = "Wu Chinese"
		WYM = "Wymysorys"
		XH = "Xhosa"
		AME = "Yanesha"
		YI = "Yiddish"
		JI = "Yiddish"
		YO = "Yoruba"
		ZAI = "Zapotec Isthmus"
		DJE = "Zarma"
		ZU = "Zulu"
	end

	class KalturaLanguageCode
		AA = "aa"
		AB = "ab"
		AF = "af"
		AM = "am"
		AR = "ar"
		AS_ = "as"
		AY = "ay"
		AZ = "az"
		BA = "ba"
		BE = "be"
		BG = "bg"
		BH = "bh"
		BI = "bi"
		BN = "bn"
		BO = "bo"
		BR = "br"
		CA = "ca"
		CO = "co"
		CS = "cs"
		CY = "cy"
		DA = "da"
		DE = "de"
		DZ = "dz"
		EL = "el"
		EN = "en"
		EN_GB = "en_gb"
		EN_US = "en_us"
		EO = "eo"
		ES = "es"
		ET = "et"
		EU = "eu"
		FA = "fa"
		FI = "fi"
		FJ = "fj"
		FO = "fo"
		FR = "fr"
		FY = "fy"
		GA = "ga"
		GD = "gd"
		GL = "gl"
		GN = "gn"
		GU = "gu"
		GV = "gv"
		HA = "ha"
		HE = "he"
		HI = "hi"
		HR = "hr"
		HU = "hu"
		HY = "hy"
		IA = "ia"
		ID = "id"
		IE = "ie"
		IK = "ik"
		IN = "in"
		IS = "is"
		IT = "it"
		IU = "iu"
		IW = "iw"
		JA = "ja"
		JI = "ji"
		JV = "jv"
		KA = "ka"
		KK = "kk"
		KL = "kl"
		KM = "km"
		KN = "kn"
		KO = "ko"
		KS = "ks"
		KU = "ku"
		KY = "ky"
		LA = "la"
		LI = "li"
		LN = "ln"
		LO = "lo"
		LT = "lt"
		LV = "lv"
		MG = "mg"
		MI = "mi"
		MK = "mk"
		ML = "ml"
		MN = "mn"
		MO = "mo"
		MR = "mr"
		MS = "ms"
		MT = "mt"
		MU = "multilingual"
		MY = "my"
		NA = "na"
		NE = "ne"
		NL = "nl"
		NO = "no"
		OC = "oc"
		OM = "om"
		OR_ = "or"
		PA = "pa"
		PL = "pl"
		PS = "ps"
		PT = "pt"
		QU = "qu"
		RM = "rm"
		RN = "rn"
		RO = "ro"
		RU = "ru"
		RW = "rw"
		SA = "sa"
		SD = "sd"
		SG = "sg"
		SH = "sh"
		SI = "si"
		SK = "sk"
		SL = "sl"
		SM = "sm"
		SN = "sn"
		SO = "so"
		SQ = "sq"
		SR = "sr"
		SS = "ss"
		ST = "st"
		SU = "su"
		SV = "sv"
		SW = "sw"
		TA = "ta"
		TE = "te"
		TG = "tg"
		TH = "th"
		TI = "ti"
		TK = "tk"
		TL = "tl"
		TN = "tn"
		TO = "to"
		TR = "tr"
		TS = "ts"
		TT = "tt"
		TW = "tw"
		UG = "ug"
		UK = "uk"
		UR = "ur"
		UZ = "uz"
		VI = "vi"
		VO = "vo"
		WO = "wo"
		XH = "xh"
		YI = "yi"
		YO = "yo"
		ZH = "zh"
		ZU = "zu"
	end

	class KalturaLiveAssetOrderBy
		CREATED_AT_ASC = "+createdAt"
		DELETED_AT_ASC = "+deletedAt"
		SIZE_ASC = "+size"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		DELETED_AT_DESC = "-deletedAt"
		SIZE_DESC = "-size"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaLiveChannelCompareAttribute
		ACCESS_CONTROL_ID = "accessControlId"
		CREATED_AT = "createdAt"
		END_DATE = "endDate"
		LAST_PLAYED_AT = "lastPlayedAt"
		MEDIA_DATE = "mediaDate"
		MEDIA_TYPE = "mediaType"
		MODERATION_COUNT = "moderationCount"
		MODERATION_STATUS = "moderationStatus"
		MS_DURATION = "msDuration"
		PARTNER_ID = "partnerId"
		PARTNER_SORT_VALUE = "partnerSortValue"
		PLAYS = "plays"
		RANK = "rank"
		REPLACEMENT_STATUS = "replacementStatus"
		START_DATE = "startDate"
		STATUS = "status"
		TOTAL_RANK = "totalRank"
		TYPE = "type"
		UPDATED_AT = "updatedAt"
		VIEWS = "views"
	end

	class KalturaLiveChannelMatchAttribute
		ADMIN_TAGS = "adminTags"
		CATEGORIES_IDS = "categoriesIds"
		CREATOR_ID = "creatorId"
		DESCRIPTION = "description"
		DURATION_TYPE = "durationType"
		FLAVOR_PARAMS_IDS = "flavorParamsIds"
		GROUP_ID = "groupId"
		ID = "id"
		NAME = "name"
		REFERENCE_ID = "referenceId"
		REPLACED_ENTRY_ID = "replacedEntryId"
		REPLACING_ENTRY_ID = "replacingEntryId"
		SEARCH_TEXT = "searchText"
		TAGS = "tags"
		USER_ID = "userId"
	end

	class KalturaLiveChannelOrderBy
		CREATED_AT_ASC = "+createdAt"
		DURATION_ASC = "+duration"
		END_DATE_ASC = "+endDate"
		FIRST_BROADCAST_ASC = "+firstBroadcast"
		LAST_BROADCAST_ASC = "+lastBroadcast"
		LAST_PLAYED_AT_ASC = "+lastPlayedAt"
		MEDIA_TYPE_ASC = "+mediaType"
		MODERATION_COUNT_ASC = "+moderationCount"
		NAME_ASC = "+name"
		PARTNER_SORT_VALUE_ASC = "+partnerSortValue"
		PLAYS_ASC = "+plays"
		RANK_ASC = "+rank"
		RECENT_ASC = "+recent"
		START_DATE_ASC = "+startDate"
		TOTAL_RANK_ASC = "+totalRank"
		UPDATED_AT_ASC = "+updatedAt"
		VIEWS_ASC = "+views"
		WEIGHT_ASC = "+weight"
		CREATED_AT_DESC = "-createdAt"
		DURATION_DESC = "-duration"
		END_DATE_DESC = "-endDate"
		FIRST_BROADCAST_DESC = "-firstBroadcast"
		LAST_BROADCAST_DESC = "-lastBroadcast"
		LAST_PLAYED_AT_DESC = "-lastPlayedAt"
		MEDIA_TYPE_DESC = "-mediaType"
		MODERATION_COUNT_DESC = "-moderationCount"
		NAME_DESC = "-name"
		PARTNER_SORT_VALUE_DESC = "-partnerSortValue"
		PLAYS_DESC = "-plays"
		RANK_DESC = "-rank"
		RECENT_DESC = "-recent"
		START_DATE_DESC = "-startDate"
		TOTAL_RANK_DESC = "-totalRank"
		UPDATED_AT_DESC = "-updatedAt"
		VIEWS_DESC = "-views"
		WEIGHT_DESC = "-weight"
	end

	class KalturaLiveChannelSegmentOrderBy
		CREATED_AT_ASC = "+createdAt"
		START_TIME_ASC = "+startTime"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		START_TIME_DESC = "-startTime"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaLiveChannelSegmentStatus
		ACTIVE = "2"
		DELETED = "3"
	end

	class KalturaLiveChannelSegmentTriggerType
		CHANNEL_RELATIVE = "1"
		ABSOLUTE_TIME = "2"
		SEGMENT_START_RELATIVE = "3"
		SEGMENT_END_RELATIVE = "4"
	end

	class KalturaLiveChannelSegmentType
		VIDEO_AND_AUDIO = "1"
	end

	class KalturaLiveEntryCompareAttribute
		ACCESS_CONTROL_ID = "accessControlId"
		CREATED_AT = "createdAt"
		END_DATE = "endDate"
		LAST_PLAYED_AT = "lastPlayedAt"
		MEDIA_DATE = "mediaDate"
		MEDIA_TYPE = "mediaType"
		MODERATION_COUNT = "moderationCount"
		MODERATION_STATUS = "moderationStatus"
		MS_DURATION = "msDuration"
		PARTNER_ID = "partnerId"
		PARTNER_SORT_VALUE = "partnerSortValue"
		PLAYS = "plays"
		RANK = "rank"
		REPLACEMENT_STATUS = "replacementStatus"
		START_DATE = "startDate"
		STATUS = "status"
		TOTAL_RANK = "totalRank"
		TYPE = "type"
		UPDATED_AT = "updatedAt"
		VIEWS = "views"
	end

	class KalturaLiveEntryMatchAttribute
		ADMIN_TAGS = "adminTags"
		CATEGORIES_IDS = "categoriesIds"
		CREATOR_ID = "creatorId"
		DESCRIPTION = "description"
		DURATION_TYPE = "durationType"
		FLAVOR_PARAMS_IDS = "flavorParamsIds"
		GROUP_ID = "groupId"
		ID = "id"
		NAME = "name"
		REFERENCE_ID = "referenceId"
		REPLACED_ENTRY_ID = "replacedEntryId"
		REPLACING_ENTRY_ID = "replacingEntryId"
		SEARCH_TEXT = "searchText"
		TAGS = "tags"
		USER_ID = "userId"
	end

	class KalturaLiveEntryOrderBy
		CREATED_AT_ASC = "+createdAt"
		DURATION_ASC = "+duration"
		END_DATE_ASC = "+endDate"
		FIRST_BROADCAST_ASC = "+firstBroadcast"
		LAST_BROADCAST_ASC = "+lastBroadcast"
		LAST_PLAYED_AT_ASC = "+lastPlayedAt"
		MEDIA_TYPE_ASC = "+mediaType"
		MODERATION_COUNT_ASC = "+moderationCount"
		NAME_ASC = "+name"
		PARTNER_SORT_VALUE_ASC = "+partnerSortValue"
		PLAYS_ASC = "+plays"
		RANK_ASC = "+rank"
		RECENT_ASC = "+recent"
		START_DATE_ASC = "+startDate"
		TOTAL_RANK_ASC = "+totalRank"
		UPDATED_AT_ASC = "+updatedAt"
		VIEWS_ASC = "+views"
		WEIGHT_ASC = "+weight"
		CREATED_AT_DESC = "-createdAt"
		DURATION_DESC = "-duration"
		END_DATE_DESC = "-endDate"
		FIRST_BROADCAST_DESC = "-firstBroadcast"
		LAST_BROADCAST_DESC = "-lastBroadcast"
		LAST_PLAYED_AT_DESC = "-lastPlayedAt"
		MEDIA_TYPE_DESC = "-mediaType"
		MODERATION_COUNT_DESC = "-moderationCount"
		NAME_DESC = "-name"
		PARTNER_SORT_VALUE_DESC = "-partnerSortValue"
		PLAYS_DESC = "-plays"
		RANK_DESC = "-rank"
		RECENT_DESC = "-recent"
		START_DATE_DESC = "-startDate"
		TOTAL_RANK_DESC = "-totalRank"
		UPDATED_AT_DESC = "-updatedAt"
		VIEWS_DESC = "-views"
		WEIGHT_DESC = "-weight"
	end

	class KalturaLiveParamsOrderBy
	end

	class KalturaLiveReportOrderBy
		NAME_ASC = "+name"
		AUDIENCE_DESC = "-audience"
		EVENT_TIME_DESC = "-eventTime"
		PLAYS_DESC = "-plays"
	end

	class KalturaLiveReportType
		ENTRY_GEO_TIME_LINE = "ENTRY_GEO_TIME_LINE"
		ENTRY_SYNDICATION_TOTAL = "ENTRY_SYNDICATION_TOTAL"
		ENTRY_TIME_LINE = "ENTRY_TIME_LINE"
		ENTRY_TOTAL = "ENTRY_TOTAL"
		PARTNER_TOTAL = "PARTNER_TOTAL"
	end

	class KalturaLiveStreamAdminEntryCompareAttribute
		ACCESS_CONTROL_ID = "accessControlId"
		CREATED_AT = "createdAt"
		END_DATE = "endDate"
		LAST_PLAYED_AT = "lastPlayedAt"
		MEDIA_DATE = "mediaDate"
		MEDIA_TYPE = "mediaType"
		MODERATION_COUNT = "moderationCount"
		MODERATION_STATUS = "moderationStatus"
		MS_DURATION = "msDuration"
		PARTNER_ID = "partnerId"
		PARTNER_SORT_VALUE = "partnerSortValue"
		PLAYS = "plays"
		RANK = "rank"
		REPLACEMENT_STATUS = "replacementStatus"
		START_DATE = "startDate"
		STATUS = "status"
		TOTAL_RANK = "totalRank"
		TYPE = "type"
		UPDATED_AT = "updatedAt"
		VIEWS = "views"
	end

	class KalturaLiveStreamAdminEntryMatchAttribute
		ADMIN_TAGS = "adminTags"
		CATEGORIES_IDS = "categoriesIds"
		CREATOR_ID = "creatorId"
		DESCRIPTION = "description"
		DURATION_TYPE = "durationType"
		FLAVOR_PARAMS_IDS = "flavorParamsIds"
		GROUP_ID = "groupId"
		ID = "id"
		NAME = "name"
		REFERENCE_ID = "referenceId"
		REPLACED_ENTRY_ID = "replacedEntryId"
		REPLACING_ENTRY_ID = "replacingEntryId"
		SEARCH_TEXT = "searchText"
		TAGS = "tags"
		USER_ID = "userId"
	end

	class KalturaLiveStreamAdminEntryOrderBy
		CREATED_AT_ASC = "+createdAt"
		DURATION_ASC = "+duration"
		END_DATE_ASC = "+endDate"
		FIRST_BROADCAST_ASC = "+firstBroadcast"
		LAST_BROADCAST_ASC = "+lastBroadcast"
		LAST_PLAYED_AT_ASC = "+lastPlayedAt"
		MEDIA_TYPE_ASC = "+mediaType"
		MODERATION_COUNT_ASC = "+moderationCount"
		NAME_ASC = "+name"
		PARTNER_SORT_VALUE_ASC = "+partnerSortValue"
		PLAYS_ASC = "+plays"
		RANK_ASC = "+rank"
		RECENT_ASC = "+recent"
		START_DATE_ASC = "+startDate"
		TOTAL_RANK_ASC = "+totalRank"
		UPDATED_AT_ASC = "+updatedAt"
		VIEWS_ASC = "+views"
		WEIGHT_ASC = "+weight"
		CREATED_AT_DESC = "-createdAt"
		DURATION_DESC = "-duration"
		END_DATE_DESC = "-endDate"
		FIRST_BROADCAST_DESC = "-firstBroadcast"
		LAST_BROADCAST_DESC = "-lastBroadcast"
		LAST_PLAYED_AT_DESC = "-lastPlayedAt"
		MEDIA_TYPE_DESC = "-mediaType"
		MODERATION_COUNT_DESC = "-moderationCount"
		NAME_DESC = "-name"
		PARTNER_SORT_VALUE_DESC = "-partnerSortValue"
		PLAYS_DESC = "-plays"
		RANK_DESC = "-rank"
		RECENT_DESC = "-recent"
		START_DATE_DESC = "-startDate"
		TOTAL_RANK_DESC = "-totalRank"
		UPDATED_AT_DESC = "-updatedAt"
		VIEWS_DESC = "-views"
		WEIGHT_DESC = "-weight"
	end

	class KalturaLiveStreamEntryCompareAttribute
		ACCESS_CONTROL_ID = "accessControlId"
		CREATED_AT = "createdAt"
		END_DATE = "endDate"
		LAST_PLAYED_AT = "lastPlayedAt"
		MEDIA_DATE = "mediaDate"
		MEDIA_TYPE = "mediaType"
		MODERATION_COUNT = "moderationCount"
		MODERATION_STATUS = "moderationStatus"
		MS_DURATION = "msDuration"
		PARTNER_ID = "partnerId"
		PARTNER_SORT_VALUE = "partnerSortValue"
		PLAYS = "plays"
		RANK = "rank"
		REPLACEMENT_STATUS = "replacementStatus"
		START_DATE = "startDate"
		STATUS = "status"
		TOTAL_RANK = "totalRank"
		TYPE = "type"
		UPDATED_AT = "updatedAt"
		VIEWS = "views"
	end

	class KalturaLiveStreamEntryMatchAttribute
		ADMIN_TAGS = "adminTags"
		CATEGORIES_IDS = "categoriesIds"
		CREATOR_ID = "creatorId"
		DESCRIPTION = "description"
		DURATION_TYPE = "durationType"
		FLAVOR_PARAMS_IDS = "flavorParamsIds"
		GROUP_ID = "groupId"
		ID = "id"
		NAME = "name"
		REFERENCE_ID = "referenceId"
		REPLACED_ENTRY_ID = "replacedEntryId"
		REPLACING_ENTRY_ID = "replacingEntryId"
		SEARCH_TEXT = "searchText"
		TAGS = "tags"
		USER_ID = "userId"
	end

	class KalturaLiveStreamEntryOrderBy
		CREATED_AT_ASC = "+createdAt"
		DURATION_ASC = "+duration"
		END_DATE_ASC = "+endDate"
		FIRST_BROADCAST_ASC = "+firstBroadcast"
		LAST_BROADCAST_ASC = "+lastBroadcast"
		LAST_PLAYED_AT_ASC = "+lastPlayedAt"
		MEDIA_TYPE_ASC = "+mediaType"
		MODERATION_COUNT_ASC = "+moderationCount"
		NAME_ASC = "+name"
		PARTNER_SORT_VALUE_ASC = "+partnerSortValue"
		PLAYS_ASC = "+plays"
		RANK_ASC = "+rank"
		RECENT_ASC = "+recent"
		START_DATE_ASC = "+startDate"
		TOTAL_RANK_ASC = "+totalRank"
		UPDATED_AT_ASC = "+updatedAt"
		VIEWS_ASC = "+views"
		WEIGHT_ASC = "+weight"
		CREATED_AT_DESC = "-createdAt"
		DURATION_DESC = "-duration"
		END_DATE_DESC = "-endDate"
		FIRST_BROADCAST_DESC = "-firstBroadcast"
		LAST_BROADCAST_DESC = "-lastBroadcast"
		LAST_PLAYED_AT_DESC = "-lastPlayedAt"
		MEDIA_TYPE_DESC = "-mediaType"
		MODERATION_COUNT_DESC = "-moderationCount"
		NAME_DESC = "-name"
		PARTNER_SORT_VALUE_DESC = "-partnerSortValue"
		PLAYS_DESC = "-plays"
		RANK_DESC = "-rank"
		RECENT_DESC = "-recent"
		START_DATE_DESC = "-startDate"
		TOTAL_RANK_DESC = "-totalRank"
		UPDATED_AT_DESC = "-updatedAt"
		VIEWS_DESC = "-views"
		WEIGHT_DESC = "-weight"
	end

	class KalturaMailType
		MAIL_TYPE_KALTURA_NEWSLETTER = "10"
		MAIL_TYPE_ADDED_TO_FAVORITES = "11"
		MAIL_TYPE_ADDED_TO_CLIP_FAVORITES = "12"
		MAIL_TYPE_NEW_COMMENT_IN_PROFILE = "13"
		MAIL_TYPE_CLIP_ADDED_YOUR_KALTURA = "20"
		MAIL_TYPE_VIDEO_ADDED = "21"
		MAIL_TYPE_ROUGHCUT_CREATED = "22"
		MAIL_TYPE_ADDED_KALTURA_TO_YOUR_FAVORITES = "23"
		MAIL_TYPE_NEW_COMMENT_IN_KALTURA = "24"
		MAIL_TYPE_CLIP_ADDED = "30"
		MAIL_TYPE_VIDEO_CREATED = "31"
		MAIL_TYPE_ADDED_KALTURA_TO_HIS_FAVORITES = "32"
		MAIL_TYPE_NEW_COMMENT_IN_KALTURA_YOU_CONTRIBUTED = "33"
		MAIL_TYPE_CLIP_CONTRIBUTED = "40"
		MAIL_TYPE_ROUGHCUT_CREATED_SUBSCRIBED = "41"
		MAIL_TYPE_ADDED_KALTURA_TO_HIS_FAVORITES_SUBSCRIBED = "42"
		MAIL_TYPE_NEW_COMMENT_IN_KALTURA_YOU_SUBSCRIBED = "43"
		MAIL_TYPE_REGISTER_CONFIRM = "50"
		MAIL_TYPE_PASSWORD_RESET = "51"
		MAIL_TYPE_LOGIN_MAIL_RESET = "52"
		MAIL_TYPE_REGISTER_CONFIRM_VIDEO_SERVICE = "54"
		MAIL_TYPE_VIDEO_READY = "60"
		MAIL_TYPE_VIDEO_IS_READY = "62"
		MAIL_TYPE_BULK_DOWNLOAD_READY = "63"
		MAIL_TYPE_BULKUPLOAD_FINISHED = "64"
		MAIL_TYPE_BULKUPLOAD_FAILED = "65"
		MAIL_TYPE_BULKUPLOAD_ABORTED = "66"
		MAIL_TYPE_NOTIFY_ERR = "70"
		MAIL_TYPE_ACCOUNT_UPGRADE_CONFIRM = "80"
		MAIL_TYPE_VIDEO_SERVICE_NOTICE = "81"
		MAIL_TYPE_VIDEO_SERVICE_NOTICE_LIMIT_REACHED = "82"
		MAIL_TYPE_VIDEO_SERVICE_NOTICE_ACCOUNT_LOCKED = "83"
		MAIL_TYPE_VIDEO_SERVICE_NOTICE_ACCOUNT_DELETED = "84"
		MAIL_TYPE_VIDEO_SERVICE_NOTICE_UPGRADE_OFFER = "85"
		MAIL_TYPE_ACCOUNT_REACTIVE_CONFIRM = "86"
		MAIL_TYPE_SYSTEM_USER_RESET_PASSWORD = "110"
		MAIL_TYPE_SYSTEM_USER_RESET_PASSWORD_SUCCESS = "111"
		MAIL_TYPE_SYSTEM_USER_NEW_PASSWORD = "112"
		MAIL_TYPE_SYSTEM_USER_CREDENTIALS_SAVED = "113"
		MAIL_TYPE_LIVE_REPORT_EXPORT_SUCCESS = "130"
		MAIL_TYPE_LIVE_REPORT_EXPORT_FAILURE = "131"
		MAIL_TYPE_LIVE_REPORT_EXPORT_ABORT = "132"
		MAIL_TYPE_USERS_CSV = "133"
	end

	class KalturaMatchConditionType
		MATCH_ANY = "1"
		MATCH_ALL = "2"
	end

	class KalturaMediaEntryCompareAttribute
		ACCESS_CONTROL_ID = "accessControlId"
		CREATED_AT = "createdAt"
		END_DATE = "endDate"
		LAST_PLAYED_AT = "lastPlayedAt"
		MEDIA_DATE = "mediaDate"
		MEDIA_TYPE = "mediaType"
		MODERATION_COUNT = "moderationCount"
		MODERATION_STATUS = "moderationStatus"
		MS_DURATION = "msDuration"
		PARTNER_ID = "partnerId"
		PARTNER_SORT_VALUE = "partnerSortValue"
		PLAYS = "plays"
		RANK = "rank"
		REPLACEMENT_STATUS = "replacementStatus"
		START_DATE = "startDate"
		STATUS = "status"
		TOTAL_RANK = "totalRank"
		TYPE = "type"
		UPDATED_AT = "updatedAt"
		VIEWS = "views"
	end

	class KalturaMediaEntryMatchAttribute
		ADMIN_TAGS = "adminTags"
		CATEGORIES_IDS = "categoriesIds"
		CREATOR_ID = "creatorId"
		DESCRIPTION = "description"
		DURATION_TYPE = "durationType"
		FLAVOR_PARAMS_IDS = "flavorParamsIds"
		GROUP_ID = "groupId"
		ID = "id"
		NAME = "name"
		REFERENCE_ID = "referenceId"
		REPLACED_ENTRY_ID = "replacedEntryId"
		REPLACING_ENTRY_ID = "replacingEntryId"
		SEARCH_TEXT = "searchText"
		TAGS = "tags"
		USER_ID = "userId"
	end

	class KalturaMediaEntryOrderBy
		CREATED_AT_ASC = "+createdAt"
		DURATION_ASC = "+duration"
		END_DATE_ASC = "+endDate"
		LAST_PLAYED_AT_ASC = "+lastPlayedAt"
		MEDIA_TYPE_ASC = "+mediaType"
		MODERATION_COUNT_ASC = "+moderationCount"
		NAME_ASC = "+name"
		PARTNER_SORT_VALUE_ASC = "+partnerSortValue"
		PLAYS_ASC = "+plays"
		RANK_ASC = "+rank"
		RECENT_ASC = "+recent"
		START_DATE_ASC = "+startDate"
		TOTAL_RANK_ASC = "+totalRank"
		UPDATED_AT_ASC = "+updatedAt"
		VIEWS_ASC = "+views"
		WEIGHT_ASC = "+weight"
		CREATED_AT_DESC = "-createdAt"
		DURATION_DESC = "-duration"
		END_DATE_DESC = "-endDate"
		LAST_PLAYED_AT_DESC = "-lastPlayedAt"
		MEDIA_TYPE_DESC = "-mediaType"
		MODERATION_COUNT_DESC = "-moderationCount"
		NAME_DESC = "-name"
		PARTNER_SORT_VALUE_DESC = "-partnerSortValue"
		PLAYS_DESC = "-plays"
		RANK_DESC = "-rank"
		RECENT_DESC = "-recent"
		START_DATE_DESC = "-startDate"
		TOTAL_RANK_DESC = "-totalRank"
		UPDATED_AT_DESC = "-updatedAt"
		VIEWS_DESC = "-views"
		WEIGHT_DESC = "-weight"
	end

	class KalturaMediaFlavorParamsOrderBy
	end

	class KalturaMediaFlavorParamsOutputOrderBy
	end

	class KalturaMediaInfoOrderBy
	end

	class KalturaMediaParserType
		MEDIAINFO = "0"
		FFMPEG = "1"
	end

	class KalturaMediaServerNodeOrderBy
		CREATED_AT_ASC = "+createdAt"
		HEARTBEAT_TIME_ASC = "+heartbeatTime"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		HEARTBEAT_TIME_DESC = "-heartbeatTime"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaMixEntryCompareAttribute
		ACCESS_CONTROL_ID = "accessControlId"
		CREATED_AT = "createdAt"
		END_DATE = "endDate"
		LAST_PLAYED_AT = "lastPlayedAt"
		MODERATION_COUNT = "moderationCount"
		MODERATION_STATUS = "moderationStatus"
		MS_DURATION = "msDuration"
		PARTNER_ID = "partnerId"
		PARTNER_SORT_VALUE = "partnerSortValue"
		PLAYS = "plays"
		RANK = "rank"
		REPLACEMENT_STATUS = "replacementStatus"
		START_DATE = "startDate"
		STATUS = "status"
		TOTAL_RANK = "totalRank"
		TYPE = "type"
		UPDATED_AT = "updatedAt"
		VIEWS = "views"
	end

	class KalturaMixEntryMatchAttribute
		ADMIN_TAGS = "adminTags"
		CATEGORIES_IDS = "categoriesIds"
		CREATOR_ID = "creatorId"
		DESCRIPTION = "description"
		DURATION_TYPE = "durationType"
		GROUP_ID = "groupId"
		ID = "id"
		NAME = "name"
		REFERENCE_ID = "referenceId"
		REPLACED_ENTRY_ID = "replacedEntryId"
		REPLACING_ENTRY_ID = "replacingEntryId"
		SEARCH_TEXT = "searchText"
		TAGS = "tags"
		USER_ID = "userId"
	end

	class KalturaMixEntryOrderBy
		CREATED_AT_ASC = "+createdAt"
		DURATION_ASC = "+duration"
		END_DATE_ASC = "+endDate"
		LAST_PLAYED_AT_ASC = "+lastPlayedAt"
		MODERATION_COUNT_ASC = "+moderationCount"
		NAME_ASC = "+name"
		PARTNER_SORT_VALUE_ASC = "+partnerSortValue"
		PLAYS_ASC = "+plays"
		RANK_ASC = "+rank"
		RECENT_ASC = "+recent"
		START_DATE_ASC = "+startDate"
		TOTAL_RANK_ASC = "+totalRank"
		UPDATED_AT_ASC = "+updatedAt"
		VIEWS_ASC = "+views"
		WEIGHT_ASC = "+weight"
		CREATED_AT_DESC = "-createdAt"
		DURATION_DESC = "-duration"
		END_DATE_DESC = "-endDate"
		LAST_PLAYED_AT_DESC = "-lastPlayedAt"
		MODERATION_COUNT_DESC = "-moderationCount"
		NAME_DESC = "-name"
		PARTNER_SORT_VALUE_DESC = "-partnerSortValue"
		PLAYS_DESC = "-plays"
		RANK_DESC = "-rank"
		RECENT_DESC = "-recent"
		START_DATE_DESC = "-startDate"
		TOTAL_RANK_DESC = "-totalRank"
		UPDATED_AT_DESC = "-updatedAt"
		VIEWS_DESC = "-views"
		WEIGHT_DESC = "-weight"
	end

	class KalturaModerationFlagStatus
		PENDING = "1"
		MODERATED = "2"
	end

	class KalturaModerationObjectType
		ENTRY = "2"
		USER = "3"
	end

	class KalturaPartnerOrderBy
		ADMIN_EMAIL_ASC = "+adminEmail"
		ADMIN_NAME_ASC = "+adminName"
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		NAME_ASC = "+name"
		STATUS_ASC = "+status"
		WEBSITE_ASC = "+website"
		ADMIN_EMAIL_DESC = "-adminEmail"
		ADMIN_NAME_DESC = "-adminName"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		NAME_DESC = "-name"
		STATUS_DESC = "-status"
		WEBSITE_DESC = "-website"
	end

	class KalturaPermissionItemOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaPermissionItemType
		API_ACTION_ITEM = "kApiActionPermissionItem"
		API_PARAMETER_ITEM = "kApiParameterPermissionItem"
	end

	class KalturaPermissionOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		NAME_ASC = "+name"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		NAME_DESC = "-name"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaPlayableEntryCompareAttribute
		ACCESS_CONTROL_ID = "accessControlId"
		CREATED_AT = "createdAt"
		END_DATE = "endDate"
		LAST_PLAYED_AT = "lastPlayedAt"
		MODERATION_COUNT = "moderationCount"
		MODERATION_STATUS = "moderationStatus"
		MS_DURATION = "msDuration"
		PARTNER_ID = "partnerId"
		PARTNER_SORT_VALUE = "partnerSortValue"
		PLAYS = "plays"
		RANK = "rank"
		REPLACEMENT_STATUS = "replacementStatus"
		START_DATE = "startDate"
		STATUS = "status"
		TOTAL_RANK = "totalRank"
		TYPE = "type"
		UPDATED_AT = "updatedAt"
		VIEWS = "views"
	end

	class KalturaPlayableEntryMatchAttribute
		ADMIN_TAGS = "adminTags"
		CATEGORIES_IDS = "categoriesIds"
		CREATOR_ID = "creatorId"
		DESCRIPTION = "description"
		DURATION_TYPE = "durationType"
		GROUP_ID = "groupId"
		ID = "id"
		NAME = "name"
		REFERENCE_ID = "referenceId"
		REPLACED_ENTRY_ID = "replacedEntryId"
		REPLACING_ENTRY_ID = "replacingEntryId"
		SEARCH_TEXT = "searchText"
		TAGS = "tags"
		USER_ID = "userId"
	end

	class KalturaPlayableEntryOrderBy
		CREATED_AT_ASC = "+createdAt"
		DURATION_ASC = "+duration"
		END_DATE_ASC = "+endDate"
		LAST_PLAYED_AT_ASC = "+lastPlayedAt"
		MODERATION_COUNT_ASC = "+moderationCount"
		NAME_ASC = "+name"
		PARTNER_SORT_VALUE_ASC = "+partnerSortValue"
		PLAYS_ASC = "+plays"
		RANK_ASC = "+rank"
		RECENT_ASC = "+recent"
		START_DATE_ASC = "+startDate"
		TOTAL_RANK_ASC = "+totalRank"
		UPDATED_AT_ASC = "+updatedAt"
		VIEWS_ASC = "+views"
		WEIGHT_ASC = "+weight"
		CREATED_AT_DESC = "-createdAt"
		DURATION_DESC = "-duration"
		END_DATE_DESC = "-endDate"
		LAST_PLAYED_AT_DESC = "-lastPlayedAt"
		MODERATION_COUNT_DESC = "-moderationCount"
		NAME_DESC = "-name"
		PARTNER_SORT_VALUE_DESC = "-partnerSortValue"
		PLAYS_DESC = "-plays"
		RANK_DESC = "-rank"
		RECENT_DESC = "-recent"
		START_DATE_DESC = "-startDate"
		TOTAL_RANK_DESC = "-totalRank"
		UPDATED_AT_DESC = "-updatedAt"
		VIEWS_DESC = "-views"
		WEIGHT_DESC = "-weight"
	end

	class KalturaPlaybackProtocol
		APPLE_HTTP = "applehttp"
		APPLE_HTTP_TO_MC = "applehttp_to_mc"
		AUTO = "auto"
		AKAMAI_HD = "hdnetwork"
		AKAMAI_HDS = "hdnetworkmanifest"
		HDS = "hds"
		HLS = "hls"
		HTTP = "http"
		MPEG_DASH = "mpegdash"
		MULTICAST_SL = "multicast_silverlight"
		RTMP = "rtmp"
		RTSP = "rtsp"
		SILVER_LIGHT = "sl"
		URL = "url"
	end

	class KalturaPlaylistCompareAttribute
		ACCESS_CONTROL_ID = "accessControlId"
		CREATED_AT = "createdAt"
		END_DATE = "endDate"
		MODERATION_COUNT = "moderationCount"
		MODERATION_STATUS = "moderationStatus"
		PARTNER_ID = "partnerId"
		PARTNER_SORT_VALUE = "partnerSortValue"
		RANK = "rank"
		REPLACEMENT_STATUS = "replacementStatus"
		START_DATE = "startDate"
		STATUS = "status"
		TOTAL_RANK = "totalRank"
		TYPE = "type"
		UPDATED_AT = "updatedAt"
	end

	class KalturaPlaylistMatchAttribute
		ADMIN_TAGS = "adminTags"
		CATEGORIES_IDS = "categoriesIds"
		CREATOR_ID = "creatorId"
		DESCRIPTION = "description"
		GROUP_ID = "groupId"
		ID = "id"
		NAME = "name"
		REFERENCE_ID = "referenceId"
		REPLACED_ENTRY_ID = "replacedEntryId"
		REPLACING_ENTRY_ID = "replacingEntryId"
		SEARCH_TEXT = "searchText"
		TAGS = "tags"
		USER_ID = "userId"
	end

	class KalturaPlaylistOrderBy
		CREATED_AT_ASC = "+createdAt"
		END_DATE_ASC = "+endDate"
		MODERATION_COUNT_ASC = "+moderationCount"
		NAME_ASC = "+name"
		PARTNER_SORT_VALUE_ASC = "+partnerSortValue"
		RANK_ASC = "+rank"
		RECENT_ASC = "+recent"
		START_DATE_ASC = "+startDate"
		TOTAL_RANK_ASC = "+totalRank"
		UPDATED_AT_ASC = "+updatedAt"
		WEIGHT_ASC = "+weight"
		CREATED_AT_DESC = "-createdAt"
		END_DATE_DESC = "-endDate"
		MODERATION_COUNT_DESC = "-moderationCount"
		NAME_DESC = "-name"
		PARTNER_SORT_VALUE_DESC = "-partnerSortValue"
		RANK_DESC = "-rank"
		RECENT_DESC = "-recent"
		START_DATE_DESC = "-startDate"
		TOTAL_RANK_DESC = "-totalRank"
		UPDATED_AT_DESC = "-updatedAt"
		WEIGHT_DESC = "-weight"
	end

	class KalturaQuizUserEntryOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaReportInterval
		DAYS = "days"
		MONTHS = "months"
	end

	class KalturaReportOrderBy
		CREATED_AT_ASC = "+createdAt"
		CREATED_AT_DESC = "-createdAt"
	end

	class KalturaReportType
		QUIZ = "quiz.QUIZ"
		QUIZ_AGGREGATE_BY_QUESTION = "quiz.QUIZ_AGGREGATE_BY_QUESTION"
		QUIZ_USER_AGGREGATE_BY_QUESTION = "quiz.QUIZ_USER_AGGREGATE_BY_QUESTION"
		QUIZ_USER_PERCENTAGE = "quiz.QUIZ_USER_PERCENTAGE"
		TOP_CONTENT = "1"
		CONTENT_DROPOFF = "2"
		CONTENT_INTERACTIONS = "3"
		MAP_OVERLAY = "4"
		TOP_CONTRIBUTORS = "5"
		TOP_SYNDICATION = "6"
		CONTENT_CONTRIBUTIONS = "7"
		USER_ENGAGEMENT = "11"
		SPECIFIC_USER_ENGAGEMENT = "12"
		USER_TOP_CONTENT = "13"
		USER_CONTENT_DROPOFF = "14"
		USER_CONTENT_INTERACTIONS = "15"
		APPLICATIONS = "16"
		USER_USAGE = "17"
		SPECIFIC_USER_USAGE = "18"
		VAR_USAGE = "19"
		TOP_CREATORS = "20"
		PLATFORMS = "21"
		OPERATING_SYSTEM = "22"
		BROWSERS = "23"
		LIVE = "24"
		TOP_PLAYBACK_CONTEXT = "25"
		VPAAS_USAGE = "26"
		ENTRY_USAGE = "27"
		PARTNER_USAGE = "201"
	end

	class KalturaResponseProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaRuleActionType
		DRM_POLICY = "drm.DRM_POLICY"
		BLOCK = "1"
		PREVIEW = "2"
		LIMIT_FLAVORS = "3"
		ADD_TO_STORAGE = "4"
		LIMIT_DELIVERY_PROFILES = "5"
		SERVE_FROM_REMOTE_SERVER = "6"
		REQUEST_HOST_REGEX = "7"
		LIMIT_THUMBNAIL_CAPTURE = "8"
	end

	class KalturaSchemaType
		BULK_UPLOAD_RESULT_XML = "bulkUploadXml.bulkUploadResultXML"
		BULK_UPLOAD_XML = "bulkUploadXml.bulkUploadXML"
		INGEST_API = "cuePoint.ingestAPI"
		SERVE_API = "cuePoint.serveAPI"
		DROP_FOLDER_XML = "dropFolderXmlBulkUpload.dropFolderXml"
		SYNDICATION = "syndication"
	end

	class KalturaSearchConditionComparison
		EQUAL = "1"
		GREATER_THAN = "2"
		GREATER_THAN_OR_EQUAL = "3"
		LESS_THAN = "4"
		LESS_THAN_OR_EQUAL = "5"
		NOT_EQUAL = "6"
	end

	class KalturaServerNodeOrderBy
		CREATED_AT_ASC = "+createdAt"
		HEARTBEAT_TIME_ASC = "+heartbeatTime"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		HEARTBEAT_TIME_DESC = "-heartbeatTime"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaServerNodeType
		WOWZA_MEDIA_SERVER = "wowza.WOWZA_MEDIA_SERVER"
		EDGE = "1"
	end

	class KalturaSourceType
		LIMELIGHT_LIVE = "limeLight.LIVE_STREAM"
		VELOCIX_LIVE = "velocix.VELOCIX_LIVE"
		FILE = "1"
		WEBCAM = "2"
		URL = "5"
		SEARCH_PROVIDER = "6"
		AKAMAI_LIVE = "29"
		MANUAL_LIVE_STREAM = "30"
		AKAMAI_UNIVERSAL_LIVE = "31"
		LIVE_STREAM = "32"
		LIVE_CHANNEL = "33"
		RECORDED_LIVE = "34"
		CLIP = "35"
		KALTURA_RECORDED_LIVE = "36"
		LECTURE_CAPTURE = "37"
		LIVE_STREAM_ONTEXTDATA_CAPTIONS = "42"
	end

	class KalturaStorageProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaStorageProfileProtocol
		KONTIKI = "kontiki.KONTIKI"
		KALTURA_DC = "0"
		FTP = "1"
		SCP = "2"
		SFTP = "3"
		S3 = "6"
		LOCAL = "7"
	end

	class KalturaSyndicationFeedEntriesOrderBy
		CREATED_AT_DESC = "-createdAt"
		RECENT = "recent"
	end

	class KalturaTaggedObjectType
		ENTRY = "1"
		CATEGORY = "2"
	end

	class KalturaThumbAssetOrderBy
		CREATED_AT_ASC = "+createdAt"
		DELETED_AT_ASC = "+deletedAt"
		SIZE_ASC = "+size"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		DELETED_AT_DESC = "-deletedAt"
		SIZE_DESC = "-size"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaThumbParamsOrderBy
	end

	class KalturaThumbParamsOutputOrderBy
	end

	class KalturaTubeMogulSyndicationFeedCategories
		ANIMALS_AND_PETS = "Animals &amp; Pets"
		ARTS_AND_ANIMATION = "Arts &amp; Animation"
		AUTOS = "Autos"
		COMEDY = "Comedy"
		COMMERCIALS_PROMOTIONAL = "Commercials/Promotional"
		ENTERTAINMENT = "Entertainment"
		FAMILY_AND_KIDS = "Family &amp; Kids"
		HOW_TO_INSTRUCTIONAL_DIY = "How To/Instructional/DIY"
		MUSIC = "Music"
		NEWS_AND_BLOGS = "News &amp; Blogs"
		SCIENCE_AND_TECHNOLOGY = "Science &amp; Technology"
		SPORTS = "Sports"
		TRAVEL_AND_PLACES = "Travel &amp; Places"
		VIDEO_GAMES = "Video Games"
		VLOGS_PEOPLE = "Vlogs &amp; People"
	end

	class KalturaTubeMogulSyndicationFeedOrderBy
		CREATED_AT_ASC = "+createdAt"
		NAME_ASC = "+name"
		PLAYLIST_ID_ASC = "+playlistId"
		TYPE_ASC = "+type"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		NAME_DESC = "-name"
		PLAYLIST_ID_DESC = "-playlistId"
		TYPE_DESC = "-type"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaUiConfOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaUploadTokenOrderBy
		CREATED_AT_ASC = "+createdAt"
		CREATED_AT_DESC = "-createdAt"
	end

	class KalturaUserEntryExtendedStatus
		PLAYBACK_COMPLETE = "viewHistory.PLAYBACK_COMPLETE"
		PLAYBACK_STARTED = "viewHistory.PLAYBACK_STARTED"
		VIEWED = "viewHistory.VIEWED"
	end

	class KalturaUserEntryOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaUserEntryStatus
		QUIZ_SUBMITTED = "quiz.3"
		ACTIVE = "1"
		DELETED = "2"
	end

	class KalturaUserEntryType
		QUIZ = "quiz.QUIZ"
		VIEW_HISTORY = "viewHistory.VIEW_HISTORY"
	end

	class KalturaUserLoginDataOrderBy
	end

	class KalturaUserOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
	end

	class KalturaUserRoleOrderBy
		CREATED_AT_ASC = "+createdAt"
		ID_ASC = "+id"
		NAME_ASC = "+name"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		ID_DESC = "-id"
		NAME_DESC = "-name"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaVideoCodec
		NONE = ""
		APCH = "apch"
		APCN = "apcn"
		APCO = "apco"
		APCS = "apcs"
		COPY = "copy"
		DNXHD = "dnxhd"
		DV = "dv"
		FLV = "flv"
		H263 = "h263"
		H264 = "h264"
		H264B = "h264b"
		H264H = "h264h"
		H264M = "h264m"
		H265 = "h265"
		MPEG2 = "mpeg2"
		MPEG4 = "mpeg4"
		THEORA = "theora"
		VP6 = "vp6"
		VP8 = "vp8"
		VP9 = "vp9"
		WMV2 = "wmv2"
		WMV3 = "wmv3"
		WVC1A = "wvc1a"
	end

	class KalturaWidgetOrderBy
		CREATED_AT_ASC = "+createdAt"
		CREATED_AT_DESC = "-createdAt"
	end

	class KalturaYahooSyndicationFeedAdultValues
		ADULT = "adult"
		NON_ADULT = "nonadult"
	end

	class KalturaYahooSyndicationFeedCategories
		ACTION = "Action"
		ANIMALS = "Animals"
		ART_AND_ANIMATION = "Art &amp; Animation"
		COMMERCIALS = "Commercials"
		ENTERTAINMENT_AND_TV = "Entertainment &amp; TV"
		FAMILY = "Family"
		FOOD = "Food"
		FUNNY_VIDEOS = "Funny Videos"
		GAMES = "Games"
		HEALTH_AND_BEAUTY = "Health &amp; Beauty"
		HOW_TO = "How-To"
		MOVIES_AND_SHORTS = "Movies &amp; Shorts"
		MUSIC = "Music"
		NEWS_AND_POLITICS = "News &amp; Politics"
		PEOPLE_AND_VLOGS = "People &amp; Vlogs"
		PRODUCTS_AND_TECH = "Products &amp; Tech."
		SCIENCE_AND_ENVIRONMENT = "Science &amp; Environment"
		SPORTS = "Sports"
		TRANSPORTATION = "Transportation"
		TRAVEL = "Travel"
	end

	class KalturaYahooSyndicationFeedOrderBy
		CREATED_AT_ASC = "+createdAt"
		NAME_ASC = "+name"
		PLAYLIST_ID_ASC = "+playlistId"
		TYPE_ASC = "+type"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		NAME_DESC = "-name"
		PLAYLIST_ID_DESC = "-playlistId"
		TYPE_DESC = "-type"
		UPDATED_AT_DESC = "-updatedAt"
	end


end
