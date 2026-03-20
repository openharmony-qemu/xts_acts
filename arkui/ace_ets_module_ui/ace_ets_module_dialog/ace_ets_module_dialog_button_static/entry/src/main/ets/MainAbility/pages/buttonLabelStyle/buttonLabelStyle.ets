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

'use static';

import {
  Entry,
  Component,
  Column,
  Button,
  TextAlign,
  ButtonLabelStyle,
  FlexAlign
} from '@ohos.arkui.component';

@Entry
@Component
struct ButtonLabelStylePage {
  build() {
    Column() {
      Button('ButtonLabelStyle textAlign Start')
        .labelStyle({ textAlign: TextAlign.Start } as ButtonLabelStyle)
        .key('buttonLabelStyleTextAlignStart')
        .id('buttonLabelStyleTextAlignStart')
        .width(260)
        .height(48)
      Button('ButtonLabelStyle textAlign Center')
        .labelStyle({ textAlign: TextAlign.Center } as ButtonLabelStyle)
        .key('buttonLabelStyleTextAlignCenter')
        .id('buttonLabelStyleTextAlignCenter')
        .width(260)
        .height(48)
      Button('ButtonLabelStyle textAlign End')
        .labelStyle({ textAlign: TextAlign.End } as ButtonLabelStyle)
        .key('buttonLabelStyleTextAlignEnd')
        .id('buttonLabelStyleTextAlignEnd')
        .width(260)
        .height(48)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
