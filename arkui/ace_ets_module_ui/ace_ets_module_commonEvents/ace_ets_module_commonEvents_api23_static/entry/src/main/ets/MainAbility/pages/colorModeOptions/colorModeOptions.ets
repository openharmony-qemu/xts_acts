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
  Column,
  ColumnOptions,
  Button,
  Text,
  Entry,
  Component,
  Image,
  $r,
  ClickEvent
} from '@ohos.arkui.component';
import componentSnapshot from '@ohos.arkui.componentSnapshot';
import { DynamicRangeMode } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';

@Entry
@Component
struct colorModeOptions {
  // Test ColorModeOptions - colorSpace
  @Builder
  buildImage1() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageColorSpace')
  }

  // Test ColorModeOptions - isAuto
  @Builder
  buildImage2() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageIsAuto')
  }

  // Test DynamicRangeModeOptions - dynamicRangeMode
  @Builder
  buildImage3() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageDynamicRangeMode')
  }

  // Test DynamicRangeModeOptions - isAuto
  @Builder
  buildImage4() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageDynamicRangeIsAuto')
  }

  build() {
    Column({ space: 15 } as ColumnOptions) {
      Button("Test ColorModeOptions - colorSpace")
        .id('btnColorModeColorSpace')
        .width(300)
        .height(50)
        .onClick(() => {
          // Test colorSpace property
          let colorModeOptions: componentSnapshot.ColorModeOptions = {
            colorSpace: colorSpaceManager.ColorSpace.SRGB
          };
          AppStorage.setOrCreate<componentSnapshot.ColorModeOptions>('colorModeOptionsColorSpace', colorModeOptions);
        })

      Button("Test ColorModeOptions - isAuto true")
        .id('btnColorModeIsAutoTrue')
        .width(300)
        .height(50)
        .onClick(() => {
          // Test isAuto - true
          let colorModeOptions: componentSnapshot.ColorModeOptions = {
            isAuto: true
          };
          AppStorage.setOrCreate<componentSnapshot.ColorModeOptions>('colorModeOptionsIsAutoTrue', colorModeOptions);
        })

      Button("Test ColorModeOptions - isAuto false")
        .id('btnColorModeIsAutoFalse')
        .width(300)
        .height(50)
        .onClick(() => {
          // Test isAuto - false
          let colorModeOptions: componentSnapshot.ColorModeOptions = {
            isAuto: false
          };
          AppStorage.setOrCreate<componentSnapshot.ColorModeOptions>('colorModeOptionsIsAutoFalse', colorModeOptions);
        })

      Button("Test DynamicRangeModeOptions - HIGH")
        .id('btnDynamicRangeModeHigh')
        .width(300)
        .height(50)
        .onClick(() => {
          // Test dynamicRangeMode - HIGH
          let dynamicRangeModeOptions: componentSnapshot.DynamicRangeModeOptions = {
            dynamicRangeMode: DynamicRangeMode.HIGH
          };
          AppStorage.setOrCreate<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsHigh', dynamicRangeModeOptions);
        })

      Button("Test DynamicRangeModeOptions - CONSTRAINT")
        .id('btnDynamicRangeModeConstraint')
        .width(300)
        .height(50)
        .onClick(() => {
          // Test dynamicRangeMode - CONSTRAINT
          let dynamicRangeModeOptions: componentSnapshot.DynamicRangeModeOptions = {
            dynamicRangeMode: DynamicRangeMode.CONSTRAINT
          };
          AppStorage.setOrCreate<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsConstraint', dynamicRangeModeOptions);
        })

      Button("Test DynamicRangeModeOptions - STANDARD")
        .id('btnDynamicRangeModeStandard')
        .width(300)
        .height(50)
        .onClick(() => {
          // Test dynamicRangeMode - STANDARD
          let dynamicRangeModeOptions: componentSnapshot.DynamicRangeModeOptions = {
            dynamicRangeMode: DynamicRangeMode.STANDARD
          };
          AppStorage.setOrCreate<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsStandard', dynamicRangeModeOptions);
        })

      Button("Test DynamicRangeModeOptions - isAuto true")
        .id('btnDynamicRangeIsAutoTrue')
        .width(300)
        .height(50)
        .onClick(() => {
          // Test isAuto - true
          let dynamicRangeModeOptions: componentSnapshot.DynamicRangeModeOptions = {
            isAuto: true
          };
          AppStorage.setOrCreate<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsIsAutoTrue', dynamicRangeModeOptions);
        })

      Button("Test DynamicRangeModeOptions - isAuto false")
        .id('btnDynamicRangeIsAutoFalse')
        .width(300)
        .height(50)
        .onClick(() => {
          // Test isAuto - false
          let dynamicRangeModeOptions: componentSnapshot.DynamicRangeModeOptions = {
            isAuto: false
          };
          AppStorage.setOrCreate<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsIsAutoFalse', dynamicRangeModeOptions);
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
