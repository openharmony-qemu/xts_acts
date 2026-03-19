/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import {
  Column,
  ColumnOptions,
  Button,
  Text,
  Entry,
  Component,
  ClickEvent
} from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct componentObserver {
  aboutToAppear() {
    try {
      let uiContext: UIContext = this.getUIContext();
      let inspectorInstance = uiContext.getUIInspector();
      let componentObserver: inspector.ComponentObserver | undefined = inspectorInstance.createComponentObserver('testComponent');
      if (componentObserver) {
        // Store in AppStorage for test
        AppStorage.setOrCreate<inspector.ComponentObserver>('componentObserver', componentObserver);
      }
    } catch (error) {
      console.error('[ARKUI_NEW] componentObserver create error: ' + error);
    }
  }

  build() {
    Column({ space: 15 } as ColumnOptions) {
      Button('Test ComponentObserver - onLayout')
        .id('btnOnLayout')
        .width(300)
        .height(50)
        .onClick(() => {
          try {
            let componentObserver = AppStorage.get<inspector.ComponentObserver>('componentObserver');
            if (componentObserver) {
              componentObserver.onLayout(() => {
                AppStorage.setOrCreate<boolean>('componentObserverOnLayout', true);
              });
              AppStorage.setOrCreate<boolean>('componentObserverOnLayoutRegistered', true);
            }
          } catch (error) {
            console.error('[ARKUI_NEW] onLayout error: ' + error);
          }
        })

      Button('Test ComponentObserver - onDraw')
        .id('btnOnDraw')
        .width(300)
        .height(50)
        .onClick(() => {
          try {
            let componentObserver = AppStorage.get<inspector.ComponentObserver>('componentObserver');
            if (componentObserver) {
              componentObserver.onDraw(() => {
                AppStorage.setOrCreate<boolean>('componentObserverOnDraw', true);
              });
              AppStorage.setOrCreate<boolean>('componentObserverOnDrawRegistered', true);
            }
          } catch (error) {
            console.error('onDraw error: ' + error);
          }
        })

      Button('Test ComponentObserver - onLayoutChildren')
        .id('btnOnLayoutChildren')
        .width(300)
        .height(50)
        .onClick(() => {
          try {
            let componentObserver = AppStorage.get<inspector.ComponentObserver>('componentObserver');
            if (componentObserver) {
              componentObserver.onLayoutChildren(() => {
                AppStorage.setOrCreate<boolean>('componentObserverOnLayoutChildren', true);
              });
              AppStorage.setOrCreate<boolean>('componentObserverOnLayoutChildrenRegistered', true);
            }
          } catch (error) {
            console.error('[ARKUI_NEW] onLayoutChildren error: ' + error);
          }
        })

      Button('Test ComponentObserver - offLayoutChildren')
        .id('btnOffLayoutChildren')
        .width(300)
        .height(50)
        .onClick(() => {
          try {
            let componentObserver = AppStorage.get<inspector.ComponentObserver>('componentObserver');
            if (componentObserver) {
              componentObserver.offLayoutChildren();
              AppStorage.setOrCreate<boolean>('componentObserverOffLayoutChildren', true);
            }
          } catch (error) {
            console.error('[ARKUI_NEW] offLayoutChildren error: ' + error);
          }
        })

      Text('Test component')
        .id('testComponent')
        .fontSize(20)
        .width(200)
        .height(50)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
