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
const EVENT_KEY = 207100;
const BTN = 'DynamicSdkWebviewBtn';

export default function DynamicSdkWebviewTest() {
  describe('DynamicSdkWebview', () => {
    beforeAll(async (done: Function) => {
      await router.pushUrl({ url: 'testability/pages/DynamicSdkWebview' });
      await driver.waitForComponent(ON.id(BTN), 10000);
      done();
    });

    const runBool = async (action: string, eventId: number, expected: Object, done: Function) => {
      Utils.emitEvent(action, EVENT_KEY);
      let ok = 0;
      Utils.registerBaseEvent(action, expected, eventId, () => { ok = 1; },
        (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
      await Utils.waitAndClickComponent(driver, BTN);
      if (await Utils.waitForExist(() => ok, action, 1, 8000)) { done(); }
    };

    it('SUB_WEB_WEBVIEWCONTROLLER_SETZOOMFACTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => { await runBool('testSetZoomFactor', 206130, true, done); });

    it('SUB_WEB_WEBVIEWCONTROLLER_GETZOOMFACTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => { await runBool('testGetZoomFactor', 206131, true, done); });

    it('SUB_WEB_WEBATTRIBUTE_ONZOOMCHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => { await runBool('testSetZoomTrigger', 206215, true, done); });

    it('SUB_WEB_ONZOOMCHANGECALLBACK_TYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => { await runBool('testOnZoomChangeCallback', 206211, true, done); });

    it('SUB_WEB_ONZOOMCHANGEEVENT_INTERFACE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => { await runBool('testOnZoomChangeEvent', 206212, true, done); });

    it('SUB_WEB_ONZOOMCHANGEEVENT_OLDZOOMFACTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => { await runBool('testOldZoomFactor', 206213, true, done); });

    it('SUB_WEB_ONZOOMCHANGEEVENT_NEWZOOMFACTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => { await runBool('testNewZoomFactor', 206214, true, done); });

    it('SUB_WEB_WEBVIEWCONTROLLER_SETZOOMFACTOR_UNDEFINED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => { await runBool('testSetZoomFactorUndefined', 206132, '401', done); });

    it('SUB_WEB_WEBVIEWCONTROLLER_SETZOOMFACTOR_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => { await runBool('testSetZoomFactorNull', 206133, '401', done); });

    it('SUB_WEB_WEBATTRIBUTE_ONZOOMCHANGE_UNDEFINED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => { await runBool('testOnZoomChangeUndefined', 206216, true, done); });

    it('SUB_WEB_WEBATTRIBUTE_ONZOOMCHANGE_RETURNTHIS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => { await runBool('testOnZoomChangeReturnThis', 206217, true, done); });
  });
}
