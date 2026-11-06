/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, TestType, Size, Level } from "@ohos/hypium-dynamic"
import Utils from './Utils'
import isoc23_sscanf_test from 'libisoc23_sscanf_test.so';

export default function isoc23SscanfTest() {
  describe('ActsIsoc23SscanfTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
     * @tc.name   testMuslIsoc23Sscanf0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0100
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Sscanf0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_0100();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Sscanf0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0200
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Sscanf0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_0200();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Sscanf0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0300
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Sscanf0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_0300();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Sscanf0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0400
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Sscanf0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_0400();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Sscanf0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0500
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Sscanf0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_0500();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Sscanf0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0600
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Sscanf0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_0600();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Sscanf0700
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0700
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Sscanf0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_0700();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Sscanf0800
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0800
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Sscanf0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_0800();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Sscanf0900
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0900
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Sscanf0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_0900();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Sscanf1000
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1000
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Sscanf1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_1000();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Sscanf1100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1100
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Sscanf1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_1100();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Sscanf1200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1200
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Sscanf1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_1200();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Sscanf1300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1300
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Sscanf1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_1300();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Sscanf1400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1400
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Sscanf1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_1400();
      expect(data).assertEqual(0);
      done()
    })
  })
}
