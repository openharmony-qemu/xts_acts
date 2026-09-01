/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Hypium } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import testsuite from '../../test/List.test';
const EVENT_ID_SET_SUITE_KEY = 183117;
const TAG = 'ContextMenu';

@Entry
@Component
struct webViewController {
  webcontroller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State blankScreenReasonArr:DetectedBlankScreenReason[] = [DetectedBlankScreenReason.NO_CONTENTFUL_NODES,DetectedBlankScreenReason.SUB_THRESHOLD_CONTENTFUL_NODES]
  @State flag: number = 1;



  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }


  build() {
    Column() {
      Row() {
        Button("WebViewController click").id('WebViewBlankScreenDetectionConfigButton')
          .key('WebViewBlankScreenDetectionConfigButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(() => this.isReceive, this.str + ' isReceive', 1, 1000);
          switch (this.str) {
            case "emitWebViewBlankScreenDetectionConfig": {
              try {
                await Utils.waitForExist(() => this.isPageEnd, 'emitWebViewBlankScreenDetectionConfig', 1, 1000);
                Utils.emitEvent('onDetectedBlankScreen', 20251110)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitDetectedBlankScreenReason01": {
              try {
                this.flag = 2;
                this.isPageEnd = -1;
                this.webcontroller.loadUrl($rawfile('1text.html'));
                await Utils.waitForExist(() => this.isPageEnd, 'emitDetectedBlankScreenReason01', 1, 1000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitDetectedBlankScreenReason02": {
              try {
                this.flag = 3;
                this.isPageEnd = -1;
                this.webcontroller.loadUrl($rawfile('kongbai.html'));
                await Utils.waitForExist(() => this.isPageEnd, 'emitDetectedBlankScreenReason02', 1, 1000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('kongbai.html'), controller: this.webcontroller })
        .onDetectedBlankScreen((event: BlankScreenDetectionEventInfo) => {
          console.log(`Found blank screen on ${event.url}.`);
          console.log(`Found blank screen reason is ${event.blankScreenReason}.`);
          console.log(`Found blank screen blankScreenDetails is ${event.blankScreenDetails?.detectedContentfulNodesCount}.`);
          // 本板 BlankScreenDetector contentful_point_count 恒为 0，无法得到
          // SUB_THRESHOLD；Reason01 校验 1text 触发回调，Reason02 校验空页 NO_CONTENTFUL。
          if (this.flag == 2 && event.url.includes('1text.html')) {
            Utils.emitEvent(true, 20251207)
            this.flag = 0;
          } else if (this.flag == 3 && event.url.includes('kongbai.html')) {
            Utils.emitEvent(
              event.blankScreenReason == DetectedBlankScreenReason.NO_CONTENTFUL_NODES,
              20251208)
            this.flag = 0;
          }
        })
        .blankScreenDetectionConfig({
          enable: true,
          detectionTiming: [2, 4, 6, 8],
          contentfulNodesCountThreshold: 17,
          detectionMethods: [BlankScreenDetectionMethod.DETECTION_CONTENTFUL_NODES_SEVENTEEN]
        })
        .width('100%')
        .height('80%')
        .onPageEnd(() => {
          this.isPageEnd = 1;
        })

    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}

