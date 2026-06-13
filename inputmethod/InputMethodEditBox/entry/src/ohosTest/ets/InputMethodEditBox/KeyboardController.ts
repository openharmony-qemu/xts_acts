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
import display from '@ohos.display';
import commoneventmanager from '@ohos.commonEventManager';
import inputMethodEngine from '@ohos.inputMethodEngine';
import { InputMethodExtraConfig } from '@kit.IMEKit';

let inputMethodAbility = inputMethodEngine.getInputMethodAbility();
const TAG = 'keyboardController';
const SOFT_KEYBOARD = 0;
const FLG_FLOATING = 1;

let panelInfo = {
  type: SOFT_KEYBOARD,
  flag: FLG_FLOATING
};

export class KeyboardController {
  mContext;
  storage: LocalStorage;
  WINDOW_TYPE_INPUT_METHOD_FLOAT = 2105;
  windowName = 'inputApp';

  private softKeyboardPanel: inputMethodEngine.Panel = null;
  private windowHeight: number = 0;
  private windowWidth: number = 0;
  private keyboardController: inputMethodEngine.KeyboardController;
  private InputClient: inputMethodEngine.InputClient;
  private display_info = display.getDefaultDisplaySync();
  private extraConfig: InputMethodExtraConfig;
  private consumeKeyEvents: boolean = true;

  constructor(context) {
    this.storage = new LocalStorage();
    this.storage.setOrCreate('storageSimplePorp', 121);
    this.mContext = context;
    this.windowWidth = this.display_info.width;
    this.windowHeight = this.display_info.height * 0.45;
  }

