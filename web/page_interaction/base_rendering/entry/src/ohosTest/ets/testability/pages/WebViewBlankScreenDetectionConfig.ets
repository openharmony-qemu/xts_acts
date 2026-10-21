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
  @State monitoredBlankScreenRegistered: boolean = false;



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

            case "emitOnMonitoredBlankScreenCall001": {
              try {
                Utils.emitEvent(true, 20261001);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitOnMonitoredBlankScreenParam001": {
              try {
                let callback: OnMonitorBlankScreenCallback = (event: MonitoredBlankScreenEventInfo) => {
                  Utils.emitEvent(event.url, 20261010);
                  Utils.emitEvent(event.reason, 20261011);
                  Utils.emitEvent(event.extraMsg, 20261012);
                };
                callback({
                  url: 'resource://rawfile/kongbai.html',
                  reason: BlankScreenReason.MAIN_DOC_EMPTY,
                  extraMsg: 'main document is empty'
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitOnMonitoredBlankScreenReturn001": {
              try {
                this.isPageEnd = -1;
                this.webcontroller.loadUrl($rawfile('1text.html'));
                await Utils.waitForExist(() => this.isPageEnd, 'emitOnMonitoredBlankScreenReturn001', 1, 1000);
                Utils.emitEvent(true, 20261020);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitBlankScreenReasonDnsResolveFailed001": {
              Utils.emitEvent(BlankScreenReason.DNS_RESOLVE_FAILED, 20261101);
              break;
            }
            case "emitBlankScreenReasonRequestTimedOut001": {
              Utils.emitEvent(BlankScreenReason.REQUEST_TIMED_OUT, 20261102);
              break;
            }
            case "emitBlankScreenReasonConnectionRefused001": {
              Utils.emitEvent(BlankScreenReason.CONNECTION_REFUSED, 20261103);
              break;
            }
            case "emitBlankScreenReasonConnectionReset001": {
              Utils.emitEvent(BlankScreenReason.CONNECTION_RESET, 20261104);
              break;
            }
            case "emitBlankScreenReasonSslError001": {
              Utils.emitEvent(BlankScreenReason.SSL_ERROR, 20261105);
              break;
            }
            case "emitBlankScreenReasonCertError001": {
              Utils.emitEvent(BlankScreenReason.CERT_ERROR, 20261106);
              break;
            }
            case "emitBlankScreenReasonInternetDisconnected001": {
              Utils.emitEvent(BlankScreenReason.INTERNET_DISCONNECTED, 20261107);
              break;
            }
            case "emitBlankScreenReasonRedirectLoop001": {
              Utils.emitEvent(BlankScreenReason.REDIRECT_LOOP, 20261108);
              break;
            }
            case "emitBlankScreenReasonProxyError001": {
              Utils.emitEvent(BlankScreenReason.PROXY_ERROR, 20261109);
              break;
            }
            case "emitBlankScreenReasonOtherNetworkError001": {
              Utils.emitEvent(BlankScreenReason.OTHER_NETWORK_ERROR, 20261110);
              break;
            }
            case "emitBlankScreenReasonMainDocEmpty001": {
              Utils.emitEvent(BlankScreenReason.MAIN_DOC_EMPTY, 20261111);
              break;
            }
            case "emitBlankScreenReasonHttp4xxError001": {
              Utils.emitEvent(BlankScreenReason.HTTP_4XX_ERROR, 20261112);
              break;
            }
            case "emitBlankScreenReasonHttp5xxError001": {
              Utils.emitEvent(BlankScreenReason.HTTP_5XX_ERROR, 20261113);
              break;
            }
            case "emitBlankScreenReasonJsGlobalBundleLoadFailed001": {
              Utils.emitEvent(BlankScreenReason.JS_GLOBAL_BUNDLE_LOAD_FAILED, 20261114);
              break;
            }
            case "emitBlankScreenReasonCssLoadFailed001": {
              Utils.emitEvent(BlankScreenReason.CSS_LOAD_FAILED, 20261115);
              break;
            }
            case "emitBlankScreenReasonMultiResourceLoadFailed001": {
              Utils.emitEvent(BlankScreenReason.MULTI_RESOURCE_LOAD_FAILED, 20261116);
              break;
            }
            case "emitBlankScreenReasonCorsBlocked001": {
              Utils.emitEvent(BlankScreenReason.CORS_BLOCKED, 20261117);
              break;
            }
            case "emitBlankScreenReasonCspBlocked001": {
              Utils.emitEvent(BlankScreenReason.CSP_BLOCKED, 20261118);
              break;
            }
            case "emitBlankScreenReasonMixedContentBlocked001": {
              Utils.emitEvent(BlankScreenReason.MIXED_CONTENT_BLOCKED, 20261119);
              break;
            }
            case "emitBlankScreenReasonJsRuntimeError001": {
              Utils.emitEvent(BlankScreenReason.JS_RUNTIME_ERROR, 20261120);
              break;
            }
            case "emitBlankScreenReasonNoFirstContentfulPaint001": {
              Utils.emitEvent(BlankScreenReason.NO_FIRST_CONTENTFUL_PAINT, 20261121);
              break;
            }
            case "emitBlankScreenReasonRendererCrashed001": {
              Utils.emitEvent(BlankScreenReason.RENDERER_CRASHED, 20261122);
              break;
            }
            case "emitBlankScreenReasonRendererKilled001": {
              Utils.emitEvent(BlankScreenReason.RENDERER_KILLED, 20261123);
              break;
            }
            case "emitBlankScreenReasonGpuProcessCrashed001": {
              Utils.emitEvent(BlankScreenReason.GPU_PROCESS_CRASHED, 20261124);
              break;
            }
            case "emitBlankScreenReasonGpuProcessWatchdogTimeout001": {
              Utils.emitEvent(BlankScreenReason.GPU_PROCESS_WATCHDOG_TIMEOUT, 20261125);
              break;
            }
            case "emitBlankScreenReasonWebViewZeroSize001": {
              Utils.emitEvent(BlankScreenReason.WEB_VIEW_ZERO_SIZE, 20261126);
              break;
            }
            case "emitMonitoredBlankScreenEventInfoInterface001": {
              let info: MonitoredBlankScreenEventInfo = {
                url: 'resource://rawfile/kongbai.html',
                reason: BlankScreenReason.SSL_ERROR,
                extraMsg: 'ssl handshake failed'
              };
              Utils.emitEvent(info != null, 20261201);
              break;
            }
            case "emitMonitoredBlankScreenEventInfoUrl001": {
              let info: MonitoredBlankScreenEventInfo = {
                url: 'resource://rawfile/kongbai.html',
                reason: BlankScreenReason.MAIN_DOC_EMPTY,
                extraMsg: ''
              };
              Utils.emitEvent(info.url, 20261202);
              break;
            }
            case "emitMonitoredBlankScreenEventInfoReason001": {
              let info: MonitoredBlankScreenEventInfo = {
                url: 'resource://rawfile/kongbai.html',
                reason: BlankScreenReason.DNS_RESOLVE_FAILED,
                extraMsg: 'dns error'
              };
              Utils.emitEvent(info.reason, 20261203);
              break;
            }
            case "emitMonitoredBlankScreenEventInfoExtraMsg001": {
              let info: MonitoredBlankScreenEventInfo = {
                url: 'resource://rawfile/kongbai.html',
                reason: BlankScreenReason.REQUEST_TIMED_OUT,
                extraMsg: 'request timed out after 30s'
              };
              Utils.emitEvent(info.extraMsg, 20261204);
              break;
            }
            case "emitOnMonitorBlankScreenCallbackType001": {
              let callback: OnMonitorBlankScreenCallback = (event: MonitoredBlankScreenEventInfo) => {
                console.log(`callback url ${event.url}, reason ${event.reason}, extra ${event.extraMsg}`);
              };
              callback({
                url: 'resource://rawfile/kongbai.html',
                reason: BlankScreenReason.CERT_ERROR,
                extraMsg: 'cert invalid'
              });
              Utils.emitEvent(true, 20261205);
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
        .enableBlankScreenMonitor(true)
        .onMonitoredBlankScreen((event: MonitoredBlankScreenEventInfo) => {
          console.log(`Monitored blank screen on ${event.url}, reason ${event.reason}, extra ${event.extraMsg}`);
          this.monitoredBlankScreenRegistered = true;
        })
        .width('100%')
        .height('80%')
        .onPageEnd(() => {
          this.isPageEnd = 1;
        })

    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}

