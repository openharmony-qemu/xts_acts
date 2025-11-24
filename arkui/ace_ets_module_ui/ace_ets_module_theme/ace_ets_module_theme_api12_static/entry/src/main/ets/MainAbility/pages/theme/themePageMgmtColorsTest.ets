/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { CustomTheme, CustomColors } from '@ohos.arkui.theme';
import {
  Entry, Component,
  Column, ColumnOptions, 
  Flex, FlexDirection, ItemAlign, FlexAlign,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Toggle,WithTheme, Toggle, ToggleType,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

// class ToggleColors implements CustomColors {
//   iconPrimary = '#FFFFFFFF';
//   iconOnPrimary = '#FFD53032'
//   iconSecondary = "#FF00541F"
//   iconTertiary = '#FFD00000'
//   iconFourth = '#1111FF11'
//   iconEmphasize = '#44FF2222' //高亮图标颜色
//   iconSubEmphasize = '#7efca7b1' //高亮辅助图标颜色
//   iconOnSecondary = '#FFD00000' //二级图标反转颜色
//   iconOnTertiary = '#33FF1111' //三级图标反转颜色，用于彩色背景。
//   iconOnFourth = '#ffa9cfa8'
//   backgroundPrimary = '#ff5f66a9'
//   backgroundSecondary = '#ff6b146a'
//   backgroundTertiary = '#ffc396c2'
//   backgroundFourth = '#609d9370'
// }

class PageCustomTheme implements CustomTheme {
  colors?: CustomColors

  constructor(colors: CustomColors) {
    this.colors = colors
  }
}

@Entry
@Component
struct themeTogglePage {
  static readonly themeCount:int = 3;
  themeNames: string[] = ['System', 'Custom (green)'];
  themeArray: Array<CustomTheme | undefined> = new Array<CustomTheme|undefined>(
    undefined, // System
    // new PageCustomTheme(new ToggleColors()),
  )
  @State themeIndex: number = 0;

  build() {
    Column(undefined) {
      Column({ space: '8vp' } as ColumnOptions) {
        Text(`未使用WithTheme`)
        // 点击按钮切换局部换肤
        Button(`切换theme配色：${this.themeNames[this.themeIndex as Int]}`)
          .onClick((e:ClickEvent) => {
            this.themeIndex = (this.themeIndex + 1) % themeTogglePage.themeCount;
          }).key('themeToggleClick')

        // 系统默认按钮配色
        Toggle({ type: ToggleType.Switch, isOn: false })
      }
      .margin({
        top: '50vp'
      } as Margin)

      WithTheme({ theme: this.themeArray[this.themeIndex as Int] }) {
        // WithTheme作用域
        Column({ space: '8vp' } as ColumnOptions) {
          Toggle({ type: ToggleType.Switch, isOn: true }).key('toggleBg')
        }
        .width('100%')
      }
    }
  }
}