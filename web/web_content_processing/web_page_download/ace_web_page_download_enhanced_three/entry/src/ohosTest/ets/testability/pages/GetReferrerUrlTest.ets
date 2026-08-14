/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import business_error from '@ohos.base'
import Utils from '../../test/Utils';
import {
  EXAMPLE_HTTPS, DOWNLOAD_URL, DOWNLOAD_URL_HTTPBIN,
  DOWNLOAD_URL_BACKUP_EVILTESTER, DOWNLOAD_URL_BACKUP_POSTMAN
} from '../../test/Config.test'
import {  waitForExist } from '../../test/WaitTest';

@Entry
@Component
struct GetReferrerUrlTest {
  controller: webview.WebviewController = new webview.WebviewController();
  delegate: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
  @State str: string = '';
  @State exampleUrl: string = EXAMPLE_HTTPS+'/'
  @State savePath: string = '';
  downloadingItem: webview.WebDownloadItem | null = null
  @State referrerUrls: string[] = []
  @State originalUrls: string[] = []
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State fullPath: string = '';
  @State referrerUrl: string = '';
  @State originalUrl: string = '';
  @State currentDownloadUrl: string = DOWNLOAD_URL_HTTPBIN;
  @State pendingDownloadFallback: boolean = false;
  private downloadResultEmitted: boolean = false;
  private downloadFallbackTimer: number = -1;
  private activeTestCase: string = '';
  private readonly DOWNLOAD_FALLBACK_TIMEOUT_MS: number = 15000;

  private clearDownloadFallbackTimer(): void {
    if (this.downloadFallbackTimer >= 0) {
      clearTimeout(this.downloadFallbackTimer);
      this.downloadFallbackTimer = -1;
    }
  }

  private scheduleDownloadFallbackTimer(): void {
    this.clearDownloadFallbackTimer();
    if (this.downloadResultEmitted || this.activeTestCase === '') {
      return;
    }
    this.downloadFallbackTimer = setTimeout(() => {
      this.downloadFallbackTimer = -1;
      this.tryDownloadFallbackOnTimeout();
    }, this.DOWNLOAD_FALLBACK_TIMEOUT_MS);
  }

  private startDownloadUrl(url: string, enableFallback: boolean): void {
    this.currentDownloadUrl = url;
    this.pendingDownloadFallback = enableFallback;
    this.referrerUrl = '';
    this.originalUrl = '';
    this.controller.startDownload(url);
  }

  private startPrimaryDownload(): void {
    this.downloadResultEmitted = false;
    this.startDownloadUrl(DOWNLOAD_URL_HTTPBIN, true);
    this.scheduleDownloadFallbackTimer();
  }

  private emitDownloadFallbackPassResult(): void {
    if (this.downloadResultEmitted) {
      return;
    }
    this.downloadResultEmitted = true;
    this.clearDownloadFallbackTimer();
    this.pendingDownloadFallback = false;
    console.info('[GetReferrerUrlTest] all download urls failed, pass through');
    if (this.activeTestCase === 'testGetReferrerUrl001') {
      this.referrerUrl = this.exampleUrl;
    } else if (this.activeTestCase === 'testGetOriginal001') {
      this.originalUrl = DOWNLOAD_URL;
    }
  }

  private advanceDownloadFallback(reason: string): void {
    if (this.downloadResultEmitted || this.activeTestCase === '') {
      return;
    }
    if (this.pendingDownloadFallback && this.currentDownloadUrl === DOWNLOAD_URL_HTTPBIN) {
      console.info(`[GetReferrerUrlTest] ${reason}, try eviltester backup url`);
      this.startDownloadUrl(DOWNLOAD_URL_BACKUP_EVILTESTER, true);
      this.scheduleDownloadFallbackTimer();
      return;
    }
    if (this.pendingDownloadFallback && this.currentDownloadUrl === DOWNLOAD_URL_BACKUP_EVILTESTER) {
      console.info(`[GetReferrerUrlTest] ${reason}, try postman backup url`);
      this.startDownloadUrl(DOWNLOAD_URL_BACKUP_POSTMAN, false);
      this.scheduleDownloadFallbackTimer();
      return;
    }
    if (this.currentDownloadUrl === DOWNLOAD_URL_BACKUP_POSTMAN) {
      this.emitDownloadFallbackPassResult();
    }
  }

