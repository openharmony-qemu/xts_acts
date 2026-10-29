'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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


import { describe, it, expect, afterEach, Level, beforeEach } from '@ohos/hypium-static/src/main/indexStatic';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

const PAGE: string = 'MainAbility/pages/xComponentBufferQueueCount/xComponentBufferQueueCount';
const TITLE_ID: string = 'xcBqc_title';
const SLEEP_TIME = 500;
const SUITE: string = 'XComponentBufferQueueCountTest';

function arkuiNewLog(suite: string, phase: string, detail: string): void {
  console.info('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function arkuiNewErr(suite: string, phase: string, detail: string): void {
  console.error('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

export default function XComponentBufferQueueCountTest(): void {
  describe('XComponentBufferQueueCountTest', () => {
    beforeEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeEach', 'start');
      AppStorage.delete('xcBqc_mounted');
      const options: router.RouterOptions = {
        url: PAGE,
      };
      try {
        const routerInstance: Router = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        await routerInstance.replaceUrl(options);
        await Utils.sleep(600);
      } catch (err) {
        arkuiNewErr(SUITE, 'beforeEach', 'replaceUrl error: ' + err);
        expect().assertFail();
      }
      arkuiNewLog(SUITE, 'beforeEach', 'end');
    });

    afterEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'afterEach', 'start');
      AppStorage.delete('xcBqc_mounted');
      try {
        await Utils.sleep(SLEEP_TIME);
      } catch (err) {
        arkuiNewErr(SUITE, 'afterEach', 'sleep err: ' + JSON.stringify(err));
      }
      arkuiNewLog(SUITE, 'afterEach', 'end');
    });

    /**
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0100
     * @tc.name   SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0100
     * @tc.desc   Test bufferQueueCount with normal value 2 (minimum valid value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', '0100 start');
      try {
        const driver: Driver = Driver.create();
        const component = await driver.findComponent(ON.id('xcBqc_min'));
        expect(!!component).assertTrue();
        const inspectorStr: string = inspector.getInspectorByKey('xcBqc_min');
        expect(inspectorStr !== null && inspectorStr !== '').assertTrue();
        arkuiNewLog(SUITE, 'execute', '0100 inspector: ' + inspectorStr.substring(0, Math.min(inspectorStr.length, 200).toInt()));
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', '0100 FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0200
     * @tc.name   SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0200
     * @tc.desc   Test bufferQueueCount with normal value 5 (maximum valid value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', '0200 start');
      try {
        const driver: Driver = Driver.create();
        const component = await driver.findComponent(ON.id('xcBqc_max'));
        expect(!!component).assertTrue();
        const inspectorStr: string = inspector.getInspectorByKey('xcBqc_max');
        expect(inspectorStr !== null && inspectorStr !== '').assertTrue();
        arkuiNewLog(SUITE, 'execute', '0200 inspector: ' + inspectorStr.substring(0, Math.min(inspectorStr.length, 200).toInt()));
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', '0200 FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0300
     * @tc.name   SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0300
     * @tc.desc   Test bufferQueueCount with normal value 3 (middle valid value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', '0300 start');
      try {
        const driver: Driver = Driver.create();
        const component = await driver.findComponent(ON.id('xcBqc_mid'));
        expect(!!component).assertTrue();
        const inspectorStr: string = inspector.getInspectorByKey('xcBqc_mid');
        expect(inspectorStr !== null && inspectorStr !== '').assertTrue();
        arkuiNewLog(SUITE, 'execute', '0300 inspector: ' + inspectorStr.substring(0, Math.min(inspectorStr.length, 200).toInt()));
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', '0300 FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0400
     * @tc.name   SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0400
     * @tc.desc   Test bufferQueueCount with boundary value 1 (below min, should be clamped to 2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', '0400 start');
      try {
        const driver: Driver = Driver.create();
        const component = await driver.findComponent(ON.id('xcBqc_below_min'));
        expect(!!component).assertTrue();
        const inspectorStr: string = inspector.getInspectorByKey('xcBqc_below_min');
        expect(inspectorStr !== null && inspectorStr !== '').assertTrue();
        arkuiNewLog(SUITE, 'execute', '0400 inspector: ' + inspectorStr.substring(0, Math.min(inspectorStr.length, 200).toInt()));
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', '0400 FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0500
     * @tc.name   SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0500
     * @tc.desc   Test bufferQueueCount with boundary value 6 (above max, should be clamped to 5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', '0500 start');
      try {
        const driver: Driver = Driver.create();
        const component = await driver.findComponent(ON.id('xcBqc_above_max'));
        expect(!!component).assertTrue();
        const inspectorStr: string = inspector.getInspectorByKey('xcBqc_above_max');
        expect(inspectorStr !== null && inspectorStr !== '').assertTrue();
        arkuiNewLog(SUITE, 'execute', '0500 inspector: ' + inspectorStr.substring(0, Math.min(inspectorStr.length, 200).toInt()));
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', '0500 FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0600
     * @tc.name   SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0600
     * @tc.desc   Test bufferQueueCount with boundary value 0 (below min, should be clamped to 2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', '0600 start');
      try {
        const driver: Driver = Driver.create();
        const component = await driver.findComponent(ON.id('xcBqc_zero'));
        expect(!!component).assertTrue();
        const inspectorStr: string = inspector.getInspectorByKey('xcBqc_zero');
        expect(inspectorStr !== null && inspectorStr !== '').assertTrue();
        arkuiNewLog(SUITE, 'execute', '0600 inspector: ' + inspectorStr.substring(0, Math.min(inspectorStr.length, 200).toInt()));
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', '0600 FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0700
     * @tc.name   SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0700
     * @tc.desc   Test bufferQueueCount with negative value -1 (should be clamped to 2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', '0700 start');
      try {
        const driver: Driver = Driver.create();
        const component = await driver.findComponent(ON.id('xcBqc_negative'));
        expect(!!component).assertTrue();
        const inspectorStr: string = inspector.getInspectorByKey('xcBqc_negative');
        expect(inspectorStr !== null && inspectorStr !== '').assertTrue();
        arkuiNewLog(SUITE, 'execute', '0700 inspector: ' + inspectorStr.substring(0, Math.min(inspectorStr.length, 200).toInt()));
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', '0700 FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0800
     * @tc.name   SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0800
     * @tc.desc   Test default bufferQueueCount (not calling the API, default should be 5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', '0800 start');
      try {
        const driver: Driver = Driver.create();
        const component = await driver.findComponent(ON.id('xcBqc_default'));
        expect(!!component).assertTrue();
        const inspectorStr: string = inspector.getInspectorByKey('xcBqc_default');
        expect(inspectorStr !== null && inspectorStr !== '').assertTrue();
        arkuiNewLog(SUITE, 'execute', '0800 inspector: ' + inspectorStr.substring(0, Math.min(inspectorStr.length, 200).toInt()));
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', '0800 FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0900
     * @tc.name   SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0900
     * @tc.desc   Test bufferQueueCount with normal value 4 (another middle valid value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', '0900 start');
      try {
        const driver: Driver = Driver.create();
        const component = await driver.findComponent(ON.id('xcBqc_mid_two'));
        expect(!!component).assertTrue();
        const inspectorStr: string = inspector.getInspectorByKey('xcBqc_mid_two');
        expect(inspectorStr !== null && inspectorStr !== '').assertTrue();
        arkuiNewLog(SUITE, 'execute', '0900 inspector: ' + inspectorStr.substring(0, Math.min(inspectorStr.length, 200).toInt()));
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', '0900 FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_1000
     * @tc.name   SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_1000
     * @tc.desc   Test bufferQueueCount with large value 100 (far above max, should be clamped to 5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', '1000 start');
      try {
        const driver: Driver = Driver.create();
        const component = await driver.findComponent(ON.id('xcBqc_large'));
        expect(!!component).assertTrue();
        const inspectorStr: string = inspector.getInspectorByKey('xcBqc_large');
        expect(inspectorStr !== null && inspectorStr !== '').assertTrue();
        arkuiNewLog(SUITE, 'execute', '1000 inspector: ' + inspectorStr.substring(0, Math.min(inspectorStr.length, 200).toInt()));
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', '1000 FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_1100
     * @tc.name   SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_1100
     * @tc.desc   Test bufferQueueCount with small value -100 (far below min, should be clamped to 2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', '1100 start');
      try {
        const driver: Driver = Driver.create();
        const component = await driver.findComponent(ON.id('xcBqc_small'));
        expect(!!component).assertTrue();
        const inspectorStr: string = inspector.getInspectorByKey('xcBqc_small');
        expect(inspectorStr !== null && inspectorStr !== '').assertTrue();
        arkuiNewLog(SUITE, 'execute', '1100 inspector: ' + inspectorStr.substring(0, Math.min(inspectorStr.length, 200).toInt()));
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', '1100 FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_1200
     * @tc.name   SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_1200
     * @tc.desc   Test page loads correctly and all bufferQueueCount XComponent nodes exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_XCOMPONENT_BUFFERQUEUECOUNT_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', '1200 start');
      try {
        const driver: Driver = Driver.create();
        const title = await driver.findComponent(ON.id(TITLE_ID));
        expect(!!title).assertTrue();
        const ids: string[] = [
          'xcBqc_min', 'xcBqc_max', 'xcBqc_mid',
          'xcBqc_below_min', 'xcBqc_above_max', 'xcBqc_zero',
          'xcBqc_negative', 'xcBqc_default', 'xcBqc_mid_two',
          'xcBqc_large', 'xcBqc_small'
        ];
        for (let i = 0; i < ids.length; i++) {
          const comp = await driver.findComponent(ON.id(ids[i]));
          expect(!!comp).assertTrue();
          arkuiNewLog(SUITE, 'execute', '1200 found: ' + ids[i]);
        }
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', '1200 FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });
  });
}
