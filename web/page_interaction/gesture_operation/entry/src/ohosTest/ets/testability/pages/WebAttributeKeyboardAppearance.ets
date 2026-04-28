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
import web_webview from '@ohos.web.webview';

const EVENT_ID_SET_SUITE_KEY = 187001;

@Entry
@Component
struct WebAttributeKeyboardAppearance {
  @State str: string = "";
  @State isReceive: number = -1;
  @State appearanceMode: WebKeyboardAppearanceMode | undefined = WebKeyboardAppearanceMode.NONE_IMMERSIVE;
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("WebAttributeKeyboardAppearance page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webAttributeKeyboardAppearanceButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(() => this.isReceive, this.str + ' isReceive', 1, 1000);
          await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitWebAttributeKeyboardAppearance001": {
              try {
                this.appearanceMode = WebKeyboardAppearanceMode.NONE_IMMERSIVE;
                Utils.emitEvent(true, 187010);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 187010);
              }
              break;
            }
            case "emitWebAttributeKeyboardAppearance002": {
              try {
                this.appearanceMode = WebKeyboardAppearanceMode.IMMERSIVE;
                Utils.emitEvent(true, 187020);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 187020);
              }
              break;
            }
            case "emitWebAttributeKeyboardAppearance003": {
              try {
                this.appearanceMode = WebKeyboardAppearanceMode.LIGHT_IMMERSIVE;
                Utils.emitEvent(true, 187030);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 187030);
              }
              break;
            }
            case "emitWebAttributeKeyboardAppearance004": {
              try {
                this.appearanceMode = WebKeyboardAppearanceMode.DARK_IMMERSIVE;
                Utils.emitEvent(true, 187040);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 187040);
              }
              break;
            }
            case "emitWebAttributeKeyboardAppearance005": {
              try {
                this.appearanceMode = WebKeyboardAppearanceMode.NONE_IMMERSIVE;
                this.appearanceMode = WebKeyboardAppearanceMode.DARK_IMMERSIVE;
                this.appearanceMode = WebKeyboardAppearanceMode.LIGHT_IMMERSIVE;
                Utils.emitEvent(true, 187050);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 187050);
              }
              break;
            }
            case "emitWebAttributeKeyboardAppearance006": {
              try {
                this.appearanceMode = WebKeyboardAppearanceMode.IMMERSIVE;
                this.appearanceMode = WebKeyboardAppearanceMode.NONE_IMMERSIVE;
                this.appearanceMode = WebKeyboardAppearanceMode.IMMERSIVE;
                Utils.emitEvent(true, 187060);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 187060);
              }
              break;
            }
            case "emitWebAttributeKeyboardAppearance007": {
              try {
                this.appearanceMode = WebKeyboardAppearanceMode.LIGHT_IMMERSIVE;
                this.appearanceMode = WebKeyboardAppearanceMode.IMMERSIVE;
                this.appearanceMode = WebKeyboardAppearanceMode.NONE_IMMERSIVE;
                this.appearanceMode = WebKeyboardAppearanceMode.DARK_IMMERSIVE;
                Utils.emitEvent(true, 187070);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 187070);
              }
              break;
            }
            case "emitWebAttributeKeyboardAppearance008": {
              try {
                this.appearanceMode = WebKeyboardAppearanceMode.DARK_IMMERSIVE;
                this.appearanceMode = WebKeyboardAppearanceMode.LIGHT_IMMERSIVE;
                this.appearanceMode = WebKeyboardAppearanceMode.IMMERSIVE;
                this.appearanceMode = WebKeyboardAppearanceMode.NONE_IMMERSIVE;
                Utils.emitEvent(true, 187080);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 187080);
              }
              break;
            }
            case "emitWebAttributeKeyboardAppearance009": {
              try {
                this.appearanceMode = undefined;
                Utils.emitEvent(true, 187090);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 187090);
              }
              break;
            }
            case "emitWebAttributeKeyboardAppearance010": {
              try {
                this.appearanceMode = undefined;
                Utils.emitEvent(true, 187100);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 187100);
              }
              break;
            }
            default:
              break;
          }
        })
      }

      Web({ src: $rawfile('indexFive.html'), controller: this.controller })
        .key('WebAttributeKeyboardAppearanceWeb')
        .javaScriptAccess(true)
        .fileAccess(true)
        .imageAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .databaseAccess(true)
        .keyboardAppearance(this.appearanceMode)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
        .height('95%')
    }
  }
}
