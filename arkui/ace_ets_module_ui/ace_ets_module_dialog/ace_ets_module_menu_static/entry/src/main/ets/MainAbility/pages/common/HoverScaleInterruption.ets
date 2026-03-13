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

'use static';

import router from '@ohos.router';
import {
  Entry,
  Column,
  Component,
  Builder,
  Button,
  Text,
  ContextMenuOptions,
  ResponseType,
  Menu,
  Image,
  MenuItem,
  $r,
  MenuItemOptions,
  Color
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { ResourceStr } from '@ohos.arkui.component';

let startIcon: ResourceStr = $r('app.media.startIcon');

@Builder
function buildMenuContent() {
  Menu() {
    MenuItem({
      startIcon: startIcon,
      content: '菜单选项1',
    } as MenuItemOptions)
    MenuItem({
      startIcon: startIcon,
      content: '菜单选项2',
    } as MenuItemOptions)
    MenuItem({
      startIcon: startIcon,
      content: '菜单选项3',
    } as MenuItemOptions)
  }
  .key('HoverMenu1')
}

@Entry
@Component
struct HoverScaleInterruptionIndex {
  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  @Builder
  MyPreview() {
    Column() {
      Image($r('app.media.icon'))
        .width(300)
        .height(200)
    }
  }

  build() {
    Column() {
      Button('hoverScaleInterruption true')
        .id('btnHoverScaleInterruptionTrue')
        .fontSize(20)
        .margin({ top: 20, bottom: 20 })
        .bindContextMenu(buildMenuContent, ResponseType.LongPress,
          {
            preview: this.MyPreview,
            previewAnimationOptions: {
              hoverScale: [1.0, 0.8],
              hoverScaleInterruption: false
            }
          } as ContextMenuOptions
        )

      Button('hoverScaleInterruption false')
        .id('btnHoverScaleInterruptionFalse')
        .fontSize(20)
        .margin({ top: 20, bottom: 20 })
        .bindContextMenu(buildMenuContent, ResponseType.LongPress,
          {
            preview: this.MyPreview,
            previewAnimationOptions: {
              hoverScale: [1.0, 0.8],
              hoverScaleInterruption: true
            }
          } as ContextMenuOptions
        )
    }
    .width('100%')
    .height('100%')
  }
}
