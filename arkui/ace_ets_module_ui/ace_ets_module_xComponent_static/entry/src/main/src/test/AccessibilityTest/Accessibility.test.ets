'use static'
/**
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
 
 
 
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
 
const SLEEP_TIME = 1000;
const PAGE = 'MainAbility/pages/accessibility/AccessibilityTest';
 
export default function AccessibilityTest() {
  describe('AccessibilityTest', () => {
    
    beforeAll(async (): Promise<void> => {
      console.info('AccessibilityTest beforeAll start');
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.xComponent.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });
 
    beforeEach(async (): Promise<void> => {
      console.info('AccessibilityTest beforeEach start');
      let options: router.RouterOptions = {
        url: PAGE,
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('AccessibilityTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'AccessibilityTest') {
          routerInstance.replaceUrl(options);
        }
        await CommonFunc.sleep(SLEEP_TIME);
      } catch (err) {
        console.error('AccessibilityTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });
 
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(200);
    });
 
    afterAll(async (): Promise<void> => {
      console.info('AccessibilityTest beforeAll end');
    });
      
    /**
    * @tc.number SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_NO_PARAM_0100
    * @tc.name SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_NO_PARAM_0100
    * @tc.desc Test accessibilityNextFocusId without second parameter (API 26+)
    * @tc.type FUNCTION
    * @tc.size SMALLTEST
    * @tc.level LEVEL0
    */
    it('SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_NO_PARAM_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
    console.info('[SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_NO_PARAM_0100] START');
    try {
        await CommonFunc.sleep(SLEEP_TIME);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('text_nextFocusId_noParam'));
        console.info('[SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_NO_PARAM_0100] component exists');
        expect(obj !== null).assertTrue();
        done();
    } catch (error) {
        console.error('[SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_NO_PARAM_0100] error: ' + error);
        expect().assertFail();
        done();
    }
    });

    /**
    * @tc.number SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_UNDEFINED_0200
    * @tc.name SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_UNDEFINED_0200
    * @tc.desc Test accessibilityNextFocusId with undefined second parameter (API 26+)
    * @tc.type FUNCTION
    * @tc.size SMALLTEST
    * @tc.level LEVEL0
    */
    it('SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_UNDEFINED_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
    console.info('[SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_UNDEFINED_0200] START');
    try {
        await CommonFunc.sleep(SLEEP_TIME);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('text_nextFocusId_undefined'));
        console.info('[SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_UNDEFINED_0200] component exists');
        expect(obj !== null).assertTrue();
        done();
    } catch (error) {
        console.error('[SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_UNDEFINED_0200] error: ' + error);
        expect().assertFail();
        done();
    }
    });

    /**
    * @tc.number SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_FALSE_0300
    * @tc.name SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_FALSE_0300
    * @tc.desc Test accessibilityNextFocusId with isConsiderDescendants: false (API 26+)
    * @tc.type FUNCTION
    * @tc.size SMALLTEST
    * @tc.level LEVEL0
    */
    it('SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_FALSE_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
    console.info('[SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_FALSE_0300] START');
    try {
        await CommonFunc.sleep(SLEEP_TIME);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('text_nextFocusId_false'));
        console.info('[SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_FALSE_0300] component exists');
        expect(obj !== null).assertTrue();
        done();
    } catch (error) {
        console.error('[SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_FALSE_0300] error: ' + error);
        expect().assertFail();
        done();
    }
    });

    /**
    * @tc.number SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_TRUE_0400
    * @tc.name SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_TRUE_0400
    * @tc.desc Test accessibilityNextFocusId with isConsiderDescendants: true (API 26+)
    * @tc.type FUNCTION
    * @tc.size SMALLTEST
    * @tc.level LEVEL0
    */
    it('SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_TRUE_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
    console.info('[SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_TRUE_0400] START');
    try {
        await CommonFunc.sleep(SLEEP_TIME);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('text_nextFocusId_true'));
        console.info('[SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_TRUE_0400] component exists');
        expect(obj !== null).assertTrue();
        done();
    } catch (error) {
        console.error('[SUB_ARKUI_ACCESSIBILITY_NEXT_FOCUS_ID_TRUE_0400] error: ' + error);
        expect().assertFail();
        done();
    }
    });
    
    /**
    * @tc.number SUB_ARKUI_ACCESSIBILITY_CUSTOM_ACTIONS_VALID_0100
    * @tc.name SUB_ARKUI_ACCESSIBILITY_CUSTOM_ACTIONS_VALID_0100
    * @tc.desc Test accessibilityCustomActions with valid array parameter (API 26.0.0)
    * @tc.type FUNCTION
    * @tc.size SMALLTEST
    * @tc.level LEVEL0
    */
    it('SUB_ARKUI_ACCESSIBILITY_CUSTOM_ACTIONS_VALID_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
    console.info('[SUB_ARKUI_ACCESSIBILITY_CUSTOM_ACTIONS_VALID_0100] START');
    try {
        await CommonFunc.sleep(SLEEP_TIME);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('text_customActions_valid'));
        console.info('[SUB_ARKUI_ACCESSIBILITY_CUSTOM_ACTIONS_VALID_0100] component exists');
        expect(obj !== null).assertTrue();
        done();
    } catch (error) {
        console.error('[SUB_ARKUI_ACCESSIBILITY_CUSTOM_ACTIONS_VALID_0100] error: ' + error);
        expect().assertFail();
        done();
    }
    });

    /**
    * @tc.number SUB_ARKUI_ACCESSIBILITY_CUSTOM_ACTIONS_UNDEFINED_0200
    * @tc.name SUB_ARKUI_ACCESSIBILITY_CUSTOM_ACTIONS_UNDEFINED_0200
    * @tc.desc Test accessibilityCustomActions with undefined parameter (API 26.0.0)
    * @tc.type FUNCTION
    * @tc.size SMALLTEST
    * @tc.level LEVEL0
    */
    it('SUB_ARKUI_ACCESSIBILITY_CUSTOM_ACTIONS_UNDEFINED_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
    console.info('[SUB_ARKUI_ACCESSIBILITY_CUSTOM_ACTIONS_UNDEFINED_0200] START');
    try {
        await CommonFunc.sleep(SLEEP_TIME);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('text_customActions_undefined'));
        console.info('[SUB_ARKUI_ACCESSIBILITY_CUSTOM_ACTIONS_UNDEFINED_0200] component exists');
        expect(obj !== null).assertTrue();
        done();
    } catch (error) {
        console.error('[SUB_ARKUI_ACCESSIBILITY_CUSTOM_ACTIONS_UNDEFINED_0200] error: ' + error);
        expect().assertFail();
        done();
    }
    });

    /**
    * @tc.number SUB_ARKUI_ACCESSIBILITY_CUSTOM_ACTIONS_EMPTY_0300
    * @tc.name SUB_ARKUI_ACCESSIBILITY_CUSTOM_ACTIONS_EMPTY_0300
    * @tc.desc Test accessibilityCustomActions with empty array parameter (API 26.0.0)
    * @tc.type FUNCTION
    * @tc.size SMALLTEST
    * @tc.level LEVEL0
    */
    it('SUB_ARKUI_ACCESSIBILITY_CUSTOM_ACTIONS_EMPTY_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
    console.info('[SUB_ARKUI_ACCESSIBILITY_CUSTOM_ACTIONS_EMPTY_0300] START');
    try {
        await CommonFunc.sleep(SLEEP_TIME);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('text_customActions_empty'));
        console.info('[SUB_ARKUI_ACCESSIBILITY_CUSTOM_ACTIONS_EMPTY_0300] component exists');
        expect(obj !== null).assertTrue();
        done();
    } catch (error) {
        console.error('[SUB_ARKUI_ACCESSIBILITY_CUSTOM_ACTIONS_EMPTY_0300] error: ' + error);
        expect().assertFail();
        done();
    }
    });
  });
}