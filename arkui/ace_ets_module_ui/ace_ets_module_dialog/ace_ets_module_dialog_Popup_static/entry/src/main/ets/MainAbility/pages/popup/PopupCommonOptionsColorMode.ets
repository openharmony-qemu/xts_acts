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
  Entry, Component, Column, Button, Text, FlexAlign, ColumnOptions, wrapBuilder,
  PopupCommonOptions, AnchoredColorMode, ClickEvent,
} from '@ohos.arkui.component';
import { ComponentContent } from '@kit.ArkUI';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router, PromptAction } from '@ohos.arkui.UIContext';

@Builder
function buildColorModePopupContent(): void {
  Column() {
    Text(AppStorage.get<string>('popupCommonColorModeText') ?? 'Popup Content')
      .fontSize(20).key('popupCommonColorModeText')
  }.width(200).height(100).padding(10)
}

@Entry
@Component
struct PopupCommonOptionsColorMode {
  aboutToAppear(): void {
    try {
      AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
    } catch (error) {
      console.error('PopupCommonOptionsColorMode router init error: ' + error);
    }
  }

  openPopup(buttonId: string, label: string, options: PopupCommonOptions): void {
    AppStorage.setOrCreate<string>('popupCommonColorModeText', label);
    let context = this.getUIContext();
    let promptActionInstance = context.getPromptAction();
    let contentNode = new ComponentContent<Object>(context, wrapBuilder(buildColorModePopupContent));
    AppStorage.setOrCreate<PromptAction>('popupPromptAction', promptActionInstance);
    AppStorage.setOrCreate<ComponentContent<Object>>('popupContent', contentNode);
    promptActionInstance.openPopup(contentNode, { id: buttonId }, options);
  }

  build(): void {
    Column({ space: 8 } as ColumnOptions) {
      Button('PopupColorMode_FOLLOW_SYSTEM').id('PopupColorMode_FOLLOW_SYSTEM')
        .onClick((event?: ClickEvent): void => {
          this.openPopup('PopupColorMode_FOLLOW_SYSTEM', 'PopupCommon FOLLOW_SYSTEM',
            { colorMode: AnchoredColorMode.FOLLOW_SYSTEM });
        })
      Button('PopupColorMode_FOLLOW_TARGET').id('PopupColorMode_FOLLOW_TARGET')
        .onClick((event?: ClickEvent): void => {
          this.openPopup('PopupColorMode_FOLLOW_TARGET', 'PopupCommon FOLLOW_TARGET',
            { colorMode: AnchoredColorMode.FOLLOW_TARGET });
        })
      Button('PopupColorMode_null').id('PopupColorMode_null')
        .onClick((event?: ClickEvent): void => {
          this.openPopup('PopupColorMode_null', 'PopupCommon null', {});
        })
      Button('PopupColorMode_undefined').id('PopupColorMode_undefined')
        .onClick((event?: ClickEvent): void => {
          this.openPopup('PopupColorMode_undefined', 'PopupCommon undefined', { colorMode: undefined });
        })
    }.width('100%').height('100%').justifyContent(FlexAlign.Center)
  }
}
