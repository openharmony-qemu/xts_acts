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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { UIContext, Router } from '@ohos.arkui.UIContext';
let testAbilityContext:common.UIAbilityContext;
export default function verifyPinHandlerTest():void {
  describe('VerifyPinHandlerTest', (): void => {
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
      console.info('VerifyPinHandlerTest beforeEach start');
    })

    /**
    * @tc.name        testVerifyPinHandlerConstructorStatic001
    * @tc.number      SUB_WEB_VERIFYPINHANDLER_CONSTRUCTOR_001
    * @tc.desc        test interface of VerifyPinHandler constructor with static call
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testVerifyPinHandlerConstructorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitVerifyPinHandlerConstructor', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testVerifyPinHandlerConstructorStatic001", true, 112200, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('VerifyPinHandlerTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testVerifyPinHandlerInstanceTypeStatic002
    * @tc.number      SUB_WEB_VERIFYPINHANDLER_INSTANCE_TYPE_002
    * @tc.desc        test VerifyPinHandler constructor return value is instance of VerifyPinHandler
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testVerifyPinHandlerInstanceTypeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitVerifyPinHandlerInstanceType', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testVerifyPinHandlerInstanceTypeStatic002", true, 112220, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('VerifyPinHandlerTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testVerifyPinHandlerConfirmSuccessStatic003
    * @tc.number      SUB_WEB_VERIFYPINHANDLER_CONFIRM_SUCCESS_003
    * @tc.desc        test VerifyPinHandler confirm method with PinVerifyResult.PIN_VERIFICATION_SUCCESS
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    //失败
    it('testVerifyPinHandlerConfirmSuccessStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitVerifyPinHandlerConfirmSuccess', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testVerifyPinHandlerConfirmSuccessStatic003", true, 112240, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('VerifyPinHandlerTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testVerifyPinHandlerConfirmFailedStatic004
    * @tc.number      SUB_WEB_VERIFYPINHANDLER_CONFIRM_FAILED_004
    * @tc.desc        test VerifyPinHandler confirm method with PinVerifyResult.PIN_VERIFICATION_FAILED
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    //失败
    it('testVerifyPinHandlerConfirmFailedStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitVerifyPinHandlerConfirmFailed', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testVerifyPinHandlerConfirmFailedStatic004", true, 112260, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('VerifyPinHandlerTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testVerifyPinHandlerMultipleInstancesStatic005
    * @tc.number      SUB_WEB_VERIFYPINHANDLER_MULTIPLE_INSTANCES_005
    * @tc.desc        test VerifyPinHandler constructor creates independent instances
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testVerifyPinHandlerMultipleInstancesStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitVerifyPinHandlerMultipleInstances', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testVerifyPinHandlerMultipleInstancesStatic005", true, 112280, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('VerifyPinHandlerTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testVerifyPinHandlerPinVerifyResultSuccessValueStatic006
    * @tc.number      SUB_WEB_VERIFYPINHANDLER_PINVERIFYRESULT_SUCCESS_006
    * @tc.desc        test PinVerifyResult.PIN_VERIFICATION_SUCCESS enum value
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testVerifyPinHandlerPinVerifyResultSuccessValueStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitVerifyPinHandlerPinVerifyResultSuccessValue', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testVerifyPinHandlerPinVerifyResultSuccessValueStatic006", 0, 112300, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('VerifyPinHandlerTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testVerifyPinHandlerPinVerifyResultFailedValueStatic007
    * @tc.number      SUB_WEB_VERIFYPINHANDLER_PINVERIFYRESULT_FAILED_007
    * @tc.desc        test PinVerifyResult.PIN_VERIFICATION_FAILED enum value
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testVerifyPinHandlerPinVerifyResultFailedValueStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitVerifyPinHandlerPinVerifyResultFailedValue', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testVerifyPinHandlerPinVerifyResultFailedValueStatic007", 1, 112320, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('VerifyPinHandlerTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testVerifyPinHandlerClassExportTypeofStatic008
    * @tc.number      SUB_WEB_VERIFYPINHANDLER_CLASS_EXPORT_TYPEOF_008
    * @tc.desc        test export declare class VerifyPinHandler constructor returns object type
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testVerifyPinHandlerClassExportTypeofStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitVerifyPinHandlerClassExportTypeof', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testVerifyPinHandlerClassExportTypeofStatic008", true, 112400, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('VerifyPinHandlerTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testVerifyPinHandlerClassExportConfirmMethodExistsStatic009
    * @tc.number      SUB_WEB_VERIFYPINHANDLER_CLASS_EXPORT_CONFIRM_EXISTS_009
    * @tc.desc        test export declare class VerifyPinHandler instance has confirm method of type function
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testVerifyPinHandlerClassExportConfirmMethodExistsStatic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitVerifyPinHandlerClassExportConfirmMethodExists', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testVerifyPinHandlerClassExportConfirmMethodExistsStatic009", true, 112420, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('VerifyPinHandlerTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testVerifyPinHandlerClassExportSharedPrototypeStatic010
    * @tc.number      SUB_WEB_VERIFYPINHANDLER_CLASS_EXPORT_SHARED_PROTO_010
    * @tc.desc        test export declare class VerifyPinHandler instances share the same confirm method
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testVerifyPinHandlerClassExportSharedPrototypeStatic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitVerifyPinHandlerClassExportSharedPrototype', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testVerifyPinHandlerClassExportSharedPrototypeStatic010", true, 112440, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('VerifyPinHandlerTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testVerifyPinHandlerClassExportInstanceObjectStatic011
    * @tc.number      SUB_WEB_VERIFYPINHANDLER_CLASS_EXPORT_INSTANCE_OBJECT_011
    * @tc.desc        test export declare class VerifyPinHandler instance is an Object
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testVerifyPinHandlerClassExportInstanceObjectStatic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitVerifyPinHandlerClassExportInstanceObject', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testVerifyPinHandlerClassExportInstanceObjectStatic011", true, 112460, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('VerifyPinHandlerTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testVerifyPinHandlerClassExportConfirmBothEnumsStatic012
    * @tc.number      SUB_WEB_VERIFYPINHANDLER_CLASS_EXPORT_CONFIRM_BOTH_ENUMS_012
    * @tc.desc        test export declare class VerifyPinHandler confirm with both PinVerifyResult enum values
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    // 失败
    it('testVerifyPinHandlerClassExportConfirmBothEnumsStatic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitVerifyPinHandlerClassExportConfirmBothEnums', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testVerifyPinHandlerClassExportConfirmBothEnumsStatic012", true, 112480, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('VerifyPinHandlerTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testVerifyPinHandlerClassExportClassAccessibleStatic013
    * @tc.number      SUB_WEB_VERIFYPINHANDLER_CLASS_EXPORT_ACCESSIBLE_013
    * @tc.desc        test export declare class VerifyPinHandler class reference is accessible and not undefined
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testVerifyPinHandlerClassExportClassAccessibleStatic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitVerifyPinHandlerClassExportClassAccessible', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testVerifyPinHandlerClassExportClassAccessibleStatic013", true, 112500, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('VerifyPinHandlerTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testVerifyPinHandlerClassExportPrototypeHasConfirmStatic014
    * @tc.number      SUB_WEB_VERIFYPINHANDLER_CLASS_EXPORT_PROTO_HAS_CONFIRM_014
    * @tc.desc        test export declare class VerifyPinHandler instance has confirm property via in operator
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testVerifyPinHandlerClassExportPrototypeHasConfirmStatic014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitVerifyPinHandlerClassExportPrototypeHasConfirm', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testVerifyPinHandlerClassExportPrototypeHasConfirmStatic014", true, 112520, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('VerifyPinHandlerTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })
  })
}


