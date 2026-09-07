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
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../../../hypium/index';
import testsuite from '../../../../src/test/List.test';
import Utils from '../../common/Utils';
import web_webview from '@ohos.web.webview';
import {
  $rawfile,
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  FullScreenExitHandler,
  Row,
  Text,
  Web,
  WebAttribute,
  WebResourceResponse,
  WebviewController
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { RecordData } from '@ohos.base';

let loadedUrl = '';

@Entry
@Component
struct Index {
  // controllerE: WebMessageEvent = new WebMessageEvent();
  newcontroller: web_webview.WebviewController = new web_webview.WebviewController();
  controller: WebviewController = new WebviewController()
  @State str: string = "emitStoreWebArchive"
  @State text: string = ""
  @State textRatio: int = 100
  @State zoomAccessValue: boolean = true
  handler: FullScreenExitHandler | null = null
  ports: Array<web_webview.WebMessagePort> = new Array<web_webview.WebMessagePort>()
  host: string = "www.spincast.org"
  realm: string = "protected example"
  username_password: Array<string> = new Array<string>()
  origin: string = "file:///"

  onPageShow(): void {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  aboutToAppear(): void {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  // private jsObj = {
  //   test: (res) => {
  //     // Utils.emitEvent(res, 102);
  //   },
  //   toString: (str) => {
  //     console.info("ets toString:" + String(str));
  //   },
  //   register: (res) => {
  //     // Utils.emitEvent(res, 86);
  //     return "web222"
  //   }
  // }

  build() {
    Column() {
      Web({ src: "", controller: this.controller })
        .databaseAccess(true)
        .zoomAccess(this.zoomAccessValue)
        .textZoomRatio(this.textRatio)
        .onConsole((event): boolean => {
          let level = event.message.getMessageLevel()
          let msg = event.message.getMessage()
          let lineNumber = event.message.getLineNumber().toString()
          let sourceId = event.message.getSourceId()
          console.log("lineNumber:" + lineNumber)
          setTimeout(() => {
            // Utils.emitEvent(lineNumber, 420)
          }, 3000)
          setTimeout(() => {
            // Utils.emitEvent(sourceId, 422)
          }, 3000)
          return false
        })
        .onSearchResultReceive(ret => {
          let searchResult = ret.activeMatchOrdinal.toString() +
          ret.numberOfMatches.toString()
          console.log("searchResult" + searchResult)
          setTimeout(() => {
            // Utils.emitEvent(searchResult, 426)
          }, 3000)
        })
        .onFullScreenExit(() => {
          console.log("onFullScreenExit...");
          this.handler = new FullScreenExitHandler();
          this.handler!.exitFullScreen();
        })
        .onFullScreenEnter((event) => {
          this.handler = event.handler;
        })
      Row() {
        Button("web click").key('webg_webcomponent').onClick((event: ClickEvent) => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitStoreWebArchive": {
              let webAsyncController = this.controller
              webAsyncController.storeWebArchive("/data/storage/el2/base/", true, (filename) => {
                if (filename != null) {
                  // Utils.emitEvent(filename, 400)
                }
              })
              break;
            }
            case "emitAllowGeolocation": {
              web_webview.GeolocationPermissions.allowGeolocation("file:///")
              web_webview.GeolocationPermissions.getAccessibleGeolocation(this.origin, (error, result) => {
                if (error && error.code) {
                  console.log('error:' + JSON.stringify(error));
                  this.text = this.origin + ",error ," + JSON.stringify(error);
                }
                this.text = this.origin + ", result: " + result;
                // Utils.emitEvent(this.text, 402)
              })
              break;
            }
            case "emitDeleteGeolocation": {
              web_webview.GeolocationPermissions.deleteGeolocation("file:///")
              web_webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                if (error && error.code) {
                  console.log('error:' + JSON.stringify(error));
                  this.text = origins + ",error ," + JSON.stringify(error);
                }
                this.text = origins?.join() ?? '';
                // // Utils.emitEvent(this.text, 404)
              })
              break;
            }
            case "emitDeleteAllGeolocation": {
              web_webview.GeolocationPermissions.allowGeolocation("file:///")
              web_webview.GeolocationPermissions.deleteAllGeolocation()
              web_webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                if (error && error.code) {
                  console.log('error:' + JSON.stringify(error));
                  this.text = origins + ",error ," + JSON.stringify(error);
                }
                this.text = origins?.join() ?? '';
                // Utils.emitEvent(this.text, 406)
              })
              break;
            }
            case "emitIsCookieAllowed": {
              web_webview.WebCookieManager.putAcceptCookieEnabled(false);
              setTimeout(() => {
                // Utils.emitEvent(web_webview.WebCookieManager.isCookieAllowed(), 408)
              }, 3000)
              break;
            }
            case "emitSaveCookieAsync": {
              web_webview.WebCookieManager.saveCookieAsync((result) => {
                // Utils.emitEvent(result, 410)
              })
              break;
            }
            case "emitIsThirdPartyCookieAllowed": {
              web_webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(false);
              setTimeout(() => {
                let result = web_webview.WebCookieManager.isThirdPartyCookieAllowed();
                console.log(result.toString());
                // Utils.emitEvent(web_webview.WebCookieManager.isThirdPartyCookieAllowed(), 412)
              }, 3000)
              break;
            }
            case "emitExistCookie": {
              web_webview.WebCookieManager.clearAllCookiesSync();
              setTimeout(() => {
                let result = web_webview.WebCookieManager.existCookie();
                console.log(result.toString());
                // Utils.emitEvent(result, 414)
              }, 3000)
              break;
            }
            case "emitOnConsole": {
              this.controller.runJavaScript("consoleTest()")
              break;
            }
            case "emitLoaData": {
              this.controller.loadUrl("file:///data/storage/el1/bundle/phone/resources/rawfile/index.html")
              setTimeout(() => {
                this.controller.loadData(
                  "<html><title>index</title></html>",
                  "text/html",
                  "UTF-8"
                )
              }, 3000)
              setTimeout(() => {
                this.text = this.controller.getTitle();
                // Utils.emitEvent(this.text, 424)
              }, 4000)
              break;
            }
            case "emitZoomAccess": {
              this.zoomAccessValue = false
              this.controller.refresh()
              let origin = this.controller.getPageHeight()
              let zoomInCalled = false
              setTimeout(() => {
                this.newcontroller.zoomIn();
                if (this.controller.getPageHeight() > origin) {
                  zoomInCalled = true
                }
                console.log("final" + this.controller.getPageHeight())
                // Utils.emitEvent(zoomInCalled, 428);
              }, 3000);
              break;
            }
            case "emitSaveHttpAuthCredentials": {
              web_webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, "Stromgol", "Laroche");
              setTimeout(() => {
                let result = web_webview.WebDataBase.existHttpAuthCredentials();
                // Utils.emitEvent(result, 442)
              }, 3000)
              break;
            }
            case "emitGetHttpAuthCredentials": {
              this.username_password = web_webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
              setTimeout(() => {
                let result = this.username_password[0];
                // Utils.emitEvent(result, 444)
              }, 3000)
              break;
            }
            case "emitDeleteHttpAuthCredentials": {
              web_webview.WebDataBase.deleteHttpAuthCredentials();
              setTimeout(() => {
                let result = web_webview.WebDataBase.existHttpAuthCredentials();
                // Utils.emitEvent(result, 446)
              }, 3000)
              break;
            }


            case "emitdeleteAllData": {
              setTimeout(() => {
                try {
                  web_webview.WebStorage.deleteAllData()
                  let result = 'succesful'
                  // Utils.emitEvent(result, 446)
                } catch (error) {
                  console.info(`ErrorCode: ${error.code}, Message: ${error.message}`)
                  let result = 'fail'
                  // Utils.emitEvent(result, 446)
                }
              }, 3000)
              break;
            }
            case "emitdeleteOringin": {
              setTimeout(() => {
                try {
                  web_webview.WebStorage.deleteOrigin(this.origin);
                  let result = 'succesful'
                  // Utils.emitEvent(result, 446)
                } catch (error) {
                  console.info(`ErrorCode: ${error.code}, Message: ${error.message}`)
                  let result = 'fail'
                  // Utils.emitEvent(result, 446)
                }
              }, 3000)
              break;
            }
            case "emitgetOringin": {
              setTimeout(() => {
                try {
                  web_webview.WebStorage.getOrigins((error, origins) => {
                    if (error && error.code) {
                      console.log('error: ' + error);
                      //Utils.emitEvent(result, 446)
                    }
                    for (let i = 0; i < (origins?.length ?? 0); i++) {
                      console.log('origin: ' + origins![i].origin);
                      console.log('usage: ' + origins![i].usage);
                      console.log('quota: ' + origins![i].quota);
                    }
                  })
                } catch (error) {
                  console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                }
                // Utils.emitEvent('succesful', 446)

              }, 3000)
              break;

            }
            case "emitgetOringinQuota": {
              try {
                web_webview.WebStorage.getOriginQuota(this.origin);
                setTimeout(() => {
                  console.info('sucessful')
                  // Utils.emitEvent('sucessful', 446)
                }, 3000)
              } catch (error) {
                console.info(`ErrorCode: ${error.code}, Message: ${error.message}`);
                // Utils.emitEvent('fail', 446)
              }
              break;
            }
            case "emitgetOringinUsage": {
              setTimeout(() => {
                try {
                  web_webview.WebStorage.getOriginUsage(this.origin, (error, usage) => {
                    if (error && error.code) {
                      console.log('error: ' + error);
                      // Utils.emitEvent(error, 446)
                    }
                    console.log('usage: ' + usage);
                    // Utils.emitEvent(usage, 446)
                  })
                  // Utils.emitEvent('sucessful', 446)
                } catch (error) {
                  console.info(`ErrorCode: ${error.code}, Message: ${error.message}`);
                }
              }, 3000)
              break;
            }
            case "emitAsyncControllerconstructor": {
              setTimeout(() => {
                let webAsyncController = this.controller
                // webAsyncController.constructor()
                // Utils.emitEvent('sucessful', 446)
              }, 3000)
              break;
            }
            case "emitdeleteSessionCookie": {
              setTimeout(() => {
                web_webview.WebCookieManager.clearSessionCookieSync()
                // Utils.emitEvent('succesful', 410)
              }, 3000)
              break;
            }
            case "emitSearchAllAsync": {
              this.controller.loadUrl("file:///data/storage/el1/bundle/phone/resources/rawfile/index.html")
              setTimeout(() => {
                this.newcontroller.searchAllAsync("首页");
              }, 3000)
              break;
            }
            case "emitclose": {
              setTimeout(() => {
                let index: Int = 1
                this.ports[index].close()
                // Utils.emitEvent('sucessful', 446)
              }, 3000)
              break;
            }
            case "emitpostMessageEvent": {
              setTimeout(() => {
                try {
                  // let msg = new WebMessageEvent();
                  // msg.setData("post message from ets to html5");
                  // this.ports[0].postMessageEvent(msg)
                  // Utils.emitEvent('sucessful', 446)

                } catch (error) {
                  console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                }
              }, 3000)
              break;
            }
            case "emitonMessageEvent": {
              setTimeout(() => {
                try {
                  this.ports = this.controller.createWebMessagePorts();
                  this.ports[1].onMessageEvent((msg) => {
                    console.info("received message from html5, on message:" + msg);
                  })
                } catch (error) {
                  console.info(`ErrorCode: ${error.code}, Message: ${error.message}`);
                }
                // Utils.emitEvent('sucessful', 446)
              }, 3000)
              break;
            }
            case "emitgetHitTestValue": {
              setTimeout(() => {
                try {
                  let hitValue = this.newcontroller.getLastHitTest();
                  console.info("hitType: " + hitValue.type);
                  console.info("extra: " + hitValue.extra);
                  // Utils.emitEvent('sucessful', 446)
                } catch (error) {
                  console.info(`ErrorCode: ${error.code}, Message: ${error.message}`);
                }
              }, 3000)

              break;
            }
            case "emitgetUserAgent": {
              setTimeout(() => {
                try {
                  let userAgent = this.newcontroller.getUserAgent();
                  console.log("userAgent: " + userAgent);
                  // Utils.emitEvent('sucessful', 446)
                } catch (error) {
                  console.info(`ErrorCode: ${error.code}, Message: ${error.message}`);
                }
              }, 3000)

              break;
            }
            case "emitcreateWebMessagePorts": {
              setTimeout(() => {
                try {
                  this.ports = this.controller.createWebMessagePorts();
                  // Utils.emitEvent('succesful', 446)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                }
              }, 3000)
              break;
            }
            case "emitclearMatches": {
              setTimeout(() => {
                try {
                  this.newcontroller.clearMatches();
                  // Utils.emitEvent('succesful', 446)
                } catch (error) {
                  console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                }
              }, 3000)
              break;
            }
            case "emitsearchNext": {
              setTimeout(() => {
                try {
                  this.newcontroller.searchNext(true);
                  // Utils.emitEvent('succesful', 446)
                } catch (error) {
                  console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                }
              }, 3000)

              break;
            }
            case "emitclearSslCache": {
              setTimeout(() => {
                try {
                  this.newcontroller.clearSslCache();
                  // Utils.emitEvent('succesful', 446)

                } catch (error) {
                  console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                }
              }, 3000)

              break;
            }
            case "emitclearClientAuthenticationCache": {
              setTimeout(() => {
                try {
                  this.newcontroller.clearClientAuthenticationCache();
                  // Utils.emitEvent('succesful', 446)
                } catch (error) {
                  console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                }
              }, 3000)

              break;
            }
            case "emitgetUrl": {
              try {
                setTimeout(() => {
                  this.newcontroller.getUrl();
                  // Utils.emitEvent('succesful', 446)
                }, 3000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }

              break;
            }
            case "emitonFullScreenExitconstructor": {
              setTimeout(() => {
                this.handler = new FullScreenExitHandler()
                // Utils.emitEvent('sucessful', 446)
              })
              break;
            }
            //      case "emitexitfullscreen":{
            //          setTimeout(()=>{
            //              this.handler.exitfullscreen()
            //              console.info('succesful')
            //              // Utils.emitEvent('succesful',69)
            //          },3000)
            //          break;
            //      }
            //  ts  not exist

            //      case "emitpostMessageEvent1":{
            //          setTimeout(() => {
            //              try {
            //                  this.controllerE.postMessageEvent();
            //                  // Utils.emitEvent('succesful',446)
            //                } catch (error) {
            //                  console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
            //            }
            //                  })
            //      }
            // ts   not exist

            //      case "emitpostMessage":{
            //          setTimeout(() => {
            //              try {
            //                  this.controllerE.postMessage();
            //                  // Utils.emitEvent('succesful',446)
            //                } catch (error) {
            //                  console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
            //            }
            //                  })
            //      }
            // ts   not exist

            case "emitWebMessageEventconstructor": {
              setTimeout(() => {
                // this.controllerE.constructor()
                // Utils.emitEvent('sucessful', 446)
              }, 3000)
              break;
            }
            case "emitgetData": {
              setTimeout(() => {
                // this.controllerE.getData()
                console.info('succesful')
                // Utils.emitEvent('succesful', 69)
              }, 3000)
              break;
            }
            case "emitsetData": {
              setTimeout(() => {
                // this.controllerE.setData('1')
                console.info('succesful')
                // Utils.emitEvent('succesful', 69)
              }, 3000)
              break;
            }
            case "emitgetPorts": {
              setTimeout(() => {
                // this.controllerE.getPorts()
                console.info('succesful')
                // Utils.emitEvent('succesful', 69)
              }, 3000)
              break;
            }
            case "emitsetPorts": {
              setTimeout(() => {
                this.ports = this.controller.createWebMessagePorts()
                // this.controllerE.setPorts(this.ports)
                console.info('succesful')
                // Utils.emitEvent('succesful', 69)
              }, 3000)
              break;
            }
            case "emitGetStoredGeolocationNull": {
              try {
                web_webview.GeolocationPermissions.getStoredGeolocation(null as boolean)
                  .then((origins: Array<string>) => {
                    let originsStr: string = origins.join();
                    console.log('getStoredGeolocation null origins: ' + originsStr);
                    Utils.emitEvent(originsStr, 600);
                  }).catch((error: Error) => {
                    console.error(`getStoredGeolocation null error: ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(error.code, 600);
                  });
              } catch (error) {
                console.error(`getStoredGeolocation null catch: ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 600);
              }
              break;
            }

            case "emitGetStoredGeolocationUndefined": {
              try {
                web_webview.GeolocationPermissions.allowGeolocation("file:///")
                web_webview.GeolocationPermissions.getStoredGeolocation(undefined)
                  .then((origins: Array<string>) => {
                    let originsStr: string = origins.join();
                    console.log('getStoredGeolocation undefined origins: ' + originsStr);
                    Utils.emitEvent(originsStr, 601);
                  }).catch((error: Error) => {
                    console.error(`getStoredGeolocation undefined error: ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(error.code, 601);
                  });
              } catch (error) {
                console.error(`getStoredGeolocation undefined catch: ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 601);
              }
              break;
            }

            case "emitGetStoredGeolocationEmpty": {
              try {
                web_webview.GeolocationPermissions.deleteAllGeolocation(false);
                web_webview.GeolocationPermissions.getStoredGeolocation(false)
                  .then((origins: Array<string>) => {
                    let originsStr: string = origins.join();
                    console.log('getStoredGeolocation empty origins: ' + originsStr);
                    Utils.emitEvent(originsStr, 602);
                  }).catch((error: Error) => {
                    console.error(`getStoredGeolocation empty error: ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(error.code, 602);
                  });
              } catch (error) {
                console.error(`getStoredGeolocation empty catch: ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 602);
              }
              break;
            }

            case "emitGetStoredGeolocationNonEmpty": {
              try {
                web_webview.GeolocationPermissions.allowGeolocation("file:///")
                web_webview.GeolocationPermissions.getStoredGeolocation(false)
                  .then((origins: Array<string>) => {
                    let originsStr: string = origins.join();
                    console.log('getStoredGeolocation non-empty origins: ' + originsStr);
                    Utils.emitEvent(originsStr, 603);
                  }).catch((error: Error) => {
                    console.error(`getStoredGeolocation non-empty error: ErrorCode: ${error.code}, Message: ${error.message}`);
                    Utils.emitEvent(error.code, 603);
                  });
              } catch (error) {
                console.error(`getStoredGeolocation non-empty catch: ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(error.code, 603);
              }
              break;
            }

            case "emitGetStoredGeolocationCbGNull": {
              try {
                web_webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                  if (error && error.code) {
                    console.error('getStoredGeolocationCbG null error: ' + JSON.stringify(error));
                    Utils.emitEvent(error.code, 604);
                  } else {
                    let originsStr = origins?.join() ?? '';
                    Utils.emitEvent(originsStr, 604);
                  }
                }, null as boolean);
              } catch (error) {
                Utils.emitEvent(error.code, 604);
              }
              break;
            }

            case "emitGetStoredGeolocationCbGUndefined": {
              try {
                web_webview.GeolocationPermissions.allowGeolocation("file:///")
                web_webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                  if (error && error.code) {
                    console.error('getStoredGeolocationCbG undefined error: ' + JSON.stringify(error));
                    Utils.emitEvent(error.code, 605);
                  } else {
                    let originsStr = origins?.join() ?? '';
                    Utils.emitEvent(originsStr, 605);
                  }
                }, undefined as boolean);
              } catch (error) {
                Utils.emitEvent(error.code, 605);
              }
              break;
            }

            case "emitGetStoredGeolocationCbGEmpty": {
              try {
                web_webview.GeolocationPermissions.deleteAllGeolocation(false);
                web_webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                  if (error && error.code) {
                    console.error('getStoredGeolocationCbG empty error: ' + JSON.stringify(error));
                    Utils.emitEvent(error.code, 606);
                  } else {
                    let originsStr = origins?.join() ?? '';
                    Utils.emitEvent(originsStr, 606);
                  }
                }, false);
              } catch (error) {
                Utils.emitEvent(error.code, 606);
              }
              break;
            }

            case "emitGetStoredGeolocationCbGNonEmpty": {
              try {
                web_webview.GeolocationPermissions.allowGeolocation("file:///")
                web_webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                  if (error && error.code) {
                    console.error('getStoredGeolocationCbG non-empty error: ' + JSON.stringify(error));
                    Utils.emitEvent(error.code, 607);
                  } else {
                    let originsStr = origins?.join() ?? '';
                    Utils.emitEvent(originsStr, 607);
                  }
                }, false);
              } catch (error) {
                Utils.emitEvent(error.code, 607);
              }
              break;
            }

            case "emitPutAcceptCookieEnabledGNull": {
              try {
                web_webview.WebCookieManager.putAcceptCookieEnabled(null as boolean);
                Utils.emitEvent(true, 608);
              } catch (error) {
                Utils.emitEvent(error.code, 608);
              }
              break;
            }

            case "emitPutAcceptCookieEnabledGUndefined": {
              try {
                web_webview.WebCookieManager.putAcceptCookieEnabled(undefined as boolean);
                Utils.emitEvent(true, 609);
              } catch (error) {
                Utils.emitEvent(error.code, 609);
              }
              break;
            }

            case "emitPutAcceptThirdPartyCookieEnabledGNull": {
              try {
                web_webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(null as boolean);
                Utils.emitEvent(true, 610);
              } catch (error) {
                Utils.emitEvent(error.code, 610);
              }
              break;
            }

            case "emitPutAcceptThirdPartyCookieEnabledGUndefined": {
              try {
                web_webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(undefined as boolean);
                Utils.emitEvent(true, 611);
              } catch (error) {
                Utils.emitEvent(error.code, 611);
              }
              break;
            }

            case "emitExistCookieGNull": {
              try {
                let result = web_webview.WebCookieManager.existCookie(null as boolean);
                Utils.emitEvent(result, 612);
              } catch (error) {
                Utils.emitEvent(error.code, 612);
              }
              break;
            }

            case "emitExistCookieGUndefined": {
              try {
                web_webview.WebCookieManager.putAcceptCookieEnabled(true);
                let result = web_webview.WebCookieManager.existCookie(undefined as boolean);
                Utils.emitEvent(result, 613);
              } catch (error) {
                Utils.emitEvent(error.code, 613);
              }
              break;
            }

            case "emitExistCookieGEmpty": {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync(false);
                let result = web_webview.WebCookieManager.existCookie(false);
                Utils.emitEvent(result, 614);
              } catch (error) {
                Utils.emitEvent(error.code, 614);
              }
              break;
            }

            case "emitExistCookieGNonEmpty": {
              try {
                web_webview.WebCookieManager.putAcceptCookieEnabled(true);
                let result = web_webview.WebCookieManager.existCookie(false);
                Utils.emitEvent(result, 615);
              } catch (error) {
                Utils.emitEvent(error.code, 615);
              }
              break;
            }

            case "emitClearAllCookiesSyncGNull": {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync(null as boolean);
                Utils.emitEvent(true, 616);
              } catch (error) {
                Utils.emitEvent(error.code, 616);
              }
              break;
            }

            case "emitClearAllCookiesSyncGUndefined": {
              try {
                web_webview.WebCookieManager.clearAllCookiesSync(undefined as boolean);
                Utils.emitEvent(true, 617);
              } catch (error) {
                Utils.emitEvent(error.code, 617);
              }
              break;
            }

            case "emitDeleteAllGeolocationGNull": {
              try {
                web_webview.GeolocationPermissions.deleteAllGeolocation(null as boolean);
                Utils.emitEvent(true, 618);
              } catch (error) {
                console.error('deleteAllGeolocation null error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 618);
              }
              break;
            }

            case "emitDeleteAllGeolocationGUndefined": {
              try {
                web_webview.GeolocationPermissions.deleteAllGeolocation(undefined);
                Utils.emitEvent(true, 619);
              } catch (error) {
                console.error('deleteAllGeolocation undefined error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 619);
              }
              break;
            }

            case "emitDeleteAllDataGNull": {
              try {
                web_webview.WebStorage.deleteAllData(null as boolean);
                Utils.emitEvent(true, 620);
              } catch (error) {
                console.error('deleteAllData null error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 620);
              }
              break;
            }

            case "emitDeleteAllDataGUndefined": {
              try {
                web_webview.WebStorage.deleteAllData(undefined);
                Utils.emitEvent(true, 621);
              } catch (error) {
                console.error('deleteAllData undefined error: ' + JSON.stringify(error));
                Utils.emitEvent(false, 621);
              }
              break;
            }

            default:
              console.info("can not match case")
          }
        })
      }
    }
  }

  private valueChangeCallBack: (eventData: events_emitter.EventData) => void =
    (eventData: events_emitter.EventData) => {
      console.info("web page valueChangeCallBack");
      if (eventData != null && eventData.data != null) {
        console.info("valueChangeCallBack:" + JSON.stringify(eventData));
        const data = eventData.data as Record<String,RecordData>
        if (data['ACTION'] != null) {
          this.str = data['ACTION'] as string
        }
      }
    }
}
