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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import nativeModule from "libnapiComplexScenarios.so";
import fs from '@ohos.file.fs';
import Utils from './Utils'

export default function complexScenariosTest(): void {
  describe("ActsComplexScenariosTest", (): void => {
  
    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ANITESTONE_0100
     * @tc.name testAni01Chapter0001
     * @tc.desc Array batch operation - ArkTS passes array, Native multiplies each element by 2, verify result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAni01Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const src: number[] = [1, 2, 3, 4, 5];
      const result: number[] = nativeModule.testAniArrayDouble(src);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
      expect(result[3]).assertEqual(8);
      expect(result[4]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ANITESTONE_0200
     * @tc.name testAni01Chapter0002
     * @tc.desc Matrix transpose - ArkTS passes 2x3 matrix ArrayBuffer, Native transposes, verify 3x2 result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAni01Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const srcBuf: ArrayBuffer = new ArrayBuffer(24);
      const srcView: Float32Array = new Float32Array(srcBuf);
      srcView.set([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      const dstBuf: ArrayBuffer = nativeModule.testAniMatrixTranspose(srcBuf, 2, 3);
      const dstView: Float32Array = new Float32Array(dstBuf);
      expect(dstView[0]).assertEqual(1.0);
      expect(dstView[1]).assertEqual(4.0);
      expect(dstView[2]).assertEqual(2.0);
      expect(dstView[3]).assertEqual(5.0);
      expect(dstView[4]).assertEqual(3.0);
      expect(dstView[5]).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ANITESTONE_0300
     * @tc.name testAni01Chapter0003
     * @tc.desc Bitwise NOT encrypt - ArkTS passes ArrayBuffer, Native flips all bits, verify data changed then restored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAni01Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const view: Uint8Array = new Uint8Array(buf);
      view.set([0x48, 0x65, 0x6C, 0x6C, 0x6F]);
      nativeModule.testAniXorEncrypt(buf);
      expect(view[0]).assertEqual(~0x48 & 0xFF);
      nativeModule.testAniXorEncrypt(buf);
      expect(view[0]).assertEqual(0x48);
      expect(view[1]).assertEqual(0x65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ANITESTONE_0400
     * @tc.name testAni01Chapter0004
     * @tc.desc File transfer - ArkTS writes temp file, Native uses sendfile for zero-copy transfer, verify content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAni01Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testDir: string = '/data/storage/el2/base/haps/entry_test';
      try { fs.mkdirSync(testDir); } catch (e) { /* directory may already exist */ }
      const srcPath: string = testDir + '/test_src.bin';
      const dstPath: string = testDir + '/test_dst.bin';
      const srcFile = fs.openSync(srcPath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      const content = new Uint8Array([72, 101, 108, 108, 111]);
      fs.writeSync(srcFile.fd, content.buffer);
      fs.closeSync(srcFile);
      const ok: boolean = nativeModule.testAniFileCopy(srcPath, dstPath, 5);
      expect(ok).assertTrue();
      const dstFile = fs.openSync(dstPath, fs.OpenMode.READ_ONLY);
      const buf = new ArrayBuffer(5);
      fs.readSync(dstFile.fd, buf);
      fs.closeSync(dstFile);
      const view = new Uint8Array(buf);
      expect(view[0]).assertEqual(72);
      expect(view[1]).assertEqual(101);
      expect(view[2]).assertEqual(108);
      expect(view[3]).assertEqual(108);
      expect(view[4]).assertEqual(111);
      fs.unlinkSync(srcPath);
      fs.unlinkSync(dstPath);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ANITESTONE_0500
     * @tc.name testAni01Chapter0005
     * @tc.desc System info - Native calls sysconf, verify CPU cores > 0 and page size is power of 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAni01Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const info: Record<string, number> = nativeModule.testAniSysInfo() as Record<string, number>;
      const cores: number = info['cpuCores'] as number;
      const pageSize: number = info['pageSize'] as number;
      expect(cores > 0).assertEqual(true);
      expect(pageSize > 0).assertEqual(true);
      expect((pageSize & (pageSize - 1)) === 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ANITESTONE_0600
     * @tc.name testAni01Chapter0006
     * @tc.desc Physics lifecycle - create world with gravity, step 100 times, destroy, verify stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAni01Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let handle: number = nativeModule.testAniCreatePhysics(9.8);
      expect(handle !== 0).assertEqual(true);
      for (let i = 0; i < 100; i++) {
        nativeModule.testAniStepPhysics(handle, 0.016);
      }
      nativeModule.testAniDestroyPhysics(handle);
      handle = 0;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ANITESTONE_0700
     * @tc.name testAni01Chapter0007
     * @tc.desc Feature extraction - ArkTS passes array, Native samples every 4th element, verify result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAni01Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const src: number[] = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0];
      const result: Record<string, Object> = nativeModule.testAniFeatureExtract(src) as Record<string, Object>;
      const resultLen: number = result['len'] as number;
      const resultDst: number[] = result['dst'] as number[];
      expect(resultLen).assertEqual(3);
      expect(resultDst[0]).assertEqual(1.0);
      expect(resultDst[1]).assertEqual(5.0);
      expect(resultDst[2]).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ANITESTONE_0800
     * @tc.name testAni01Chapter0008
     * @tc.desc ResetError - Native throws error via napi_throw_error, verifies pending exception detection, clearing, and environment recovery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAni01Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = nativeModule.testAniErrorTrigger();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ANITESTONE_0900
     * @tc.name testAni01Chapter0009
     * @tc.desc Parallel execution - Native creates threads, computes i*i, sums atomically, verify result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAni01Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: Object = nativeModule.testAniParallelSum(4);
      const resultStr: string = JSON.stringify(result);
      const sumOk: boolean = resultStr.includes('"sumCorrect":1');
      const contentionOk: boolean = resultStr.includes('"contentionCorrect":1');
      expect(sumOk).assertTrue();
      expect(contentionOk).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ANITESTONE_1000
     * @tc.name testAni01Chapter0010
     * @tc.desc Async compute - Native starts detached thread, calls ArkTS callback after delay via GlobalReference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAni01Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let callbackCalled: boolean = false;
      const result: boolean = nativeModule.testAniAsyncCompute(() => {
        callbackCalled = true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ANITESTONE_1100
     * @tc.name testAni01Chapter0011
     * @tc.desc Cached lookup - verify GlobalReference cache for String class works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAni01Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = nativeModule.testAniCachedLookup();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ANITESTONE_1200
     * @tc.name testAni01Chapter0012
     * @tc.desc Dynamic registration - dynAdd/dynSub registered via Module_Bind, verify callable from ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAni01Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result: boolean = nativeModule.testAniDynamicRegistration();
      expect(result).assertTrue();
      const sum: number = nativeModule.dynAdd(3, 5);
      expect(sum).assertEqual(8);
      const diff: number = nativeModule.dynSub(10, 4);
      expect(diff).assertEqual(6);
    });
  });
}