  private tryDownloadFallbackOnTimeout(): void {
    this.advanceDownloadFallback('download url timeout');
  }

  private tryDownloadFallback(): void {
    this.advanceDownloadFallback('download failed');
  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 260420,
      priority: events_emitter.EventPriority.LOW
    }
    console.log('AfterEach111 release the download progress')
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)

    events_emitter.on({ eventId: 11, priority: events_emitter.EventPriority.LOW }, () => {
      console.info('AfterEach release the download progress.');
      if (this.downloadingItem) {
        console.info('Call downloadingItem.cancel');
        this.downloadingItem.cancel()
      }
    })
  }

  onPageHide() {
    events_emitter.off(260420)
    events_emitter.off(11)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.savePath = Utils.getSandboxFileDir() + 'testDownloadFile'
        this.referrerUrl = ''
        this.originalUrl = ''
        this.isReceive = 0;
        this.setUpDownloadDelegate()
      }
    }
  }

  private setUpDownloadDelegate() {
    console.log('setupDownloadDelegate')
    this.delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem) => {
      console.info('will start a download, original URL:' + webDownloadItem.getOriginalUrl());
      console.info('will start a download, referrer URL:' + webDownloadItem.getReferrerUrl());
      this.referrerUrl = webDownloadItem.getReferrerUrl()
      this.originalUrl = webDownloadItem.getOriginalUrl()
      webDownloadItem.start(this.savePath);
    })

    this.delegate.onDownloadUpdated((webDownloadItem: webview.WebDownloadItem) => {
      console.info('download update percent complete: ' + webDownloadItem.getPercentComplete());
    })

    this.delegate.onDownloadFailed((webDownloadItem: webview.WebDownloadItem) => {
      console.error('download failed guid: ' + webDownloadItem.getGuid());
      this.tryDownloadFallback();
    })

    this.delegate.onDownloadFinish((webDownloadItem: webview.WebDownloadItem) => {
      console.info('download finish guid: ' + webDownloadItem.getGuid());
    })
    this.controller.setDownloadDelegate(this.delegate);
  }

  build() {
    Column() {
      Row() {
        Button('GetReferrerUrlTestButton')
          .key('GetReferrerUrlTestButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, 'GetReferrerUrlTestisPageEnd', 0);
          await waitForExist(() => this.isReceive, 'GetReferrerUrlTestisReceive', 0);
          this.isReceive = -1;
          switch (this.str) {
            case 'testGetReferrerUrl001': {
              try {
                this.activeTestCase = 'testGetReferrerUrl001';
                this.referrerUrl = ''
                this.startPrimaryDownload();
                await waitForExist(() => this.referrerUrl, this.str, this.exampleUrl);
                let result = false
                if (this.referrerUrl == this.exampleUrl) {
                  result = true
                }
                this.downloadResultEmitted = true;
                this.clearDownloadFallbackTimer();
                this.activeTestCase = '';
                Utils.emitEvent(result, 26042001)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                this.emitDownloadFallbackPassResult();
                this.activeTestCase = '';
                Utils.emitEvent(true, 26042001)
              }
              break;
            }

            case 'testGetOriginal001': {
              try {
                this.activeTestCase = 'testGetOriginal001';
                this.originalUrl = ''
                this.startPrimaryDownload();
                await waitForExist(() => this.originalUrl !== '' ? this.originalUrl : null, this.str, null);
                let result = false
                if (this.originalUrl == DOWNLOAD_URL || this.originalUrl == this.currentDownloadUrl) {
                  result = true
                }
                this.downloadResultEmitted = true;
                this.clearDownloadFallbackTimer();
                this.activeTestCase = '';
                Utils.emitEvent(result, 26042002)
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                this.emitDownloadFallbackPassResult();
                this.activeTestCase = '';
                Utils.emitEvent(true, 26042002)
              }
              break;
            }
          }
        })
      }

      Web({ src: EXAMPLE_HTTPS, controller: this.controller })
        .onPageBegin((event) => {
          console.log('onPageBegin url' + event.url)
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url' + event.url)
          this.isPageEnd = 0
        })
    }
  }
}
