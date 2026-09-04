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
export default function onContextMenuHideCallbackTest():void {
  describe('OnContextMenuHideCallbackTest', (): void => {
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
      console.info('OnContextMenuHideCallbackTest beforeEach start');
    })

    /**
    * @tc.name        testOnContextMenuHideCallbackTypeStatic001
    * @tc.number      SUB_WEB_ONCONTEXTMENUHIDECALLBACK_TYPE_0100
    * @tc.desc        test interface of OnContextMenuHideCallback type definition with static call
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testOnContextMenuHideCallbackTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitOnContextMenuHideCallbackType', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testOnContextMenuHideCallbackTypeStatic001", true, 114000, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('OnContextMenuHideCallbackTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

    /**
    * @tc.name        testOnContextMenuHideCallbackNormalInvokeStatic002
    * @tc.number      SUB_WEB_ONCONTEXTMENUHIDECALLBACK_NORMAL_INVOKE_0200
    * @tc.desc        test OnContextMenuHideCallback can be invoked normally
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testOnContextMenuHideCallbackNormalInvokeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitOnContextMenuHideCallbackNormalInvoke', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testOnContextMenuHideCallbackNormalInvokeStatic002", true, 114020, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('OnContextMenuHideCallbackTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

    /**
    * @tc.name        testOnContextMenuHideCallbackParamNullStatic003
    * @tc.number      SUB_WEB_ONCONTEXTMENUHIDECALLBACK_PARAM_NULL_0300
    * @tc.desc        test OnContextMenuHideCallback first parameter callback null coverage check
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testOnContextMenuHideCallbackParamNullStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitOnContextMenuHideCallbackParamNull', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testOnContextMenuHideCallbackParamNullStatic003", true, 114040, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('OnContextMenuHideCallbackTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

    /**
    * @tc.name        testOnContextMenuHideCallbackParamUndefinedStatic004
    * @tc.number      SUB_WEB_ONCONTEXTMENUHIDECALLBACK_PARAM_UNDEFINED_0400
    * @tc.desc        test OnContextMenuHideCallback first parameter callback undefined coverage check
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testOnContextMenuHideCallbackParamUndefinedStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitOnContextMenuHideCallbackParamUndefined', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testOnContextMenuHideCallbackParamUndefinedStatic004", true, 114060, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('OnContextMenuHideCallbackTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

    /**
    * @tc.name        testOnContextMenuHideCallbackOnContextMenuHideStatic005
    * @tc.number      SUB_WEB_ONCONTEXTMENUHIDECALLBACK_ON_CONTEXT_MENU_HIDE_0500
    * @tc.desc        test onContextMenuHide registers OnContextMenuHideCallback on Web component
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testOnContextMenuHideCallbackOnContextMenuHideStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitOnContextMenuHideCallbackOnContextMenuHide', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testOnContextMenuHideCallbackOnContextMenuHideStatic005", true, 114080, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('OnContextMenuHideCallbackTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

    /**
    * @tc.name        testOnContextMenuHideCallbackReturnTypeStatic006
    * @tc.number      SUB_WEB_ONCONTEXTMENUHIDECALLBACK_RETURN_TYPE_0600
    * @tc.desc        test OnContextMenuHideCallback return type is void
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testOnContextMenuHideCallbackReturnTypeStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitOnContextMenuHideCallbackReturnType', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testOnContextMenuHideCallbackReturnTypeStatic006", true, 114100, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('OnContextMenuHideCallbackTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })


    /**
     * @tc.name        testSwitchNextPageWebInitTest
     * @tc.number      SUB_WEB_NEXT_PAGE_0700
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
          inspector.sendEventByKey('OnContextMenuHideCallbackTestButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name        testSwitchNextPageFileSelectorParamTest
     * @tc.number      SUB_WEB_NEXT_PAGE_PARAM_0800
     * @tc.desc        onWindowNewExt
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('testSwitchNextPageFileSelectorParamTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        try {
          Utils.emitEvent("emitSwitchNextPageFileSelectorParamTest", 10)
          await Utils.msSleep(3000);
          inspector.sendEventByKey('OnContextMenuHideCallbackTestButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          expect().assertFail();
        }
        done();
      })
  })
}

