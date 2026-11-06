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
import getpagesize_test from 'libgetpagesize_test.so'

export default function GetpagesizeTest() {
  describe('MuslGetpagesizeTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
     * @tc.name   testMuslGetpagesize0100
     * @tc.number SUB_THIRDPARTY_MUSL_GETPAGESIZE_0100
     * @tc.desc   __getpagesize返回正值验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGetpagesize0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = getpagesize_test.Getpagesize_0100();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetpagesize0200
     * @tc.number SUB_THIRDPARTY_MUSL_GETPAGESIZE_0200
     * @tc.desc   __getpagesize返回值为2的幂验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGetpagesize0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = getpagesize_test.Getpagesize_0200();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetpagesize0300
     * @tc.number SUB_THIRDPARTY_MUSL_GETPAGESIZE_0300
     * @tc.desc   __getpagesize返回值与sysconf(_SC_PAGESIZE)一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGetpagesize0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getpagesize_test.Getpagesize_0300();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetpagesize0500
     * @tc.number SUB_THIRDPARTY_MUSL_GETPAGESIZE_0500
     * @tc.desc   多次调用__getpagesize返回值一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGetpagesize0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getpagesize_test.Getpagesize_0500();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetpagesize0600
     * @tc.number SUB_THIRDPARTY_MUSL_GETPAGESIZE_0600
     * @tc.desc   __getpagesize不设置errno
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslGetpagesize0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getpagesize_test.Getpagesize_0600();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetpagesize0700
     * @tc.number SUB_THIRDPARTY_MUSL_GETPAGESIZE_0700
     * @tc.desc   __getpagesize返回值等于PAGE_SIZE宏
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslGetpagesize0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getpagesize_test.Getpagesize_0700();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetpagesize0800
     * @tc.number SUB_THIRDPARTY_MUSL_GETPAGESIZE_0800
     * @tc.desc   __getpagesize返回类型为int(编译时特性)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslGetpagesize0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getpagesize_test.Getpagesize_0800();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetpagesize0900
     * @tc.number SUB_THIRDPARTY_MUSL_GETPAGESIZE_0900
     * @tc.desc   dlsym符号__getpagesize可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGetpagesize0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getpagesize_test.Getpagesize_0900();
      expect(data).assertEqual(0);
      done()
    })
  })
}
