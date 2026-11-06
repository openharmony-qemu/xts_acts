'use static';

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

import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  Color,
  Builder,
  Row,
  Blank,
  Margin,
  Polygon,
  ShapePoint,
  Resource,
  Rect,
  RectOptions,
  AttributeModifier,
  RectAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyPointModifier implements AttributeModifier<RectAttribute> {
  public isRadiusWidth: boolean = true;
  public isRadiusHeight: boolean = true;

  applyNormalAttribute(instance: RectAttribute): void {
    instance
      .radiusWidth(this.isRadiusWidth ? '40px' : undefined)
      .radiusHeight(this.isRadiusHeight ? '40px' : undefined)
      .fill(Color.Pink)
  }
}

@Observed
export class MyPointModifier2 implements AttributeModifier<RectAttribute> {
  public isRadius: boolean = true;

  applyNormalAttribute(instance: RectAttribute): void {
    instance
      .radius(this.isRadius ? '40px' : undefined)
      .fill(Color.Pink)
  }
}

@Entry
@Component
struct RectExample {
  @State modifier: MyPointModifier = new MyPointModifier()
  @State modifier2: MyPointModifier2 = new MyPointModifier2()

  build() {
    Column() {
      Rect({ width: '80%', height: 50 } as RectOptions)
        .id('RectM')
        .attributeModifier(this.modifier)
        .fill(Color.Pink)
      Rect({ width: '80%', height: 50 } as RectOptions)
        .id('RectM2')
        .fill(Color.Pink)
        .attributeModifier(this.modifier2)

      Blank().height(5)
      Button('isRadiusWidth : ' + this.modifier.isRadiusWidth)
        .id('RectM_radiusWidth')
        .onClick((e: ClickEvent) => {
          this.modifier.isRadiusWidth = !this.modifier.isRadiusWidth;
        })
        .height(15)
      Button('isRadiusHeight : ' + this.modifier.isRadiusHeight)
        .id('RectM_radiusHeight')
        .onClick((e: ClickEvent) => {
          this.modifier.isRadiusHeight = !this.modifier.isRadiusHeight;
        })
        .height(15)
      Button('isRadius : ' + this.modifier2.isRadius)
        .id('RectM_radius')
        .onClick((e: ClickEvent) => {
          this.modifier2.isRadius = !this.modifier2.isRadius;
        })
        .height(15)

    }.width('100%').height('100%')
  }
}
