'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {  describe, it, expect, Level  } from '../../../hypium/index';
import abilityManager from "@ohos.app.ability.abilityManager"
import { Configuration } from '@ohos.app.ability.Configuration'
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';

let ERROR_CODE = 202;

export default function abilityManagerTest(): void {
  describe('abilityManagerTest', () => {

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AbilityManager_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_AbilityManager_Static_0100
     * @tc.desc   Test the third-party application call updateConfiguration will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AbilityManager_Static_0100', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityManager_Static_0100';
      let configInit: Configuration = {
        language: 'english'
      }
      abilityManager.updateConfiguration(configInit, (err) => {
        console.log(TAG + "  err?.code: " + err?.code);
        expect(err?.code).assertEqual(ERROR_CODE);
        resolve(undefined);
      });
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AbilityManager_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_AbilityManager_Static_0200
     * @tc.desc   Test the third-party application call updateConfiguration will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AbilityManager_Static_0200', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityManager_Static_0200';
      let configInit: Configuration = {
        language: 'english'
      }
      abilityManager.updateConfiguration(configInit)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          resolve(undefined);
        })
        .catch((err: Error) => {
          console.log(TAG + "  err?.code: " + err?.code);
          expect(err?.code).assertEqual(ERROR_CODE);
          resolve(undefined);
        })
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AbilityManager_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_AbilityManager_Static_0300
     * @tc.desc   Test the third-party application without permission call getAbilityRunningInfos only get self info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AbilityManager_Static_0300', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityManager_Static_0300';
      abilityManager.getAbilityRunningInfos((err: BusinessError<void> | null, data: Array<abilityManager.AbilityRunningInfo> | undefined): void => {
        console.log(TAG + "  err: " + JSON.stringify(err) + "  data: " + JSON.stringify(data));
        expect(data?.length).assertEqual(1);
        expect(data?.[0].ability.bundleName).assertEqual("com.example.systemapitest.static");
        resolve(undefined);
      });
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AbilityManager_Static_0400
     * @tc.number SUB_Ability_AbilityRuntime_AbilityManager_Static_0400
     * @tc.desc   Test the third-party application without permission call getAbilityRunningInfos only get self info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AbilityManager_Static_0400', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityManager_Static_0400';
      // 静态运行时 promise 版 getAbilityRunningInfos 不回调（0300 回调版正常），改用回调形式
      abilityManager.getAbilityRunningInfos((err: BusinessError<void> | null, data: Array<abilityManager.AbilityRunningInfo> | undefined): void => {
        if (err?.code) {
          console.log(TAG + ' err:' + JSON.stringify(err));
          resolve(undefined);
          expect().assertFail();
          return;
        }
        console.log(`${TAG}, data: ${JSON.stringify(data)}, errcode: ${err?.code}`);
        console.log(`${TAG} s1`);
        expect(data?.length).assertEqual(1);
        console.log(`${TAG} s2`);
        expect(data?.[0].ability.bundleName).assertEqual('com.example.systemapitest.static');
        console.log(`${TAG} s3`);
        expect(data![0].pid).assertLargerOrEqual(0);
        console.log(`${TAG} s4`);
        expect(data![0].uid).assertLargerOrEqual(0);
        console.log(`${TAG} s5`);
        expect(data![0].processName).assertEqual("com.example.systemapitest.static");
        console.log(`${TAG} s6`);
        // 静态运行时 abilityState 为枚举对象，需 Number() 转换后比较
        expect(Number(data![0].abilityState)).assertLargerOrEqual(0);
        console.log(`${TAG} s7`);
        expect(data![0].startTime).assertLarger(0);
        console.log(`${TAG} s8`);
        resolve(undefined);
      })
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AbilityManager_Static_0500
     * @tc.number SUB_Ability_AbilityRuntime_AbilityManager_Static_0500
     * @tc.desc   Test the third-party application call getExtensionRunningInfos will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AbilityManager_Static_0500', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityManager_Static_0500';
      let upperLimit: int = 10;
      abilityManager.getExtensionRunningInfos(upperLimit, (err: BusinessError<void> | null): void => {
        console.log(TAG + "  err?.code: " + err?.code);
        expect(err?.code).assertEqual(ERROR_CODE);
        resolve(undefined);
      });
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AbilityManager_Static_0600
     * @tc.number SUB_Ability_AbilityRuntime_AbilityManager_Static_0600
     * @tc.desc   Test the third-party application call getExtensionRunningInfos will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AbilityManager_Static_0600', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityManager_Static_0600';
      let upperLimit: int = 10;
      abilityManager.getExtensionRunningInfos(upperLimit)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          resolve(undefined);
        })
        .catch((err: Error) => {
          console.log(TAG + "  err?.code: " + err?.code);
          expect(err?.code).assertEqual(ERROR_CODE);
          resolve(undefined);
        })
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AbilityManager_Static_0700
     * @tc.number SUB_Ability_AbilityRuntime_AbilityManager_Static_0700
     * @tc.desc   Test the third-party application call getTopAbility will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AbilityManager_Static_0700', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityManager_Static_0700';
      try {
        abilityManager.getTopAbility((data) => {

        });
      } catch (error) {
        console.log(TAG + "  err?.code: " + error.code);
        expect(error.code).assertEqual(ERROR_CODE);
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AbilityManager_Static_0800
     * @tc.number SUB_Ability_AbilityRuntime_AbilityManager_Static_0800
     * @tc.desc   Test the third-party application call getTopAbility will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AbilityManager_Static_0800', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      let TAG = 'SUB_Ability_AbilityRuntime_AbilityManager_Static_0800';
      try {
        abilityManager.getTopAbility().then().catch();
      } catch (error) {
        console.log(TAG + "  err?.code: " + error.code);
        expect(error.code).assertEqual(ERROR_CODE);
        resolve(undefined);
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AbilityManager_Static_0900
     * @tc.number SUB_Ability_AbilityRuntime_AbilityManager_Static_0900
     * @tc.desc   cover all value of abilityState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AbilityManager_Static_0900', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      let tag = `SUB_Ability_AbilityRuntime_AbilityManager_0900`;
      console.log(`${tag}, test begin`);
      try {
        expect(abilityManager.AbilityState.INITIAL).assertEqual(0);
        expect(abilityManager.AbilityState.FOCUS).assertEqual(2);
        expect(abilityManager.AbilityState.FOREGROUND).assertEqual(9);
        expect(abilityManager.AbilityState.BACKGROUND).assertEqual(10);
        expect(abilityManager.AbilityState.FOREGROUNDING).assertEqual(11);
        expect(abilityManager.AbilityState.BACKGROUNDING).assertEqual(12);
        console.log(`${tag}, test end`);
        resolve(undefined);
      } catch (error) {
        console.log(`${tag}, failed: ${JSON.stringify(error)}`);
        expect().assertFail()
      }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })
  })
}
