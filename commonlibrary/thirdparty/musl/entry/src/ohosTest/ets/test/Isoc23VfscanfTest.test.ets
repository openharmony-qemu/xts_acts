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
import isoc23_vfscanf_test from 'libisoc23_vfscanf_test.so';

export default function isoc23VfscanfTest() {
  describe('ActsIsoc23VfscanfTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
     * @tc.name   testMuslIsoc23Vfscanf0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0100
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Vfscanf0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_0100();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Vfscanf0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0200
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Vfscanf0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_0200();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Vfscanf0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0300
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Vfscanf0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_0300();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Vfscanf0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0400
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Vfscanf0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_0400();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Vfscanf0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0500
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Vfscanf0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_0500();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Vfscanf0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0600
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Vfscanf0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_0600();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Vfscanf0700
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0700
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Vfscanf0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_0700();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Vfscanf0800
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0800
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Vfscanf0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_0800();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Vfscanf0900
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0900
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Vfscanf0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_0900();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Vfscanf1000
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_1000
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Vfscanf1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_1000();
      expect(data).assertEqual(0);
      done()
    })
    /**
     * @tc.name   testMuslIsoc23Vfscanf1100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_1100
     * @tc.desc   test SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslIsoc23Vfscanf1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_1100();
      expect(data).assertEqual(0);
      done()
    })
  })
}
