/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  Row,
  Web,
  Blank,
  OnConsoleEvent,
  WebResourceRequest
} from '@ohos.arkui.component';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { State } from '@ohos.arkui.stateManagement';
import webview from '@ohos.web.webview';
import { BusinessError, Callback } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import { Callback, RecordData } from '@ohos.base'
import events_emitter from '@ohos.events.emitter';
class StringFields {
  private str: string = '';
}

export enum ThreatType {
  UNKNOWN = -1,
  THREAT_ILLEGAL = 0,
  THREAT_FRAUD = 1,
  THREAT_RISK = 2,
  THREAT_WARNING = 3,
}

export class OnSafeBrowsingCheckResultCallback {
  threatType: ThreatType = ThreatType.UNKNOWN;
}

@Entry
@Component
struct WebCookieManagerExistCookie {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State console: string = ""
  @State str: string = ""

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
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebCookieManagerExistCookie click").key('WebCookieManagerExistCookieTestButton')
          .onClick((e: ClickEvent) => {
            console.info("key==>" + this.stringObj.str)
            switch (this.stringObj.str) {

              case "testExistCookie002": {
                try {
                  webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=c');
                  let isCookie = webview.WebCookieManager.existCookie()
                  Utils.emitEvent(isCookie, 100302)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "testExistCookie003": {
                try {
                  webview.WebCookieManager.configCookie('https://www.example.com', "a=d",
                    (error: BusinessError|null): void => {
                      if (error) {
                        console.log("error: " + JSON.stringify(error));
                      }
                      let isCookie = webview.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 100303)
                    })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie004": {
                try {
                  webview.WebCookieManager.configCookie('https://www.example.com', 'a=e')
                    .then(() => {
                      console.log('configCookie success!');
                      let isCookie = webview.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 100304)
                    })
                    .catch((error: BusinessError): void => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie005": {
                try {

                  webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webview.WebCookieManager.clearAllCookiesSync();
                  let isCookie = webview.WebCookieManager.existCookie()
                  Utils.emitEvent(isCookie, 100305)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie006": {
                try {

                  webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webview.WebCookieManager.clearAllCookies((error: BusinessError|null): void => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    let isCookie = webview.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 100306)
                  })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie007": {
                try {

                  webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webview.WebCookieManager.clearAllCookies()
                    .then(() => {
                      console.log("clearAllCookies success!");
                      let isCookie = webview.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 100307)
                    })
                    .catch((error: BusinessError): void => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie008": {
                try {

                  webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webview.WebCookieManager.clearSessionCookieSync();
                  let isCookie = webview.WebCookieManager.existCookie()
                  Utils.emitEvent(isCookie, 100308)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie009": {
                try {

                  webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webview.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    let isCookie = webview.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 100309)
                  })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie010": {
                try {
                  webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webview.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log("clearSessionCookie success!");
                      let isCookie = webview.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 100310)
                    })
                    .catch((error: BusinessError): void => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie011": {
                try {
                  webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webview.WebCookieManager.clearAllCookiesSync();
                  let isCookie = webview.WebCookieManager.existCookie()
                  Utils.emitEvent(isCookie, 100311)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie012": {
                try {
                  webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webview.WebCookieManager.clearAllCookies((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    let isCookie = webview.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 100312)
                  })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie013": {
                try {
                  webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webview.WebCookieManager.clearAllCookies()
                    .then(() => {
                      console.log("clearAllCookies success!");
                      let isCookie = webview.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 100313)
                    })
                    .catch((error: BusinessError): void => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie014": {
                try {
                  webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webview.WebCookieManager.clearSessionCookieSync();
                  let isCookie = webview.WebCookieManager.existCookie()
                  Utils.emitEvent(isCookie, 100314)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie015": {
                try {
                  webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webview.WebCookieManager.clearSessionCookie((error) => {
                    if (error) {
                      console.log("error: " + error);
                    }
                    let isCookie = webview.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 100315)
                  })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie016": {
                try {
                  webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webview.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log("clearSessionCookie success!");
                      let isCookie = webview.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 100316)
                    })
                    .catch((error: BusinessError): void => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie017": {
                try {
                  webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webview.WebCookieManager.clearAllCookiesSync();
                  let isCookie = webview.WebCookieManager.existCookie()
                  Utils.emitEvent(isCookie, 100317)
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie018": {
                try {
                  webview.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webview.WebCookieManager.clearAllCookiesSync();
                    let isCookie = webview.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 100318)
                  })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie019": {
                try {
                  webview.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webview.WebCookieManager.clearAllCookies((error) => {
                      if (error) {
                        console.log("error: " + error);
                      }
                      let isCookie = webview.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 100319)
                    })
                  })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie020": {
                try {
                  webview.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webview.WebCookieManager.clearAllCookies()
                      .then(() => {
                        console.log("clearAllCookies success!");
                        let isCookie = webview.WebCookieManager.existCookie()
                        Utils.emitEvent(isCookie, 100320)
                      })
                      .catch((error: BusinessError): void => {
                        console.error("error: " + error);
                      });
                  })

                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie021": {
                try {
                  webview.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webview.WebCookieManager.clearSessionCookieSync();
                    let isCookie = webview.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 100321)
                  })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie022": {
                try {
                  webview.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webview.WebCookieManager.clearSessionCookie((error) => {
                      if (error) {
                        console.log("error: " + error);
                      }
                      let isCookie = webview.WebCookieManager.existCookie()

                      Utils.emitEvent(isCookie, 100322)
                    })
                  })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie023": {
                try {
                  webview.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    webview.WebCookieManager.clearSessionCookie()
                      .then(() => {
                        console.log("clearSessionCookie success!");
                        let isCookie = webview.WebCookieManager.existCookie()

                        Utils.emitEvent(isCookie, 100323)
                      })
                      .catch((error: BusinessError): void => {
                        console.error("error: " + error);
                      });
                  })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie024": {
                try {
                  webview.WebCookieManager.configCookie('https://www.example.com', "a=b", (error) => {
                    if (error) {
                      console.log("error: " + JSON.stringify(error));
                    }
                    // webview.WebCookieManager.deleteEntireCookie()
                    webview.WebCookieManager.clearAllCookiesSync()
                    let isCookie = webview.WebCookieManager.existCookie()
                    Utils.emitEvent(isCookie, 100324)
                  })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie025": {
                try {
                  webview.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webview.WebCookieManager.clearAllCookiesSync();
                      let isCookie = webview.WebCookieManager.existCookie()

                      Utils.emitEvent(isCookie, 100325)
                    })
                    .catch((error: BusinessError): void => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie026": {
                try {
                  webview.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webview.WebCookieManager.clearAllCookies((error) => {
                        if (error) {
                          console.log("error: " + error);
                        }
                        let isCookie = webview.WebCookieManager.existCookie()
                        Utils.emitEvent(isCookie, 100326)
                      })
                    })
                    .catch((error: BusinessError): void => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie027": {
                try {
                  webview.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webview.WebCookieManager.clearAllCookies()
                        .then(() => {
                          console.log("clearAllCookies success!");
                          let isCookie = webview.WebCookieManager.existCookie()
                          Utils.emitEvent(isCookie, 100327)
                        })
                        .catch((error: BusinessError): void => {
                          console.error("error: " + error);
                        });
                    })
                    .catch((error: BusinessError): void => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie028": {
                try {
                  webview.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webview.WebCookieManager.clearSessionCookieSync();
                      let isCookie = webview.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 100328)
                    })
                    .catch((error: BusinessError): void => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie029": {
                try {
                  webview.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webview.WebCookieManager.clearSessionCookie((error) => {
                        if (error) {
                          console.log("error: " + error);
                        }
                        let isCookie = webview.WebCookieManager.existCookie()
                        Utils.emitEvent(isCookie, 100329)
                      })
                    })
                    .catch((error: BusinessError): void => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie030": {
                try {
                  webview.WebCookieManager.configCookieSync('https://www.example.com', 'a=b');
                  webview.WebCookieManager.clearSessionCookie()
                    .then(() => {
                      console.log("clearSessionCookie success!");
                      let isCookie = webview.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 100330)
                    })
                    .catch((error: BusinessError): void => {
                      console.error("error: " + error);
                    });
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case "testExistCookie031": {
                try {
                  webview.WebCookieManager.configCookie('https://www.example.com', 'a=b')
                    .then(() => {
                      console.log('configCookie success!');
                      webview.WebCookieManager.clearAllCookiesSync()
                      let isCookie = webview.WebCookieManager.existCookie()
                      Utils.emitEvent(isCookie, 100331)
                    })
                    .catch((error: BusinessError): void => {
                      console.log('error: ' + JSON.stringify(error));
                    })
                } catch (error) {
                  error = error as BusinessError;
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }

              case 'SwitchNextPageStatic' : {
                let uiContext: UIContext = this.getUIContext();
                let router: Router = uiContext.getRouter();
                router.pushUrl({ url: 'pages/webViewOnNavigationEntryCommitted' })
                console.log('push URL success')
              }
            }
          })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .onOverrideUrlLoading((webResourceRequest: WebResourceRequest) => {
          if (webResourceRequest && webResourceRequest.getRequestUrl() == "about:blank") {
            console.log('onOverrideUrlLoading ture');
            return true;
          }
          console.log('onOverrideUrlLoading false');
          return false;
        })
        .onResourceLoad((event) => {
          console.log('onResourceLoad: ' + event.url);
        })
        .onRefreshAccessedHistory((event) => {
          if (event) {
            console.log('url:' + event.url + ' isReload:' + event.isRefreshed);
          }
        })
        .onConsole((event: OnConsoleEvent): boolean => {
          if (event) {
            this.console = event.message.getMessage()
          }
          return false
        })


    }
  }
}
