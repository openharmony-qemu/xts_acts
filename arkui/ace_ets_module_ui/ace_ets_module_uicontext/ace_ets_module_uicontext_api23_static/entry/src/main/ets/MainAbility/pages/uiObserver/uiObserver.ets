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
  TextAlign,
  Entry,
  Component
} from '@ohos.arkui.component';
import { UIContext, UIObserver } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct uiObserverTest {

  build() {
    Column({ space: 15 } as ColumnOptions) {
      Text('UIObserver Test')
        .fontSize(20)
        .fontWeight(700)
        .width('100%')
        .textAlign(TextAlign.Center)
        .id('uiObserverTitle')

      Button('onTabChange')
        .id('btnOnTabChange')
        .width(300)
        .height(50)
        .onClick(() => {
          try {
            let ctx: UIContext = this.getUIContext();
            let obs: UIObserver = ctx.getUIObserver();
            obs.onTabChange((info) => {
              AppStorage.setOrCreate<boolean>('uiObserverOnTabChange', true);
              let lastIndex = info.lastIndex;
              if (lastIndex !== undefined) {
                AppStorage.setOrCreate<string>('uiObserverTabContentLastIndex', `${lastIndex}`);
              }
            });
            AppStorage.setOrCreate<boolean>('uiObserverOnTabChangeRegistered', true);
          } catch (e) {
            console.error('[ARKUI_NEW] onTabChange: ' + e);
            AppStorage.setOrCreate<boolean>('uiObserverOnTabChangeRegistered', false);
          }
        })

      Button('offTabChange')
        .id('btnOffTabChange')
        .width(300)
        .height(50)
        .onClick(() => {
          try {
            let ctx: UIContext = this.getUIContext();
            let obs: UIObserver = ctx.getUIObserver();
            obs.offTabChange();
            AppStorage.setOrCreate<boolean>('uiObserverOffTabChange', true);
          } catch (e) {
            console.error('[ARKUI_NEW] offTabChange: ' + e);
            AppStorage.setOrCreate<boolean>('uiObserverOffTabChange', false);
          }
        })

      Button('onRouterPageSizeChange')
        .id('btnOnRouterPageSizeChange')
        .width(300)
        .height(50)
        .onClick(() => {
          try {
            let ctx: UIContext = this.getUIContext();
            let obs: UIObserver = ctx.getUIObserver();
            obs.onRouterPageSizeChange((info) => {
              AppStorage.setOrCreate<boolean>('uiObserverOnRouterPageSizeChange', true);
              let serializedSize = JSON.stringify(info.size);
              AppStorage.setOrCreate<string>('uiObserverRouterPageInfoSize',
                serializedSize !== undefined ? serializedSize : '');
            });
            AppStorage.setOrCreate<boolean>('uiObserverOnRouterPageSizeChangeRegistered', true);
          } catch (e) {
            console.error('[ARKUI_NEW] onRouterPageSizeChange: ' + e);
            AppStorage.setOrCreate<boolean>('uiObserverOnRouterPageSizeChangeRegistered', false);
          }
        })

      Button('offRouterPageSizeChange')
        .id('btnOffRouterPageSizeChange')
        .width(300)
        .height(50)
        .onClick(() => {
          try {
            let ctx: UIContext = this.getUIContext();
            let obs: UIObserver = ctx.getUIObserver();
            obs.offRouterPageSizeChange();
            AppStorage.setOrCreate<boolean>('uiObserverOffRouterPageSizeChange', true);
          } catch (e) {
            console.error('[ARKUI_NEW] offRouterPageSizeChange: ' + e);
            AppStorage.setOrCreate<boolean>('uiObserverOffRouterPageSizeChange', false);
          }
        })

      Button('onNavDestinationSizeChange')
        .id('btnOnNavDestinationSizeChange')
        .width(300)
        .height(50)
        .onClick(() => {
          try {
            let ctx: UIContext = this.getUIContext();
            let obs: UIObserver = ctx.getUIObserver();
            obs.onNavDestinationSizeChange((info) => {
              AppStorage.setOrCreate<boolean>('uiObserverOnNavDestinationSizeChange', true);
              let serializedSize = JSON.stringify(info.size);
              AppStorage.setOrCreate<string>('uiObserverNavDestinationInfoSize',
                serializedSize !== undefined ? serializedSize : '');
            });
            AppStorage.setOrCreate<boolean>('uiObserverOnNavDestinationSizeChangeRegistered', true);
          } catch (e) {
            console.error('[ARKUI_NEW] onNavDestinationSizeChange: ' + e);
            AppStorage.setOrCreate<boolean>('uiObserverOnNavDestinationSizeChangeRegistered', false);
          }
        })

      Button('offNavDestinationSizeChange')
        .id('btnOffNavDestinationSizeChange')
        .width(300)
        .height(50)
        .onClick(() => {
          try {
            let ctx: UIContext = this.getUIContext();
            let obs: UIObserver = ctx.getUIObserver();
            obs.offNavDestinationSizeChange();
            AppStorage.setOrCreate<boolean>('uiObserverOffNavDestinationSizeChange', true);
          } catch (e) {
            console.error('[ARKUI_NEW] offNavDestinationSizeChange: ' + e);
            AppStorage.setOrCreate<boolean>('uiObserverOffNavDestinationSizeChange', false);
          }
        })

      Button('onNavDestinationSizeChangeByUniqueId')
        .id('btnOnNavDestinationSizeChangeByUniqueId')
        .width(300)
        .height(50)
        .onClick(() => {
          try {
            let ctx: UIContext = this.getUIContext();
            let obs: UIObserver = ctx.getUIObserver();
            obs.onNavDestinationSizeChangeByUniqueId(1, (info) => {
              AppStorage.setOrCreate<boolean>('uiObserverOnNavDestinationSizeChangeByUniqueId', true);
              let serializedSize = JSON.stringify(info.size);
              AppStorage.setOrCreate<string>('uiObserverNavDestinationInfoByUniqueIdSize',
                serializedSize !== undefined ? serializedSize : '');
            });
            AppStorage.setOrCreate<boolean>('uiObserverOnNavDestinationSizeChangeByUniqueIdRegistered', true);
          } catch (e) {
            console.error('[ARKUI_NEW] onNavDestinationSizeChangeByUniqueId: ' + e);
            AppStorage.setOrCreate<boolean>('uiObserverOnNavDestinationSizeChangeByUniqueIdRegistered', false);
          }
        })

      Button('offNavDestinationSizeChangeByUniqueId')
        .id('btnOffNavDestinationSizeChangeByUniqueId')
        .width(300)
        .height(50)
        .onClick(() => {
          try {
            if (AppStorage.get<boolean>('uiObserverOnNavDestinationSizeChangeByUniqueIdRegistered') !== true) {
              AppStorage.setOrCreate<boolean>('uiObserverOffNavDestinationSizeChangeByUniqueId', false);
              return;
            }
            let ctx: UIContext = this.getUIContext();
            let obs: UIObserver = ctx.getUIObserver();
            obs.offNavDestinationSizeChangeByUniqueId(1);
            AppStorage.setOrCreate<boolean>('uiObserverOffNavDestinationSizeChangeByUniqueId', true);
          } catch (e) {
            console.error('[ARKUI_NEW] offNavDestinationSizeChangeByUniqueId: ' + e);
            AppStorage.setOrCreate<boolean>('uiObserverOffNavDestinationSizeChangeByUniqueId', false);
          }
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
