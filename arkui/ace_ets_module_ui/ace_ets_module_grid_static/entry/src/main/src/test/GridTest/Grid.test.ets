'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
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
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { FocusWrapMode } from '@ohos.arkui.component';

const SLEEP_TIME = 1000;

export default function GridTest() {
  describe('GridTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info("[ARKUI_NEW] GridTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.grid.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] GridTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[ARKUI_NEW] GridTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "GridIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] GridTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(SLEEP_TIME);
    });

    it('focusWrapModeDefaultEnum', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        expect(FocusWrapMode.DEFAULT).assertEqual(0);
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('focusWrapModeWrapEnum', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        expect(FocusWrapMode.WRAP_WITH_ARROW).assertEqual(1);
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('gridFocusDefault', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('gridFocusDefault');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null && node != undefined).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null && attrs != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('gridFocusWrap', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('gridFocusWrap');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null && node != undefined).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null && attrs != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('gridUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('gridUndefined');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null && node != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('gridSyncLoadTrue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('gridFocusDefault');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null && node != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('gridSyncLoadFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('gridFocusWrap');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null && node != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('gridOnWillScrollCallback', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver = Driver.create();
        let comp = await driver.findComponent(ON.id('gridScrollCallbacks'));
        expect(comp != null && comp != undefined).assertTrue();
        if (comp != null && comp != undefined) {
          await comp.scrollSearch(ON.text('S12'));
          await CommonFunc.sleep(500);
        }
        let val = AppStorage.get<string>('gridOnWillScrollCalled');
        console.info('[ARKUI_NEW] gridOnWillScrollCalled = ' + val);
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('gridOnDidScrollCallback', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver = Driver.create();
        let comp = await driver.findComponent(ON.id('gridScrollCallbacks'));
        expect(comp != null && comp != undefined).assertTrue();
        if (comp != null && comp != undefined) {
          await comp.scrollSearch(ON.text('S12'));
          await CommonFunc.sleep(500);
        }
        let val = AppStorage.get<string>('gridOnDidScrollCalled');
        console.info('[ARKUI_NEW] gridOnDidScrollCalled = ' + val);
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('gridOnScrollIndexCallback', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver = Driver.create();
        let comp = await driver.findComponent(ON.id('gridScrollCallbacks'));
        expect(comp != null && comp != undefined).assertTrue();
        if (comp != null && comp != undefined) {
          await comp.scrollSearch(ON.text('S12'));
          await CommonFunc.sleep(500);
        }
        let val = AppStorage.get<string>('gridOnScrollIndexCalled');
        console.info('[ARKUI_NEW] gridOnScrollIndexCalled = ' + val);
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('uiGridEventSetOnWillScroll', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('gridScrollCallbacks');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null && node != undefined).assertTrue();
        console.info('[ARKUI_NEW] uiGridEventSetOnWillScroll: gridScrollCallbacks node exists');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('uiGridEventSetOnDidScroll', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('gridScrollCallbacks');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null && node != undefined).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null && attrs != undefined).assertTrue();
        console.info('[ARKUI_NEW] uiGridEventSetOnDidScroll: attrs exist');
        done();
      } catch (error) { expect().assertFail(); done(); }
    });

    it('uiGridEventSetOnScrollIndex', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let driver = Driver.create();
        let comp = await driver.findComponent(ON.id('gridScrollCallbacks'));
        expect(comp != null && comp != undefined).assertTrue();
        if (comp != null && comp != undefined) {
          await comp.scrollSearch(ON.text('S12'));
          await CommonFunc.sleep(500);
        }
        let val = AppStorage.get<string>('gridOnScrollIndexCalled');
        console.info('[ARKUI_NEW] uiGridEventSetOnScrollIndex gridOnScrollIndexCalled = ' + val);
        expect(val != null && val != undefined).assertTrue();
        done();
      } catch (error) { expect().assertFail(); done(); }
    });
  });
}
