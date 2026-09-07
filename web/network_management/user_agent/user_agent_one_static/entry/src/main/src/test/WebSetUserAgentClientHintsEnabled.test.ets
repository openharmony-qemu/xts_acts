'use static';
/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import {beforeAll, beforeEach, describe, it, Level, Size, TestType, expect } from '../../../hypium/index';
import Utils from './Util.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import {BusinessError, RecordData } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext: common.UIAbilityContext;

export default function webSetUserAgentClientHintsEnabled() {

  describe('webSetUserAgentClientHintsEnabled', () => {

    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log("App start")
    });

    beforeEach(async () => {
      await Utils.msSleep(3000);
      console.info("web beforeEach start");
    })

    /**
     * @tc.name   testSetUserAgentClientHintsEnabledStatic
     * @tc.number SUB_ACE_WEB_SETUSERAGENTCLIENTHINTSENABLEDAPI_0100
     * @tc.desc   test setUserAgentClientHintsEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUserAgentClientHintsEnabledStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSetUserAgentClientHintsEnabled', 10);
      await Utils.msSleep(2000);
      Utils.registerBaseEvent('testSetUserAgentClientHintsEnabledStatic', true, 174130, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebSetUserAgentClientHintsEnabledButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testSetUserAgentClientHintsEnabledFalseStatic
     * @tc.number SUB_ACE_WEB_SETUSERAGENTCLIENTHINTSENABLEDAPI_0200
     * @tc.desc   test setUserAgentClientHintsEnabled false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUserAgentClientHintsEnabledFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSetUserAgentClientHintsEnabledFalse', 10);
      await Utils.msSleep(2000);
      Utils.registerBaseEvent('testSetUserAgentClientHintsEnabledFalseStatic', true, 174131, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebSetUserAgentClientHintsEnabledButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testGetUserAgentClientHintsEnabledTrueStatic
     * @tc.number SUB_ACE_WEB_GETUSERAGENTCLIENTHINTSENABLEDAPI_0300
     * @tc.desc   test getUserAgentClientHintsEnabled return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUserAgentClientHintsEnabledTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitGetUserAgentClientHintsEnabledTrue', 10);
      await Utils.msSleep(2000);
      Utils.registerBaseEvent('testGetUserAgentClientHintsEnabledTrueStatic', true, 174160, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebSetUserAgentClientHintsEnabledButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testGetUserAgentClientHintsEnabledFalseStatic
     * @tc.number SUB_ACE_WEB_GETUSERAGENTCLIENTHINTSENABLEDAPI_0400
     * @tc.desc   test getUserAgentClientHintsEnabled return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUserAgentClientHintsEnabledFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitGetUserAgentClientHintsEnabledFalse', 10);
      Utils.registerBaseEvent('testGetUserAgentClientHintsEnabledFalseStatic', false, 174170, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebSetUserAgentClientHintsEnabledButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testSetUserAgentClientHintsEnabledNullStatic
     * @tc.number SUB_ACE_WEB_SETUSERAGENTCLIENTHINTSENABLEDAPI_0500
     * @tc.desc   test setUserAgentClientHintsEnabled null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUserAgentClientHintsEnabledNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSetUserAgentClientHintsEnabledNull', 10);
      await Utils.msSleep(2000);
      Utils.registerBaseEvent('testSetUserAgentClientHintsEnabledNullStatic', '401', 174140, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebSetUserAgentClientHintsEnabledButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testSetUserAgentClientHintsEnabledUndefinedStatic
     * @tc.number SUB_ACE_WEB_SETUSERAGENTCLIENTHINTSENABLEDAPI_0600
     * @tc.desc   test setUserAgentClientHintsEnabled undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUserAgentClientHintsEnabledUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSetUserAgentClientHintsEnabledUndefined', 10);
      await Utils.msSleep(2000);
      Utils.registerBaseEvent('testSetUserAgentClientHintsEnabledUndefinedStatic', '401', 174150, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebSetUserAgentClientHintsEnabledButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name        SwitchNextPageStatic
     * @tc.number      SUB_WEB_ERRORCODE_JSMESSAGEEXTGET_ARRAY_0500
     * @tc.desc        test PAGE_REDIRECT
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('WebSetUserAgentClientHintsEnabledButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}
