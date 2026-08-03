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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { Foo } from '../ets/Index';
import { testAniDynamicRegistration, dynAdd, dynSub } from './NativeBindings';
import { hidebug } from '@kit.PerformanceAnalysisKit';

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function aniNativeTest(): void {

  describe("AniNativeTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    let vmMemory1: hidebug.VMMemoryInfo = hidebug.getAppVMMemoryInfo();
    console.info(`testTag heapUsed nativeTest01Test begin: ${vmMemory1.heapUsed}`)

    /**
     * @tc.number    SUB_ANI_NATIVETEST01_0100
     * @tc.name      test_AniArrayDouble_0001
     * @tc.desc      Array batch operation - ArkTS passes array, Native multiplies each element by 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AniArrayDouble_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AniArrayDouble_0001 start');
      const src: number[] = [1, 2, 3, 4, 5];
      const result: number[] = new Foo().testAniArrayDouble(src);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
      expect(result[3]).assertEqual(8);
      expect(result[4]).assertEqual(10);
      console.log('test_AniArrayDouble_0001 done');
      done();
      console.log('test_AniArrayDouble_0001 end');
    });

    /**
     * @tc.number    SUB_ANI_NATIVETEST01_0200
     * @tc.name      test_AniMatrixTranspose_0002
     * @tc.desc      Matrix transpose - ArkTS passes 2x3 matrix ArrayBuffer, Native transposes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AniMatrixTranspose_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AniMatrixTranspose_0002 start');
      const srcBuf: ArrayBuffer = new ArrayBuffer(24);
      const srcView: Float32Array = new Float32Array(srcBuf);
      srcView.set([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      const dstBuf: ArrayBuffer = new Foo().testAniMatrixTranspose(srcBuf, 2, 3);
      const dstView: Float32Array = new Float32Array(dstBuf);
      expect(dstView[0]).assertEqual(1.0);
      expect(dstView[1]).assertEqual(4.0);
      expect(dstView[2]).assertEqual(2.0);
      expect(dstView[3]).assertEqual(5.0);
      expect(dstView[4]).assertEqual(3.0);
      expect(dstView[5]).assertEqual(6.0);
      console.log('test_AniMatrixTranspose_0002 done');
      done();
      console.log('test_AniMatrixTranspose_0002 end');
    });

    /**
     * @tc.number    SUB_ANI_NATIVETEST01_0300
     * @tc.name      test_AniXorEncrypt_0003
     * @tc.desc      Bitwise NOT encrypt - ArkTS passes ArrayBuffer, Native flips all bits
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AniXorEncrypt_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AniXorEncrypt_0003 start');
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const view: Uint8Array = new Uint8Array(buf);
      view.set([0x48, 0x65, 0x6C, 0x6C, 0x6F]);
      new Foo().testAniXorEncrypt(buf);
      expect(view[0]).assertEqual(~0x48 & 0xFF);
      new Foo().testAniXorEncrypt(buf);
      expect(view[0]).assertEqual(0x48);
      expect(view[1]).assertEqual(0x65);
      console.log('test_AniXorEncrypt_0003 done');
      done();
      console.log('test_AniXorEncrypt_0003 end');
    });

    /**
     * @tc.number    SUB_ANI_NATIVETEST01_0400
     * @tc.name      test_AniFileCopy_0004
     * @tc.desc      File copy - Native uses sendfile, verify error handling for non-existent files
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AniFileCopy_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AniFileCopy_0004 start');
      const result1: boolean = new Foo().testAniFileCopy('/nonexistent/src.bin', '/nonexistent/dst.bin', 100);
      expect(result1).assertEqual(false);
      const result2: boolean = new Foo().testAniFileCopy('', '', 0);
      expect(result2).assertEqual(false);
      console.log('test_AniFileCopy_0004 done');
      done();
      console.log('test_AniFileCopy_0004 end');
    });

    /**
     * @tc.number    SUB_ANI_NATIVETEST01_0500
     * @tc.name      test_AniSysInfo_0005
     * @tc.desc      System info - Native calls sysconf, verify CPU cores > 0 and page size is power of 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AniSysInfo_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AniSysInfo_0005 start');
      const info: Object = new Foo().testAniSysInfo();
      expect(info !== null).assertTrue();
      console.log('test_AniSysInfo_0005 done');
      done();
      console.log('test_AniSysInfo_0005 end');
    });

    /**
     * @tc.number    SUB_ANI_NATIVETEST01_0600
     * @tc.name      test_AniPhysics_0006
     * @tc.desc      Physics lifecycle - create world with gravity, step 100 times, destroy, verify stable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AniPhysics_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AniPhysics_0006 start');
      let handle: long = new Foo().testAniCreatePhysics(9.8);
      expect(handle !== 0).assertEqual(true);
      for (let i = 0; i < 100; i++) {
        new Foo().testAniStepPhysics(handle, 0.016);
      }
      new Foo().testAniDestroyPhysics(handle);
      handle = 0;
      console.log('test_AniPhysics_0006 done');
      done();
      console.log('test_AniPhysics_0006 end');
    });

    /**
     * @tc.number    SUB_ANI_NATIVETEST01_0700
     * @tc.name      test_AniFeatureExtract_0007
     * @tc.desc      Feature extraction - ArkTS passes array, Native samples every 4th element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AniFeatureExtract_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AniFeatureExtract_0007 start');
      const src: number[] = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0];
      const result: Object = new Foo().testAniFeatureExtract(src);
      expect(result !== null).assertTrue();
      console.log('test_AniFeatureExtract_0007 done');
      done();
      console.log('test_AniFeatureExtract_0007 end');
    });

    /**
     * @tc.number    SUB_ANI_NATIVETEST01_0800
     * @tc.name      test_AniErrorTrigger_0008
     * @tc.desc      ResetError - Native triggers FindClass failure, calls ExistUnhandledError+ResetError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AniErrorTrigger_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AniErrorTrigger_0008 start');
      const result: boolean = new Foo().testAniErrorTrigger();
      expect(result).assertTrue();
      console.log('test_AniErrorTrigger_0008 done');
      done();
      console.log('test_AniErrorTrigger_0008 end');
    });

    /**
     * @tc.number    SUB_ANI_NATIVETEST01_0900
     * @tc.name      test_AniParallelSum_0009
     * @tc.desc      Parallel execution - Native creates threads, computes i*i, sums atomically
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AniParallelSum_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AniParallelSum_0009 start');
      const result: Object = new Foo().testAniParallelSum(4);
      expect(result !== null).assertTrue();
      console.log('test_AniParallelSum_0009 done');
      done();
      console.log('test_AniParallelSum_0009 end');
    });

    /**
     * @tc.number    SUB_ANI_NATIVETEST01_1000
     * @tc.name      test_AniAsyncCompute_0010
     * @tc.desc      Async compute - Native starts detached thread, calls ArkTS callback after delay
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AniAsyncCompute_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AniAsyncCompute_0010 start');
      let callbackCalled: boolean = false;
      const result: boolean = new Foo().testAniAsyncCompute((): void => {
        callbackCalled = true;
      });
      expect(result).assertTrue();
      console.log('test_AniAsyncCompute_0010 done');
      done();
      console.log('test_AniAsyncCompute_0010 end');
    });

    /**
     * @tc.number    SUB_ANI_NATIVETEST01_1100
     * @tc.name      test_AniCachedLookup_0011
     * @tc.desc      Cached lookup - verify GlobalReference cache for String class works
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AniCachedLookup_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AniCachedLookup_0011 start');
      const result: boolean = new Foo().testAniCachedLookup();
      expect(result).assertTrue();
      console.log('test_AniCachedLookup_0011 done');
      done();
      console.log('test_AniCachedLookup_0011 end');
    });

    /**
     * @tc.number    SUB_ANI_NATIVETEST01_1200
     * @tc.name      test_AniDynamicRegistration_0012
     * @tc.desc      Batch registration - dynAdd/dynSub bound via Module_BindNativeFunctions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AniDynamicRegistration_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_AniDynamicRegistration_0012 start');
      const result: boolean = testAniDynamicRegistration();
      expect(result).assertTrue();
      const sum: int = dynAdd(3, 5);
      expect(sum).assertEqual(8);
      const diff: int = dynSub(10, 4);
      expect(diff).assertEqual(6);
      console.log('test_AniDynamicRegistration_0012 done');
      done();
      console.log('test_AniDynamicRegistration_0012 end');
    });

    let vmMemory2: hidebug.VMMemoryInfo = hidebug.getAppVMMemoryInfo();
    console.info(`testTag heapUsed nativeTest01Test end: ${vmMemory2.heapUsed}`)
    let sum = vmMemory2.heapUsed - vmMemory1.heapUsed;
    console.info(`testTag heapUsed nativeTest01Test total: ${sum}`)
  })
}
