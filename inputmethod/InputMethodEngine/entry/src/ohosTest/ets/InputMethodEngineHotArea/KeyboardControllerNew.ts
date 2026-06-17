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
import prompt from '@ohos.prompt';
import inputmethodengine from '@ohos.inputMethodEngine';
import display from '@ohos.display';
import windowManager from '@ohos.window';
import commoneventmanager from '@ohos.commonEventManager';
import InputMethodExtensionContext from '@ohos.InputMethodExtensionContext';
import { window } from '@kit.ArkUI';


let inputKeyboardDelegate = inputmethodengine.getKeyboardDelegate();
let inputMethodAbility = inputmethodengine.getInputMethodAbility();
let inputMethodEngine = inputmethodengine.getInputMethodEngine();
const TAG = 'keyboardControllerHotArea';

let panelInfo = {
  type: inputmethodengine.PanelType.SOFT_KEYBOARD,
  flag: inputmethodengine.PanelFlag.FLG_FIXED
};

let disp = display.getDefaultDisplaySync();
let portraitHeight = Math.floor((disp.height > disp.width ? disp.height : disp.width) * 0.4);
let portraitWidth = Math.floor((disp.height > disp.width ? disp.width : disp.height) * 0.7);
let portraitTop = Math.floor((disp.height > disp.width ? disp.height : disp.width) - portraitHeight);
let landscapeHeight = Math.floor((disp.height > disp.width ? disp.width : disp.height) * 0.4);
let landscapeWidth = Math.floor((disp.height > disp.width ? disp.height : disp.width) * 0.7);
let landscapeTop = Math.floor((disp.height > disp.width ? disp.width : disp.height) - landscapeHeight);
let landscapeRect1: window.Rect = {
  left: 100,
  top: landscapeTop,
  width: landscapeWidth,
  height: landscapeHeight
};
let portraitRect1: window.Rect = {
  left: 100,
  top: portraitTop,
  width: portraitWidth,
  height: portraitHeight
};
let panelFlag: inputmethodengine.PanelFlag = inputmethodengine.PanelFlag.FLG_FIXED;
let panelRect: inputmethodengine.PanelRect = {
  landscapeRect: landscapeRect1,
  portraitRect: portraitRect1,
};

export class KeyboardControllerNew {
  private mContext: InputMethodExtensionContext | undefined = undefined;
  private softKeyboardPanel: inputmethodengine.Panel = null;
  private windowHeight: number = 0;
  private windowWidth: number = 0;
  private keyboardController: inputmethodengine.KeyboardController;
  private TextInputClient: inputmethodengine.TextInputClient;
  private InputClient: inputmethodengine.InputClient;
  private display_info = display.getDefaultDisplaySync();

