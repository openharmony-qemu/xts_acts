/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
struct RefreshOffset {
  @State isRefreshing: boolean = false;

  build() {
    Scroll() {
      Column() {
        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(16)
            .margin(10)
        }
        .width('100%')
        .height('12%')
        .id('refresh_refreshOffset_default')
        .pullDownRatio(1)
        .backgroundColor(0x89CFF0)

        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(16)
            .margin(10)
        }
        .width('100%')
        .height('12%')
        .id('refresh_refreshOffset_1')
        .refreshOffset(1)
        .pullDownRatio(1)
        .backgroundColor(0x89CFF0)

        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(16)
            .margin(10)
        }
        .width('100%')
        .height('12%')
        .id('refresh_refreshOffset_0')
        .refreshOffset(0)
        .pullDownRatio(1)
        .backgroundColor(0x89CFF0)

        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(16)
            .margin(10)
        }
        .width('100%')
        .height('12%')
        .id('refresh_refreshOffset_null')
        .refreshOffset(null)
        .pullDownRatio(1)
        .backgroundColor(0x89CFF0)

        Refresh({ refreshing: this.isRefreshing }) {
          Text('refresh...')
            .fontSize(16)
            .margin(10)
        }
        .width('100%')
        .height('12%')
        .id('refresh_refreshOffset_undefined')
        .refreshOffset(undefined)
        .pullDownRatio(1)
        .backgroundColor(0x89CFF0)
      }
      .width('100%')
      .height('100%')
    }
  }
}
