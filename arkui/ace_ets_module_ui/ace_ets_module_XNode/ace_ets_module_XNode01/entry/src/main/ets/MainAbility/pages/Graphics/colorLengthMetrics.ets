/*
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
import { ColorMetrics, LengthMetrics  } from '@kit.ArkUI';

@Entry
@Component
struct MyStateSample {
  @State colorMetrics: ColorMetrics = ColorMetrics.resourceColor($r('sys.color.font_primary')).autoRefresh!(true)
  @State colorMetrics1: ColorMetrics = ColorMetrics.resourceColor($r('sys.color.font_primary')).autoRefresh!(false)
  @State colorMetrics2: ColorMetrics = ColorMetrics.resourceColor($r('sys.color.font_primary')).autoRefresh!(undefined)
  @State colorMetrics3: ColorMetrics = ColorMetrics.resourceColor($r('sys.color.font_primary')).autoRefresh!(null)
  @State lengthMetrics: LengthMetrics = LengthMetrics.resource($r('sys.float.ohos_id_button_min_width')).autoRefresh!(true)
  @State lengthMetrics1: LengthMetrics = LengthMetrics.resource($r('sys.float.ohos_id_button_min_width')).autoRefresh!(false)
  @State lengthMetrics2: LengthMetrics = LengthMetrics.resource($r('sys.float.ohos_id_button_min_width')).autoRefresh!(undefined)
  @State lengthMetrics3: LengthMetrics = LengthMetrics.resource($r('sys.float.ohos_id_button_min_width')).autoRefresh!(null)

  build() {
    Column() {
      Text('ColorMetrics autoRefresh').fontWeight(FontWeight.Bold).fontSize(20)
      Row() {
        Column() {
          Text('true')
            .fontColor(Color.Red)
        }
        .id('colorMetrics_autoRefresh_true')
        .backgroundColor(this.colorMetrics)
        .width('30%')
        .height('10%')
        .margin(5)

        Column() {
          Text('false')
            .fontColor(Color.Blue)
        }
        .id('colorMetrics_autoRefresh_false')
        .backgroundColor(this.colorMetrics1)
        .width('30%')
        .height('10%')
      }
      .margin(5)

      Row(){
        Column() {
          Text('autoRefresh undefined')
            .fontColor(Color.Red)
        }
        .id('colorMetrics_autoRefresh_undefined')
        .backgroundColor(this.colorMetrics2)
        .width('30%')
        .height('10%')
        .margin(5)

        Column() {
          Text('autoRefresh null')
            .fontColor(Color.Blue)
        }
        .id('colorMetrics_autoRefresh_null')
        .backgroundColor(this.colorMetrics3)
        .width('30%')
        .height('10%')
      }
      .margin(5)

      Text('LengthMetrics autoRefresh').fontWeight(FontWeight.Bold).fontSize(20)
      Row(){
        Button('true')
          .width('40%')
          .id('lengthMetrics_autoRefresh_true')
          .padding({ top: this.lengthMetrics })

        Button('false')
          .width('40%')
          .id('lengthMetrics_autoRefresh_false')
          .padding({ top: this.lengthMetrics1 })
      }
      .margin(5)
      Row(){
        Button('undefined')
          .id('lengthMetrics_autoRefresh_undefined')
          .padding({ top: this.lengthMetrics2 })
          .width('40%')
          .margin(5)

        Button('null')
          .id('lengthMetrics_autoRefresh_null')
          .padding({ top: this.lengthMetrics3 })
          .width('40%')
        }

    }
    .width('100%')
    .height('100%')
  }
}