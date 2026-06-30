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
  Entry, Component, Column, Row, Button, Text, FlexAlign, ColumnOptions, RowOptions,
  wrapBuilder, PopupCommonOptions, ClickEvent,
} from '@ohos.arkui.component';
import { ComponentContent } from '@kit.ArkUI';
import { LevelMode } from '@ohos.promptAction';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router, PromptAction } from '@ohos.arkui.UIContext';

@Builder
function buildLevelModePopupContent(): void {
  Column() {
    Text(AppStorage.get<string>('popupCommonLevelModeText') ?? 'Popup Content')
      .fontSize(20).key('popupCommonLevelModeText')
  }.width(200).height(100).padding(10)
}

@Entry
@Component
struct PopupCommonOptionsLevelMode {
  aboutToAppear(): void {
    try {
      AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
    } catch (error) {
      console.error('PopupCommonOptionsLevelMode router init error: ' + error);
    }
  }

  openPopup(buttonId: string, label: string, options: PopupCommonOptions): void {
    AppStorage.setOrCreate<string>('popupCommonLevelModeText', label);
    let context = this.getUIContext();
    let promptActionInstance = context.getPromptAction();
    let contentNode = new ComponentContent<Object>(context, wrapBuilder(buildLevelModePopupContent));
    AppStorage.setOrCreate<PromptAction>('popupPromptAction', promptActionInstance);
    AppStorage.setOrCreate<ComponentContent<Object>>('popupContent', contentNode);
    promptActionInstance.openPopup(contentNode, { id: buttonId }, options);
  }

  build(): void {
    Column({ space: 5 } as ColumnOptions) {
      this.buildFirstRow()
      this.buildSecondRow()
      this.buildThirdRow()
    }.justifyContent(FlexAlign.Start).height('100%').width('100%')
  }

  @Builder
  buildFirstRow(): void {
    Row({ space: 5 } as RowOptions) {
      Button('Default').id('popup_default')
        .onClick((event?: ClickEvent): void => {
          this.openPopup('popup_default', 'PopupCommon Default LevelMode Test', {});
        })
      Button('OVERLAY').id('popup_overlay')
        .onClick((event?: ClickEvent): void => {
          this.openPopup('popup_overlay', 'PopupCommon OVERLAY LevelMode Test',
            { levelMode: LevelMode.OVERLAY });
        })
    }
  }

  @Builder
  buildSecondRow(): void {
    Row({ space: 5 } as RowOptions) {
      Button('EMBEDDED').id('popup_embedded')
        .onClick((event?: ClickEvent): void => {
          this.openPopup('popup_embedded', 'PopupCommon EMBEDDED LevelMode Test',
            { levelMode: LevelMode.EMBEDDED });
        })
      Button('Null').id('popup_null')
        .onClick((event?: ClickEvent): void => {
          this.openPopup('popup_null', 'PopupCommon Null LevelMode Test', {});
        })
    }
  }

  @Builder
  buildThirdRow(): void {
    Button('Undefined').id('popup_undefined')
      .onClick((event?: ClickEvent): void => {
        this.openPopup('popup_undefined', 'PopupCommon Undefined LevelMode Test',
          { levelMode: undefined });
      })
  }
}
