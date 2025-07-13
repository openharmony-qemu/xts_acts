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

import events_emitter from '@ohos.events.emitter';
// import { GaugeModifier } from "@ohos.arkui.modifier";
import {
  Entry,
  Component,
  Column,
  Text,
  HorizontalAlign,
  ContainerSpan,
  Span,
  ColumnOptions,
  Margin,
  Button,
  Gauge,
  ClickEvent
} from '@ohos.arkui.component';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

// class CustomModifier extends GaugeModifier {
//   //descriptionBuilder:CustomBuilder;
//   applyNormalAttribute(instance: GaugeAttribute): void {
//     super.applyNormalAttribute?.(instance);
//   }
//
//
//   onChange1() {
//     this.strokeWidth(5)
//   }
// }

@Entry
@Component
struct GaugeExample {
  // @State customModifier: GaugeModifier = new CustomModifier()
  //   .strokeWidth(5)
  //   .endAngle(360)
  //   .startAngle(0)
  //   .value(1)
  //   .colors([['#FF123456', 1], ['#FF654321', 2]])
  //   .indicator({
  //     icon: "abc",
  //     space: `${15}px`
  //   })
  //   .trackShadow({
  //     radius: 5,
  //     offsetX: 15,
  //     offsetY: 15
  //   })

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button("change value").onClick((e: ClickEvent) => {
        // (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")
      Column() {

        Gauge({ value: 0, min: 0, max: 100 })
          .key("GaugeKey1")
        // .attributeModifier(this.customModifier as CustomModifier)
      }
      .width('100%')
      .margin({ top: 300 } as Margin)
    }
    .margin({ top: 5 } as Margin)
  }
}

