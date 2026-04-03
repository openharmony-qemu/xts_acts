'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function TypeNodeTest() {
  describe('TypeNodeTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] TypeNodeTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.frameNode.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = { url: 'MainAbility/pages/FrameNode/TypeNodeIndex' };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (pages.name !== "TypeNodeIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('[ARKUI_NEW] TypeNodeTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(SLEEP_TIME);
    });

    /**
     * @tc.number TypeNodeTest_001
     * @tc.name typeNodePageRenders
     * @tc.desc Verify TypeNode test page renders with root node visible in inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('typeNodePageRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('typeNodeRoot'));
        expect(node != null && node != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_002
     * @tc.name tn_getListAttribute
     * @tc.desc Verify TypedFrameNode.getListAttribute returns valid result stored in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_getListAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getListAttribute');
        console.info('[ARKUI_NEW] tn_getListAttribute = ' + val);
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_003
     * @tc.name tn_getListEvent
     * @tc.desc Verify TypedFrameNode.getListEvent returns valid result stored in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_getListEvent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getListEvent');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_004
     * @tc.name tn_bindListController
     * @tc.desc Verify TypedFrameNode.bindListController was called successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_bindListController', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_bindListController');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_005
     * @tc.name tn_getListItemAttribute
     * @tc.desc Verify TypedFrameNode.getListItemAttribute returns valid result stored in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_getListItemAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getListItemAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_006
     * @tc.name tn_getListItemGroupAttribute
     * @tc.desc Verify TypedFrameNode.getListItemGroupAttribute returns valid result stored in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_getListItemGroupAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getListItemGroupAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_007
     * @tc.name tn_getScrollAttribute
     * @tc.desc Verify TypedFrameNode.getScrollAttribute returns valid result stored in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_getScrollAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getScrollAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_008
     * @tc.name tn_getScrollEvent
     * @tc.desc Verify TypedFrameNode.getScrollEvent returns valid result stored in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_getScrollEvent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getScrollEvent');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_009
     * @tc.name tn_bindScrollController
     * @tc.desc Verify TypedFrameNode.bindScrollController was called successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_bindScrollController', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_bindScrollController');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_010
     * @tc.name tn_getGridAttribute
     * @tc.desc Verify TypedFrameNode.getGridAttribute returns valid result stored in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_getGridAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getGridAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_011
     * @tc.name tn_getGridEvent
     * @tc.desc Verify TypedFrameNode.getGridEvent returns valid result stored in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_getGridEvent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getGridEvent');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_012
     * @tc.name tn_bindGridController
     * @tc.desc Verify TypedFrameNode.bindGridController was called successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_bindGridController', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_bindGridController');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_013
     * @tc.name tn_getGridItemAttribute
     * @tc.desc Verify TypedFrameNode.getGridItemAttribute returns valid result stored in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_getGridItemAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getGridItemAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_014
     * @tc.name tn_getWaterFlowAttribute
     * @tc.desc Verify TypedFrameNode.getWaterFlowAttribute returns valid result stored in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_getWaterFlowAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getWaterFlowAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_015
     * @tc.name tn_getWaterFlowEvent
     * @tc.desc Verify TypedFrameNode.getWaterFlowEvent returns valid result stored in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_getWaterFlowEvent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getWaterFlowEvent');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_016
     * @tc.name tn_bindWaterFlowController
     * @tc.desc Verify TypedFrameNode.bindWaterFlowController was called successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_bindWaterFlowController', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_bindWaterFlowController');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_017
     * @tc.name tn_getFlowItemAttribute
     * @tc.desc Verify TypedFrameNode.getFlowItemAttribute returns valid result stored in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_getFlowItemAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getFlowItemAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_018
     * @tc.name tn_getTextAttribute
     * @tc.desc Verify TypedFrameNode.getTextAttribute returns valid result stored in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_getTextAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getTextAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_019
     * @tc.name tn_bindTextController
     * @tc.desc Verify TypedFrameNode.bindTextController was called successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_bindTextController', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_bindTextController');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_020
     * @tc.name tn_getTextInputAttribute
     * @tc.desc Verify TypedFrameNode.getTextInputAttribute returns valid result stored in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_getTextInputAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getTextInputAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_021
     * @tc.name tn_bindTextInputController
     * @tc.desc Verify TypedFrameNode.bindTextInputController was called successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_bindTextInputController', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_bindTextInputController');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_022
     * @tc.name tn_getTextAreaAttribute
     * @tc.desc Verify TypedFrameNode.getTextAreaAttribute returns valid result stored in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_getTextAreaAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getTextAreaAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_023
     * @tc.name tn_bindTextAreaController
     * @tc.desc Verify TypedFrameNode.bindTextAreaController was called successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_bindTextAreaController', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_bindTextAreaController');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_024
     * @tc.name tn_bindSwiperController
     * @tc.desc Verify TypedFrameNode.bindSwiperController was called successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tn_bindSwiperController', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_bindSwiperController');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_025
     * @tc.name fn_addSupportedUIStates
     * @tc.desc Verify FrameNode.addSupportedUIStates was called successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('fn_addSupportedUIStates', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('fn_addSupportedUIStates');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_026
     * @tc.name fn_removeSupportedUIStates
     * @tc.desc Verify FrameNode.removeSupportedUIStates was called successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('fn_removeSupportedUIStates', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('fn_removeSupportedUIStates');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_027
     * @tc.name fn_getInteractionEventBindingInfo
     * @tc.desc Verify FrameNode.getInteractionEventBindingInfo returns valid result stored in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('fn_getInteractionEventBindingInfo', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('fn_getInteractionEventBindingInfo');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    /**
     * @tc.number TypeNodeTest_028
     * @tc.name fn_interactionEventFields
     * @tc.desc Verify InteractionEventBindingInfo fields (base/node/native/builtIn) stored in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('fn_interactionEventFields', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let base = AppStorage.get<string>('fn_baseEventRegistered');
        let node = AppStorage.get<string>('fn_nodeEventRegistered');
        let native1 = AppStorage.get<string>('fn_nativeEventRegistered');
        let builtIn = AppStorage.get<string>('fn_builtInEventRegistered');
        console.info('[ARKUI_NEW] base=' + base + ' node=' + node + ' native=' + native1 + ' builtIn=' + builtIn);
        expect(base != null && base != undefined).assertTrue();
        expect(node != null && node != undefined).assertTrue();
        expect(native1 != null && native1 != undefined).assertTrue();
        expect(builtIn != null && builtIn != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });
  });
}
