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
import finitefdktest from 'libfinitefdktest.so';

export default function FinitefNdkTest() {
  describe('FinitefNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testFinitefNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_FINITEF_0100
     * @tc.desc   Verify __finitef identifies finite float values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFinitefNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = finitefdktest.finitefNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFinitefNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_FINITEF_0200
     * @tc.desc   Verify __finitef identifies non-finite float values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFinitefNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = finitefdktest.finitefNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFinitefBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_FINITEF_0300
     * @tc.desc   Verify __finitef handles FLT_MAX and FLT_MIN boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFinitefBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = finitefdktest.finitefBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFinitefBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_FINITEF_0400
     * @tc.desc   Verify __finitef handles near-boundary float values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFinitefBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = finitefdktest.finitefBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFinitefAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_FINITEF_0500
     * @tc.desc   Verify __finitef handles various NaN representations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFinitefAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = finitefdktest.finitefAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFinitefStable001
     * @tc.number SUB_THIRDPARTY_MUSL_FINITEF_0600
     * @tc.desc   Verify __finitef returns consistent results on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFinitefStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = finitefdktest.finitefStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testFinitefThread001
     * @tc.number SUB_THIRDPARTY_MUSL_FINITEF_0700
     * @tc.desc   Verify __finitef is thread-safe with concurrent calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFinitefThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resNum: number = finitefdktest.finitefThread001();
      expect(resNum == 1).assertTrue();
      done();
    });

  });
}