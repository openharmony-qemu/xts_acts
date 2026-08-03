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
struct CustomPopupOptionsLevelMode {
  @State showOverlay: boolean = false;
  @State showEmbedded: boolean = false;
  @State showDefault: boolean = false;

  @Builder
  customPopupBuilder(label: string) {
    Column() {
      Text(label).fontSize(16).margin(10).id('custom_popup_level_text')
      Button('dismiss')
        .id('custom_popup_level_dismiss')
        .onClick(() => {
          this.showOverlay = false;
          this.showEmbedded = false;
          this.showDefault = false;
        })
    }
    .padding(12)
    .backgroundColor('#F5F5F5')
  }

  build() {
    Column({ space: 12 }) {
      Text('CustomPopupOptions.levelMode').fontSize(18).fontWeight(FontWeight.Bold)
      Button('custom OVERLAY')
        .id('btn_custom_level_overlay')
        .onClick(() => {
          this.showOverlay = !this.showOverlay;
        })
        .bindPopup(this.showOverlay, {
          builder: (): void => {
            this.customPopupBuilder('CustomPopup OVERLAY');
          },
          levelMode: LevelMode.OVERLAY,
          onStateChange: (e: PopupStateChangeParam) => {
            if (!e.isVisible) {
              this.showOverlay = false;
            }
          }
        })
      Button('custom EMBEDDED')
        .id('btn_custom_level_embedded')
        .onClick(() => {
          this.showEmbedded = !this.showEmbedded;
        })
        .bindPopup(this.showEmbedded, {
          builder: (): void => {
            this.customPopupBuilder('CustomPopup EMBEDDED');
          },
          levelMode: LevelMode.EMBEDDED,
          onStateChange: (e: PopupStateChangeParam) => {
            if (!e.isVisible) {
              this.showEmbedded = false;
            }
          }
        })
      Button('custom default')
        .id('btn_custom_level_default')
        .onClick(() => {
          this.showDefault = !this.showDefault;
        })
        .bindPopup(this.showDefault, {
          builder: (): void => {
            this.customPopupBuilder('CustomPopup default');
          },
          onStateChange: (e: PopupStateChangeParam) => {
            if (!e.isVisible) {
              this.showDefault = false;
            }
          }
        })
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .justifyContent(FlexAlign.Center)
  }
}
