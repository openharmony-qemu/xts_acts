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
import libtimelocalndktest from 'libtimelocalndktest.so';

export default function TimelocalNdkTest() {
  describe('TimelocalNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testtimelocalNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_TIMELOCAL_0100
     * @tc.desc   timelocal basic local time conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtimelocalNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libtimelocalndktest.timelocalNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testtimelocalNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_TIMELOCAL_0200
     * @tc.desc   timelocal with DST adjustment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtimelocalNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libtimelocalndktest.timelocalNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testtimelocalNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_TIMELOCAL_0300
     * @tc.desc   timelocal for epoch time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtimelocalNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libtimelocalndktest.timelocalNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testtimelocalNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_TIMELOCAL_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtimelocalNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libtimelocalndktest.timelocalNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testtimelocalAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_TIMELOCAL_0500
     * @tc.desc   timelocal with invalid date fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtimelocalAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libtimelocalndktest.timelocalAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testtimelocalAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_TIMELOCAL_0600
     * @tc.desc   timelocal with negative time values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtimelocalAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libtimelocalndktest.timelocalAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testtimelocalBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_TIMELOCAL_0700
     * @tc.desc   timelocal for year 2038 boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtimelocalBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libtimelocalndktest.timelocalBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testtimelocalBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_TIMELOCAL_0800
     * @tc.desc   timelocal for Feb 29 leap year
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtimelocalBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libtimelocalndktest.timelocalBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testtimelocalStable001
     * @tc.number SUB_THIRDPARTY_MUSL_TIMELOCAL_0900
     * @tc.desc   Repeated timelocal calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtimelocalStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libtimelocalndktest.timelocalStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testtimelocalThread001
     * @tc.number SUB_THIRDPARTY_MUSL_TIMELOCAL_1000
     * @tc.desc   Multi-thread timelocal concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtimelocalThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = libtimelocalndktest.timelocalThread001();
      expect(resNum == 1).assertTrue();
      done();
    });

  });
}