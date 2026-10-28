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

class TMP0060 {
  public msg: string = 'HelloBuilder'
}

@Builder({ isPlaceholder: false })
function funIsPlaceholder0060False(params: TMP0060) {
  Text(params.msg)
    .id('tvIsPlaceholder0060False')
    .height('5%')
}


@Entry
@Component
struct IsPlaceholder0060 {
  @State tmp: TMP0060 = new TMP0060()

  build() {
    Column() {
      funIsPlaceholder0060False({ msg: this.tmp.msg })
      Button('Change Msg')
        .id('btnIsPlaceholder0060Change')
        .height('5%')
        .onClick(() => {
          this.tmp.msg = 'HelloWorld'
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
