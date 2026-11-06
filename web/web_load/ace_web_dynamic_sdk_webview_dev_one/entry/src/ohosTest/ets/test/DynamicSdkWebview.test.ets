/*
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

import { beforeAll, describe, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import Utils from './Utils.test';
import events_emitter from '@ohos.events.emitter';

const driver = Driver.create();
const EVENT_KEY = 207100;
const BTN = 'DynamicSdkWebviewBtn';

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

export default function dynamicSdkWebviewTest() {
  describe('DynamicSdkWebview', () => {
    beforeAll(async (done: Function) => {
      try {
        await router.pushUrl({ url: 'testability/pages/DynamicSdkWebview' });
        await driver.waitForComponent(ON.id(BTN), 10000);
      } catch (e) {
        console.error(JSON.stringify(e));
      }
      done();
    });
    /**
     * @tc.name   SUB_WEB_WEBVIEWCONTROLLER_SETZOOMFACTOR_0100
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETZOOMFACTOR_0100
     * @tc.desc   setZoomFactor on webview controller
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBVIEWCONTROLLER_SETZOOMFACTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const ok = await runDynamicCase('testSetZoomFactor', 'testSetZoomFactor', true, 206130,
          'testSetZoomFactor');
        expect(ok).assertEqual(1);
        done();
      });

    /**
     * @tc.name   SUB_WEB_WEBVIEWCONTROLLER_GETZOOMFACTOR_0100
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_GETZOOMFACTOR_0100
     * @tc.desc   getZoomFactor return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBVIEWCONTROLLER_GETZOOMFACTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const ok = await runDynamicCase('testGetZoomFactor', 'testGetZoomFactor', true, 206131,
          'testGetZoomFactor');
        expect(ok).assertEqual(1);
        done();
      });

    /**
     * @tc.name   SUB_WEB_WEBATTRIBUTE_ONZOOMCHANGE_0100
     * @tc.number SUB_WEB_WEBATTRIBUTE_ONZOOMCHANGE_0100
     * @tc.desc   onZoomChange trigger via setZoomFactor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBATTRIBUTE_ONZOOMCHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const ok = await runDynamicCase('testSetZoomTrigger', 'testSetZoomTrigger', true, 206215,
          'testSetZoomTrigger');
        expect(ok).assertEqual(1);
        done();
      });

    /**
     * @tc.name   SUB_WEB_ONZOOMCHANGECALLBACK_TYPE_0100
     * @tc.number SUB_WEB_ONZOOMCHANGECALLBACK_TYPE_0100
     * @tc.desc   OnZoomChangeCallback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_ONZOOMCHANGECALLBACK_TYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const ok = await runDynamicCase('testOnZoomChangeCallback', 'testOnZoomChangeCallback', true, 206211,
          'testOnZoomChangeCallback');
        expect(ok).assertEqual(1);
        done();
      });

    /**
     * @tc.name   SUB_WEB_ONZOOMCHANGEEVENT_INTERFACE_0100
     * @tc.number SUB_WEB_ONZOOMCHANGEEVENT_INTERFACE_0100
     * @tc.desc   OnZoomChangeEvent interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_ONZOOMCHANGEEVENT_INTERFACE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const ok = await runDynamicCase('testOnZoomChangeEvent', 'testOnZoomChangeEvent', true, 206212,
          'testOnZoomChangeEvent');
        expect(ok).assertEqual(1);
        done();
      });

    /**
     * @tc.name   SUB_WEB_ONZOOMCHANGEEVENT_OLDZOOMFACTOR_0100
     * @tc.number SUB_WEB_ONZOOMCHANGEEVENT_OLDZOOMFACTOR_0100
     * @tc.desc   OnZoomChangeEvent oldZoomFactor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_ONZOOMCHANGEEVENT_OLDZOOMFACTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const ok = await runDynamicCase('testOldZoomFactor', 'testOldZoomFactor', true, 206213,
          'testOldZoomFactor');
        expect(ok).assertEqual(1);
        done();
      });

    /**
     * @tc.name   SUB_WEB_ONZOOMCHANGEEVENT_NEWZOOMFACTOR_0100
     * @tc.number SUB_WEB_ONZOOMCHANGEEVENT_NEWZOOMFACTOR_0100
     * @tc.desc   OnZoomChangeEvent newZoomFactor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_ONZOOMCHANGEEVENT_NEWZOOMFACTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const ok = await runDynamicCase('testNewZoomFactor', 'testNewZoomFactor', true, 206214,
          'testNewZoomFactor');
        expect(ok).assertEqual(1);
        done();
      });

    /**
     * @tc.name   SUB_WEB_WEBVIEWCONTROLLER_SETZOOMFACTOR_UNDEFINED_0100
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETZOOMFACTOR_UNDEFINED_0100
     * @tc.desc   setZoomFactor undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBVIEWCONTROLLER_SETZOOMFACTOR_UNDEFINED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const ok = await runDynamicCase('testSetZoomFactorUndefined', 'testSetZoomFactorUndefined', '401', 206132,
          'testSetZoomFactorUndefined');
        expect(ok).assertEqual(1);
        done();
      });

    /**
     * @tc.name   SUB_WEB_WEBVIEWCONTROLLER_SETZOOMFACTOR_NULL_0100
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETZOOMFACTOR_NULL_0100
     * @tc.desc   setZoomFactor null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBVIEWCONTROLLER_SETZOOMFACTOR_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const ok = await runDynamicCase('testSetZoomFactorNull', 'testSetZoomFactorNull', '401', 206133,
          'testSetZoomFactorNull');
        expect(ok).assertEqual(1);
        done();
      });

    /**
     * @tc.name   SUB_WEB_WEBATTRIBUTE_ONZOOMCHANGE_UNDEFINED_0100
     * @tc.number SUB_WEB_WEBATTRIBUTE_ONZOOMCHANGE_UNDEFINED_0100
     * @tc.desc   onZoomChange undefined callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBATTRIBUTE_ONZOOMCHANGE_UNDEFINED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const ok = await runDynamicCase('testOnZoomChangeUndefined', 'testOnZoomChangeUndefined', true, 206216,
          'testOnZoomChangeUndefined');
        expect(ok).assertEqual(1);
        done();
      });

    /**
     * @tc.name   SUB_WEB_WEBATTRIBUTE_ONZOOMCHANGE_RETURNTHIS_0100
     * @tc.number SUB_WEB_WEBATTRIBUTE_ONZOOMCHANGE_RETURNTHIS_0100
     * @tc.desc   onZoomChange return this
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBATTRIBUTE_ONZOOMCHANGE_RETURNTHIS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const ok = await runDynamicCase('testOnZoomChangeReturnThis', 'testOnZoomChangeReturnThis', true, 206217,
          'testOnZoomChangeReturnThis');
        expect(ok).assertEqual(1);
        done();
      });
  });
}
