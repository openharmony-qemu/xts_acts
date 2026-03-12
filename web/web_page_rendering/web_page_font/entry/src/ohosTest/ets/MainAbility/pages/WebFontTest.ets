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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import {waitForExist} from '../../test/WaitTest.test';

@Entry
@Component
struct WebFontTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State font: string|null|undefined = 'serif'
  @State defaultFixedFontSize: number|null|undefined = 72
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State family: string|null|undefined = "sans-serif";
  @State fixedFont: string|null|undefined = "monospace";
  @State webSerifFont: string|null|undefined = "serif";
  @State textEncodingFormat:string|null|undefined = 'UTF-8';
  @State forceDisplayScrollBar:boolean = true;
  @State horizontalScrollBarAccess:boolean = true;
  @State verticalScrollBar:boolean = true;
  @State pinchSmooth:boolean = true;
  @State nestedScroll:NestedScrollOptions | NestedScrollOptionsExt | null |undefined = {
    scrollForward: NestedScrollMode.SELF_FIRST,
    scrollBackward: NestedScrollMode.SELF_FIRST,
  }
  @State tag :string|null|undefined = 'object';
  @State type:string|null|undefined = 'native';
  @State copyOptions:CopyOptions|null|undefined = CopyOptions.None;
  @State textAutosizing:boolean = true;
  @State enableNativeMediaPlayer:NativeMediaPlayerConfig|null |undefined = {enable: true, shouldOverlay: false}
  @State editMenuOptions:EditMenuOptions|null|undefined =null
  @State avoidMode: WebKeyboardAvoidMode = WebKeyboardAvoidMode.RESIZE_VISUAL;
  @State webElementType:WebElementType|null|undefined = WebElementType.TEXT;
  @State customBuilder:CustomBuilder |null|undefined = null;
  @State webResponseType:WebResponseType|null|undefined =  WebResponseType.LONG_PRESS;
  @State selectionMenuOptionsExt:SelectionMenuOptionsExt|null|undefined = null;
  @State condition: WebBypassVsyncCondition = WebBypassVsyncCondition.NONE;
  @State effect: WebRotateEffect = WebRotateEffect.TOPLEFT_EFFECT;
  @State dataDetectorConfig:TextDataDetectorConfig|null|undefined = {
    types: [
      TextDataDetectorType.PHONE_NUMBER,
      TextDataDetectorType.EMAIL
    ],
    color: Color.Red,
    decoration: {
      type: TextDecorationType.LineThrough,
      color: Color.Green,
      style: TextDecorationStyle.WAVY
    }
  }
  @State detectConfig:BlankScreenDetectionConfig|null|undefined = {
    enable: true,
    detectionTiming: [2, 4, 6, 8],
    contentfulNodesCountThreshold: 4,
    detectionMethods:[BlankScreenDetectionMethod.DETECTION_CONTENTFUL_NODES_SEVENTEEN]
  }
  @State embedOptions:EmbedOptions|null|undefined =  {supportDefaultIntrinsicSize: true};

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 150140,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(150140)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button("WebFontTestButton")
          .key('WebFontTestButton')
          .onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
            console.info("key==>" + this.str)
            switch (this.str) {
              case "testWebStandardFont001": {
                try {
                  this.font = 'serif'
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150150)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150150)
                }
                break;
              }
              case "testWebStandardFont002": {
                try {
                  this.font = 'monospace'
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150160)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150160)
                }
                break;
              }
              case "testWebStandardFont003": {
                try {
                  this.font = 'Helvetica'
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150170)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150170)
                }
                break;
              }
              case "testWebStandardFont004": {
                try {
                  this.font = 'Arial'
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150180)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150180)
                }
                break;
              }
              case "testWebStandardFont005": {
                try {
                  this.font = 'sans serif'
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150190)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150190)
                }
                break;
              }
              case "testWebStandardFont006": {
                try {
                  this.font = null
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150200)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150200)
                }
                break;
              }
              case "testWebStandardFont007": {
                try {
                  this.font = undefined
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150210)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150210)
                }
                break;
              }
              case "testWebStandardFont008": {
                try {
                  this.font = ''
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150220)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150220)
                }
                break;
              }

              case "testWebStandardFont009": {
                try {
                  this.font = 'serif'
                  this.defaultFixedFontSize = null
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150230)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150230)
                }
                break;
              }

              case "testWebStandardFont010": {
                try {
                  this.defaultFixedFontSize = undefined
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150240)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150240)
                }
                break;
              }

              case "testWebStandardFont011": {
                try {
                  this.family = ''
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150250)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150250)
                }
                break;
              }

              case "testWebStandardFont012": {
                try {
                  this.family = null
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150260)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150260)
                }
                break;
              }

              case "testWebStandardFont013": {
                try {
                  this.family = undefined
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150270)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150270)
                }
                break;
              }

              case "testWebStandardFont014": {
                try {
                  this.fixedFont = ''
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150280)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150280)
                }
                break;
              }

              case "testWebStandardFont015": {
                try {
                  this.fixedFont = null
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150290)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150290)
                }
                break;
              }

              case "testWebStandardFont016": {
                try {
                  this.fixedFont = undefined
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      this.fixedFont = 'monospace'
                      Utils.emitEvent(result, 150300)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150300)
                }
                break;
              }

              case "testWebStandardFont017": {
                try {
                  this.webSerifFont = ''
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150310)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150310)
                }
                break;
              }

              case "testWebStandardFont018": {
                try {
                  this.webSerifFont = null
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150320)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150320)
                }
                break;
              }

              case "testWebStandardFont019": {
                try {
                  this.webSerifFont = undefined
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      this.webSerifFont = 'serif'
                      Utils.emitEvent(result, 150330)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150330)
                }
                break;
              }

              case "testWebStandardFont020": {
                try {
                  this.webSerifFont = ''
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150340)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150340)
                }
                break;
              }

              case "testWebStandardFont021": {
                try {
                  this.webSerifFont = null
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150340)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150340)
                }
                break;
              }

              case "testWebStandardFont022": {
                try {
                  this.webSerifFont = undefined
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150350)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150350)
                }
                break;
              }

              case "testWebStandardFont023": {
                try {
                  this.webSerifFont = null
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      this.webSerifFont = 'serif'
                      Utils.emitEvent(result, 150360)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150360)
                }
                break;
              }

              case "testWebStandardFont024": {
                try {
                  this.forceDisplayScrollBar = false
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      this.forceDisplayScrollBar = true
                      Utils.emitEvent(result, 150370)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150370)
                }
                break;
              }

              case "testWebStandardFont025": {
                try {
                  this.horizontalScrollBarAccess = false
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      this.horizontalScrollBarAccess = true
                      Utils.emitEvent(result, 150380)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150380)
                }
                break;
              }

              case "testWebStandardFont026": {
                try {
                  this.verticalScrollBar = false
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      this.verticalScrollBar = true
                      Utils.emitEvent(result, 150390)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150390)
                }
                break;
              }

              case "testWebStandardFont027": {
                try {
                  this.pinchSmooth = false
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      this.pinchSmooth = true
                      Utils.emitEvent(result, 150400)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150400)
                }
                break;
              }

              case "testWebStandardFont028": {
                try {
                  this.nestedScroll = null
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150410)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150410)
                }
                break;
              }

              case "testWebStandardFont029": {
                try {
                  this.nestedScroll = undefined
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      this.nestedScroll = {
                        scrollForward: NestedScrollMode.SELF_FIRST,
                        scrollBackward: NestedScrollMode.SELF_FIRST,
                      }
                      Utils.emitEvent(result, 150420)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150420)
                }
                break;
              }

              case "testWebStandardFont030": {
                try {
                  this.tag = '';
                  this.type = '';
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150430)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150430)
                }
                break;
              }

              case "testWebStandardFont031": {
                try {
                  this.tag = null;
                  this.type = null;
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150440)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150440)
                }
                break;
              }

              case "testWebStandardFont032": {
                try {
                  this.tag = undefined;
                  this.type = undefined;
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      this.tag = 'object';
                      this.type = 'native'
                      Utils.emitEvent(result, 150450)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150450)
                }
                break;
              }

              case "testWebStandardFont033": {
                try {
                  this.copyOptions = null
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150460)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150460)
                }
                break;
              }

              case "testWebStandardFont034": {
                try {
                  this.copyOptions = undefined
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      this.copyOptions = CopyOptions.None;
                      Utils.emitEvent(result, 150470)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150470)
                }
                break;
              }

              case "testWebStandardFont035": {
                try {
                  this.isPageEnd = -1;
                  this.textAutosizing = false
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      this.textAutosizing = true
                      Utils.emitEvent(result, 150480)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150480)
                }
                break;
              }

              case "testWebStandardFont036": {
                try {
                  this.enableNativeMediaPlayer = null
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150490)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150490)
                }
                break;
              }

              case "testWebStandardFont037": {
                try {
                  this.enableNativeMediaPlayer = undefined
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      this.enableNativeMediaPlayer ={enable: true, shouldOverlay: false}
                      Utils.emitEvent(result, 150500)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150500)
                }
                break;
              }

              case "testWebStandardFont038": {
                try {
                  this.editMenuOptions = undefined
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      this.editMenuOptions = null
                      Utils.emitEvent(result, 150510)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150510)
                }
                break;
              }

              case "testWebStandardFont039": {
                try {
                  this.avoidMode = WebKeyboardAvoidMode.RESIZE_CONTENT
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      this.avoidMode = WebKeyboardAvoidMode.RESIZE_VISUAL
                      Utils.emitEvent(result, 150520)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150520)
                }
                break;
              }

              case "testWebStandardFont040": {
                try {
                  this.customBuilder = undefined
                  this.selectionMenuOptionsExt = undefined

                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      this.customBuilder = null
                      this.selectionMenuOptionsExt = null
                      Utils.emitEvent(result, 150530)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150530)
                }
                break;
              }

              case "testWebStandardFont041": {
                try {
                  this.dataDetectorConfig = null
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)

                      Utils.emitEvent(result, 150540)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150540)
                }
                break;
              }

              case "testWebStandardFont042": {
                try {
                  this.dataDetectorConfig = undefined
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                    this.dataDetectorConfig =   {
                        types: [
                          TextDataDetectorType.PHONE_NUMBER,
                          TextDataDetectorType.EMAIL
                        ],
                        color: Color.Red,
                      decoration: {
                        type: TextDecorationType.LineThrough,
                        color: Color.Green,
                        style: TextDecorationStyle.WAVY
                      }
                      }
                      Utils.emitEvent(result, 150550)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150550)
                }
                break;
              }


              case "testWebStandardFont043": {
                try {
                  this.detectConfig =  {
                    enable: false,
                    detectionTiming: [],
                    contentfulNodesCountThreshold: 4,
                    detectionMethods:[]
                  }
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150560)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150560)
                }
                break;
              }

              case "testWebStandardFont044": {
                try {
                  this.detectConfig =  null
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      Utils.emitEvent(result, 150570)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150570)
                }
                break;
              }

              case "testWebStandardFont045": {
                try {
                  this.detectConfig =  undefined
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                    this.detectConfig =  {
                      enable: true,
                      detectionTiming: [2, 4, 6, 8],
                      contentfulNodesCountThreshold: 4,
                      detectionMethods:[BlankScreenDetectionMethod.DETECTION_CONTENTFUL_NODES_SEVENTEEN]
                    }
                      Utils.emitEvent(result, 150580)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150580)
                }
                break;
              }

              case "testWebStandardFont046": {
                try {
                  this.embedOptions =  {supportDefaultIntrinsicSize: false};
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)

                      Utils.emitEvent(result, 150590)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150590)
                }
                break;
              }

              case "testWebStandardFont047": {
                try {
                  this.embedOptions =  null;
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)

                      Utils.emitEvent(result, 150600)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150600)
                }
                break;
              }

              case "testWebStandardFont048": {
                try {
                  this.embedOptions =  undefined;
                  this.isPageEnd = -1;
                  this.controller.refresh();
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/font.html");
                  await waitForExist(() => this.isPageEnd, this.str, 0);
                  this.controller.runJavaScript("getFontFamily()", (error, result) => {
                    if (error) {
                      console.info('getFontFamily() return error: ' + error)
                    }
                    if (result) {
                      console.info('getFontFamily() return result: ' + result)
                      this.embedOptions = {supportDefaultIntrinsicSize: true}
                      Utils.emitEvent(result, 150610)
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent('', 150610)
                }
                break;
              }


            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .height('50%')
          .width('100%')
          .webStandardFont(this.font)
          .defaultFixedFontSize(this.defaultFixedFontSize)
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .webSansSerifFont(this.family)
          .webFixedFont(this.fixedFont)
          .webSerifFont(this.webSerifFont)
          .defaultTextEncodingFormat(this.textEncodingFormat)
          .forceDisplayScrollBar(this.forceDisplayScrollBar)
          .horizontalScrollBarAccess(this.horizontalScrollBarAccess)
          .verticalScrollBarAccess(this.verticalScrollBar)
          .pinchSmooth(this.pinchSmooth)
          .nestedScroll(this.nestedScroll)
          .registerNativeEmbedRule(this.tag,this.type)
          .copyOptions(this.copyOptions)
          .textAutosizing(this.textAutosizing)
          .enableNativeMediaPlayer(this.enableNativeMediaPlayer)
          .editMenuOptions(this.editMenuOptions)
          .keyboardAvoidMode(this.avoidMode)
          .enableHapticFeedback(false)
          .bindSelectionMenu(this.webElementType,this.customBuilder,this.webResponseType,this.selectionMenuOptionsExt)
          .enableFollowSystemFontWeight(false)
          .enableWebAVSession(false)
          .optimizeParserBudget(false)
          .enableDataDetector(false)
          .bypassVsyncCondition(this.condition)
          .forceEnableZoom(false)
          .rotateRenderEffect(this.effect)
          .zoomControlAccess(false)
          .backToTop(true)
          .enableSelectedDataDetector(false)
          .enableAutoFill(false)
          .enableImageAnalyzer(true)
          .dataDetectorConfig(this.dataDetectorConfig)
          .blankScreenDetectionConfig(this.detectConfig)
          .nativeEmbedOptions(this.embedOptions)
          .onPageEnd((event) => {
            if (event) {
              this.isPageEnd = 0;
              console.log('onPageEnd url:' + event.url);
            }
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}