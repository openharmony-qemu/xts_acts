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

export default function DynamicSdkBlankScreenTest() {
  describe('DynamicSdkBlankScreen', () => {
    beforeAll(async (done: Function) => {
      await router.pushUrl({ url: 'testability/pages/DynamicSdkBlankScreen' });
      await driver.waitForComponent(ON.id(BTN), 10000);
      done();
    });

    const runBool = async (action: string, eventId: number, done: Function) => {
      Utils.emitEvent(action, EVENT_KEY);
      let ok = 0;
      Utils.registerBaseEvent(action, true, eventId, () => { ok = 1; },
        (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
      await Utils.waitAndClickComponent(driver, BTN);
      if (await Utils.waitForExist(() => ok, action, 1, 8000)) { done(); }
    };

    it('SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => { await runBool('testEnableBlankScreenMonitor', 204330, done); });

    it('SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_FALSE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => { await runBool('testEnableBlankScreenMonitorFalse', 204331, done); });

    it('SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_UNDEFINED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => { await runBool('testEnableBlankScreenMonitorUndefined', 204332, done); });

    it('SUB_WEB_WEBATTRIBUTE_ENABLEBLANKSCREENMONITOR_RETURNTHIS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => { await runBool('testEnableBlankScreenMonitorReturnThis', 204333, done); });
  });
}
