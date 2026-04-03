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

    it('typeNodePageRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('typeNodeRoot'));
        expect(node != null && node != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_getListAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getListAttribute');
        console.info('[ARKUI_NEW] tn_getListAttribute = ' + val);
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_getListEvent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getListEvent');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_bindListController', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_bindListController');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_getListItemAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getListItemAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_getListItemGroupAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getListItemGroupAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_getScrollAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getScrollAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_getScrollEvent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getScrollEvent');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_bindScrollController', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_bindScrollController');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_getGridAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getGridAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_getGridEvent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getGridEvent');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_bindGridController', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_bindGridController');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_getGridItemAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getGridItemAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_getWaterFlowAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getWaterFlowAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_getWaterFlowEvent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getWaterFlowEvent');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_bindWaterFlowController', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_bindWaterFlowController');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_getFlowItemAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getFlowItemAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_getTextAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getTextAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_bindTextController', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_bindTextController');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_getTextInputAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getTextInputAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_bindTextInputController', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_bindTextInputController');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_getTextAreaAttribute', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_getTextAreaAttribute');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_bindTextAreaController', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_bindTextAreaController');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('tn_bindSwiperController', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('tn_bindSwiperController');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('fn_addSupportedUIStates', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('fn_addSupportedUIStates');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('fn_removeSupportedUIStates', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('fn_removeSupportedUIStates');
        expect(val).assertEqual('called');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('fn_getInteractionEventBindingInfo', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('fn_getInteractionEventBindingInfo');
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

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
