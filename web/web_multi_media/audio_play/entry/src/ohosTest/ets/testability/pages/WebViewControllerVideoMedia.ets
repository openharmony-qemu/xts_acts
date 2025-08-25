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


import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { waitForExist } from '../../test/WaitTest.test';
import { Driver, ON } from '@ohos.UiTest';

@Entry
@Component
struct WebViewControllerVideoMedia {
  @State str: string = ""
  @State userAgentPC:string = "";
  controller: webView.WebviewController = new webView.WebviewController();
  @State backStateArr:string[] = ['MediaPlaybackState.NONE','MediaPlaybackState.PLAYING','MediaPlaybackState.PAUSED','MediaPlaybackState.STOPPED']
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  res: webView.MediaPlaybackState = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 132260,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(132260)
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
    Column() {
      Row() {
        Button("WebViewControllerVideoMedia").id('WebViewControllerVideoMedia').onClick(async () => {
          console.info('key==>' + this.str)
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case "StopAllMedia0100": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);

                this.controller.runJavaScript("playVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.stopAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 3);
                this.res = this.controller.getMediaPlaybackState();
                console.log("StopAllMedia0100 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[3], 132270)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132270)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "StopAllMedia0200": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);
                
                let driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);

                this.controller.stopAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 0);
                this.res = this.controller.getMediaPlaybackState();
                console.log("StopAllMedia0200 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[0], 132280)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132280)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "StopAllMedia0300": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);

                this.controller.runJavaScript("playVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.stopAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 3);
                this.controller.stopAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 3);
                this.res = this.controller.getMediaPlaybackState();
                console.log("StopAllMedia0300 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[3], 132290)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132290)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "StopAllMedia0400": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);

                this.controller.runJavaScript("playVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.runJavaScript("pauseVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.controller.stopAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.res = this.controller.getMediaPlaybackState();
                console.log("StopAllMedia0400 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 132300)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132300)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "StopAllMedia0500": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.pauseAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.controller.stopAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.res = this.controller.getMediaPlaybackState();
                console.log("StopAllMedia0500 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 132310)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132310)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "StopAllMedia0600": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.stopAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 3);
                this.res = this.controller.getMediaPlaybackState();
                console.log("StopAllMedia0600 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[3], 132320)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132320)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "StopAllMedia0700": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()")
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.runJavaScript("pauseVideo2()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.stopAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 3);
                this.res = this.controller.getMediaPlaybackState();
                console.log("StopAllMedia0700 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[3], 132330)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132330)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "StopAllMedia0800": {
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video3.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
                this.controller.runJavaScript("playAudio()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.stopAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 3);
                this.res = this.controller.getMediaPlaybackState();
                console.log("StopAllMedia0800 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[3], 132340)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132340)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "ResumeAllMedia0100": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.pauseAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.controller.resumeAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.res = this.controller.getMediaPlaybackState();
                console.log("ResumeAllMedia0100 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[1], 132350)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132350)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "ResumeAllMedia0200": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.resumeAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 0);
                this.res = this.controller.getMediaPlaybackState();
                console.log("ResumeAllMedia0200 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[0], 132360)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132360)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "ResumeAllMedia0300": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.resumeAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.res = this.controller.getMediaPlaybackState();
                console.log("ResumeAllMedia0300 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[1], 132370)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132370)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "ResumeAllMedia0400": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.runJavaScript("pauseVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.controller.resumeAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.res = this.controller.getMediaPlaybackState();
                console.log("ResumeAllMedia0400 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 132380)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132380)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "ResumeAllMedia0500": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.stopAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 3);
                this.controller.resumeAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 3);
                this.res = this.controller.getMediaPlaybackState();
                console.log("ResumeAllMedia0500 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[3], 132390)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132390)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "ResumeAllMedia0600": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.pauseAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.controller.resumeAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.res = this.controller.getMediaPlaybackState();
                console.log("ResumeAllMedia0600 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[1], 132400)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132400)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "ResumeAllMedia0700": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video3.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
                this.controller.runJavaScript("playAudio()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.pauseAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.controller.resumeAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.res = this.controller.getMediaPlaybackState();
                console.log("ResumeAllMedia0700 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[1], 132410)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132410)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "PauseAllMedia0100": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.pauseAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.res = this.controller.getMediaPlaybackState();
                console.log("PauseAllMedia0100 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 132420)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132420)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "PauseAllMedia0200": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.pauseAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.res = this.controller.getMediaPlaybackState();
                console.log("PauseAllMedia0200 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 132430)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132430)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "PauseAllMedia0300": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.stopAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 3);
                this.controller.pauseAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.res = this.controller.getMediaPlaybackState();
                console.log("PauseAllMedia0300 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 132440)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132440)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "PauseAllMedia0400": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.runJavaScript("pauseVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.controller.pauseAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.res = this.controller.getMediaPlaybackState();
                console.log("PauseAllMedia0400 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 132450)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132450)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "PauseAllMedia0500": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.pauseAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.controller.pauseAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.res = this.controller.getMediaPlaybackState();
                console.log("PauseAllMedia0500 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 132460)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132460)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "PauseAllMedia0600": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.pauseAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.res = this.controller.getMediaPlaybackState();
                console.log("PauseAllMedia0600 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 132470)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132470)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "PauseAllMedia0700": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.runJavaScript("pauseVideo2()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.pauseAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.res = this.controller.getMediaPlaybackState();
                console.log("PauseAllMedia0700 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 132480)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132480)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "PauseAllMedia0800": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video3.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
                this.controller.runJavaScript("playAudio()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.pauseAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.res = this.controller.getMediaPlaybackState();
                console.log("PauseAllMedia0800 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 132490)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132490)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0100": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0100 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[0], 132500)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132500)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0200": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0200 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[1], 132510)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132510)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0300": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.pauseAllMedia()
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0300 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 132520)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132520)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0400": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.runJavaScript("pauseVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0400 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 132530)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132530)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0500": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.stopAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 3);
                this.res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0500 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[3], 132540)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132540)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0600": {
              let back_res: boolean = false;
              let num1: number = -1;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);

                this.controller.runJavaScript("enterFullScreen()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 0);
                this.controller.runJavaScript("playVideo()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.closeAllMediaPresentations();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 3);
                this.res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0600 res: " + this.res);
                const intervalId = setInterval(() => {
                  this.controller.runJavaScript("isVideoFullScreen()", (err, isFull) => {
                    num1 = Number.parseInt(isFull);
                    console.info("key==>isFull_132550):" + isFull)
                    if ((num1 == 0) && (this.res == 3)) {
                      back_res = true;
                      clearInterval(intervalId)
                    }
                 })
                }, 100);
                await waitForExist(()=> ''+back_res, this.str, 'true');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 132550)
                } else {
                  Utils.emitEvent(back_res, 132550)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0700": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0700 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[0], 132560)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132560)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0800": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo1()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0800 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[1], 132570)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132570)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0900": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0900 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[1], 132580)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132580)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState1000": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.runJavaScript("pauseVideo1()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState1000 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[1], 132590)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132590)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState1100": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.runJavaScript("pauseVideo1()");
                this.controller.runJavaScript("pauseVideo2()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState1100 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 132600)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132600)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState1200": {              
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let driver:Driver = Driver.create();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 1);
                this.controller.pauseAllMedia();
                await waitForExist(() => this.controller.getMediaPlaybackState(), this.str, 2);
                this.res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState1200 res: " + this.res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 132610)
                } else {
                  Utils.emitEvent(this.backStateArr[this.res], 132610)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("video1.html"), controller: this.controller })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}
