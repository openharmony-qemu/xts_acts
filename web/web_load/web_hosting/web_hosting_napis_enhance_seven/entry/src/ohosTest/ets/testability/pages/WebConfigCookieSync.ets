/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import business_error from '@ohos.base'

@Entry
@Component
struct WebConfigCookieSync {

  controller: web_webview.WebviewController = new web_webview.WebviewController('ArkWeb');
  @State emitKey: string = ''
  @State isReceive: number = 0


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 147501,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(147501)
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
    console.info('start run testcase!!!')
    web_webview.WebviewController.initializeWebEngine();
  }


  build() {
    Column() {
      Row() {
          Button('WebConfigCookieSyncTest').key('ConfigCookieSync')
            .onClick(async () => {
              console.info('1key==>' + this.emitKey)
              await waitForExist(()=>this.isReceive, 'WebConfigCookieSyncTest', 1, 1000)
              console.info('2key==>' + this.emitKey)
              this.isReceive = 0
              switch (this.emitKey) {
                case 'emitConfigCookieSync001': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'test=abc\nd123', false, false)
                  console.log('emitConfigCookieSync001 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync001 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 0 &&  resultValue === 'test=abc') {
                    Utils.emitEvent(true,147550)
                  } else {
                    Utils.emitEvent(false,147550)
                  }
                  break
                }
                case 'emitConfigCookieSync002': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'test=abc\td123', false, false)
                  console.log('emitConfigCookieSync002 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync002 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 17100104 &&  resultValue === '') {
                    Utils.emitEvent(true,147560)
                  } else {
                    Utils.emitEvent(false,147560)
                  }
                  break
                }
                case 'emitConfigCookieSync003': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'test=abc\rd123', false, false)
                  console.log('emitConfigCookieSync003 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync003 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 0 &&  resultValue === 'test=abc') {
                    Utils.emitEvent(true,147570)
                  } else {
                    Utils.emitEvent(false,147570)
                  }
                  break
                }
                case 'emitConfigCookieSync004': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'test2=abc\0d123', false, false)
                  console.log('emitConfigCookieSync004 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync004 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 0 &&  resultValue === 'test2=abc') {
                    Utils.emitEvent(true,147580)
                  } else {
                    Utils.emitEvent(false,147580)
                  }
                  break
                }
                case 'emitConfigCookieSync005': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=ZhangSan\nc123; Secure; HttpOnly', false, true)
                  console.log('emitConfigCookieSync005 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, true)
                  console.log('emitConfigCookieSync005 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 0 &&  resultValue === 'name=ZhangSan') {
                    Utils.emitEvent(true,147590)
                  } else {
                    Utils.emitEvent(false,147590)
                  }
                  break
                }
                case 'emitConfigCookieSync006': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=ZhangSan\tc123; Secure; HttpOnly;', false, true)
                  console.log('emitConfigCookieSync006 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, true)
                  console.log('emitConfigCookieSync006 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 17100104 &&  resultValue === '') {
                    Utils.emitEvent(true,147600)
                  } else {
                    Utils.emitEvent(false,147600)
                  }
                  break
                }
                case 'emitConfigCookieSync007': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'address=Nanjing\rd123; Secure; HttpOnly;', false, true)
                  console.log('emitConfigCookieSync007 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, true)
                  console.log('emitConfigCookieSync007 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 0 &&  resultValue === 'address=Nanjing') {
                    Utils.emitEvent(true,147610)
                  } else {
                    Utils.emitEvent(false,147610)
                  }
                  break
                }
                case 'emitConfigCookieSync008': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'age=11\0abc123; Secure; HttpOnly;', false, true)
                  console.log('emitConfigCookieSync008 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, true)
                  console.log('emitConfigCookieSync008 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 0 &&  resultValue === 'age=11') {
                    Utils.emitEvent(true,147620)
                  } else {
                    Utils.emitEvent(false,147620)
                  }
                  break
                }
                case 'emitConfigCookieSync009': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\nYu', false, false)
                  console.log('emitConfigCookieSync009 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync009 getFetchCookieSync resultValue:' + resultValue)
                  let resultValue2 = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync009 getFetchCookieSync resultValue2:' + resultValue2)
                  if (resultCode === 0 &&  resultValue === 'name=Li' && resultValue2 === '') {
                    Utils.emitEvent(true,147630)
                  } else {
                    Utils.emitEvent(false,147630)
                  }
                  break
                }
                case 'emitConfigCookieSync010': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\rYu', false, false)
                  console.log('emitConfigCookieSync010 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync010 getFetchCookieSync resultValue:' + resultValue)
                  let resultValue2 = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync010 getFetchCookieSync resultValue2:' + resultValue2)
                  if (resultCode === 0 &&  resultValue === 'name=Li' && resultValue2 === '') {
                    Utils.emitEvent(true,147640)
                  } else {
                    Utils.emitEvent(false,147640)
                  }
                  break
                }
                case 'emitConfigCookieSync011': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\0Yu', false, false)
                  console.log('emitConfigCookieSync011 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync011 getFetchCookieSync resultValue:' + resultValue)
                  let resultValue2 = testNapi.getFetchCookieSync(URL_EXAMPLE, false, false)
                  console.log('emitConfigCookieSync011 getFetchCookieSync resultValue2:' + resultValue2)
                  if (resultCode === 0 &&  resultValue === 'name=Li' && resultValue2 === '') {
                    Utils.emitEvent(true,147650)
                  } else {
                    Utils.emitEvent(false,147650)
                  }
                  break
                }
                case 'emitConfigCookieSync012': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\nYu', true, false)
                  console.log('emitConfigCookieSync012 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, true, false)
                  console.log('emitConfigCookieSync012 getFetchCookieSync resultValue:' + resultValue)
                  let resultValue2 = testNapi.getFetchCookieSync(URL_EXAMPLE, true, false)
                  console.log('emitConfigCookieSync012 getFetchCookieSync resultValue2:' + resultValue2)
                  if (resultCode === 0 &&  resultValue === 'name=Li' && resultValue2 === '') {
                    Utils.emitEvent(true,147660)
                  } else {
                    Utils.emitEvent(false,147660)
                  }
                  break
                }
                case 'emitConfigCookieSync013': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\rYu', true, false)
                  console.log('emitConfigCookieSync013 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, true, false)
                  console.log('emitConfigCookieSync013 getFetchCookieSync resultValue:' + resultValue)
                  let resultValue2 = testNapi.getFetchCookieSync(URL_EXAMPLE, true, false)
                  console.log('emitConfigCookieSync013 getFetchCookieSync resultValue2:' + resultValue2)
                  if (resultCode === 0 &&  resultValue === 'name=Li' && resultValue2 === '') {
                    Utils.emitEvent(true,147670)
                  } else {
                    Utils.emitEvent(false,147670)
                  }
                  break
                }
                case 'emitConfigCookieSync014': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\0Yu', true, false)
                  console.log('emitConfigCookieSync014 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, true, false)
                  console.log('emitConfigCookieSync014 getFetchCookieSync resultValue:' + resultValue)
                  let resultValue2 = testNapi.getFetchCookieSync(URL_EXAMPLE, true, false)
                  console.log('emitConfigCookieSync014 getFetchCookieSync resultValue2:' + resultValue2)
                  if (resultCode === 0 &&  resultValue === 'name=Li' && resultValue2 === '') {
                    Utils.emitEvent(true,147680)
                  } else {
                    Utils.emitEvent(false,147680)
                  }
                  break
                }
                case 'emitConfigCookieSync015': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\nYu;Secure;HttpOnly', true, true)
                  console.log('emitConfigCookieSync015 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, true, true)
                  console.log('emitConfigCookieSync015 getFetchCookieSync resultValue:' + resultValue)
                  let resultValue2 = testNapi.getFetchCookieSync(URL_EXAMPLE, true, true)
                  console.log('emitConfigCookieSync015 getFetchCookieSync resultValue2:' + resultValue2)
                  if (resultCode === 0 &&  resultValue === 'name=Li' && resultValue2 === '') {
                    Utils.emitEvent(true,147690)
                  } else {
                    Utils.emitEvent(false,147690)
                  }
                  break
                }
                case 'emitConfigCookieSync016': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\tYu;Secure;HttpOnly', true, true)
                  console.log('emitConfigCookieSync016 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, true, true)
                  console.log('emitConfigCookieSync016 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 17100104 &&  resultValue === '') {
                    Utils.emitEvent(true,147700)
                  } else {
                    Utils.emitEvent(false,147700)
                  }
                  break
                }
                case 'emitConfigCookieSync017': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\rYu;Secure;HttpOnly', true, true)
                  console.log('emitConfigCookieSync017 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, true, true)
                  console.log('emitConfigCookieSync017 getFetchCookieSync resultValue:' + resultValue)
                  let resultValue2 = testNapi.getFetchCookieSync(URL_EXAMPLE, true, true)
                  console.log('emitConfigCookieSync017 getFetchCookieSync resultValue2:' + resultValue2)
                  if (resultCode === 0 &&  resultValue === 'name=Li' && resultValue2 === '') {
                    Utils.emitEvent(true,147710)
                  } else {
                    Utils.emitEvent(false,147710)
                  }
                  break
                }
                case 'emitConfigCookieSync018': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'name=Li\0Yu;Secure;HttpOnly', true, true)
                  console.log('emitConfigCookieSync018 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, true, true)
                  console.log('emitConfigCookieSync018 getFetchCookieSync resultValue:' + resultValue)
                  let resultValue2 = testNapi.getFetchCookieSync(URL_EXAMPLE, true, true)
                  console.log('emitConfigCookieSync018 getFetchCookieSync resultValue2:' + resultValue2)
                  if (resultCode === 0 &&  resultValue === 'name=Li' && resultValue2 === '') {
                    Utils.emitEvent(true,147720)
                  } else {
                    Utils.emitEvent(false,147720)
                  }
                  break
                }
                case 'emitConfigCookieSync019': {
                  let resultCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'area=JiangNing\nArea123; Secure; HttpOnly;', true, true)
                  console.log('emitConfigCookieSync019 setConfigCookieSync resultCode:' + resultCode)
                  let resultValue = testNapi.getFetchCookieSync(URL_EXAMPLE, true, true)
                  console.log('emitConfigCookieSync019 getFetchCookieSync resultValue:' + resultValue)
                  if (resultCode === 0 &&  resultValue === 'area=JiangNing') {
                    Utils.emitEvent(true,147730)
                  } else {
                    Utils.emitEvent(false,147730)
                  }
                  break
                }
                case 'emitFetchCookieSyncPartitioned001': {
                  let setCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'part=syncTrue', false, false)
                  let resultCode = testNapi.fetchCookieSyncPartitioned(URL_EXAMPLE, false, false, true)
                  let resultValue = testNapi.getFetchCookieSyncPartitionedValue()
                  console.log('emitFetchCookieSyncPartitioned001 setCode:' + setCode +
                    ' resultCode:' + resultCode + ' resultValue:' + resultValue)
                  if (resultCode === 0 && resultValue === 'part=syncTrue') {
                    Utils.emitEvent(true, 147740)
                  } else {
                    Utils.emitEvent(false, 147740)
                  }
                  break
                }
                case 'emitFetchCookieSyncPartitioned002': {
                  let setCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'part=syncFalse', false, false)
                  let resultCode = testNapi.fetchCookieSyncPartitioned(URL_EXAMPLE, false, false, false)
                  let resultValue = testNapi.getFetchCookieSyncPartitionedValue()
                  console.log('emitFetchCookieSyncPartitioned002 setCode:' + setCode +
                    ' resultCode:' + resultCode + ' resultValue:' + resultValue)
                  if (resultCode === 0 && resultValue === 'part=syncFalse') {
                    Utils.emitEvent(true, 147750)
                  } else {
                    Utils.emitEvent(false, 147750)
                  }
                  break
                }
                case 'emitFetchCookieSyncPartitioned003': {
                  let setCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'part=httpOnly', false, true)
                  let resultCode = testNapi.fetchCookieSyncPartitioned(URL_EXAMPLE, false, true, true)
                  let resultValue = testNapi.getFetchCookieSyncPartitionedValue()
                  console.log('emitFetchCookieSyncPartitioned003 setCode:' + setCode +
                    ' resultCode:' + resultCode + ' resultValue:' + resultValue)
                  if (resultCode === 0 && resultValue === 'part=httpOnly') {
                    Utils.emitEvent(true, 147760)
                  } else {
                    Utils.emitEvent(false, 147760)
                  }
                  break
                }
                case 'emitFetchCookieSyncPartitioned004': {
                  let setCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'part=incognito', true, false)
                  let resultCode = testNapi.fetchCookieSyncPartitioned(URL_EXAMPLE, true, false, true)
                  let resultValue = testNapi.getFetchCookieSyncPartitionedValue()
                  console.log('emitFetchCookieSyncPartitioned004 setCode:' + setCode +
                    ' resultCode:' + resultCode + ' resultValue:' + resultValue)
                  if (resultCode === 0 && resultValue === 'part=incognito') {
                    Utils.emitEvent(true, 147770)
                  } else {
                    Utils.emitEvent(false, 147770)
                  }
                  break
                }
                case 'emitFetchCookieSyncPartitionedInvalidUrl005': {
                  let resultCode = testNapi.fetchCookieSyncPartitioned('', false, false, true)
                  console.log('emitFetchCookieSyncPartitionedInvalidUrl005 resultCode:' + resultCode)
                  if (resultCode === 17100103) {
                    Utils.emitEvent(true, 147780)
                  } else {
                    Utils.emitEvent(false, 147780)
                  }
                  break
                }
                case 'emitFetchCookieSyncPartitionedInvalidParam006': {
                  let resultCode = testNapi.fetchCookieSyncPartitionedInvalidParam(URL_EXAMPLE, false, false, true)
                  console.log('emitFetchCookieSyncPartitionedInvalidParam006 resultCode:' + resultCode)
                  if (resultCode === 17100101) {
                    Utils.emitEvent(true, 147790)
                  } else {
                    Utils.emitEvent(false, 147790)
                  }
                  break
                }
                case 'emitFetchCookieAsyncPartitioned007': {
                  let setCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'part=asyncTrue', false, false)
                  testNapi.fetchCookieAsyncPartitioned(URL_EXAMPLE, false, false, true)
                  await waitForExist(() => testNapi.getFetchCookieAsyncPartitionedCode(),
                    'emitFetchCookieAsyncPartitioned007', 0, 500)
                  let resultCode = testNapi.getFetchCookieAsyncPartitionedCode()
                  let resultValue = testNapi.getFetchCookieAsyncPartitionedValue()
                  console.log('emitFetchCookieAsyncPartitioned007 setCode:' + setCode +
                    ' resultCode:' + resultCode + ' resultValue:' + resultValue)
                  if (resultCode === 0 && resultValue === 'part=asyncTrue') {
                    Utils.emitEvent(true, 147800)
                  } else {
                    Utils.emitEvent(false, 147800)
                  }
                  break
                }
                case 'emitFetchCookieAsyncPartitioned008': {
                  let setCode = testNapi.setConfigCookieSync(URL_EXAMPLE, 'part=asyncFalse', false, false)
                  testNapi.fetchCookieAsyncPartitioned(URL_EXAMPLE, false, false, false)
                  await waitForExist(() => testNapi.getFetchCookieAsyncPartitionedCode(),
                    'emitFetchCookieAsyncPartitioned008', 0, 500)
                  let resultCode = testNapi.getFetchCookieAsyncPartitionedCode()
                  let resultValue = testNapi.getFetchCookieAsyncPartitionedValue()
                  console.log('emitFetchCookieAsyncPartitioned008 setCode:' + setCode +
                    ' resultCode:' + resultCode + ' resultValue:' + resultValue)
                  if (resultCode === 0 && resultValue === 'part=asyncFalse') {
                    Utils.emitEvent(true, 147810)
                  } else {
                    Utils.emitEvent(false, 147810)
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
                    Utils.emitEvent(true, 147820)
                  } else {
                    Utils.emitEvent(false, 147820)
                  }
                  break
                }
                case 'emitFetchCookieAsyncPartitionedNullCallback010': {
                  let resultValue = testNapi.fetchCookieAsyncPartitionedNullCallback(URL_EXAMPLE, false, false, true)
                  console.log('emitFetchCookieAsyncPartitionedNullCallback010 resultValue:' + resultValue)
                  if (resultValue === 1) {
                    Utils.emitEvent(true, 147830)
                  } else {
                    Utils.emitEvent(false, 147830)
                  }
                  break
                }

                case 'emitEtsFetchCookieSyncPartitioned001': {
                  let resultValue: string = '0'
                  try {
                    web_webview.WebCookieManager.clearAllCookiesSync();
                    web_webview.WebCookieManager.configCookieSync(URL_EXAMPLE, 'part=true', false);
                    resultValue = web_webview.WebCookieManager.fetchCookieSync(URL_EXAMPLE, false, true);
                    console.log('emitEtsFetchCookieSyncPartitioned001 cookie : ' + resultValue);
                  } catch (error) {
                    let e: business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`emitEtsFetchCookieSyncPartitioned001 ErrorCode: ${e.code},  Message: ${e.message}`);
                    resultValue = String(e.code)
                  }
                  if (resultValue === 'part=true') {
                    Utils.emitEvent(true, 147840)
                  } else {
                    Utils.emitEvent(false, 147840)
                  }
                  break
                }
                case 'emitEtsFetchCookieSyncPartitioned002': {
                  let resultValue: string = '0'
                  try {
                    web_webview.WebCookieManager.clearAllCookiesSync();
                    web_webview.WebCookieManager.configCookieSync(URL_EXAMPLE, 'part=false', false);
                    resultValue = web_webview.WebCookieManager.fetchCookieSync(URL_EXAMPLE, false, false);
                    console.log('emitEtsFetchCookieSyncPartitioned002 cookie : ' + resultValue);
                  } catch (error) {
                    let e: business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`emitEtsFetchCookieSyncPartitioned002 ErrorCode: ${e.code},  Message: ${e.message}`);
                    resultValue = String(e.code)
                  }
                  if (resultValue === 'part=false') {
                    Utils.emitEvent(true, 147850)
                  } else {
                    Utils.emitEvent(false, 147850)
                  }
                  break
                }
                case 'emitEtsFetchCookieSyncPartitioned003': {
                  let resultValue: string = '0'
                  try {
                    web_webview.WebCookieManager.clearAllCookiesSync();
                    web_webview.WebCookieManager.configCookieSync(URL_EXAMPLE, 'part=default', false);
                    resultValue = web_webview.WebCookieManager.fetchCookieSync(URL_EXAMPLE, false);
                    console.log('emitEtsFetchCookieSyncPartitioned003 cookie : ' + resultValue);
                  } catch (error) {
                    let e: business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`emitEtsFetchCookieSyncPartitioned003 ErrorCode: ${e.code},  Message: ${e.message}`);
                    resultValue = String(e.code)
                  }
                  if (resultValue === 'part=default') {
                    Utils.emitEvent(true, 147860)
                  } else {
                    Utils.emitEvent(false, 147860)
                  }
                  break
                }
                case 'emitEtsFetchCookieSyncPartitioned004': {
                  let resultValue: string = '0'
                  try {
                    web_webview.WebCookieManager.clearAllCookiesSync(true);
                    web_webview.WebCookieManager.configCookieSync(URL_EXAMPLE, 'part=incognito', true);
                    resultValue = web_webview.WebCookieManager.fetchCookieSync(URL_EXAMPLE, true, true);
                    console.log('emitEtsFetchCookieSyncPartitioned004 cookie : ' + resultValue);
                  } catch (error) {
                    let e: business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`emitEtsFetchCookieSyncPartitioned004 ErrorCode: ${e.code},  Message: ${e.message}`);
                    resultValue = String(e.code)
                  }
                  if (resultValue === 'part=incognito') {
                    Utils.emitEvent(true, 147870)
                  } else {
                    Utils.emitEvent(false, 147870)
                  }
                  break
                }
                case 'emitEtsFetchCookiePartitioned005': {
                  let resultValue: string = '0'
                  try {
                    web_webview.WebCookieManager.clearAllCookiesSync();
                    web_webview.WebCookieManager.configCookieSync(URL_EXAMPLE, 'async=true', false);
                    web_webview.WebCookieManager.fetchCookie(URL_EXAMPLE, false, true)
                      .then(cookie => {
                        console.log('emitEtsFetchCookiePartitioned005 cookie : ' + cookie);
                        resultValue = cookie
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.error(`emitEtsFetchCookiePartitioned005 ErrorCode: ${error.code},  Message: ${error.message}`);
                        resultValue = String(error.code)
                      })
                  } catch (error) {
                    let e: business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`emitEtsFetchCookiePartitioned005 ErrorCode: ${e.code},  Message: ${e.message}`);
                    resultValue = String(e.code)
                  }
                  await waitForExist(() => resultValue, 'emitEtsFetchCookiePartitioned005', 'async=true', 200)
                  if (resultValue === 'async=true') {
                    Utils.emitEvent(true, 147880)
                  } else {
                    Utils.emitEvent(false, 147880)
                  }
                  break
                }
                case 'emitEtsFetchCookiePartitioned006': {
                  let resultValue: string = '0'
                  try {
                    web_webview.WebCookieManager.clearAllCookiesSync();
                    web_webview.WebCookieManager.configCookieSync(URL_EXAMPLE, 'async=false', false);
                    web_webview.WebCookieManager.fetchCookie(URL_EXAMPLE, false, false)
                      .then(cookie => {
                        console.log('emitEtsFetchCookiePartitioned006 cookie : ' + cookie);
                        resultValue = cookie
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.error(`emitEtsFetchCookiePartitioned006 ErrorCode: ${error.code},  Message: ${error.message}`);
                        resultValue = String(error.code)
                      })
                  } catch (error) {
                    let e: business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`emitEtsFetchCookiePartitioned006 ErrorCode: ${e.code},  Message: ${e.message}`);
                    resultValue = String(e.code)
                  }
                  await waitForExist(() => resultValue, 'emitEtsFetchCookiePartitioned006', 'async=false', 200)
                  if (resultValue === 'async=false') {
                    Utils.emitEvent(true, 147890)
                  } else {
                    Utils.emitEvent(false, 147890)
                  }
                  break
                }
                case 'emitEtsFetchCookiePartitioned007': {
                  let resultValue: string = '0'
                  try {
                    web_webview.WebCookieManager.clearAllCookiesSync(true);
                    web_webview.WebCookieManager.configCookieSync(URL_EXAMPLE, 'async=incognito', true);
                    web_webview.WebCookieManager.fetchCookie(URL_EXAMPLE, true, true)
                      .then(cookie => {
                        console.log('emitEtsFetchCookiePartitioned007 cookie : ' + cookie);
                        resultValue = cookie
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.error(`emitEtsFetchCookiePartitioned007 ErrorCode: ${error.code},  Message: ${error.message}`);
                        resultValue = String(error.code)
                      })
                  } catch (error) {
                    let e: business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`emitEtsFetchCookiePartitioned007 ErrorCode: ${e.code},  Message: ${e.message}`);
                    resultValue = String(e.code)
                  }
                  await waitForExist(() => resultValue, 'emitEtsFetchCookiePartitioned007', 'async=incognito', 200)
                  if (resultValue === 'async=incognito') {
                    Utils.emitEvent(true, 147900)
                  } else {
                    Utils.emitEvent(false, 147900)
                  }
                  break
                }
                case 'emitEtsFetchCookieSyncPartitionedErrorUrl008': {
                  let resultValue: string = ''
                  try {
                    web_webview.WebCookieManager.clearAllCookiesSync();
                    web_webview.WebCookieManager.fetchCookieSync('', false, true);
                  } catch (error) {
                    let e: business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`emitEtsFetchCookieSyncPartitionedErrorUrl008 ErrorCode: ${e.code},  Message: ${e.message}`);
                    resultValue = e.code + e.message
                  }
                  if (resultValue === '17100002URL error. No valid cookie found for the specified URL.') {
                    Utils.emitEvent(true, 147910)
                  } else {
                    Utils.emitEvent(false, 147910)
                  }
                  break
                }
                case 'emitEtsFetchCookiePartitionedErrorUrl009': {
                  let resultValue: string = ''
                  try {
                    web_webview.WebCookieManager.clearAllCookiesSync();
                    web_webview.WebCookieManager.fetchCookie('', false, true)
                      .then(cookie => {
                        console.log('emitEtsFetchCookiePartitionedErrorUrl009 cookie : ' + cookie);
                        resultValue = cookie
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.error(`emitEtsFetchCookiePartitionedErrorUrl009 ErrorCode: ${error.code},  Message: ${error.message}`);
                        resultValue = error.code + error.message
                      })
                  } catch (error) {
                    let e: business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`emitEtsFetchCookiePartitionedErrorUrl009 ErrorCode: ${e.code},  Message: ${e.message}`);
                    resultValue = e.code + e.message
                  }
                  await waitForExist(() => resultValue !== '', 'emitEtsFetchCookiePartitionedErrorUrl009', true, 200)
                  if (resultValue === '17100002URL error. No valid cookie found for the specified URL.') {
                    Utils.emitEvent(true, 147920)
                  } else {
                    Utils.emitEvent(false, 147920)
                  }
                  break
                }
                case 'emitEtsFetchCookieSyncPartitionedNull010': {
                  let resultValue: string = '0'
                  try {
                    web_webview.WebCookieManager.clearAllCookiesSync();
                    web_webview.WebCookieManager.configCookieSync(URL_EXAMPLE, 'part=null', false);
                    resultValue = web_webview.WebCookieManager.fetchCookieSync(URL_EXAMPLE, false, null);
                    console.log('emitEtsFetchCookieSyncPartitionedNull010 cookie : ' + resultValue);
                  } catch (error) {
                    let e: business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`emitEtsFetchCookieSyncPartitionedNull010 ErrorCode: ${e.code},  Message: ${e.message}`);
                    resultValue = String(e.code)
                  }
                  if (resultValue === 'part=null' || resultValue === '401') {
                    Utils.emitEvent(true, 147930)
                  } else {
                    Utils.emitEvent(false, 147930)
                  }
                  break
                }
                case 'emitEtsFetchCookieSyncPartitionedUndefined011': {
                  let resultValue: string = '0'
                  try {
                    web_webview.WebCookieManager.clearAllCookiesSync();
                    web_webview.WebCookieManager.configCookieSync(URL_EXAMPLE, 'part=undefined', false);
                    resultValue = web_webview.WebCookieManager.fetchCookieSync(URL_EXAMPLE, false, undefined);
                    console.log('emitEtsFetchCookieSyncPartitionedUndefined011 cookie : ' + resultValue);
                  } catch (error) {
                    let e: business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`emitEtsFetchCookieSyncPartitionedUndefined011 ErrorCode: ${e.code},  Message: ${e.message}`);
                    resultValue = String(e.code)
                  }
                  if (resultValue === 'part=undefined' || resultValue === '401') {
                    Utils.emitEvent(true, 147940)
                  } else {
                    Utils.emitEvent(false, 147940)
                  }
                  break
                }
                case 'emitEtsFetchCookiePartitionedNull012': {
                  let resultValue: string = '0'
                  try {
                    web_webview.WebCookieManager.clearAllCookiesSync();
                    web_webview.WebCookieManager.configCookieSync(URL_EXAMPLE, 'async=null', false);
                    web_webview.WebCookieManager.fetchCookie(URL_EXAMPLE, false, null)
                      .then(cookie => {
                        console.log('emitEtsFetchCookiePartitionedNull012 cookie : ' + cookie);
                        resultValue = cookie
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.error(`emitEtsFetchCookiePartitionedNull012 ErrorCode: ${error.code},  Message: ${error.message}`);
                        resultValue = String(error.code)
                      })
                  } catch (error) {
                    let e: business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`emitEtsFetchCookiePartitionedNull012 ErrorCode: ${e.code},  Message: ${e.message}`);
                    resultValue = String(e.code)
                  }
                  await waitForExist(() => (resultValue === 'async=null' || resultValue === '401'),
                    'emitEtsFetchCookiePartitionedNull012', true, 200)
                  if (resultValue === 'async=null' || resultValue === '401') {
                    Utils.emitEvent(true, 147950)
                  } else {
                    Utils.emitEvent(false, 147950)
                  }
                  break
                }
                case 'emitEtsFetchCookiePartitionedUndefined013': {
                  let resultValue: string = '0'
                  try {
                    web_webview.WebCookieManager.clearAllCookiesSync();
                    web_webview.WebCookieManager.configCookieSync(URL_EXAMPLE, 'async=undefined', false);
                    web_webview.WebCookieManager.fetchCookie(URL_EXAMPLE, false, undefined)
                      .then(cookie => {
                        console.log('emitEtsFetchCookiePartitionedUndefined013 cookie : ' + cookie);
                        resultValue = cookie
                      })
                      .catch((error: business_error.BusinessError) => {
                        console.error(`emitEtsFetchCookiePartitionedUndefined013 ErrorCode: ${error.code},  Message: ${error.message}`);
                        resultValue = String(error.code)
                      })
                  } catch (error) {
                    let e: business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`emitEtsFetchCookiePartitionedUndefined013 ErrorCode: ${e.code},  Message: ${e.message}`);
                    resultValue = String(e.code)
                  }
                  await waitForExist(() => (resultValue === 'async=undefined' || resultValue === '401'),
                    'emitEtsFetchCookiePartitionedUndefined013', true, 200)
                  if (resultValue === 'async=undefined' || resultValue === '401') {
                    Utils.emitEvent(true, 147960)
                  } else {
                    Utils.emitEvent(false, 147960)
                  }
                  break
                }
                default :
                  break
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
