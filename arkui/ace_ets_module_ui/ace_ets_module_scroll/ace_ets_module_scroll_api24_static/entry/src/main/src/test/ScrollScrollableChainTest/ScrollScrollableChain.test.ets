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

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const PAGE = 'MainAbility/pages/scrollScrollableChain/scrollScrollableChain';
const TITLE_ID = 'scrollCh_title';
const SLEEP_TIME = 500;
const SUITE = 'ScrollScrollableChainTest';
function arkuiNewLog(suite: string, phase: string, detail: string): void {
  console.info('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function arkuiNewErr(suite: string, phase: string, detail: string): void {
  console.error('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}


export default function ScrollScrollableChainTest() {
  describe('ScrollScrollableChainTest', () => {
    beforeAll(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeAll', 'start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.api24.static', 'EntryAbility');
      arkuiNewLog(SUITE, 'beforeAll', 'end');
    });

    beforeEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeEach', 'start');
      AppStorage.delete('scrollCh_contentSize');
      AppStorage.delete('scrollCh_wire');
      AppStorage.delete('scrollCh_canOverScroll_ok');
      const options: router.RouterOptions = {
        url: PAGE,
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await Utils.sleep(600);
      } catch (err) {
        arkuiNewErr(SUITE, 'beforeEach', 'replaceUrl error: ' + err);
        expect().assertFail();
      }

      arkuiNewLog(SUITE, 'beforeEach', 'end');
    });

    afterEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'afterEach', 'start');

      AppStorage.delete('scrollCh_contentSize');
      AppStorage.delete('scrollCh_wire');
      await Utils.sleep(SLEEP_TIME);
      arkuiNewLog(SUITE, 'afterEach', 'end');
    });

    /**
     * @tc.number ScrollScrollableChainTest_001
     * @tc.name scrollCh_pageLoads
     * @tc.desc Test scrollScrollableChain page: route loads and title node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scrollCh_pageLoads', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        expect(!!await Driver.create().findComponent(ON.id(TITLE_ID))).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ScrollScrollableChainTest_002
     * @tc.name scroller_contentSize_after_mount
     * @tc.desc Test aboutToAppear: writes AppStorage scrollCh_contentSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scroller_contentSize_after_mount', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const sz = AppStorage.get<string>('scrollCh_contentSize');
        if(sz){
          expect(!!(sz != undefined && sz.length > 0)).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ScrollScrollableChainTest_003
     * @tc.name wire_getScrollEvent_flag
     * @tc.desc Test UIScrollEvent wiring and Scroller.scrollTo with canOverScroll; AppStorage scrollCh_wire and scrollCh_canOverScroll_ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('wire_getScrollEvent_flag', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        const wire = await driver.findComponent(ON.id('scrollCh_wire'));
        expect(!!wire).assertTrue();
        await (wire?.click() as Promise<void>);
        await Utils.sleep(400);
        expect(AppStorage.get<boolean>('scrollCh_wire')).assertEqual(true);
        expect(AppStorage.get<boolean>('scrollCh_canOverScroll_ok')).assertEqual(true);
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ScrollScrollableChainTest_004
     * @tc.name inspector_scrollCh_body
     * @tc.desc Test inspector.getInspectorByKey: node scrollCh_body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('inspector_scrollCh_body', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('scrollCh_body')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ScrollScrollableChainTest_005
     * @tc.name inspector_scrollCh_wire_btn
     * @tc.desc Test inspector.getInspectorByKey: node scrollCh_wire
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('inspector_scrollCh_wire_btn', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('scrollCh_wire')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });
  });
}