  public onCreate(context: InputMethodExtensionContext): void {
    this.mContext = context;
    let that = this;
    inputMethodAbility.on('inputStop', () => {
      this.mContext.destroy((err, data) => {
        console.info(TAG + `====>inputStop err:${JSON.stringify(err)},data:${JSON.stringify(data)}`);
      });
    });
    inputMethodAbility.on('inputStart', async (keyboardController, InputClient) => {
      this.InputClient = InputClient;
      console.info(TAG + '====>inputMethodAbility inputStart into');
    });
    inputMethodAbility.createPanel(this.mContext, panelInfo).then(async (inputPanel: inputmethodengine.Panel) => {
      this.softKeyboardPanel = inputPanel;
      console.info(TAG + `====>panelFlag ${panelFlag}, panelRect ${JSON.stringify(panelRect)}`);
      await this.softKeyboardPanel.adjustPanelRect(panelFlag, panelRect);
      console.info(TAG + '====>ssetUiContent start====');
      await this.softKeyboardPanel.setUiContent('testability/pages/HotArea');
      console.info(TAG + '====>createPanel success====');
      try {
        let commonEventSubscribeInfo = {
          events: ['inputMethodEngineHotAreaTest']
        }; 
        commoneventmanager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
          subscriber = data;
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info(TAG + '====>scene subscribe finish====');
        });
      } catch (err) {
        console.info(TAG + '====>createSubscriber err:' + JSON.stringify(err.message));
      }
    }).catch((err) => {
      console.info(TAG + `====>createPanel catch code: ${err.code}, message: ${err.message}`);
    });
    function subscriberCallback(err, data): void {
      console.info(TAG + '====>receive event err: ' + JSON.stringify(err));
      console.info(TAG + '====>receive event data ' + JSON.stringify(data));
      switch (data.code) {
        case 1:
          console.info(TAG + '====>Sub_InputMethod_IME_HotAreaTest_0100 event:' + data.event);
          that.Sub_InputMethod_IME_HotAreaTest_0100();
          break;
        case 2:
          console.info(TAG + '====>Sub_InputMethod_IME_HotAreaTest_0200 event:' + data.event);
          that.Sub_InputMethod_IME_HotAreaTest_0200();
          break;
      }
    }
    let subscriber;
  }

  private publishCallback(err): void {
    if (err) {
      console.error(TAG + '====>publish failed: ' + JSON.stringify(err));
    } else {
      console.log(TAG + '====>publish');
    }
  }

  public insertText(text: string): void {
    if (this.InputClient) {
      this.InputClient.insertText(text);
      console.info(TAG + '====>insertText success ');
    } else {
      console.info(TAG + '====>InputClient is NA');
    }
  }

  async Sub_InputMethod_IME_HotAreaTest_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let length: number = 4;
      let text = await this.InputClient.getForward(length);
      console.info(TAG + `====>Sub_InputMethod_IME_HotAreaTest_0100 getForward success text:${text}`);
      await this.InputClient.deleteForward(length);
      if (text === '1234') {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_HotAreaTest_0100 catch code: ${err.code}, message: ${err.message}`);
    }
    commoneventmanager.publish('Sub_InputMethod_IME_HotAreaTest_0100', commonEventPublishData, this.publishCallback);
  }

  async Sub_InputMethod_IME_HotAreaTest_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let dis = display.getDefaultDisplaySync();
      if (dis.height > dis.width) {
        let landscapeRect: window.Rect = {
          left: 0,
          top: 0,
          width: 0,
          height: 0
        };
        let portraitRect: window.Rect = {
          left: 0,
          top: Math.floor(disp.height - disp.height * 0.7),
          width: dis.width,
          height: Math.floor(dis.height * 0.7)
        };
        let panelRect1: inputmethodengine.PanelRect = {
          landscapeRect: landscapeRect,
          portraitRect: portraitRect,
        };
        console.info(TAG + `====>panelFlag ${panelFlag}, panelRect ${JSON.stringify(panelRect)}`);
        await this.softKeyboardPanel.adjustPanelRect(panelFlag, panelRect1);
        console.info(TAG + `====>adjustPanelRect success`);
      } else {
        let landscapeRect: window.Rect = {
          left: 0,
          top: Math.floor(disp.height - disp.height * 0.7),
          width: dis.width,
          height: Math.floor(dis.height * 0.7)
        };
        let portraitRect: window.Rect = {
          left: 0,
          top: 0,
          width: 0,
          height: 0
        };
        let panelRect1: inputmethodengine.PanelRect = {
          landscapeRect: landscapeRect,
          portraitRect: portraitRect,
        };
        console.info(TAG + `====>panelFlag ${panelFlag}, panelRect ${JSON.stringify(panelRect)}`);
        await this.softKeyboardPanel.adjustPanelRect(panelFlag, panelRect1);
        console.info(TAG + `====>adjustPanelRect success`);
      }
      setTimeout(async () => {
        let length: number = 4;
        let text = await this.InputClient.getForward(length);
        console.info(TAG + `====>Sub_InputMethod_IME_HotAreaTest_0200 getForward success text:${text}`);
        await this.InputClient.deleteForward(length);
        if (text === '1234') {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        }
        commoneventmanager.publish('Sub_InputMethod_IME_HotAreaTest_0200', commonEventPublishData, this.publishCallback);
      }, 8000);
      
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_HotAreaTest_0200 catch code: ${err.code}, message: ${err.message}`);
      commoneventmanager.publish('Sub_InputMethod_IME_HotAreaTest_0200', commonEventPublishData, this.publishCallback);
    }
  }
  
}

const keyboardController = new KeyboardControllerNew();

export default keyboardController;