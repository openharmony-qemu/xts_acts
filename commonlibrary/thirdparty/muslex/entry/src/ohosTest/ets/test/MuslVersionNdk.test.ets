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
import muslversionndktest from 'libmuslversionndktest.so';

export default function MuslVersionNdkTest() {
  describe('MuslVersionNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testMuslVersionNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_MUSL_VERSION_0100
     * @tc.desc   musl version returns non-null string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslVersionNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = muslversionndktest.muslVersionNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testMuslVersionNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_MUSL_VERSION_0200
     * @tc.desc   musl version string format check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslVersionNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = muslversionndktest.muslVersionNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testMuslVersionNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_MUSL_VERSION_0300
     * @tc.desc   musl version consistency across calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslVersionNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = muslversionndktest.muslVersionNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testMuslVersionNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_MUSL_VERSION_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslVersionNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = muslversionndktest.muslVersionNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testMuslVersionAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_MUSL_VERSION_0500
     * @tc.desc   musl version invalid parameter handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslVersionAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = muslversionndktest.muslVersionAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testMuslVersionAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_MUSL_VERSION_0600
     * @tc.desc   Repeated musl version calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslVersionAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = muslversionndktest.muslVersionAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testMuslVersionBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_MUSL_VERSION_0700
     * @tc.desc   musl version boundary test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslVersionBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = muslversionndktest.muslVersionBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testMuslVersionBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_MUSL_VERSION_0800
     * @tc.desc   musl version edge case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslVersionBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = muslversionndktest.muslVersionBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testMuslVersionStable001
     * @tc.number SUB_THIRDPARTY_MUSL_MUSL_VERSION_0900
     * @tc.desc   Repeated musl version stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslVersionStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = muslversionndktest.muslVersionStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testMuslVersionThread001
     * @tc.number SUB_THIRDPARTY_MUSL_MUSL_VERSION_1000
     * @tc.desc   Multi-thread musl version concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslVersionThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = muslversionndktest.muslVersionThread001();
      expect(resNum == 1).assertTrue();
      done();
    });
  });
}