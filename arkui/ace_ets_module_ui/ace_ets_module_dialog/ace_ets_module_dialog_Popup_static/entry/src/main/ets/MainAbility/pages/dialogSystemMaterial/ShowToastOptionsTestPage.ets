'use static';
/**
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

import {
  uiMaterial,
  Entry,
  Component,
  State,
  Column,
  Text,
  FontWeight,
  Row,
  Button,
  $r,
  Alignment,
  BlurStyle,
  ShadowStyle,
  Color,
  FlexAlign,
  HorizontalAlign,
  ColumnOptions,
  RowOptions,
} from '@kit.ArkUI';
import router from '@ohos.router';
import { UIContext, Router, PromptAction } from '@ohos.arkui.UIContext';
import promptAction from '@ohos.promptAction'

@Entry
@Component
struct ShowToastOptionsTestPage {
  @State toastId: number = 0;
  @State resultText: string = '';

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('ShowToastOptions Test Page')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
        .id('title_text')

      Text(this.resultText)
        .fontSize(16)
        .id('result_text')
        .margin({ bottom: 10 })
      Row({ space: 10 } as RowOptions) {
        Button('SystemMaterial')
          .id('btn_system_material')
          .onClick(():void => {
            this.getUIContext().getPromptAction().openToast({
              message: 'SystemMaterial',
              systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN })
            })
          })
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}