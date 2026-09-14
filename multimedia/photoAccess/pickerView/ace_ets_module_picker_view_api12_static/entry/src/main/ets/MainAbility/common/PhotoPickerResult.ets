'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { CompletedResult, PreselectedInfo } from '@ohos.file.PhotoPickerComponent';
import { EdgeEffect, Margin } from '@ohos.arkui.component';

export class PhotoPickerResult {
  public checkBoxColor: string = '';
  public backgroundColor: string = '';
  public isRepeatSelectSupported: boolean = false;
  public photoBrowserBackgroundColorMode: int = 0;
  public maxSelectedReminderMode: int = 0;
  public orientation: int = 0;
  public themeColorMode: int = 0;
  public selectMode: int = 0;
  public maxSelectCount: int = 500;
  public maxPhotoSelectNumber: int = 500;
  public maxVideoSelectNumber: int = 500;
  public itemType: string = '';
  public checkboxTextColor: string = '';
  public uiComponentColorMode: int = 0;
  public pickerIndex: int = -1;
  public preselectedInfos: Array<PreselectedInfo> = [];
  public isSlidingSupported: boolean = true;
  public edgeEffect: EdgeEffect = EdgeEffect.Spring;
  public mimeType: photoAccessHelper.PhotoViewMIMETypes =
    photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE;
  public mimeTypeFilter: photoAccessHelper.MimeTypeFilter = { mimeTypeArray: [] };
  public singleSelectionMode: photoAccessHelper.SingleSelectionMode =
    photoAccessHelper.SingleSelectionMode.BROWSER_AND_SELECT_MODE;
  public preselectedUris: Array<string> = [];
  public isPreviewForSingleSelectionSupported: boolean = false;
  public gridPinchMode?: photoAccessHelper.GridPinchMode;
  public autoPlayScenes: Array<photoAccessHelper.AutoPlayScene> = [];
  public appAlbumFilters: Array<string> = [];
  public backgroundOpacity?: double;
  public contextRecoveryInfo?: photoAccessHelper.ContextRecoveryInfo;
  public showDateOnScrollbar: boolean = false;
  public photoUris: Array<string> = [];
  public movingPhotoBadgeStates: Array<photoAccessHelper.MovingPhotoBadgeStateType> = [];
  public completedResult?: CompletedResult;
  public gridMargin?: Margin;
  public photoBrowserMargin?: Margin;
  public controllerErrorCode?: int;
}
