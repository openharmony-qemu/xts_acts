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
import isoc23_fscanf_test from 'libisoc23_fscanf_test.so';

export default function isoc23FscanfTest() {
  describe('ActsIsoc23FscanfTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
     * @tc.name   testMuslIsoc23Fscanf0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0100
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Fscanf0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_0100();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Fscanf0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0200
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Fscanf0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_0200();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Fscanf0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0300
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Fscanf0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_0300();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Fscanf0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0400
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Fscanf0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_0400();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Fscanf0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0500
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Fscanf0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_0500();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Fscanf0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0600
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Fscanf0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_0600();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Fscanf0800
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0800
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Fscanf0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_0800();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Fscanf0900
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0900
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Fscanf0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_0900();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Fscanf1000
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1000
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Fscanf1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_1000();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Fscanf1100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1100
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Fscanf1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_1100();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Fscanf1200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1200
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Fscanf1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_1200();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Fscanf1300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1300
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Fscanf1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_1300();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Fscanf1400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1400
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Fscanf1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_1400();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Fscanf1600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1600
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Fscanf1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_1600();
      expect(data).assertEqual(0);
      done()
    })
  })
}
