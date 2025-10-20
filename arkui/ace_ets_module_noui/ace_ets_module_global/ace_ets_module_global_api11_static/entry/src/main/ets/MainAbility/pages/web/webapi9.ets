/**
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
import emitter from '@ohos.events.emitter';
import  AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../../../hypium';
import testsuite from '../../../../src/test/List.test';
import webview from '@ohos.web.webview';
import {
  Entry, Component, AlertDialogParamWithButtons,
  Column, ColumnOptions, List, ListItem, ListOptions, WebResourceResponse, MessageLevel,
  Flex, FlexDirection, ItemAlign, FlexAlign, FullScreenExitHandler, ConsoleMessage,
  Text, TextAlign, Button, FontWeight, ClickEvent, Margin, Color, Row, Web,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
const uiContext = new UIContext();


interface MyTestObject {
  test: (data1: string, data2: string, data3: string) => string;
  toStr: () => void;
}

@Entry
@Component
struct Index {
  
  @State isVoid: boolean = true;
  handler: FullScreenExitHandler|null = null;
  @State atio: Int = 150;
  @State defaultSize: number = 13;
  @State defaultFixed: Int = 8;
  @State minLogicalSize: number = 1;
  @State netWorkStatus: boolean = false;
  ports: Array<webview.WebMessagePort> = new Array<webview.WebMessagePort>();
  testObj:MyTestObject = {
    test: (data1: string, data2: string, data3: string):string => {
      console.log('data1:' + data1);
      console.log('data2:' + data2);
      console.log('data3:' + data3);
      return 'AceString';
    },
    toStr: () => {
      console.log('toString' + 'interface instead.');
    }
  } as MyTestObject
  
  message: ConsoleMessage = new ConsoleMessage();
  controller: webview.WebviewController = new webview.WebviewController();
  controllerTwo: webview.WebviewController = new webview.WebviewController();
  @State str: string = 'emitStoreWebArchive'

  onPageShow() {
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: (eventData: emitter.EventData) => void = (eventData: emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if ((eventData.data as ESObject).getProperty('ACTION') != null) {
        this.str = (eventData.data as ESObject).getProperty('ACTION').toString() as String;
      }
    }
  }


  aboutToAppear() {
    let abilityDelegator  = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments  = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      
      Web({ src: 'www.baidu.com', controller: this.controller })
        .multiWindowAccess(true).key('multiwindow')
        .onWindowExit(() => {
          console.log('onWindowExit...');
          setTimeout(()=>{
            
          },1000)
        }).
      onWindowNew((event) => {
        console.log('onWindowNew...');
        let popController: webview.WebviewController = new webview.WebviewController();
        event.handler.setWebController(popController);
        setTimeout(()=>{
          
        },1000)

      }).onFullScreenEnter((event) => {
        console.log('onFullScreenEnter...');
        this.handler = event.handler;
        setTimeout(()=>{
          
        },1000)
      }).onFullScreenExit(() => {
        console.info('onFullScreenExit...');
        this.handler!.exitFullScreen();
      })

      Web({ src: 'www.baidu.com', controller: this.controller })
        .key('web2')
        .webStandardFont('HarmonyOS-Sans-Condensed')
        
        
        .webFixedFont('HarmonyOS-Sans-Condensed')
        .webFantasyFont('HarmonyOS-Sans-Condensed')
        .webCursiveFont('HarmonyOS-Sans-Condensed')
        .defaultFixedFontSize(this.defaultFixed)
        
        
        .blockNetwork(false)
        
        .onSslErrorEventReceive((event) => {
          uiContext.showAlertDialog({
            title: 'onSslErrorEventReceive',
            message: 'text',
            primaryButton: {
              value: 'confirm',
              action: () => {
                event.handler.handleConfirm();
              }
            },
            secondaryButton: {
              value: 'cancel',
              action: () => {
                event.handler.handleCancel();
              }
            },
            cancel: () => {
              event.handler.handleCancel();
            }
          } as AlertDialogParamWithButtons)
          setTimeout(()=>{
            
          },1000)
          
        })
        .textZoomRatio(this.atio)
        
        .javaScriptProxy({
          jsObject: this.testObj,
          name: 'objName',
          methodList: ['test', 'toString'],
          controller: this.controller,
        }).onConsole((event) => {
        console.log('getMessage:' + event.message.getMessage());
        console.log('getSourceId:' + event.message.getSourceId());
        console.log('getLineNumber:' + event.message.getLineNumber());
        console.log('getMessageLevel:' + event.message.getMessageLevel());
        return false;
      })
        .onErrorReceive((event)=>{
          event.request.getRequestMethod();
        })
        
        
        
        .onFaviconReceived((event)=>{
          event.favicon;
        })
        .onPageVisible((event)=>{
          event.url
        })
        .onDataResubmitted((event)=>{
          event.handler.resend
        })
        .onInterceptKeyEvent((e)=>{
          e.keyCode;
          return false;
        })

      Button('web click').key('webcomponentapi9').onClick((e:ClickEvent):void=>{
        console.info('key==>'+this.str)
        switch(this.str){
          
          case 'emitGeturl':
            let url = this.controllerTwo.getUrl();
            
            break;
          case 'emitclearClientAuthenticationCache':
            this.controllerTwo.clearClientAuthenticationCache();
            
            break;
          case 'emitclearSslCache':
            this.controllerTwo.clearSslCache();
            
            break;
          case 'emitsearchNext':
            this.controllerTwo.searchNext(true);
            
            break;
          case 'emitclearMatches':
            this.controllerTwo.clearMatches();
            
            break;
          case 'emitDefaultUserAgent':
            let usrAgent = webview.WebviewController.getDefaultUserAgent();
            
            break;
          case 'emitgetWebId':
            let webId = this.controllerTwo.getWebId();
            
            break;
          case 'emitpostMessage':
            let sendPortArray:Array<webview.WebMessagePort> = [this.ports[1]!] as Array<webview.WebMessagePort>;
            
            
            
            
            break;
          case 'emitcreateWebMessagePorts':
            this.ports = this.controller.createWebMessagePorts();
            console.info('createWebMessagePorts size:' + this.ports!.length)
            
            break;
          case 'emitdeleteSessionCookie':
            webview.WebCookieManager.clearSessionCookieSync();  
            
            break;
          case 'emitdeleteExpiredCookie':
            
            
            break;
          case 'emitexistCookie':
            let vaue = webview.WebCookieManager.existCookie();
            
            break;
          case 'emitgetCookie':
            let value = webview.WebCookieManager.fetchCookieSync('www.baidu.com'); 
            console.info('value: ' + value);
            
            break;

          case 'emitsetCookie':
            console.info('value: ');
            webview.WebCookieManager.configCookieSync('www.baidu.com','a=b'); 
            
            break;

          case 'emitsaveCookie':
            webview.WebCookieManager.saveCookieAsync(); 
            
            break;
          case 'emitputAcceptFileURICookieEnabled':
            
            
            break;
          case 'emitputAcceptThirdPartyCookieEnabled':
            webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(false)
            
            break;

          case 'emitisFileURICookieAllowed':
            
            
            break;
          case 'emitisThirdPartyCookieAllowed':
            let isThirdParty = webview.WebCookieManager.isThirdPartyCookieAllowed();
            
            break;
          case 'hasImage':
            
            try{
              this.controllerTwo.hasImage((err,data)=>{
                if(err) {
                  console.info('has ImageError' + JSON.stringify(err))
                  return;
                }
                
              });
            } catch (error) {
              console.error(`ErrorCode:${error.code},Message:${error.message}`);
            }
            break;
          case 'hasImageTwo':
            let flag = true
            try{
              this.controllerTwo.hasImage().then((data)=>{
                
              })
            } catch (error) {
              console.error(`ErrorCode:${error.code},Message:${error.message}`);
            }
            break;
          case 'setNetworkAvailable':
            this.controllerTwo.setNetworkAvailable(this.netWorkStatus);
            
            break;
          case 'getFavicon':
            let icon = 'baidu'
            this.controllerTwo.getFavicon();
            
            break;
          case 'getOriginalUrl':
            this.controllerTwo.getOriginalUrl();
            
            break;
          case 'history':
            let res = 1;
            let historyList = this.controllerTwo.getBackForwardEntries();
            webview.WebviewController.initializeWebEngine();
            
            
            
            break;
          case 'pageUp':
            
            this.controllerTwo.pageUp(true);
            this.controllerTwo.pageDown(true);
            this.controllerTwo.removeCache(true);
            
            break;

          default:
            console.info('can not match case')
        }
      })
    }

  }
}
