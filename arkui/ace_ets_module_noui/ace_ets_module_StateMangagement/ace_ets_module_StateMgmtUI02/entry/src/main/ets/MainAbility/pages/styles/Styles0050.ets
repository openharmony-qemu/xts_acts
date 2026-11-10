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

// three equivalent minApiVersion forms: number 12 / string '12' / OS version string '5.0.0' -> all encoded 50000
@Styles({ minApiVersion: 12 })
function styleNumberForm() {
  .backgroundColor(Color.Red)
}

@Styles({ minApiVersion: '12' })
function styleStringKeyForm() {
  .backgroundColor(Color.Red)
}

@Styles({ minApiVersion: '5.0.0' })
function styleOsStringForm() {
  .backgroundColor(Color.Red)
}

// mixed number/string bounds: minApiVersion 13 -> 50001, maxApiVersion '20' -> 60000
@Styles({ minApiVersion: 13, maxApiVersion: '20' })
function styleMixedForm() {
  .height('10%')
}

@Entry
@Component
struct Styles0050 {
  build() {
    Column({ space: 20 }) {
      Text('Styles0050 number 12')
        .id('tv_styles0050_number')
        .height('5%')
        .backgroundColor(Color.Gray)
        .styleNumberForm()
      Text('Styles0050 stringKey 12')
        .id('tv_styles0050_string')
        .height('5%')
        .backgroundColor(Color.Gray)
        .styleStringKeyForm()
      Text('Styles0050 osString 5.0.0')
        .id('tv_styles0050_os')
        .height('5%')
        .backgroundColor(Color.Gray)
        .styleOsStringForm()
      Text('Styles0050 mixed 13 20')
        .id('tv_styles0050_mixed')
        .height('5%')
        .styleMixedForm()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}
