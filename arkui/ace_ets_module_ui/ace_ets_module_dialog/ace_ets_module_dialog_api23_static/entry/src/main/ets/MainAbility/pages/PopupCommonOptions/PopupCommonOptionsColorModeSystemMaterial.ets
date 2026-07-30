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

import router from '@ohos.router';
import {
  Entry,
  Column,
  Component,
  wrapBuilder,
  Button,
  Text,
  FlexAlign,
  PopupCommonOptions,
  HorizontalAlign,
  ColumnOptions,
  TextOverflow
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { ComponentContent, promptAction, AvoidanceMode, uiMaterial, AnchoredColorMode} from '@kit.ArkUI';
import { FrameNode } from '@ohos.arkui.node';
import { BusinessError } from '@kit.BasicServicesKit';

@Builder
function buildPopupContent() {
  Column() {
    Text('Popup Content')
      .fontSize(24)
      .key('popupContent')
  }
  .width(200)
  .height(100)
}

@Entry
@Component
struct PopupCommonOptionsColorModeSystemMaterial {
  @State isShowPopupUndefined: boolean = false;

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column({ space: 4 } as ColumnOptions) {
      Button('PopupCommonButton1')
        .id('PopupCommonOptionsButton1')
        .height(20)
        .width(180)
        .constraintSize({ minHeight: 0, maxHeight: 25 })
        .onClick(() => {
          let context = this.getUIContext();
          const contentNode = new ComponentContent<Object>(context, wrapBuilder(buildPopupContent));
          const promptActionInstance = context.getPromptAction();
          let uniqueId = this.getUniqueId();
          let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
          let targetId = frameNode?.getFirstChild()?.getUniqueId().toInt();
          let popupOptions: PopupCommonOptions = {
            avoidTarget: AvoidanceMode.AVOID_AROUND_TARGET,
            systemMaterial:undefined,
            colorMode:undefined,
            outlineWidth: 2,
            borderWidth: 3,
            autoCancel: true,
          };
        })
      Button('PopupCommonButton2')
        .id('PopupCommonOptionsButton2')
        .height(20)
        .width(180)
        .constraintSize({ minHeight: 0, maxHeight: 25 })
        .onClick(() => {
          let context = this.getUIContext();
          const contentNode = new ComponentContent<Object>(context, wrapBuilder(buildPopupContent));
          const promptActionInstance = context.getPromptAction();
          let uniqueId = this.getUniqueId();
          let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
          let targetId = frameNode?.getFirstChild()?.getUniqueId().toInt();
          let popupOptions: PopupCommonOptions = {
            avoidTarget: AvoidanceMode.AVOID_AROUND_TARGET,
            systemMaterial:new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT }),
            colorMode:AnchoredColorMode.FOLLOW_SYSTEM,
            outlineWidth: 2,
            borderWidth: 3,
            autoCancel: true,
          };
        })
      Button('PopupCommonButton3')
        .id('PopupCommonOptionsButton3')
        .height(20)
        .width(180)
        .constraintSize({ minHeight: 0, maxHeight: 25 })
        .onClick(() => {
          let context = this.getUIContext();
          const contentNode = new ComponentContent<Object>(context, wrapBuilder(buildPopupContent));
          const promptActionInstance = context.getPromptAction();
          let uniqueId = this.getUniqueId();
          let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
          let targetId = frameNode?.getFirstChild()?.getUniqueId().toInt();
          let popupOptions: PopupCommonOptions = {
            avoidTarget: AvoidanceMode.AVOID_AROUND_TARGET,
            systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN }),
            colorMode:AnchoredColorMode.FOLLOW_TARGET,
            outlineWidth: 2,
            borderWidth: 3,
            autoCancel: true,
          };
        })
      Button('PopupCommonButton4')
        .id('PopupCommonOptionsButton4')
        .height(20)
        .width(180)
        .constraintSize({ minHeight: 0, maxHeight: 25 })
        .onClick(() => {
          let context = this.getUIContext();
          const contentNode = new ComponentContent<Object>(context, wrapBuilder(buildPopupContent));
          const promptActionInstance = context.getPromptAction();
          let uniqueId = this.getUniqueId();
          let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
          let targetId = frameNode?.getFirstChild()?.getUniqueId().toInt();
          let popupOptions: PopupCommonOptions = {
            avoidTarget: AvoidanceMode.AVOID_AROUND_TARGET,
            systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.NONE }),
            colorMode:AnchoredColorMode.FOLLOW_TARGET,
            outlineWidth: 2,
            borderWidth: 3,
            autoCancel: true,
          };
        })

    }
    .width('100%')
    .height('100%')
  }
}
