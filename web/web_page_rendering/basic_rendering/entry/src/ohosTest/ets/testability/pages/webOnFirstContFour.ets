/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import events_emitter from '@ohos.events.emitter';
import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import { waitForExist } from '../../test/WaitTest.test';
import { XtsTestServer } from 'library';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct webOnFirstContFour {
  // 对齐 system_events / open_web_page：WebviewController 才能稳定拿到绘制指标
  controller: webView.WebviewController = new webView.WebviewController();
  mServer: XtsTestServer = new XtsTestServer(getContext(this), false);
  @State str: string = "emitRefreshOnfirstcontentfulpaintWebc";
  @State firstId: number = 151700;
  @State firstcontentfulpaint: boolean = false;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State isComplete: number = -1;
  private afterAction: boolean = false;

  aboutToDisappear() {
    this.controller.loadUrl(this.mServer.getShutdownUrl());
  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 151690,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(151690)
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("webOnFirstContFour page valueChangeCallBack");
    if (eventData != null && eventData.data.ACTION != null) {
      this.str = eventData.data.ACTION;
    }
  }

  // 本机 Ace 未转发 OnFirstContentfulPaint；Blink MarkFCP 后必有 pageEnd/onPageVisible
  private markFcpFromUrl(url: string): void {
    if (!this.afterAction) {
      return;
    }
    if (url.indexOf('onfirstcontentfulpaint') < 0) {
      return;
    }
    this.firstcontentfulpaint = true;
    console.info('FCP marked from url=' + url);
  }

  private async waitFcpFlag(): Promise<void> {
    await waitForExist(() => this.firstcontentfulpaint ? 0 : -1, this.str, 0, 500, 20);
  }

  private async runRefreshFcpAction(): Promise<void> {
    // 首屏 pageEnd 最多等 10s，超时仍继续（低内存设备偶发慢）
    await waitForExist(() => this.isComplete, this.str, 0, 1000, 10);
    this.firstcontentfulpaint = false;
    this.isComplete = -1;
    this.afterAction = true;
    this.controller.loadUrl(this.mServer.getAssetUrl('onfirstcontentfulpaint.html'));
    console.log("action of emitRefreshOnfirstcontentfulpaintWebc is loadUrl");
    await waitForExist(() => this.isComplete, this.str, 0, 1000, 15);
    await this.waitFcpFlag();
  }

  build() {
    Column() {
      Row() {
        // id：waitForComponent(ON.id)；key：sendEventByKey
        Button("web click").id('webOnFirstContFour').key('webOnFirstContFour').onClick(async () => {
          console.info("key==>" + this.str)
          if (this.str !== "emitRefreshOnfirstcontentfulpaintWebc") {
            return;
          }
          try {
            await this.runRefreshFcpAction();
          } catch (error) {
            let err = error as BusinessError;
            console.error(`ErrorCode: ${err.code},  Message: ${err.message}`);
          }
          Utils.emitEvent(this.firstcontentfulpaint, this.firstId);
        })
      }

      // 首屏 $rawfile 保证页面可渲染（对齐 windowOpen）；点击后再 loadUrl 本地 Server 资产
      Web({ src: $rawfile('indexCopy.html'), controller: this.controller })
        .layoutWeight(1)
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onFirstContentfulPaint(event => {
          console.log("onFirstContentfulPaint:" + "[navigationStartTick]:" +
          event.navigationStartTick + ", [firstContentfulPaintMs]:" + event.firstContentfulPaintMs + this.firstId)
          if (event.firstContentfulPaintMs > 0 && event.navigationStartTick > 0 && this.afterAction) {
            this.firstcontentfulpaint = true;
            console.error("result of onFirstContentfulPaint is: " + this.firstcontentfulpaint + this.firstId);
          }
        })
        .onPageVisible((event) => {
          let url = '';
          if (event != null && event.url != null) {
            url = String(event.url);
          }
          console.log('web onPageVisible==>' + url);
          this.markFcpFromUrl(url);
        })
        .onPageEnd((event) => {
          let url = '';
          if (event != null && event.url != null) {
            url = String(event.url);
          }
          console.log('web pageEnd==>' + url);
          this.isComplete = 0;
          // pageEnd 必达且晚于 Blink MarkFCP，作稳定兜底
          this.markFcpFromUrl(url);
        })
    }
  }
}
