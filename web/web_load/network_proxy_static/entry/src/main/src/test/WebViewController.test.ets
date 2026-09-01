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

import {Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach, expect } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Utils.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import {BusinessError, RecordData } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';

let testAbilityContext:common.UIAbilityContext;
export default function webviewController() {

  describe('webviewController', () => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000);
      console.info("webviewController beforeAll start");
    })

    /**
     * @tc.name   testCreateWebMessagePortsNullStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CREATEWEBMESSAGEPORTS_NULL_0800
     * @tc.desc   test createWebMessagePorts with null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateWebMessagePortsNullStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(3000);
        Utils.emitEvent('createWebMessagePortsNullStatic001', 10);
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('testCreateWebMessagePortsNullStatic001', true, 41022001, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewController', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testCreateWebMessagePortsUndefinedStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CREATEWEBMESSAGEPORTS_UNDEFINED_0900
     * @tc.desc   test createWebMessagePorts with undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateWebMessagePortsUndefinedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(3000);
        Utils.emitEvent('createWebMessagePortsUndefinedStatic001', 10);
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('testCreateWebMessagePortsUndefinedStatic001', true, 41022002, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewController', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testSearchNextNullStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SEARCHNEXT_NULL_1100
     * @tc.desc   test searchNext with null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearchNextNullStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(3000);
        Utils.emitEvent('searchNextNullStatic001', 10);
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('testSearchNextNullStatic001', '401', 41022101, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewController', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testSearchNextUndefinedStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SEARCHNEXT_UNDEFINED_1200
     * @tc.desc   test searchNext with undefined param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearchNextUndefinedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(3000);
        Utils.emitEvent('searchNextUndefinedStatic001', 10);
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('testSearchNextUndefinedStatic001', '401', 41022102, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewController', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testGetWebIdStatic
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_0100
     * @tc.desc   test getWebId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetWebIdStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(3000);
        Utils.emitEvent('getWebId', 10);
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('getWebId', 3, 202603161, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewController', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testCreateWebMessagePortsStatic
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_0200
     * @tc.desc   test createWebMessagePorts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateWebMessagePortsStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(3000);
        Utils.emitEvent('createWebMessagePorts', 10);
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('createWebMessagePorts', 2, 202603162, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewController', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testCreateWebMessagePortsStatic002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_0300
     * @tc.desc   test createWebMessagePorts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateWebMessagePortsStatic002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(3000);
        Utils.emitEvent('createWebMessagePorts2', 10);
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('createWebMessagePorts2', 2, 202603163, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewController', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testCreateWebMessagePortsStatic003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_0400
     * @tc.desc   test createWebMessagePorts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateWebMessagePortsStatic003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(3000);
        Utils.emitEvent('createWebMessagePorts3', 10);
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('createWebMessagePorts3', 2, 202603164, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewController', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testClearMatchesStatic
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_0500
     * @tc.desc   test clearMatchesStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearMatchesStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(3000);
        Utils.emitEvent('clearMatches', 10);
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('clearMatches', true, 202603165, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewController', 10, '');
        await Utils.msSleep(5000);
        done();
      })


    /**
     * @tc.name   testPostMessageStatic
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_0600
     * @tc.desc   test postMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostMessageStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(3000);
        Utils.emitEvent('postMessage', 10);
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('postMessage', true, 202603166, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewController', 10, '');
        await Utils.msSleep(5000);
        done();
      })


    /**
     * @tc.name   testSearchNextStatic
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_0700
     * @tc.desc   test searchNext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearchNextStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(3000);
        Utils.emitEvent('searchNext', 10);
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('searchNext', true, 202603167, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewController', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testCreateWebMessagePortsReturnStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CREATEWEBMESSAGEPORTS_RETURN_1000
     * @tc.desc   test createWebMessagePorts non-empty array return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateWebMessagePortsReturnStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(3000);
        Utils.emitEvent('createWebMessagePortsReturnStatic001', 10);
        await Utils.msSleep(2000);
        Utils.registerBaseEvent('testCreateWebMessagePortsReturnStatic001', true, 41022003, done,
        (backData: events_emitter.EventData, expected: Object) => {
          const data = backData?.data as Record<string, RecordData>;
          const action = data['ACTION'];
          expect(action).assertEqual(expected);
        });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webviewController', 10, '');
        await Utils.msSleep(5000);
        done();
      })
  })
}
