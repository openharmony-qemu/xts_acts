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

import { describe, it, expect, Level, afterEach } from '@ohos/hypium';
import entry from 'libentry.so';

export default function VpeVideoApiTest() {
  describe('VpeVideoApiTest', () => {
    afterEach(() => {
      entry.TearDown();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_00100
     * @tc.number SUB_VPE_VIDEO_API_TEST_00100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_00100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest00100();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_00200
     * @tc.number SUB_VPE_VIDEO_API_TEST_00200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_00200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest00200();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_00300
     * @tc.number SUB_VPE_VIDEO_API_TEST_00300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_00300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest00300();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_00400
     * @tc.number SUB_VPE_VIDEO_API_TEST_00400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_00400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest00400();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_00500
     * @tc.number SUB_VPE_VIDEO_API_TEST_00500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_00500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest00500();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_00600
     * @tc.number SUB_VPE_VIDEO_API_TEST_00600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_00600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest00600();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_00700
     * @tc.number SUB_VPE_VIDEO_API_TEST_00700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_00700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest00700();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_00800
     * @tc.number SUB_VPE_VIDEO_API_TEST_00800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_00800', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest00800();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_00900
     * @tc.number SUB_VPE_VIDEO_API_TEST_00900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_00900', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest00900();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_01000
     * @tc.number SUB_VPE_VIDEO_API_TEST_01000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_01000', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest01000();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_01100
     * @tc.number SUB_VPE_VIDEO_API_TEST_01100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_01100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest01100();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_01200
     * @tc.number SUB_VPE_VIDEO_API_TEST_01200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_01200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest01200();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_01300
     * @tc.number SUB_VPE_VIDEO_API_TEST_01300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_01300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest01300();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_01400
     * @tc.number SUB_VPE_VIDEO_API_TEST_01400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_01400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest01400();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_01500
     * @tc.number SUB_VPE_VIDEO_API_TEST_01500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_01500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest01500();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_01600
     * @tc.number SUB_VPE_VIDEO_API_TEST_01600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_01600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest01600();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_01700
     * @tc.number SUB_VPE_VIDEO_API_TEST_01700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_01700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest01700();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_01800
     * @tc.number SUB_VPE_VIDEO_API_TEST_01800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_01800', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest01800();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_01900
     * @tc.number SUB_VPE_VIDEO_API_TEST_01900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_01900', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest01900();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_02000
     * @tc.number SUB_VPE_VIDEO_API_TEST_02000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_02000', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest02000();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_02100
     * @tc.number SUB_VPE_VIDEO_API_TEST_02100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_02100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest02100();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_02200
     * @tc.number SUB_VPE_VIDEO_API_TEST_02200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_02200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest02200();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_02300
     * @tc.number SUB_VPE_VIDEO_API_TEST_02300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_02300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest02300();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_02400
     * @tc.number SUB_VPE_VIDEO_API_TEST_02400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_02400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest02400();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_02500
     * @tc.number SUB_VPE_VIDEO_API_TEST_02500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_02500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest02500();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_02600
     * @tc.number SUB_VPE_VIDEO_API_TEST_02600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_02600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest02600();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_02700
     * @tc.number SUB_VPE_VIDEO_API_TEST_02700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_02700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest02700();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_02800
     * @tc.number SUB_VPE_VIDEO_API_TEST_02800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_02800', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest02800();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_02900
     * @tc.number SUB_VPE_VIDEO_API_TEST_02900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_02900', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest02900();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_03000
     * @tc.number SUB_VPE_VIDEO_API_TEST_03000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_03000', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest03000();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_03100
     * @tc.number SUB_VPE_VIDEO_API_TEST_03100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_03100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest03100();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_03200
     * @tc.number SUB_VPE_VIDEO_API_TEST_03200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_03200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest03200();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_03300
     * @tc.number SUB_VPE_VIDEO_API_TEST_03300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_03300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest03300();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_03400
     * @tc.number SUB_VPE_VIDEO_API_TEST_03400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_03400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest03400();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_03500
     * @tc.number SUB_VPE_VIDEO_API_TEST_03500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_03500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest03500();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_03600
     * @tc.number SUB_VPE_VIDEO_API_TEST_03600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_03600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest03600();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_03700
     * @tc.number SUB_VPE_VIDEO_API_TEST_03700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_03700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest03700();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_03800
     * @tc.number SUB_VPE_VIDEO_API_TEST_03800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_03800', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest03800();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_03900
     * @tc.number SUB_VPE_VIDEO_API_TEST_03900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_03900', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest03900();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_04000
     * @tc.number SUB_VPE_VIDEO_API_TEST_04000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_04000', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest04000();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_04100
     * @tc.number SUB_VPE_VIDEO_API_TEST_04100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_04100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest04100();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_04200
     * @tc.number SUB_VPE_VIDEO_API_TEST_04200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_04200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest04200();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_04300
     * @tc.number SUB_VPE_VIDEO_API_TEST_04300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_04300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest04300();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_04400
     * @tc.number SUB_VPE_VIDEO_API_TEST_04400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_04400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest04400();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_04500
     * @tc.number SUB_VPE_VIDEO_API_TEST_04500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_04500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest04500();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_04600
     * @tc.number SUB_VPE_VIDEO_API_TEST_04600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_04600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest04600();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_04700
     * @tc.number SUB_VPE_VIDEO_API_TEST_04700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_04700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest04700();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_04800
     * @tc.number SUB_VPE_VIDEO_API_TEST_04800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_04800', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest04800();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_04900
     * @tc.number SUB_VPE_VIDEO_API_TEST_04900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_04900', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest04900();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_05000
     * @tc.number SUB_VPE_VIDEO_API_TEST_05000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_05000', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest05000();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_05100
     * @tc.number SUB_VPE_VIDEO_API_TEST_05100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_05100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest05100();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_05200
     * @tc.number SUB_VPE_VIDEO_API_TEST_05200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_05200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest05200();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_05300
     * @tc.number SUB_VPE_VIDEO_API_TEST_05300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_05300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest05300();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_05400
     * @tc.number SUB_VPE_VIDEO_API_TEST_05400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_05400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest05400();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_05500
     * @tc.number SUB_VPE_VIDEO_API_TEST_05500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_05500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest05500();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_05600
     * @tc.number SUB_VPE_VIDEO_API_TEST_05600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_05600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest05600();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_05700
     * @tc.number SUB_VPE_VIDEO_API_TEST_05700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_05700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest05700();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_05800
     * @tc.number SUB_VPE_VIDEO_API_TEST_05800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_05800', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest05800();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_05900
     * @tc.number SUB_VPE_VIDEO_API_TEST_05900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_05900', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest05900();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_06000
     * @tc.number SUB_VPE_VIDEO_API_TEST_06000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_06000', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest06000();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_06100
     * @tc.number SUB_VPE_VIDEO_API_TEST_06100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_06100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest06100();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_06200
     * @tc.number SUB_VPE_VIDEO_API_TEST_06200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_06200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest06200();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_VIDEO_API_TEST_06300
     * @tc.number SUB_VPE_VIDEO_API_TEST_06300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_VIDEO_API_TEST_06300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.VpeVideoApiTest06300();
      expect(result).assertEqual(0);
      done();
    })

  })
}
