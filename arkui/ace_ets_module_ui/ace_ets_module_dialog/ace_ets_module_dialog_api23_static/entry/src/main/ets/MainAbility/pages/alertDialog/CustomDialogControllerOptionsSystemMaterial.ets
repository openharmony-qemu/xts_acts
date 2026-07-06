'use static';
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

import { CustomContentDialog } from '@ohos.arkui.advanced.Dialog';
import {
  Builder,
  Button,
  ButtonRole,
  ButtonStyleMode,
  Column,
  Component,
  CustomDialogController,
  Entry,
  FlexAlign,
  Text,
  ClickEvent,
  Menu,
  MenuItem,
  MenuItemOptions,
  ResponseType,
  MenuGridPosition,
  ContextMenuOptions,
  MenuGridStyleOptions,
} from '@ohos.arkui.component';

import {
  uiMaterial,
  AnchoredColorMode,
} from '@kit.ArkUI';

@Entry
@Component
struct CustomDialogControllerOptionsSystemMaterial {
  dialogController1: CustomDialogController = new CustomDialogController({
    builder: CustomContentDialog({
      primaryTitle: '标题',
      secondaryTitle: '辅助文本',
      contentAreaPadding: { top: 0, bottom: 0 },
      contentBuilder: () => {
        this.buildContent();
      },
      buttons: [{
        value: '按钮1', buttonStyle: ButtonStyleMode.TEXTUAL, action: () => {
          console.info('Callback when the button is clicked')
        }
      }, { value: '按钮2', buttonStyle: ButtonStyleMode.TEXTUAL, role: ButtonRole.ERROR }],
    }),
    systemMaterial: undefined
  });

  dialogController2: CustomDialogController = new CustomDialogController({
    builder: CustomContentDialog({
      primaryTitle: '标题',
      secondaryTitle: '辅助文本',
      contentAreaPadding: { top: 0, bottom: 0 },
      contentBuilder: () => {
        this.buildContent();
      },
      buttons: [{
        value: '按钮1', buttonStyle: ButtonStyleMode.TEXTUAL, action: () => {
          console.info('Callback when the button is clicked')
        }
      }, { value: '按钮2', buttonStyle: ButtonStyleMode.TEXTUAL, role: ButtonRole.ERROR }],
    }),
    systemMaterial: undefined,
  });

  dialogController3: CustomDialogController = new CustomDialogController({
    builder: CustomContentDialog({
      primaryTitle: '标题',
      secondaryTitle: '辅助文本',
      contentAreaPadding: { top: 0, bottom: 0 },
      contentBuilder: () => {
        this.buildContent();
      },
      buttons: [{
        value: '按钮1', buttonStyle: ButtonStyleMode.TEXTUAL, action: () => {
          console.info('Callback when the button is clicked')
        }
      }, { value: '按钮2', buttonStyle: ButtonStyleMode.TEXTUAL, role: ButtonRole.ERROR }],
    }),
    systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT })
  });

  dialogController4: CustomDialogController = new CustomDialogController({
    builder: CustomContentDialog({
      primaryTitle: '标题',
      secondaryTitle: '辅助文本',
      contentAreaPadding: { top: 0, bottom: 0 },
      contentBuilder: () => {
        this.buildContent();
      },
      buttons: [{
        value: '按钮1', buttonStyle: ButtonStyleMode.TEXTUAL, action: () => {
          console.info('Callback when the button is clicked')
        }
      }, { value: '按钮2', buttonStyle: ButtonStyleMode.TEXTUAL, role: ButtonRole.ERROR }],
    }),
    systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THICK }),
  });

  dialogController5: CustomDialogController = new CustomDialogController({
    builder: CustomContentDialog({
      primaryTitle: '标题',
      secondaryTitle: '辅助文本',
      contentAreaPadding: { top: 0, bottom: 0 },
      contentBuilder: () => {
        this.buildContent();
      },
      buttons: [{
        value: '按钮1', buttonStyle: ButtonStyleMode.TEXTUAL, action: () => {
          console.info('Callback when the button is clicked')
        }
      }, { value: '按钮2', buttonStyle: ButtonStyleMode.TEXTUAL, role: ButtonRole.ERROR }],
    }),
    systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN }),
  });

  @Builder
  MenuBuilderWithParam(type: ResponseType): void {
    Column() {
      if (type === ResponseType.LongPress) {
        Menu() {
          MenuItem({ content: '菜单1' } as MenuItemOptions)
          MenuItem({ content: '菜单2' } as MenuItemOptions)
        }
      }
    }
  }

  dialogController6: CustomDialogController = new CustomDialogController({
    builder: CustomContentDialog({
      primaryTitle: '标题',
      secondaryTitle: '辅助文本',
      contentAreaPadding: { top: 0, bottom: 0 },
      contentBuilder: () => {
        this.buildContent();
      },
      buttons: [{
        value: '按钮1', buttonStyle: ButtonStyleMode.TEXTUAL, action: () => {
          console.info('Callback when the button is clicked')
        }
      }, { value: '按钮2', buttonStyle: ButtonStyleMode.TEXTUAL, role: ButtonRole.ERROR }],
    }),
    systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.NONE }),
  });

  build() {
    Column() {
      Button('CustomContentDialog1')
        .onClick((e:ClickEvent) => {
          this.dialogController1.open()
        })

      Button('CustomContentDialog2')
        .onClick((e:ClickEvent) => {
          this.dialogController2.open()
        })

      Button('CustomContentDialog3')
        .onClick((e:ClickEvent) => {
          this.dialogController3.open()
        })

      Button('CustomContentDialog4')
        .onClick((e:ClickEvent) => {
          this.dialogController4.open()
        })

      Button('CustomContentDialog5')
        .onClick((e:ClickEvent) => {
          this.dialogController5.open()
        })

      Button('CustomContentDialog6')
        .onClick((e:ClickEvent) => {
          this.dialogController6.open()
        })

      // 新增 colorMode and gridStyle position
      Text('colorMode and gridStyle position').height('10%')
        .bindContextMenuWithResponse(this.MenuBuilderWithParam, {
          colorMode: AnchoredColorMode.FOLLOW_SYSTEM,
          gridStyle: { count: 4, position: MenuGridPosition.TOP } as MenuGridStyleOptions,
        } as ContextMenuOptions)

      Text('colorMode and gridStyle position').height('10%')
        .bindContextMenuWithResponse(this.MenuBuilderWithParam, {
          colorMode: AnchoredColorMode.FOLLOW_TARGET,
          gridStyle: { count: 4, position: MenuGridPosition.BOTTOM } as MenuGridStyleOptions,
        } as ContextMenuOptions)

      Text('enum13').height('10%')
        .bindContextMenuWithResponse(this.MenuBuilderWithParam, {
          gridStyle: { count: 4 } as MenuGridStyleOptions,
        } as ContextMenuOptions)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  buildContent(): void {
    Column() {
      Text('内容区')
    }
  }
}
