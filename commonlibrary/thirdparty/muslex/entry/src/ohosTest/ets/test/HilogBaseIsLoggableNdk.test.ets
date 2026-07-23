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

import { beforeEach, describe, expect, it, TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils';
import hilogbaseislogglendktest from 'libhilogbaseislogglendktest.so';

export default function HilogBaseIsLoggableNdkTest() {
  describe('HilogBaseIsLoggableNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testHilogBaseIsLoggableNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_IS_LOGGABLE_0100
     * @tc.desc   Check loggability for INFO level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBaseIsLoggableNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseislogglendktest.hilogBaseIsLoggableNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testHilogBaseIsLoggableNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_IS_LOGGABLE_0200
     * @tc.desc   Check loggability for ERROR level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBaseIsLoggableNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseislogglendktest.hilogBaseIsLoggableNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testHilogBaseIsLoggableNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_IS_LOGGABLE_0300
     * @tc.desc   Check loggability for DEBUG level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBaseIsLoggableNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseislogglendktest.hilogBaseIsLoggableNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testHilogBaseIsLoggableNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_IS_LOGGABLE_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBaseIsLoggableNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseislogglendktest.hilogBaseIsLoggableNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testHilogBaseIsLoggableAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_IS_LOGGABLE_0500
     * @tc.desc   Check loggability with null domain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBaseIsLoggableAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseislogglendktest.hilogBaseIsLoggableAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testHilogBaseIsLoggableAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_IS_LOGGABLE_0600
     * @tc.desc   Check loggability with null tag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBaseIsLoggableAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseislogglendktest.hilogBaseIsLoggableAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testHilogBaseIsLoggableBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_IS_LOGGABLE_0700
     * @tc.desc   Check loggability for FATAL level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBaseIsLoggableBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseislogglendktest.hilogBaseIsLoggableBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testHilogBaseIsLoggableBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_IS_LOGGABLE_0800
     * @tc.desc   Check loggability for CORE level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBaseIsLoggableBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseislogglendktest.hilogBaseIsLoggableBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testHilogBaseIsLoggableStable001
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_IS_LOGGABLE_0900
     * @tc.desc   Repeated isLoggable check calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBaseIsLoggableStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseislogglendktest.hilogBaseIsLoggableStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testHilogBaseIsLoggableThread001
     * @tc.number SUB_THIRDPARTY_MUSL_HILOG_BASE_IS_LOGGABLE_1000
     * @tc.desc   Multi-thread isLoggable concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHilogBaseIsLoggableThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = hilogbaseislogglendktest.hilogBaseIsLoggableThread001();
      expect(resNum == 1).assertTrue();
      done();
    });
  });
}