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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../../hypium/index";
import appMemoryOptimizer from '@ohos.app.ability.appMemoryOptimizer';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'

const TEST_SUITE_NAME: string = 'ActsAppMemoryOptimizerTest';
let TEST_CASE_NAME: string = '';

const ERROR_CODE_FILE_TYPE: number = 16000163;
const ERROR_CODE_CONFIG_PARSE: number = 16000164;
let domain: int = 0x0000;
let tag: string = 'testTag'

export default function AppMemoryOptimizerStatic() {
  describe('AppMemoryOptimizerStatic', () => {

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0100
     * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0100
     * @tc.desc   Call evictFilePages with a valid .so file name, expect the promise is resolved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const itName: string = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0100'
      hilog.info(domain,tag, itName  + 'it begin');
      try {
        await appMemoryOptimizer.evictFilePages(['libentry.so']);
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.info(domain, tag,itName + 'failed code:'+ e?.code+ 'message:'+ e?.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0200
     * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0200
     * @tc.desc   all evictFilePages with a valid .hap file name, expect the promise is resolved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const itName: string = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0200'
      hilog.info(domain,tag, itName  + 'it begin');
      try {
        await appMemoryOptimizer.evictFilePages(['ActsAppMemoryOptimizerTest.hap']); 
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.info(domain, tag,itName + 'failed code:'+ e?.code+ 'message:'+ e?.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0300
     * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0300
     * @tc.desc   Call evictFilePages with a valid .hsp file name, expect the promise is resolved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const itName: string = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0300'
      hilog.info(domain,tag, itName  + 'it begin');
      try {
        await appMemoryOptimizer.evictFilePages(['library.hsp']);
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.info(domain, tag,itName + 'failed code:'+ e?.code+ 'message:'+ e?.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0400
     * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0400
     * @tc.desc   Call evictFilePages with an invalid file type (.txt), expect error code 16000163.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const itName: string = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0400'
      hilog.info(domain,tag, itName  + 'it begin');
      try {
        await appMemoryOptimizer.evictFilePages(['invalid.txt']);
        expect().assertFail();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.info(domain, tag,itName + 'failed code:'+ e?.code+ 'message:'+ e?.message);
        expect(e.code).assertEqual(ERROR_CODE_FILE_TYPE);
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0500
     * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0500
     * @tc.desc   Call evictFilePages with same type (.hsp).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const itName: string = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0500'
      hilog.info(domain,tag, itName  + 'it begin');
      try {
        await appMemoryOptimizer.evictFilePages(['library.hsp','library.hsp']);
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.info(domain, tag,itName + 'failed code:'+ e?.code+ 'message:'+ e?.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0600
     * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0600
     * @tc.desc   Call evictFilePages with empty.expect error code 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const itName: string = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0600'
      hilog.info(domain,tag,itName  + 'it begin');
      try {
        await appMemoryOptimizer.evictFilePages([]);
        expect().assertFail();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.info(domain,tag,itName + 'failed code:'+ e?.code+ 'message:'+ e?.message);
        expect(e.code).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0700
     * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0700
     * @tc.desc   Call evictFilePages with error type.expect error code 16000163.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const itName: string = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0700'
      hilog.info(domain,tag, itName  + 'it begin');
      try {
        await appMemoryOptimizer.evictFilePages(['library.hsp','sss.abc']);
        expect().assertFail();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.info(domain, tag,itName + 'failed code:'+ e?.code+ 'message:'+ e?.message);
        expect(e.code).assertEqual(ERROR_CODE_FILE_TYPE);
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0800
     * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0800
     * @tc.desc   Call evictFilePages with Contain special characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const itName: string = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0800'
      hilog.info(domain,tag, itName  + 'it begin');
      try {
        await appMemoryOptimizer.evictFilePages(['library.hsp','library\0.hsp']);
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.info(domain, tag,itName + 'failed code:'+ e?.code+ 'message:'+ e?.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0900
     * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0900
     * @tc.desc   Call evictFilePages with long filename.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const itName: string = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0900'
      hilog.info(domain,tag, itName  + 'it begin');
      try {
        let arr: string[] =[];
        for(let i=1;i<=1000;i++){
          arr.push("a" + i + ".so")
        }
        await appMemoryOptimizer.evictFilePages(arr);
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.info(domain, tag,itName + 'failed code:'+ e?.code+ 'message:'+ e?.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_1000
     * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_1000
     * @tc.desc   Call evictFilePages with Contain special characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const itName: string = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_1000'
      hilog.info(domain,tag, itName  + 'it begin');
      try {
        await appMemoryOptimizer.evictFilePages(['library.so -> /system/lib/liba.so']);
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.info(domain, tag,itName + 'failed code:'+ e?.code+ 'message:'+ e?.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_1100
     * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_1100
     * @tc.desc   Call evictFilePages with error type.expect error code 16000163.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const itName: string = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_1100'
      hilog.info(domain,tag, itName  + 'it begin');
      try {
        await appMemoryOptimizer.evictFilePages(['library.hsp','']);
        expect().assertFail();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.info(domain, tag,itName + 'failed code:'+ e?.code+ 'message:'+ e?.message);
        expect(e.code).assertEqual(ERROR_CODE_FILE_TYPE);
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_1200
     * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_1200
     * @tc.desc   Call evictFilePages with empty.expect error code 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const itName: string = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_1200'
      hilog.info(domain,tag, itName  + 'it begin');
      try {
        await appMemoryOptimizer.evictFilePages([]);
        expect().assertFail();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.info(domain, tag,itName + 'failed code:'+ e?.code+ 'message:'+ e?.message);
        expect(e.code).assertEqual(401);
      }
      done();
    })

    /**
    * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0100
    * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0100
    * @tc.desc   Call evictModuleFilePages with the entry module name, whose memory_optimizer.json
    *            contains a valid evictFilePages array, expect the promise is resolved.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0100', Level.LEVEL1, async (done: () => void): Promise<void> =>  {
      const itName: string = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0100';
      hilog.info(domain,tag, itName  + 'it begin');
      try {
        await appMemoryOptimizer.evictModuleFilePages(['entry']);
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.info(domain, tag,itName + 'failed code:' +e?.code + 'message:' +e?.message);
        expect().assertFail();
      }
      done();
    })

    /**
    * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0300
    * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0300
    * @tc.desc   Call evictModuleFilePages with the library2 module name, which has no
    *            memory_optimizer.json under rawfile, expect error code 16000164
    *            (failed to parse configuration file).
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0300', Level.LEVEL1, async (done: () => void): Promise<void> =>  {
      const itName: string = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0300';
      hilog.info(domain,tag, itName  + 'it begin');
      try {
        await appMemoryOptimizer.evictModuleFilePages(['library2']);
        expect().assertFail();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.info(domain, tag,itName + 'failed code:' +e?.code + 'message:' +e?.message);
        expect(e.code).assertEqual(ERROR_CODE_CONFIG_PARSE);
      }
      done();
    })

    /**
    * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0400
    * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0400
    * @tc.desc   Call evictModuleFilePages with empty, which has no
    *            memory_optimizer.json under rawfile, expect error code 401
    *            (failed to parse configuration file).
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0400', Level.LEVEL1, async (done: () => void): Promise<void> =>  {
      const itName: string = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0400';
      hilog.info(domain,tag, itName  + 'it begin');
      try {
        await appMemoryOptimizer.evictModuleFilePages([]);
        expect().assertFail();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.info(domain, tag,itName + 'failed code:' +e?.code + 'message:' +e?.message);
        expect(e.code).assertEqual(401);
      }
      done();
    })
 
  })
}
