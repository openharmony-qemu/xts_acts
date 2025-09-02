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
import {
  AdaptiveColor,
  Alignment,
  BlurStyle,
  BlurStyleActivePolicy,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Image,
  ImageSize,
  Padding,
  Position,
  ResourceColor,
  Row,
  SizeOptions,
  Stack,
  Text,
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct backgroundEffect1 {
  @State imageSize: number = 150;
  @State mInactiveColor: ResourceColor = '#FFFF0000'

  build() {
    Column({ space: 5 } as ColumnOptions) {

      Stack() {
        Column()
          .id('backgroundEffectValue')
          .width(this.imageSize)
          .height(this.imageSize)
          .backgroundEffect({

            radius: 10,
            saturation: 50,
            blurOptions: { grayscale: [20, 20] },
            brightness: 2,
            color: '#8044a4b5',
            adaptiveColor: AdaptiveColor.DEFAULT,
            inactiveColor: this.mInactiveColor,
            policy: BlurStyleActivePolicy.ALWAYS_ACTIVE
          })
      }
    }
    .width('100%')
    .padding({ top: 5 } as Padding)
  }
}
