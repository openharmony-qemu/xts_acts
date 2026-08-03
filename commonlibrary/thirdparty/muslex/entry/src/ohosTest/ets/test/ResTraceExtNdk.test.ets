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
import librestraceextndktest from 'librestraceextndktest.so';

export default function RestraceExtNdkTest() {
  describe('RestraceExtNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testrestraceExtNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_EXT_0100
     * @tc.desc   Extended resource trace basic write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceExtNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestraceextndktest.restraceExtNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testrestraceExtNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_EXT_0200
     * @tc.desc   Extended resource trace with tag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceExtNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestraceextndktest.restraceExtNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testrestraceExtNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_EXT_0300
     * @tc.desc   Extended resource trace with weak ref
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceExtNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestraceextndktest.restraceExtNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testrestraceExtNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_EXT_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceExtNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestraceextndktest.restraceExtNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testrestraceExtAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_EXT_0500
     * @tc.desc   Extended trace with null address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceExtAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestraceextndktest.restraceExtAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testrestraceExtAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_EXT_0600
     * @tc.desc   Extended trace with zero size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceExtAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestraceextndktest.restraceExtAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testrestraceExtBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_EXT_0700
     * @tc.desc   Extended trace max size boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceExtBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestraceextndktest.restraceExtBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testrestraceExtBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_EXT_0800
     * @tc.desc   Extended trace min size boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceExtBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestraceextndktest.restraceExtBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testrestraceExtStable001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_EXT_0900
     * @tc.desc   Repeated extended trace stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceExtStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestraceextndktest.restraceExtStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testrestraceExtThread001
     * @tc.number SUB_THIRDPARTY_MUSL_RES_TRACE_EXT_1000
     * @tc.desc   Multi-thread extended trace concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testrestraceExtThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = librestraceextndktest.restraceExtThread001();
      expect(resNum == 1).assertTrue();
      done();
    });

  });
}