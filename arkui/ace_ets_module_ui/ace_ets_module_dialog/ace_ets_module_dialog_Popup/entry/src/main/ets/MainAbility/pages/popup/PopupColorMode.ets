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

@Entry
@Component
struct PopupColorMode {
  @State handlePopup1: boolean = false;
  @State handlePopup2: boolean = false;
  @State handlePopup3: boolean = false;
  @State handlePopup4: boolean = false;

  build() {
    Column() {
      Button('PopupColorMode_FOLLOW_SYSTEM')
        .id('PopupColorMode_FOLLOW_SYSTEM')
        .onClick(() => {
          this.handlePopup1 = !this.handlePopup1;
        })
        .bindPopup(this.handlePopup1, {
          message: 'This is a popup with FOLLOW_SYSTEM',
          placement: Placement.Bottom,
          colorMode: AnchoredColorMode.FOLLOW_SYSTEM,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.handlePopup1 = false;
            }
          }
        })

      Button('PopupColorMode_FOLLOW_TARGET')
        .id('PopupColorMode_FOLLOW_TARGET')
        .onClick(() => {
          this.handlePopup2 = !this.handlePopup2;
        })
        .bindPopup(this.handlePopup2, {
          message: 'This is a popup with FOLLOW_TARGET',
          placement: Placement.Bottom,
          colorMode: AnchoredColorMode.FOLLOW_TARGET,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.handlePopup2 = false;
            }
          }
        })

      Button('PopupColorMode_null')
        .id('PopupColorMode_null')
        .onClick(() => {
          this.handlePopup3 = !this.handlePopup3;
        })
        .bindPopup(this.handlePopup3, {
          message: 'This is a popup with null',
          placement: Placement.Bottom,
          colorMode: null,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.handlePopup3 = false;
            }
          }
        })

      Button('PopupColorMode_undefined')
        .id('PopupColorMode_undefined')
        .onClick(() => {
          this.handlePopup4 = !this.handlePopup4;
        })
        .bindPopup(this.handlePopup4, {
          message: 'This is a popup with undefined',
          placement: Placement.Bottom,
          colorMode: undefined,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.handlePopup4 = false;
            }
          }
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}