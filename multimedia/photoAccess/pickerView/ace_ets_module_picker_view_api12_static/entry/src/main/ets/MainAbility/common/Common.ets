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

import { PickerOptions } from '@ohos.file.PhotoPickerComponent';
import { AlbumPickerOptions } from '@ohos.file.AlbumPickerComponent';
import { RecentPhotoOptions } from '@ohos.file.RecentPhotoComponent';
import photoAccessHelper from '@ohos.file.photoAccessHelper';

export enum EventType {
  PHOTO_PICKER_INFO = 10001,
  SELECT_ITEM_INFO,
  ALBUM_INFO,
  SELECT_CLICKTYPE,
  RECENT_PHOTO_INFO,
  VIDEO_PLAY_STATE,
  PICKER_SHEET_PAGE
}

export interface RouterOptionsParams {
  eventId: Long;
  pickerOptions: PickerOptions;
  albumOptions?: AlbumPickerOptions;
}

export interface RouterSelectOptionsParams {
  photoSelectOptions: photoAccessHelper.PhotoSelectOptions;
}

export interface RouterRecentPhotoOptions {
  eventId: number;
  recentPhotoOptions: RecentPhotoOptions;
}