'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Entry,
  Component,
  Column,
  Refresh,
  RefreshStatus,
  Text,
  List,
  $$,
  ForEach,
  ListItem,
  Color,
  BarState,
  TextAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct RefreshOffsetExample {
  @State isRefreshing: boolean = false
  @State arr: String[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

  build() {
    Column() {
      // Refresh refreshOffset undefined
      Refresh({ refreshing: $$(this.isRefreshing) }) {
        List() {
          ForEach(this.arr, (item: string) => {
            ListItem() {
              Text('' + item)
                .width('100%')
                .height('20%')
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(0xFFFFFF)
            }
          }, (item: string) => item)
        }
      }
      .id('refresh_offset_undefined')
      .backgroundColor(0x89CFF0)
      .refreshOffset(undefined)
      .pullToRefresh(true)
      .pullDownRatio(1)
      .height('40%')

      Refresh({ refreshing: $$(this.isRefreshing) }) {
        List() {
          ForEach(this.arr, (item: string) => {
            ListItem() {
              Text('' + item)
                .width('100%')
                .height('20%')
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(0xFFFFFF)
            }
          }, (item: string) => item)
        }
      }
      .id('refresh_offset_noSet')
      .backgroundColor(0x89CFF0)
      .pullToRefresh(true)
      .pullDownRatio(1)
      .height('40%')
      .margin(10)
    }
  }
}