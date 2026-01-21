/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export const AVMetadataErrorCode1: () => number;

export const AVMetadataSkipIntervals: (time: number) => number;

export const AVMetadataBuilderCreateSuccess: () => number;

export const AVMetadataBuilderCreateInvalidParam: () => number;

export const AVMetadataBuilderDestroyInvalidSuccess: () => number;

export const AVMetadataBuilderDestroyInvalidParam: () => number;

export const AVMetadataBuilderSetAssetIdSuccess: () => number;

export const AVMetadataBuilderSetAssetIdInvalidParam: () => number;

export const AVMetadataBuilderSetTitleSuccess: () => number;

export const AVMetadataBuilderSetTitleInvalidParam: () => number;

export const AVMetadataBuilderSetAuthorSuccess: () => number;

export const AVMetadataBuilderSetAuthorInvalidParam: () => number;

export const AVMetadataBuilderSetAlbumSuccess: () => number;

export const AVMetadataBuilderSetAlbumInvalidParam: () => number;

export const AVMetadataBuilderSetWriterSuccess: () => number;

export const AVMetadataBuilderSetWriterInvalidParam: () => number;

export const AVMetadataBuilderSetComposerSuccess: () => number;

export const AVMetadataBuilderSetComposerInvalidParam: () => number;

export const AVMetadataBuilderSetDurationSuccess: () => number;

export const AVMetadataBuilderSetDurationInvalidParam: () => number;

export const AVMetadataBuilderSetArtistSuccess: () => number;

export const AVMetadataBuilderSetArtistInvalidParam: () => number;

export const AVMetadataBuilderSetSubtitleSuccess: () => number;

export const AVMetadataBuilderSetSubtitleInvalidParam: () => number;

export const AVMetadataBuilderSetDescriptionSuccess: () => number;

export const AVMetadataBuilderSetDescriptionInvalidParam: () => number;

export const AVMetadataBuilderSetLyricSuccess: () => number;

export const AVMetadataBuilderSetLyricInvalidParam: () => number;

export const AVMetadataBuilderSetSkipIntervalsSuccess: (time: number) => number;

export const AVMetadataBuilderSetSkipIntervalsInvalidParam: (time: number) => number;

export const AVMetadataBuilderSetDisplayTagsSuccess: () => number;

export const AVMetadataBuilderSetDisplayTagsInvalidParam: () => number;

export const AVMetadataBuilderSetFilterSuccess: () => number;

export const AVMetadataBuilderSetFilterInvalidParam: () => number;

export const AVMetadataBuilderGenerateAVMetadataSuccess: () => number;

export const AVMetadataBuilderGenerateAVMetadataInvalidParam: () => number;

export const AVMetadataDestroySuccess: () => number;

export const AVMetadataDestroyInvalidParam: () => number;

export const AVMetadataAVSessionType: (type: number) => number;

export const AVMetadataAVSetPlaybackState: (state: number) => number;

export const AVMetadataAVSessionLoopMode: (mode: number) => number;

export const AVMetadataAVSessionRemoteCastEnabled: (enabled: number) => number;

export const AVMetadataAVSessionControlCommand: (command: number) => number;

export const AVSessionCallbackResultFailure: () => number;

export const AVSessionCreateSuccess: () => number;

export const AVSessionCreateInvalidParam: () => number;

export const AVSessionDestroySuccess: () => number;

export const AVSessionDestroyInvalidParam: () => number;

export const AVSessionActivateSuccess: () => number;

export const AVSessionDestroyInvalidParam: () => number;

export const AVSessionDeactivateSuccess: () => number;

export const AVSessionDeactivateInvalidParam: () => number;

export const AVSessionGetSessionTypeSuccess: () => number;

export const AVSessionGetSessionTypeInvalidParam: () => number;

export const AVSessionGetSessionIdSuccess: () => number;

export const AVSessionGetSessionIdInvalidParam: () => number;

export const AVSessionSetPlaybackStateSuccess: () => number;

export const AVSessionSetPlaybackStateInvalidParam: () => number;

export const AVSessionSetAVMetadataSuccess: () => number;

export const AVSessionSetAVMetadataInvalidParam: () => number;

export const AVSessionSetAVMetadataException: () => number;

export const AVSessionSetPlaybackPositionSuccess: () => number;

