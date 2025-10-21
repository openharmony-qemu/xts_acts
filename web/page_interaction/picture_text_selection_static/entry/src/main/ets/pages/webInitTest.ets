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
import webView from '@ohos.web.webview';
import { Entry, Component, Column, Row, Button, ClickEvent, Web,OnPageEndEvent,ScriptItem } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import web_webview from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import image from '@ohos.multimedia.image'
import { Callback, RecordData } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'

class StringFields {
  private str: string = '';
}

@Entry
@Component
struct WebInitTest {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = ''
  @State pixelmap: image.PixelMap | undefined = undefined;
  @State searchResultCount: number = -1
  @State flag: boolean = false

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
        Button('Web click')
          .key('WebInitTestButton')
          .onClick((): void => {
            console.info('key==>' +  this.stringObj.str)
            switch (this.stringObj.str) {

              case 'emitGetFavicon': {
                try {
                  setTimeout(() => {
                    console.log('the result of pixelmap: test  start 0' );
                  this.pixelmap = this.controller.getFavicon();
                    console.log('the result of pixelmap: test  start 1' );
              if ( this.pixelmap != undefined) {
                Utils.emitEvent(true, 114)
              }
                  }, 3000)
                } catch (error:BusinessError) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, 114)
                }
                break;
              }

            }
          })
      }

      Web({ src: 'www.baidu.com', controller: this.controller })
        .height('100%')
        .width('100%')
        .javaScriptAccess(true)
        .geolocationAccess(true)
        .databaseAccess(true)
        .onSearchResultReceive(ret => {
          console.log('on search result receive:' + '[cur]' + ret.activeMatchOrdinal +
            '[total]' + ret.numberOfMatches + '[isDone]' + ret.isDoneCounting);
          this.searchResultCount = ret.numberOfMatches
          let searchResult = ret.activeMatchOrdinal.toString() +
          ret.numberOfMatches.toString();
          console.log('searchResult' + searchResult);
          if(this.flag){
            this.controller.clearMatches();
            this.flag=false
          }
        })
    }
  }
}