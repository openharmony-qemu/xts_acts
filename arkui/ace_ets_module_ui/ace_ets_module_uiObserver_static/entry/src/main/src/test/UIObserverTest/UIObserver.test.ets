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

export default function UIObserverTest() {
  describe('UIObserverTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.uiObserver.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest beforeEach start');
      let options: router.RouterOptions = { url: 'MainAbility/pages/UIObserver/UIObserverIndex' };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('[ARKUI_NEW] UIObserverTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== "UIObserverIndex") { routerInstance.replaceUrl(options); }
        await Utils.sleep(500);
      } catch (err) { console.error('[ARKUI_NEW] UIObserverTest replaceUrl error: ' + err); expect().assertFail(); }
    });

    afterEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest afterEach start');
      await Utils.sleep(SLEEP_TIME);
      console.info('[ARKUI_NEW] UIObserverTest afterEach end');
    });

    /**
     * @tc.number UIObserverTest_001
     * @tc.name nodeRenderStateAboutToRenderIn
     * @tc.desc Test NodeRenderState.ABOUT_TO_RENDER_IN enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nodeRenderStateAboutToRenderIn', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest execute: nodeRenderStateAboutToRenderIn START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('nodeRenderStateValues');
        console.info('[ARKUI_NEW] nodeRenderStateAboutToRenderIn val = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val!.indexOf('IN=0') >= 0).assertTrue();
        done();
      } catch (error) { console.error('[ARKUI_NEW] nodeRenderStateAboutToRenderIn error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number UIObserverTest_002
     * @tc.name nodeRenderStateAboutToRenderOut
     * @tc.desc Test NodeRenderState.ABOUT_TO_RENDER_OUT enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nodeRenderStateAboutToRenderOut', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest execute: nodeRenderStateAboutToRenderOut START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('nodeRenderStateValues');
        console.info('[ARKUI_NEW] nodeRenderStateAboutToRenderOut val = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val!.indexOf('OUT=1') >= 0).assertTrue();
        done();
      } catch (error) { console.error('[ARKUI_NEW] nodeRenderStateAboutToRenderOut error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number UIObserverTest_003
     * @tc.name uiObserverPageRenders
     * @tc.desc Verify UIObserver page renders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('uiObserverPageRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest execute: uiObserverPageRenders START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('uiObserverRoot');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        done();
      } catch (error) { console.error('[ARKUI_NEW] uiObserverPageRenders error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number UIObserverTest_004
     * @tc.name uiObserverListRendered
     * @tc.desc Verify List component in UIObserver page renders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('uiObserverListRendered', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest execute: uiObserverListRendered START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('observedList');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        done();
      } catch (error) { console.error('[ARKUI_NEW] uiObserverListRendered error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number UIObserverTest_005
     * @tc.name uiObserverInstanceCreated
     * @tc.desc Verify UIObserver was obtained via getUIObserver in page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('uiObserverInstanceCreated', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest execute: uiObserverInstanceCreated START');
      try {
        await CommonFunc.sleep(SLEEP_TIME + 500);
        let val = AppStorage.get<string>('uiObserverExists');
        console.info('[ARKUI_NEW] uiObserverExists = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val).assertEqual('true');
        done();
      } catch (error) { console.error('[ARKUI_NEW] uiObserverInstanceCreated error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number UIObserverTest_006
     * @tc.name nodeRenderStateValuesFromPage
     * @tc.desc Verify NodeRenderState values stored by page in AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nodeRenderStateValuesFromPage', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest execute: nodeRenderStateValuesFromPage START');
      try {
        await CommonFunc.sleep(SLEEP_TIME + 500);
        let val = AppStorage.get<string>('nodeRenderStateValues');
        console.info('[ARKUI_NEW] nodeRenderStateValues = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val!.indexOf('IN=') >= 0).assertTrue();
        expect(val!.indexOf('OUT=') >= 0).assertTrue();
        done();
      } catch (error) { console.error('[ARKUI_NEW] nodeRenderStateValuesFromPage error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number UIObserverTest_007
     * @tc.name onNodeRenderStateRegistered
     * @tc.desc Verify onNodeRenderState was called in page onPageShow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('onNodeRenderStateRegistered', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest execute: onNodeRenderStateRegistered START');
      try {
        await CommonFunc.sleep(SLEEP_TIME + 500);
        let val = AppStorage.get<string>('onNodeRenderStateRegistered');
        console.info('[ARKUI_NEW] onNodeRenderStateRegistered = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val).assertEqual('true');
        done();
      } catch (error) { console.error('[ARKUI_NEW] onNodeRenderStateRegistered error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number UIObserverTest_008
     * @tc.name offNodeRenderStateCalled
     * @tc.desc Verify offNodeRenderState was called after timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('offNodeRenderStateCalled', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest execute: offNodeRenderStateCalled START');
      try {
        await CommonFunc.sleep(3000);
        let val = AppStorage.get<string>('offNodeRenderStateCalled');
        console.info('[ARKUI_NEW] offNodeRenderStateCalled = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val).assertEqual('true');
        done();
      } catch (error) { console.error('[ARKUI_NEW] offNodeRenderStateCalled error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number UIObserverTest_009
     * @tc.name observedTargetRendered
     * @tc.desc Verify observedTarget Text component renders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('observedTargetRendered', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] UIObserverTest execute: observedTargetRendered START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('observedTarget');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        done();
      } catch (error) { console.error('[ARKUI_NEW] observedTargetRendered error:' + error); expect().assertFail(); done(); }
    });
  });
}
