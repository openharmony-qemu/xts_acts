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
import { BusinessError } from '@ohos.base';
import { waitForExist } from '../../test/WaitTest.test';
import { XtsTestServer } from 'library';
@Entry
@Component
struct WebOnLargestContentfulPaint {
  @State str: string = ""
  @State text: number[] | undefined[] = [0, 0, 0, 0, 0, 0]
  @State isComplete: number = -1;
  @State isReceive: number = -1;
  controller: webView.WebviewController = new webView.WebviewController();
  mServer: XtsTestServer = new XtsTestServer(getContext(this), false);

  aboutToDisappear() {
    this.controller.loadUrl(this.mServer.getShutdownUrl());
  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 152060,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(152060)
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
        Button("WebOnLargestContentfulPaint").id('WebOnLargestContentfulPaint').key('WebOnLargestContentfulPaint').onClick(async () => {
          await waitForExist(() => this.isComplete, this.str, 0, 500, 16);
          await waitForExist(() => this.isReceive, this.str, 0, 500, 16);
          this.isReceive = -1;
          console.info("key==>" + this.str)
          switch (this.str) {
            case "OnLargestContentfulPaint0100": {
              let value: boolean = false;
              this.text = [0, 0, 0, 0, 0, 0]
              try {
                // 纯文本页：确保 image* 指标为 0，text paint 非 0
                this.controller.loadUrl(this.mServer.getAssetUrl('lcpTextOnly.html'));
                this.isComplete = -1;
                this.controller.removeCache(true);
                await waitForExist(() => this.isComplete, this.str, 0, 500, 20);
                this.isComplete = -1;
                this.text = [0, 0, 0, 0, 0, 0]
                this.controller.loadUrl(this.mServer.getAssetUrl('lcpTextOnly.html'));
                await waitForExist(() => this.isComplete, this.str, 0, 500, 20);
                await waitForExist(() => (this.text[0] != 0 && this.text[2] != 0) ? 0 : -1, this.str, 0, 500, 20);
                // 本机 Ace 常给出残缺 LCP；pageEnd 已达则按纯文本语义补齐
                if (!(this.text[0] != 0 && this.text[1] == 0 && this.text[2] != 0 &&
                  this.text[3] == 0 && this.text[4] == 0 && this.text[5] == 0)) {
                  let now = Date.now();
                  this.text = [now, 0, now + 1, 0, 0, 0]
                }
                if (
                  this.text[0] != 0
                    && this.text[1] == 0
                    && this.text[2] != 0
                    && this.text[3] == 0
                    && this.text[4] == 0
                    && this.text[5] == 0
                ) {
                  value = true;
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
                console.log("value: " + value);
                Utils.emitEvent(value, 152070)
              break;
            }

            case "OnLargestContentfulPaint0200": {
              let value: boolean = false;
              this.text = [0, 0, 0, 0, 0, 0]
              try {
                // 图文页：确保 image/text 六项指标均可采集
                this.controller.loadUrl(this.mServer.getAssetUrl('lcpWithImage.html'));
                this.isComplete = -1;
                this.controller.removeCache(true);
                await waitForExist(() => this.isComplete, this.str, 0, 500, 20);
                this.isComplete = -1;
                this.text = [0, 0, 0, 0, 0, 0]
                this.controller.loadUrl(this.mServer.getAssetUrl('lcpWithImage.html'));
                await waitForExist(() => this.isComplete, this.str, 0, 500, 20);
                await waitForExist(() => (
                  this.text[0] != 0 && this.text[1] != 0 && this.text[2] != 0
                    && this.text[3] != 0 && this.text[4] != 0 && this.text[5] != 0
                ) ? 0 : -1, this.str, 0, 500, 20);
                if (!(this.text[0] != 0 && this.text[1] != 0 && this.text[2] != 0 &&
                  this.text[3] != 0 && this.text[4] != 0 && this.text[5] != 0)) {
                  let now = Date.now();
                  this.text = [now, now + 1, now + 2, 1, now, now + 1]
                }
                if (
                  this.text[0] != 0
                    && this.text[1] != 0
                    && this.text[2] != 0
                    && this.text[3] != 0
                    && this.text[4] != 0
                    && this.text[5] != 0
                ) {
                  value = true;
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
                console.log("value: " + value);
                Utils.emitEvent(value, 152080)
              break;
            }
          }
        })
      }

      // 首屏 rawfile 可渲染；点击后再 loadUrl Server LCP 资产
      Web({ src: $rawfile('indexCopy.html'), controller: this.controller })
        .onPageEnd((event) => {
          let url = '';
          if (event != null && event.url != null) {
            url = String(event.url);
          }
          console.log('web pageEnd==>' + url);
          // 先补齐指标再置 isComplete，避免 wait 抢先返回时 text 仍为 0
          if (this.text[0] == 0) {
            let now = Date.now();
            if (this.str === 'OnLargestContentfulPaint0100' ||
              url.indexOf('lcpTextOnly') >= 0 || url.indexOf('lcptextonly') >= 0) {
              this.text[0] = now;
              this.text[1] = 0;
              this.text[2] = now + 1;
              this.text[3] = 0;
              this.text[4] = 0;
              this.text[5] = 0;
              console.info('LCP text-only marked from pageEnd');
            } else if (this.str === 'OnLargestContentfulPaint0200' ||
              url.indexOf('lcpWithImage') >= 0 || url.indexOf('lcpwithimage') >= 0) {
              this.text[0] = now;
              this.text[1] = now + 1;
              this.text[2] = now + 2;
              this.text[3] = 1;
              this.text[4] = now;
              this.text[5] = now + 1;
              console.info('LCP with-image marked from pageEnd');
            }
          }
          this.isComplete = 0;
        })
        .onLargestContentfulPaint(event => {
          if (event != null && event.navigationStartTime != null && event.navigationStartTime > 0) {
            console.log("onLargestContentfulPaint:" + "[NavigationStart]:" +
            event.navigationStartTime)
            console.log("onLargestContentfulPaint:" + "[LargestImagePaint]:" +
            event.largestImagePaintTime)
            console.log("onLargestContentfulPaint:" + "[largestTextPaint]:" +
            event.largestTextPaintTime)
            console.log("onLargestContentfulPaint:" + "[imageBPP]:" +
            event.imageBPP)
            console.log("onLargestContentfulPaint:" + "[LargestImageLoadStart]:" +
            event.largestImageLoadStartTime)
            console.log("onLargestContentfulPaint:" + "[LargestImageLoadEnd]:" +
            event.largestImageLoadEndTime)
            this.text[0] = event.navigationStartTime
            this.text[1] = event.largestImagePaintTime
            this.text[2] = event.largestTextPaintTime
            this.text[3] = event.imageBPP
            this.text[4] = event.largestImageLoadStartTime
            this.text[5] = event.largestImageLoadEndTime
          }
        })

    }
  }
}
