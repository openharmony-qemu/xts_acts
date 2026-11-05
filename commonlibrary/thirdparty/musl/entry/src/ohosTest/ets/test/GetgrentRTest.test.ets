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
import getgrent_r_test from 'libgetgrent_r_test.so';

export default function GetgrentRTest() {
  describe('MuslGetgrentRTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
     * @tc.name   testMuslGetgrentR0100
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_0100
     * @tc.desc   setgrent+getgrent_r枚举/etc/group成功返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGetgrentR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = getgrent_r_test.GetgrentR_0100();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetgrentR0200
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_0200
     * @tc.desc   连续调用getgrent_r枚举多条group记录
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGetgrentR0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = getgrent_r_test.GetgrentR_0200();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetgrentR0300
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_0300
     * @tc.desc   buf[8]不足返回ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGetgrentR0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = getgrent_r_test.GetgrentR_0300();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetgrentR0400
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_0400
     * @tc.desc   ERANGE后增大buf重试成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGetgrentR0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getgrent_r_test.GetgrentR_0400();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetgrentR0500
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_0500
     * @tc.desc   ERANGE时fseek失败返回ESPIPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGetgrentR0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getgrent_r_test.GetgrentR_0500();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetgrentR0600
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_0600
     * @tc.desc   /etc/group无法打开返回ENOENT（环境依赖）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGetgrentR0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getgrent_r_test.GetgrentR_0600();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetgrentR0700
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_0700
     * @tc.desc   EOF所有条目读完返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGetgrentR0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getgrent_r_test.GetgrentR_0700();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetgrentR0800
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_0800
     * @tc.desc   errno被设为rv值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGetgrentR0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getgrent_r_test.GetgrentR_0800();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetgrentR1100
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_1100
     * @tc.desc   gr_mem成员列表正确填充
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGetgrentR1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getgrent_r_test.GetgrentR_1100();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetgrentR1200
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_1200
     * @tc.desc   buf按16字节对齐
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslGetgrentR1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getgrent_r_test.GetgrentR_1200();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetgrentR1300
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_1300
     * @tc.desc   gr结构字段指针指向buf内部
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslGetgrentR1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getgrent_r_test.GetgrentR_1300();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetgrentR1500
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_1500
     * @tc.desc   同时枚举group+passwd互不影响（组合）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslGetgrentR1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getgrent_r_test.GetgrentR_1500();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetgrentR1600
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_1600
     * @tc.desc   getgrent_r枚举中getpwent_r回卷不影响（组合）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslGetgrentR1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getgrent_r_test.GetgrentR_1600();
      expect(data).assertEqual(0);
      done()
    })

  })
}
