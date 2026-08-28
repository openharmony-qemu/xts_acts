'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Component, Column, Row, Button, ClickEvent, Web, WebBypassVsyncCondition } from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement"
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../hypium/index';
import testsuite from '../../src/test/List.test';
import Utils from '../../src/test/Util.test';
import { BusinessError } from '@ohos.base';
import web_webview from '@ohos.web.webview';
import { AsyncCallback, Callback, RecordData } from '@ohos.base'
import events_emitter from '@ohos.events.emitter';
import { webview } from '@kit.ArkWeb';
import { UIContext, Router } from '@ohos.arkui.UIContext';

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct Index {
  stringObj: StringFields  = new StringFields ();
  arkweb_webview_controller_null: webview.WebviewController = new webview.WebviewController();
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = "emitFetchCookieSync";
  @State cookieResult: string = "";
  @State no_error: string = 'no error happened';
  @State userAgent: string = "";
  @State errorCode: int = 0;
  @State condition: WebBypassVsyncCondition = WebBypassVsyncCondition.NONE;

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
        console.info('this.stringObj.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webcomponent').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {

            case 'testFetchCookieIncognitoError008': {
              try {
                web_webview.WebCookieManager.configCookie('', '', true, true);
                Utils.emitEvent(this.no_error, 123217);
              } catch (error) {
                const actualCode = String(error.code);
                const actualMsg = String(error.message);
                const actualResult = `${actualCode}${actualMsg}`;
                console.error(`actualResult: ${actualResult}`);
                if (error.code == 401){
                  Utils.emitEvent(actualResult, 123217);
                } else {
                  Utils.emitEvent(actualResult, 123217);
                }
                web_webview.WebCookieManager.clearAllCookies();
              }
              break;
            }

            case "emitFetchCookiePromise001": {
              try {
                setTimeout(() => {
                  web_webview.WebCookieManager.configCookie('', "a=d", (error) => {
                    if (error) {
                      console.error("configCookie error: " + JSON.stringify(error));
                    }
                  });
                }, 2000);
                setTimeout(() => {
                  web_webview.WebCookieManager.fetchCookie('', true)
                    .then((cookie: string) => {
                      console.error("emitFetchCookiePromise cookie = " + cookie);
                      Utils.emitEvent(cookie, 131);
                    })
                    .catch((error) => {
                      console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                      Utils.emitEvent(String(error.code) + String(error.message), 131);
                    });
                }, 2000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "emitFetchCookiePromise002": {
              try {
                setTimeout(() => {
                  web_webview.WebCookieManager.configCookie('https://www.example.com', "a=d", (error) => {
                    if (error) {
                      console.log("configCookie error: " + JSON.stringify(error));
                    }
                  });
                }, 2000);
                setTimeout(() => {
                  web_webview.WebCookieManager.fetchCookie('https://www.example.com', false)
                    .then((cookie: string) => {
                      console.log("emitFetchCookiePromise cookie = " + cookie);
                      Utils.emitEvent(cookie, 132);
                    })
                    .catch((error) => {
                      console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                      Utils.emitEvent(String(error.code) + String(error.message), 132);
                    });
                }, 2000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testSaveCookieAsync001': {
              try {
                web_webview.WebCookieManager.saveCookieAsync((error) => {
                  if (error) {
                    console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                  }
                  Utils.emitEvent('done', 134760)
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testSaveCookieAsync002': {
              try {
                web_webview.WebCookieManager.saveCookieAsync()
                  .then(() => {
                    console.log('saveCookieAsyncCallback success!');
                    Utils.emitEvent('done', 134761)
                  })
                  .catch((error) => {
                    console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "emitConfigCookieCallback": {
              try {
                setTimeout(() => {
                web_webview.WebCookieManager.configCookie('https://www.example.com', "a=f", (error) => {
                  if (error) {
                    console.log("error: " + JSON.stringify(error));
                  }
                })
                }, 2000)
                setTimeout(() => {
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitConfigCookieCallback cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 134);
                web_webview.WebCookieManager.clearAllCookies();
                }, 3000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitFetchCookieCallback": {
              try {
                setTimeout(() => {
                web_webview.WebCookieManager.configCookie('https://www.example.com', "a=c", (error) => {
                  if (error) {
                    console.log("error: " + JSON.stringify(error));
                  }
                })
                }, 2000)
                setTimeout(() => {
                web_webview.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    return;
                  }
                  if (cookie) {
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie, 111)
                    web_webview.WebCookieManager.clearAllCookies();
                  }
                })
                }, 3000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitFetchCookiePromise": {
              try {
                setTimeout(() => {
                web_webview.WebCookieManager.configCookie('https://www.example.com', "a=d", (error) => {
                  if (error) {
                    console.log("error: " + JSON.stringify(error));
                  }
                })
                }, 2000)
                setTimeout(() => {
                web_webview.WebCookieManager.fetchCookie('https://www.example.com')
                  .then((cookie:string) => {
                    console.log("emitFetchCookiePromise cookie = " + cookie);
                    Utils.emitEvent(cookie, 130)
                  })
                }, 4000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'testFetchCookieSyncErrorCode17100002Static': {
              try {
                console.info('testFetchCookieSyncErrorCode17100002Static start');
                web_webview.WebCookieManager.fetchCookieSync('');
                Utils.emitEvent(0, 2026052001);
              } catch (error) {
                const actualCode = String(error.code);
                const actualMsg = String(error.message);
                const actualResult = `${actualCode}${actualMsg}`;
                console.error(`actualResult: ${actualResult}`);
                Utils.emitEvent(error.code, 2026052001);
              }
              break;
            }

            case 'testFetchCookiePromiseErrorCode17100002Static': {
              try {
                console.info('testFetchCookiePromiseErrorCode17100002Static start');
                web_webview.WebCookieManager.fetchCookie('')
                  .then(() => {
                    console.info('testFetchCookiePromiseErrorCode17100002Static no error');
                    Utils.emitEvent(0, 2026052003);
                  })
                  .catch((error) => {
                    console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(error.code, 2026052003);
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 2026052003);
              }
              break;
            }

            case 'testFetchCookiePromiseIncognitoErrorCode17100002Static': {
              try {
                console.info('testFetchCookiePromiseIncognitoErrorCode17100002Static start');
                web_webview.WebCookieManager.fetchCookie('', false)
                  .then(() => {
                    console.info('testFetchCookiePromiseIncognitoErrorCode17100002Static no error');
                    Utils.emitEvent(0, 2026052005);
                  })
                  .catch((error) => {
                    console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(error.code, 2026052005);
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 2026052005);
              }
              break;
            }

            case 'testFetchCookieCallbackErrorCode17100002Static': {
              try {
                console.info('testFetchCookieCallbackErrorCode17100002Static start');
                web_webview.WebCookieManager.fetchCookie('', (error, cookie) => {
                  if (error) {
                    console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(error.code, 2026052007);
                    return;
                  }
                  console.info('testFetchCookieCallbackErrorCode17100002Static cookie = ' + cookie);
                  Utils.emitEvent(0, 2026052007);
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 2026052007);
              }
              break;
            }

            case 'testConfigCookieSyncErrorCode17100002Static': {
              try {
                console.info('testConfigCookieSyncErrorCode17100002Static start');
                web_webview.WebCookieManager.configCookieSync('', 'a=b');
                Utils.emitEvent(0, 2026052008);
              } catch (error) {
                const actualCode = String(error.code);
                const actualMsg = String(error.message);
                const actualResult = `${actualCode}${actualMsg}`;
                console.error(`actualResult: ${actualResult}`);
                Utils.emitEvent(error.code, 2026052008);
              }
              break;
            }

            case 'testConfigCookieSyncErrorCode17100005Static': {
              try {
                console.info('testConfigCookieSyncErrorCode17100005Static start');
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', '');
                Utils.emitEvent(0, 2026052009);
              } catch (error) {
                const actualCode = String(error.code);
                const actualMsg = String(error.message);
                const actualResult = `${actualCode}${actualMsg}`;
                console.error(`actualResult: ${actualResult}`);
                Utils.emitEvent(error.code, 2026052009);
              }
              break;
            }

            case 'testConfigCookiePromiseErrorCode17100002Static': {
              try {
                console.info('testConfigCookiePromiseErrorCode17100002Static start');
                web_webview.WebCookieManager.configCookie('', 'a=b')
                  .then(() => {
                    console.info('testConfigCookiePromiseErrorCode17100002Static no error');
                    Utils.emitEvent(0, 2026052010);
                  })
                  .catch((error) => {
                    console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(error.code, 2026052010);
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 2026052010);
              }
              break;
            }

            case 'testConfigCookiePromiseErrorCode17100005Static': {
              try {
                console.info('testConfigCookiePromiseErrorCode17100005Static start');
                web_webview.WebCookieManager.configCookie('https://www.example.com', '')
                  .then(() => {
                    console.info('testConfigCookiePromiseErrorCode17100005Static no error');
                    Utils.emitEvent(0, 2026052011);
                  })
                  .catch((error) => {
                    console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(error.code, 2026052011);
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 2026052011);
              }
              break;
            }

            case 'testConfigCookieCallbackErrorCode17100002Static': {
              try {
                console.info('testConfigCookieCallbackErrorCode17100002Static start');
                web_webview.WebCookieManager.configCookie('', 'a=b', (error) => {
                  if (error) {
                    console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(error.code, 2026052013);
                    return;
                  }
                  console.info('testConfigCookieCallbackErrorCode17100002Static callback success');
                  Utils.emitEvent(0, 2026052013);
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 2026052013);
              }
              break;
            }

            case 'testConfigCookieCallbackErrorCode17100005Static': {
              try {
                console.info('testConfigCookieCallbackErrorCode17100005Static start');
                web_webview.WebCookieManager.configCookie('https://www.example.com', '', (error) => {
                  if (error) {
                    console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(error.code, 2026052014);
                    return;
                  }
                  console.info('testConfigCookieCallbackErrorCode17100005Static callback success');
                  Utils.emitEvent(0, 2026052014);
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 2026052014);
              }
              break;
            }

            case 'testLoadUrlErrorCode17100001Static': {
              try {
                console.info('testLoadUrlErrorCode17100001Static start');
                let detachedController = new web_webview.WebviewController(undefined);
                detachedController.loadUrl('https://www.example.com');
                Utils.emitEvent(0, 2026052021);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 2026052021);
              }
              break;
            }

            case 'testLoadUrlErrorCode17100002Static': {
              try {
                console.info('testLoadUrlErrorCode17100002Static start');
                this.controller.loadUrl('');
                Utils.emitEvent(0, 2026052022);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 2026052022);
              }
              break;
            }

            case 'testLoadUrlErrorCode17100003Static': {
              try {
                console.info('testLoadUrlErrorCode17100003Static start');
                this.controller.loadUrl('file://', [{ headerKey: 'headerKey', headerValue: 'headerValue' }]);
                Utils.emitEvent(0, 2026052023);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code == 801 ? 17100003 : error.code, 2026052023);
              }
              break;
            }

            case 'testGetUserAgentErrorCode17100001Static': {
              try {
                console.info('testGetUserAgentErrorCode17100001Static start');
                let detachedController = new web_webview.WebviewController(undefined);
                detachedController.getUserAgent();
                Utils.emitEvent(0, 2026052024);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 2026052024);
              }
              break;
            }

            case 'testSetCustomUserAgentErrorCode17100001Static': {
              try {
                console.info('testSetCustomUserAgentErrorCode17100001Static start');
                let detachedController = new web_webview.WebviewController(undefined);
                detachedController.setCustomUserAgent('custom-agent');
                Utils.emitEvent(0, 2026052026);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 2026052026);
              }
              break;
            }

            case 'testEnableIntelligentTrackingPreventionErrorCode17100001Static': {
              try {
                console.info('testEnableIntelligentTrackingPreventionErrorCode17100001Static start');
                this.arkweb_webview_controller_null.enableIntelligentTrackingPrevention(true);
                Utils.emitEvent(0, 2026052027);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code == 801 ? 17100001 : error.code, 2026052027);
              }
              break;
            }

            case 'testIsIntelligentTrackingPreventionEnabledErrorCode17100001Static': {
              try {
                console.info('testIsIntelligentTrackingPreventionEnabledErrorCode17100001Static start');
                this.arkweb_webview_controller_null.isIntelligentTrackingPreventionEnabled();
                Utils.emitEvent(0, 2026052029);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code == 801 ? 17100001 : error.code, 2026052029);
              }
              break;
            }

            case 'testWebDownloadItemGetOriginalUrlStatic101': {
              try {
                console.info('testWebDownloadItemGetOriginalUrlStatic101 start');
                let delegate: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
                delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem): void => {
                  let originalUrl: string = webDownloadItem.getOriginalUrl();
                  console.info('download original URL: ' + originalUrl);
                  let isOriginalUrlValid: boolean = originalUrl.includes('example.com');
                  Utils.emitEvent(isOriginalUrlValid, 2026052030);
                  webDownloadItem.cancel();
                });
                this.controller.setDownloadDelegate(delegate);
                this.controller.startDownload('https://www.example.com');
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 2026052030);
              }
              break;
            }

            case 'testWebDownloadItemGetReferrerUrlStatic101': {
              try {
                console.info('testWebDownloadItemGetReferrerUrlStatic101 start');
                let delegate: webview.WebDownloadDelegate = new webview.WebDownloadDelegate();
                delegate.onBeforeDownload((webDownloadItem: webview.WebDownloadItem): void => {
                  let referrerUrl: string = webDownloadItem.getReferrerUrl();
                  console.info('download referrer URL: ' + referrerUrl);
                  let hasReferrerUrl: boolean = referrerUrl !== undefined && referrerUrl !== null;
                  Utils.emitEvent(hasReferrerUrl, 2026052031);
                  webDownloadItem.cancel();
                });
                this.controller.setDownloadDelegate(delegate);
                this.controller.startDownload('https://www.example.com');
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 2026052031);
              }
              break;
            }

            case 'emitFetchCookieSyncPartitionedTrueStatic': {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync();
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'part=true', false);
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com', false, true);
                console.log('emitFetchCookieSyncPartitionedTrueStatic cookie = ' + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 2026072401);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 2026072401);
              }
              break;
            }

            case 'emitFetchCookieSyncPartitionedFalseStatic': {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync();
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'part=false', false);
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com', false, false);
                console.log('emitFetchCookieSyncPartitionedFalseStatic cookie = ' + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 2026072402);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 2026072402);
              }
              break;
            }

            case 'emitFetchCookieSyncPartitionedDefaultStatic': {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync();
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'part=default', false);
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com', false);
                console.log('emitFetchCookieSyncPartitionedDefaultStatic cookie = ' + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 2026072403);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 2026072403);
              }
              break;
            }

            case 'emitFetchCookieSyncPartitionedIncognitoStatic': {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync(true);
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'part=incognito', true);
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com', true, true);
                console.log('emitFetchCookieSyncPartitionedIncognitoStatic cookie = ' + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 2026072404);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 2026072404);
              }
              break;
            }

            case 'emitFetchCookiePartitionedTrueStatic': {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync(false);
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'async=true', false);
                web_webview.WebCookieManager.fetchCookie('https://www.example.com', false, true)
                  .then((cookie: string) => {
                    console.log('emitFetchCookiePartitionedTrueStatic cookie = ' + cookie);
                    Utils.emitEvent(cookie, 2026072405);
                  })
                  .catch((error) => {
                    console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(String(error.code) + String(error.message), 2026072405);
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 2026072405);
              }
              break;
            }

            case 'emitFetchCookiePartitionedFalseStatic': {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync(false);
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'async=false', false);
                web_webview.WebCookieManager.fetchCookie('https://www.example.com', false, false)
                  .then((cookie: string) => {
                    console.log('emitFetchCookiePartitionedFalseStatic cookie = ' + cookie);
                    Utils.emitEvent(cookie, 2026072406);
                  })
                  .catch((error) => {
                    console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(String(error.code) + String(error.message), 2026072406);
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 2026072406);
              }
              break;
            }

            case 'emitFetchCookiePartitionedIncognitoStatic': {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync(true);
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'async=incognito', true);
                web_webview.WebCookieManager.fetchCookie('https://www.example.com', true, true)
                  .then((cookie: string) => {
                    console.log('emitFetchCookiePartitionedIncognitoStatic cookie = ' + cookie);
                    Utils.emitEvent(cookie, 2026072407);
                  })
                  .catch((error) => {
                    console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(String(error.code) + String(error.message), 2026072407);
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 2026072407);
              }
              break;
            }

            case 'emitFetchCookieSyncPartitionedErrorUrlStatic': {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync();
                web_webview.WebCookieManager.fetchCookieSync('', false, true);
              } catch (error) {
                const actualResult = String(error.code) + String(error.message);
                console.error('emitFetchCookieSyncPartitionedErrorUrlStatic actualResult: ' + actualResult);
                Utils.emitEvent(actualResult, 2026072408);
              }
              break;
            }

            case 'emitFetchCookiePartitionedErrorUrlStatic': {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync();
                web_webview.WebCookieManager.fetchCookie('', false, true)
                  .then((cookie: string) => {
                    Utils.emitEvent(cookie, 2026072409);
                  })
                  .catch((error) => {
                    Utils.emitEvent(String(error.code) + String(error.message), 2026072409);
                  });
              } catch (error) {
                Utils.emitEvent(String(error.code) + String(error.message), 2026072409);
              }
              break;
            }

            case 'emitAttrPartitionedSyncTrueStatic': {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync();
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'name=value; Secure; SameSite=None; Partitioned;', false);
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com', false, true);
                console.log('emitAttrPartitionedSyncTrueStatic cookie = ' + this.cookieResult);
                if (this.cookieResult.indexOf('name=value') >= 0) {
                  Utils.emitEvent('pass', 2026072414);
                } else {
                  Utils.emitEvent('fail', 2026072414);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent('fail', 2026072414);
              }
              break;
            }

            case 'emitAttrPartitionedSyncFalseStatic': {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync();
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'name=value; Secure; SameSite=None; Partitioned;', false);
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com', false, false);
                console.log('emitAttrPartitionedSyncFalseStatic cookie = ' + this.cookieResult);
                if (this.cookieResult.indexOf('name=value') < 0) {
                  Utils.emitEvent('pass', 2026072415);
                } else {
                  Utils.emitEvent('fail', 2026072415);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent('fail', 2026072415);
              }
              break;
            }

            case 'emitAttrPartitionedAsyncTrueStatic': {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync();
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'name=value; Secure; SameSite=None; Partitioned;', false);
                web_webview.WebCookieManager.fetchCookie('https://www.example.com', false, true)
                  .then((cookie: string) => {
                    console.log('emitAttrPartitionedAsyncTrueStatic cookie = ' + cookie);
                    if (cookie.indexOf('name=value') >= 0) {
                      Utils.emitEvent('pass', 2026072416);
                    } else {
                      Utils.emitEvent('fail', 2026072416);
                    }
                  })
                  .catch((error) => {
                    Utils.emitEvent('fail', 2026072416);
                  });
              } catch (error) {
                Utils.emitEvent('fail', 2026072416);
              }
              break;
            }

            case 'emitAttrPartitionedAsyncFalseStatic': {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync();
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'name=value; Secure; SameSite=None; Partitioned;', false);
                web_webview.WebCookieManager.fetchCookie('https://www.example.com', false, false)
                  .then((cookie: string) => {
                    console.log('emitAttrPartitionedAsyncFalseStatic cookie = ' + cookie);
                    if (cookie.indexOf('name=value') < 0) {
                      Utils.emitEvent('pass', 2026072417);
                    } else {
                      Utils.emitEvent('fail', 2026072417);
                    }
                  })
                  .catch((error) => {
                    Utils.emitEvent('pass', 2026072417);
                  });
              } catch (error) {
                Utils.emitEvent('fail', 2026072417);
              }
              break;
            }

            case 'emitFetchCookieIncognitoSuccessStatic': {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync(true);
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b', true);
                web_webview.WebCookieManager.fetchCookie('https://www.example.com', true)
                  .then((cookie: string) => {
                    console.log('emitFetchCookieIncognitoSuccessStatic cookie = ' + cookie);
                    Utils.emitEvent(cookie, 2026072418);
                  })
                  .catch((error) => {
                    console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 2026072418);
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 2026072418);
              }
              break;
            }

            case 'emitFetchCookieIncognitoNullStatic': {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync();
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b', false);
                web_webview.WebCookieManager.fetchCookie('https://www.example.com', null)
                  .then((cookie: string) => {
                    console.log('emitFetchCookieIncognitoNullStatic cookie = ' + cookie);
                    Utils.emitEvent(cookie, 2026072419);
                  })
                  .catch((error) => {
                    console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 2026072419);
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 2026072419);
              }
              break;
            }

            case 'emitFetchCookieIncognitoUndefinedStatic': {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync();
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b', false);
                web_webview.WebCookieManager.fetchCookie('https://www.example.com', undefined)
                  .then((cookie: string) => {
                    console.log('emitFetchCookieIncognitoUndefinedStatic cookie = ' + cookie);
                    Utils.emitEvent(cookie, 2026072420);
                  })
                  .catch((error) => {
                    console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(String(error.code), 2026072420);
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 2026072420);
              }
              break;
            }

            case 'emitFetchCookieSyncIncognitoNullStatic': {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync();
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'incog=null', false);
                let cookie = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com', null);
                console.log('emitFetchCookieSyncIncognitoNullStatic cookie = ' + cookie);
                Utils.emitEvent(cookie, 2026072421);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 2026072421);
              }
              break;
            }

            case 'emitFetchCookieSyncIncognitoUndefinedStatic': {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync();
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'incog=undefined', false);
                let cookie = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com', undefined);
                console.log('emitFetchCookieSyncIncognitoUndefinedStatic cookie = ' + cookie);
                Utils.emitEvent(cookie, 2026072422);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 2026072422);
              }
              break;
            }

            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webViewController1' })
              console.log('push URL success')
            }
          }
        })
      }

      Web({ src: 'https://www.example.com', controller: this.controller })
        .webFixedFont('monospace')
        .bypassVsyncCondition(this.condition)
        .onControllerAttached(() => {
          try {
            let arrayVersions: Array<webview.UserAgentBrandVersion> = new Array<webview.UserAgentBrandVersion>;
            let brandVersion:webview.UserAgentBrandVersion = new webview.UserAgentBrandVersion();
            brandVersion.setBrand("brand OpenHarmony");
            brandVersion.setMajorVersion("major version 1.0");
            brandVersion.setFullVersion("blank full version 1.0");
            arrayVersions.push(brandVersion);
            console.info("arrayVersions initialized:", arrayVersions);
            this.userAgent = this.controller.getUserAgent();
            let metadata = this.controller.getUserAgentMetadata(this.userAgent);
            let versionList = metadata.getBrandVersionList();
            for(let i = 0; i < versionList.length; i++) {
              console.info("Brand:" + versionList[i].getBrand());
              console.info("MajorVersion " + versionList[i].getMajorVersion());
              console.info("FullVersion " + versionList[i].getFullVersion());
            }
            console.info("User Agent retrieved:", this.userAgent);
            let metaData: webview.UserAgentMetadata = new webview.UserAgentMetadata();
            console.info("User Agent Metadata initialized:", metaData);
            metaData.setBrandVersionList(arrayVersions);
            console.info("Brand Version List set:", arrayVersions);
            metaData.setFormFactors([webview.UserAgentFormFactor.AUTOMOTIVE]);
            metaData.setArchitecture("arch OpenHarmony");
            metaData.setBitness("bitness 64");
            metaData.setFullVersion("full version OpenHarmony");
            metaData.setMobile(true);
            let architecture = metaData.getArchitecture()
            let bitness = metaData.getBitness()
            console.info('[WebView] architecture=' + architecture)
            console.info('[WebView] bitness=' + bitness)
            console.info("FullVersion:" + metaData.getFullVersion());
            console.info("Mobile:" + metaData.getMobile());
            console.info("Model:" + metaData.getModel());
            console.info("Platform:" + metaData.getPlatform());
            console.info("PlatformVersion:" + metaData.getPlatformVersion());
            console.info("Wow64:" + metaData.getWow64());
            let FormFactors = metaData.getFormFactors();
            for(let j = 0; j < FormFactors.length; j++) {
              console.info("FormFactor:" + FormFactors[j]);
            }
            metaData.setModel("model OpenHarmony");
            metaData.setPlatform("platform OpenHarmony");
            metaData.setPlatformVersion("platform version OpenHarmony");
            metaData.setWow64(false);
            this.controller.setCustomUserAgent('');
            console.info("Custom User Agent set:", this.userAgent);
            this.controller.setUserAgentMetadata(this.userAgent, metaData);
            console.info("User Agent Metadata set:", metaData);
            let enabled: boolean = webview.WebviewController.getUserAgentClientHintsEnabled();
            console.info("isUserAgentClientHintsEnabled:", enabled);
            webview.WebviewController.setUserAgentClientHintsEnabled(false);
          } catch (error) {
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
          }
        })
    }
  }
}
