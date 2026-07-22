/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import business_error from '@ohos.base'
import { waitForExist, waitForAssert } from '../../test/WaitTest'
import { URL } from '../../test/Config'


@Entry
@Component
struct WebCookieManagerFetchCookieIncognito {
  controller: webView.WebviewController = new webView.WebviewController();
  @State console: string = ''
  @State str: string = ''
  @State isComplete: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 136700,
      priority: events_emitter.EventPriority.LOW,
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(136700)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebCookieManagerFetchCookie click').key('WebCookieManagerFetchCookieTestButton')
          .onClick(async () => {
            await waitForExist(() => this.isComplete, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;

            console.info('key==>' + this.str)
            switch (this.str) {
              case 'testFetchCookieIncognito001': {
                let resultValue: string = '0'
                try {
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.configCookieSync(URL, 'a=b', false);
                  webView.WebCookieManager.fetchCookie(URL, false)
                    .then(cookie => {
                      console.log('testFetchCookieIncognito001 fetchCookie cookie : ' + cookie);
                      resultValue = cookie
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error(`testFetchCookieIncognito001 ErrorCode: ${error.code},  Message: ${error.message}`);
                      resultValue = String(error.code)
                    })
                } catch (error) {
                  console.error(`testFetchCookieIncognito001 ErrorCode: ${(error as business_error.BusinessError).code},  Message: ${(error as business_error.BusinessError).message}`);
                  resultValue = String(error.code)
                }

                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'a=b', 136710, this.str);
                break;
              }

              case 'testFetchCookieIncognito002': {
                let resultValue: string = '0'
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(URL, 'aa=cc', true);
                  webView.WebCookieManager.fetchCookie(URL, true)
                    .then(cookie => {
                      console.log('testFetchCookieIncognito002 cookie : ' + cookie);
                      resultValue = cookie
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('testFetchCookieIncognito002 error: ' + JSON.stringify(error));
                      resultValue = String(error.code)
                    })
                } catch (error) {
                  console.error(`testFetchCookieIncognito002 ErrorCode: ${error.code},  Message: ${error.message}`);
                  resultValue = String(error.code)
                }

                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'aa=cc', 136720, this.str);
                break;
              }

              case 'testFetchCookieIncognitoErrorCode003': {
                let resultValue = ''
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(URL, 'abc=edf', true);
                  webView.WebCookieManager.fetchCookie('', true)
                    .then(cookie => {
                      console.log('testFetchCookieIncognitoErrorCode003 cookie : ' + cookie);
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.log('testFetchCookieIncognitoErrorCode003 error: ' + JSON.stringify(error));
                      resultValue = error.code + error.message
                    })
                } catch (error) {
                  console.error(`testFetchCookieIncognitoErrorCode003 ErrorCode: ${error.code},  Message: ${error.message}`);
                  resultValue = error.code + error.message
                }

                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, '17100002URL error. No valid cookie found for the specified URL.', 136730, this.str);
                break;
              }

              case 'testFetchCookieSyncPartitionedTrue001': {
                let resultValue: string = '0'
                try {
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.configCookieSync(URL, 'part=true', false);
                  resultValue = webView.WebCookieManager.fetchCookieSync(URL, false, true);
                  console.log('testFetchCookieSyncPartitionedTrue001 cookie : ' + resultValue);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testFetchCookieSyncPartitionedTrue001 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(e.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'part=true', 139210, this.str);
                break;
              }

              case 'testFetchCookieSyncPartitionedFalse002': {
                let resultValue: string = '0'
                try {
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.configCookieSync(URL, 'part=false', false);
                  resultValue = webView.WebCookieManager.fetchCookieSync(URL, false, false);
                  console.log('testFetchCookieSyncPartitionedFalse002 cookie : ' + resultValue);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testFetchCookieSyncPartitionedFalse002 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(e.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'part=false', 139220, this.str);
                break;
              }

              case 'testFetchCookieSyncPartitionedDefault003': {
                let resultValue: string = '0'
                try {
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.configCookieSync(URL, 'part=default', false);
                  resultValue = webView.WebCookieManager.fetchCookieSync(URL, false);
                  console.log('testFetchCookieSyncPartitionedDefault003 cookie : ' + resultValue);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testFetchCookieSyncPartitionedDefault003 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(e.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'part=default', 139230, this.str);
                break;
              }

              case 'testFetchCookieSyncPartitionedIncognito004': {
                let resultValue: string = '0'
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(URL, 'part=incognito', true);
                  resultValue = webView.WebCookieManager.fetchCookieSync(URL, true, true);
                  console.log('testFetchCookieSyncPartitionedIncognito004 cookie : ' + resultValue);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testFetchCookieSyncPartitionedIncognito004 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(e.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'part=incognito', 139240, this.str);
                break;
              }

              case 'testFetchCookiePartitionedTrue005': {
                let resultValue: string = '0'
                try {
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.configCookieSync(URL, 'async=true', false);
                  webView.WebCookieManager.fetchCookie(URL, false, true)
                    .then(cookie => {
                      console.log('testFetchCookiePartitionedTrue005 cookie : ' + cookie);
                      resultValue = cookie
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error(`testFetchCookiePartitionedTrue005 ErrorCode: ${error.code},  Message: ${error.message}`);
                      resultValue = String(error.code)
                    })
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testFetchCookiePartitionedTrue005 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(e.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'async=true', 139250, this.str);
                break;
              }

              case 'testFetchCookiePartitionedFalse006': {
                let resultValue: string = '0'
                try {
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.configCookieSync(URL, 'async=false', false);
                  webView.WebCookieManager.fetchCookie(URL, false, false)
                    .then(cookie => {
                      console.log('testFetchCookiePartitionedFalse006 cookie : ' + cookie);
                      resultValue = cookie
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error(`testFetchCookiePartitionedFalse006 ErrorCode: ${error.code},  Message: ${error.message}`);
                      resultValue = String(error.code)
                    })
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testFetchCookiePartitionedFalse006 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(e.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'async=false', 139260, this.str);
                break;
              }

              case 'testFetchCookiePartitionedIncognito007': {
                let resultValue: string = '0'
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(URL, 'async=incognito', true);
                  webView.WebCookieManager.fetchCookie(URL, true, true)
                    .then(cookie => {
                      console.log('testFetchCookiePartitionedIncognito007 cookie : ' + cookie);
                      resultValue = cookie
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error(`testFetchCookiePartitionedIncognito007 ErrorCode: ${error.code},  Message: ${error.message}`);
                      resultValue = String(error.code)
                    })
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testFetchCookiePartitionedIncognito007 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(e.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'async=incognito', 139270, this.str);
                break;
              }

              case 'testFetchCookieSyncPartitionedErrorUrl008': {
                let resultValue: string = ''
                try {
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.fetchCookieSync('', false, true);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testFetchCookieSyncPartitionedErrorUrl008 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = e.code + e.message
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check,
                  '17100002URL error. No valid cookie found for the specified URL.', 139280, this.str);
                break;
              }

              case 'testFetchCookiePartitionedErrorUrl009': {
                let resultValue: string = ''
                try {
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.fetchCookie('', false, true)
                    .then(cookie => {
                      console.log('testFetchCookiePartitionedErrorUrl009 cookie : ' + cookie);
                      resultValue = cookie
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error(`testFetchCookiePartitionedErrorUrl009 ErrorCode: ${error.code},  Message: ${error.message}`);
                      resultValue = error.code + error.message
                    })
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testFetchCookiePartitionedErrorUrl009 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = e.code + e.message
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check,
                  '17100002URL error. No valid cookie found for the specified URL.', 139290, this.str);
                break;
              }

              case 'testFetchCookieSyncPartitionedNull010': {
                let resultValue: string = '0';
                try {
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.configCookieSync(URL, 'part=null', false);
                  resultValue = webView.WebCookieManager.fetchCookieSync(URL, false, null);
                  console.log('testFetchCookieSyncPartitionedNull010 cookie : ' + resultValue);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testFetchCookieSyncPartitionedNull010 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(e.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return (v1 === v2 || v1 === '401') ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'part=null', 139300, this.str);
                break;
              }

              case 'testFetchCookieSyncPartitionedUndefined011': {
                let resultValue: string = '0';
                try {
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.configCookieSync(URL, 'part=undefined', false);
                  resultValue = webView.WebCookieManager.fetchCookieSync(URL, false, undefined);
                  console.log('testFetchCookieSyncPartitionedUndefined011 cookie : ' + resultValue);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testFetchCookieSyncPartitionedUndefined011 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(e.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return (v1 === v2 || v1 === '401') ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'part=undefined', 139310, this.str);
                break;
              }

              case 'testFetchCookiePartitionedNull012': {
                let resultValue: string = '0';
                try {
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.configCookieSync(URL, 'async=null', false);
                  webView.WebCookieManager.fetchCookie(URL, false, null)
                    .then(cookie => {
                      console.log('testFetchCookiePartitionedNull012 cookie : ' + cookie);
                      resultValue = cookie
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error(`testFetchCookiePartitionedNull012 ErrorCode: ${error.code},  Message: ${error.message}`);
                      resultValue = String(error.code)
                    })
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testFetchCookiePartitionedNull012 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(e.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return (v1 === v2 || v1 === '401') ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'async=null', 139320, this.str);
                break;
              }

              case 'testFetchCookiePartitionedUndefined013': {
                let resultValue: string = '0';
                try {
                  webView.WebCookieManager.clearAllCookiesSync();
                  webView.WebCookieManager.configCookieSync(URL, 'async=undefined', false);
                  webView.WebCookieManager.fetchCookie(URL, false, undefined)
                    .then(cookie => {
                      console.log('testFetchCookiePartitionedUndefined013 cookie : ' + cookie);
                      resultValue = cookie
                    })
                    .catch((error: business_error.BusinessError) => {
                      console.error(`testFetchCookiePartitionedUndefined013 ErrorCode: ${error.code},  Message: ${error.message}`);
                      resultValue = String(error.code)
                    })
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testFetchCookiePartitionedUndefined013 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(e.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return (v1 === v2 || v1 === '401') ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'async=undefined', 139330, this.str);
                break;
              }
            }
          },
          )
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onConsole((event) => {
          if (event) {
            this.console = event.message.getMessage()
          }
          return false
        })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isComplete = 0;
        })
    }
  }
}
