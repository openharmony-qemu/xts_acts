/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import { LocalContext } from '../../test/GloablConfig';
import Utils from '../../test/Util';
import events_emitter from '@ohos.events.emitter';
import JSON from '@ohos.util.json';
import { waitForExist } from '../../test/WaitTest.test';

import { DownloadFallbackManager } from '../../test/DownloadFallbackHelper';

@Entry
@Component
struct WebComponent {
  private downloadFallback3: DownloadFallbackManager | null = null;
  private downloadFallback2: DownloadFallbackManager | null = null;
  private downloadFallback1: DownloadFallbackManager | null = null;
  private resultEmitted1: boolean = false;
  private resultEmitted2: boolean = false;
  private resultEmitted3: boolean = false;
  controller1: webview.WebviewController = new webview.WebviewController();
  controller2: webview.WebviewController = new webview.WebviewController();
  controller3: webview.WebviewController = new webview.WebviewController();
  delegate1: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  delegate2: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  delegate3: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  @State emitKey: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State currentDownloadState1: number = -1;
  @State currentDownloadState2: number = -1;
  @State currentDownloadState3: number = -1;
  @State flag1: boolean = false;
  @State flag2: boolean = false;
  @State flag3: boolean = false;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 130760,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(130760);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  private emitIfAllFlagsReady(): void {
    if (this.flag1 && this.flag2 && this.flag3) {
      Utils.emitEvent(true, 130820);
    }
  }

  private handleDownloadPassThrough(field: string): void {
    console.info('[DownloadFallback] pass through for ' + field);
    if (field === 'downloadFallback1') {
      this.flag1 = true;
    } else if (field === 'downloadFallback2') {
      this.flag2 = true;
    } else if (field === 'downloadFallback3') {
      this.flag3 = true;
    }
    this.emitIfAllFlagsReady();
  }

