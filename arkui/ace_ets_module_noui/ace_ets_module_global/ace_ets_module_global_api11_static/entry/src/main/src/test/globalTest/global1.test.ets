/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils'
import RectValue from '../../../ets/MainAbility/common/Rect';
import { IntentionCode } from '@ohos.multimodalInput.intentionCode'
import { KeyEvent, MouseEvent, SourceTool, KeyType, KeySource , SourceType, MouseButton, MouseAction } from '@ohos.arkui.component'
import { sendKeyEvent, sendMouseEvent } from "@kit.ArkUI";

export default function globalJsunit1() {
  describe('globalJsunit1', () => {
    beforeAll(() => {
      console.info("globalJsunit1 beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.global.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("globalJsunit1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/global/global1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get globalJsunit1 state pages:" + JSON.stringify(pages));
        if (!("global1" == pages.name)) {
          console.info("get globalJsunit1 pages.name:" + JSON.stringify(pages.name));
          
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push globalJsunit1 page error:" + err);
      }
      console.info("globalJsunit1 beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(1000);
    });
    

    

/*
     * @tc.number   testglobal_getInspectorTree_static_0001
     * @tc.name     testglobal_getInspectorTree_static_0001
     * @tc.desc     testglobal_getInspectorTree_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testglobal_getInspectorTree_static_0001', Level.LEVEL0, async () => {
      console.info('testglobal_getInspectorTree_static_0001 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorTree();
      console.info("[testglobal_getInspectorTree_static_0001] strJson:" + strJson);
      expect(strJson !== null).assertTrue();
    });
    

    

/*
     * @tc.number   testglobal_sendKeyEvent_static_0002
     * @tc.name     testglobal_sendKeyEvent_static_0002
     * @tc.desc     testglobal_sendKeyEvent_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testglobal_sendKeyEvent_static_0002', Level.LEVEL0, async () => {
      console.info('testglobal_sendKeyEvent_static_0002 START');
      await Utils.sleep(2000);
      let KeyEvent: KeyEvent = {
        
        type: KeyType.Down,  
        keyCode: 2027,
        keyText: "Unknown",
        
        keySource: KeySource.Unknown,  
        deviceId: 7,
        metaKey: 0,
        timestamp: 5284417765376,
        intentionCode: IntentionCode.INTENTION_UNKNOWN,  
        
        stopPropagation: () => {
        },
        getModifierKeyState: (keys: Array<string>): boolean => {
          console.info("the key 0 is :" + keys[0]);
          return true;
        }
      };
      let result = sendKeyEvent(KeyEvent);
      console.info("[testglobal_sendKeyEvent_static_0002] result:" + result);
      expect(JSON.stringify(result)).assertEqual("true");
    });
    

    

/*
     * @tc.number   testglobal_sendMouseEvent_static_0003
     * @tc.name     testglobal_sendMouseEvent_static_0003
     * @tc.desc     testglobal_sendMouseEvent_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testglobal_sendMouseEvent_static_0003', Level.LEVEL0, async () => {
      console.info('testglobal_sendMouseEvent_static_0003 START');
      await Utils.sleep(2000);
      let rect: RectValue = Utils.getComponentRect('ListItem');
      let mouseEvent: MouseEvent = {
        button: MouseButton.Left, 
        action: MouseAction.Release,  
        
        
        
        
        windowX: rect.left + (rect.right - rect.left) / 2, 
        windowY: rect.left + (rect.right - rect.left) / 2, 
        displayX: rect.left + (rect.right - rect.left) / 2, 
        displayY: rect.left + (rect.right - rect.left) / 2, 
        x: 34,
        y: 34,
        
        
        timestamp: 8261302454000,
        target: {
          area: {
            width: 142.66666666666666,
            height: 58.666666666666664,
            position: {
              x: 158.66666666666666,
              y: 58.666666666666664,
            },
            globalPosition: {
              x: 168.66666666666666,
              y: 68.66666666666666,
            }
          }
        },
        source: SourceType.Unknown,
        pressure: 1,
        tiltX: 1,
        tiltY: 1,
        sourceTool: SourceTool.Unknown,
        stopPropagation: () => {
        },
        getModifierKeyState: (keys: Array<string>): boolean => {
          console.info("the key 0 is :" + keys[0]);
          return true;
        }
      }
      let result = sendMouseEvent(mouseEvent);
      console.info("[testglobal_sendMouseEvent_static_0003] result:" + result);
      expect(JSON.stringify(result)).assertEqual("true");
    });
  })
}