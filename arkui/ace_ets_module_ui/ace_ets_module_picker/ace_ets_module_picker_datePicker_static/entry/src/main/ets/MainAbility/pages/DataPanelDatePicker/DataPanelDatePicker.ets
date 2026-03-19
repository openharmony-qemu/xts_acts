/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import {
  Entry,
  Component,
  Column,
  Text,
  Color,
  ColorStop,
  ResourceColor,
  Length,
  DatePickerDialogOptions
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct DataPanelDatePickerPage {
  private colorStopColorCase: ColorStop = {
    color: Color.Red as ResourceColor,
    offset: 0
  };

  private colorStopOffsetCase: ColorStop = {
    color: Color.Blue,
    offset: 20 as Length
  };

  private datePickerDialogOptionsCase: DatePickerDialogOptions = {
    canLoop: true
  };

  aboutToAppear(): void {
    const snapshot = `colorStopColor=${this.colorStopColorCase.color};` +
      `colorStopOffset=${this.colorStopOffsetCase.offset};` +
      `datePickerCanLoop=${this.datePickerDialogOptionsCase.canLoop}`;
    AppStorage.setOrCreate<string>('DataPanelDatePickerPageState', snapshot);
  }

  build() {
    Column() {
      Text(`color=${this.colorStopColorCase.color}`)
        .id('colorStopColorCase')
        .key('colorStopColorCase')
      Text(`offset=${this.colorStopOffsetCase.offset}`)
        .id('colorStopOffsetCase')
        .key('colorStopOffsetCase')
      Text(`canLoop=${this.datePickerDialogOptionsCase.canLoop}`)
        .id('datePickerCanLoopCase')
        .key('datePickerCanLoopCase')
    }.width('100%').height('100%')
  }
}
