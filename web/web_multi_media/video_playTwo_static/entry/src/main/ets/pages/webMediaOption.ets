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
import web_webview from '@ohos.web.webview'
import { Callback } from '@ohos.base';
import { Entry, Text, Column, Component, Button, ClickEvent, Row } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog';
import image from '@ohos.multimedia.image';
import events_emitter from '@ohos.events.emitter';
import { Web ,WebMediaOptions,OnAudioStateChangedEvent} from '@ohos.arkui.component';
import { BusinessError, RecordData } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import { Hypium } from '../../../hypium';
import Utils from '../../src/test/Util.test.ets';

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebMediaOption{
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  stringObj: StringFields  = new StringFields ();
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State playing: boolean = false
  @State checkResult: string = "";
  @State checkResultTwo: string = "";
  @State firstId: number = 415;

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear');
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION value: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.stringObj.str = strValue;
        console.info('this.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build(){
    Column(){
      Row(){
        Button("mediaOptionTest").key('webViewMediaOptionTestButton').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {
            case "emitMediaOptions001": {
              try {
                this.controller.requestFocus();
                this.controller.runJavaScript("play()", (error, result) => {
                  if (error) {
                    console.log(`The controller.play() return error is: ${error}`);
                  }
                  if (result) {
                    console.log(`The controller.play() return value is: ${result}`);
                  }
                })

                setTimeout(() => {
                this.controllerTwo.requestFocus();
                this.controllerTwo.runJavaScript("play()", (error, result) => {
                  if (error) {
                    console.log(`The controller.play() return error is: ${error}`);
                  }
                  console.log(`The controllerTwo.play() return value is: ${result}`);
                })
                }, 500)

                setTimeout(() => {
                this.controller.runJavaScript("checkState()", (error, result) => {
                  if (error) {
                    console.log(`The controller.checkState() return error is: ${error}`);
                  }
                  if (result) {
                    this.checkResult = result
                    console.log(`The controller.checkState() return value is: ${result}`);
                  }
                })
                }, 800)

                setTimeout(() => {
                this.controllerTwo.runJavaScript("checkState()", (error, result) => {
                  if (error) {
                    console.log(`The controller.checkState() return error is: ${error}`);
                  }
                  if (result) {
                    this.checkResultTwo = result
                    console.log(`The controllerTwo.checkState() return value is: ${result}`);
                  }
                })
                }, 1200)
              } catch (error:BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }

              setTimeout(() => {
              console.log(` this.checkResult ` + this.checkResult + ' this.checkResultTwo ' + this.checkResultTwo);
                Utils.emitEvent((this.checkResult == this.checkResultTwo), 415)
              }, 2000)
              break;
            }
          }
        })
      }

      Web({ src: "resource://rawfile/videoTest.html", controller: this.controller })
        .height('30%')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .mediaPlayGestureAccess(false)
        .mediaOptions({ resumeInterval: 2, audioExclusive: true })
        .onAudioStateChanged((event:OnAudioStateChangedEvent):void => {
          this.playing = event.playing
          console.log('onAudioStateChanged playing: ' + this.playing + this.firstId);
        })

      Web({ src: "resource://rawfile/audioTest.html", controller: this.controllerTwo })
        .height('30%')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .mediaPlayGestureAccess(false)
        .databaseAccess(this.databaseAccess)
        .mediaOptions({ resumeInterval: 2, audioExclusive: true })
        .onAudioStateChanged((event:OnAudioStateChangedEvent):void => {
          this.playing = event.playing
          console.log('onAudioStateChangedTwo playing: ' + this.playing + this.firstId);
        })
    }
  }
}
