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

import { beforeAll, describe, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import Utils from './Utils.test';
import events_emitter from '@ohos.events.emitter';

const driver = Driver.create();
const EVENT_KEY = 207200;
const BTN = 'DynamicSdkBlankScreenBtn';

export default function DynamicSdkBlankScreenTest() {
  describe('DynamicSdkBlankScreen', () => {
    beforeAll(async (done: Function) => {
      try {
        await router.pushUrl({ url: 'testability/pages/DynamicSdkBlankScreen' });
        await driver.waitForComponent(ON.id(BTN), 10000);
      } catch (e) {
        console.error(JSON.stringify(e));
      }
      done();
    });
    /**
     * @tc.name   SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_0100
     * @tc.number SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_0100
     * @tc.desc   enableBlankScreenMonitor true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testEnableBlankScreenMonitor', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('testEnableBlankScreenMonitor', true, 204330, (err?: Error) => { if (err) { console.error(JSON.stringify(err)); } ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        try {
          await Utils.waitAndClickComponent(driver, BTN);
        } catch (e) {
          console.error(JSON.stringify(e));
        }
        if (await Utils.waitForExist(() => ok, 'testEnableBlankScreenMonitor', 1, 8000)) {
          expect(ok).assertEqual(1);
          done();
        }
      });

    /**
     * @tc.name   SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_FALSE_0100
     * @tc.number SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_FALSE_0100
     * @tc.desc   enableBlankScreenMonitor false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_FALSE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testEnableBlankScreenMonitorFalse', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('testEnableBlankScreenMonitorFalse', true, 204331, (err?: Error) => { if (err) { console.error(JSON.stringify(err)); } ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        try {
          await Utils.waitAndClickComponent(driver, BTN);
        } catch (e) {
          console.error(JSON.stringify(e));
        }
        if (await Utils.waitForExist(() => ok, 'testEnableBlankScreenMonitorFalse', 1, 8000)) {
          expect(ok).assertEqual(1);
          done();
        }
      });

    /**
     * @tc.name   SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_UNDEFINED_0100
     * @tc.number SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_UNDEFINED_0100
     * @tc.desc   enableBlankScreenMonitor undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_UNDEFINED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testEnableBlankScreenMonitorUndefined', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('testEnableBlankScreenMonitorUndefined', true, 204332, (err?: Error) => { if (err) { console.error(JSON.stringify(err)); } ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        try {
          await Utils.waitAndClickComponent(driver, BTN);
        } catch (e) {
          console.error(JSON.stringify(e));
        }
        if (await Utils.waitForExist(() => ok, 'testEnableBlankScreenMonitorUndefined', 1, 8000)) {
          expect(ok).assertEqual(1);
          done();
        }
      });

    /**
     * @tc.name   SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_RETURNTHIS_0100
     * @tc.number SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_RETURNTHIS_0100
     * @tc.desc   enableBlankScreenMonitor return this
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_RETURNTHIS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testEnableBlankScreenMonitorReturnThis', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('testEnableBlankScreenMonitorReturnThis', true, 204333, (err?: Error) => { if (err) { console.error(JSON.stringify(err)); } ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        try {
          await Utils.waitAndClickComponent(driver, BTN);
        } catch (e) {
          console.error(JSON.stringify(e));
        }
        if (await Utils.waitForExist(() => ok, 'testEnableBlankScreenMonitorReturnThis', 1, 8000)) {
          expect(ok).assertEqual(1);
          done();
        }
      });
  });
}
