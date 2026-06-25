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

@ComponentV2
struct ChildProviderNullUndefined {
  @Consumer(undefined) age: number = 0
  @Consumer(null) age2: number = 0

  build() {
    Column() {
      Text(`ChildProviderNullUndefined`)
        .id('child_text')
        .height('5%')
      Text(`undefined age: ${this.age}, null age2: ${this.age2}`)
        .id('child_values')
        .height('5%')
    }
  }
}

@Entry
@ComponentV2
struct ProviderNullUndefined {
  @Provider(undefined) age: number = 1
  @Provider(null) age2: number = 1

  build() {
    Column() {
      Text(`ProviderNullUndefined`)
        .id('parent_title')
        .height('5%')
      Text(`undefined age: ${this.age}, null age2: ${this.age2}`)
        .id('parent_values')
        .height('5%')

      Button(`parent age2++`)
        .id('parent_button')
        .height('5%')
        .onClick(() => {
          this.age2++
          this.age++
        })
      ChildProviderNullUndefined()
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}