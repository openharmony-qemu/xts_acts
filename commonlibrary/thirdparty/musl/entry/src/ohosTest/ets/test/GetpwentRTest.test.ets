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
import getpwent_r_test from 'libgetpwent_r_test.so';

export default function GetpwentRTest() {
  describe('MuslGetpwentRTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
     * @tc.name   testMuslGetpwentR0100
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_0100
     * @tc.desc   setpwent+getpwent_r枚举/etc/passwd成功返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGetpwentR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = getpwent_r_test.GetpwentR_0100();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetpwentR0200
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_0200
     * @tc.desc   连续调用getpwent_r枚举多条passwd记录
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGetpwentR0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = getpwent_r_test.GetpwentR_0200();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetpwentR0300
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_0300
     * @tc.desc   buf[8]不足返回ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGetpwentR0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = getpwent_r_test.GetpwentR_0300();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetpwentR0400
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_0400
     * @tc.desc   ERANGE后fseek回退用更大buf重试成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGetpwentR0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getpwent_r_test.GetpwentR_0400();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetpwentR0500
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_0500
     * @tc.desc   ERANGE后fseek失败返回ESPIPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGetpwentR0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getpwent_r_test.GetpwentR_0500();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetpwentR0600
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_0600
     * @tc.desc   /etc/passwd无法打开返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGetpwentR0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getpwent_r_test.GetpwentR_0600();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetpwentR0700
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_0700
     * @tc.desc   EOF所有条目读完返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGetpwentR0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getpwent_r_test.GetpwentR_0700();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetpwentR0800
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_0800
     * @tc.desc   errno设为rv副作用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGetpwentR0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getpwent_r_test.GetpwentR_0800();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetpwentR1100
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_1100
     * @tc.desc   pw字段指针指向buf内部
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslGetpwentR1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getpwent_r_test.GetpwentR_1100();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslGetpwentR1400
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_1400
     * @tc.desc   setpwent重置文件游标
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslGetpwentR1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getpwent_r_test.GetpwentR_1400();
      expect(data).assertEqual(0);
      done()
    })

  })
}
