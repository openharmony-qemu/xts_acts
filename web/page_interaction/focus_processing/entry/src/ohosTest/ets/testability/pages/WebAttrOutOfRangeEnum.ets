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

import webview from '@ohos.web.webview';

@Entry
@Component
struct WebAttrOutOfRangeEnum {
  private ctrl: webview.WebviewController = new webview.WebviewController();

  build() {
    Column() {
      Button('WebAttrOutOfRangeEnum_btn')
        .id('WebAttrOutOfRangeEnum_btn')
        .key('WebAttrOutOfRangeEnum_btn')
      // Out-of-range enums for coverage detector (API定义之外的枚举)
      Web({ src: $rawfile('index.html'), controller: this.ctrl })
        .mixedMode(999 as MixedMode)
        .overScrollMode(999 as OverScrollMode)
        .layoutMode(999 as WebLayoutMode)
        .bypassVsyncCondition(999 as WebBypassVsyncCondition)
        .gestureFocusMode(999 as GestureFocusMode)
        .rotateRenderEffect(999 as WebRotateEffect)
        .height(40)
        .width('100%')
    }
  }
}
