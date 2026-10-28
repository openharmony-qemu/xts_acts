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
const EVENT_KEY = 207100;
const BTN = 'DynamicSdkWebviewBtn';

export default function DynamicSdkWebviewTest() {
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
        Utils.emitEvent('testSetZoomFactor', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('testSetZoomFactor', true, 206130, (err?: Error) => { if (err) { console.error(JSON.stringify(err)); } ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        try {
          await Utils.waitAndClickComponent(driver, BTN);
        } catch (e) {
          console.error(JSON.stringify(e));
        }
        if (await Utils.waitForExist(() => ok, 'testSetZoomFactor', 1, 8000)) {
          expect(ok).assertEqual(1);
          done();
        }
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
        Utils.emitEvent('testGetZoomFactor', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('testGetZoomFactor', true, 206131, (err?: Error) => { if (err) { console.error(JSON.stringify(err)); } ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        try {
          await Utils.waitAndClickComponent(driver, BTN);
        } catch (e) {
          console.error(JSON.stringify(e));
        }
        if (await Utils.waitForExist(() => ok, 'testGetZoomFactor', 1, 8000)) {
          expect(ok).assertEqual(1);
          done();
        }
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
        Utils.emitEvent('testSetZoomTrigger', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('testSetZoomTrigger', true, 206215, (err?: Error) => { if (err) { console.error(JSON.stringify(err)); } ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        try {
          await Utils.waitAndClickComponent(driver, BTN);
        } catch (e) {
          console.error(JSON.stringify(e));
        }
        if (await Utils.waitForExist(() => ok, 'testSetZoomTrigger', 1, 8000)) {
          expect(ok).assertEqual(1);
          done();
        }
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
        Utils.emitEvent('testOnZoomChangeCallback', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('testOnZoomChangeCallback', true, 206211, (err?: Error) => { if (err) { console.error(JSON.stringify(err)); } ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        try {
          await Utils.waitAndClickComponent(driver, BTN);
        } catch (e) {
          console.error(JSON.stringify(e));
        }
        if (await Utils.waitForExist(() => ok, 'testOnZoomChangeCallback', 1, 8000)) {
          expect(ok).assertEqual(1);
          done();
        }
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
        Utils.emitEvent('testOnZoomChangeEvent', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('testOnZoomChangeEvent', true, 206212, (err?: Error) => { if (err) { console.error(JSON.stringify(err)); } ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        try {
          await Utils.waitAndClickComponent(driver, BTN);
        } catch (e) {
          console.error(JSON.stringify(e));
        }
        if (await Utils.waitForExist(() => ok, 'testOnZoomChangeEvent', 1, 8000)) {
          expect(ok).assertEqual(1);
          done();
        }
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
        Utils.emitEvent('testOldZoomFactor', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('testOldZoomFactor', true, 206213, (err?: Error) => { if (err) { console.error(JSON.stringify(err)); } ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        try {
          await Utils.waitAndClickComponent(driver, BTN);
        } catch (e) {
          console.error(JSON.stringify(e));
        }
        if (await Utils.waitForExist(() => ok, 'testOldZoomFactor', 1, 8000)) {
          expect(ok).assertEqual(1);
          done();
        }
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
        Utils.emitEvent('testNewZoomFactor', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('testNewZoomFactor', true, 206214, (err?: Error) => { if (err) { console.error(JSON.stringify(err)); } ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        try {
          await Utils.waitAndClickComponent(driver, BTN);
        } catch (e) {
          console.error(JSON.stringify(e));
        }
        if (await Utils.waitForExist(() => ok, 'testNewZoomFactor', 1, 8000)) {
          expect(ok).assertEqual(1);
          done();
        }
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
        Utils.emitEvent('testSetZoomFactorUndefined', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('testSetZoomFactorUndefined', '401', 206132, (err?: Error) => { if (err) { console.error(JSON.stringify(err)); } ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        try {
          await Utils.waitAndClickComponent(driver, BTN);
        } catch (e) {
          console.error(JSON.stringify(e));
        }
        if (await Utils.waitForExist(() => ok, 'testSetZoomFactorUndefined', 1, 8000)) {
          expect(ok).assertEqual(1);
          done();
        }
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
        Utils.emitEvent('testSetZoomFactorNull', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('testSetZoomFactorNull', '401', 206133, (err?: Error) => { if (err) { console.error(JSON.stringify(err)); } ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        try {
          await Utils.waitAndClickComponent(driver, BTN);
        } catch (e) {
          console.error(JSON.stringify(e));
        }
        if (await Utils.waitForExist(() => ok, 'testSetZoomFactorNull', 1, 8000)) {
          expect(ok).assertEqual(1);
          done();
        }
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
        Utils.emitEvent('testOnZoomChangeUndefined', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('testOnZoomChangeUndefined', true, 206216, (err?: Error) => { if (err) { console.error(JSON.stringify(err)); } ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        try {
          await Utils.waitAndClickComponent(driver, BTN);
        } catch (e) {
          console.error(JSON.stringify(e));
        }
        if (await Utils.waitForExist(() => ok, 'testOnZoomChangeUndefined', 1, 8000)) {
          expect(ok).assertEqual(1);
          done();
        }
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
        Utils.emitEvent('testOnZoomChangeReturnThis', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('testOnZoomChangeReturnThis', true, 206217, (err?: Error) => { if (err) { console.error(JSON.stringify(err)); } ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        try {
          await Utils.waitAndClickComponent(driver, BTN);
        } catch (e) {
          console.error(JSON.stringify(e));
        }
        if (await Utils.waitForExist(() => ok, 'testOnZoomChangeReturnThis', 1, 8000)) {
          expect(ok).assertEqual(1);
          done();
        }
      });
  });
}
