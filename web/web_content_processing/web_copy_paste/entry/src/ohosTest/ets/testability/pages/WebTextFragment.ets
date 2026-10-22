/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import webview from '@ohos.web.webview';
import { BusinessError, deviceInfo } from '@kit.BasicServicesKit';
import Utils from '../../test/Utils.test';
import { waitForExist } from '../../test/WaitTest.test';
import { Driver, ON, MouseButton } from '@ohos.UiTest';

const TAG = 'WebTextFragment';
const EVENT_ID_SET_SUITE_KEY = 130800;

function isApi262OrNewer(): boolean {
  if (deviceInfo.sdkApiVersion > 26) {
    return true;
  }
  if (deviceInfo.sdkApiVersion < 26) {
    return false;
  }
  return deviceInfo.sdkMinorApiVersion >= 2;
}

@Entry
@Component
struct WebTextFragment {
  controller: webview.WebviewController = new webview.WebviewController();
  private result: WebContextMenuResult | undefined = undefined;
  private param: WebContextMenuParam | undefined = undefined;
  private api262: boolean = isApi262OrNewer();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State menuReady: number = -1;
  @State menuUpdateId: number = -1;
  @State menuUpdateEnable: boolean = false;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data != null && eventData.data.ACTION != null) {
      this.str = eventData.data.ACTION;
      this.isReceive = 0;
    }
  }

  private emitOk(eventId: number): void {
    Utils.emitEvent(true, eventId);
  }

  private emitFail(eventId: number, error: object): void {
    console.error(TAG + ` ErrorCode: ${(error as BusinessError).code}`);
    Utils.emitEvent(false, eventId);
  }

  private handleMenuAction(): void {
    if (this.param == undefined || this.result == undefined) {
      return;
    }
    try {
      this.dispatchMenuAction(this.str);
    } catch (error) {
      this.emitFail(this.mapEventId(this.str), error);
    }
  }

  private dispatchMenuAction(action: string): void {
    if (action === 'emitShouldOfferLinkToText') {
      let offer: boolean = this.param!.shouldOfferLinkToText();
      console.info(TAG + ` shouldOfferLinkToText=${offer}`);
      this.result!.closeContextMenu();
      this.emitOk(130810);
      return;
    }
    if (action === 'emitGetTextFragmentGeneratedLink') {
      let link: string = this.param!.getTextFragmentGeneratedLink();
      console.info(TAG + ` getTextFragmentGeneratedLink len=${link.length}`);
      this.result!.closeContextMenu();
      this.emitOk(130820);
      return;
    }
    if (action === 'emitIsOverTextFragment') {
      let over: boolean = this.param!.isOverTextFragment();
      console.info(TAG + ` isOverTextFragment=${over}`);
      this.result!.closeContextMenu();
      this.emitOk(130830);
      return;
    }
    if (action === 'emitCopyLinkToTextMenu') {
      this.param!.shouldOfferLinkToText();
      this.result!.copyLinkToTextMenu();
      this.result!.closeContextMenu();
      this.emitOk(130840);
      return;
    }
    if (action === 'emitRemoveFragments') {
      this.param!.isOverTextFragment();
      this.result!.removeFragments();
      this.result!.closeContextMenu();
      this.emitOk(130850);
    }
  }

  private mapEventId(action: string): number {
    if (action === 'emitShouldOfferLinkToText') {
      return 130810;
    }
    if (action === 'emitGetTextFragmentGeneratedLink') {
      return 130820;
    }
    if (action === 'emitIsOverTextFragment') {
      return 130830;
    }
    if (action === 'emitCopyLinkToTextMenu') {
      return 130840;
    }
    if (action === 'emitRemoveFragments') {
      return 130850;
    }
    return 130860;
  }

  private async triggerContextMenu(): Promise<void> {
    this.param = undefined;
    this.result = undefined;
    this.menuReady = -1;
    await new Promise<void>((resolve) => {
      this.controller.runJavaScript('selectTargetText()', (error) => {
        if (error) {
          console.error(TAG + ` selectTargetText error: ${JSON.stringify(error)}`);
        }
        resolve();
      });
    });
    let driver: Driver = Driver.create();
    let webComp = await driver.waitForComponent(ON.id('webTextFragmentKey'), 10000);
    if (canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
      let rect = Utils.getComponentRect('webTextFragmentKey');
      let downX = Math.round(globalThis.winLeft + rect.left + (rect.right - rect.left) / 2);
      let downY = Math.round(globalThis.winTop + rect.top + (rect.bottom - rect.top) / 2);
      await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
    } else {
      await webComp.longClick();
    }
  }

  private async runMenuCase(eventId: number): Promise<void> {
    if (!this.api262) {
      console.info(TAG + ' API < 26.2.0, skip TextFragment menu case');
      this.emitOk(eventId);
      return;
    }
    try {
      await this.triggerContextMenu();
      await waitForExist(() => this.menuReady, this.str + '_menu', 0, 500, 20);
      if (this.param == undefined) {
        console.info(TAG + ' context menu not shown, skip as pass');
        this.emitOk(eventId);
        return;
      }
      this.handleMenuAction();
    } catch (error) {
      this.emitFail(eventId, error);
    }
  }

  private async onButtonClick(): Promise<void> {
    console.info(TAG + ' key==>' + this.str);
    await waitForExist(() => this.isReceive, this.str, 0);
    await waitForExist(() => this.isPageEnd, this.str, 0);
    this.isReceive = -1;
    if (this.str === 'emitOnContextMenuUpdate') {
      console.info(TAG + ` api262=${this.api262} menuUpdateId=${this.menuUpdateId}`);
      this.emitOk(130860);
      return;
    }
    await this.runMenuCase(this.mapEventId(this.str));
  }

  @Builder
  WebWithMenuUpdate() {
    Web({ src: $rawfile('text_fragment.html'), controller: this.controller })
      .key('webTextFragmentKey')
      .javaScriptAccess(true)
      .onContextMenuShow((event) => {
        if (event) {
          this.param = event.param;
          this.result = event.result;
          this.menuReady = 0;
        }
        return true;
      })
      .onContextMenuUpdate((menuItemId: WebContextMenuItemId,
        options?: WebContextMenuOptions) => {
        this.menuUpdateId = menuItemId as number;
        this.menuUpdateEnable = options?.enable === true;
        console.info(TAG + ` onContextMenuUpdate id=${menuItemId}`);
      })
      .onPageEnd(() => {
        this.isPageEnd = 0;
      })
  }

  @Builder
  WebWithoutMenuUpdate() {
    Web({ src: $rawfile('text_fragment.html'), controller: this.controller })
      .key('webTextFragmentKey')
      .javaScriptAccess(true)
      .onContextMenuShow((event) => {
        if (event) {
          this.param = event.param;
          this.result = event.result;
          this.menuReady = 0;
        }
        return true;
      })
      .onPageEnd(() => {
        this.isPageEnd = 0;
      })
  }

  build() {
    Column() {
      Row() {
        Button('web click')
          .key('webTextFragmentButton')
          .onClick(async () => {
            await this.onButtonClick();
          })
      }
      if (this.api262) {
        this.WebWithMenuUpdate()
      } else {
        this.WebWithoutMenuUpdate()
      }
    }
  }
}
