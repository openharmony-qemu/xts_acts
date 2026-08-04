/**
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
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import { Driver } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 112800;
const driver = Driver.create();

@Entry
@Component
struct webViewContEnableFullscreenVideoOverlay {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  fullScreenHandler?: FullScreenExitHandler;
  @State str: string = '';
  @State isOverlayEnabled: boolean = false;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State onFullScreenEnterCalled: boolean = false;
  @State onFullScreenExitCalled: boolean = false;
  @State videoWidth: number = 0;
  @State videoHeight: number = 0;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data?.ACTION != null) {
      this.str = eventData.data?.ACTION as string;
      this.isReceive = 1;
    }
  }

  private resetFullScreenState(): void {
    this.onFullScreenEnterCalled = false;
    this.onFullScreenExitCalled = false;
    this.videoWidth = 0;
    this.videoHeight = 0;
    this.fullScreenHandler = undefined;
  }

  private runJs(script: string): Promise<string> {
    return new Promise<string>((resolve) => {
      this.controller.runJavaScript(script, (error, result) => {
        if (error) {
          console.error(`runJavaScript ${script} error: ${JSON.stringify(error)}`);
          resolve('');
          return;
        }
        resolve(JSON.stringify(result));
      });
    });
  }

  private async exitFullScreenIfNeeded(): Promise<void> {
    if (this.fullScreenHandler) {
      this.onFullScreenExitCalled = false;
      this.fullScreenHandler.exitFullScreen();
      await Utils.waitForExist(() => this.onFullScreenExitCalled ? 1 : 0, this.str + ' cleanup exit', 1, 500, 10);
      return;
    }
    await this.runJs(`document.getElementById('btnExitFullScreen1') && document.getElementById('btnExitFullScreen1').click()`);
    await Utils.sleep(800);
  }

  private async clickWebForGesture(): Promise<void> {
    await Utils.waitAndClickComponent(driver, 'webViewContEnableFullscreenVideoOverlayWeb');
    await Utils.sleep(500);
  }

  private async triggerFullScreenByJs(videoIndex: number): Promise<void> {
    await this.clickWebForGesture();
    let btnId = videoIndex === 1 ? 'btnFullScreen1' : 'btnFullScreen2';
    await this.runJs(`document.getElementById('${btnId}').click()`);
    await Utils.sleep(800);
  }

  private async triggerExitFullScreenByJs(): Promise<void> {
    await this.clickWebForGesture();
    await this.runJs(`document.getElementById('btnExitFullScreen1').click()`);
    await Utils.sleep(800);
  }

  private async prepareTest(): Promise<void> {
    await this.exitFullScreenIfNeeded();
    this.resetFullScreenState();
    await Utils.sleep(300);
  }

  private async waitFullScreenEnter(): Promise<boolean> {
    await Utils.waitForExist(() => this.onFullScreenEnterCalled ? 1 : 0, this.str + ' enter', 1, 500, 15);
    return this.onFullScreenEnterCalled;
  }

  private async waitFullScreenExit(): Promise<boolean> {
    await Utils.waitForExist(() => this.onFullScreenExitCalled ? 1 : 0, this.str + ' exit', 1, 500, 15);
    return this.onFullScreenExitCalled;
  }

  private async enterFullScreenByButton(videoIndex: number): Promise<boolean> {
    await this.triggerFullScreenByJs(videoIndex);
    return await this.waitFullScreenEnter();
  }

  private async verifyDefaultDisabled(): Promise<void> {
    this.isOverlayEnabled = false;
    await this.prepareTest();
    await Utils.sleep(500);
    let entered = await this.enterFullScreenByButton(1);
    await this.exitFullScreenIfNeeded();
    Utils.emitEvent(entered, 112801);
  }

  private async verifyOverlayEnabled(): Promise<void> {
    this.isOverlayEnabled = true;
    await this.prepareTest();
    await Utils.sleep(500);
    let entered = await this.enterFullScreenByButton(1);
    let hasVideoSize = this.videoWidth > 0 && this.videoHeight > 0;
    await this.exitFullScreenIfNeeded();
    Utils.emitEvent(entered && hasVideoSize, 112802);
  }

  private async verifyExplicitDisabled(): Promise<void> {
    this.isOverlayEnabled = false;
    await this.prepareTest();
    await Utils.sleep(500);
    let entered = await this.enterFullScreenByButton(1);
    await this.exitFullScreenIfNeeded();
    Utils.emitEvent(entered, 112803);
  }

  private async verifyToggleBeforeEnter(): Promise<void> {
    this.isOverlayEnabled = true;
    await Utils.sleep(300);
    this.isOverlayEnabled = false;
    await this.prepareTest();
    await Utils.sleep(300);
    let entered = await this.enterFullScreenByButton(1);
    await this.exitFullScreenIfNeeded();
    Utils.emitEvent(entered, 112804);
  }

  private async verifyExitViaHandler(): Promise<void> {
    this.isOverlayEnabled = true;
    await this.prepareTest();
    await Utils.sleep(500);
    let entered = await this.enterFullScreenByButton(1);
    if (entered && this.fullScreenHandler) {
      this.onFullScreenExitCalled = false;
      this.fullScreenHandler.exitFullScreen();
    }
    let exited = await this.waitFullScreenExit();
    Utils.emitEvent(entered && exited, 112805);
  }

  private async verifyExitViaJs(): Promise<void> {
    this.isOverlayEnabled = false;
    await this.prepareTest();
    await Utils.sleep(500);
    let entered = await this.enterFullScreenByButton(1);
    if (entered) {
      this.onFullScreenExitCalled = false;
      await this.triggerExitFullScreenByJs();
    }
    let exited = await this.waitFullScreenExit();
    if (!exited && entered && this.fullScreenHandler) {
      this.onFullScreenExitCalled = false;
      this.fullScreenHandler.exitFullScreen();
      exited = await this.waitFullScreenExit();
    }
    Utils.emitEvent(entered && exited, 112806);
  }

  private async verifyChaining(): Promise<void> {
    this.isOverlayEnabled = true;
    await this.prepareTest();
    await Utils.sleep(500);
    let entered = await this.enterFullScreenByButton(1);
    await this.exitFullScreenIfNeeded();
    Utils.emitEvent(entered, 112807);
  }

  private async verifyClickButton(): Promise<void> {
    this.isOverlayEnabled = true;
    await this.prepareTest();
    await Utils.sleep(500);
    let entered = await this.enterFullScreenByButton(1);
    await this.exitFullScreenIfNeeded();
    Utils.emitEvent(entered, 112808);
  }

  private async verifySecondVideo(): Promise<void> {
    this.isOverlayEnabled = true;
    await this.prepareTest();
    await Utils.sleep(500);
    let entered = await this.enterFullScreenByButton(2);
    let hasVideoSize = this.videoWidth > 0 && this.videoHeight > 0;
    await this.exitFullScreenIfNeeded();
    Utils.emitEvent(entered && hasVideoSize, 112809);
  }

  private async verifyReloadThenFullScreen(): Promise<void> {
    this.isOverlayEnabled = true;
    await this.prepareTest();
    this.isPageEnd = -1;
    this.resetFullScreenState();
    this.controller.refresh();
    await Utils.waitForExist(() => this.isPageEnd, this.str + ' pageEnd', 1, 1000, 15);
    await this.runJs(`document.getElementById('btnFullScreen1') !== null`);
    await Utils.sleep(1000);
    let entered = await this.enterFullScreenByButton(1);
    await this.exitFullScreenIfNeeded();
    Utils.emitEvent(entered, 112810);
  }

  build() {
    Column() {
      Row() {
        Button('enableFullscreenVideoOverlayTest')
          .key('webViewContEnableFullscreenVideoOverlay')
          .onClick(async () => {
            await Utils.waitForExist(() => this.isPageEnd, 'webViewContEnableFullscreenVideoOverlayIsPageEnd', 1, 1000);
            await Utils.waitForExist(() => this.isReceive, 'webViewContEnableFullscreenVideoOverlayIsReceive', 1, 1000);
            console.info('key==>' + this.str);
            this.isReceive = -1;
            try {
              switch (this.str) {
                case 'emitEnableFullscreenVideoOverlay001':
                  await this.verifyDefaultDisabled();
                  break;
                case 'emitEnableFullscreenVideoOverlay002':
                  await this.verifyOverlayEnabled();
                  break;
                case 'emitEnableFullscreenVideoOverlay003':
                  await this.verifyExplicitDisabled();
                  break;
                case 'emitEnableFullscreenVideoOverlay004':
                  await this.verifyToggleBeforeEnter();
                  break;
                case 'emitEnableFullscreenVideoOverlay005':
                  await this.verifyExitViaHandler();
                  break;
                case 'emitEnableFullscreenVideoOverlay006':
                  await this.verifyExitViaJs();
                  break;
                case 'emitEnableFullscreenVideoOverlay007':
                  await this.verifyChaining();
                  break;
                case 'emitEnableFullscreenVideoOverlay008':
                  await this.verifyClickButton();
                  break;
                case 'emitEnableFullscreenVideoOverlay009':
                  await this.verifySecondVideo();
                  break;
                case 'emitEnableFullscreenVideoOverlay010':
                  await this.verifyReloadThenFullScreen();
                  break;
                default:
                  break;
              }
            } catch (error) {
              console.error(`verify error: ${JSON.stringify(error)}`);
            }
          })
      }

      Web({ src: $rawfile('enableFullscreenVideoOverlay.html'), controller: this.controller })
        .key('webViewContEnableFullscreenVideoOverlayWeb')
        .javaScriptAccess(true)
        .fileAccess(true)
        .mediaPlayGestureAccess(true)
        .enableFullscreenVideoOverlay(this.isOverlayEnabled)
        .height('85%')
        .onPageEnd(() => {
          console.log('onPageEnd enableFullscreenVideoOverlay');
          this.isPageEnd = 1;
        })
        .onFullScreenEnter((event) => {
          console.log('onFullScreenEnter videoWidth: ' + event.videoWidth + ', videoHeight: ' + event.videoHeight);
          this.fullScreenHandler = event.handler;
          this.onFullScreenEnterCalled = true;
          this.videoWidth = event.videoWidth ?? 0;
          this.videoHeight = event.videoHeight ?? 0;
        })
        .onFullScreenExit(() => {
          console.log('onFullScreenExit');
          this.onFullScreenExitCalled = true;
        })
    }
  }
}
