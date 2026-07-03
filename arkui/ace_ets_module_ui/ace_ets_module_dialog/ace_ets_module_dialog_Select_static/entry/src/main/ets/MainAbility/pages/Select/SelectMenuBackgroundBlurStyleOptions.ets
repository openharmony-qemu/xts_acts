'use static';
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

import {
  Entry,
  Component,
  Column,
  Select,
  Button,
  Row,
  ColumnOptions,
  Color,
  FlexAlign,
  RowOptions,
  ThemeColorMode,
  AdaptiveColor,
  BlurStyleActivePolicy,
  ResourceColor,
  BlurOptions,
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct SelectMenuBackgroundBlurStyleOptions {
  @State colorModeNum: ThemeColorMode | undefined = undefined;
  @State scaleNum: number | undefined = undefined;
  @State adaptiveColorNum: AdaptiveColor | undefined = undefined;
  @State blurOptionsNum: BlurOptions | undefined = undefined;
  @State policyNum: BlurStyleActivePolicy | undefined = undefined;
  @State inactiveColorNum: ResourceColor | undefined = undefined;

  aboutToAppear(): void {
    try {
      AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
    } catch (error) {
      console.error('SelectMenuBackgroundBlurStyleOptions router init error: ' + error);
    }
  }

  resetOptions(): void {
    this.colorModeNum = undefined;
    this.scaleNum = undefined;
    this.adaptiveColorNum = undefined;
    this.blurOptionsNum = undefined;
    this.policyNum = undefined;
    this.inactiveColorNum = undefined;
  }

  setBlueOptions(): void {
    this.colorModeNum = ThemeColorMode.DARK;
    this.scaleNum = 0.5;
    this.adaptiveColorNum = AdaptiveColor.DEFAULT;
    this.blurOptionsNum = { grayscale: [500, 500] };
    this.policyNum = BlurStyleActivePolicy.ALWAYS_INACTIVE;
    this.inactiveColorNum = Color.Blue;
  }

  build(): void {
    Column({ space: 8 } as ColumnOptions) {
      Select([{ value: 'aaa' }])
        .id('selectMenuBlur')
        .menuBackgroundBlurStyleOptions({
          colorMode: this.colorModeNum,
          scale: this.scaleNum,
          adaptiveColor: this.adaptiveColorNum,
          blurOptions: this.blurOptionsNum,
          policy: this.policyNum,
          inactiveColor: this.inactiveColorNum,
        })
      Row({ space: 8 } as RowOptions) {
        Button('空').id('btnBlurEmpty').onClick(() => {
          this.resetOptions();
        })
        Button('蓝').id('btnBlurBlue').onClick(() => {
          this.setBlueOptions();
        })
      }
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
    .padding({ left: '3%', right: '3%', top: '2%', bottom: '2%' })
  }
}
