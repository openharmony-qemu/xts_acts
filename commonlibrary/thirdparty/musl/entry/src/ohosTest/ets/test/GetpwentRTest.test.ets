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

import { describe, beforeEach, it, expect } from '@ohos/hypium';
import getpwent_r_test from 'libgetpwent_r_test.so';

export default function GetpwentRTest() {
  describe('MuslGetpwentRTest', () => {
    beforeEach(() => {})

    /**
     * @tc.name   testMuslGetpwentR0100
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_0100
     * @tc.desc   setpwent+getpwent_r枚举/etc/passwd成功返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_GETPWENT_R_0100', 0, () => {
      let data: number = getpwent_r_test.GetpwentR_0100();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetpwentR0200
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_0200
     * @tc.desc   连续调用getpwent_r枚举多条passwd记录
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_GETPWENT_R_0200', 0, () => {
      let data: number = getpwent_r_test.GetpwentR_0200();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetpwentR0300
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_0300
     * @tc.desc   buf[8]不足返回ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_GETPWENT_R_0300', 0, () => {
      let data: number = getpwent_r_test.GetpwentR_0300();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetpwentR0400
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_0400
     * @tc.desc   ERANGE后fseek回退用更大buf重试成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_GETPWENT_R_0400', 0, () => {
      let data: number = getpwent_r_test.GetpwentR_0400();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetpwentR0500
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_0500
     * @tc.desc   ERANGE后fseek失败返回ESPIPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_GETPWENT_R_0500', 0, () => {
      let data: number = getpwent_r_test.GetpwentR_0500();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetpwentR0600
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_0600
     * @tc.desc   /etc/passwd无法打开返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_GETPWENT_R_0600', 0, () => {
      let data: number = getpwent_r_test.GetpwentR_0600();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetpwentR0700
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_0700
     * @tc.desc   EOF所有条目读完返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_GETPWENT_R_0700', 0, () => {
      let data: number = getpwent_r_test.GetpwentR_0700();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetpwentR0800
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_0800
     * @tc.desc   errno设为rv副作用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_GETPWENT_R_0800', 0, () => {
      let data: number = getpwent_r_test.GetpwentR_0800();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetpwentR0900
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_0900
     * @tc.desc   pwent_lock序列化并发访问
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETPWENT_R_0900', 0, () => {
      let data: number = getpwent_r_test.GetpwentR_0900();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetpwentR1000
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_1000
     * @tc.desc   与非_r变体getpwent混用不安全（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETPWENT_R_1000', 0, () => {
      let data: number = getpwent_r_test.GetpwentR_1000();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetpwentR1100
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_1100
     * @tc.desc   pw字段指针指向buf内部
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETPWENT_R_1100', 0, () => {
      let data: number = getpwent_r_test.GetpwentR_1100();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetpwentR1200
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_1200
     * @tc.desc   ERANGE时free(rline)释放临时内存（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETPWENT_R_1200', 0, () => {
      let data: number = getpwent_r_test.GetpwentR_1200();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetpwentR1300
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_1300
     * @tc.desc   ERANGE不可重试区别于fgetpwent_r（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETPWENT_R_1300', 0, () => {
      let data: number = getpwent_r_test.GetpwentR_1300();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetpwentR1400
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_1400
     * @tc.desc   setpwent重置文件游标
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETPWENT_R_1400', 0, () => {
      let data: number = getpwent_r_test.GetpwentR_1400();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetpwentR1500
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_1500
     * @tc.desc   枚举passwd时线程状态不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETPWENT_R_1500', 0, () => {
      let data: number = getpwent_r_test.GetpwentR_1500();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetpwentR1600
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWENT_R_1600
     * @tc.desc   ERANGE时free(rline)无泄漏（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETPWENT_R_1600', 0, () => {
      let data: number = getpwent_r_test.GetpwentR_1600();
      expect(data).assertEqual(0);
    })
  })
}
