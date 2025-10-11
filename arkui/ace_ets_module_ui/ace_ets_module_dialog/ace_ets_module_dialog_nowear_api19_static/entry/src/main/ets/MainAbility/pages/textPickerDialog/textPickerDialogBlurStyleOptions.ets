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

import {
  $r,
  AdaptiveColor,
  BackgroundBlurStyleOptions,
  BackgroundEffectOptions,
  BlurStyleActivePolicy,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ItemAlign,
  Margin,
  Row,
  SizeOptions,
  Text,
  TextPickerResult,
  ThemeColorMode
} from '@ohos.arkui.component'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct textPickerDialog1 {
  @State v: string = '';
  uiContext: UIContext = this.getUIContext();
  private select: undefined | int | Array<int> = 0 as undefined | int | Array<int>;
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4', 'banana5'];

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('TextPickerDialog_Options001')
        .id('TextPickerDialog_Options001')
        .onClick((e: ClickEvent) => {
          this.uiContext.showTextPickerDialog({
            // 建议使用 this.getUIContext().showTextPickerDialog()接口
            range: this.fruits,
            selected: this.select,
            value: this.v,
            defaultPickerItemHeight: 40,
            onAccept: (value: TextPickerResult) => {
              // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
              this.select = value.index
              console.log(this.select + '')
              // 点击确定后，被选到的文本数据展示到页面
              this.v = value.value as string
              console.info('TextPickerDialog:onAccept()' + JSON.stringify(value))
            },
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE,
              adaptiveColor: AdaptiveColor.AVERAGE,
              scale: 0,
              colorMode: ThemeColorMode.LIGHT,
              inactiveColor: Color.Pink,
              blurOptions: {
                grayscale: [20, 100]
              }
            } as BackgroundBlurStyleOptions
          })
        })
      Button('TextPickerDialog_Options002')
        .id('TextPickerDialog_Options002')
        .onClick((e: ClickEvent) => {
          this.uiContext.showTextPickerDialog({
            // 建议使用 this.getUIContext().showTextPickerDialog()接口
            range: this.fruits,
            selected: this.select,
            value: this.v,
            defaultPickerItemHeight: 40,
            onAccept: (value: TextPickerResult) => {
              // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
              this.select = value.index
              console.log(this.select + '')
              // 点击确定后，被选到的文本数据展示到页面
              this.v = value.value as string
              console.info('TextPickerDialog:onAccept()' + JSON.stringify(value))
            },
            backgroundBlurStyleOptions: {
              policy: undefined,
              adaptiveColor: undefined,
              scale: undefined,
              colorMode: undefined,
              inactiveColor: undefined,
              blurOptions: undefined,
            } as BackgroundBlurStyleOptions
          })
        })
      Button('TextPickerDialog_Options003')
        .id('TextPickerDialog_Options003')
        .onClick((e: ClickEvent) => {
          this.uiContext.showTextPickerDialog({
            // 建议使用 this.getUIContext().showTextPickerDialog()接口
            range: this.fruits,
            selected: this.select,
            value: this.v,
            defaultPickerItemHeight: 40,
            onAccept: (value: TextPickerResult) => {
              // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
              this.select = value.index
              console.log(this.select + '')
              // 点击确定后，被选到的文本数据展示到页面
              this.v = value.value as string
              console.info('TextPickerDialog:onAccept()' + JSON.stringify(value))
            },

          })
        })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' } as SizeOptions)
  }
}