/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import Utils from '../../test/Utils';
import { BusinessError } from '@ohos.base';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct Index {
  response: WebResourceResponse = new WebResourceResponse();
  @State str: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State rawfileResource: Resource = $rawfile('index.html');
  htmlBody: string = '<!DOCTYPE html><html><body><h1>setResponseBody</h1></body></html>';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 174700,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(174700)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Web({ src: $rawfile('index.html'), controller: new WebController() })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .width('100%')
        .height('80%')
        .onPageEnd(() => {
          this.isPageEnd = 0;
        })

      Row() {
        Button('webResourceResponseSetResponseBodyParam').key('webResourceResponseSetResponseBodyParamButton').onClick(async () => {
          await waitForExist(() => this.isReceive, this.str, 0);
          await waitForExist(() => this.isPageEnd, this.str, 0);
          console.info('key==>' + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case 'emitSetResponseBodyNull001': {
              try {
                console.info('test setResponseBody with null');
                this.response.setResponseBody(null);
                Utils.emitEvent('success', 174710);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 174710);
              }
              break;
            }
            case 'emitSetResponseBodyUndefined001': {
              try {
                console.info('test setResponseBody with undefined');
                this.response.setResponseBody(undefined);
                Utils.emitEvent('success', 174720);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 174720);
              }
              break;
            }
            case 'emitSetResponseBodyEmptyString001': {
              try {
                console.info('test setResponseBody with empty string');
                this.response.setResponseBody('');
                Utils.emitEvent('success', 174730);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 174730);
              }
              break;
            }
            case 'emitSetResponseBodyHtmlString001': {
              try {
                console.info('test setResponseBody with html string');
                this.response.setResponseBody(this.htmlBody);
                Utils.emitEvent('success', 174735);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 174735);
              }
              break;
            }
            case 'emitSetResponseBodyNumber001': {
              try {
                console.info('test setResponseBody with number');
                this.response.setResponseBody(123);
                Utils.emitEvent('success', 174740);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 174740);
              }
              break;
            }
            case 'emitSetResponseBodyNumberZero001': {
              try {
                console.info('test setResponseBody with number zero');
                this.response.setResponseBody(0);
                Utils.emitEvent('success', 174750);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 174750);
              }
              break;
            }
            case 'emitSetResponseBodyNumberNegative001': {
              try {
                console.info('test setResponseBody with negative number');
                this.response.setResponseBody(-1);
                Utils.emitEvent('success', 174760);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 174760);
              }
              break;
            }
            case 'emitSetResponseBodyResource001': {
              try {
                console.info('test setResponseBody with Resource');
                this.response.setResponseBody(this.rawfileResource);
                Utils.emitEvent('success', 174770);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 174770);
              }
              break;
            }
            case 'emitSetResponseBodyArrayBuffer001': {
              try {
                console.info('test setResponseBody with ArrayBuffer');
                let buffer = new ArrayBuffer(8);
                let view = new Uint8Array(buffer);
                view[0] = 0x48;
                this.response.setResponseBody(buffer);
                Utils.emitEvent('success', 174780);
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(this.str + `ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 174780);
              }
              break;
            }
            default:
              console.info('can not match case');
          }
        })
      }
    }
    .width('100%')
    .height('100%')
  }
}
