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
import { Builder, Button, Column, Entry, FlexAlign, Text, Row, Component, ComponentV2 } from '@ohos.arkui.component';
import { ObservedV2, Trace, Local } from '@ohos.arkui.stateManagement';

interface Shape {
  a:number
  b:number
  @Builder count(): number
}
@ObservedV2
class Tmp implements Shape{
  @Trace public a: number = 1
  @Trace public b: number = 3
  @Builder
  count(): number {
    return this.a * this.b
  }
}

@Builder
function overBuilderByReference(@Builder params: Tmp) {
  Row() {
    Text('UseStateVarByReference: '+params.count())
      .id('builderAnnotationTargets02_text')
      .height('5%')
  }
}

@Entry
@ComponentV2
struct BuilderAnnotationTargets02 {
  @Local tmp: Tmp = new Tmp();

  build() {
    Column() {
      // 在父组件中调用overBuilderByReference组件时，
      // 把tmp实例通过引用传递的方式传给overBuilderByReference组件。
      overBuilderByReference(this.tmp)
      Button('Click me')
        .id('builderAnnotationTargets02')
        .height('5%')
        .onClick(() => {
        // 单击Click me后，UI文本从Hello更改为ArkUI。
        this.tmp.a = 4;
      })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
