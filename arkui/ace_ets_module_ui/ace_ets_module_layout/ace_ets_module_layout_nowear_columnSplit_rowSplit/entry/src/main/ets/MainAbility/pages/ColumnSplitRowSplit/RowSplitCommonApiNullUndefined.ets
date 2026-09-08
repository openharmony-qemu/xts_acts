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

@Entry
@Component
struct RowSplitCommonApiNullUndefined {
  build() {
    Column({space:5}) {
      RowSplit() {
        Text('1')
          .width(50)
          .height(50)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
          .alignRules({left:null,right:null,top:null,bottom:null})
        Text('2')
          .width(50)
          .height(50)
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
          .alignRules({left:undefined,right:undefined,top:undefined,bottom:undefined})
        Text('3')
          .width(50)
          .height(50)
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
          .alignRules({
            top: { anchor: null, align: undefined },
            left: { anchor: null, align: undefined },
            right:{ anchor: null, align: undefined },
            bottom:{ anchor: null, align: undefined },
            middle:{ anchor: null, align: undefined },
          })
      }
      .id('RowSplitCommonApiNull')
      .resizeable(null)
      .margin(null)
      .position(null)
      .enabled(null)
      .chainMode(null,null)
      .alignRules(null)
      .width(180)
      .height(90)
      .backgroundColor(0xF0F0F0)

      RowSplit() {
        Text('1')
          .width(50)
          .height(50)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
          .alignRules({
            top: { anchor: '', align: null },
            left: { anchor: '', align: null },
            right:{ anchor: '', align: null },
            bottom:{ anchor: '', align: null },
            middle:{ anchor: '', align: null },
          })
        Text('2')
          .width(50)
          .height(50)
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
          .alignRules({
            top: { anchor: '', align: undefined },
            left: { anchor: '', align: undefined },
            right:{ anchor: '', align: undefined },
            bottom:{ anchor: '', align: undefined },
            middle:{ anchor: '', align: undefined },
          })
        Text('3')
          .width(50)
          .height(50)
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
          .alignRules({
            top: { anchor: undefined, align: undefined },
            left: { anchor: undefined, align: undefined },
            right:{ anchor: undefined, align: undefined },
            bottom:{ anchor: undefined, align: undefined },
            middle:{ anchor: undefined, align: undefined },
          })
      }
      .id('RowSplitCommonApiUndefined')
      .resizeable(undefined)
      .margin(undefined)
      .position(undefined)
      .enabled(undefined)
      .chainMode(undefined,undefined)
      .alignRules(undefined)
      .width(180)
      .height(90)
      .backgroundColor(0xF0F0F0)
    }
    .width('100%')
    .height('100%')
  }
}
