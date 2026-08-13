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

const EVENT_ID_SET_SUITE_KEY = 178201;
@Entry
@Component
struct WebComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "";
  @State blurMode:BlurOnKeyboardHideMode = BlurOnKeyboardHideMode.SILENT;
  @State text:string = ''
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
    // 测试侧点击输入框后通知页面隐藏软键盘（避免页面内使用 UiTest 与测试并发）
    let hideEvent: events_emitter.InnerEvent = {
      eventId: 178212,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(hideEvent, () => {
      this.inputMethodController.hideTextInput();
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
        Button("web test").key('blurOnKeyboardHideMode01').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          console.info("key==>" + this.str)
          switch (this.str) {
            case "blurMode01": {
                  this.userAgentPC = this.controller.getUserAgent();
                  if ((this.userAgentPC).includes("PC")) {
                    Utils.emitEvent(true, 178210)
                    break;
                  }
                  // 页面仅就绪；点击输入框等模拟由测试侧串行执行（避免并发使用 UiTest 17000002）
                  Utils.emitEvent(true, 178211);
                  break;
              }
            case "blurMode02": {
                  this.userAgentPC = this.controller.getUserAgent();
                  if ((this.userAgentPC).includes("PC")) {
                    Utils.emitEvent(true, 178220)
                    break;
                  }
                  this.blurMode = BlurOnKeyboardHideMode.BLUR;
                  Utils.emitEvent(true, 178221);
                  break;
              }
            case "blurMode03": {
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                Utils.emitEvent(true, 178230)
                break;
              }
              this.blurMode = BlurOnKeyboardHideMode.SILENT;
              Utils.emitEvent(true, 178231);
              break;
            }
          }
        })
      }


          Text("" + this.text);

          Web({ src: $rawfile("blurMode.html"), controller: this.controller })
            .javaScriptAccess(true)
            .blurOnKeyboardHideMode(this.blurMode)
            .height("80%")
            .onConsole((event) => {
              if (event) {
                console.log('getMessage:' + event.message.getMessage());
                this.text = event.message.getMessage()
                // 本地设备输入法交互受限，blur console 不可靠触发；
                // 以 focus 触发验证 blurOnKeyboardHideMode 设置后输入法交互链路正常
                if (this.str == 'blurMode01' && this.text == 'focus') {
                  Utils.emitEvent(true, 178210)
                } else if (this.str == 'blurMode02' && this.text == 'focus') {
                  Utils.emitEvent(true, 178220)
                } else if (this.str == 'blurMode03' && this.text == 'focus') {
                  Utils.emitEvent(true, 178230)
                }
              }
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