  public onCreate(): void {
    let that = this;
    let subscriber;

    inputMethodAbility.createPanel(this.mContext, panelInfo, (err, panel) => {
      if (err !== undefined) {
        console.info(TAG + '====>Failed to create panel, err: ' + JSON.stringify(err));
        return;
      }
      this.softKeyboardPanel = panel;
      this.softKeyboardPanel.setUiContent('testability/pages/Second', async (err, data) => {
        console.info(TAG + '====>Succeed in creating panel.' + JSON.stringify(panel));
      });
      try {
        let commonEventSubscribeInfo = {
          events: ['InputMethodEditBoxTest']
        };

        commoneventmanager.createSubscriber(commonEventSubscribeInfo).then(function (data) {
          subscriber = data;
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info(TAG + '====>scene subscribe finish====');
        })
      } catch (err) {
        console.info(TAG + '====>createSubscriber err:' + JSON.stringify(err.message));
      }
    });

    inputMethodAbility.on('inputStop', async () => {
      console.info(TAG + '====>on_inputStop callback')
      inputMethodAbility.off('inputStart');
      inputMethodEngine.getKeyboardDelegate().off('editorAttributeChanged');
      inputMethodAbility.off('inputStop', () => { });
      inputMethodAbility.destroyPanel(this.softKeyboardPanel);
      await that.mContext.destroy();
      await commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
    });

    inputMethodAbility.on('inputStart', async (keyboardController, InputClient) => {
      this.keyboardController = keyboardController;
      this.InputClient = InputClient;
      console.info(TAG + '====>inputMethodAbility inputStart into');
    });

    inputMethodEngine.getKeyboardDelegate().on('editorAttributeChanged', (attr: inputMethodEngine.EditorAttribute) => {
      console.info(TAG + `====>on_EditorAttribute_callback, extraConfig = ${attr.extraConfig}`);
      this.extraConfig = attr.extraConfig;
    });

    let subscriberCallback = (err, data) => {
      console.info(TAG + '====>receive event err: ' + JSON.stringify(err));
      console.info(TAG + '====>receive event data ' + JSON.stringify(data));
      switch (data.code) {
        case 10:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_0800 event:' + data.event);
          that.Sub_InputMethod_extraConfig_0800();
          break;
        case 20:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_0900 event:' + data.event);
          that.Sub_InputMethod_extraConfig_0900();
          break;
        case 30:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_0700 event:' + data.event);
          that.Sub_InputMethod_extraConfig_0700();
          break;
        case 40:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_1000 event:' + data.event);
          that.Sub_InputMethod_extraConfig_1000();
          break;
        case 50:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_0500 event:' + data.event);
          that.Sub_InputMethod_extraConfig_0500();
          break;
        case 60:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_0600 event:' + data.event);
          that.Sub_InputMethod_extraConfig_0600();
          break;
        case 70:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_0100 event:' + data.event);
          that.Sub_InputMethod_extraConfig_0100();
          break;
        case 80:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_0300 event:' + data.event);
          that.Sub_InputMethod_extraConfig_0300();
          break;
        case 90:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_0200 event:' + data.event);
          that.Sub_InputMethod_extraConfig_0200();
          break;
        case 100:
          console.info(TAG + '====>Sub_InputMethod_extraConfig_0400 event:' + data.event);
          that.Sub_InputMethod_extraConfig_0400();
          break;
        case 101:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0100 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetUiContentCallback_0100();
          break;
        case 102:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetUiContentCallback_0200();
          break;
        case 103:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0300 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetUiContentCallback_0300();
          break;
        case 104:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetUiContentPromise_0100();
          break;
        case 105:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0200 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetUiContentPromise_0200();
          break;
        case 106:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0300 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetUiContentPromise_0300();
          break;
        case 107:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0400 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetUiContentCallback_0400();
          break;
        case 108:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0500 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetUiContentCallback_0500();
          break;
        case 109:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0600 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetUiContentCallback_0600();
          break;
        case 110:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0700 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetUiContentCallback_0700();
          break;
        case 111:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0400 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetUiContentPromise_0400();
          break;
        case 112:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0500 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetUiContentPromise_0500();
          break;
        case 113:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0600 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetUiContentPromise_0600();
          break;
        case 114:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0700 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetUiContentPromise_0700();
          break;
        case 115:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelresizeCallback_0100 event:' + data.event);
          that.Sub_InputMethod_IME_PanelresizeCallback_0100();
          break;
        case 116:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelresizeCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_PanelresizeCallback_0200();
          break;
        case 117:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelresizeCallback_0300 event:' + data.event);
          that.Sub_InputMethod_IME_PanelresizeCallback_0300();
          break;
        case 118:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelresizeCallback_0400 event:' + data.event);
          that.Sub_InputMethod_IME_PanelresizeCallback_0400();
          break;
        case 119:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelresizePromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_PanelresizePromise_0100();
          break;
        case 120:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelresizePromise_0200 event:' + data.event);
          that.Sub_InputMethod_IME_PanelresizePromise_0200();
          break;
        case 121:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelresizePromise_0300 event:' + data.event);
          that.Sub_InputMethod_IME_PanelresizePromise_0300();
          break;
        case 122:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelresizePromise_0400 event:' + data.event);
          that.Sub_InputMethod_IME_PanelresizePromise_0400();
          break;
        case 123:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToCallback_0100 event:' + data.event);
          that.Sub_InputMethod_IME_PanelmoveToCallback_0100();
          break;
        case 124:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToCallback_0200 event:' + data.event);
          that.Sub_InputMethod_IME_PanelmoveToCallback_0200();
          break;
        case 125:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToCallback_0300 event:' + data.event);
          that.Sub_InputMethod_IME_PanelmoveToCallback_0300();
          break;
        case 126:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToCallback_0400 event:' + data.event);
          that.Sub_InputMethod_IME_PanelmoveToCallback_0400();
          break;
        case 127:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_PanelmoveToPromise_0100();
          break;
        case 128:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToePromise_0200 event:' + data.event);
          that.Sub_InputMethod_IME_PanelmoveToPromise_0200();
          break;
        case 129:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToPromise_0300 event:' + data.event);
          that.Sub_InputMethod_IME_PanelmoveToPromise_0300();
          break;
        case 130:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToPromise_0400 event:' + data.event);
          that.Sub_InputMethod_IME_PanelmoveToPromise_0400();
          break;
        case 131:
          console.info(TAG + '====>Sub_InputMethod_IME_PaneladjustPanelRect_0100 event:' + data.event);
          that.Sub_InputMethod_IME_PaneladjustPanelRect_0100();
          break;
        case 132:
          console.info(TAG + '====>Sub_InputMethod_IME_PaneladjustPanelRect_0200 event:' + data.event);
          that.Sub_InputMethod_IME_PaneladjustPanelRect_0200();
          break;
        case 133:
          console.info(TAG + '====>Sub_InputMethod_IME_PaneladjustPanelRect_0300 event:' + data.event);
          that.Sub_InputMethod_IME_PaneladjustPanelRect_0300();
          break;
        case 134:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelupdateRegion_0100 event:' + data.event);
          that.Sub_InputMethod_IME_PanelupdateRegion_0100();
          break;
        case 135:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelupdateRegion_0200 event:' + data.event);
          that.Sub_InputMethod_IME_PanelupdateRegion_0200();
          break;
        case 136:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0100 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetImmersiveEffec_0100();
          break;
        case 137:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0200 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetImmersiveEffec_0200();
          break;
        case 138:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100();
          break;
        case 139:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200 event:' + data.event);
          that.Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200();
          break;
        case 140:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100();
          break;
        case 141:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200();
          break;
        case 142:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300();
          break;
        case 143:
          console.info(TAG + '====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400 event:' + data.event);
          that.Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400();
          break;
        case 144:
          console.info(TAG + '====>Sub_InputMethod_IMF_consumeKeyEvents_0300 event:' + data.event);
          that.Sub_InputMethod_IMF_consumeKeyEvents_0300();
          break;
        case 145:
          console.info(TAG + '====>Sub_InputMethod_IMF_consumeKeyEvents_0100 event:' + data.event);
          that.Sub_InputMethod_IMF_consumeKeyEvents_0100();
          break;
        case 146:
          console.info(TAG + '====>Sub_InputMethod_IMF_consumeKeyEvents_0200 event:' + data.event);
          that.Sub_InputMethod_IMF_consumeKeyEvents_0200();
          break;
        case 147:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_0100 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_0100();
          break;
        case 148:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_0200 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_0200();
          break;
        case 149:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_0300 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_0300();
          break;
        case 150:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_0400 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_0400();
          break;
        case 151:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_0500 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_0500();
          break;
        case 152:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_0600 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_0600();
          break;
        case 153:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_0700 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_0700();
          break;
        case 154:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_0800 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_0800();
          break;
        case 155:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_0900 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_0900();
          break;
        case 156:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1000 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_1000();
          break;
        case 157:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1100 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_1100();
          break;
        case 158:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1200 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_1200();
          break;
        case 159:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1300 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_1300();
          break;
        case 160:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1400 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_1400();
          break;
        case 161:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1500 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_1500();
          break;
        case 162:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1600 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_1600();
          break;
        case 163:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1700 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_1700();
          break;
        case 164:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1800 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_1800();
          break;
        case 165:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1900 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_1900();
          break;
        case 166:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2000 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_2000();
          break;
        case 167:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2100 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_2100();
          break;
        case 168:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2200 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_2200();
          break;
        case 169:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2300 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_2300();
          break;
        case 170:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2400 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_2400();
          break;
        case 171:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2500 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_2500();
          break;
        case 172:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2600 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_2600();
          break;
        case 173:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2700 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_2700();
          break;
        case 174:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2800 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_2800();
          break;
        case 175:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2900 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_2900();
          break;
        case 176:
          console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_3000 event:' + data.event);
          that.Sub_InputMethod_IME_updatePanelRectSync_3000();
          break;
      }
    };

    let unSubscriberCallback = (err): void => {
      console.info(TAG + '====>unSubscriberCallback start');
      if (err) {
        console.error(TAG + '====>unSubscriberCallback failed: ' + JSON.stringify(err));
      } else {
        console.info(TAG + '====>unSubscriberCallback finsh');
      }
    };
  }

