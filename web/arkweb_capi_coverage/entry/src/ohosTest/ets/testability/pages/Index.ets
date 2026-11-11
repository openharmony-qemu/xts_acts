/*
 * Copyright (c) 2026 Kaihong Digital Co., Ltd.
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

import webview from '@ohos.web.webview';
import nativeFunc from 'libentry.so';
webTag: string = 'test_tag';

@Entry
@Component
struct Index {
  @State webTag: string = 'errorinfo_web';
  @State webTag1: string = 'test_tag';
  @State pageReady: number = 0;
  controller: webview.WebviewController = new webview.WebviewController(this.webTag);
  controller1: webview.WebviewController = new webview.WebviewController(this.webTag1);
  aboutToAppear(): void {
    webview.WebviewController.initializeWebEngine();
    nativeFunc.SetupErrorInfoSchemeHandler();
  }

  build() {
    Column() {
      Button('TriggerDidFail')
        .id('TriggerDidFail')
        .onClick(() => {
          nativeFunc.ResetDidFailWithErrorInfoLiveResult();
          try {
            this.controller.loadUrl('ei-fail://didfail');
          } catch (e) {
            console.error('loadUrl ei-fail failed: ' + JSON.stringify(e));
          }
        })
      Web({ src: $rawfile('test.html'), controller: this.controller })
        .width('100%')
        .height('80%')
        .javaScriptAccess(true)
        .fileAccess(true)
        .domStorageAccess(true)
        .onControllerAttached(() => {
          nativeFunc.SetupErrorInfoSchemeHandler();
          this.pageReady = 1;
        })
        .onPageEnd(() => {
          this.pageReady = 1;
        })
        Web({ src: $rawfile('test.html'), controller: this.controller1 })
        .javaScriptAccess(true)
        .fileAccess(true)
    }
    .width('100%')
    .height('100%')
  }
}
