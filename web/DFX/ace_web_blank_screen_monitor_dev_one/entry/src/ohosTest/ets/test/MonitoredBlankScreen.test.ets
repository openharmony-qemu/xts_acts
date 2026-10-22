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
const EVENT_KEY = 204300;

export default function MonitoredBlankScreenTest() {
  describe('MonitoredBlankScreen', () => {
    beforeAll(async (done: Function) => {
      await router.pushUrl({ url: 'testability/pages/MonitoredBlankScreen' });
      await driver.waitForComponent(ON.id('MonitoredBlankScreenBtn'), 10000);
      done();
    });

    /**
     * @tc.name   SUB_WEB_MONITOREDBLANKSCREENINFO_URL_0100
     * @tc.number SUB_WEB_MONITOREDBLANKSCREENINFO_URL_0100
     * @tc.desc   test monitoredblankscreeninfo url (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_MONITOREDBLANKSCREENINFO_URL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('info:url', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('infoUrl', true, 204310, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'MonitoredBlankScreenBtn');
        if (await Utils.waitForExist(() => ok, 'infoUrl', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_MONITOREDBLANKSCREENINFO_REASON_0100
     * @tc.number SUB_WEB_MONITOREDBLANKSCREENINFO_REASON_0100
     * @tc.desc   test monitoredblankscreeninfo reason (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_MONITOREDBLANKSCREENINFO_REASON_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('info:reason', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('infoReason', true, 204311, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'MonitoredBlankScreenBtn');
        if (await Utils.waitForExist(() => ok, 'infoReason', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_MONITOREDBLANKSCREENINFO_EXTRAMSG_0100
     * @tc.number SUB_WEB_MONITOREDBLANKSCREENINFO_EXTRAMSG_0100
     * @tc.desc   test monitoredblankscreeninfo extramsg (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_MONITOREDBLANKSCREENINFO_EXTRAMSG_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('info:extraMsg', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('infoExtra', true, 204312, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'MonitoredBlankScreenBtn');
        if (await Utils.waitForExist(() => ok, 'infoExtra', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_WEBATTRIBUTE_ONMONITOREDBLANKSCREEN_0100
     * @tc.number SUB_WEB_WEBATTRIBUTE_ONMONITOREDBLANKSCREEN_0100
     * @tc.desc   test webattribute onmonitoredblankscreen (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBATTRIBUTE_ONMONITOREDBLANKSCREEN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('onMonitoredBlankScreen', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('onMonitored', true, 204320, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'MonitoredBlankScreenBtn');
        if (await Utils.waitForExist(() => ok, 'onMonitored', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_MONITOREDBLANKSCREEN_ONMONITORBLANKSCREENCALLBACK_0100
     * @tc.number SUB_WEB_MONITOREDBLANKSCREEN_ONMONITORBLANKSCREENCALLBACK_0100
     * @tc.desc   test onmonitorblankscreencallback (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_MONITOREDBLANKSCREEN_ONMONITORBLANKSCREENCALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('onMonitorCallback', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('onMonitorCb', true, 204321, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'MonitoredBlankScreenBtn');
        if (await Utils.waitForExist(() => ok, 'onMonitorCb', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_MONITOREDBLANKSCREEN_ONDETECTEDBLANKSCREEN_0100
     * @tc.number SUB_WEB_MONITOREDBLANKSCREEN_ONDETECTEDBLANKSCREEN_0100
     * @tc.desc   test ondetectedblankscreen (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_MONITOREDBLANKSCREEN_ONDETECTEDBLANKSCREEN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('runOnDetectedBlankScreen', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('OnDetectedBlankScreen', true, 204220, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'MonitoredBlankScreenBtn');
        if (await Utils.waitForExist(() => ok, 'OnDetectedBlankScreen', 1, 5000)) { done(); }
      });

  });
}
