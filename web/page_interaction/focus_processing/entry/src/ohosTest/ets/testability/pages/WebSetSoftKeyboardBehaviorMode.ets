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
import web_webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import { BusinessError } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import {inputMethod} from '@kit.IMEKit';
import { waitForExist} from '../../test/WaitTest.test';
const EVENT_ID_SET_SUITE_KEY = 178208;
@Entry
@Component
struct WebComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "";
  @State blurMode:BlurOnKeyboardHideMode = BlurOnKeyboardHideMode.SILENT;
  @State userAgentPC:string = "";
  inputMethodController = inputMethod.getController()
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State isOnConsoleEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    // 测试侧点击输入框后通知页面执行 onInactive
    let inactiveEvent: events_emitter.InnerEvent = {
      eventId: 20251122,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(inactiveEvent, () => {
      this.controller.onInactive();
    })
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {

      Row() {
        Button("web test").key('setSoftKeyboardBehaviorModeButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitSetSoftKeyboardBehaviorMode01": {
                  this.userAgentPC = this.controller.getUserAgent();
                  if ((this.userAgentPC).includes("PC")) {
                    Utils.emitEvent(true, 20251115)
                    break;
                  }
                  this.controller.onActive();
                  this.controller.setSoftKeyboardBehaviorMode(web_webview.WebSoftKeyboardBehaviorMode.DISABLE_AUTO_KEYBOARD_ON_ACTIVE);
                  // DISABLE_AUTO_KEYBOARD_ON_ACTIVE：onActive 后软键盘不应自动弹出
                  let imeShown = false;
                  const imeCtl = inputMethod.getInputMethodSetting();
                  imeCtl.on('imeShow', (): void => { imeShown = true; });
                  await Utils.sleep(1500);
                  imeCtl.off('imeShow');
                  Utils.emitEvent(!imeShown, 20251115);
                  break;
              }
            case "emitSetSoftKeyboardBehaviorMode02": {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 20251116)
                  break;
                }
                this.controller.loadUrl('resource://rawfile/SetSoftKeyboardBehaviorMode.html');
                this.controller.onActive();
                this.controller.setSoftKeyboardBehaviorMode(web_webview.WebSoftKeyboardBehaviorMode.DEFAULT);
                // DEFAULT：测试点击输入框激活后软键盘应弹出（imeShow 触发即通过）
                const imeCtl = inputMethod.getInputMethodSetting();
                imeCtl.on('imeShow', (): void => {
                  imeCtl.off('imeShow');
                  Utils.emitEvent(true, 20251116);
                });
                Utils.emitEvent(true, 20251121);
                break;
                }
            }
        })
      }
          Web({ src: $rawfile('SetSoftKeyboardBehaviorMode.html'), controller: this.controller })
            .height("80%")
            .onConsole((event) => {
               this.isOnConsoleEnd = 1;
               return false;
            })
            .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}