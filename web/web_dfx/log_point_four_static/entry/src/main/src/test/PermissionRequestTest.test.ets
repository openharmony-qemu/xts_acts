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
export default function permissionRequestTest():void {
  describe('PermissionRequestTest', (): void => {
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
      console.info('PermissionRequestTest beforeEach start');
    })

    /**
    * @tc.name        testPermissionRequestConstructorStatic001
    * @tc.number      SUB_WEB_PERMISSIONREQUEST_CONSTRUCTOR_001
    * @tc.desc        test interface of PermissionRequest constructor with static call
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testPermissionRequestConstructorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitPermissionRequestConstructor', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testPermissionRequestConstructorStatic001", true, 112000, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('PermissionRequestTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testPermissionRequestInstanceTypeStatic002
    * @tc.number      SUB_WEB_PERMISSIONREQUEST_INSTANCE_TYPE_002
    * @tc.desc        test PermissionRequest constructor return value is instance of PermissionRequest
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testPermissionRequestInstanceTypeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitPermissionRequestInstanceType', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testPermissionRequestInstanceTypeStatic002", true, 112020, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('PermissionRequestTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testPermissionRequestGetOriginStatic003
    * @tc.number      SUB_WEB_PERMISSIONREQUEST_GET_ORIGIN_003
    * @tc.desc        test PermissionRequest getOrigin return value on constructor-created instance
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testPermissionRequestGetOriginStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitPermissionRequestGetOrigin', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testPermissionRequestGetOriginStatic003", '', 112040, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('PermissionRequestTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testPermissionRequestGetAccessibleResourceStatic004
    * @tc.number      SUB_WEB_PERMISSIONREQUEST_GET_ACCESSIBLE_RESOURCE_004
    * @tc.desc        test PermissionRequest getAccessibleResource return value on constructor-created instance
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testPermissionRequestGetAccessibleResourceStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitPermissionRequestGetAccessibleResource', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testPermissionRequestGetAccessibleResourceStatic004", '[]', 112060, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('PermissionRequestTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testPermissionRequestDenyStatic005
    * @tc.number      SUB_WEB_PERMISSIONREQUEST_DENY_005
    * @tc.desc        test PermissionRequest deny method on constructor-created instance
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testPermissionRequestDenyStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitPermissionRequestDeny', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testPermissionRequestDenyStatic005", true, 112080, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('PermissionRequestTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testPermissionRequestGrantEmptyStatic006
    * @tc.number      SUB_WEB_PERMISSIONREQUEST_GRANT_EMPTY_006
    * @tc.desc        test PermissionRequest grant method with empty array on constructor-created instance
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testPermissionRequestGrantEmptyStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitPermissionRequestGrantEmpty', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testPermissionRequestGrantEmptyStatic006", true, 112100, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('PermissionRequestTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testPermissionRequestGrantResourcesStatic007
    * @tc.number      SUB_WEB_PERMISSIONREQUEST_GRANT_RESOURCES_007
    * @tc.desc        test PermissionRequest grant method with resource types on constructor-created instance
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testPermissionRequestGrantResourcesStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitPermissionRequestGrantResources', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testPermissionRequestGrantResourcesStatic007", true, 112120, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('PermissionRequestTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testPermissionRequestMultipleInstancesStatic008
    * @tc.number      SUB_WEB_PERMISSIONREQUEST_MULTIPLE_INSTANCES_008
    * @tc.desc        test PermissionRequest constructor creates independent instances
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testPermissionRequestMultipleInstancesStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitPermissionRequestMultipleInstances', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testPermissionRequestMultipleInstancesStatic008", true, 112140, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('PermissionRequestTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })


    /**
     * @tc.name        testSwitchNextPageVerifyPinHandlerTest
     * @tc.number      SUB_WEB_NEXT_PAGE_0200
     * @tc.desc        onWindowNewExt
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 3
     */
    it('testSwitchNextPageVerifyPinHandlerTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        try {
          Utils.emitEvent("emitSwitchNextPageVerifyPinHandlerTest", 10)
          await Utils.msSleep(3000);
          inspector.sendEventByKey('PermissionRequestTestButton', 10, '');
          await Utils.msSleep(2000);
        } catch(err) {
          expect().assertFail();
        }
        done();
      })
  })
}


