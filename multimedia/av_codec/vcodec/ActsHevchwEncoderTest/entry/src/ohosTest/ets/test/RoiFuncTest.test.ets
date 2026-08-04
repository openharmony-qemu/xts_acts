/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import entry from 'libentry.so';

export default function RoiFuncTest() {
  describe('RoiFuncTest', () => {
    beforeAll(() => {
      entry.Roi_SetUpTestCase();
    })
    beforeEach(() => {
      
    })
    afterEach(() => {
      entry.Roi_TearDown()
    })
    afterAll(() => {

    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_FUNC_00100
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_FUNC_00100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_FUNC_00100", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_FUNC_001();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_FUNC_00200
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_FUNC_00200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_FUNC_00200", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_FUNC_002();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_FUNC_00300
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_FUNC_00300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_FUNC_00300", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_FUNC_003();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_FUNC_00400
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_FUNC_00400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_FUNC_00400", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_FUNC_004();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_FUNC_00500
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_FUNC_00500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_FUNC_00500", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_FUNC_005();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_FUNC_00600
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_FUNC_00600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_FUNC_00600", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_FUNC_006();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_FUNC_00700
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_FUNC_00700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_FUNC_00700", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_FUNC_007();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_FUNC_00800
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_FUNC_00800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_FUNC_00800", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_FUNC_008();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_FUNC_00900
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_FUNC_00900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_FUNC_00900", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_FUNC_009();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_FUNC_01000
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_FUNC_01000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_FUNC_01000", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_FUNC_010();
      expect(result).assertEqual(0);
      done();
    })
    
    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_FUNC_01100
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_FUNC_01100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_FUNC_01100", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_FUNC_011();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_FUNC_01200
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_FUNC_01200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_FUNC_01200", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_FUNC_012();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_FUNC_01300
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_FUNC_01300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_FUNC_01300", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_FUNC_013();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_FUNC_01400
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_FUNC_01400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_FUNC_01400", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_FUNC_014();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_FUNC_01500
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_FUNC_01500
     *@tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_FUNC_01500", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_FUNC_015();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_FUNC_01600
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_FUNC_01600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_FUNC_01600", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_FUNC_016();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_FUNC_01700
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_FUNC_01700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_FUNC_01700", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_FUNC_017();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_FUNC_01800
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_FUNC_01800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_FUNC_01800", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_FUNC_018();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_API_01900
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_API_01900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_API_01900", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_API_019();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_API_02000
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_API_02000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_API_02000", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_API_020();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_API_02100
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_API_02100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_API_02100", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_API_021();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_API_02200
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_API_02200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_API_02200", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_API_022();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_API_02300
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_API_02300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_API_02300", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_API_023();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_API_02400
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_API_02400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_API_02400", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_API_024();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_API_02500
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_API_02500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_API_02500", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_API_025();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_API_02600
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_API_02600
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_API_02600", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_API_026();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_API_02700
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_API_02700
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_API_02700", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_API_027();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_API_02800
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_API_02800
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_API_02800", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_API_028();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_API_02900
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_API_02900
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_API_02900", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_API_029();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_API_03000
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_API_03000
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_API_03000", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_API_030();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_API_03100
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_API_03100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_API_03100", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_API_031();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_API_03200
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_API_03200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_API_03200", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_API_032();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_API_03300
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_API_03300
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_API_03300", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_API_033();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_API_03400
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_API_03400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_API_03400", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_API_034();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_HW_ENCODE_ROI_API_03500
     * @tc.number SUB_VIDEO_HW_ENCODE_ROI_API_03500
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_VIDEO_HW_ENCODE_ROI_API_03500", Level.LEVEL1, async (done: Function) => {
      const result = await entry.VIDEO_HW_ENCODE_ROI_API_035();
      expect(result).assertEqual(0);
      done();
    })

  })
}
