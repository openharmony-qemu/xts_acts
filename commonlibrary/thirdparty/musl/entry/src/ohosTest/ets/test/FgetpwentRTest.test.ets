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
import fgetpwent_r_test from 'libfgetpwent_r_test.so';

export default function FgetpwentRTest() {
  describe('MuslFgetpwentRTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
     * @tc.name   testMuslFgetpwentR0100
     * @tc.number SUB_THIRDPARTY_MUSL_FGETPWENT_R_0100
     * @tc.desc   从FILE流读取passwd成功返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslFgetpwentR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = fgetpwent_r_test.FgetpwentR_0100();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslFgetpwentR0200
     * @tc.number SUB_THIRDPARTY_MUSL_FGETPWENT_R_0200
     * @tc.desc   连续读取多个passwd条目
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslFgetpwentR0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = fgetpwent_r_test.FgetpwentR_0200();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslFgetpwentR0300
     * @tc.number SUB_THIRDPARTY_MUSL_FGETPWENT_R_0300
     * @tc.desc   EOF返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslFgetpwentR0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = fgetpwent_r_test.FgetpwentR_0300();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslFgetpwentR0400
     * @tc.number SUB_THIRDPARTY_MUSL_FGETPWENT_R_0400
     * @tc.desc   buf[8]不足返回ERANGE且不可重试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslFgetpwentR0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = fgetpwent_r_test.FgetpwentR_0400();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslFgetpwentR0700
     * @tc.number SUB_THIRDPARTY_MUSL_FGETPWENT_R_0700
     * @tc.desc   errno设为rv副作用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslFgetpwentR0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = fgetpwent_r_test.FgetpwentR_0700();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslFgetpwentR0800
     * @tc.number SUB_THIRDPARTY_MUSL_FGETPWENT_R_0800
     * @tc.desc   pw字段指针指向buf内部
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslFgetpwentR0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = fgetpwent_r_test.FgetpwentR_0800();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslFgetpwentR0900
     * @tc.number SUB_THIRDPARTY_MUSL_FGETPWENT_R_0900
     * @tc.desc   非passwd格式行跳过返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslFgetpwentR0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = fgetpwent_r_test.FgetpwentR_0900();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslFgetpwentR1000
     * @tc.number SUB_THIRDPARTY_MUSL_FGETPWENT_R_1000
     * @tc.desc   从自定义文件流读取（简化）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslFgetpwentR1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = fgetpwent_r_test.FgetpwentR_1000();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslFgetpwentR1300
     * @tc.number SUB_THIRDPARTY_MUSL_FGETPWENT_R_1300
     * @tc.desc   流式读取与数据库枚举互不影响（组合）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslFgetpwentR1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = fgetpwent_r_test.FgetpwentR_1300();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslFgetpwentR1400
     * @tc.number SUB_THIRDPARTY_MUSL_FGETPWENT_R_1400
     * @tc.desc   fgetpwent_r与getpwent_r切etc/passwd枚举（组合）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslFgetpwentR1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = fgetpwent_r_test.FgetpwentR_1400();
      expect(data).assertEqual(0);
      done()
    })

  })
}
