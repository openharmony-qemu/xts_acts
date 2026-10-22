/*
 * Copyright (c) 2026 KaiHong Co., Ltd.
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
import Utils from '../../test/Utils.test';
import web_webview from '@ohos.web.webview';

const EVENT_KEY = 204100;

enum BlankScreenReason {
  DNS_RESOLVE_FAILED = 101,
  REQUEST_TIMED_OUT = 102,
  CONNECTION_REFUSED = 103,
  CONNECTION_RESET = 104,
  SSL_ERROR = 105,
  CERT_ERROR = 106,
  INTERNET_DISCONNECTED = 107,
  REDIRECT_LOOP = 108,
  PROXY_ERROR = 109,
  OTHER_NETWORK_ERROR = 199,
  MAIN_DOC_EMPTY = 201,
  HTTP_4XX_ERROR = 202,
  HTTP_5XX_ERROR = 203,
  JS_GLOBAL_BUNDLE_LOAD_FAILED = 210,
  CSS_LOAD_FAILED = 211,
  MULTI_RESOURCE_LOAD_FAILED = 212,
  CORS_BLOCKED = 213,
  CSP_BLOCKED = 214,
  MIXED_CONTENT_BLOCKED = 215,
  JS_RUNTIME_ERROR = 301,
  NO_FIRST_CONTENTFUL_PAINT = 312,
  RENDERER_CRASHED = 401,
  RENDERER_KILLED = 402,
  GPU_PROCESS_CRASHED = 403,
  GPU_PROCESS_WATCHDOG_TIMEOUT = 404,
  WEB_VIEW_ZERO_SIZE = 501,
}

@Entry
@Component
struct BlankScreenReasonPage {
  @State cmd: string = '';
  @State isReceive: number = -1;
  controller: web_webview.WebviewController = new web_webview.WebviewController();

  onPageShow() {
    events_emitter.on({ eventId: EVENT_KEY, priority: events_emitter.EventPriority.LOW }, (ev) => {
      if (ev?.data?.ACTION != null) {
        this.cmd = ev.data.ACTION as string;
        this.isReceive = 1;
      }
    });
  }

  lookupReason(name: string): number {
    switch (name) {
      case 'DNS_RESOLVE_FAILED': return BlankScreenReason.DNS_RESOLVE_FAILED;
      case 'REQUEST_TIMED_OUT': return BlankScreenReason.REQUEST_TIMED_OUT;
      case 'CONNECTION_REFUSED': return BlankScreenReason.CONNECTION_REFUSED;
      case 'CONNECTION_RESET': return BlankScreenReason.CONNECTION_RESET;
      case 'SSL_ERROR': return BlankScreenReason.SSL_ERROR;
      case 'CERT_ERROR': return BlankScreenReason.CERT_ERROR;
      case 'INTERNET_DISCONNECTED': return BlankScreenReason.INTERNET_DISCONNECTED;
      case 'REDIRECT_LOOP': return BlankScreenReason.REDIRECT_LOOP;
      case 'PROXY_ERROR': return BlankScreenReason.PROXY_ERROR;
      case 'OTHER_NETWORK_ERROR': return BlankScreenReason.OTHER_NETWORK_ERROR;
      case 'MAIN_DOC_EMPTY': return BlankScreenReason.MAIN_DOC_EMPTY;
      case 'HTTP_4XX_ERROR': return BlankScreenReason.HTTP_4XX_ERROR;
      case 'HTTP_5XX_ERROR': return BlankScreenReason.HTTP_5XX_ERROR;
      case 'JS_GLOBAL_BUNDLE_LOAD_FAILED': return BlankScreenReason.JS_GLOBAL_BUNDLE_LOAD_FAILED;
      case 'CSS_LOAD_FAILED': return BlankScreenReason.CSS_LOAD_FAILED;
      case 'MULTI_RESOURCE_LOAD_FAILED': return BlankScreenReason.MULTI_RESOURCE_LOAD_FAILED;
      case 'CORS_BLOCKED': return BlankScreenReason.CORS_BLOCKED;
      case 'CSP_BLOCKED': return BlankScreenReason.CSP_BLOCKED;
      case 'MIXED_CONTENT_BLOCKED': return BlankScreenReason.MIXED_CONTENT_BLOCKED;
      case 'JS_RUNTIME_ERROR': return BlankScreenReason.JS_RUNTIME_ERROR;
      case 'NO_FIRST_CONTENTFUL_PAINT': return BlankScreenReason.NO_FIRST_CONTENTFUL_PAINT;
      case 'RENDERER_CRASHED': return BlankScreenReason.RENDERER_CRASHED;
      case 'RENDERER_KILLED': return BlankScreenReason.RENDERER_KILLED;
      case 'GPU_PROCESS_CRASHED': return BlankScreenReason.GPU_PROCESS_CRASHED;
      case 'GPU_PROCESS_WATCHDOG_TIMEOUT': return BlankScreenReason.GPU_PROCESS_WATCHDOG_TIMEOUT;
      case 'WEB_VIEW_ZERO_SIZE': return BlankScreenReason.WEB_VIEW_ZERO_SIZE;
      default: return 0;
    }
  }

  build() {
    Column() {
      Button('BlankScreenReason').id('BlankScreenReasonBtn').onClick(async () => {
        await Utils.waitForExist(() => this.isReceive, 'BlankScreenReasonReceive', 1, 3000);
        this.isReceive = -1;
        if (this.cmd.startsWith('enum:')) {
          let name = this.cmd.substring(5);
          let v = this.lookupReason(name);
          Utils.emitEvent(v, 204200 + v);
        }
      })
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onDetectedBlankScreen((ev) => { console.info('detected ' + ev.url); })
    }.width('100%').height('100%')
  }
}
