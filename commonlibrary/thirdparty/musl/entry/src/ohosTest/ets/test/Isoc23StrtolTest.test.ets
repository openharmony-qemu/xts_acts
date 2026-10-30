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
import mod from 'libisoc23_strtol_test.so';

export default function isoc23StrtolTest() {
  describe('ActsIsoc23StrtolTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
     * @tc.name   testMuslIsoc23Strtol0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0100
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Strtol0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.Isoc23Strtol_0100();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Strtol0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0200
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Strtol0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.Isoc23Strtol_0200();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Strtol0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0300
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Strtol0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.Isoc23Strtol_0300();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Strtol0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0400
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Strtol0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.Isoc23Strtol_0400();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Strtol0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0500
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Strtol0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.Isoc23Strtol_0500();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Strtol0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0600
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Strtol0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.Isoc23Strtol_0600();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Strtol0700
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0700
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Strtol0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.Isoc23Strtol_0700();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Strtol0800
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0800
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Strtol0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.Isoc23Strtol_0800();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Strtol0900
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0900
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Strtol0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.Isoc23Strtol_0900();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Strtol1000
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_1000
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Strtol1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.Isoc23Strtol_1000();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Strtol1100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_1100
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Strtol1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.Isoc23Strtol_1100();
      expect(data).assertEqual(0);
      done()
    })
  })
}