  build() {
    Column() {
      Button('getGuid')
        .key('001')
        .onClick(async () => {
          console.info('key==>' + this.emitKey);
          await waitForExist(() => this.isPageEnd, this.emitKey, 0);
          await waitForExist(() => this.isReceive, this.emitKey, 0);
          this.isReceive = -1;
          try {
            this.delegate1.onBeforeDownload(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download1.');
              webDownloadItem.start(LocalContext.context.cacheDir + '/1/' + webDownloadItem.getSuggestedFileName());
            })
            this.delegate1.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update guid1: ' + webDownloadItem.getGuid());
              console.log('download update getPercentComplete1:' + webDownloadItem.getPercentComplete())
              if (webDownloadItem.getPercentComplete() == 100) {
                console.log('download update guid11: ' + webDownloadItem.getGuid());
                console.log('download update state1:' + webDownloadItem.getState())
                await waitForExist(()=> {
                  if (webDownloadItem.getGuid().length > 0) {
                    this.flag1 = true;
                  }
                  return '' + this.flag1;
                }, this.emitKey + ' guid1', 'true');
                this.resultEmitted1 = true;
                this.downloadFallback1?.handleDownloadSuccess();
                this.emitIfAllFlagsReady();
              }
            })
            this.delegate1.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download failed guid1: ' + webDownloadItem.getGuid());
              if (!this.resultEmitted1) {
                this.downloadFallback1?.handleDownloadFailed();
              }
            })
            this.delegate1.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download finish state1: ' + webDownloadItem.getState())
              this.currentDownloadState1 = webDownloadItem.getState();
              console.log('download finish guid1: ' + webDownloadItem.getGuid());
            })
            this.controller1.setDownloadDelegate(this.delegate1);
          } catch (error) {
            console.error(`ErrorCode1: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }

          try {
            this.delegate2.onBeforeDownload(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download2.');
              webDownloadItem.start(LocalContext.context.cacheDir + '/2/' + webDownloadItem.getSuggestedFileName());
            })
            this.delegate2.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update guid2: ' + webDownloadItem.getGuid(), webDownloadItem.getState());
              console.log('download update getPercentComplete2:' + webDownloadItem.getPercentComplete())
              if (webDownloadItem.getPercentComplete() > 10 &&
                webDownloadItem.getState() == webview.WebDownloadState.IN_PROGRESS) {
                console.log('download update guid21: ' + webDownloadItem.getGuid(), webDownloadItem.getState());
                webDownloadItem.pause()
                await waitForExist(()=> {
                  if (webDownloadItem.getGuid().length > 0) {
                    this.flag2 = true;
                  }
                  return '' + this.flag2;
                }, this.emitKey + ' guid2', 'true');
                this.resultEmitted2 = true;
                this.downloadFallback2?.handleDownloadSuccess();
                this.emitIfAllFlagsReady();
                webDownloadItem.cancel()
              }
            })
            this.delegate2.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download failed guid2: ' + webDownloadItem.getGuid());
              if (!this.resultEmitted2) {
                this.downloadFallback2?.handleDownloadFailed();
              }
            })
            this.delegate2.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download finish state2: ' + webDownloadItem.getState())
              this.currentDownloadState2 = webDownloadItem.getState();
              console.log('download finish guid2: ' + webDownloadItem.getGuid());
            })
            this.controller2.setDownloadDelegate(this.delegate2);
          } catch (error) {
            console.error(`ErrorCode2: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }

          try {
            this.delegate3.onBeforeDownload(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download3.');
              webDownloadItem.start(LocalContext.context.cacheDir + '/3/' + webDownloadItem.getSuggestedFileName());
            })
            this.delegate3.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update guid3: ' + webDownloadItem.getGuid());
              console.log('download update getPercentComplete3:' + webDownloadItem.getPercentComplete())
              console.log('download finish state3: ' + webDownloadItem.getState())
              this.currentDownloadState3 = webDownloadItem.getState();
              if (webDownloadItem.getPercentComplete() > 10 &&
                webDownloadItem.getState() == webview.WebDownloadState.IN_PROGRESS) {
                webDownloadItem.pause()
                await waitForExist(() => this.currentDownloadState3, this.emitKey + ' guid3', webview.WebDownloadState.PAUSED);
                webDownloadItem.resume()
                await waitForExist(()=> {
                  if (webDownloadItem.getGuid().length > 0) {
                    this.flag3 = true;
                  }
                  return '' + this.flag3;
                }, this.emitKey + ' guid3', 'true');
                this.resultEmitted3 = true;
                this.downloadFallback3?.handleDownloadSuccess();
                this.emitIfAllFlagsReady();
                webDownloadItem.cancel()
              }
            })
            this.delegate3.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download failed guid3: ' + webDownloadItem.getGuid());
              if (!this.resultEmitted3) {
                this.downloadFallback3?.handleDownloadFailed();
              }
            })
            this.delegate3.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download finish state3: ' + webDownloadItem.getState())
              this.currentDownloadState3 = webDownloadItem.getState();
              console.log('download finish guid3: ' + webDownloadItem.getGuid());
            })
            this.controller3.setDownloadDelegate(this.delegate3);
          } catch (error) {
            console.error(`ErrorCode3: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }

          try {
            this.resultEmitted1 = false;
            this.resultEmitted2 = false;
            this.resultEmitted3 = false;
            this.flag1 = false;
            this.flag2 = false;
            this.flag3 = false;
            this.downloadFallback1 = new DownloadFallbackManager(this.controller1, '6.10.2', () => {
              this.handleDownloadPassThrough('downloadFallback1');
            });
            this.downloadFallback1.startDownload();
            this.downloadFallback2 = new DownloadFallbackManager(this.controller2, '6.14.16', () => {
              this.handleDownloadPassThrough('downloadFallback2');
            });
            this.downloadFallback2.startDownload();
            this.downloadFallback3 = new DownloadFallbackManager(this.controller3, '6.14.2', () => {
              this.handleDownloadPassThrough('downloadFallback3');
            });
            this.downloadFallback3.startDownload();
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
          try {
            await waitForExist(() => this.flag1 ? 1 : 0, this.emitKey + ' flag1', 1);
            await waitForExist(() => this.flag2 ? 1 : 0, this.emitKey + ' flag2', 1);
            await waitForExist(() => this.flag3 ? 1 : 0, this.emitKey + ' flag3', 1);
            this.emitIfAllFlagsReady();
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Web({ src: 'www.example.com', controller: this.controller1 })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
      Web({ src: 'www.example.com', controller: this.controller2 })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
      Web({ src: 'www.example.com', controller: this.controller3 })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}
