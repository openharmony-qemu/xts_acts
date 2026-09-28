'use static';
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
  Entry,
  Component,
  Column,
  Text,
  Button,
  ClickEvent,
  Margin
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct RouterPushUrlErr {
  aboutToAppear(): void {
    try {
      AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
    } catch (error) {
      console.log('RouterPushUrlErr error ' + error);
    }
  }

  private onPushUrl100002(): void {
    this.getUIContext().getRouter().pushUrl({
      url: 'pages/IndexNotExist0928'
    }).catch((err) => {
      AppStorage.setOrCreate('pushUrl_100002', (err as BusinessError).code);
      console.log(`pushUrl_100002 code=${(err as BusinessError).code}`);
    });
  }

  private onPushUrl100003(): void {
    let r: Router = this.getUIContext().getRouter();
    for (let i: int = 0; i < 33; i++) {
      r.pushUrl({
        url: 'MainAbility/pages/Coverage/RouterPushUrlErr'
      }).catch((err) => {
        AppStorage.setOrCreate('pushUrl_100003', (err as BusinessError).code);
        console.log(`pushUrl_100003 code=${(err as BusinessError).code}`);
      });
    }
  }

  private onPushUrlUndefined(): void {
    let opts: router.RouterOptions = undefined as router.RouterOptions;
    this.getUIContext().getRouter().pushUrl(opts, (err: BusinessError | null, _data: void | undefined) => {
      AppStorage.setOrCreate('pushUrl_undefined', err?.code ?? -1);
      console.log(`pushUrl_undefined code=${err?.code}`);
    });
  }

  private onPushUrlCallback100002(): void {
    this.getUIContext().getRouter().pushUrl({
      url: 'pages/IndexNotExistCb0928'
    }, (err: BusinessError | null, _data: void | undefined) => {
      AppStorage.setOrCreate('pushUrl_cb_100002', err?.code ?? -1);
      console.log(`pushUrl_cb_100002 code=${err?.code}`);
    });
  }

  build() {
    Column() {
      Text('RouterPushUrlErr').id('pushUrl_err_title').fontSize(18)
      Button('pushUrl_100002')
        .id('btn_pushUrl_100002')
        .margin({ bottom: 5 } as Margin)
        .onClick((e: ClickEvent): void => {
          this.onPushUrl100002();
        })
      Button('pushUrl_100003')
        .id('btn_pushUrl_100003')
        .margin({ bottom: 5 } as Margin)
        .onClick((e: ClickEvent): void => {
          this.onPushUrl100003();
        })
      Button('pushUrl_undefined')
        .id('btn_pushUrl_undefined')
        .margin({ bottom: 5 } as Margin)
        .onClick((e: ClickEvent): void => {
          this.onPushUrlUndefined();
        })
      Button('pushUrl_cb_100002')
        .id('btn_pushUrl_cb_100002')
        .margin({ bottom: 5 } as Margin)
        .onClick((e: ClickEvent): void => {
          this.onPushUrlCallback100002();
        })
    }
    .width('100%')
    .height('100%')
  }
}
