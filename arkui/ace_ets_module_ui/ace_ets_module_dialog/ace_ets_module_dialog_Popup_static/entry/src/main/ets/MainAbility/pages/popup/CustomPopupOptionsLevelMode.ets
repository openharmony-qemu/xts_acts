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
  CustomPopupOptions, ClickEvent,
} from '@ohos.arkui.component';
import { LevelMode } from '@ohos.promptAction';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct CustomPopupOptionsLevelMode {
  @State isShowDefault: boolean = false;
  @State isShowOverlay: boolean = false;
  @State isShowEmbedded: boolean = false;
  @State isShowNull: boolean = false;
  @State isShowUndefined: boolean = false;

  aboutToAppear(): void {
    try {
      AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
    } catch (error) {
      console.error('CustomPopupOptionsLevelMode router init error: ' + error);
    }
  }

  @Builder
  popupDefault(): void {
    Column() {
      Text('CustomPopup Default LevelMode Test').fontSize(20).key('customLevelModeText')
    }.width(200).height(100).padding(10)
  }

  @Builder
  popupOverlay(): void {
    Column() {
      Text('CustomPopup OVERLAY LevelMode Test').fontSize(20).key('customLevelModeText')
    }.width(200).height(100).padding(10)
  }

  @Builder
  popupEmbedded(): void {
    Column() {
      Text('CustomPopup EMBEDDED LevelMode Test').fontSize(20).key('customLevelModeText')
    }.width(200).height(100).padding(10)
  }

  @Builder
  popupNullMode(): void {
    Column() {
      Text('CustomPopup Null LevelMode Test').fontSize(20).key('customLevelModeText')
    }.width(200).height(100).padding(10)
  }

  @Builder
  popupUndefinedMode(): void {
    Column() {
      Text('CustomPopup Undefined LevelMode Test').fontSize(20).key('customLevelModeText')
    }.width(200).height(100).padding(10)
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
        .bindPopup(this.isShowDefault, {
          builder: (): void => { this.popupDefault(); },
          onStateChange: (e): void => { if (!e.isVisible) { this.isShowDefault = false; } },
        } as CustomPopupOptions)
        .onClick((event?: ClickEvent): void => { this.isShowDefault = !this.isShowDefault; })
      Button('OVERLAY').id('popup_overlay')
        .bindPopup(this.isShowOverlay, {
          builder: (): void => { this.popupOverlay(); },
          levelMode: LevelMode.OVERLAY,
          onStateChange: (e): void => { if (!e.isVisible) { this.isShowOverlay = false; } },
        } as CustomPopupOptions)
        .onClick((event?: ClickEvent): void => { this.isShowOverlay = !this.isShowOverlay; })
    }
  }

  @Builder
  buildSecondRow(): void {
    Row({ space: 5 } as RowOptions) {
      Button('EMBEDDED').id('popup_embedded')
        .bindPopup(this.isShowEmbedded, {
          builder: (): void => { this.popupEmbedded(); },
          levelMode: LevelMode.EMBEDDED,
          onStateChange: (e): void => { if (!e.isVisible) { this.isShowEmbedded = false; } },
        } as CustomPopupOptions)
        .onClick((event?: ClickEvent): void => { this.isShowEmbedded = !this.isShowEmbedded; })
      Button('Null').id('popup_null')
        .bindPopup(this.isShowNull, {
          builder: (): void => { this.popupNullMode(); },
          onStateChange: (e): void => { if (!e.isVisible) { this.isShowNull = false; } },
        } as CustomPopupOptions)
        .onClick((event?: ClickEvent): void => { this.isShowNull = !this.isShowNull; })
    }
  }

  @Builder
  buildThirdRow(): void {
    Button('Undefined').id('popup_undefined')
      .bindPopup(this.isShowUndefined, {
        builder: (): void => { this.popupUndefinedMode(); },
        levelMode: undefined,
        onStateChange: (e): void => { if (!e.isVisible) { this.isShowUndefined = false; } },
      } as CustomPopupOptions)
      .onClick((event?: ClickEvent): void => { this.isShowUndefined = !this.isShowUndefined; })
  }
}
