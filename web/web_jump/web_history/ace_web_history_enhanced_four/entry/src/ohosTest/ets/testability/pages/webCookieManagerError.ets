/*
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

import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import business_error from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import { waitForExist } from '../../test/WaitTest.test';
import { URL } from '../../test/Config.test';

@Entry
@Component
struct webCookieManagerError {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 134000,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(134000)
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
        Button('CookieManager Error click').key('webCookieManagerErrorButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0, 1000);
          await waitForExist(() => this.isReceive, this.str, 0, 1000);
          this.isReceive = -1;
          console.info('key==>' + this.str);
          
          switch (this.str) {
            // getCookie - url参数测试 (null, undefined, '')
            case 'emitGetCookieError001': {
              try {
                let value = webView.WebCookieManager.getCookie(null);
                console.log(this.str + 'getCookie cookie = ' + value);
                Utils.emitEvent('no_error', 134010);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134010);
              }
              break;
            }
            case 'emitGetCookieError002': {
              try {
                let value = webView.WebCookieManager.getCookie(undefined);
                console.log(this.str + 'getCookie cookie = ' + value);
                Utils.emitEvent('no_error', 134020);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134020);
              }
              break;
            }
            case 'emitGetCookieError003': {
              try {
                let value = webView.WebCookieManager.getCookie('');
                console.log(this.str + 'getCookie cookie = ' + value);
                Utils.emitEvent('no_error', 134030);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134030);
              }
              break;
            }
            
            // fetchCookieSync - url参数测试 (null, undefined, '')
            case 'emitFetchCookieSyncError001': {
              try {
                let value = webView.WebCookieManager.fetchCookieSync(null, true);
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
                Utils.emitEvent('no_error', 134040);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134040);
              }
              break;
            }
            case 'emitFetchCookieSyncError002': {
              try {
                let value = webView.WebCookieManager.fetchCookieSync(undefined, true);
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
                Utils.emitEvent('no_error', 134050);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134050);
              }
              break;
            }
            case 'emitFetchCookieSyncError003': {
              try {
                let value = webView.WebCookieManager.fetchCookieSync('', true);
                console.log(this.str + 'fetchCookieSync cookie = ' + value);
                Utils.emitEvent('no_error', 134060);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134060);
              }
              break;
            }
            
            // fetchCookie Promise - url参数测试 (null, undefined, '')
            case 'emitFetchCookiePromiseError001': {
              try {
                webView.WebCookieManager.fetchCookie(null)
                  .then((value: string) => {
                    console.log(this.str + 'fetchCookie cookie = ' + value);
                    Utils.emitEvent('no_error', 134070);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134070);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134070);
              }
              break;
            }
            case 'emitFetchCookiePromiseError002': {
              try {
                webView.WebCookieManager.fetchCookie(undefined)
                  .then((value: string) => {
                    console.log(this.str + 'fetchCookie cookie = ' + value);
                    Utils.emitEvent('no_error', 134080);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134080);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134080);
              }
              break;
            }
            case 'emitFetchCookiePromiseError003': {
              try {
                webView.WebCookieManager.fetchCookie('')
                  .then((value: string) => {
                    console.log(this.str + 'fetchCookie cookie = ' + value);
                    Utils.emitEvent('no_error', 134090);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134090);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134090);
              }
              break;
            }
            
            // fetchCookie Callback - url参数测试 (null, undefined, '')
            case 'emitFetchCookieCallbackUrlError001': {
              try {
                webView.WebCookieManager.fetchCookie(null, (error, value) => {
                  if (error) {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134100);
                  } else {
                    console.log(this.str + 'fetchCookie cookie = ' + value);
                    Utils.emitEvent('no_error', 134100);
                  }
                })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134100);
              }
              break;
            }
            case 'emitFetchCookieCallbackUrlError002': {
              try {
                webView.WebCookieManager.fetchCookie(undefined, (error, value) => {
                  if (error) {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134110);
                  } else {
                    console.log(this.str + 'fetchCookie cookie = ' + value);
                    Utils.emitEvent('no_error', 134110);
                  }
                })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134110);
              }
              break;
            }
            case 'emitFetchCookieCallbackUrlError003': {
              try {
                webView.WebCookieManager.fetchCookie('', (error, value) => {
                  if (error) {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134120);
                  } else {
                    console.log(this.str + 'fetchCookie cookie = ' + value);
                    Utils.emitEvent('no_error', 134120);
                  }
                })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134120);
              }
              break;
            }
            
            // fetchCookie Callback - callback参数测试 (null, undefined)
            case 'emitFetchCookieCallbackParamError001': {
              try {
                webView.WebCookieManager.fetchCookie(URL, null);
                console.log(this.str + 'fetchCookie success');
                Utils.emitEvent('no_error', 134130);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134130);
              }
              break;
            }
            case 'emitFetchCookieCallbackParamError002': {
              try {
                webView.WebCookieManager.fetchCookie(URL, undefined);
                console.log(this.str + 'fetchCookie success');
                Utils.emitEvent('no_error', 134140);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134140);
              }
              break;
            }
            
            // setCookie - url参数测试 (null, undefined, '')
            case 'emitSetCookieUrlError001': {
              try {
                webView.WebCookieManager.setCookie(null, 'a=b');
                console.log(this.str + 'setCookie success');
                Utils.emitEvent('no_error', 134150);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134150);
              }
              break;
            }
            case 'emitSetCookieUrlError002': {
              try {
                webView.WebCookieManager.setCookie(undefined, 'a=b');
                console.log(this.str + 'setCookie success');
                Utils.emitEvent('no_error', 134160);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134160);
              }
              break;
            }
            case 'emitSetCookieUrlError003': {
              try {
                webView.WebCookieManager.setCookie('', 'a=b');
                console.log(this.str + 'setCookie success');
                Utils.emitEvent('no_error', 134170);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134170);
              }
              break;
            }
            
            // setCookie - value参数测试 (null, undefined, '')
            case 'emitSetCookieValueError001': {
              try {
                webView.WebCookieManager.setCookie(URL, null);
                console.log(this.str + 'setCookie success');
                Utils.emitEvent('no_error', 134180);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134180);
              }
              break;
            }
            case 'emitSetCookieValueError002': {
              try {
                webView.WebCookieManager.setCookie(URL, undefined);
                console.log(this.str + 'setCookie success');
                Utils.emitEvent('no_error', 134190);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134190);
              }
              break;
            }
            case 'emitSetCookieValueError003': {
              try {
                webView.WebCookieManager.setCookie(URL, '');
                console.log(this.str + 'setCookie success');
                Utils.emitEvent('no_error', 134200);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134200);
              }
              break;
            }
            
            // configCookieSync - url参数测试 (null, undefined, '')
            case 'emitConfigCookieSyncUrlError001': {
              try {
                webView.WebCookieManager.configCookieSync(null, 'a=b', false, false);
                console.log(this.str + 'configCookieSync success');
                Utils.emitEvent('no_error', 134210);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134210);
              }
              break;
            }
            case 'emitConfigCookieSyncUrlError002': {
              try {
                webView.WebCookieManager.configCookieSync(undefined, 'a=b', true, false);
                console.log(this.str + 'configCookieSync success');
                Utils.emitEvent('no_error', 134220);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134220);
              }
              break;
            }
            case 'emitConfigCookieSyncUrlError003': {
              try {
                webView.WebCookieManager.configCookieSync('', 'a=b', true, true);
                console.log(this.str + 'configCookieSync success');
                Utils.emitEvent('no_error', 134230);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134230);
              }
              break;
            }
            
            // configCookieSync - value参数测试 (null, undefined, '')
            case 'emitConfigCookieSyncValueError001': {
              try {
                webView.WebCookieManager.configCookieSync(URL, null, false, false);
                console.log(this.str + 'configCookieSync success');
                Utils.emitEvent('no_error', 134240);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134240);
              }
              break;
            }
            case 'emitConfigCookieSyncValueError002': {
              try {
                webView.WebCookieManager.configCookieSync(URL, undefined, false, true);
                console.log(this.str + 'configCookieSync success');
                Utils.emitEvent('no_error', 134250);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134250);
              }
              break;
            }
            case 'emitConfigCookieSyncValueError003': {
              try {
                webView.WebCookieManager.configCookieSync(URL, '', true, false);
                console.log(this.str + 'configCookieSync success');
                Utils.emitEvent('no_error', 134260);
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                console.log(this.str + 'errorCode type: ' + typeof(error.code));
                Utils.emitEvent(error.code, 134260);
              }
              break;
            }
            case 'emitFetchCookieIncognitoPromiseError001': {
              try {
                webView.WebCookieManager.fetchCookie(null, true)
                  .then((value: string) => {
                    console.log(this.str + 'fetchCookie cookie = ' + value);
                    Utils.emitEvent('no_error', 134270);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134270);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134270);
              }
              break;
            }
            case 'emitFetchCookieIncognitoPromiseError002': {
              try {
                webView.WebCookieManager.fetchCookie(undefined, true)
                  .then((value: string) => {
                    console.log(this.str + 'fetchCookie cookie = ' + value);
                    Utils.emitEvent('no_error', 134280);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134280);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134280);
              }
              break;
            }
            case 'emitFetchCookieIncognitoPromiseError003': {
              try {
                webView.WebCookieManager.fetchCookie('', true)
                  .then((value: string) => {
                    console.log(this.str + 'fetchCookie cookie = ' + value);
                    Utils.emitEvent('no_error', 134290);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log(this.str + 'error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134290);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134290);
              }
              break;
            }
            case 'emitConfigCookiePromiseError001': {
              try {
                webView.WebCookieManager.configCookie(null, 'a=e')
                  .then(() => {
                    console.log('configCookie success!');
                    Utils.emitEvent('no_error', 134300);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134300);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134300);
              }
              break;
            }
            case 'emitConfigCookiePromiseError002': {
              try {
                webView.WebCookieManager.configCookie(undefined, 'a=e')
                  .then(() => {
                    console.log('configCookie success!');
                    Utils.emitEvent('no_error', 134310);
                  })
                  .catch((error: business_error.BusinessError) => {
                    console.log('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134310);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134310);
              }
              break;
            }
            case 'emitConfigCookieCallbackUrlError001': {
              try {
                webView.WebCookieManager.configCookie(null, 'a=d', (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134320);
                  }
                })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134320);
              }
              break;
            }
            case 'emitConfigCookieCallbackUrlError002': {
              try {
                webView.WebCookieManager.configCookie(undefined, 'a=d', (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134330);
                  }
                })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134330);
              }
              break;
            }
            case 'emitConfigCookieCallbackValueError001': {
              try {
                webView.WebCookieManager.configCookie(URL, null, (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134320);
                  }
                })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134320);
              }
              break;
            }
            case 'emitConfigCookieCallbackValueError002': {
              try {
                webView.WebCookieManager.configCookie(URL, undefined, (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134330);
                  }
                })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134330);
              }
              break;
            }
            case 'emitConfigCookieCallbackValueError003': {
              try {
                webView.WebCookieManager.configCookie(URL, '', (error) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134330);
                  }
                })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134330);
              }
              break;
            }
            case 'emitConfigCookieIncludeHttpOnlyUrlError001': {
              try {
                webView.WebCookieManager.configCookie(null, 'a=b', false, false)
                  .then(() => {
                    console.info('configCookie success!');
                    Utils.emitEvent('no_error', 134330);
                  })
                  .catch((error: BusinessError) => {
                    console.info('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134330);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134330);
              }
              break;
            }
            case 'emitConfigCookieIncludeHttpOnlyUrlError002': {
              try {
                webView.WebCookieManager.configCookie(undefined, 'a=b', true, false)
                  .then(() => {
                    console.info('configCookie success!');
                    Utils.emitEvent('no_error', 134340);
                  })
                  .catch((error: BusinessError) => {
                    console.info('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134340);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134340);
              }
              break;
            }
            case 'emitConfigCookieIncludeHttpOnlyUrlError003': {
              try {
                webView.WebCookieManager.configCookie('', 'a=b', true, true)
                  .then(() => {
                    console.info('configCookie success!');
                    Utils.emitEvent('no_error', 134350);
                  })
                  .catch((error: BusinessError) => {
                    console.info('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134350);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134350);
              }
              break;
            }
            case 'emitConfigCookieIncludeHttpOnlyValueError001': {
              try {
                webView.WebCookieManager.configCookie(URL, null, true, false)
                  .then(() => {
                    console.info('configCookie success!');
                    Utils.emitEvent('no_error', 134360);
                  })
                  .catch((error: BusinessError) => {
                    console.info('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134360);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134360);
              }
              break;
            }
            case 'emitConfigCookieIncludeHttpOnlyValueError002': {
              try {
                webView.WebCookieManager.configCookie(URL, undefined, true, false)
                  .then(() => {
                    console.info('configCookie success!');
                    Utils.emitEvent('no_error', 134360);
                  })
                  .catch((error: BusinessError) => {
                    console.info('error: ' + JSON.stringify(error));
                    console.log(this.str + 'errorCode type: ' + typeof(error.code));
                    Utils.emitEvent(error.code, 134360);
                  })
              } catch (error) {
                console.error(this.str + `Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 134360);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}
