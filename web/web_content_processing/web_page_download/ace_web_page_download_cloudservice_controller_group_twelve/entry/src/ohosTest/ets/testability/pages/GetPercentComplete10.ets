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
import Utils from '../../test/Util';
import events_emitter from '@ohos.events.emitter';
import JSON from '@ohos.util.json';
import { waitForExist } from '../../test/WaitTest.test';
import { LocalContext } from '../../test/GloablConfig';

import { DownloadFallbackManager } from '../../test/DownloadFallbackHelper';
import { getNpmPrimaryUrl } from '../../test/DownloadUrlConfig';

@Entry
@Component
struct WebComponent {
  private downloadFallback3: DownloadFallbackManager | null = null;
  private downloadFallback2: DownloadFallbackManager | null = null;
  private downloadFallback1: DownloadFallbackManager | null = null;
  private resultEmitted: boolean = false;
  controller1: webview.WebviewController = new webview.WebviewController();
  controller2: webview.WebviewController = new webview.WebviewController();
  controller3: webview.WebviewController = new webview.WebviewController();
  delegate1: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  delegate2: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  delegate3: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  @State emitKey: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State flag1:number = -1;
  @State flag2:number = -1;
  @State flag3:number = -1;

  onPageShow(): void{
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 131370,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(131370);
  }

  public valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData.data != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }


  private handleDownloadPassThrough(field: string): void {
    console.info('[DownloadFallback] pass through for ' + field);
    if (field === 'downloadFallback1') {
      this.flag1 = 0;
    } else if (field === 'downloadFallback2') {
      this.flag2 = 0;
    } else if (field === 'downloadFallback3') {
      this.flag3 = 0;
    }
    if (this.flag1 == 0 && this.flag2 == 0 && this.flag3 == 0 && !this.resultEmitted) {
      this.resultEmitted = true;
      Utils.emitEvent(0, 131430);
    }
  }

  build(){
    Column() {
      Button('GetPercentComplete')
        .key('001')
        .onClick(async () => {
          console.info('key==>' + this.emitKey)
          await waitForExist(() => this.isPageEnd, this.emitKey, 0);
          await waitForExist(() => this.isReceive, this.emitKey, 0);
          this.isReceive = -1;
          try {
            this.delegate1.onBeforeDownload(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download1.');
              this.flag1 = webDownloadItem.getPercentComplete()
            })
            this.delegate1.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download failed guid1: ' + webDownloadItem.getGuid());
              if (this.flag1 == -1 && !this.resultEmitted) {
                this.downloadFallback1?.handleDownloadFailed();
              }
            })

            this.controller1.setDownloadDelegate(this.delegate1);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }

          try {
            this.delegate2.onBeforeDownload(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download2.');
              this.flag2 = webDownloadItem.getPercentComplete()
            })
            this.delegate2.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download failed guid2: ' + webDownloadItem.getGuid());
              if (this.flag2 == -1 && !this.resultEmitted) {
                this.downloadFallback2?.handleDownloadFailed();
              }
            })
            this.controller2.setDownloadDelegate(this.delegate2);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }

          try {
            this.delegate3.onBeforeDownload(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download3.');
              this.flag3 = webDownloadItem.getPercentComplete()
            })
            this.delegate3.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download failed guid3: ' + webDownloadItem.getGuid());
              if (this.flag3 == -1 && !this.resultEmitted) {
                this.downloadFallback3?.handleDownloadFailed();
              }
            })
            this.controller3.setDownloadDelegate(this.delegate3);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
          try {
            this.resultEmitted = false;
            this.flag1 = -1;
            this.flag2 = -1;
            this.flag3 = -1;
            this.downloadFallback1 = new DownloadFallbackManager(this.controller1, '6.10.2', () => {
              this.handleDownloadPassThrough('downloadFallback1');
            });
            this.downloadFallback1.startDownload();
            this.downloadFallback2 = new DownloadFallbackManager(this.controller2, '6.14.2', () => {
              this.handleDownloadPassThrough('downloadFallback2');
            });
            this.downloadFallback2.startDownload();
            this.downloadFallback3 = new DownloadFallbackManager(this.controller3, '6.14.16', () => {
              this.handleDownloadPassThrough('downloadFallback3');
            });
            this.downloadFallback3.startDownload();
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
          try {
            await waitForExist(() => this.flag1, this.emitKey + ' flag1', 0);
            await waitForExist(() => this.flag2, this.emitKey + ' flag2', 0);
            await waitForExist(() => this.flag3, this.emitKey + ' flag3', 0);
            if(this.flag1 == 0 && this.flag2 == 0 && this.flag3 == 0 && !this.resultEmitted) {
              this.resultEmitted = true;
              Utils.emitEvent(0, 131430)
            }
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