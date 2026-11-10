'use static';
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

import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent,Blank,TouchEvent,Color,HitTestMode,TouchType} from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { AppStorage,State } from '@ohos.arkui.stateManagement'

let caseName: string = 'teststartMovingStaticRepeated';
@Entry
@Component
struct StartMoving8 {
  @State message: string = 'teststartMovingStaticRepeated'

  build() {
    Column() {
      Button(this.message).id('startMovingText')
      Blank()
        .id('startMoving')
        .backgroundColor(Color.Gray)
        .size({ width: '80%', height: 200 })
        .hitTestBehavior(HitTestMode.Transparent)
        .onTouch((event: TouchEvent) => {
          if (event.type == TouchType.Down) {
          (async () => {
              try {
                let windowClass = AppStorage.get<window.Window>('windowClass1') as window.Window;
                await windowClass.startMoving();
                console.info(`${caseName} first startMoving success`);
                await windowClass.startMoving();
                this.message = 'startMoving success';
                console.info(`${caseName} second startMoving success`);
              } catch (err) {
                err = err as BusinessError;
                console.error(`${caseName} startMoving failed: ${err.code}, message: ${err.message}`);
                this.message = `startMoving ${err.code}`;
                AppStorage.setOrCreate('teststartMovingStaticRepeated_errorCode', err.code);
              }
            })()
          }
        })
    }
    .height('100%')
    .width('100%')
  }
}