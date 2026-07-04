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

import { uiMaterial } from '@kit.ArkUI';
import router from '@ohos.router';
import { Size } from '@ohos/hypium';

@Entry
@Component
struct MenuSystemMaterialTestPage {
  @State resultText: string = 'Ready';
  selectOptions: SelectOption[] = [
    { value: 'Option1' },
    { value: 'Option2' },
    { value: 'Option3' },
    { value: 'Option4' },
    { value: 'Option5' }
  ];

  build() {
    Scroll() {
      Column() {
        Text('menuSystemMaterial Test')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)
          .id('title_text')

        Text(this.resultText)
          .fontSize(10)
          .id('result_text')

        Text('ImmersiveStyle Tests')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)
          .id('section_style')

        Text('Enum Value Tests')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)
          .id('section_enum')

        Row() {
          Button('Check ImmersiveStyle')
            .id('btn_check_style')
            .height('10vp')
            .width('20%')
            .onClick(() => {
              this.resultText = 'ULTRA_THIN=' + uiMaterial.ImmersiveStyle.ULTRA_THIN +
                ', THIN=' + uiMaterial.ImmersiveStyle.THIN +
                ', REGULAR=' + uiMaterial.ImmersiveStyle.REGULAR +
                ', THICK=' + uiMaterial.ImmersiveStyle.THICK +
                ', ULTRA_THICK=' + uiMaterial.ImmersiveStyle.ULTRA_THICK;
            })

          Button('Check MaterialState')
            .id('btn_check_state')
            .height('10vp')
            .width('20%')
            .onClick(() => {
              let info = uiMaterial.getMaterialInfo();
              this.resultText = 'MaterialState.DEFAULT=' + uiMaterial.MaterialState.DEFAULT +
                ', ENABLE=' + uiMaterial.MaterialState.ENABLE +
                ', DISABLE=' + uiMaterial.MaterialState.DISABLE +
                ', Current=' + info.state;
            })

          Button('Check MaterialType')
            .id('btn_check_type')
            .height('10vp')
            .width('20%')
            .onClick(() => {
              let info = uiMaterial.getMaterialInfo();
              this.resultText = 'MaterialType.IMMERSIVE=' + uiMaterial.MaterialType.IMMERSIVE +
                ', Current=' + info.type;
            })

          Button('Check empty')
            .id('btn_check_empty')
            .height('10vp')
            .width('20%')
            .onClick(() => {
              let emptyMat = uiMaterial.Material.empty;
              this.resultText = 'Material.empty is ' + (emptyMat === uiMaterial.Material.empty ? 'valid empty object' : 'unknown');
            })

        }


        Text('Return Value Tests')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)
          .id('section_return')

        Row() {
          Button('Check ReturnValue')
            .id('btn_check_return')
            .height('10vp')
            .width('20%')
            .onClick(() => {
              this.resultText = 'menuSystemMaterial returns SelectAttribute for chaining';
            })

          Select(this.selectOptions)
            .value('ChainTest')
            .id('select_chain')
            .width('20%')
            .controlSize(ControlSize.SMALL)
            .font({
              size: 10
            })
            .menuSystemMaterial(new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.THICK
            }))
            .selected(0)
            .fontColor(Color.Blue)

          Select(this.selectOptions)
            .controlSize(ControlSize.NORMAL)
            .value('ULTRA_THIN')
            .id('select_ultra_thin')
            .width('20%')
            .controlSize(ControlSize.SMALL)
            .font({
              size: 10
            })
            .padding(0)
            .menuSystemMaterial(new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.ULTRA_THIN
            }))
          Select(this.selectOptions)
            .value('THIN')
            .id('select_thin')
            .width('20%')
            .controlSize(ControlSize.SMALL)
            .font({
              size: 10
            })
            .menuSystemMaterial(new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.THIN
            }))
        }

        Row() {
          Select(this.selectOptions)
            .value('REGULAR')
            .id('select_regular')
            .width('20%')
            .controlSize(ControlSize.SMALL)
            .font({
              size: 10
            })
            .padding(0)
            .menuSystemMaterial(new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.REGULAR
            }))

          Select(this.selectOptions)
            .value('THICK')
            .id('select_thick')
            .width('20%')
            .controlSize(ControlSize.SMALL)
            .font({
              size: 10
            })
            .padding(0)
            .menuSystemMaterial(new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.THICK
            }))

          Select(this.selectOptions)
            .value('ULTRA_THICK')
            .id('select_ultra_thick')
            .width('20%')
            .controlSize(ControlSize.SMALL)
            .font({
              size: 10
            })
            .padding(0)
            .menuSystemMaterial(new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.ULTRA_THICK
            }))

          Select(this.selectOptions)
            .value('Default(no param)')
            .id('select_default_options')
            .width('20%')
            .controlSize(ControlSize.SMALL)
            .font({
              size: 10
            })
            .padding(0)
            .menuSystemMaterial(new uiMaterial.ImmersiveMaterial())
        }


        Text('ImmersiveOptions Params Tests')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)
          .id('section_options')

        Row() {
          Select(this.selectOptions)
            .value('materialColor')
            .id('select_material_color')
            .width('20%')
            .controlSize(ControlSize.SMALL)
            .font({
              size: 10
            })
            .padding(0)
            .menuSystemMaterial(new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.THICK,
              materialColor: '#33FF0000'
            }))

          Select(this.selectOptions)
            .value('colorInvert=true')
            .id('select_color_invert_true')
            .width('20%')
            .controlSize(ControlSize.SMALL)
            .font({
              size: 10
            })
            .padding(0)
            .menuSystemMaterial(new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.THIN,
              colorInvert: true
            }))
          Select(this.selectOptions)
            .value('colorInvert=false')
            .id('select_color_invert_false')
            .width('20%')
            .controlSize(ControlSize.SMALL)
            .font({
              size: 10
            })
            .padding(0)
            .menuSystemMaterial(new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.THIN,
              colorInvert: false
            }))

          Select(this.selectOptions)
            .value('applyShadow=true')
            .id('select_apply_shadow_true')
            .width('20%')
            .controlSize(ControlSize.SMALL)
            .font({
              size: 10
            })
            .padding(0)
            .menuSystemMaterial(new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.THICK,
              applyShadow: true
            }))
        }

        Row({ space: 10 }) {
          Select(this.selectOptions)
            .value('applyShadow=false')
            .id('select_apply_shadow_false')
            .width('20%')
            .controlSize(ControlSize.SMALL)
            .font({
              size: 10
            })
            .padding(0)
            .menuSystemMaterial(new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.THICK,
              applyShadow: false
            }))

          Select(this.selectOptions)
            .value('All Options')
            .id('select_all_options')
            .width('20%')
            .controlSize(ControlSize.SMALL)
            .font({
              size: 10
            })
            .padding(0)
            .menuSystemMaterial(new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.REGULAR,
              materialColor: '#330000FF',
              colorInvert: true,
              applyShadow: true
            }))
          Select(this.selectOptions)
            .value('undefined')
            .id('select_undefined')
            .width('20%')
            .controlSize(ControlSize.SMALL)
            .font({
              size: 10
            })
            .padding(0)
            .menuSystemMaterial(undefined)

          Select(this.selectOptions)
            .value('Material.empty')
            .id('select_empty')
            .width('20%')
            .controlSize(ControlSize.SMALL)
            .font({
              size: 10
            })
            .padding(0)
            .menuSystemMaterial(uiMaterial.Material.empty)
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}