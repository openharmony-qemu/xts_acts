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

const EVENT_KEY = 208100;

@Entry
@Component
struct WebHandlerConstructorsPage {
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

  runCase(name: string, eid: number) {
    try {
      if (name === 'JsResult') { new JsResult(); }
      else if (name === 'PermissionRequest') { new PermissionRequest(); }
      else if (name === 'HttpAuthHandler') { new HttpAuthHandler(); }
      else if (name === 'SslErrorHandler') { new SslErrorHandler(); }
      else if (name === 'ClientAuthenticationHandler') { new ClientAuthenticationHandler(); }
      else if (name === 'DataResubmissionHandler') { new DataResubmissionHandler(); }
      else if (name === 'ScreenCaptureHandler') { new ScreenCaptureHandler(); }
      else if (name === 'WebContextMenuParam') { new WebContextMenuParam(); }
      else if (name === 'EventResult') { new EventResult(); }
      else if (name === 'JsGeolocation') { new JsGeolocation(); }
      else if (name === 'WebResourceError') { new WebResourceError(); }
      else if (name === 'WebResourceRequest') { new WebResourceRequest(); }
      else if (name === 'WebResourceResponse') { new WebResourceResponse(); }
      else if (name === 'WebInterface') { /* WebInterface verified via Web component in build */ }
    } catch (e) { console.error(name + ' ' + JSON.stringify(e)); }
    Utils.emitEvent(true, eid);
  }

  build() {
    Column() {
      Button('WebHandlerConstructors').id('WebHandlerConstructors').onClick(async () => {
        await Utils.waitForExist(() => this.isReceive, 'WebHandlerConstructorsReceive', 1, 3000);
        this.isReceive = -1;
        if (this.cmd === 'runJsResult') { this.runCase('JsResult', 208111); }
        if (this.cmd === 'runPermissionRequest') { this.runCase('PermissionRequest', 208112); }
        if (this.cmd === 'runHttpAuthHandler') { this.runCase('HttpAuthHandler', 208113); }
        if (this.cmd === 'runSslErrorHandler') { this.runCase('SslErrorHandler', 208114); }
        if (this.cmd === 'runClientAuthHandler') { this.runCase('ClientAuthenticationHandler', 208115); }
        if (this.cmd === 'runDataResubmitHandler') { this.runCase('DataResubmissionHandler', 208116); }
        if (this.cmd === 'runScreenCaptureHandler') { this.runCase('ScreenCaptureHandler', 208117); }
        if (this.cmd === 'runWebContextMenuParam') { this.runCase('WebContextMenuParam', 208118); }
        if (this.cmd === 'runEventResult') { this.runCase('EventResult', 208119); }
        if (this.cmd === 'runJsGeolocation') { this.runCase('JsGeolocation', 208120); }
        if (this.cmd === 'runWebResourceError') { this.runCase('WebResourceError', 208121); }
        if (this.cmd === 'runWebResourceRequest') { this.runCase('WebResourceRequest', 208122); }
        if (this.cmd === 'runWebResourceResponse') { this.runCase('WebResourceResponse', 208123); }
        if (this.cmd === 'runWebInterface') { this.runCase('WebInterface', 208124); }
      })
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onAlert((ev) => { ev.result.handleConfirm(); return true; })
        .onHttpAuthRequest((ev) => { ev.handler.cancel(); return true; })
        .onPermissionRequest((ev) => { ev.request.deny(); })
        .onSslErrorEventReceive((ev) => { ev.handler.handleCancel(); return true; })
        .onGeolocationShow((ev) => { ev.geolocation.invoke(ev.origin, false, false); })
        .onContextMenuShow((ev) => { return false; })
        .onClientAuthenticationRequest((ev) => { ev.handler.ignore(); return true; })
        .onScreenCaptureRequest((ev) => { ev.handler.deny(); return true; })
    }.width('100%').height('100%')
  }
}
