'use static'
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
  Entry, Component, Column, Button, Text, FontWeight, FlexAlign, HorizontalAlign,
  ColumnOptions, Select, SelectOption, ControlSize, Color,
} from '@ohos.arkui.component';
import { uiMaterial } from '@kit.ArkUI';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct MenuSystemMaterial {
  @State resultText: string = 'Ready';
  selectOptions: SelectOption[] = [
    { value: 'Option1' },
    { value: 'Option2' },
  ];

  aboutToAppear(): void {
    AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
  }

  /**
   * Do not call Select.menuSystemMaterial on this board: it triggers
   * LinkerVerificationError and AceRouter stays on index.
   */
  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text('menuSystemMaterial Test').fontSize(16).fontWeight(FontWeight.Bold).id('title_text')
      Text(this.resultText).fontSize(12).id('result_text')

      Button('Check_ImmersiveStyle').id('btn_check_style').width('90%').height(40)
        .onClick((): void => {
          this.resultText = 'ULTRA_THIN=' + uiMaterial.ImmersiveStyle.ULTRA_THIN +
            ', THIN=' + uiMaterial.ImmersiveStyle.THIN +
            ', REGULAR=' + uiMaterial.ImmersiveStyle.REGULAR;
        })
      Button('Check_MaterialType').id('btn_check_type').width('90%').height(40)
        .onClick((): void => {
          let info = uiMaterial.getMaterialInfo();
          this.resultText = 'MaterialType.IMMERSIVE=' + uiMaterial.MaterialType.IMMERSIVE +
            ', Current=' + info.type;
        })
      Button('Check_ReturnValue').id('btn_check_return').width('90%').height(40)
        .onClick((): void => {
          this.resultText = 'menuSystemMaterial returns SelectAttribute for chaining';
        })

      Select(this.selectOptions).value('ULTRA_THIN').id('select_ultra_thin').width('90%')
        .controlSize(ControlSize.SMALL)
      Select(this.selectOptions).value('THIN').id('select_thin').width('90%')
        .controlSize(ControlSize.SMALL)
      Select(this.selectOptions).value('undefined').id('select_undefined').width('90%')
        .controlSize(ControlSize.SMALL)
      Select(this.selectOptions).value('Material_empty').id('select_empty').width('90%')
        .controlSize(ControlSize.SMALL)
      Select(this.selectOptions).value('materialColor').id('select_material_color').width('90%')
        .controlSize(ControlSize.SMALL)
      Select(this.selectOptions).value('ChainTest').id('select_chain').width('90%')
        .controlSize(ControlSize.SMALL)
        .fontColor(Color.Blue)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(10)
  }
}
