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
require File.dirname(__FILE__) + '/kaltura_content_distribution_client_plugin.rb'

module Kaltura

	class KalturaYouTubeDistributionFeedSpecVersion
		VERSION_1 = "1"
		VERSION_2 = "2"
	end

	class KalturaYouTubeDistributionProfileOrderBy
		CREATED_AT_ASC = "+createdAt"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaYouTubeDistributionProviderOrderBy
	end

	class KalturaYouTubeDistributionProvider < KalturaDistributionProvider


		def from_xml(xml_element)
			super
		end

	end

	class KalturaYouTubeDistributionJobProviderData < KalturaConfigurableDistributionJobProviderData
		attr_accessor :video_asset_file_path
		attr_accessor :thumb_asset_file_path
		attr_accessor :caption_asset_ids
		attr_accessor :sftp_directory
		attr_accessor :sftp_metadata_filename
		attr_accessor :current_playlists
		attr_accessor :new_playlists
		attr_accessor :submit_xml
		attr_accessor :update_xml
		attr_accessor :delete_xml
		attr_accessor :google_client_id
		attr_accessor :google_client_secret
		attr_accessor :google_token_data


		def from_xml(xml_element)
			super
			if xml_element.elements['videoAssetFilePath'] != nil
				self.video_asset_file_path = xml_element.elements['videoAssetFilePath'].text
			end
			if xml_element.elements['thumbAssetFilePath'] != nil
				self.thumb_asset_file_path = xml_element.elements['thumbAssetFilePath'].text
			end
			if xml_element.elements['captionAssetIds'] != nil
				self.caption_asset_ids = xml_element.elements['captionAssetIds'].text
			end
			if xml_element.elements['sftpDirectory'] != nil
				self.sftp_directory = xml_element.elements['sftpDirectory'].text
			end
			if xml_element.elements['sftpMetadataFilename'] != nil
				self.sftp_metadata_filename = xml_element.elements['sftpMetadataFilename'].text
			end
			if xml_element.elements['currentPlaylists'] != nil
				self.current_playlists = xml_element.elements['currentPlaylists'].text
			end
			if xml_element.elements['newPlaylists'] != nil
				self.new_playlists = xml_element.elements['newPlaylists'].text
			end
			if xml_element.elements['submitXml'] != nil
				self.submit_xml = xml_element.elements['submitXml'].text
			end
			if xml_element.elements['updateXml'] != nil
				self.update_xml = xml_element.elements['updateXml'].text
			end
			if xml_element.elements['deleteXml'] != nil
				self.delete_xml = xml_element.elements['deleteXml'].text
			end
			if xml_element.elements['googleClientId'] != nil
				self.google_client_id = xml_element.elements['googleClientId'].text
			end
			if xml_element.elements['googleClientSecret'] != nil
				self.google_client_secret = xml_element.elements['googleClientSecret'].text
			end
			if xml_element.elements['googleTokenData'] != nil
				self.google_token_data = xml_element.elements['googleTokenData'].text
			end
		end

	end

	class KalturaYouTubeDistributionProfile < KalturaConfigurableDistributionProfile
		attr_accessor :feed_spec_version
		attr_accessor :username
		attr_accessor :notification_email
		attr_accessor :sftp_host
		attr_accessor :sftp_port
		attr_accessor :sftp_login
		attr_accessor :sftp_public_key
		attr_accessor :sftp_private_key
		attr_accessor :sftp_base_dir
		attr_accessor :owner_name
		attr_accessor :default_category
		attr_accessor :allow_comments
		attr_accessor :allow_embedding
		attr_accessor :allow_ratings
		attr_accessor :allow_responses
		attr_accessor :commercial_policy
		attr_accessor :ugc_policy
		attr_accessor :target
		attr_accessor :ad_server_partner_id
		attr_accessor :enable_ad_server
		attr_accessor :allow_pre_roll_ads
		attr_accessor :allow_post_roll_ads
		attr_accessor :strict
		attr_accessor :override_manual_edits
		attr_accessor :urgent_reference
		attr_accessor :allow_syndication
		attr_accessor :hide_view_count
		attr_accessor :allow_adsense_for_video
		attr_accessor :allow_invideo
		attr_accessor :allow_mid_roll_ads
		attr_accessor :instream_standard
		attr_accessor :instream_trueview
		attr_accessor :claim_type
		attr_accessor :block_outside_ownership
		attr_accessor :caption_autosync
		attr_accessor :delete_reference
		attr_accessor :release_claims
		attr_accessor :api_authorize_url

		def sftp_port=(val)
			@sftp_port = val.to_i
		end
		def enable_ad_server=(val)
			@enable_ad_server = to_b(val)
		end
		def allow_pre_roll_ads=(val)
			@allow_pre_roll_ads = to_b(val)
		end
		def allow_post_roll_ads=(val)
			@allow_post_roll_ads = to_b(val)
		end
		def allow_mid_roll_ads=(val)
			@allow_mid_roll_ads = to_b(val)
		end
		def delete_reference=(val)
			@delete_reference = to_b(val)
		end
		def release_claims=(val)
			@release_claims = to_b(val)
		end

		def from_xml(xml_element)
			super
			if xml_element.elements['feedSpecVersion'] != nil
				self.feed_spec_version = xml_element.elements['feedSpecVersion'].text
			end
			if xml_element.elements['username'] != nil
				self.username = xml_element.elements['username'].text
			end
			if xml_element.elements['notificationEmail'] != nil
				self.notification_email = xml_element.elements['notificationEmail'].text
			end
			if xml_element.elements['sftpHost'] != nil
				self.sftp_host = xml_element.elements['sftpHost'].text
			end
			if xml_element.elements['sftpPort'] != nil
				self.sftp_port = xml_element.elements['sftpPort'].text
			end
			if xml_element.elements['sftpLogin'] != nil
				self.sftp_login = xml_element.elements['sftpLogin'].text
			end
			if xml_element.elements['sftpPublicKey'] != nil
				self.sftp_public_key = xml_element.elements['sftpPublicKey'].text
			end
			if xml_element.elements['sftpPrivateKey'] != nil
				self.sftp_private_key = xml_element.elements['sftpPrivateKey'].text
			end
			if xml_element.elements['sftpBaseDir'] != nil
				self.sftp_base_dir = xml_element.elements['sftpBaseDir'].text
			end
			if xml_element.elements['ownerName'] != nil
				self.owner_name = xml_element.elements['ownerName'].text
			end
			if xml_element.elements['defaultCategory'] != nil
				self.default_category = xml_element.elements['defaultCategory'].text
			end
			if xml_element.elements['allowComments'] != nil
				self.allow_comments = xml_element.elements['allowComments'].text
			end
			if xml_element.elements['allowEmbedding'] != nil
				self.allow_embedding = xml_element.elements['allowEmbedding'].text
			end
			if xml_element.elements['allowRatings'] != nil
				self.allow_ratings = xml_element.elements['allowRatings'].text
			end
			if xml_element.elements['allowResponses'] != nil
				self.allow_responses = xml_element.elements['allowResponses'].text
			end
			if xml_element.elements['commercialPolicy'] != nil
				self.commercial_policy = xml_element.elements['commercialPolicy'].text
			end
			if xml_element.elements['ugcPolicy'] != nil
				self.ugc_policy = xml_element.elements['ugcPolicy'].text
			end
			if xml_element.elements['target'] != nil
				self.target = xml_element.elements['target'].text
			end
			if xml_element.elements['adServerPartnerId'] != nil
				self.ad_server_partner_id = xml_element.elements['adServerPartnerId'].text
			end
			if xml_element.elements['enableAdServer'] != nil
				self.enable_ad_server = xml_element.elements['enableAdServer'].text
			end
			if xml_element.elements['allowPreRollAds'] != nil
				self.allow_pre_roll_ads = xml_element.elements['allowPreRollAds'].text
			end
			if xml_element.elements['allowPostRollAds'] != nil
				self.allow_post_roll_ads = xml_element.elements['allowPostRollAds'].text
			end
			if xml_element.elements['strict'] != nil
				self.strict = xml_element.elements['strict'].text
			end
			if xml_element.elements['overrideManualEdits'] != nil
				self.override_manual_edits = xml_element.elements['overrideManualEdits'].text
			end
			if xml_element.elements['urgentReference'] != nil
				self.urgent_reference = xml_element.elements['urgentReference'].text
			end
			if xml_element.elements['allowSyndication'] != nil
				self.allow_syndication = xml_element.elements['allowSyndication'].text
			end
			if xml_element.elements['hideViewCount'] != nil
				self.hide_view_count = xml_element.elements['hideViewCount'].text
			end
			if xml_element.elements['allowAdsenseForVideo'] != nil
				self.allow_adsense_for_video = xml_element.elements['allowAdsenseForVideo'].text
			end
			if xml_element.elements['allowInvideo'] != nil
				self.allow_invideo = xml_element.elements['allowInvideo'].text
			end
			if xml_element.elements['allowMidRollAds'] != nil
				self.allow_mid_roll_ads = xml_element.elements['allowMidRollAds'].text
			end
			if xml_element.elements['instreamStandard'] != nil
				self.instream_standard = xml_element.elements['instreamStandard'].text
			end
			if xml_element.elements['instreamTrueview'] != nil
				self.instream_trueview = xml_element.elements['instreamTrueview'].text
			end
			if xml_element.elements['claimType'] != nil
				self.claim_type = xml_element.elements['claimType'].text
			end
			if xml_element.elements['blockOutsideOwnership'] != nil
				self.block_outside_ownership = xml_element.elements['blockOutsideOwnership'].text
			end
			if xml_element.elements['captionAutosync'] != nil
				self.caption_autosync = xml_element.elements['captionAutosync'].text
			end
			if xml_element.elements['deleteReference'] != nil
				self.delete_reference = xml_element.elements['deleteReference'].text
			end
			if xml_element.elements['releaseClaims'] != nil
				self.release_claims = xml_element.elements['releaseClaims'].text
			end
			if xml_element.elements['apiAuthorizeUrl'] != nil
				self.api_authorize_url = xml_element.elements['apiAuthorizeUrl'].text
			end
		end

	end

	class KalturaYouTubeDistributionProviderBaseFilter < KalturaDistributionProviderFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaYouTubeDistributionProviderFilter < KalturaYouTubeDistributionProviderBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaYouTubeDistributionProfileBaseFilter < KalturaConfigurableDistributionProfileFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaYouTubeDistributionProfileFilter < KalturaYouTubeDistributionProfileBaseFilter


		def from_xml(xml_element)
			super
		end

	end


end
