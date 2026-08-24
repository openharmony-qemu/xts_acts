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
import { getNpmPrimaryUrl } from '../../test/DownloadUrlConfig';

@Entry
@Component
struct WebComponent {
  private downloadFallback: DownloadFallbackManager | null = null;
  private resultEmitted: boolean = false;
  controller: webview.WebviewController = new webview.WebviewController();
  delegate: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  isPaused: boolean = false;
  @State emitKey: string = '';
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 131050,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(131050);
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

  private handleDownloadPassThrough(field: string): void {
    console.info('[DownloadFallback] pass through for ' + field);
    Utils.emitEvent(true, 131070);
  }

  build(){
    Column() {
      Button('setConnectionTimeOut')
        .key('001')
        .onClick(async () => {
          console.info('key==>' + this.emitKey);
          await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
          await waitForExist(()=>this.isReceive, this.emitKey, 0);
          this.isReceive = -1;
          try {
            this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
              console.log('will start a download.');
              webDownloadItem.start(LocalContext.context.cacheDir + '/7111/' + webDownloadItem.getSuggestedFileName());
            })
            this.delegate.onDownloadUpdated(async (webDownloadItem: webview.WebDownloadItem) => {
              console.log('download update state:' + webDownloadItem.getState());
            })
            this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download failed guid:' + webDownloadItem.getGuid());
              if (!this.resultEmitted) {
                this.downloadFallback?.handleDownloadFailed();
              }
            })
            this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
              console.log('download finish state: ' + webDownloadItem.getState());
              const success = webDownloadItem.getState() == webview.WebDownloadState.COMPLETED;
              if (success) {
                this.resultEmitted = true;
                this.downloadFallback?.handleDownloadSuccess();
              }
              Utils.emitEvent(success, 131070)
            })
            this.controller.setDownloadDelegate(this.delegate);
          } catch (error) {
            console.error(`ErrorCode:${(error as BusinessError).code},  Message:${(error as BusinessError).message}`);
          }
          try {
            this.resultEmitted = false;
            this.downloadFallback = new DownloadFallbackManager(this.controller, '6.10.2', () => {
              this.handleDownloadPassThrough('downloadFallback');
            });
            this.downloadFallback.startDownload();
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
      Web({ src: 'www.example.com', controller: this.controller })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}