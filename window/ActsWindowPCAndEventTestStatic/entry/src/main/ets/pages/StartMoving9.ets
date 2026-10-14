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

import window from '@ohos.window';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent,Blank,TouchEvent,Color,HitTestMode,TouchType} from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { AppStorage,State } from '@ohos.arkui.stateManagement'

let caseName: string = 'teststartMovingParamStaticRepeated';
@Entry
@Component
struct StartMoving9 {
  @State message: string = 'startMoving'

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
            try {
              let windowClass = AppStorage.get<window.Window>('windowClass2') as window.Window;
              let windowRect = windowClass.getWindowProperties().windowRect;
              console.log(`${caseName} subWindowClass windowRect: ${JSON.stringify(windowRect)}`);
              let offSetX = Math.round(windowRect.width / 2).toInt();
              console.log(`${caseName}  offSetX: ${JSON.stringify(offSetX)}`);
              let offSetY = Math.round(windowRect.height / 2).toInt();
              console.log(`${caseName}  offSetY: ${JSON.stringify(offSetY)}`);
              windowClass.startMoving(offSetX, offSetY).then(async () => {
                await windowClass.startMoving(offSetX, offSetY);
                this.message = 'startMoving success';
                console.info('start moving successfully');
              }).catch((err) => {
                err = err as BusinessError;
                console.error('start moving : ' + err.code + ',message:' + err.message)
                if (err.code == 801) {
                  this.message = 'startMoving 801'
                  AppStorage.setOrCreate('teststartMovingParamStaticRepeated_errorCode', 801);
                } else if (err.code == 1300001) {
                  this.message = 'startMoving 1300001'
                  AppStorage.setOrCreate('teststartMovingParamStaticRepeated_errorCode', 1300001)
                } else {
                AppStorage.setOrCreate('teststartMovingParamStaticRepeated_errorCode', 0)
                }
              })
            } catch (exception) {
              console.error(`Failed to start drag window. Cause code: ${exception.code}, message: ${exception.message}`)
            }
          }
        })
    }
    .height('100%')
    .width('100%')
  }
}