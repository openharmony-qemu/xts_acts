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
  Entry, Component, Column, Row, Button, FlexAlign, ColumnOptions, RowOptions,
  PopupOptions, ClickEvent,
} from '@ohos.arkui.component';
import { LevelMode } from '@ohos.promptAction';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct PopupOptionsLevelMode {
  @State isShowDefault: boolean = false;
  @State isShowOverlay: boolean = false;
  @State isShowEmbedded: boolean = false;
  @State isShowNull: boolean = false;
  @State isShowUndefined: boolean = false;

  aboutToAppear(): void {
    try {
      AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
    } catch (error) {
      console.error('PopupOptionsLevelMode router init error: ' + error);
    }
  }

  build(): void {
    Column({ space: 5 } as ColumnOptions) {
      Row({ space: 5 } as RowOptions) {
        Button('Default').id('popup_default').height('8%')
          .bindPopup(this.isShowDefault, {
            message: 'Popup Default LevelMode Test',
            onStateChange: (e): void => { if (!e.isVisible) { this.isShowDefault = false; } },
          } as PopupOptions)
          .onClick((event?: ClickEvent): void => { this.isShowDefault = !this.isShowDefault; })
        Button('OVERLAY').id('popup_overlay').height('8%')
          .bindPopup(this.isShowOverlay, {
            message: 'Popup OVERLAY LevelMode Test',
            levelMode: LevelMode.OVERLAY,
            onStateChange: (e): void => { if (!e.isVisible) { this.isShowOverlay = false; } },
          } as PopupOptions)
          .onClick((event?: ClickEvent): void => { this.isShowOverlay = !this.isShowOverlay; })
      }
      Row({ space: 5 } as RowOptions) {
        Button('EMBEDDED').id('popup_embedded').height('8%')
          .bindPopup(this.isShowEmbedded, {
            message: 'Popup EMBEDDED LevelMode Test',
            levelMode: LevelMode.EMBEDDED,
            onStateChange: (e): void => { if (!e.isVisible) { this.isShowEmbedded = false; } },
          } as PopupOptions)
          .onClick((event?: ClickEvent): void => { this.isShowEmbedded = !this.isShowEmbedded; })
        Button('Null').id('popup_null').height('8%')
          .bindPopup(this.isShowNull, {
            message: 'Popup Null LevelMode Test',
            onStateChange: (e): void => { if (!e.isVisible) { this.isShowNull = false; } },
          } as PopupOptions)
          .onClick((event?: ClickEvent): void => { this.isShowNull = !this.isShowNull; })
      }
      Button('Undefined').id('popup_undefined').height('8%')
        .bindPopup(this.isShowUndefined, {
          message: 'Popup Undefined LevelMode Test',
          levelMode: undefined,
          onStateChange: (e): void => { if (!e.isVisible) { this.isShowUndefined = false; } },
        } as PopupOptions)
        .onClick((event?: ClickEvent): void => { this.isShowUndefined = !this.isShowUndefined; })
    }.justifyContent(FlexAlign.Start).height('100%').width('100%')
  }
}
