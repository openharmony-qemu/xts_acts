'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from "../../../hypium/index";
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import {BusinessError, RecordData } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';

let testAbilityContext:common.UIAbilityContext;

export default function webViewControllerErrorCode() {

  describe('webViewControllerErrorCode', (): void => {
    beforeEach(async (): Promise<void> => {
      console.log("app start")
    })

    /**
     * @tc.name   testPageUpError001
     * @tc.number SUB_WEB_ERRORCODE_PAGEUP_0100
     * @tc.desc   test pageUp error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPageUpError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(4000);
      Utils.emitEvent("testPageUpError001", 10)
      await Utils.msSleep(5000);
      Utils.registerBaseEvent("testPageUpError001", "17100001", 20265, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(5000);
      inspector.sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
      await Utils.msSleep(8000);
      done();
    })

    /**
     * @tc.name   testPageUpError002
     * @tc.number SUB_WEB_ERRORCODE_PAGEUP_0200
     * @tc.desc   test pageUp error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPageUpError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("testPageUpError002", 10)
      await Utils.msSleep(5000);
      Utils.registerBaseEvent("testPageUpError002", "17100001", 20266, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(5000);
      inspector.sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
      await Utils.msSleep(8000);
      done();
    })

    /**
     * @tc.name   testPageDownError001
     * @tc.number SUB_WEB_ERRORCODE_PAGEDOWN_0100
     * @tc.desc   test pageDown error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPageDownError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("testPageDownError001", 10)
      await Utils.msSleep(5000);
      Utils.registerBaseEvent("testPageDownError001", "17100001", 20270, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(5000);
      inspector.sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
      await Utils.msSleep(8000);
      done();
    })

    /**
     * @tc.name   testPageDownError002
     * @tc.number SUB_WEB_ERRORCODE_PAGEDOWN_0200
     * @tc.desc   test pageDown error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPageDownError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("testPageDownError002", 10)
      await Utils.msSleep(5000);
      Utils.registerBaseEvent("testPageDownError002", "17100001", 20271, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(5000);
      inspector.sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
      await Utils.msSleep(8000);
      done();
    })

    /**
    * @tc.name       SwitchNextPageStatic
    * @tc.number     SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_2200
    * @tc.desc       test PAGE_REDIRECT
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      LEVEL0
    */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          await Utils.msSleep(2000);
          Utils.emitEvent('SwitchNextPageStatic', 10)
          await Utils.msSleep(1000);
          let driver: Driver = Driver.create();
          let button = await driver.findComponent(ON.id('WebViewControllerErrorCodeButton'));
          expect(button != null).assertTrue();
          inspector.sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
          await Utils.msSleep(6000);
          done();
        } catch (err) {
          console.info('[SwitchNextPageStatic] err:' + JSON.stringify(err));
          done();
        }
      })

    /**
     * @tc.name   testPageUpNullStatic001
     * @tc.number SUB_WEB_PAGEUP_NULL_0100
     * @tc.desc   test pageUp with null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPageUpNullStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("testPageUpNullStatic001", 10)
      await Utils.msSleep(2000);
      Utils.registerBaseEvent("testPageUpNullStatic001", true, 41022201, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
      await Utils.msSleep(4000);
      done();
    })

    /**
     * @tc.name   testPageUpUndefinedStatic001
     * @tc.number SUB_WEB_PAGEUP_UNDEFINED_0100
     * @tc.desc   test pageUp with undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPageUpUndefinedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("testPageUpUndefinedStatic001", 10)
      await Utils.msSleep(2000);
      Utils.registerBaseEvent("testPageUpUndefinedStatic001", true, 41022202, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
      await Utils.msSleep(4000);
      done();
    })

    /**
     * @tc.name   testPageDownNullStatic001
     * @tc.number SUB_WEB_PAGEDOWN_NULL_0100
     * @tc.desc   test pageDown with null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPageDownNullStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("testPageDownNullStatic001", 10)
      await Utils.msSleep(2000);
      Utils.registerBaseEvent("testPageDownNullStatic001", true, 41022301, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
      await Utils.msSleep(4000);
      done();
    })

    /**
     * @tc.name   testPageDownUndefinedStatic001
     * @tc.number SUB_WEB_PAGEDOWN_UNDEFINED_0100
     * @tc.desc   test pageDown with undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPageDownUndefinedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("testPageDownUndefinedStatic001", 10)
      await Utils.msSleep(2000);
      Utils.registerBaseEvent("testPageDownUndefinedStatic001", true, 41022302, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
      await Utils.msSleep(4000);
      done();
    })
  })
}
