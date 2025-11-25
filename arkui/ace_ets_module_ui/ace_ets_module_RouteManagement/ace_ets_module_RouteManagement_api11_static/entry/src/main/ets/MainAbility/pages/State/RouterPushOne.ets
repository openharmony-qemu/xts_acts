'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import router from '@ohos.router';
import { Entry,Component,Column,Margin,Text, Button, ButtonType, ClickEvent, Scroll, FontWeight } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext'
interface RouterParams {
  view: string;
}
@Entry
@Component
struct RouterPushOne {
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');

  }

  onPageShow() {
    let uiContext: UIContext = this.getUIContext()
    let routerUI: Router = uiContext.getRouter();
    this.routerUI = routerUI
  }

  @State message: string = 'RouterPushUrlOne'
  @State messageUI: string = 'UIRouterPushUrlOne'
  @State routerUI: Router|undefined = undefined

  build() {
    Scroll() {
      Column() {
        Text(this.message)
        Text("RouterPushThree " + JSON.parseJsonElement(JSON.stringify(this.routerUI?.getParams())))
          .fontSize(20)
          .id("Text_RouterPushThree_Params")
        Button("turn_RouterPushUrlTwo_noParms")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_RouterPushUrlTwo_noParms")
          .onClick((e: ClickEvent) => {
            this.routerUI?.pushUrl({
              url: 'MainAbility/pages/State/RouterPushTwo'
            })
          })
        Button("turn_RouterPushUrlTwo_hasParms")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_RouterPushUrlTwo_hasParms")
          .onClick((e: ClickEvent) => {
            this.routerUI?.pushUrl({
              url: 'MainAbility/pages/State/RouterPushTwo',
              params: {
                view: "params"
              } as RouterParams
            })
          })

        Button("turn_RouterPushReplace_noParms")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_RouterPushReplace_noParms")
          .onClick((e: ClickEvent) => {
            this.routerUI?.replaceUrl({
              url: 'MainAbility/pages/State/RouterPushTwo'
            })
          })
        Button("turn_RouterPushReplace_hasParms")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_RouterPushReplace_hasParms")
          .onClick((e: ClickEvent) => {
            this.routerUI?.replaceUrl({
              url: 'MainAbility/pages/State/RouterPushTwo',
              params: {
                view: "params"
              } as RouterParams
            })
          })

        Text(this.messageUI)
        Button("turn_UIRouterPushUrlTwo_noParms")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_UIRouterPushUrlTwo_noParms")
          .onClick((e: ClickEvent) => {
            this.routerUI?.pushUrl({
              url: 'MainAbility/pages/State/RouterPushTwo'
            })
          })
        Button("turn_UIRouterPushUrlTwo_hasParms")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_UIRouterPushUrlTwo_hasParms")
          .onClick((e: ClickEvent) => {
            this.routerUI?.pushUrl({
              url: 'MainAbility/pages/State/RouterPushTwo',
              params: {
                view: "params"
              } as RouterParams
            })
          })

        Button("turn_UIRouterPushReplace_noParms")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_UIRouterPushReplace_noParms")
          .onClick((e: ClickEvent) => {
            this.routerUI?.replaceUrl({
              url: 'MainAbility/pages/State/RouterPushTwo'
            })
          })
        Button("turn_UIRouterPushReplace_hasParms")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_UIRouterPushReplace_hasParms")
          .onClick((e: ClickEvent) => {
            this.routerUI?.replaceUrl({
              url: 'MainAbility/pages/State/RouterPushTwo',
              params: {
                view: "params"
              } as RouterParams
            })
          })
      }
    }
  }
}
