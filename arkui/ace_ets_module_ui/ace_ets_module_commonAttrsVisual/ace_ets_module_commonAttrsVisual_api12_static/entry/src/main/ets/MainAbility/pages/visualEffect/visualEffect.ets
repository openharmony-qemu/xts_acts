/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import uiEffect from '@ohos.graphics.uiEffect';
import {
  $r,
  AdaptiveColor,
  Alignment,
  BlurStyle,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexDirection,
  Image,
  ImageSize,
  ItemAlign,
  Padding,
  Position,
  Resource,
  Row,
  SizeOptions,
  Stack,
  Text,
  ThemeColorMode,
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct visualEffect1 {
  @State visualEffectTest: uiEffect.VisualEffect = uiEffect.createEffect()

  build() {
    Column({ space: 15 } as ColumnOptions) {
      Text('visualEffect').fontSize(20).width('75%').fontColor('#DCDCDC')
      Text()
        .id("visualEffect_text")
        .width(100)
        .height(100)
        .backgroundColor('#ADD8E6')
        .backgroundImage($r("app.media.icon"))
        .visualEffect(this.visualEffectTest)

      Text('foregroundFilter').fontSize(20).width('75%').fontColor('#DCDCDC')
      Text()
        .id("foregroundFilter_text")
        .width(100)
        .height(100)
        .backgroundColor('#ADD8E6')
        .backgroundImage($r("app.media.icon"))


      Text('backgroundFilter').fontSize(20).width('75%').fontColor('#DCDCDC')
      Text()
        .id("backgroundFilter_text")
        .width(100)
        .height(100)
        .backgroundColor('#ADD8E6')
        .backgroundImage($r("app.media.icon"))


      Text('compositingFilter').fontSize(20).width('75%').fontColor('#DCDCDC')
      Text()
        .id("compositingFilter_text")
        .width(100)
        .height(100)
        .backgroundColor('#ADD8E6')
        .backgroundImage($r("app.media.icon"))

    }
    .height('100%')
    .width('100%')
  }
}