'use static'
/*
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

import { FullScreenLaunchComponent } from '@ohos.arkui.advanced.FullScreenLaunchComponent';
import { Entry, ComponentV2, Column, Text, Builder } from '@ohos.arkui.component';
import { Local, AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@ComponentV2
struct Coverage0917Static {
  @Local fsFlag: string = 'init';
  private appId: string = '0000000000000000000';

  aboutToAppear(): void {
    try {
      const routerInst = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInst);
    } catch (error) {
      console.info('[Coverage0917Static] set router error ' + error);
    }
    this.fsFlag = 'ok';
  }

  @Builder
  contentBuilder(): void {
    Column() {
      Text('fsLaunch').id('fsContent')
    }
  }

  build() {
    Column() {
      Text('Coverage0917Static').id('coverage0917Title').fontSize(18)
      Text(this.fsFlag).id('fsLaunchFlag')
      FullScreenLaunchComponent({
        content: (): void => {
          this.contentBuilder();
        },
        appId: this.appId
      })
    }
    .width('100%')
    .height('100%')
    .padding(12)
  }
}
