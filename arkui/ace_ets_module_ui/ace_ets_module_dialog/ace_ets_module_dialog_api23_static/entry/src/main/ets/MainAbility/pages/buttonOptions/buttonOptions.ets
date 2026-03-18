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

'use static'

import {
  Blank,
  Font,
  TextAlign,
  ClickEvent,
  Divider,
  Component,
  Column,
  ColumnOptions,
  StackOptions,
  Button,
  $r,
  Stack,
  Alignment,
  AttributeModifier,
  ButtonAttribute,
  ButtonLabelStyle,
  ButtonStyleMode,
  ButtonRole,
  Entry,
  Row,
  Text,
  FlexAlign
} from '@ohos.arkui.component';
import hilog from '@ohos.hilog';
import { CustomDialogController } from '@ohos.arkui.component';
import { TipsDialog } from '@ohos.arkui.advanced.Dialog';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ButtonOptions {
  // Dialog 1: NORMAL + NORMAL (primaryButton)
  dialogController1: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      content: '测试 NORMAL + NORMAL',
      primaryButton: {
        value: '取消',
        action: () => {
          AppStorage.setOrCreate<string>('buttonValue', '取消');
          AppStorage.setOrCreate<boolean>('buttonActionCalled', true);
          AppStorage.setOrCreate<number>('buttonStyle', ButtonStyleMode.NORMAL);
          AppStorage.setOrCreate<number>('buttonRole', ButtonRole.NORMAL);
        },
        buttonStyle: ButtonStyleMode.NORMAL,
        role: ButtonRole.NORMAL,
      },
    }),
  })

  // Dialog 2: NORMAL + ERROR (secondaryButton)
  dialogController2: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      content: '测试 NORMAL + ERROR',
      secondaryButton: {
        value: '删除',
        action: () => {
          AppStorage.setOrCreate<string>('buttonValue', '删除');
          AppStorage.setOrCreate<boolean>('buttonActionCalled', true);
          AppStorage.setOrCreate<number>('buttonStyle', ButtonStyleMode.NORMAL);
          AppStorage.setOrCreate<number>('buttonRole', ButtonRole.ERROR);
        },
        buttonStyle: ButtonStyleMode.NORMAL,
        role: ButtonRole.ERROR,
      },
    }),
  })

  // Dialog 3: EMPHASIZED + NORMAL
  dialogController3: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      content: '测试 EMPHASIZED + NORMAL',
      primaryButton: {
        value: '确认',
        action: () => {
          AppStorage.setOrCreate<string>('buttonValue', '确认');
          AppStorage.setOrCreate<boolean>('buttonActionCalled', true);
          AppStorage.setOrCreate<number>('buttonStyle', ButtonStyleMode.EMPHASIZED);
          AppStorage.setOrCreate<number>('buttonRole', ButtonRole.NORMAL);
        },
        buttonStyle: ButtonStyleMode.EMPHASIZED,
        role: ButtonRole.NORMAL,
      },
    }),
  })

  // Dialog 4: EMPHASIZED + ERROR
  dialogController4: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      content: '测试 EMPHASIZED + ERROR',
      secondaryButton: {
        value: '危险操作',
        action: () => {
          AppStorage.setOrCreate<string>('buttonValue', '危险操作');
          AppStorage.setOrCreate<boolean>('buttonActionCalled', true);
          AppStorage.setOrCreate<number>('buttonStyle', ButtonStyleMode.EMPHASIZED);
          AppStorage.setOrCreate<number>('buttonRole', ButtonRole.ERROR);
        },
        buttonStyle: ButtonStyleMode.EMPHASIZED,
        role: ButtonRole.ERROR,
      },
    }),
  })

  // Dialog 5: TEXTUAL + NORMAL
  dialogController5: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      content: '测试 TEXTUAL + NORMAL',
      primaryButton: {
        value: '文本按钮',
        action: () => {
          AppStorage.setOrCreate<string>('buttonValue', '文本按钮');
          AppStorage.setOrCreate<boolean>('buttonActionCalled', true);
          AppStorage.setOrCreate<number>('buttonStyle', ButtonStyleMode.TEXTUAL);
          AppStorage.setOrCreate<number>('buttonRole', ButtonRole.NORMAL);
        },
        buttonStyle: ButtonStyleMode.TEXTUAL,
        role: ButtonRole.NORMAL,
      },
    }),
  })

  // Dialog 6: TEXTUAL + ERROR
  dialogController6: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('sys.media.ohos_ic_public_voice'),
      content: '测试 TEXTUAL + ERROR',
      secondaryButton: {
        value: '文本错误',
        action: () => {
          AppStorage.setOrCreate<string>('buttonValue', '文本错误');
          AppStorage.setOrCreate<boolean>('buttonActionCalled', true);
          AppStorage.setOrCreate<number>('buttonStyle', ButtonStyleMode.TEXTUAL);
          AppStorage.setOrCreate<number>('buttonRole', ButtonRole.ERROR);
        },
        buttonStyle: ButtonStyleMode.TEXTUAL,
        role: ButtonRole.ERROR,
      },
    }),
  })

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Button("NORMAL + NORMAL")
        .id('btnButtonOptions1')
        .width(240)
        .height(60)
        .onClick(() => {
          this.dialogController1.open()
        })
      Button("NORMAL + ERROR")
        .id('btnButtonOptions2')
        .width(240)
        .height(60)
        .onClick(() => {
          this.dialogController2.open()
        })
      Button("EMPHASIZED + NORMAL")
        .id('btnButtonOptions3')
        .width(240)
        .height(60)
        .onClick(() => {
          this.dialogController3.open()
        })
      Button("EMPHASIZED + ERROR")
        .id('btnButtonOptions4')
        .width(240)
        .height(60)
        .onClick(() => {
          this.dialogController4.open()
        })
      Button("TEXTUAL + NORMAL")
        .id('btnButtonOptions5')
        .width(240)
        .height(60)
        .onClick(() => {
          this.dialogController5.open()
        })
      Button("TEXTUAL + ERROR")
        .id('btnButtonOptions6')
        .width(240)
        .height(60)
        .onClick(() => {
          this.dialogController6.open()
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}