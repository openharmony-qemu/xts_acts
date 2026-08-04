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
import getaddrcustomndktest from 'libgetaddrcustomndktest.so';

export default function GetaddrinfoCustomNdkTest() {
  describe('GetaddrinfoCustomNdkTest', () => {

    beforeEach(async () => { await Utils.sleep(50); });

    /**
     * @tc.name   testGetaddrinfoCustomNormal001
     * @tc.number SUB_THIRDPARTY_MUSL_GETADDRINFO_CUSTOM_0100
     * @tc.desc   Custom getaddrinfo with localhost:80 basic query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetaddrinfoCustomNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getaddrcustomndktest.getaddrinfoCustomNormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetaddrinfoCustomNormal002
     * @tc.number SUB_THIRDPARTY_MUSL_GETADDRINFO_CUSTOM_0200
     * @tc.desc   Custom getaddrinfo with AF_INET6 address family
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetaddrinfoCustomNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getaddrcustomndktest.getaddrinfoCustomNormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetaddrinfoCustomNormal003
     * @tc.number SUB_THIRDPARTY_MUSL_GETADDRINFO_CUSTOM_0300
     * @tc.desc   Custom getaddrinfo with SOCK_DGRAM socket type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetaddrinfoCustomNormal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getaddrcustomndktest.getaddrinfoCustomNormal003();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetaddrinfoCustomNormal004
     * @tc.number SUB_THIRDPARTY_MUSL_GETADDRINFO_CUSTOM_0400
     * @tc.desc   Stub mode passthrough test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetaddrinfoCustomNormal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getaddrcustomndktest.getaddrinfoCustomNormal004();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetaddrinfoCustomAbnormal001
     * @tc.number SUB_THIRDPARTY_MUSL_GETADDRINFO_CUSTOM_0500
     * @tc.desc   Custom getaddrinfo with null hints
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetaddrinfoCustomAbnormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getaddrcustomndktest.getaddrinfoCustomAbnormal001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetaddrinfoCustomAbnormal002
     * @tc.number SUB_THIRDPARTY_MUSL_GETADDRINFO_CUSTOM_0600
     * @tc.desc   Custom getaddrinfo with null hostname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetaddrinfoCustomAbnormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getaddrcustomndktest.getaddrinfoCustomAbnormal002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetaddrinfoCustomBoundary001
     * @tc.number SUB_THIRDPARTY_MUSL_GETADDRINFO_CUSTOM_0700
     * @tc.desc   Custom getaddrinfo with empty hostname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetaddrinfoCustomBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getaddrcustomndktest.getaddrinfoCustomBoundary001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetaddrinfoCustomBoundary002
     * @tc.number SUB_THIRDPARTY_MUSL_GETADDRINFO_CUSTOM_0800
     * @tc.desc   Custom getaddrinfo with max port value 65535
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetaddrinfoCustomBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getaddrcustomndktest.getaddrinfoCustomBoundary002();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetaddrinfoCustomStable001
     * @tc.number SUB_THIRDPARTY_MUSL_GETADDRINFO_CUSTOM_0900
     * @tc.desc   Repeated custom getaddrinfo calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetaddrinfoCustomStable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getaddrcustomndktest.getaddrinfoCustomStable001();
      expect(resNum == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   testGetaddrinfoCustomThread001
     * @tc.number SUB_THIRDPARTY_MUSL_GETADDRINFO_CUSTOM_1000
     * @tc.desc   Multi-thread custom getaddrinfo concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetaddrinfoCustomThread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let resNum: number = getaddrcustomndktest.getaddrinfoCustomThread001();
      expect(resNum == 1).assertTrue();
      done();
    });
  });
}