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
      entry.Roi_Func_Test_Prepare(0);
    })
    beforeEach(() => {
      
    })
    afterEach(() => {
      entry.Roi_Func_Test_Prepare(3)
    })
    afterAll(() => {

    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_ROI_FUNC_001
     * @tc.number VIDEO_HW_ENCODE_ROI_FUNC_001
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_ROI_FUNC_001", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(0);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_ROI_FUNC_002
     * @tc.number VIDEO_HW_ENCODE_ROI_FUNC_002
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_ROI_FUNC_002", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(1);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_ROI_FUNC_003
     * @tc.number VIDEO_HW_ENCODE_ROI_FUNC_003
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_ROI_FUNC_003", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(2);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_ROI_FUNC_004
     * @tc.number VIDEO_HW_ENCODE_ROI_FUNC_004
     * @tc.desc   VIDEO_HW_ENCODE_ROI_FUNC_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_ROI_FUNC_004", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(3);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_ROI_FUNC_005
     * @tc.number VIDEO_HW_ENCODE_ROI_FUNC_005
     * @tc.desc   VIDEO_HW_ENCODE_ROI_FUNC_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_ROI_FUNC_005", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(4);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_ROI_FUNC_006
     * @tc.number VIDEO_HW_ENCODE_ROI_FUNC_006
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_ROI_FUNC_006", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(5);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_ROI_FUNC_007
     * @tc.number VIDEO_HW_ENCODE_ROI_FUNC_007
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_ROI_FUNC_007", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(6);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_ROI_FUNC_008
     * @tc.number VIDEO_HW_ENCODE_ROI_FUNC_008
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_ROI_FUNC_008", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(7);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_ROI_FUNC_009
     * @tc.number VIDEO_HW_ENCODE_ROI_FUNC_009
     * @tc.desc   VIDEO_HW_ENCODE_ROI_FUNC_009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_ROI_FUNC_009", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(8);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   VIDEO_HW_ENCODE_ROI_FUNC_010
     * @tc.number VIDEO_HW_ENCODE_ROI_FUNC_010
     * @tc.desc   VIDEO_HW_ENCODE_ROI_FUNC_010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("VIDEO_HW_ENCODE_ROI_FUNC_010", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(9);
      expect(result).assertEqual(0);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0100
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0100
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0100", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(10);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0200
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0200
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0200", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(11);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0300
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0300
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0300", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(12);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0400
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0400
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0400", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(13);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0500
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0500
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0500", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(14);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0600
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0600
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0600", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(15);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0700
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0700
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0700", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(16);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0800
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0800
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0800", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(17);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0900
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0900
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_0900", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(18);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1000
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1000
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1000", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(19);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1100
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1100
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1100", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(20);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1200
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1200
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1200", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(21);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1300
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1300
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1300", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(22);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1400
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1400
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1400", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(23);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1500
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1500
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1500", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(24);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1600
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1600
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1600", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(25);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1700
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1700
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1700", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(26);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1800
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1800
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1800", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(27);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1900
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1900
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_1900", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(28);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_2000
     * @tc.number SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_2000
     * @tc.desc   SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_VIDEO_HW_ENCODE_ROI_FUNC_2000", Level.LEVEL1, async (done: Function) => {
      const result = await entry.Roi_Func_Test(29);
      expect(result).assertEqual(0);
      done();
    })
  })
}