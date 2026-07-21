/*
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

import web_webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils.test';
import { waitForExist } from '../../test/WaitTest.test';
import { URL_EXAMPLE } from '../../test/Config.test';
import testNapi from 'libentry.so'

@Entry
@Component
struct WebFetchCookiePartitioned {

  controller: web_webview.WebviewController = new web_webview.WebviewController('ArkWeb');
  @State emitKey: string = ''
  @State isReceive: number = 0


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 149501,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(149501)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 1
      }
    }
  }

  aboutToAppear() {
    console.info('start run FetchCookiePartitioned testcase!!!')
    web_webview.WebviewController.initializeWebEngine();
  }


  build() {
    Column() {
      Row() {
          Button('WebFetchCookiePartitionedTest').key('FetchCookiePartitioned')
            .onClick(async () => {
              console.info('1key==>' + this.emitKey)
              await waitForExist(()=>this.isReceive, 'WebFetchCookiePartitionedTest', 1, 1000)
              console.info('2key==>' + this.emitKey)
              this.isReceive = 0
              switch (this.emitKey) {
                case 'emitFetchCookieSyncPartitioned001': {
                  let setCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'ndk=syncTrue', false, false)
                  let resultCode = testNapi.fetchCookieSyncPartitioned(URL_EXAMPLE, false, false, true)
                  let resultValue = testNapi.getFetchCookieSyncPartitionedValue()
                  console.log('emitFetchCookieSyncPartitioned001 setCode:' + setCode +
                    ' resultCode:' + resultCode + ' resultValue:' + resultValue)
                  if (resultCode === 0 && resultValue === 'ndk=syncTrue') {
                    Utils.emitEvent(true, 149550)
                  } else {
                    Utils.emitEvent(false, 149550)
                  }
                  break
                }
                case 'emitFetchCookieSyncPartitioned002': {
                  let setCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'ndk=syncFalse', false, false)
                  let resultCode = testNapi.fetchCookieSyncPartitioned(URL_EXAMPLE, false, false, false)
                  let resultValue = testNapi.getFetchCookieSyncPartitionedValue()
                  console.log('emitFetchCookieSyncPartitioned002 setCode:' + setCode +
                    ' resultCode:' + resultCode + ' resultValue:' + resultValue)
                  if (resultCode === 0 && resultValue === 'ndk=syncFalse') {
                    Utils.emitEvent(true, 149560)
                  } else {
                    Utils.emitEvent(false, 149560)
                  }
                  break
                }
                case 'emitFetchCookieSyncPartitioned003': {
                  let setCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'ndk=httpOnly', false, true)
                  let resultCode = testNapi.fetchCookieSyncPartitioned(URL_EXAMPLE, false, true, true)
                  let resultValue = testNapi.getFetchCookieSyncPartitionedValue()
                  console.log('emitFetchCookieSyncPartitioned003 setCode:' + setCode +
                    ' resultCode:' + resultCode + ' resultValue:' + resultValue)
                  if (resultCode === 0 && resultValue === 'ndk=httpOnly') {
                    Utils.emitEvent(true, 149570)
                  } else {
                    Utils.emitEvent(false, 149570)
                  }
                  break
                }
                case 'emitFetchCookieSyncPartitioned004': {
                  let setCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'ndk=incognito', true, false)
                  let resultCode = testNapi.fetchCookieSyncPartitioned(URL_EXAMPLE, true, false, true)
                  let resultValue = testNapi.getFetchCookieSyncPartitionedValue()
                  console.log('emitFetchCookieSyncPartitioned004 setCode:' + setCode +
                    ' resultCode:' + resultCode + ' resultValue:' + resultValue)
                  if (resultCode === 0 && resultValue === 'ndk=incognito') {
                    Utils.emitEvent(true, 149580)
                  } else {
                    Utils.emitEvent(false, 149580)
                  }
                  break
                }
                case 'emitFetchCookieSyncPartitionedInvalidUrl005': {
                  let resultCode = testNapi.fetchCookieSyncPartitioned('', false, false, true)
                  console.log('emitFetchCookieSyncPartitionedInvalidUrl005 resultCode:' + resultCode)
                  // ARKWEB_INVALID_URL = 17100103
                  if (resultCode === 17100103) {
                    Utils.emitEvent(true, 149590)
                  } else {
                    Utils.emitEvent(false, 149590)
                  }
                  break
                }
                case 'emitFetchCookieSyncPartitionedInvalidParam006': {
                  let resultCode = testNapi.fetchCookieSyncPartitionedInvalidParam(URL_EXAMPLE, false, false, true)
                  console.log('emitFetchCookieSyncPartitionedInvalidParam006 resultCode:' + resultCode)
                  // ARKWEB_INVALID_PARAM = 17100101
                  if (resultCode === 17100101) {
                    Utils.emitEvent(true, 149600)
                  } else {
                    Utils.emitEvent(false, 149600)
                  }
                  break
                }
                case 'emitFetchCookieAsyncPartitioned007': {
                  let setCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'ndk=asyncTrue', false, false)
                  testNapi.fetchCookieAsyncPartitioned(URL_EXAMPLE, false, false, true)
                  await waitForExist(() => testNapi.getFetchCookieAsyncPartitionedCode(),
                    'emitFetchCookieAsyncPartitioned007', 0, 500)
                  let resultCode = testNapi.getFetchCookieAsyncPartitionedCode()
                  let resultValue = testNapi.getFetchCookieAsyncPartitionedValue()
                  console.log('emitFetchCookieAsyncPartitioned007 setCode:' + setCode +
                    ' resultCode:' + resultCode + ' resultValue:' + resultValue)
                  if (resultCode === 0 && resultValue === 'ndk=asyncTrue') {
                    Utils.emitEvent(true, 149610)
                  } else {
                    Utils.emitEvent(false, 149610)
                  }
                  break
                }
                case 'emitFetchCookieAsyncPartitioned008': {
                  let setCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'ndk=asyncFalse', false, false)
                  testNapi.fetchCookieAsyncPartitioned(URL_EXAMPLE, false, false, false)
                  await waitForExist(() => testNapi.getFetchCookieAsyncPartitionedCode(),
                    'emitFetchCookieAsyncPartitioned008', 0, 500)
                  let resultCode = testNapi.getFetchCookieAsyncPartitionedCode()
                  let resultValue = testNapi.getFetchCookieAsyncPartitionedValue()
                  console.log('emitFetchCookieAsyncPartitioned008 setCode:' + setCode +
                    ' resultCode:' + resultCode + ' resultValue:' + resultValue)
                  if (resultCode === 0 && resultValue === 'ndk=asyncFalse') {
                    Utils.emitEvent(true, 149620)
                  } else {
                    Utils.emitEvent(false, 149620)
                  }
                  break
                }
                case 'emitFetchCookieAsyncPartitionedInvalidUrl009': {
                  testNapi.fetchCookieAsyncPartitioned('', false, false, true)
                  await waitForExist(() => testNapi.getFetchCookieAsyncPartitionedCode(),
                    'emitFetchCookieAsyncPartitionedInvalidUrl009', 17100103, 500)
                  let resultCode = testNapi.getFetchCookieAsyncPartitionedCode()
                  console.log('emitFetchCookieAsyncPartitionedInvalidUrl009 resultCode:' + resultCode)
                  if (resultCode === 17100103) {
                    Utils.emitEvent(true, 149630)
                  } else {
                    Utils.emitEvent(false, 149630)
                  }
                  break
                }
                case 'emitFetchCookieAsyncPartitionedNullCallback010': {
                  let resultValue = testNapi.fetchCookieAsyncPartitionedNullCallback(URL_EXAMPLE, false, false, true)
                  console.log('emitFetchCookieAsyncPartitionedNullCallback010 resultValue:' + resultValue)
                  if (resultValue === 1) {
                    Utils.emitEvent(true, 149640)
                  } else {
                    Utils.emitEvent(false, 149640)
                  }
                  break
                }
              }
            })
      }
      Web({src: $rawfile('test.html'), controller: this.controller})
        .javaScriptAccess(true)
        .fileAccess(true)
        .onControllerAttached(() => {
          console.log('onControllerAttached webId:' + this.controller.getWebId())
        })
        .onPageBegin((event) => {
          console.log('onPageBegin url:' + event.url)
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url)
        })
    }
  }
}
