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
  OnContextMenuShowEvent,
  OnPageEndEvent,
  OnHttpErrorReceiveEvent,
  OnDataResubmittedEvent,
  WebDarkMode,
  CustomDialogController,
  WebResourceResponse,
  OnRenderExitedEvent,
  OnPageBeginEvent,
  RenderProcessNotRespondingReason,
  RenderProcessNotRespondingData,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web,
  EditMenuOptions,
  TextRange,
  TextMenuItem,
  TextMenuItemId
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import webview from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'


class StringFields {
  str: string = '';
}


@Entry
@Component
struct webViewContCreatePdfAndOthersError {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  controllerNull: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = '';
  stringObj: StringFields = new StringFields();
  @State editMenuOptions: EditMenuOptions =
    { onCreateMenu: this.onCreateMenu, onMenuItemClick: this.onMenuItemClick } as EditMenuOptions;
  @State errorCode: int = 0;
  @State errorMsg: string = 'failed';
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;

  onCreateMenu(menuItems: Array<TextMenuItem>): Array<TextMenuItem> {
    let items = menuItems.filter((menuItem) => {
      return (
        menuItem.id.equals(TextMenuItemId.CUT) ||
        menuItem.id.equals(TextMenuItemId.COPY) ||
        menuItem.id.equals((TextMenuItemId.PASTE))
      )
    });
    return items;
  }

  onMenuItemClick(menuItem: TextMenuItem, textRange: TextRange): boolean {
    if (menuItem.id.equals(TextMenuItemId.CUT)) {
      return true;
    } else if (menuItem.id.equals(TextMenuItemId.COPY)) {
      return false;
    }
    return false;
  }

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear ' + this.valueChangeCallBack);
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, string | boolean | number | object | Int>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION vaclue: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.stringObj.str = strValue;
        console.info('this.str has been updated to: ' + this.stringObj.str);
      }
    }
  }
  pdfConfig: webview.PdfConfiguration = {
    width: 8.27,
    height: 11.69,
    marginTop: 0,
    marginBottom: 0,
    marginRight: 0,
    marginLeft: 0,
    shouldPrintBackground: true
  } as webview.PdfConfiguration;

  build() {
    Column() {
      Row() {
        Button('createPdfAndOthersError')
          .key('webViewContCreatePdfAndOthersError')
          .onClick((e: ClickEvent) => {
            console.info('key==>' + this.stringObj.str)
            switch (this.stringObj.str) {

              case 'emitSetPrintBackgroundInitErr': {
                try {
                  this.controllerNull.setPrintBackground(false)
                } catch (error: BusinessError) {
                  console.error(`XXXXXXXX emitGetScrollableInitErr ErrorCode: ${error.code},  Message: ${error.message}`);
                  this.errorCode = error.code;
                  this.errorMsg = error.message;
                  Utils.emitEvent(this.errorCode, 17113)
                  Utils.emitEvent(this.errorMsg, 17114)
                }
                break;
              }
            }
          })

      }

      Web({
        src: 'resource://rawfile/index.html',
        controller: this.controller
      })
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .enableHapticFeedback(true)
        .editMenuOptions(this.editMenuOptions)
        .forceDisplayScrollBar(true)
    }
  }
}