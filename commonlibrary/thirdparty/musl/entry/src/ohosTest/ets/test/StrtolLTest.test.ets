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
import mod from 'libstrtol_l_test.so';

export default function strtolLTest() {
  describe('ActsStrtolLTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
     * @tc.name   testMuslStrtolL0100
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_L_0100
     * @tc.desc   test SUB_THIRDPARTY_MUSL_STRTOL_L_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslStrtolL0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.StrtolL_0100();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslStrtolL0200
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_L_0200
     * @tc.desc   test SUB_THIRDPARTY_MUSL_STRTOL_L_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslStrtolL0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.StrtolL_0200();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslStrtolL0300
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_L_0300
     * @tc.desc   test SUB_THIRDPARTY_MUSL_STRTOL_L_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslStrtolL0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.StrtolL_0300();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslStrtolL0400
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_L_0400
     * @tc.desc   test SUB_THIRDPARTY_MUSL_STRTOL_L_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslStrtolL0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.StrtolL_0400();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslStrtolL0500
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_L_0500
     * @tc.desc   test SUB_THIRDPARTY_MUSL_STRTOL_L_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslStrtolL0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.StrtolL_0500();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslStrtolL0600
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_L_0600
     * @tc.desc   test SUB_THIRDPARTY_MUSL_STRTOL_L_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslStrtolL0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.StrtolL_0600();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslStrtolL0700
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_L_0700
     * @tc.desc   test SUB_THIRDPARTY_MUSL_STRTOL_L_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslStrtolL0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.StrtolL_0700();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslStrtolL0800
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_L_0800
     * @tc.desc   test SUB_THIRDPARTY_MUSL_STRTOL_L_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslStrtolL0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.StrtolL_0800();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslStrtolL0900
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_L_0900
     * @tc.desc   test SUB_THIRDPARTY_MUSL_STRTOL_L_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslStrtolL0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = mod.StrtolL_0900();
      expect(data).assertEqual(0);
      done()
    })
  })
}
