/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { LevelMode } from '@kit.ArkUI';

@Entry
@Component
struct PopupLevelMode {
  @State isShowPopupDefault: boolean = false;
  @State isShowPopupOverlay: boolean = false;
  @State isShowPopupEmbedded: boolean = false;
  @State isShowPopupNull: boolean = false;
  @State isShowPopupUndefined: boolean = false;

  build() {
    Column({ space: 5 }) {
      Row({ space: 5 }) {
        Button('Default')
          .id('popup_default')
          .height('8%')
          .bindPopup(this.isShowPopupDefault, {
            message: 'Popup Default LevelMode Test',
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.isShowPopupDefault = false;
              }
            }
          })
          .onClick(() => {
            this.isShowPopupDefault = !this.isShowPopupDefault;
          })

        Button('OVERLAY')
          .id('popup_overlay')
          .height('8%')
          .bindPopup(this.isShowPopupOverlay, {
            message: 'Popup OVERLAY LevelMode Test',
            levelMode: LevelMode.OVERLAY,
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.isShowPopupOverlay = false;
              }
            }
          })
          .onClick(() => {
            this.isShowPopupOverlay = !this.isShowPopupOverlay;
          })
      }

      Row({ space: 5 }) {
        Button('EMBEDDED')
          .id('popup_embedded')
          .height('8%')
          .bindPopup(this.isShowPopupEmbedded, {
            message: 'Popup EMBEDDED LevelMode Test',
            levelMode: LevelMode.EMBEDDED,
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.isShowPopupEmbedded = false;
              }
            }
          })
          .onClick(() => {
            this.isShowPopupEmbedded = !this.isShowPopupEmbedded;
          })

        Button('Null')
          .id('popup_null')
          .height('8%')
          .bindPopup(this.isShowPopupNull, {
            message: 'Popup Null LevelMode Test',
            levelMode: null,
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.isShowPopupNull = false;
              }
            }
          })
          .onClick(() => {
            this.isShowPopupNull = !this.isShowPopupNull;
          })
      }

      Row({ space: 5 }) {
        Button('Undefined')
          .id('popup_undefined')
          .height('8%')
          .bindPopup(this.isShowPopupUndefined, {
            message: 'Popup Undefined LevelMode Test',
            levelMode: undefined,
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.isShowPopupUndefined = false;
              }
            }
          })
          .onClick(() => {
            this.isShowPopupUndefined = !this.isShowPopupUndefined;
          })
      }
    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
    .width('100%')
  }
}