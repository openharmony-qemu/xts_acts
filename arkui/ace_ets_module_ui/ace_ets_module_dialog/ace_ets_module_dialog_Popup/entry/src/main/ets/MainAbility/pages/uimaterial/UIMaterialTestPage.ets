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

import router from '@ohos.router';
import { uiMaterial } from '@kit.ArkUI';

@Entry
@Component
struct UIMaterialTestPage {
  private materialInfo: uiMaterial.MaterialInfo = uiMaterial.getMaterialInfo();
  @State materialStateValue: number = 0;
  @State materialTypeValue: number = 0;

  aboutToAppear() {
    this.materialStateValue = this.materialInfo.state;
    this.materialTypeValue = this.materialInfo.type;
  }

  build() {
    Column() {
      Text('uiMaterial Test Page')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)

      Text('Test MaterialType, MaterialState, MaterialInfo')
        .fontSize(10)

      Text('MaterialType.IMMERSIVE = 2')
        .id('text_material_type_immersive')
        .fontSize(10)

      Text('MaterialState.DEFAULT = 0')
        .id('text_material_state_default')
        .fontSize(10)

      Text('MaterialState.ENABLE = 1')
        .id('text_material_state_enable')
        .fontSize(10)

      Text('MaterialState.DISABLE = 2')
        .id('text_material_state_disable')
        .fontSize(10)

      Text('getMaterialInfo() Result:')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)

      Text('MaterialInfo.state = ' + this.materialStateValue)
        .id('text_material_info_state')
        .fontSize(10)

      Text('MaterialInfo.type = ' + this.materialTypeValue)
        .id('text_material_info_type')
        .fontSize(10)


      Text('uiMaterial.Material.empty Test:')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)

      Column() {
        Text('Material.empty applied')
      }
      .backgroundColor(Color.Pink)
      .justifyContent(FlexAlign.Center)
      .id('column_empty_material')
      .systemMaterial(uiMaterial.Material.empty)


      Row() {
        Button('DEFAULT')
          .id('btn_state_default')
          .onClick(() => {
            console.info('MaterialState.DEFAULT = ' + uiMaterial.MaterialState.DEFAULT);
          })
          .height('5%')

        Button('ENABLE')
          .id('btn_state_enable')
          .onClick(() => {
            console.info('MaterialState.ENABLE = ' + uiMaterial.MaterialState.ENABLE);
          })
          .height('5%')

        Button('DISABLE')
          .id('btn_state_disable')
          .onClick(() => {
            console.info('MaterialState.DISABLE = ' + uiMaterial.MaterialState.DISABLE);
          })
          .height('5%')
      }

      Row() {
        Button('IMMERSIVE')
          .id('btn_type_immersive')
          .onClick(() => {
            console.info('MaterialType.IMMERSIVE = ' + uiMaterial.MaterialType.IMMERSIVE);
          })
          .height('5%')

        Button('getMaterialInfo')
          .id('btn_get_material_info')
          .onClick(() => {
            let info: uiMaterial.MaterialInfo = uiMaterial.getMaterialInfo();
            console.info('getMaterialInfo state=' + info.state + ', type=' + info.type);
          })
          .height('5%')
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}