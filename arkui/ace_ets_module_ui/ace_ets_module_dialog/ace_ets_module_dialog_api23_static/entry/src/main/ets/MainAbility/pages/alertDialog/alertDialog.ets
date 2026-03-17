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
  Column,
  ColumnOptions,
  Button,
  Text,
  ThemeColorMode,
  FlexAlign,
  Entry,
  Component
} from '@ohos.arkui.component';
import { CustomDialogController } from '@ohos.arkui.component';
import { AlertDialog } from '@ohos.arkui.advanced.Dialog';
import { CustomTheme, CustomColors } from '@ohos.arkui.theme';
import { AppStorage } from '@ohos.arkui.stateManagement';

// Custom theme color implementation
class CustomThemeImpl implements CustomTheme {
  colors?: CustomColors;

  constructor(colors: CustomColors) {
    this.colors = colors;
  }
}

// Custom content text and icon theme colors
class CustomThemeColors implements CustomColors {
  fontPrimary?: string = '#ffd0a300';
  iconSecondary?: string = '#ffd000cd';
}

@Entry
@Component
struct alertDialog {
  customTheme: CustomTheme = new CustomThemeImpl(new CustomThemeColors());

  // Dialog 1: Test primaryTitle
  dialogController1: CustomDialogController = new CustomDialogController({
    builder: AlertDialog({
      primaryTitle: 'Primary Title',
      content: 'Test Content',
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<string>('alertDialogPrimaryTitle', 'Primary Title');
        },
      },
    }),
  })

  // Dialog 2: Test secondaryTitle
  dialogController2: CustomDialogController = new CustomDialogController({
    builder: AlertDialog({
      secondaryTitle: 'Secondary Title',
      content: 'Test Content',
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<string>('alertDialogSecondaryTitle', 'Secondary Title');
        },
      },
    }),
  })

  // Dialog 3: Test content
  dialogController3: CustomDialogController = new CustomDialogController({
    builder: AlertDialog({
      content: 'Test Content',
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<string>('alertDialogContent', 'Test Content');
        },
      },
    }),
  })

  // Dialog 4: Test primaryButton
  dialogController4: CustomDialogController = new CustomDialogController({
    builder: AlertDialog({
      content: 'Test primaryButton',
      primaryButton: {
        value: 'Primary Button',
        action: () => {
          AppStorage.setOrCreate<string>('alertDialogPrimaryButtonValue', 'Primary Button');
          AppStorage.setOrCreate<boolean>('alertDialogPrimaryButtonActionCalled', true);
        },
      },
    }),
  })

  // Dialog 5: Test secondaryButton
  dialogController5: CustomDialogController = new CustomDialogController({
    builder: AlertDialog({
      content: 'Test secondaryButton',
      secondaryButton: {
        value: 'Secondary Button',
        action: () => {
          AppStorage.setOrCreate<string>('alertDialogSecondaryButtonValue', 'Secondary Button');
          AppStorage.setOrCreate<boolean>('alertDialogSecondaryButtonActionCalled', true);
        },
      },
    }),
  })

  // Dialog 6: Test theme
  dialogController6: CustomDialogController = new CustomDialogController({
    builder: AlertDialog({
      content: 'Test custom theme',
      theme: this.customTheme,
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<boolean>('alertDialogThemeSet', true);
        },
      },
    }),
    autoCancel: false,
  })

  // Dialog 7: Test themeColorMode(SYSTEM)
  dialogController7: CustomDialogController = new CustomDialogController({
    builder: AlertDialog({
      content: 'Test SYSTEM mode',
      themeColorMode: ThemeColorMode.SYSTEM,
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<number>('alertDialogThemeColorMode', ThemeColorMode.SYSTEM);
        },
      },
    }),
    autoCancel: false,
  })

  // Dialog 8: Test themeColorMode(LIGHT)
  dialogController8: CustomDialogController = new CustomDialogController({
    builder: AlertDialog({
      content: 'Test LIGHT mode',
      themeColorMode: ThemeColorMode.LIGHT,
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<number>('alertDialogThemeColorMode', ThemeColorMode.LIGHT);
        },
      },
    }),
    autoCancel: false,
  })

  // Dialog 9: Test themeColorMode(DARK)
  dialogController9: CustomDialogController = new CustomDialogController({
    builder: AlertDialog({
      content: 'Test DARK mode',
      themeColorMode: ThemeColorMode.DARK,
      primaryButton: {
        value: 'Confirm',
        action: () => {
          AppStorage.setOrCreate<number>('alertDialogThemeColorMode', ThemeColorMode.DARK);
        },
      },
    }),
    autoCancel: false,
  })

  build() {
    Column({ space: 15 } as ColumnOptions) {
      Button("Test primaryTitle")
        .id('btnAlertDialog1')
        .width(300)
        .height(50)
        .onClick(() => {
          this.dialogController1.open()
        })
      Button("Test secondaryTitle")
        .id('btnAlertDialog2')
        .width(300)
        .height(50)
        .onClick(() => {
          this.dialogController2.open()
        })
      Button("Test content")
        .id('btnAlertDialog3')
        .width(300)
        .height(50)
        .onClick(() => {
          this.dialogController3.open()
        })
      Button("Test primaryButton")
        .id('btnAlertDialog4')
        .width(300)
        .height(50)
        .onClick(() => {
          this.dialogController4.open()
        })
      Button("Test secondaryButton")
        .id('btnAlertDialog5')
        .width(300)
        .height(50)
        .onClick(() => {
          this.dialogController5.open()
        })
      Button("Test theme")
        .id('btnAlertDialog6')
        .width(300)
        .height(50)
        .onClick(() => {
          this.dialogController6.open()
        })
      Button("Test themeColorMode SYSTEM")
        .id('btnAlertDialog7')
        .width(300)
        .height(50)
        .onClick(() => {
          this.dialogController7.open()
        })
      Button("Test themeColorMode LIGHT")
        .id('btnAlertDialog8')
        .width(300)
        .height(50)
        .onClick(() => {
          this.dialogController8.open()
        })
      Button("Test themeColorMode DARK")
        .id('btnAlertDialog9')
        .width(300)
        .height(50)
        .onClick(() => {
          this.dialogController9.open()
        })
    }.margin(20)
    .width('100%').height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