export const AVSessionSetPlaybackPositionInvalidParam: () => number;

export const AVSessionSetFavoriteSuccess: () => number;

export const AVSessionSetFavoriteInvalidParam: () => number;

export const AVSessionSetLoopModeSuccess: () => number;

export const AVSessionSetLoopModeInvalidParam: () => number;

export const AVSessionSetRemoteCastEnabledSuccess: () => number;

export const AVSessionSetRemoteCastEnabledInvalidParam: () => number;

export const AVSessionRegisterCommandCallbackSuccess: () => number;

export const AVSessionRegisterCommandCallbackInvalidParam: () => number;

export const AVSessionUnregisterCommandCallbackSuccess: () => number;

export const AVSessionUnregisterCommandCallbackInvalidParam: () => number;

export const AVSessionRegisterRewindCallbackSuccess: () => number;

export const AVSessionRegisterRewindCallbackInvalidParam: () => number;

export const AVSessionUnregisterRewindCallbackSuccess: () => number;

export const AVSessionUnregisterRewindCallbackInvalidParam: () => number;

export const AVSessionRegisterSeekCallbackSuccess: () => number;

export const AVSessionRegisterSeekCallbackInvalidParam: () => number;

export const AVSessionUnregisterSeekCallbackSuccess: () => number;

export const AVSessionUnregisterSeekCallbackInvalidParam: () => number;

export const AVSessionRegisterSetLoopModeCallbackSuccess: () => number;

export const AVSessionRegisterSetLoopModeCallbackInvalidParam: () => number;

export const AVSessionUnregisterSetLoopModeCallbackSuccess: () => number;

export const AVSessionUnregisterSetLoopModeCallbackInvalidParam: () => number;

export const AVSessionRegisterToggleFavoriteCallbackSuccess: () => number;

export const AVSessionRegisterToggleFavoriteCallbackInvalidParam: () => number;

export const AVSessionUnregisterToggleFavoriteCallbackSuccess: () => number;

export const AVSessionUnregisterToggleFavoriteCallbackInvalidParam: () => number;

export const AVSessionRegisterOutputDeviceChangeCallbackSuccess: () => number;

export const AVSessionRegisterOutputDeviceChangeCallbackInvalidParam: () => number;

export const AVSessionUnregisterOutputDeviceChangeCallbackSuccess: () => number;

export const AVSessionUnregisterOutputDeviceChangeCallbackInvalidParam: () => number;

export const AVSessionUnregisterCommandCallbackCommandInvalid: () => number;

export const AVSessionRegisterCommandCallbackCommandInvalid: () => number;

export const AVSessionRegisterForwardCallbackSuccess: () => number;

export const AVSessionRegisterForwardCallbackInvalidParam: () => number;

export const AVSessionUnregisterForwardCallbackSuccess: () => number;

export const AVSessionUnregisterForwardCallbackInvalidParam: () => number;

export const AVSessionErrInvalidParam: () => number;

export const AVSessionErrServiceException: () => number;

export const AVSessionErrCodeCommandInvalid: () => number;

export const AVSessionAcquireSessionSuccess: () => number;

export const AVSessionAcquireSessionInvalidParam: () => number;

export const AVSessionCreateAVCastControllerInvalidParam: () => number;

export const AVSessionStopCastingSuccess: () => number;

export const AVSessionStopCastingInvalidParam: () => number;

export const AVSessionAcquireOutputDeviceSuccess: () => number;

export const AVSessionAcquireOutputDeviceInvalidParam: () => number;

export const AVSessionReleaseOutputDeviceSuccess: () => number;

export const AVSessionReleaseOutputDeviceInvalidParam: () => number;

export const AVSessionGetAVCastCategorySuccess: () => number;

export const AVSessionGetAVCastCategoryInvalidParam: () => number;

export const AVSessionGetDeviceIdSuccess: () => number;

export const AVSessionGetDeviceIdInvalidParam: () => number;

export const AVSessionGetDeviceNameSuccess: () => number;

export const AVSessionGetDeviceNameInvalidParam: () => number;

export const AVSessionGetDeviceTypeSuccess: () => number;

export const AVSessionGetDeviceTypeInvalidParam: () => number;

export const AVSessionGetSupportedProtocolsSuccess: () => number;

