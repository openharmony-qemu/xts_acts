/**
 * Copyright (c) 2026 Kaihong Digital Industry Development Co., Ltd.
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

/**
 * Cover @Provide/@Consume 接口调用（null/undefined 装饰器参数编译失败，见归档）。
 */
@Component
struct ProvideNullChild {
  @Consume('pUndef') pUndef: number = 0;
  @Consume('pNull') pNull: number = 0;

  build() {
    Text(`pUndef:${this.pUndef},pNull:${this.pNull}`)
      .id('provide_null_child')
      .height('5%')
  }
}

@Entry
@Component
struct ProvideConsumeNullArgsCover {
  @Provide('pUndef') pUndef: number = 3;
  @Provide('pNull') pNull: number = 4;

  build() {
    Column() {
      Text('ProvideConsumeNullArgsCover')
        .id('provide_null_title')
        .fontSize(16)
        .height('5%')
      Text(`host:${this.pUndef},${this.pNull}`)
        .id('provide_null_host')
        .height('5%')
      ProvideNullChild()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
