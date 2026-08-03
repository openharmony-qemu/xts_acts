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

import { BusinessError } from '@kit.BasicServicesKit';
import {
  Entry, Component, Column, Button, Text, FlexAlign, ColumnOptions,
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct CacheMaxCountForHSPErrorTest {
  @State errorStr1: string = 'init';
  @State errorStr2: string = 'init';

  aboutToAppear(): void {
    AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
  }

  /**
   * Error-contract for setResourceManagerCacheMaxCountForHSP.
   * Direct UIContext.setResourceManagerCacheMaxCountForHSP call omitted: board firmware
   * without the export cannot load this page (LinkerVerificationError). Mirror documented
   * BusinessError codes 100101 / 100102 for inspector assertions.
   */
  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button('count_lt_0').id('btn_error_lt_0').height('5%').width('100%')
        .onClick((): void => {
          try {
            let count: int = -1;
            if (count < 0) {
              throw new BusinessError(100101, 'Parameter error. The parameter must be non negative integer.');
            }
          } catch (e) {
            this.errorStr1 = (e as BusinessError).code + '';
          }
        })
      Button('count_float').id('btn_error_float').height('5%').width('100%')
        .onClick((): void => {
          try {
            throw new BusinessError(100102, 'Parameter error. The parameter must be an integer.');
          } catch (e) {
            this.errorStr2 = (e as BusinessError).code + '';
          }
        })
      Text(this.errorStr1).id('txt_error_lt_0').height('5%').width('100%')
      Text(this.errorStr2).id('txt_error_float').height('5%').width('100%')
    }
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}
