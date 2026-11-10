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
import { Builder, Button, Column, Entry, FlexAlign, Text, Row, Component } from '@ohos.arkui.component';
import { ObservedV2, Trace } from '@ohos.arkui.stateManagement';


// 全局 @Builder 函数，内部使用 lambda（箭头函数）作为参数
@Builder
function buildWithLambda(content: string, onClickHandler: () => void, builderId: string) {
  Column() {
    Text(content)
      .id('buildWithLambda_text')
      .height('5%')
    Button('Action')
      .id('builderAnnotationTargets_001')
      .height('5%')
      .onClick(onClickHandler)
  }
  .id(builderId)
}
// 类型别名
@Builder type t = @Builder() => void
// 类内 @Builder 方法，使用 lambda 表达式构建 UI
@ObservedV2
class BuilderLambdaModel {
  @Trace public count: number = 0
  @Trace public label: string = 'Initial'

  @Builder
  public itemBuilder: @Builder() => void = () => {
    Column() {
      Text(`Count: ${this.count}`)
        .id('builderLambdaModel_text1')
        .height('5%')
      Text(`Label: ${this.label}`)
        .id('builderLambdaModel_text2')
        .height('5%')
    }
    .id('builderLambda_classField_002')
  }

  public increment = () => {
    this.count++
    this.label = `Updated-${this.count}`
  }
}


@Entry
@Component
struct BuilderAnnotationTargets01 {
  model: BuilderLambdaModel = new BuilderLambdaModel()

  build() {
    Column() {
      // 用例1：全局 @Builder 接收 lambda 作为回调参数
      buildWithLambda('Global Builder with Lambda', () => {
        this.model.increment()
      }, 'builderLambda_global_001')

      // 用例2：类内 @Builder 字段（lambda 形式）直接调用
      this.model.itemBuilder()

      // 用例3：行内 @Builder 与 lambda 组合 —— 直接在 build 中用箭头函数传递
      Row() {
        Button('Reset')
          .id('builderLambda_reset_003')
          .height('5%')
          .onClick(() => {
            this.model.count = 0
            this.model.label = 'Initial'
          })
      }
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
