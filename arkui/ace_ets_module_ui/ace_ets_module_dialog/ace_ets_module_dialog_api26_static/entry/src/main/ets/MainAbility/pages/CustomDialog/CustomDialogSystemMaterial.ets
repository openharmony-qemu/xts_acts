'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
  Entry, Component, Column, Button, Text, FlexAlign, ColumnOptions,
  CustomDialogController, DialogAlignment, Builder,
} from '@ohos.arkui.component';
import { uiMaterial } from '@kit.ArkUI';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct CustomDialogSystemMaterial {
  undefinedDialog!: CustomDialogController;
  materialDialog!: CustomDialogController;
  immersiveDialog!: CustomDialogController;

  aboutToAppear(): void {
    AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
    this.undefinedDialog = new CustomDialogController({
      builder: (): void => {
        this.materialDialogBuilder(this.undefinedDialog, 'undefined_material');
      },
      alignment: DialogAlignment.Center,
      systemMaterial: undefined,
    });
    this.materialDialog = new CustomDialogController({
      builder: (): void => {
        this.materialDialogBuilder(this.materialDialog, 'Material_SEMI');
      },
      alignment: DialogAlignment.Center,
      systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT }),
    });
    this.immersiveDialog = new CustomDialogController({
      builder: (): void => {
        this.materialDialogBuilder(this.immersiveDialog, 'Immersive_THICK');
      },
      alignment: DialogAlignment.Center,
      systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THICK }),
    });
  }

  @Builder
  materialDialogBuilder(controller: CustomDialogController, label: string): void {
    Column() {
      Text(label).fontSize(18).id('dialog_material_text')
      Button('Close_dialog').id('close_dialog_btn').onClick((): void => { controller.close(); })
    }.padding(20)
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('Open_undefined').id('open_undefined')
        .onClick((): void => { this.undefinedDialog.open(); })
      Button('Open_Material').id('open_material')
        .onClick((): void => { this.materialDialog.open(); })
      Button('Open_ImmersiveMaterial').id('open_immersive')
        .onClick((): void => { this.immersiveDialog.open(); })
    }.width('100%').height('100%').justifyContent(FlexAlign.Center)
  }
}
