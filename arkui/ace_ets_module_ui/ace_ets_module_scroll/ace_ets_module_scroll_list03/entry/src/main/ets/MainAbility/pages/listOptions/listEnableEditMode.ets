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
struct ListEnableEditMode {
  @State arr: string[] = ['1', '2', '3', '4', '5', '6'];

  build() {
    Scroll() {
      Column() {
        List() {
          ForEach(this.arr, (item: string) => {
            ListItem() {
              Text(item)
                .width('100%')
                .height('40%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .width('90%')
        .height('20%')
        .backgroundColor(0xFAEEE0)
        .enableEditMode(true)
        .id('list_enableEditMode_true')

        List() {
          ForEach(this.arr, (item: string) => {
            ListItem() {
              Text(item)
                .width('100%')
                .height('40%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .width('90%')
        .height('20%')
        .backgroundColor(0xFAEEE0)
        .enableEditMode(false)
        .id('list_enableEditMode_false')

        List() {
          ForEach(this.arr, (item: string) => {
            ListItem() {
              Text(item)
                .width('100%')
                .height('40%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .width('90%')
        .height('20%')
        .backgroundColor(0xFAEEE0)
        .enableEditMode(undefined)
        .id('list_enableEditMode_undefined')

        List() {
          ForEach(this.arr, (item: string) => {
            ListItem() {
              Text(item)
                .width('100%')
                .height('40%')
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF9CF93)
            }
          }, (item: string) => item)
        }
        .width('90%')
        .height('20%')
        .backgroundColor(0xFAEEE0)
        .enableEditMode(null)
        .id('list_enableEditMode_null')
      }
      .width('100%')
      .padding(5)
      .backgroundColor('#F5F5F5')
    }
    .height('100%')
    .width('100%')
  }
}