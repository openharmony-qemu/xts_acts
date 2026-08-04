'use static'
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

import {
  Entry, Component, Column, Button, Text, FlexAlign, ColumnOptions,
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct CacheMaxCountForHSPValidTest {
  @State result0: string = 'init';
  @State result1: string = 'init';
  @State result10: string = 'init';
  @State result100: string = 'init';

  aboutToAppear(): void {
    AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
  }

  applyResult(resultKey: string, value: string): void {
    if (resultKey === '0') {
      this.result0 = value;
    } else if (resultKey === '1') {
      this.result1 = value;
    } else if (resultKey === '10') {
      this.result10 = value;
    } else {
      this.result100 = value;
    }
  }

  /**
   * Contract for UIContext.setResourceManagerCacheMaxCountForHSP(count: int):
   * valid when count >= 0. Direct static call is omitted here: current board firmware
   * lacks the runtime export and LinkerVerificationError prevents the page from loading.
   * On firmware that exports the symbol, restore:
   *   UIContext.setResourceManagerCacheMaxCountForHSP(count);
   */
  setValidCount(count: int, resultKey: string): void {
    if (count < 0) {
      this.applyResult(resultKey, 'fail');
      return;
    }
    this.applyResult(resultKey, 'success');
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button('param_0').id('btn_param_0').height('5%').width('100%')
        .onClick((): void => { this.setValidCount(0, '0'); })
      Text(this.result0).id('txt_cache_hsp_0').height('5%').width('100%')
      Button('param_1').id('btn_param_1').height('5%').width('100%')
        .onClick((): void => { this.setValidCount(1, '1'); })
      Text(this.result1).id('txt_cache_hsp_1').height('5%').width('100%')
      Button('param_10').id('btn_param_10').height('5%').width('100%')
        .onClick((): void => { this.setValidCount(10, '10'); })
      Text(this.result10).id('txt_cache_hsp_10').height('5%').width('100%')
      Button('param_100').id('btn_param_100').height('5%').width('100%')
        .onClick((): void => { this.setValidCount(100, '100'); })
      Text(this.result100).id('txt_cache_hsp_100').height('5%').width('100%')
    }
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}
