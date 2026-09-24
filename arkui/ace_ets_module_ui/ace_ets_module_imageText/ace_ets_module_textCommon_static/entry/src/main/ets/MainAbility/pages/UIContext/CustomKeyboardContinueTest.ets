'use static';
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

import { CustomKeyboardContinueFeature } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {
  Entry,
  Component,
  State,
  UIContext,
  Column,
  Row,
  Button,
  Text,
  Scroll,
  FontWeight,
  Divider,
  ColumnOptions,
  RowOptions
} from '@kit.ArkUI';

@Entry
@Component
struct CustomKeyboardContinueTest {
  @State currentFeature: string = '未设置';
  @State callResult: string = '';
  uiContext: UIContext | undefined = undefined;

  aboutToAppear(): void {
    this.uiContext = this.getUIContext();
  }

  build() {
    Scroll() {
      Column({ space: 20 } as ColumnOptions) {
        Text('setCustomKeyboardContinueFeature Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Text(`Current Feature: ${this.currentFeature}`)
          .id('text_current_feature')
          .fontSize(16)
          .width('90%')
          .height('5%')

        Text(`Call Result: ${this.callResult}`)
          .id('text_call_result')
          .fontSize(16)
          .width('90%')
          .height('5%')

        Divider()

        Row({ space: 10 } as RowOptions) {
          Button('Set ENABLED')
            .id('btn_set_enabled')
            .width('30%')
            .onClick(() => {
              try {
                this.getUIContext().setCustomKeyboardContinueFeature(CustomKeyboardContinueFeature.ENABLED);
                this.currentFeature = 'ENABLED';
                this.callResult = 'success';
                AppStorage.setOrCreate<number>('CustomKeyboardContinueFeature', CustomKeyboardContinueFeature.ENABLED);
                AppStorage.setOrCreate<string>('CustomKeyboardContinueFeature_Result', 'success');
              } catch (e) {
                this.callResult = 'error';
                AppStorage.setOrCreate<string>('CustomKeyboardContinueFeature_Result', 'error');
              }
            })

          Button('Set DISABLED')
            .id('btn_set_disabled')
            .width('30%')
            .onClick(() => {
              try {
                this.getUIContext().setCustomKeyboardContinueFeature(CustomKeyboardContinueFeature.DISABLED);
                this.currentFeature = 'DISABLED';
                this.callResult = 'success';
                AppStorage.setOrCreate<number>('CustomKeyboardContinueFeature', CustomKeyboardContinueFeature.DISABLED);
                AppStorage.setOrCreate<string>('CustomKeyboardContinueFeature_Result', 'success');
              } catch (e) {
                this.callResult = 'error';
                AppStorage.setOrCreate<string>('CustomKeyboardContinueFeature_Result', 'error');
              }
            })
        }
        .height('5%')

        Row({ space: 10 } as RowOptions) {
          Button('Set Number 0')
            .id('btn_set_number_0')
            .width('30%')
            .onClick(() => {
              try {
                this.getUIContext().setCustomKeyboardContinueFeature(0 as CustomKeyboardContinueFeature);
                this.currentFeature = 'NUMBER_0';
                this.callResult = 'success';
                AppStorage.setOrCreate<string>('CustomKeyboardContinueFeature_Number', '0');
                AppStorage.setOrCreate<string>('CustomKeyboardContinueFeature_Result', 'success');
              } catch (e) {
                this.callResult = 'error';
                AppStorage.setOrCreate<string>('CustomKeyboardContinueFeature_Result', 'error');
              }
            })

          Button('Set Number 1')
            .id('btn_set_number_1')
            .width('30%')
            .onClick(() => {
              try {
                this.getUIContext().setCustomKeyboardContinueFeature(1 as CustomKeyboardContinueFeature);
                this.currentFeature = 'NUMBER_1';
                this.callResult = 'success';
                AppStorage.setOrCreate<string>('CustomKeyboardContinueFeature_Number', '1');
                AppStorage.setOrCreate<string>('CustomKeyboardContinueFeature_Result', 'success');
              } catch (e) {
                this.callResult = 'error';
                AppStorage.setOrCreate<string>('CustomKeyboardContinueFeature_Result', 'error');
              }
            })
        }
        .height('5%')

        Row({ space: 10 } as RowOptions) {
          Button('Set Invalid 3')
            .id('btn_set_invalid_3')
            .width('30%')
            .onClick(() => {
              try {
                this.getUIContext().setCustomKeyboardContinueFeature(3 as CustomKeyboardContinueFeature);
                this.currentFeature = 'INVALID_3';
                this.callResult = 'success';
                AppStorage.setOrCreate<string>('CustomKeyboardContinueFeature_Invalid', '3');
                AppStorage.setOrCreate<string>('CustomKeyboardContinueFeature_Result', 'success');
              } catch (e) {
                this.callResult = 'error';
                AppStorage.setOrCreate<string>('CustomKeyboardContinueFeature_Result', 'error');
              }
            })
        }
        .height('5%')
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
