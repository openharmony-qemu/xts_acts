'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect  } from '../../../hypium/index';
import { startAbility, Utils } from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { UIContext, Router } from '@ohos.arkui.UIContext';
let testAbilityContext:common.UIAbilityContext;
export default function mouseInfoCallbackTest():void {
  describe('MouseInfoCallbackTest', (): void => {
    beforeAll(async (): Promise<void> => {
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName:'entry',
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      let cmd = 'aa start -a EntryAbility -b com.open.harmony.logpointfourtest.static';
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(5000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      console.info('MouseInfoCallbackTest beforeEach start');
    })

    /**
    * @tc.name        testMouseInfoCallbackTypeStatic001
    * @tc.number      SUB_WEB_MOUSEINFOCALLBACK_TYPE_0100
    * @tc.desc        test interface of MouseInfoCallback type definition with static call
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testMouseInfoCallbackTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitMouseInfoCallbackType', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testMouseInfoCallbackTypeStatic001", true, 113000, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('MouseInfoCallbackTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

    /**
    * @tc.name        testMouseInfoCallbackNormalEventStatic002
    * @tc.number      SUB_WEB_MOUSEINFOCALLBACK_NORMAL_EVENT_0200
    * @tc.desc        test MouseInfoCallback with valid NativeEmbedMouseInfo event parameter
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testMouseInfoCallbackNormalEventStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitMouseInfoCallbackNormalEvent', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testMouseInfoCallbackNormalEventStatic002", true, 113020, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('MouseInfoCallbackTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

    /**
    * @tc.name        testMouseInfoCallbackEventNullCheckStatic003
    * @tc.number      SUB_WEB_MOUSEINFOCALLBACK_EVENT_NULL_0300
    * @tc.desc        test MouseInfoCallback first parameter event null coverage check
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testMouseInfoCallbackEventNullCheckStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitMouseInfoCallbackEventNullCheck', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testMouseInfoCallbackEventNullCheckStatic003", true, 113040, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('MouseInfoCallbackTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

    /**
    * @tc.name        testMouseInfoCallbackEventUndefinedCheckStatic004
    * @tc.number      SUB_WEB_MOUSEINFOCALLBACK_EVENT_UNDEFINED_0400
    * @tc.desc        test MouseInfoCallback first parameter event undefined coverage check
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testMouseInfoCallbackEventUndefinedCheckStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitMouseInfoCallbackEventUndefinedCheck', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testMouseInfoCallbackEventUndefinedCheckStatic004", true, 113060, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('MouseInfoCallbackTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

    /**
    * @tc.name        testMouseInfoCallbackWithEmbedIdStatic005
    * @tc.number      SUB_WEB_MOUSEINFOCALLBACK_EMBED_ID_0500
    * @tc.desc        test MouseInfoCallback processes NativeEmbedMouseInfo embedId field
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testMouseInfoCallbackWithEmbedIdStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitMouseInfoCallbackWithEmbedId', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testMouseInfoCallbackWithEmbedIdStatic005", 'nativeEmbedId_001', 113080, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('MouseInfoCallbackTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

    /**
    * @tc.name        testMouseInfoCallbackWithEventResultStatic006
    * @tc.number      SUB_WEB_MOUSEINFOCALLBACK_EVENT_RESULT_0600
    * @tc.desc        test MouseInfoCallback processes NativeEmbedMouseInfo result field with setMouseEventResult
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testMouseInfoCallbackWithEventResultStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitMouseInfoCallbackWithEventResult', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testMouseInfoCallbackWithEventResultStatic006", true, 113100, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('MouseInfoCallbackTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

    /**
    * @tc.name        testMouseInfoCallbackOnNativeEmbedMouseEventStatic007
    * @tc.number      SUB_WEB_MOUSEINFOCALLBACK_ON_NATIVE_EMBED_MOUSE_EVENT_0700
    * @tc.desc        test onNativeEmbedMouseEvent registers MouseInfoCallback on Web component
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testMouseInfoCallbackOnNativeEmbedMouseEventStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitMouseInfoCallbackOnNativeEmbedMouseEvent', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testMouseInfoCallbackOnNativeEmbedMouseEventStatic007", true, 113120, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('MouseInfoCallbackTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })


    /**
     * @tc.name        testSwitchNextPageWebInitTest
     * @tc.number      SUB_WEB_NEXT_PAGE_0800
     * @tc.desc        onWindowNewExt
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('testSwitchNextPageWebInitTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        try {
          Utils.emitEvent("emitSwitchNextPageWebInitTest", 10)
          await Utils.msSleep(3000);
          inspector.sendEventByKey('MouseInfoCallbackTestButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name        testSwitchNextPageOnContextMenuHideCallbackTest
     * @tc.number      SUB_WEB_NEXT_PAGE_0900
     * @tc.desc        onPageNext
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('testSwitchNextPageOnContextMenuHideCallbackTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        try {
          Utils.emitEvent("emitSwitchNextPageOnContextMenuHideCallbackTest", 10)
          await Utils.msSleep(3000);
          inspector.sendEventByKey('MouseInfoCallbackTestButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          expect().assertFail();
        }
        done();
      })


  })
}


