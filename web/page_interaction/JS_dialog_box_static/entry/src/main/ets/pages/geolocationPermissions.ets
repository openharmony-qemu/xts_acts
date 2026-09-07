'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import webView from '@ohos.web.webview';
import { $rawfile, Entry, Component, Column, Row, Button, ClickEvent, Web, WebDarkMode } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import { JsProxyObject } from '../../src/test/Interfaces';
import { UIContext, Router } from '@ohos.arkui.UIContext';
export class StringFields {
  str: string = '';
}

interface objectCss {
  code: int;
  message: string;
}

@Entry
@Component
struct geolocationPermissions {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  @State javaScriptAccess: boolean = true;
  @State incognito: boolean = false;
  @State origin: string = 'resource://rawfile/'
  @State errorCode: int = 0;
  @State errorMsg: string = 'failed';
  no_error: string = 'no error happened'


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

  private jsObj: JsProxyObject = {
    test: (res: object) => {
      Utils.emitEvent(String(res), 102);
    },
    showString: (str: string) => {
      console.info('ets toString:' + String(str));
    },
    register: (res: object) => {
      Utils.emitEvent(String(res), 86);
      return 'web222'
    }
  } as JsProxyObject

  build() {
    Column(undefined) {
      Row(undefined) {
        Button('GeolocationPermissions click')
          .key('GeolocationPermissionsButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {

            case 'testGetStoredGeolocation001': {
              try {
                webView.GeolocationPermissions.allowGeolocation('file:///')
                webView.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                  if (error?.code) {
                    console.log('getStoredGeolocationAsync error: ' + JSON.stringify(error))
                    return;
                  }
                  if (origins) {
                    let origins_str: string = origins.join()
                    console.log('getStoredGeolocationAsync origins: ' + origins_str);
                    Utils.emitEvent(origins_str, 30060);
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }


            case 'testGetStoredGeolocation002': {
              try {
                webView.GeolocationPermissions.allowGeolocation('file:///')
                webView.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                  if (error?.code) {
                    console.log('getStoredGeolocationPromise error: ' + JSON.stringify(error))
                    return;
                  }
                  if (origins) {
                    let origins_str: string = origins.join()
                    console.log('getStoredGeolocationAsync origins: ' + origins_str);
                    Utils.emitEvent(origins_str, 30061);
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }


            case 'testGetStoredGeolocation003': {
              try {
                webView.GeolocationPermissions.deleteGeolocation(this.origin, this.incognito)
                webView.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                  if (error?.code) {
                    console.log('getStoredGeolocationAsync error: ' + JSON.stringify(error))
                    return;
                  }
                  if (origins) {
                    let origins_str: string = origins.join()
                    console.log('getStoredGeolocationAsync origins: ' + origins_str);
                    Utils.emitEvent(origins_str, 100011);
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testGetStoredGeolocation004': {
              try {
                webView.GeolocationPermissions.deleteGeolocation(this.origin, this.incognito)
                webView.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                  if (error?.code) {
                    console.log('getStoredGeolocationAsync error: ' + JSON.stringify(error))
                    return;
                  }
                  if (origins) {
                    let origins_str: string = origins.join()
                    console.log('getStoredGeolocationAsync origins: ' + origins_str);
                    Utils.emitEvent(origins_str, 100012);
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "testGetStoredGeolocation005": {
              try {
                webView.GeolocationPermissions.allowGeolocation("file:///")
                webView.GeolocationPermissions.getStoredGeolocation(false)
                  .then(origins => {
                    let origins_str: string = origins.join();
                    console.log('getStoredGeolocationPromise origins: ' + origins_str);
                    Utils.emitEvent(origins_str, 30062);
                  }).catch((error) => {
                  //console.log('getStoredGeolocationPromise error: ' + JSON.stringify(error));
                  console.error(`getStoredGeolocationPromise error: ErrorCode: ${error.code},  Message: ${error.message}`);

                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'testGetStoredGeolocation006': {
              try {
                webView.GeolocationPermissions.deleteGeolocation(this.origin, this.incognito)
                webView.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                  if (error?.code) {
                    console.log('getStoredGeolocationAsync error: ' + JSON.stringify(error))
                    return;
                  }
                  if (origins) {
                    let origins_str: string = origins.join()
                    console.log('getStoredGeolocationAsync origins: ' + origins_str);
                    Utils.emitEvent(origins_str, 100013);
                  }
                },false);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testGetStoredGeolocation007': {
              try {
                webView.GeolocationPermissions.getStoredGeolocation(null as boolean)
                  .then(origins => {
                    let origins_str: string = origins.join();
                    console.log('getStoredGeolocationPromise null origins: ' + origins_str);
                    Utils.emitEvent(origins_str, 100014);
                  }).catch((error: Error) => {
                    console.error(`getStoredGeolocationPromise null error: ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(error.code, 100014);
                  });
              } catch (error) {
                console.error(`getStoredGeolocationPromise null catch: ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(401, 100014);
              }
              break;
            }

            case 'testGetStoredGeolocation008': {
              try {
                webView.GeolocationPermissions.allowGeolocation('file:///')
                webView.GeolocationPermissions.getStoredGeolocation(undefined)
                  .then(origins => {
                    let origins_str: string = origins.join();
                    console.log('getStoredGeolocationPromise undefined origins: ' + origins_str);
                    Utils.emitEvent(origins_str, 100015);
                  }).catch((error: Error) => {
                    console.error(`getStoredGeolocationPromise undefined error: ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(error.code, 100015);
                  });
              } catch (error) {
                console.error(`getStoredGeolocationPromise undefined catch: ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 100015);
              }
              break;
            }

            case 'testGetStoredGeolocation009': {
              try {
                webView.GeolocationPermissions.deleteAllGeolocation(false);
                webView.GeolocationPermissions.getStoredGeolocation(false)
                  .then(origins => {
                    let origins_str: string = origins.join();
                    console.log('getStoredGeolocationPromise empty origins: ' + origins_str);
                    Utils.emitEvent(origins_str, 100016);
                  }).catch((error: Error) => {
                    console.error(`getStoredGeolocationPromise empty error: ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(error.code, 100016);
                  });
              } catch (error) {
                console.error(`getStoredGeolocationPromise empty catch: ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 100016);
              }
              break;
            }

            case 'testGetStoredGeolocation010': {
              try {
                webView.GeolocationPermissions.allowGeolocation('file:///')
                webView.GeolocationPermissions.getStoredGeolocation(false)
                  .then(origins => {
                    let origins_str: string = origins.join();
                    console.log('getStoredGeolocationPromise non-empty origins: ' + origins_str);
                    Utils.emitEvent(origins_str, 100017);
                  }).catch((error: Error) => {
                    console.error(`getStoredGeolocationPromise non-empty error: ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(error.code, 100017);
                  });
              } catch (error) {
                console.error(`getStoredGeolocationPromise non-empty catch: ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 100017);
              }
              break;
            }

            case 'testGetStoredGeolocationCbStatic011': {
              try {
                webView.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                  if (error && error.code) {
                    console.error('getStoredGeolocationCb null error: ' + JSON.stringify(error));
                    Utils.emitEvent(error.code, 100018);
                  } else {
                    let origins_str = origins?.join() ?? '';
                    Utils.emitEvent(origins_str, 100018);
                  }
                }, null as boolean);
              } catch (error) {
                console.error(`getStoredGeolocationCb null catch: ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(401, 100018);
              }
              break;
            }

            case 'testGetStoredGeolocationCbStatic012': {
              try {
                webView.GeolocationPermissions.allowGeolocation('file:///')
                webView.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                  if (error && error.code) {
                    console.error('getStoredGeolocationCb undefined error: ' + JSON.stringify(error));
                    Utils.emitEvent(error.code, 100019);
                  } else {
                    let origins_str = origins?.join() ?? '';
                    Utils.emitEvent(origins_str, 100019);
                  }
                }, undefined);
              } catch (error) {
                console.error(`getStoredGeolocationCb undefined catch: ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 100019);
              }
              break;
            }

            case 'testGetStoredGeolocationCbStatic013': {
              try {
                webView.GeolocationPermissions.deleteAllGeolocation(false);
                webView.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                  if (error && error.code) {
                    console.error('getStoredGeolocationCb empty error: ' + JSON.stringify(error));
                    Utils.emitEvent(error.code, 100020);
                  } else {
                    let origins_str = origins?.join() ?? '';
                    Utils.emitEvent(origins_str, 100020);
                  }
                }, false);
              } catch (error) {
                console.error(`getStoredGeolocationCb empty catch: ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 100020);
              }
              break;
            }

            case 'testGetStoredGeolocationCbStatic014': {
              try {
                webView.GeolocationPermissions.allowGeolocation('file:///')
                webView.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                  if (error && error.code) {
                    console.error('getStoredGeolocationCb non-empty error: ' + JSON.stringify(error));
                    Utils.emitEvent(error.code, 100021);
                  } else {
                    let origins_str = origins?.join() ?? '';
                    Utils.emitEvent(origins_str, 100021);
                  }
                }, false);
              } catch (error) {
                console.error(`getStoredGeolocationCb non-empty catch: ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 100021);
              }
              break;
            }

            case 'testDeleteAllGeolocation001': {
              let text: undefined | String = '123'
              webView.GeolocationPermissions.allowGeolocation('resource://rawfile/')
              webView.GeolocationPermissions.deleteAllGeolocation(this.incognito);
              webView.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                if (error?.code) {
                  console.log('error:' + JSON.stringify(error));
                  text = origins + ',error ,' + JSON.stringify(error);
                  return;
                }
                text = origins?.join();
                Utils.emitEvent(text as String, 30055 as Int)
              })
              break;
            }

            case 'testDeleteAllGeolocation002': {
              try {
                webView.GeolocationPermissions.deleteAllGeolocation(null as boolean);
                Utils.emitEvent('success', 100022);
              } catch (error) {
                console.error(`deleteAllGeolocation null catch: ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent('fail', 100022);
              }
              break;
            }

            case 'testDeleteAllGeolocation003': {
              try {
                webView.GeolocationPermissions.deleteAllGeolocation(undefined);
                Utils.emitEvent('success', 100023);
              } catch (error) {
                console.error(`deleteAllGeolocation undefined catch: ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 100023);
              }
              break;
            }

            case 'testGetAccessibleGeolocation001': {
              try {
                webView.GeolocationPermissions.allowGeolocation(this.origin)
                webView.GeolocationPermissions.getAccessibleGeolocation(this.origin)
                  .then((result: Boolean) => {
                    console.log('getAccessibleGeolocation result: ' + result);
                    Utils.emitEvent(result, 100008);
                  }).catch((error: Error) => {
                  console.log('getAccessibleGeolocation error: ' + JSON.stringify(error));
                  Utils.emitEvent(error, 100008);
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100008);
              }
              break;
            }

            case 'testGetAccessibleGeolocation002': {
              try {
                webView.GeolocationPermissions.allowGeolocation(this.origin)
                webView.GeolocationPermissions.getAccessibleGeolocation(this.origin)
                  .then((result: Boolean) => {
                    console.log('getAccessibleGeolocationPromise result: ' + result);
                    Utils.emitEvent(result, 100009);
                  }).catch((error: Error) => {
                  console.log('getAccessibleGeolocationPromise error: ' + JSON.stringify(error));
                  Utils.emitEvent(error, 100009);
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code, 100009);
              }
              break;
            }

            case "testGetAccessibleGeolocation003": {
              try {

                this.errorMsg = 'failed';
                webView.GeolocationPermissions.getAccessibleGeolocation("", (error, result) => {
                  if (error && error.code) {
                    console.log('getAccessibleGeolocationAsync error: ' + JSON.stringify(error));
                    this.errorCode = error.code;
                    this.errorMsg = error.message;
                    console.error("emitGetAccessibleGeolocationCallbackValueNullErr getAccessibleGeolocation return result is :" + this.errorCode + this.errorMsg);
                    Utils.emitEvent(this.errorCode, 110580)
                    return;
                  }
                  console.log('getAccessibleGeolocationAsync result: ' + result);
                });
              } catch (error) {
                console.error(`emitGetAccessibleGeolocationCallbackValueNullErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "testGetAccessibleGeolocation004": {
              try {

                this.errorMsg = 'failed';
                webView.GeolocationPermissions.getAccessibleGeolocation("")
                  .then(result => {
                    console.log('getAccessibleGeolocationPromise result: ' + result);
                    Utils.emitEvent(result, 110630)
                  })
                  .catch((error) => {
                    console.error(`testGetAccessibleGeolocation004 ErrorCode: ${error.code},  Message: ${error.message}`);
                    this.errorCode = error.code;
                    this.errorMsg = error.message;
                    console.error("emitGetAccessibleGeolocationPromiseValueNullErr getAccessibleGeolocation return result is :" + this.errorCode + this.errorMsg);
                  });
              } catch (error) {
                console.error(`emitGetAccessibleGeolocationPromiseValueNullErr ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }


            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/bindSelectionMenu' })
              console.log('push URL success')
            }
          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .darkMode(WebDarkMode.ON)

    }
  }
}
