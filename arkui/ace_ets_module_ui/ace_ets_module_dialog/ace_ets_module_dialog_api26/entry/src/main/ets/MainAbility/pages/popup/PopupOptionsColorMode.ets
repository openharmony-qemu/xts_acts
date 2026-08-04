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


@Entry
@Component
struct PopupOptionsColorMode {
  @State showFollowSystem: boolean = false;
  @State showFollowTarget: boolean = false;
  @State showLightTheme: boolean = false;
  @State showDarkTheme: boolean = false;

  build() {
    Column({ space: 12 }) {
      Text('PopupOptions.colorMode').fontSize(18).fontWeight(FontWeight.Bold)
        .id('popup_options_colormode_title')
      WithTheme({ colorMode: ThemeColorMode.LIGHT }) {
        Column({ space: 10 }) {
          Button('FOLLOW_SYSTEM')
            .id('btn_popup_color_follow_system')
            .onClick(() => {
              this.showFollowSystem = !this.showFollowSystem;
            })
            .bindPopup(this.showFollowSystem, {
              message: 'PopupOptions colorMode FOLLOW_SYSTEM',
              placement: Placement.Bottom,
              colorMode: AnchoredColorMode.FOLLOW_SYSTEM,
              onStateChange: (e: PopupStateChangeParam) => {
                if (!e.isVisible) {
                  this.showFollowSystem = false;
                }
              }
            })
          Button('FOLLOW_TARGET')
            .id('btn_popup_color_follow_target')
            .onClick(() => {
              this.showFollowTarget = !this.showFollowTarget;
            })
            .bindPopup(this.showFollowTarget, {
              message: 'PopupOptions colorMode FOLLOW_TARGET',
              placement: Placement.Bottom,
              colorMode: AnchoredColorMode.FOLLOW_TARGET,
              onStateChange: (e: PopupStateChangeParam) => {
                if (!e.isVisible) {
                  this.showFollowTarget = false;
                }
              }
            })
        }
      }
      WithTheme({ colorMode: ThemeColorMode.DARK }) {
        Column({ space: 10 }) {
          Button('DARK_THEME_TARGET')
            .id('btn_popup_color_dark_theme')
            .onClick(() => {
              this.showDarkTheme = !this.showDarkTheme;
            })
            .bindPopup(this.showDarkTheme, {
              message: 'PopupOptions colorMode dark theme',
              placement: Placement.Bottom,
              colorMode: AnchoredColorMode.FOLLOW_TARGET,
              onStateChange: (e: PopupStateChangeParam) => {
                if (!e.isVisible) {
                  this.showDarkTheme = false;
                }
              }
            })
          Button('LIGHT_FOLLOW_SYSTEM')
            .id('btn_popup_color_light_follow')
            .onClick(() => {
              this.showLightTheme = !this.showLightTheme;
            })
            .bindPopup(this.showLightTheme, {
              message: 'PopupOptions colorMode light follow system',
              placement: Placement.Bottom,
              colorMode: AnchoredColorMode.FOLLOW_SYSTEM,
              onStateChange: (e: PopupStateChangeParam) => {
                if (!e.isVisible) {
                  this.showLightTheme = false;
                }
              }
            })
        }
      }
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .justifyContent(FlexAlign.Center)
  }
}