  private publishCallback(err): void {
    if (err) {
      console.error(TAG + '====>publish failed: ' + JSON.stringify(err));
    } else {
      console.log(TAG + '====>publish');
    }
  }

  private async Sub_InputMethod_IME_PanelsetUiContentCallback_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.setUiContent('', async (err, data) => {
        console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0100  err:' + JSON.stringify(err));
        if (err.code === 401) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        }
        commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentCallback_0100', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0100 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentCallback_0100', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelsetUiContentCallback_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.setUiContent(null, async (err, data) => {
        console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0200  err:' + JSON.stringify(err));
        commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentCallback_0200', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0200 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentCallback_0200', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelsetUiContentCallback_0300(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.setUiContent(undefined, async (err, data) => {
        console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0300  err:' + JSON.stringify(err));
        commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentCallback_0300', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0300 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentCallback_0300', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelsetUiContentPromise_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.setUiContent('');
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0100  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0100 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentPromise_0100', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelsetUiContentPromise_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.setUiContent(null);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0200  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0200 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentPromise_0200', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelsetUiContentPromise_0300(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.setUiContent(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0300  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0300 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentPromise_0300', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelsetUiContentCallback_0400(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.setUiContent('', null, async (err, data) => {
        console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0400  err:' + JSON.stringify(err));
        if (err.code === 401) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        }
        commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentCallback_0400', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0400 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentCallback_0400', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelsetUiContentCallback_0500(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.setUiContent(null, this.storage, async (err, data) => {
        console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0500  err:' + JSON.stringify(err));
        commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentCallback_0500', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0500 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentCallback_0500', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelsetUiContentCallback_0600(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.setUiContent(undefined, this.storage, async (err, data) => {
        console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0600  err:' + JSON.stringify(err));
        commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentCallback_0600', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0600 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentCallback_0600', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelsetUiContentCallback_0700(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.setUiContent('', undefined, async (err, data) => {
        console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0700  err:' + JSON.stringify(err));
        if (err.code === 401) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        }
        commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentCallback_0700', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentCallback_0700 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentCallback_0700', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelsetUiContentPromise_0400(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.setUiContent('', null);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0400  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0400 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentPromise_0400', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelsetUiContentPromise_0500(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.setUiContent(null, this.storage);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0500  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0500 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentPromise_0500', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelsetUiContentPromise_0600(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.setUiContent(undefined, this.storage);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0600  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0600 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentPromise_0600', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelsetUiContentPromise_0700(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.setUiContent('', undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0700  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetUiContentPromise_0700 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelsetUiContentPromise_0700', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelresizeCallback_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.resize(null, this.windowHeight, async (err, data) => {
        console.info(TAG + '====>Sub_InputMethod_IME_PanelresizeCallback_0100  success');
        commoneventmanager.publish('Sub_InputMethod_IME_PanelresizeCallback_0100', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelresizeCallback_0100 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelresizeCallback_0100', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelresizeCallback_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.resize(this.windowWidth, null, async (err, data) => {
        console.info(TAG + '====>Sub_InputMethod_IME_PanelresizeCallback_0200  success');
        commoneventmanager.publish('Sub_InputMethod_IME_PanelresizeCallback_0200', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelresizeCallback_0200 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelresizeCallback_0200', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelresizeCallback_0300(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.resize(undefined, this.windowHeight, async (err, data) => {
        console.info(TAG + '====>Sub_InputMethod_IME_PanelresizeCallback_0300  success');
        commoneventmanager.publish('Sub_InputMethod_IME_PanelresizeCallback_0300', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelresizeCallback_0300 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelresizeCallback_0300', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelresizeCallback_0400(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.resize(this.windowWidth, undefined, async (err, data) => {
        console.info(TAG + '====>Sub_InputMethod_IME_PanelresizeCallback_0400  success');
        commoneventmanager.publish('Sub_InputMethod_IME_PanelresizeCallback_0400', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelresizeCallback_0400 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelresizeCallback_0400', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelresizePromise_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.resize(null, this.windowHeight);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelresizePromise_0100  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelresizePromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_PanelresizePromise_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PanelresizePromise_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.resize(this.windowWidth, null);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelresizePromise_0200  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelresizePromise_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_PanelresizePromise_0200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PanelresizePromise_0300(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.resize(undefined, this.windowHeight);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelresizePromise_0300  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelresizePromise_0300 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_PanelresizePromise_0300', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PanelresizePromise_0400(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.resize(this.windowWidth, undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelresizePromise_0400  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelresizePromise_0400 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_PanelresizePromise_0400', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PanelmoveToCallback_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.moveTo(null, 100, async (err, data) => {
        console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToCallback_0100  success');
        commoneventmanager.publish('Sub_InputMethod_IME_PanelmoveToCallback_0100', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToCallback_0100 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelmoveToCallback_0100', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelmoveToCallback_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.moveTo(100, null, async (err, data) => {
        console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToCallback_0200  success');
        commoneventmanager.publish('Sub_InputMethod_IME_PanelmoveToCallback_0200', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToCallback_0200 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelmoveToCallback_0200', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelmoveToCallback_0300(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.moveTo(undefined, 100, async (err, data) => {
        console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToCallback_0300  success');
        commoneventmanager.publish('Sub_InputMethod_IME_PanelmoveToCallback_0300', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToCallback_0300 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelmoveToCallback_0300', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelmoveToCallback_0400(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.moveTo(100, undefined, async (err, data) => {
        console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToCallback_0400  success');
        commoneventmanager.publish('Sub_InputMethod_IME_PanelmoveToCallback_0400', commonEventPublishData, this.publishCallback);
      });
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToCallback_0400 catch err: ' + JSON.stringify(err));
      commoneventmanager.publish('Sub_InputMethod_IME_PanelmoveToCallback_0400', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_PanelmoveToPromise_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.moveTo(null, 100);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToPromise_0100  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToPromise_0100 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_PanelmoveToPromise_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PanelmoveToPromise_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.moveTo(100, null);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToPromise_0200  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToPromise_0200 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_PanelmoveToPromise_0200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PanelmoveToPromise_0300(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.moveTo(undefined, 100);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToPromise_0300  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToPromise_0300 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_PanelmoveToPromise_0300', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PanelmoveToPromise_0400(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.moveTo(100, undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToPromise_0400  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelmoveToPromise_0400 catch err: ' + JSON.stringify(err));
    }
    commoneventmanager.publish('Sub_InputMethod_IME_PanelmoveToPromise_0400', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PaneladjustPanelRect_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: this.display_info.width, height: this.display_info.height * 0.4 },
        portraitRect: { left: 100, top: 100, width: this.display_info.height * 0.4, height: this.display_info.width }
      };
      this.softKeyboardPanel.adjustPanelRect(inputMethodEngine.PanelFlag.FLAG_CANDIDATE, keyboardRect);
      console.info(TAG + '====>Sub_InputMethod_IME_PaneladjustPanelRect_0100  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PaneladjustPanelRect_0100 err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_PaneladjustPanelRect_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PaneladjustPanelRect_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.adjustPanelRect(inputMethodEngine.PanelFlag.FLG_FLOATING, null);
      console.info(TAG + '====>Sub_InputMethod_IME_PaneladjustPanelRect_0200  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PaneladjustPanelRect_0200 err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_PaneladjustPanelRect_0200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PaneladjustPanelRect_0300(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.adjustPanelRect(inputMethodEngine.PanelFlag.FLG_FLOATING, undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_PaneladjustPanelRect_0300  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PaneladjustPanelRect_0300 err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_PaneladjustPanelRect_0300', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PanelupdateRegion_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.updateRegion(null);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelupdateRegion_0100  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelupdateRegion_0100 err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_PanelupdateRegion_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PanelupdateRegion_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.updateRegion(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelupdateRegion_0200  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelupdateRegion_0200 err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_PanelupdateRegion_0200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PanelsetImmersiveEffec_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.setImmersiveEffect(null);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0100  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0100 err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_PanelsetImmersiveEffec_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PanelsetImmersiveEffec_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.setImmersiveEffect(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0200  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetImmersiveEffec_0200 err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_PanelsetImmersiveEffec_0200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.getSystemPanelCurrentInsets(null);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100 err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.getSystemPanelCurrentInsets(undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200 err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_PanelgetSystemPanelCurrentInsetsPromise_0200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.setSystemPanelButtonColor(null, '#FFFFFFFF');
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100 err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.setSystemPanelButtonColor('#FFFFFFFF', null);
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200 err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.setSystemPanelButtonColor('', '#FFFFFFFF');
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300 err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0300', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400(): Promise<void> {
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.setSystemPanelButtonColor('#FFFFFFFF', '');
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400  success');
    } catch (err) {
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      console.info(TAG + '====>Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400 err: ' + JSON.stringify(err));
    };
    commoneventmanager.publish('Sub_InputMethod_IME_PanelsetSystemPanelButtonColorPromise_0400', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_extraConfig_0800(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_0800 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_0800 extraConfig : ${JSON.stringify(mode)}`);
        if (mode.customSettings.bbb === true) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_0800 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_0800', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_0800 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_0800', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_extraConfig_0900(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_0900 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_0900 extraConfig : ${JSON.stringify(mode)}`);
        if (mode.customSettings.aaa === 'AAA') {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_0900 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_0900', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_0900 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_0900', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_extraConfig_0700(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_0700 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_0700 extraConfig : ${JSON.stringify(mode)}`);
        if (mode.customSettings.name === 123) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_0700 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_0700', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_0700 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_0700', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_extraConfig_1000(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_1000 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_1000 extraConfig : ${JSON.stringify(mode)}`);
        if (mode.customSettings.bbb === true && mode.customSettings.aaa === 'AAA' && mode.customSettings.name === 123) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_1000 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_1000', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_1000 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_1000', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_extraConfig_0500(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_0500 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_0500 extraConfig : ${JSON.stringify(mode)}`);
        if (JSON.stringify(mode.customSettings) === '{}') {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_0500 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_0500', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_0500 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_0500', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_extraConfig_0600(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_0600 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_0600 extraConfig : ${JSON.stringify(mode)}`);
        if (JSON.stringify(mode.customSettings) === '{}') {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_0600 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_0600', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_0600 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_0600', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_extraConfig_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_0100 extraConfig : ${JSON.stringify(mode)}`);
        if (JSON.stringify(mode.customSettings) !== '{}') {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_0100 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_0100', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_0100 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_0100', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_extraConfig_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_0300 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_0300 extraConfig : ${JSON.stringify(mode)}`);
        if (JSON.stringify(mode.customSettings) === '{}') {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_0300 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_0300', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_0300 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_0300', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_extraConfig_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_0200 extraConfig : ${JSON.stringify(mode)}`);
        if (JSON.stringify(mode.customSettings) !== '{}') {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_0200 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_0200', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_0200 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_0200', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_extraConfig_0400(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_extraConfig_0400 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.extraConfig;
        console.info(TAG + `====>Sub_InputMethod_extraConfig_0400 extraConfig : ${JSON.stringify(mode)}`);
        if (JSON.stringify(mode.customSettings) === '{}') {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_extraConfig_0400 success ');
        commoneventmanager.publish('Sub_InputMethod_extraConfig_0400', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_extraConfig_0400 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_extraConfig_0400', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IMF_consumeKeyEvents_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IMF_consumeKeyEvents_0300 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    inputMethodEngine.getKeyboardDelegate().on('editorAttributeChanged', (attr: inputMethodEngine.EditorAttribute) => {
      console.info(TAG + `====>on_EditorAttribute_callback = ${JSON.stringify(attr)} consumeKeyEvents = ${attr.consumeKeyEvents}`);
      this.consumeKeyEvents = attr.consumeKeyEvents;
      inputMethodEngine.getKeyboardDelegate().off('editorAttributeChanged');
    });
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.consumeKeyEvents;
        console.info(TAG + '====>Sub_InputMethod_IMF_consumeKeyEvents_0300 consumeKeyEvents :' + JSON.stringify(mode));
        if (mode === false) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_IMF_consumeKeyEvents_0300 success ');
        commoneventmanager.publish('Sub_InputMethod_IMF_consumeKeyEvents_0300', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IMF_consumeKeyEvents_0300 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_IMF_consumeKeyEvents_0300', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IMF_consumeKeyEvents_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IMF_consumeKeyEvents_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    inputMethodEngine.getKeyboardDelegate().on('editorAttributeChanged', (attr: inputMethodEngine.EditorAttribute) => {
      console.info(TAG + `====>on_EditorAttribute_callback = ${JSON.stringify(attr)} consumeKeyEvents = ${attr.consumeKeyEvents}`);
      this.consumeKeyEvents = attr.consumeKeyEvents;
      inputMethodEngine.getKeyboardDelegate().off('editorAttributeChanged');
    });
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.consumeKeyEvents;
        console.info(TAG + '====>Sub_InputMethod_IMF_consumeKeyEvents_0100 consumeKeyEvents :' + JSON.stringify(mode));
        if (mode === true) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_IMF_consumeKeyEvents_0100 success ');
        commoneventmanager.publish('Sub_InputMethod_IMF_consumeKeyEvents_0100', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IMF_consumeKeyEvents_0100 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_IMF_consumeKeyEvents_0100', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IMF_consumeKeyEvents_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IMF_consumeKeyEvents_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    inputMethodEngine.getKeyboardDelegate().on('editorAttributeChanged', (attr: inputMethodEngine.EditorAttribute) => {
      console.info(TAG + `====>on_EditorAttribute_callback = ${JSON.stringify(attr)} consumeKeyEvents = ${attr.consumeKeyEvents}`);
      this.consumeKeyEvents = attr.consumeKeyEvents;
      inputMethodEngine.getKeyboardDelegate().off('editorAttributeChanged');
    });
    try {
      let t = setTimeout(() => {
        clearTimeout(t);
        let mode = this.consumeKeyEvents;
        console.info(TAG + '====>Sub_InputMethod_IMF_consumeKeyEvents_0200 consumeKeyEvents :' + JSON.stringify(mode));
        if (mode === false) {
          commonEventPublishData = {
            data: 'SUCCESS'
          };
        };
        console.info(TAG + '====>Sub_InputMethod_IMF_consumeKeyEvents_0200 success ');
        commoneventmanager.publish('Sub_InputMethod_IMF_consumeKeyEvents_0200', commonEventPublishData, this.publishCallback);
      }, 500);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IMF_consumeKeyEvents_0200 cathch err.code: ${err.code},err.message: ${err.message} `);
      commoneventmanager.publish('Sub_InputMethod_IMF_consumeKeyEvents_0200', commonEventPublishData, this.publishCallback);
    }
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_0100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_0100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 100, top: 100, width: 100, height: 100 },
        portraitRect: { left: 100, top: 100, width: 100, height: 100 },
        landscapeInputRegion: [{ left: 0, top: 100, width: 100, height: 100 }],
        portraitInputRegion: [{ left: 0, top: 100, width: 100, height: 100 }],
        fullScreenMode: false
      };
      this.softKeyboardPanel.updatePanelRectSync(inputMethodEngine.PanelFlag.FLG_FIXED, enhancedPanelRect);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_0100 updatePanelRectSync success');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_0100 err.code:${err.code},err.message:${err.message}`);
    };
    commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_0100', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_0200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_0200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 100, top: 100, width: this.display_info.width, height: this.display_info.height * 0.4 },
        portraitRect: { left: 100, top: 100, width: this.display_info.height * 0.4, height: this.display_info.width },
        landscapeInputRegion: [{ left: 0, top: 500, width: this.display_info.height, height: 600 }],
        portraitInputRegion: [{ left: 0, top: 500, width: this.display_info.width, height: 760 }],
        fullScreenMode: false
      };
      this.softKeyboardPanel.updatePanelRectSync(inputMethodEngine.PanelFlag.FLG_FLOATING, enhancedPanelRect);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_0200 updatePanelRectSync success');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_0200 err.code:${err.code},err.message:${err.message}`);
    };
    commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_0200', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_0300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_0300 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 300 },
        portraitRect: { left: 0, top: 1500, width: 300, height: 1000 },
        landscapeAvoidY: 500,
        landscapeInputRegion: [{ left: 0, top: 500, width: this.display_info.height, height: 600 },
        { left: 0, top: 247, width: this.display_info.height, height: 150 }],
        portraitAvoidY: 1950,
        portraitInputRegion: [{ left: 0, top: 1960, width: this.display_info.width, height: 760 },
        { left: 0, top: 1695, width: this.display_info.width, height: 150 }],
        fullScreenMode: true
      };
      this.softKeyboardPanel.updatePanelRectSync(inputMethodEngine.PanelFlag.FLAG_CANDIDATE, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_0300 updatePanelRectSync success');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_0300 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 12800017) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_0300', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_0400(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_0400 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        portraitRect: { left: 0, top: 0, width: this.display_info.width, height: this.display_info.height * 0.5 },
        landscapeAvoidY: 500,
        landscapeInputRegion: [{ left: 0, top: 500, width: this.display_info.height, height: 600 },
        { left: 0, top: 247, width: this.display_info.height, height: 150 }],
        portraitAvoidY: 1960,
        portraitInputRegion: [{ left: 0, top: 1960, width: this.display_info.width, height: 760 },
        { left: 0, top: 1695, width: this.display_info.width, height: 150 }],
      };
      this.softKeyboardPanel.updatePanelRectSync(inputMethodEngine.PanelFlag.FLG_FLOATING, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_0400 updatePanelRectSync success');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_0400 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_0400', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_0500(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_0500 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: 100, height: 100 },
        portraitRect: { left: 100, top: 100, width: 100, height: 100 }
      };
      this.softKeyboardPanel.updatePanelRectSync(inputMethodEngine.PanelFlag.FLG_FIXED, keyboardRect);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_0500 updatePanelRectSync success');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_0500 err.code:${err.code},err.message:${err.message}`);
    };
    commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_0500', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_0600(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_0600 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: this.display_info.width, height: this.display_info.height * 0.4 },
        portraitRect: { left: 100, top: 100, width: this.display_info.height * 0.4, height: this.display_info.width }
      };
      this.softKeyboardPanel.updatePanelRectSync(inputMethodEngine.PanelFlag.FLG_FLOATING, keyboardRect);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_0600 updatePanelRectSync success');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_0600 err.code:${err.code},err.message:${err.message}`);
    };
    commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_0600', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_0700(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_0700 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: this.display_info.width, height: this.display_info.height * 0.4 },
        portraitRect: { left: 100, top: 100, width: this.display_info.height * 0.4, height: this.display_info.width }
      };
      this.softKeyboardPanel.updatePanelRectSync(inputMethodEngine.PanelFlag.FLAG_CANDIDATE, keyboardRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_0700 updatePanelRectSync success');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_0700 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_0700', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_0800(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_0800 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: this.display_info.width * 10, height: this.display_info.height * 10 },
        portraitRect: { left: 100, top: 100, width: this.display_info.height * 10, height: this.display_info.width * 10 }
      };
      this.softKeyboardPanel.updatePanelRectSync(inputMethodEngine.PanelFlag.FLG_FLOATING, keyboardRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_0800 updatePanelRectSync success');
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_0800 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
    };
    commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_0800', commonEventPublishData, this.publishCallback);
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_0900(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_0900 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: 100, height: 100 },
        portraitRect: { left: 100, top: 100, width: 100, height: 100 }
      };
      await this.softKeyboardPanel.updatePanelRect(inputMethodEngine.PanelFlag.FLG_FIXED, keyboardRect);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_0900 startAbility success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_0900', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_0900 err.code:${err.code},err.message:${err.message}`);
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_0900', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_1000(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_1000 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: this.display_info.width, height: this.display_info.height * 0.4 },
        portraitRect: { left: 100, top: 100, width: this.display_info.height * 0.4, height: this.display_info.width }
      };
      await this.softKeyboardPanel.updatePanelRect(inputMethodEngine.PanelFlag.FLG_FLOATING, keyboardRect);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1000 startAbility success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1000', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_1000 err.code:${err.code},err.message:${err.message}`);
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1000', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_1100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_1100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: this.display_info.width, height: this.display_info.height * 0.4 },
        portraitRect: { left: 100, top: 100, width: this.display_info.height * 0.4, height: this.display_info.width }
      };
      await this.softKeyboardPanel.updatePanelRect(inputMethodEngine.PanelFlag.FLAG_CANDIDATE, keyboardRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1100 updatePanelRectSync success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1100', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_1100 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1100', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_1200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_1200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: this.display_info.width * 10, height: this.display_info.height * 10 },
        portraitRect: { left: 100, top: 100, width: this.display_info.height * 10, height: this.display_info.width * 10 }
      };
      await this.softKeyboardPanel.updatePanelRect(inputMethodEngine.PanelFlag.FLG_FLOATING, keyboardRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1200 updatePanelRectSync success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1200', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_1200 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1200', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_1300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_1300 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 100, top: 100, width: 100, height: 100 },
        portraitRect: { left: 100, top: 100, width: 100, height: 100 },
        landscapeInputRegion: [{ left: 0, top: 100, width: 100, height: 100 }],
        portraitInputRegion: [{ left: 0, top: 100, width: 100, height: 100 }],
        fullScreenMode: false
      };
      await this.softKeyboardPanel.updatePanelRect(inputMethodEngine.PanelFlag.FLG_FIXED, enhancedPanelRect);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1300 updatePanelRectSync success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1300', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_1300 err.code:${err.code},err.message:${err.message}`);
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1300', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_1400(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_1400 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 100, top: 100, width: this.display_info.width, height: this.display_info.height * 0.4 },
        portraitRect: { left: 100, top: 100, width: this.display_info.height * 0.4, height: this.display_info.width },
        landscapeInputRegion: [{ left: 0, top: 500, width: this.display_info.height, height: 600 }],
        portraitInputRegion: [{ left: 0, top: 500, width: this.display_info.width, height: 760 }],
        fullScreenMode: false
      };
      await this.softKeyboardPanel.updatePanelRect(inputMethodEngine.PanelFlag.FLG_FLOATING, enhancedPanelRect);
      commonEventPublishData = {
        data: 'SUCCESS'
      };
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1400 updatePanelRectSync success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1400', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_1400 err.code:${err.code},err.message:${err.message}`);
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1400', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_1500(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_1500 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 0, top: 500, width: 400, height: 300 },
        portraitRect: { left: 0, top: 1500, width: 300, height: 1000 },
        landscapeAvoidY: 500,
        landscapeInputRegion: [{ left: 0, top: 500, width: this.display_info.height, height: 600 },
        { left: 0, top: 247, width: this.display_info.height, height: 150 }],
        portraitAvoidY: 1950,
        portraitInputRegion: [{ left: 0, top: 1960, width: this.display_info.width, height: 760 },
        { left: 0, top: 1695, width: this.display_info.width, height: 150 }],
        fullScreenMode: true
      };
      await this.softKeyboardPanel.updatePanelRect(inputMethodEngine.PanelFlag.FLAG_CANDIDATE, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1500 updatePanelRectSync success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1500', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_1500 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 12800017) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1500', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_1600(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_1600 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        portraitRect: { left: 0, top: 0, width: this.display_info.width, height: this.display_info.height * 0.5 },
        landscapeAvoidY: 500,
        landscapeInputRegion: [{ left: 0, top: 500, width: this.display_info.height, height: 600 },
        { left: 0, top: 247, width: this.display_info.height, height: 150 }],
        portraitAvoidY: 1960,
        portraitInputRegion: [{ left: 0, top: 1960, width: this.display_info.width, height: 760 },
        { left: 0, top: 1695, width: this.display_info.width, height: 150 }],
      };
      await this.softKeyboardPanel.updatePanelRect(inputMethodEngine.PanelFlag.FLG_FLOATING, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1600 updatePanelRectSync success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1600', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_1600 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1600', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_1700(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_1700 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: 100, height: 100 },
        portraitRect: { left: 100, top: 100, width: 100, height: 100 }
      };
      await this.softKeyboardPanel.updatePanelRect(undefined, keyboardRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1700 startAbility success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1700', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_1700 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1700', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_1800(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_1800 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.updatePanelRect(inputMethodEngine.PanelFlag.FLG_FLOATING, undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1800 startAbility success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1800', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_1800 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1800', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_1900(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_1900 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: 100, height: 100 },
        portraitRect: { left: 100, top: 100, width: 100, height: 100 }
      };
      await this.softKeyboardPanel.updatePanelRect(null, keyboardRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_1900 startAbility success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1900', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_1900 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_1900', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_2000(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_2000 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      await this.softKeyboardPanel.updatePanelRect(inputMethodEngine.PanelFlag.FLG_FLOATING, null);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2000 startAbility success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2000', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_2000 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2000', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_2100(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_2100 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 100, top: 100, width: 100, height: 100 },
        portraitRect: { left: 100, top: 100, width: 100, height: 100 },
        landscapeInputRegion: [{ left: 0, top: 100, width: 100, height: 100 }],
        portraitInputRegion: [{ left: 0, top: 100, width: 100, height: 100 }],
        fullScreenMode: false
      };
      await this.softKeyboardPanel.updatePanelRect(undefined, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2100 updatePanelRectSync success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2100', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_2100 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2100', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_2200(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_2200 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 100, top: 100, width: 100, height: 100 },
        portraitRect: { left: 100, top: 100, width: 100, height: 100 },
        landscapeInputRegion: [{ left: 0, top: 100, width: 100, height: 100 }],
        portraitInputRegion: [{ left: 0, top: 100, width: 100, height: 100 }],
        fullScreenMode: false
      };
      await this.softKeyboardPanel.updatePanelRect(null, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2200 updatePanelRectSync success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2200', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_2200 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2200', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_2300(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_2300 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: 100, height: 100 },
        portraitRect: { left: 100, top: 100, width: 100, height: 100 }
      };
      this.softKeyboardPanel.updatePanelRectSync(undefined, keyboardRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2300 startAbility success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2300', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_2300 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2300', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_2400(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_2400 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.updatePanelRectSync(inputMethodEngine.PanelFlag.FLG_FLOATING, undefined);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2400 startAbility success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2400', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_2400 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2400', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_2500(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_2500 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let keyboardRect: inputMethodEngine.PanelRect = {
        landscapeRect: { left: 100, top: 100, width: 100, height: 100 },
        portraitRect: { left: 100, top: 100, width: 100, height: 100 }
      };
      this.softKeyboardPanel.updatePanelRectSync(null, keyboardRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2500 startAbility success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2500', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_2500 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2500', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_2600(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_2600 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      this.softKeyboardPanel.updatePanelRectSync(inputMethodEngine.PanelFlag.FLG_FLOATING, null);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2600 startAbility success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2600', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_2600 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2600', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_2700(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_2700 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 100, top: 100, width: 100, height: 100 },
        portraitRect: { left: 100, top: 100, width: 100, height: 100 },
        landscapeInputRegion: [{ left: 0, top: 100, width: 100, height: 100 }],
        portraitInputRegion: [{ left: 0, top: 100, width: 100, height: 100 }],
        fullScreenMode: false
      };
      this.softKeyboardPanel.updatePanelRectSync(undefined, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2700 updatePanelRectSync success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2700', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_2700 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2700', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_2800(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_2800 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 100, top: 100, width: 100, height: 100 },
        portraitRect: { left: 100, top: 100, width: 100, height: 100 },
        landscapeInputRegion: [{ left: 0, top: 100, width: 100, height: 100 }],
        portraitInputRegion: [{ left: 0, top: 100, width: 100, height: 100 }],
        fullScreenMode: false
      };
      this.softKeyboardPanel.updatePanelRectSync(null, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2800 updatePanelRectSync success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2800', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_2800 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2800', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_2900(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_2900 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 100, top: 100, width: 100, height: 100 },
        portraitRect: { left: 100, top: 100, width: 100, height: 100 },
        landscapeInputRegion: [],
        portraitInputRegion: [],
        fullScreenMode: false
      };
      await this.softKeyboardPanel.updatePanelRect(inputMethodEngine.PanelFlag.FLG_FLOATING, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_2900 updatePanelRectSync success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2900', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_2900 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_2900', commonEventPublishData, this.publishCallback);
    };
  }

  private async Sub_InputMethod_IME_updatePanelRectSync_3000(): Promise<void> {
    console.info(TAG + '====>receive Sub_InputMethod_IME_updatePanelRectSync_3000 data');
    let commonEventPublishData = {
      data: 'FAILED'
    };
    try {
      let enhancedPanelRect: inputMethodEngine.EnhancedPanelRect = {
        landscapeRect: { left: 100, top: 100, width: 100, height: 100 },
        portraitRect: { left: 100, top: 100, width: 100, height: 100 },
        landscapeInputRegion: [],
        portraitInputRegion: [],
        fullScreenMode: false
      };
      this.softKeyboardPanel.updatePanelRectSync(inputMethodEngine.PanelFlag.FLG_FLOATING, enhancedPanelRect);
      console.info(TAG + '====>Sub_InputMethod_IME_updatePanelRectSync_3000 updatePanelRectSync success');
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_3000', commonEventPublishData, this.publishCallback);
    } catch (err) {
      console.info(TAG + `====>Sub_InputMethod_IME_updatePanelRectSync_3000 err.code:${err.code},err.message:${err.message}`);
      if (err.code === 401) {
        commonEventPublishData = {
          data: 'SUCCESS'
        };
      }
      commoneventmanager.publish('Sub_InputMethod_IME_updatePanelRectSync_3000', commonEventPublishData, this.publishCallback);
    };
  }

}