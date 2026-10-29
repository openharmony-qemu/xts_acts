/*
 * Copyright (c) 2026 KaiHong Co., Ltd.
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

async function runDynamicCase(
  emitAction: string,
  registerName: string,
  expected: Object,
  eventId: number,
  waitLabel: string): Promise<number> {
  Utils.emitEvent(emitAction, EVENT_KEY);
  let ok = 0;
  const onDone = (err?: Error) => {
    if (err) {
      console.error(JSON.stringify(err));
    }
    ok = 1;
  };
  Utils.registerBaseEvent(registerName, expected, eventId, onDone,
    (d: events_emitter.EventData, e: Object) => {
      expect(d?.data?.ACTION).assertEqual(e);
    });
  try {
    await Utils.waitAndClickComponent(driver, BTN);
  } catch (e) {
    console.error(JSON.stringify(e));
  }
  const okProbe = (err?: Error): number => {
    if (err) {
      console.error(JSON.stringify(err));
    }
    return ok;
  };
  try {
    await Utils.waitForExist(okProbe, waitLabel, 1, 8000);
  } catch (e) {
    console.error(JSON.stringify(e));
  }
  return ok;
}

export default function dynamicSdkBlankScreenTest() {
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
        const ok = await runDynamicCase( 'testEnableBlankScreenMonitor', 'testEnableBlankScreenMonitor', true, 204330,
          'testEnableBlankScreenMonitor');
        expect(ok).assertEqual(1);
        done();
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
        const ok = await runDynamicCase('testEnableBlankScreenMonitorFalse',
          'testEnableBlankScreenMonitorFalse', true, 204331,
          'testEnableBlankScreenMonitorFalse');
        expect(ok).assertEqual(1);
        done();
      });

    /**
     * @tc.name   SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_UNDEFINED_0100
     * @tc.number SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_UNDEFINED_0100
     * @tc.desc   enableBlankScreenMonitor undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_UNDEFINED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const ok = await runDynamicCase('testEnableBlankScreenMonitorUndefined',
          'testEnableBlankScreenMonitorUndefined', true, 204332,
          'testEnableBlankScreenMonitorUndefined');
        expect(ok).assertEqual(1);
        done();
      });

    /**
     * @tc.name   SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_RETURNTHIS_0100
     * @tc.number SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_RETURNTHIS_0100
     * @tc.desc   enableBlankScreenMonitor return this
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_RETURNTHIS_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const ok = await runDynamicCase('testEnableBlankScreenMonitorReturnThis',
          'testEnableBlankScreenMonitorReturnThis', true, 204333,
          'testEnableBlankScreenMonitorReturnThis');
        expect(ok).assertEqual(1);
        done();
      });
  });
}