export const AVSessionGetSupportedProtocolsInvalidParam: () => number;

export const AVSessionPlaybackFilterSTATE: () => number;

export const AVSessionPlaybackFilterPOSITION: () => number;

export const AVSessionPlaybackFilterSPEED: () => number;

export const AVSessionPlaybackFilterVOLUME: () => number;

export const AVMediaDescriptionBuilderCreateSuccess: () => number;

export const AVMediaDescriptionBuilderCreateInvalidParam: () => number;

export const AVMediaDescriptionBuilderDestroySuccess: () => number;

export const AVMediaDescriptionBuilderDestroyInvalidParam: () => number;

export const AVMediaDescriptionBuilderSetAssetIdSuccess: () => number;

export const AVMediaDescriptionBuilderSetAssetIdInvalidParam: () => number;

export const AVMediaDescriptionBuilderSetTitleSuccess: () => number;

export const AVMediaDescriptionBuilderSetTitleInvalidParam: () => number;

export const AVMediaDescriptionBuilderSetSubTitleSuccess: () => number;

export const AVMediaDescriptionBuilderSetSubTitleInvalidParam: () => number;

export const AVMediaDescriptionBuilderSetArtistSuccess: () => number;

export const AVMediaDescriptionBuilderSetArtistInvalidParam: () => number;

export const AVMediaDescriptionBuilderSetAlbumCoverUriSuccess: () => number;

export const AVMediaDescriptionBuilderSetAlbumCoverUriInvalidParam: () => number;

export const AVMediaDescriptionBuilderSetMediaTypeSuccess: () => number;

export const AVMediaDescriptionBuilderSetMediaTypeInvalidParam: () => number;

export const AVMediaDescriptionBuilderSetLyricContentSuccess: () => number;

export const AVMediaDescriptionBuilderSetLyricContentInvalidParam: () => number;

export const AVMediaDescriptionBuilderSetDurationSuccess: () => number;

export const AVMediaDescriptionBuilderSetDurationInvalidParam: () => number;

export const AVMediaDescriptionBuilderSetMediaUriSuccess: () => number;

export const AVMediaDescriptionBuilderSetMediaUriInvalidParam: () => number;

export const AVMediaDescriptionBuilderSetStartPositionSuccess: () => number;

export const AVMediaDescriptionBuilderSetStartPositionInvalidParam: () => number;

export const AVMediaDescriptionBuilderSetMediaSizeSuccess: () => number;

export const AVMediaDescriptionBuilderSetMediaSizeInvalidParam: () => number;

export const AVMediaDescriptionBuilderSetAlbumTitleSuccess: () => number;

export const AVMediaDescriptionBuilderSetAlbumTitleInvalidParam: () => number;

export const AVMediaDescriptionBuilderSetAppNameSuccess: () => number;

export const AVMediaDescriptionBuilderSetAppNameInvalidParam: () => number;

export const AVMediaDescriptionBuilderGenerateAVMediaDescriptionSuccess: () => number;

export const AVMediaDescriptionBuilderGenerateAVMediaDescriptionInvalidParam: () => number;

export const AVMediaDescriptionGetAssetIdSuccess: () => number;

export const AVMediaDescriptionGetAssetIdInvalidParam: () => number;

export const AVMediaDescriptionGetTitleSuccess: () => number;

export const AVMediaDescriptionGetTitleInvalidParam: () => number;

export const AVMediaDescriptionGetSubTitleSuccess: () => number;

export const AVMediaDescriptionGetSubTitleInvalidParam: () => number;

export const AVMediaDescriptionGetArtistSuccess: () => number;

export const AVMediaDescriptionGetArtistInvalidParam: () => number;

export const AVMediaDescriptionGetAlbumCoverUriSuccess: () => number;

export const AVMediaDescriptionGetAlbumCoverUriInvalidParam: () => number;

export const AVMediaDescriptionGetMediaTypeSuccess: () => number;

export const AVMediaDescriptionGetMediaTypeInvalidParam: () => number;

export const AVMediaDescriptionGetLyricContentSuccess: () => number;

export const AVMediaDescriptionGetLyricContentInvalidParam: () => number;

export const AVMediaDescriptionGetDurationSuccess: () => number;

export const AVMediaDescriptionGetDurationInvalidParam: () => number;

