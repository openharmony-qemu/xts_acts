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


import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError, RecordData } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;

export default function SetBlanklessLoadingWithKey() : void{
  describe('SetBlanklessLoadingWithKey', (): void => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000);
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   testSetBlanklessLoadingWithKeyStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHKEYTEST_0100
     * @tc.desc   test setBlanklessLoadingWithKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetBlanklessLoadingWithKeyStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testSetBlanklessLoadingWithKey001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetBlanklessLoadingWithKey001', 0, 148510, done); 
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setBlanklessLoadingWithKeyTestButton', 10, '');
      await Utils.msSleep(8000);
      done();
    })

    /**
     * @tc.name   testSetBlanklessLoadingWithKeyStatic002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHKEYTEST_0200
     * @tc.desc   test setBlanklessLoadingWithKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetBlanklessLoadingWithKeyStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testSetBlanklessLoadingWithKey002', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetBlanklessLoadingWithKey002', -2, 148520, done); 
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setBlanklessLoadingWithKeyTestButton', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testSetBlanklessLoadingWithKeyStatic003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHKEYTEST_0300
     * @tc.desc   test setBlanklessLoadingWithKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetBlanklessLoadingWithKeyStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testSetBlanklessLoadingWithKey003', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetBlanklessLoadingWithKey003', -3, 148530, done); 
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setBlanklessLoadingWithKeyTestButton', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testSetBlanklessLoadingWithKeyStatic004
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHKEYTEST_0400
     * @tc.desc   test setBlanklessLoadingWithKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetBlanklessLoadingWithKeyStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testSetBlanklessLoadingWithKey004', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetBlanklessLoadingWithKey004', -4, 148540, done); 
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setBlanklessLoadingWithKeyTestButton', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testSetBlanklessLoadingWithKeyStatic005
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHKEYTEST_0500
     * @tc.desc   test setBlanklessLoadingWithKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetBlanklessLoadingWithKeyStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testSetBlanklessLoadingWithKey005', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetBlanklessLoadingWithKey005', -5, 148550, done); 
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setBlanklessLoadingWithKeyTestButton', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testClearBlanklessLoadingCacheNoArgsStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CLEARBLANKLESSLOADINGCACHE_NOARGS_0100
     * @tc.desc   test clearBlanklessLoadingCache with no args (undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearBlanklessLoadingCacheNoArgsStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testClearBlanklessLoadingCacheNoArgs001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testClearBlanklessLoadingCacheNoArgs001', true, 148560, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setBlanklessLoadingWithKeyTestButton', 10, '');
      await Utils.msSleep(4000);
      done();
    })

    /**
     * @tc.name   testClearBlanklessLoadingCacheStatic002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CLEARBLANKLESSLOADINGCACHETEST_0200
     * @tc.desc   test clearBlanklessLoadingCache value is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearBlanklessLoadingCacheStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testClearBlanklessLoadingCache002', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testClearBlanklessLoadingCache002', 0, 148570, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setBlanklessLoadingWithKeyTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testClearBlanklessLoadingCacheStatic003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CLEARBLANKLESSLOADINGCACHETEST_0300
     * @tc.desc   test clearBlanklessLoadingCache value is []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearBlanklessLoadingCacheStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testClearBlanklessLoadingCache003', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testClearBlanklessLoadingCache003', 0, 148580, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setBlanklessLoadingWithKeyTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testGetBlanklessInfoWithKey801Static
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_GETBLANKLESSINFOWITHKEY_801_0100
     * @tc.desc   test getBlanklessInfoWithKey error code 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBlanklessInfoWithKey801Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('testGetBlanklessInfoWithKey801Static', 10)
        await Utils.msSleep(3000);
        Utils.registerBaseEvent('testGetBlanklessInfoWithKey801Static', 801, 148590, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            expect(data['ACTION']).assertEqual(expected);
          });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('setBlanklessLoadingWithKeyTestButton', 10, '');
        await Utils.msSleep(4000);
        done();
      } catch (err) {
        console.info('[testGetBlanklessInfoWithKey801Static] err:' + JSON.stringify(err));
        done();
      }
    })

    /**
     * @tc.name   testSetBlanklessLoadingWithKey801Static
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHKEY_801_0200
     * @tc.desc   test setBlanklessLoadingWithKey error code 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetBlanklessLoadingWithKey801Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('testSetBlanklessLoadingWithKey801Static', 10)
        await Utils.msSleep(3000);
        Utils.registerBaseEvent('testSetBlanklessLoadingWithKey801Static', 801, 148594, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            expect(data['ACTION']).assertEqual(expected);
          });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('setBlanklessLoadingWithKeyTestButton', 10, '');
        await Utils.msSleep(6000);
        done();
      } catch (err) {
        console.info('[testSetBlanklessLoadingWithKey801Static] err:' + JSON.stringify(err));
        done();
      }
    })

    /**
     * @tc.name   testClearBlanklessLoadingCache801Static
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CLEARBLANKLESSLOADINGCACHE_801_0300
     * @tc.desc   test clearBlanklessLoadingCache error code 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearBlanklessLoadingCache801Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('testClearBlanklessLoadingCache801Static', 10)
        await Utils.msSleep(3000);
        Utils.registerBaseEvent('testClearBlanklessLoadingCache801Static', 801, 148598, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            expect(data['ACTION']).assertEqual(expected);
          });
        await Utils.msSleep(2000);
        inspector.sendEventByKey('setBlanklessLoadingWithKeyTestButton', 10, '');
        await Utils.msSleep(4000);
        done();
      } catch (err) {
        console.info('[testClearBlanklessLoadingCache801Static] err:' + JSON.stringify(err));
        done();
      }
    })

  })
}
