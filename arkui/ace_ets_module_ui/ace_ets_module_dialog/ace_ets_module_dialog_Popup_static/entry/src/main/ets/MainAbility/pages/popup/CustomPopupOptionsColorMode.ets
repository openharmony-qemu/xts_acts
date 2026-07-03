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
  Entry, Component, Column, Button, Text, FlexAlign, ColumnOptions,
  CustomPopupOptions, AnchoredColorMode, ClickEvent,
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct CustomPopupOptionsColorMode {
  @State showPopup1: boolean = false;
  @State showPopup2: boolean = false;
  @State showPopup3: boolean = false;
  @State showPopup4: boolean = false;

  aboutToAppear(): void {
    try {
      AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
    } catch (error) {
      console.error('CustomPopupOptionsColorMode router init error: ' + error);
    }
  }

  @Builder
  popupFollowSystem(): void {
    Column() {
      Text('CustomPopup FOLLOW_SYSTEM').fontSize(20).key('customColorModeText')
    }.width(200).height(100).padding(10)
  }

  @Builder
  popupFollowTarget(): void {
    Column() {
      Text('CustomPopup FOLLOW_TARGET').fontSize(20).key('customColorModeText')
    }.width(200).height(100).padding(10)
  }

  @Builder
  popupNullMode(): void {
    Column() {
      Text('CustomPopup null').fontSize(20).key('customColorModeText')
    }.width(200).height(100).padding(10)
  }

  @Builder
  popupUndefinedMode(): void {
    Column() {
      Text('CustomPopup undefined').fontSize(20).key('customColorModeText')
    }.width(200).height(100).padding(10)
  }

  build(): void {
    Column({ space: 8 } as ColumnOptions) {
      Button('PopupColorMode_FOLLOW_SYSTEM').id('PopupColorMode_FOLLOW_SYSTEM')
        .bindPopup(this.showPopup1, {
          builder: (): void => { this.popupFollowSystem(); },
          colorMode: AnchoredColorMode.FOLLOW_SYSTEM,
          onStateChange: (e): void => { if (!e.isVisible) { this.showPopup1 = false; } },
        } as CustomPopupOptions)
        .onClick((event?: ClickEvent): void => { this.showPopup1 = !this.showPopup1; })
      Button('PopupColorMode_FOLLOW_TARGET').id('PopupColorMode_FOLLOW_TARGET')
        .bindPopup(this.showPopup2, {
          builder: (): void => { this.popupFollowTarget(); },
          colorMode: AnchoredColorMode.FOLLOW_TARGET,
          onStateChange: (e): void => { if (!e.isVisible) { this.showPopup2 = false; } },
        } as CustomPopupOptions)
        .onClick((event?: ClickEvent): void => { this.showPopup2 = !this.showPopup2; })
      Button('PopupColorMode_null').id('PopupColorMode_null')
        .bindPopup(this.showPopup3, {
          builder: (): void => { this.popupNullMode(); },
          onStateChange: (e): void => { if (!e.isVisible) { this.showPopup3 = false; } },
        } as CustomPopupOptions)
        .onClick((event?: ClickEvent): void => { this.showPopup3 = !this.showPopup3; })
      Button('PopupColorMode_undefined').id('PopupColorMode_undefined')
        .bindPopup(this.showPopup4, {
          builder: (): void => { this.popupUndefinedMode(); },
          colorMode: undefined,
          onStateChange: (e): void => { if (!e.isVisible) { this.showPopup4 = false; } },
        } as CustomPopupOptions)
        .onClick((event?: ClickEvent): void => { this.showPopup4 = !this.showPopup4; })
    }.width('100%').height('100%').justifyContent(FlexAlign.Center)
  }
}
