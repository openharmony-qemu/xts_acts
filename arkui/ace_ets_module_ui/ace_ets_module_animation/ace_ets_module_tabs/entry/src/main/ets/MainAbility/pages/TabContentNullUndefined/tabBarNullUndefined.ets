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
struct TabContentTabBarNullUndefined {
  build() {
    Column() {
      Text('TabContent tabBar 属性 Null/Undefined 测试')
      Tabs() {
        TabContent() {
          Column() {
            Text('Content 1')
              .fontSize(16)
          }
          .width('100%')
          .height('100%')
          .backgroundColor('#FFE0B2')
        }
        .tabBar('Tab 1')
        .id('tabContent_tabBar_string')

        TabContent() {
          Column() {
            Text('Content 2')
              .fontSize(16)
          }
          .width('100%')
          .height('100%')
          .backgroundColor('#C8E6C9')
        }
        .tabBar('')
        .id('tabContent_tabBar_empty_string')

        TabContent() {
          Column() {
            Text('Content 3')
              .fontSize(16)
          }
          .width('100%')
          .height('100%')
          .backgroundColor('#BBDEFB')
        }
        .tabBar(null)
        .id('tabContent_tabBar_null')

        TabContent() {
          Column() {
            Text('Content 4')
              .fontSize(16)
          }
          .width('100%')
          .height('100%')
          .backgroundColor('#F8BBD0')
        }
        .tabBar(undefined)
        .id('tabContent_tabBar_undefined')
      }
      .height(200)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}