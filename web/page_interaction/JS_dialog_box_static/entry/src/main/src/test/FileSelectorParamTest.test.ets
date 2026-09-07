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
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { UIContext, Router } from '@ohos.arkui.UIContext';
let testAbilityContext:common.UIAbilityContext;
export default function fileSelectorParamTest():void {
  describe('FileSelectorParamTest', (): void => {
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
      console.info('FileSelectorParamTest beforeEach start');
    })

    /**
    * @tc.name        testFileSelectorParamConstructorStatic001
    * @tc.number      SUB_WEB_FILESELECTORPARAM_CONSTRUCTOR_0100
    * @tc.desc        test interface of FileSelectorParam constructor with static call
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testFileSelectorParamConstructorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitFileSelectorParamConstructor', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testFileSelectorParamConstructorStatic001", true, 115000, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('FileSelectorParamTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

    /**
    * @tc.name        testFileSelectorParamConstructorNullCheckStatic002
    * @tc.number      SUB_WEB_FILESELECTORPARAM_CONSTRUCTOR_NULL_0200
    * @tc.desc        test FileSelectorParam constructor result null coverage check
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testFileSelectorParamConstructorNullCheckStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitFileSelectorParamConstructorNullCheck', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testFileSelectorParamConstructorNullCheckStatic002", true, 115020, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('FileSelectorParamTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

    /**
    * @tc.name        testFileSelectorParamConstructorUndefinedCheckStatic003
    * @tc.number      SUB_WEB_FILESELECTORPARAM_CONSTRUCTOR_UNDEFINED_0300
    * @tc.desc        test FileSelectorParam constructor result undefined coverage check
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testFileSelectorParamConstructorUndefinedCheckStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitFileSelectorParamConstructorUndefinedCheck', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testFileSelectorParamConstructorUndefinedCheckStatic003", true, 115040, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('FileSelectorParamTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

    /**
    * @tc.name        testFileSelectorParamInstanceTypeStatic004
    * @tc.number      SUB_WEB_FILESELECTORPARAM_INSTANCE_TYPE_0400
    * @tc.desc        test FileSelectorParam constructor return value is instance of FileSelectorParam
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testFileSelectorParamInstanceTypeStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitFileSelectorParamInstanceType', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testFileSelectorParamInstanceTypeStatic004", true, 115060, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('FileSelectorParamTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

    /**
    * @tc.name        testFileSelectorParamGetTitleStatic005
    * @tc.number      SUB_WEB_FILESELECTORPARAM_GET_TITLE_0500
    * @tc.desc        test FileSelectorParam getTitle return value on constructor-created instance
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testFileSelectorParamGetTitleStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitFileSelectorParamGetTitle', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testFileSelectorParamGetTitleStatic005", '', 115080, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('FileSelectorParamTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

    /**
    * @tc.name        testFileSelectorParamGetModeStatic006
    * @tc.number      SUB_WEB_FILESELECTORPARAM_GET_MODE_0600
    * @tc.desc        test FileSelectorParam getMode return value on constructor-created instance
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testFileSelectorParamGetModeStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitFileSelectorParamGetMode', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testFileSelectorParamGetModeStatic006", 0, 115100, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('FileSelectorParamTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

    /**
    * @tc.name        testFileSelectorParamGetAcceptTypeStatic007
    * @tc.number      SUB_WEB_FILESELECTORPARAM_GET_ACCEPT_TYPE_0700
    * @tc.desc        test FileSelectorParam getAcceptType return value on constructor-created instance
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testFileSelectorParamGetAcceptTypeStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitFileSelectorParamGetAcceptType', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testFileSelectorParamGetAcceptTypeStatic007", '[]', 115120, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('FileSelectorParamTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

    /**
    * @tc.name        testFileSelectorParamIsCaptureStatic008
    * @tc.number      SUB_WEB_FILESELECTORPARAM_IS_CAPTURE_0800
    * @tc.desc        test FileSelectorParam isCapture return value on constructor-created instance
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testFileSelectorParamIsCaptureStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitFileSelectorParamIsCapture', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testFileSelectorParamIsCaptureStatic008", false, 115140, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('FileSelectorParamTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

    /**
    * @tc.name        testFileSelectorParamMultipleInstancesStatic009
    * @tc.number      SUB_WEB_FILESELECTORPARAM_MULTIPLE_INSTANCES_0900
    * @tc.desc        test FileSelectorParam constructor creates independent instances
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testFileSelectorParamMultipleInstancesStatic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitFileSelectorParamMultipleInstances', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testFileSelectorParamMultipleInstancesStatic009", true, 115160, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('FileSelectorParamTestButton', 10, '');
        await Utils.msSleep(6000);
      } catch(err) {
        expect().assertFail();
      }
      done()
    })

  })
}

