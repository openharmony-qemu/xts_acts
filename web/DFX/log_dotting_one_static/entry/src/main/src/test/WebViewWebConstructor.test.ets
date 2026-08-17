'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import inspector from '@ohos.arkui.inspector';
import Utils from './Util.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

let testAbilityContext: common.UIAbilityContext;

export default function webViewWebConstructor():void {
  describe('webViewWebConstructor', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(5000);
      console.info('beforeEach start');
    })

    /**
     * @tc.name   testWebRenderModeAsyncRenderStatic
     * @tc.number SUB_ACE_WEB_RENDER_MODE_0100
     * @tc.desc   test Web constructor with renderMode: ASYNC_RENDER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebRenderModeAsyncRenderStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        Utils.emitEvent('emitRenderModeAsync', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebRenderModeAsyncRenderStatic', 'renderModeAsync', 1701, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewWebConstructor', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        console.log('testWebRenderModeAsyncRenderStatic' + err);
      }
      done();
    })

    /**
     * @tc.name   testWebRenderModeSyncRenderStatic
     * @tc.number SUB_ACE_WEB_RENDER_MODE_0200
     * @tc.desc   test Web constructor with renderMode: SYNC_RENDER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebRenderModeSyncRenderStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        Utils.emitEvent('emitRenderModeSync', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebRenderModeSyncRenderStatic', 'renderModeSync', 1702, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewWebConstructor', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        console.log('testWebRenderModeSyncRenderStatic' + err);
      }
      done();
    })

    /**
     * @tc.name   testWebEmulateTouchFromMouseEventFalseStatic
     * @tc.number SUB_ACE_WEB_RENDER_MODE_0300
     * @tc.desc   test Web constructor with emulateTouchFromMouseEvent: false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebEmulateTouchFromMouseEventFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        Utils.emitEvent('emitEmulateTouchFromMouseEventFalse', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebEmulateTouchFromMouseEventFalseStatic', 'emulateTouchFromMouseEventFalse', 1703, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewWebConstructor', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        console.log('testWebEmulateTouchFromMouseEventFalseStatic' + err);
      }
      done();
    })

    /**
     * @tc.name   testWebRenderModeUndefinedStatic
     * @tc.number SUB_ACE_WEB_RENDER_MODE_0400
     * @tc.desc   test Web constructor with renderMode: undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebRenderModeUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        Utils.emitEvent('emitRenderModeUndefined', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebRenderModeUndefinedStatic', 'renderModeUndefined', 1704, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewWebConstructor', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        console.log('testWebRenderModeUndefinedStatic' + err);
      }
      done();
    })

    /**
     * @tc.name   testWebEmulateTouchNullStatic
     * @tc.number SUB_ACE_WEB_RENDER_MODE_0500
     * @tc.desc   test Web constructor with emulateTouchFromMouseEvent: null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebEmulateTouchNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        Utils.emitEvent('emitEmulateTouchNull', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebEmulateTouchNullStatic', 'emulateTouchNull', 1705, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewWebConstructor', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        console.log('testWebEmulateTouchNullStatic' + err);
      }
      done();
    })

    /**
     * @tc.name   testOnSwitchNextPage04
     * @tc.number SUB_ACE_WEB_RENDER_MODE_0600
     * @tc.desc   test testOnSwitchNextPage04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnSwitchNextPage04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitOnSwitchNextPage04', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewWebConstructor', 10, '');
        await Utils.msSleep(3000);
      } catch(err) {
        console.log('testOnSwitchNextPage04' + err);
        }
        done()
      })
  })
}