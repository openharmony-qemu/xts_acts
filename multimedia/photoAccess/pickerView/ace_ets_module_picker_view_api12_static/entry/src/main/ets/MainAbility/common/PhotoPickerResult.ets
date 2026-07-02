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
  public preselectedUris: Array<string> = [];
  public isPreviewForSingleSelectionSupported: boolean = false;
}