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
import { Entry, Component, Column, Row, Button, ClickEvent, Web } from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement"
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../hypium';
import testsuite from '../../src/test/List.test';
import Utils from '../../src/test/Util.test';
import { BusinessError } from '@ohos.base';
import web_webview from '@ohos.web.webview';
import { Callback, RecordData } from '@ohos.base'
import events_emitter from '@ohos.events.emitter';

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct Index {
  stringObj: StringFields  = new StringFields ();
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = "emitFetchCookieSync";
  @State cookieResult: string = "";
  @State no_error: string = 'no error happened';

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

            case 'emitWebViewIncognitoMode05': {
              try {
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'testValue1232143', true);
                this.controller.loadUrl('https://www.example.com');
                web_webview.WebCookieManager.clearAllCookiesSync(true);
                let isExistCookie = web_webview.WebCookieManager.existCookie(true);
                if (!isExistCookie) {
                  Utils.emitEvent('success', 134210);
                } else {
                  Utils.emitEvent('fail', 134210);
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testExistCookie012": {
              try {
                web_webview.WebCookieManager.setLazyInitializeWebEngine(true);
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                web_webview.WebCookieManager.fetchAllCookies(false).then((cookies) => {
                  for (let i = 0; i < cookies.length; i++) {
                    console.info('fetchAllCookies cookie[' + i + '].name = ' + cookies[i].name);
                    console.info('fetchAllCookies cookie[' + i + '].value = ' + cookies[i].value);
                  }
                })
                web_webview.WebCookieManager.clearAllCookies((error) => {
                  if (error) {
                    console.log("error: " + error);
                  }
                  let isCookie = web_webview.WebCookieManager.existCookie()
                  Utils.emitEvent(isCookie, 100312)
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'testFetchCookieSyncIncognitoError001': {
              try {
                web_webview.WebCookieManager.setLazyInitializeWebEngine(false);
                web_webview.WebCookieManager.fetchCookieSync('', true);
                Utils.emitEvent(this.no_error, 123210);
              } catch (error) {
                const actualCode = String(error.code);
                const actualMsg = String(error.message);
                const actualResult = `${actualCode}${actualMsg}`;
                console.error(`actualResult: ${actualResult}`);
                if (error.code == 401){
                  Utils.emitEvent(actualResult, 123210);
                } else {
                  Utils.emitEvent(actualResult, 123210);
                }
                web_webview.WebCookieManager.clearAllCookies();
              }
              break;
            }

            case 'testFetchCookieSyncIncognitoError002': {
              try {
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                web_webview.WebCookieManager.clearAllCookiesSync(false);
                setTimeout(() => {
                  this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com',false);
                  console.log("emitConfigCookieSync cookie = " + this.cookieResult);
                }, 1000);
                Utils.emitEvent(this.cookieResult, 123211);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'testFetchCookieSyncIncognitoError003': {
              try {
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com',true);
                console.log("emitConfigCookieSync cookie = " + this.cookieResult);
                Utils.emitEvent(this.no_error, 123212);
                web_webview.WebCookieManager.clearAllCookies();
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'testFetchCookieSyncIncognitoError004': {
              try {
                web_webview.WebCookieManager.configCookieSync('', '', true);
                Utils.emitEvent(this.no_error, 123213);
              } catch (error) {
                const actualCode = String(error.code);
                const actualMsg = String(error.message);
                const actualResult = `${actualCode}${actualMsg}`;
                console.error(`actualResult: ${actualResult}`);
                if (error.code == 401){
                  Utils.emitEvent(actualResult, 123213);
                } else {
                  Utils.emitEvent(actualResult, 123213);
                }
                web_webview.WebCookieManager.clearAllCookies();
              }
              break;
            }

            case 'testFetchCookieSyncIncognitoError005': {
              try {
                web_webview.WebCookieManager.configCookieSync('null', 'null', true);
                Utils.emitEvent(this.no_error, 123214);
              } catch (error) {
                const actualCode = String(error.code);
                const actualMsg = String(error.message);
                const actualResult = `${actualCode}${actualMsg}`;
                console.error(`actualResult: ${actualResult}`);
                if (error.code == 401){
                  Utils.emitEvent(actualResult, 123214);
                } else {
                  Utils.emitEvent(actualResult, 123214);
                }
                web_webview.WebCookieManager.clearAllCookies();
              }
              break;
            }

            case 'testFetchCookieSyncIncognitoError006': {
              try {
                web_webview.WebCookieManager.configCookieSync('https://www.baidu.com', 'ccs=bbc', false, true);
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.baidu.com');
                console.log("emitConfigCookieSync cookie = " + this.cookieResult);
                web_webview.WebCookieManager.clearAllCookiesSync(true);
                Utils.emitEvent(this.cookieResult, 123215);
              } catch (error) {
                const actualCode = String(error.code);
                const actualMsg = String(error.message);
                const actualResult = `${actualCode}${actualMsg}`;
                console.error(`actualResult: ${actualResult}`);
                if (error.code == 401){
                  Utils.emitEvent(actualResult, 123215);
                } else {
                  Utils.emitEvent(actualResult, 123215);
                }
                web_webview.WebCookieManager.clearAllCookies();
              }
              break;
            }

            case 'testFetchCookieIncognitoError007': {
              try {
                web_webview.WebCookieManager.configCookie('', '');
                Utils.emitEvent(this.no_error, 123216);
              } catch (error) {
                const actualCode = String(error.code);
                const actualMsg = String(error.message);
                const actualResult = `${actualCode}${actualMsg}`;
                console.error(`actualResult: ${actualResult}`);
                if (error.code == 401){
                  Utils.emitEvent(actualResult, 123216);
                } else {
                  Utils.emitEvent(actualResult, 123216);
                }
                web_webview.WebCookieManager.clearAllCookies();
              }
              break;
            }

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

            case "emitFetchCookiePromise003": {
              try {
                setTimeout(() => {
                  web_webview.WebCookieManager.configCookie('', '', (error, cookie) => {
                    if (error) {
                      console.log("configCookie error: " + JSON.stringify(error));
                    }
                  });
                }, 2000);
                setTimeout(() => {
                  web_webview.WebCookieManager.fetchCookie('')
                    .then((cookie: string) => {
                      console.log("emitFetchCookiePromise cookie = " + cookie);
                      Utils.emitEvent(cookie, 133);
                    })
                    .catch((error) => {
                      console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                      Utils.emitEvent(String(error.code) + String(error.message), 133);
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
                    console.log('error: ' + error);
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
            case "emitClearAllCookiesCallback": {
              try {
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                web_webview.WebCookieManager.clearAllCookies((error) => {
                  if (error) {
                    console.log("error: " + error);
                  } else {
                    setTimeout(() => {
                      this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                      console.log("emitClearAllCookiesCallback cookie = " + this.cookieResult);
                      Utils.emitEvent(this.cookieResult, 140);
                      if (this.cookieResult === "") {
                        console.log("Cookies are successfully cleared.");
                      } else {
                        console.log("Cookie still exists: " + this.cookieResult);
                      }
                    }, 2000);
                  }
                });
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

            case "emitConfigCookieSync": {
              try {
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=e');
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitConfigCookieSync cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 112)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitConfigCookiePromise": {
              try {
                setTimeout(() => {
                web_webview.WebCookieManager.configCookie('https://www.example.com', 'a=g')
                  .then(() => {
                    console.log('configCookie success!');
                  })
                }, 2000)
                setTimeout(() => {
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitConfigCookiePromise cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 136)
                }, 3000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitClearAllCookiesSync": {
              try {
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                web_webview.WebCookieManager.clearAllCookiesSync();
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitClearAllCookiesSync cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 138)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitClearAllCookiesCallback": {
              try {
                setTimeout(() => {
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                web_webview.WebCookieManager.clearAllCookies((error) => {
                  if (error) {
                    console.log("error: " + error);
                  }
                })
                }, 2000);
                setTimeout(() => {
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitClearAllCookiesCallback cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 140)
                }, 2000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitClearAllCookiesPromise": {
              try {
                setTimeout(() => {
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                web_webview.WebCookieManager.clearAllCookies()
                  .then(() => {
                  console.log("clearAllCookies success!");
                })
                }, 2000)
                setTimeout(() => {
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitClearAllCookiesPromise cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 142)
                }, 4000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitClearSessionCookieSync": {
              try {
                web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                web_webview.WebCookieManager.clearSessionCookieSync();
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitClearSessionCookieSync cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 144)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitClearSessionCookieCallback": {
              try {
                setTimeout(() => {
                  web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  web_webview.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                  })
                },2000)
                setTimeout(() => {
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitClearSessionCookieCallback cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 146)
                },2000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitClearSessionCookiePromise": {
              try {
                setTimeout(() => {
                  web_webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  web_webview.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log("clearSessionCookie success!");
                    })
                },2000)
                setTimeout(() => {
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitClearSessionCookiePromise cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 148)
                },2000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: 'https://www.example.com', controller: this.controller })

    }
  }
}