export const AVMediaDescriptionGetMediaUriSuccess: () => number;

export const AVMediaDescriptionGetMediaUriInvalidParam: () => number;

export const AVMediaDescriptionGetStartPositionSuccess: () => number;

export const AVMediaDescriptionGetStartPositionInvalidParam: () => number;

export const AVMediaDescriptionGetMediaSizeSuccess: () => number;

export const AVMediaDescriptionGetMediaSizeInvalidParam: () => number;

export const AVMediaDescriptionGetAlbumTitleSuccess: () => number;

export const AVMediaDescriptionGetAlbumTitleInvalidParam: () => number;

export const AVMediaDescriptionGetAppNameSuccess: () => number;

export const AVMediaDescriptionGetAppNameInvalidParam: () => number;

export const AVMediaDescriptionDestroySuccess: () => number;

export const AVMediaDescriptionDestroyInvalidParam: () => number;

export const AVCastControllerDestroyInvalidParam: () => number;

export const AVCastControllerGetPlaybackStateInvalidParam: () => number;

export const AVCastControllerRegisterPlaybackStateChangedCallbackInvalidParam: () => number;

export const AVCastControllerUnregisterPlaybackStateChangedCallbackInvalidParam: () => number;

export const AVCastControllerRegisterMediaItemChangedCallbackInvalidParam: () => number;

export const AVCastControllerUnregisterMediaItemChangedCallbackInvalidParam: () => number;

export const AVCastControllerRegisterPlayNextCallbackInvalidParam: () => number;

export const AVCastControllerUnregisterPlayNextCallbackInvalidParam: () => number;

export const AVCastControllerRegisterPlayPreviousCallbackInvalidParam: () => number;

export const AVCastControllerUnregisterPlayPreviousCallbackInvalidParam: () => number;

export const AVCastControllerRegisterSeekDoneCallbackInvalidParam: () => number;

export const AVCastControllerUnregisterSeekDoneCallbackInvalidParam: () => number;

export const AVCastControllerRegisterEndOfStreamCallbackInvalidParam: () => number;

export const AVCastControllerUnregisterEndOfStreamCallbackInvalidParam: () => number;

export const AVCastControllerRegisterErrorCallbackInvalidParam: () => number;

export const AVCastControllerUnregisterErrorCallbackInvalidParam: () => number;

export const AVCastControllerSendCommonCommandInvalidParam: () => number;

export const AVCastControllerSendSeekCommandInvalidParam: () => number;

export const AVCastControllerSendFastForwardCommandInvalidParam: () => number;

export const AVCastControllerSendRewindCommandInvalidParam: () => number;

export const AVCastControllerSendSetSpeedCommandInvalidParam: () => number;

export const AVCastControllerSendVolumeCommandInvalidParam: () => number;

export const AVCastControllerPrepareInvalidParam: () => number;

export const AVCastControllerStartInvalidParam: () => number;

export const AVSessionGetPlaybackStateInvalidParam: () => number;

export const AVSessionGetPlaybackPositionInvalidParam: () => number;

export const AVSessionGetPlaybackSpeedInvalidParam: () => number;

export const AVSessionGetPlaybackVolumeInvalidParam: () => number;

export const AVCastControlCommandTypePlay: () => number;

export const AVCastControlCommandTypePause: () => number;

export const AVCastControlCommandTypeStop: () => number;

export const AVCastControlCommandTypePlayNext: () => number;

export const AVCastControlCommandTypePlayPrevious: () => number;

export const AVCastControlCommandTypeFastForward: () => number;

export const AVCastControlCommandTypeRewind: () => number;

export const AVCastControlCommandTypeSeek: () => number;

export const AVCastControlCommandTypeSetVolume: () => number;

export const AVCastControlCommandTypeSetSpeed: () => number;

export const AVSessionPlaybackSpeed0_75X: () => number;

export const AVSessionPlaybackSpeed1_00X: () => number;

export const AVSessionPlaybackSpeed1_25X: () => number;

export const AVSessionPlaybackSpeed1_75X: () => number;

export const AVSessionPlaybackSpeed2_00X: () => number;

export const AVSessionPlaybackSpeed0_50X: () => number;

export const AVSessionPlaybackSpeed1_50X: () => number;

export const AVSessionOutputDeviceInfo: () => number;
