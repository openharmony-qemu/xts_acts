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

import { LevelMode } from '@kit.ArkUI';

@Entry
@Component
struct PopupOptionsLevelMode {
  @State showDefault: boolean = false;
  @State showOverlay: boolean = false;
  @State showEmbedded: boolean = false;
  @State showEmbeddedNav: boolean = false;

  build() {
    Column({ space: 12 }) {
      Text('PopupOptions.levelMode').fontSize(18).fontWeight(FontWeight.Bold)
      Button('levelMode default')
        .id('btn_popup_level_default')
        .onClick(() => {
          this.showDefault = !this.showDefault;
        })
        .bindPopup(this.showDefault, {
          message: 'PopupOptions levelMode default',
          onStateChange: (e: PopupStateChangeParam) => {
            if (!e.isVisible) {
              this.showDefault = false;
            }
          }
        })
      Button('levelMode OVERLAY')
        .id('btn_popup_level_overlay')
        .onClick(() => {
          this.showOverlay = !this.showOverlay;
        })
        .bindPopup(this.showOverlay, {
          message: 'PopupOptions levelMode OVERLAY',
          levelMode: LevelMode.OVERLAY,
          onStateChange: (e: PopupStateChangeParam) => {
            if (!e.isVisible) {
              this.showOverlay = false;
            }
          }
        })
      Button('levelMode EMBEDDED')
        .id('btn_popup_level_embedded')
        .onClick(() => {
          this.showEmbedded = !this.showEmbedded;
        })
        .bindPopup(this.showEmbedded, {
          message: 'PopupOptions levelMode EMBEDDED',
          levelMode: LevelMode.EMBEDDED,
          onStateChange: (e: PopupStateChangeParam) => {
            if (!e.isVisible) {
              this.showEmbedded = false;
            }
          }
        })
      Button('EMBEDDED then navigate')
        .id('btn_popup_level_embedded_nav')
        .onClick(() => {
          this.showEmbeddedNav = true;
        })
        .bindPopup(this.showEmbeddedNav, {
          message: 'PopupOptions EMBEDDED before nav',
          levelMode: LevelMode.EMBEDDED,
          onStateChange: (e: PopupStateChangeParam) => {
            if (!e.isVisible) {
              this.showEmbeddedNav = false;
            }
          }
        })
      Button('go index')
        .id('btn_popup_level_go_index')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'MainAbility/pages/index/index' });
        })
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .justifyContent(FlexAlign.Center)
  }
}
