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
import getgrent_r_test from 'libgetgrent_r_test.so';

export default function GetgrentRTest() {
  describe('MuslGetgrentRTest', () => {
    beforeEach(() => {})

    /**
     * @tc.name   testMuslGetgrentR0100
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_0100
     * @tc.desc   setgrent+getgrent_r枚举/etc/group成功返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_GETGRENT_R_0100', 0, () => {
      let data: number = getgrent_r_test.GetgrentR_0100();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetgrentR0200
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_0200
     * @tc.desc   连续调用getgrent_r枚举多条group记录
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_GETGRENT_R_0200', 0, () => {
      let data: number = getgrent_r_test.GetgrentR_0200();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetgrentR0300
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_0300
     * @tc.desc   buf[8]不足返回ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_GETGRENT_R_0300', 0, () => {
      let data: number = getgrent_r_test.GetgrentR_0300();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetgrentR0400
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_0400
     * @tc.desc   ERANGE后增大buf重试成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_GETGRENT_R_0400', 0, () => {
      let data: number = getgrent_r_test.GetgrentR_0400();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetgrentR0500
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_0500
     * @tc.desc   ERANGE时fseek失败返回ESPIPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_GETGRENT_R_0500', 0, () => {
      let data: number = getgrent_r_test.GetgrentR_0500();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetgrentR0600
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_0600
     * @tc.desc   /etc/group无法打开返回ENOENT（环境依赖）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_GETGRENT_R_0600', 0, () => {
      let data: number = getgrent_r_test.GetgrentR_0600();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetgrentR0700
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_0700
     * @tc.desc   EOF所有条目读完返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_GETGRENT_R_0700', 0, () => {
      let data: number = getgrent_r_test.GetgrentR_0700();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetgrentR0800
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_0800
     * @tc.desc   errno被设为rv值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_GETGRENT_R_0800', 0, () => {
      let data: number = getgrent_r_test.GetgrentR_0800();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetgrentR0900
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_0900
     * @tc.desc   多线程并发调用被grent_lock序列化
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETGRENT_R_0900', 0, () => {
      let data: number = getgrent_r_test.GetgrentR_0900();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetgrentR1000
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_1000
     * @tc.desc   与非_r变体getgrent混用不安全（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETGRENT_R_1000', 0, () => {
      let data: number = getgrent_r_test.GetgrentR_1000();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetgrentR1100
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_1100
     * @tc.desc   gr_mem成员列表正确填充
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_GETGRENT_R_1100', 0, () => {
      let data: number = getgrent_r_test.GetgrentR_1100();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetgrentR1200
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_1200
     * @tc.desc   buf按16字节对齐
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETGRENT_R_1200', 0, () => {
      let data: number = getgrent_r_test.GetgrentR_1200();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetgrentR1300
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_1300
     * @tc.desc   gr结构字段指针指向buf内部
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETGRENT_R_1300', 0, () => {
      let data: number = getgrent_r_test.GetgrentR_1300();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetgrentR1400
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_1400
     * @tc.desc   ERANGE时释放rmem和rline临时内存（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETGRENT_R_1400', 0, () => {
      let data: number = getgrent_r_test.GetgrentR_1400();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetgrentR1500
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_1500
     * @tc.desc   同时枚举group+passwd互不影响（组合）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETGRENT_R_1500', 0, () => {
      let data: number = getgrent_r_test.GetgrentR_1500();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetgrentR1600
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_1600
     * @tc.desc   getgrent_r枚举中getpwent_r回卷不影响（组合）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETGRENT_R_1600', 0, () => {
      let data: number = getgrent_r_test.GetgrentR_1600();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetgrentR1700
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_1700
     * @tc.desc   ERANGE时free(rmem)+free(rline)无泄漏（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETGRENT_R_1700', 0, () => {
      let data: number = getgrent_r_test.GetgrentR_1700();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslGetgrentR1800
     * @tc.number SUB_THIRDPARTY_MUSL_GETGRENT_R_1800
     * @tc.desc   多线程结束后内存一致（简化）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETGRENT_R_1800', 0, () => {
      let data: number = getgrent_r_test.GetgrentR_1800();
      expect(data).assertEqual(0);
    })
  })
}
