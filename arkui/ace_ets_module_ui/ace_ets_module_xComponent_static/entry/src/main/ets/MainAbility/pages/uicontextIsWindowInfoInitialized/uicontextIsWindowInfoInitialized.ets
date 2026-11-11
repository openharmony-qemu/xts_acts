'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { Column, ColumnOptions, Button, Text, Entry, Component } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct UIContextIsWindowInfoInitialized {
  aboutToAppear() {
    try {
      const uiContext: UIContext = this.getUIContext();
      const initialized: boolean = uiContext.isWindowInfoInitialized();
      AppStorage.setOrCreate<boolean>('iwii_appear_result', initialized);
      AppStorage.setOrCreate<boolean>('iwii_appear_error', false);
    } catch (e) {
      AppStorage.setOrCreate<boolean>('iwii_appear_error', true);
    }
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text('arkui UIContext isWindowInfoInitialized')
        .fontSize(11)
        .width('100%')
        .height('8%')
        .id('iwii_title');

      Button('check valid context')
        .id('iwii_btn_valid')
        .fontSize(10)
        .width('100%')
        .height('8%')
        .onClick(() => {
          try {
            const uiContext: UIContext = this.getUIContext();
            const initialized: boolean = uiContext.isWindowInfoInitialized();
            AppStorage.setOrCreate<boolean>('iwii_valid_result', initialized);
            AppStorage.setOrCreate<boolean>('iwii_valid_error', false);
          } catch (e) {
            AppStorage.setOrCreate<boolean>('iwii_valid_error', true);
          }
        });

      Button('check calling scope context')
        .id('iwii_btn_calling_scope')
        .fontSize(10)
        .width('100%')
        .height('8%')
        .onClick(() => {
          try {
            const callingContext: UIContext | undefined = UIContext.getCallingScopeUIContext();
            AppStorage.setOrCreate<boolean>('iwii_calling_scope_defined', callingContext !== undefined);
            if (callingContext !== undefined) {
              const initialized: boolean = callingContext.isWindowInfoInitialized();
              AppStorage.setOrCreate<boolean>('iwii_calling_scope_result', initialized);
            }
            AppStorage.setOrCreate<boolean>('iwii_calling_scope_error', false);
          } catch (e) {
            AppStorage.setOrCreate<boolean>('iwii_calling_scope_error', true);
          }
        });

      Button('check repeat calls')
        .id('iwii_btn_repeat')
        .fontSize(10)
        .width('100%')
        .height('8%')
        .onClick(() => {
          try {
            const uiContext: UIContext = this.getUIContext();
            const first: boolean = uiContext.isWindowInfoInitialized();
            const second: boolean = uiContext.isWindowInfoInitialized();
            const third: boolean = uiContext.isWindowInfoInitialized();
            AppStorage.setOrCreate<boolean>('iwii_repeat_first', first);
            AppStorage.setOrCreate<boolean>('iwii_repeat_consistent', first === second && second === third);
            AppStorage.setOrCreate<boolean>('iwii_repeat_error', false);
          } catch (e) {
            AppStorage.setOrCreate<boolean>('iwii_repeat_error', true);
          }
        });

      Button('check return type')
        .id('iwii_btn_type')
        .fontSize(10)
        .width('100%')
        .height('8%')
        .onClick(() => {
          try {
            const uiContext: UIContext = this.getUIContext();
            const initialized: boolean = uiContext.isWindowInfoInitialized();
            AppStorage.setOrCreate<boolean>('iwii_type_is_boolean', typeof initialized === 'boolean');
            AppStorage.setOrCreate<boolean>('iwii_type_error', false);
          } catch (e) {
            AppStorage.setOrCreate<boolean>('iwii_type_error', true);
          }
        });

      Button('check invalid context')
        .id('iwii_btn_invalid')
        .fontSize(10)
        .width('100%')
        .height('8%')
        .onClick(() => {
          try {
            const invalidContext: UIContext = new UIContext();
            const initialized: boolean = invalidContext.isWindowInfoInitialized();
            AppStorage.setOrCreate<boolean>('iwii_invalid_result', initialized);
            AppStorage.setOrCreate<boolean>('iwii_invalid_error', false);
          } catch (e) {
            AppStorage.setOrCreate<boolean>('iwii_invalid_error', true);
          }
        });
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
