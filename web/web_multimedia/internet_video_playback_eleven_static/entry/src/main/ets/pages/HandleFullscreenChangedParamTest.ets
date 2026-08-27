
'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  OnPageBeginEvent,
  Row,
  Web
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import webview from '@ohos.web.webview';
import Utils from '../../src/test/Util.test';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext'
class MockNativeMediaPlayerBridge implements webview.NativeMediaPlayerBridge {
  updateRect: webview.UpdateRectFn = (x: double, y: double, width: double, height: double): void => {
    console.info('MockNativeMediaPlayerBridge updateRect');
  }
  play: webview.ZeroParamFn<void> = (): void => {
    console.info('MockNativeMediaPlayerBridge play');
  }
  pause: webview.ZeroParamFn<void> = (): void => {
    console.info('MockNativeMediaPlayerBridge pause');
  }
  seek: webview.OneParamFn<double> = (targetTime: double): void => {
    console.info('MockNativeMediaPlayerBridge seek');
  }
  setVolume: webview.OneParamFn<double> = (volume: double): void => {
    console.info('MockNativeMediaPlayerBridge setVolume');
  }
  setMuted: webview.OneParamFn<boolean> = (muted: boolean): void => {
    console.info('MockNativeMediaPlayerBridge setMuted');
  }
  setPlaybackRate: webview.OneParamFn<double> = (playbackRate: double): void => {
    console.info('MockNativeMediaPlayerBridge setPlaybackRate');
  }
  release: webview.ZeroParamFn<void> = (): void => {
    console.info('MockNativeMediaPlayerBridge release');
  }
  enterFullscreen: webview.ZeroParamFn<void> = (): void => {
    console.info('MockNativeMediaPlayerBridge enterFullscreen');
  }
  exitFullscreen: webview.ZeroParamFn<void> = (): void => {
    console.info('MockNativeMediaPlayerBridge exitFullscreen');
  }
}

@Entry
@Component
struct HandleFullscreenChangedParamTest {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = "";
  nativeMediaPlayerHandler?: webview.NativeMediaPlayerHandler;

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear ' + this.valueChangeCallBack);
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION value: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('HandleFullscreenChangedParamTest click')
          .key('HandleFullscreenChangedParamTestButton')
          .onClick((e: ClickEvent) => {
            console.info("key==>" + this.str);
            switch (this.str) {
              case 'testHandleFullscreenChangedParamNull001': {
                try {
                  this.nativeMediaPlayerHandler?.handleFullscreenChanged(
                    null as boolean);
                  Utils.emitEvent('no error', 202609031)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 202609031)
                }
                break;
              }
              case 'testHandleFullscreenChangedParamUndefined001': {
                try {
                  this.nativeMediaPlayerHandler?.handleFullscreenChanged(
                    undefined as boolean);
                  Utils.emitEvent('no error', 202609032)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(String(error.code), 202609032)
                }
                break;
              }

            }
          })
      }

      Web({ src: 'resource://rawfile/nativeMediaPlayerHandler.html', controller: this.controller })
        .enableNativeMediaPlayer({ enable: true, shouldOverlay: true })
        .onPageBegin((event: OnPageBeginEvent): void => {
          console.info('onPageBegin, url:' + event.url);
          if (this.controller.onCreateNativeMediaPlayer) {
            let callback: webview.CreateNativeMediaPlayerCallback =
              (handler: webview.NativeMediaPlayerHandler, mediaInfo: webview.MediaInfo) => {
                console.info('onCreateNativeMediaPlayer callback, mediaInfo:' + JSON.stringify(mediaInfo));
                this.nativeMediaPlayerHandler = handler;
                return new MockNativeMediaPlayerBridge();
              }
            this.controller.onCreateNativeMediaPlayer(callback);
          }
          console.info('onPageBegin exit');
        })
    }
  }
}
