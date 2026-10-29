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
import getprotoent_r_test from 'libgetprotoent_r_test.so';

export default function GetprotoentRTest() {
  describe('MuslGetprotoentRTest', () => {
    beforeEach(() => {})

    /**
     * @tc.name   testMuslProtoentR0100
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOENT_R_0100
     * @tc.desc   getprotoent_r正常枚举协议条目按顺序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_GETPROTOENT_R_0100', 0, () => {
      let data: number = getprotoent_r_test.ProtoentR_0100();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslProtoentR0200
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOENT_R_0200
     * @tc.desc   getprotoent_r连续调用枚举所有协议按编译期顺序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_GETPROTOENT_R_0200', 0, () => {
      let data: number = getprotoent_r_test.ProtoentR_0200();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslProtoentR0300
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOENT_R_0300
     * @tc.desc   getprotoent_r枚举完毕返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_GETPROTOENT_R_0300', 0, () => {
      let data: number = getprotoent_r_test.ProtoentR_0300();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslProtoentR0400
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOENT_R_0400
     * @tc.desc   getprotoent_r buf不足返回ERANGE且游标不前进
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_GETPROTOENT_R_0400', 0, () => {
      let data: number = getprotoent_r_test.ProtoentR_0400();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslProtoentR0500
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOENT_R_0500
     * @tc.desc   getprotoent_r ERANGE后用更大buf重试返回相同条目
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_GETPROTOENT_R_0500', 0, () => {
      let data: number = getprotoent_r_test.ProtoentR_0500();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslProtoentR0600
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOENT_R_0600
     * @tc.desc   getprotoent_r setprotoent重置idx从头枚举
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_GETPROTOENT_R_0600', 0, () => {
      let data: number = getprotoent_r_test.ProtoentR_0600();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslProtoentR0700
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOENT_R_0700
     * @tc.desc   getprotoent_r endprotoent重置idx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_GETPROTOENT_R_0700', 0, () => {
      let data: number = getprotoent_r_test.ProtoentR_0700();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslProtoentR0800
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOENT_R_0800
     * @tc.desc   getprotoent_r proto_lock序列化并发访问
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETPROTOENT_R_0800', 0, () => {
      let data: number = getprotoent_r_test.ProtoentR_0800();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslProtoentR0900
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOENT_R_0900
     * @tc.desc   getprotoent_r成功时idx前进namelen加2字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETPROTOENT_R_0900', 0, () => {
      let data: number = getprotoent_r_test.ProtoentR_0900();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslProtoentR1000
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOENT_R_1000
     * @tc.desc   getprotoent_r result在成功时指向res
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETPROTOENT_R_1000', 0, () => {
      let data: number = getprotoent_r_test.ProtoentR_1000();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslProtoentR1100
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOENT_R_1100
     * @tc.desc   getprotoent_r与非_r变体getprotoent混用不安全
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETPROTOENT_R_1100', 0, () => {
      let data: number = getprotoent_r_test.ProtoentR_1100();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslProtoentR1200
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOENT_R_1200
     * @tc.desc   getprotoent_r buf对齐后填充数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETPROTOENT_R_1200', 0, () => {
      let data: number = getprotoent_r_test.ProtoentR_1200();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslProtoentR1300
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOENT_R_1300
     * @tc.desc   getprotoent_r无malloc无内存泄漏
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_GETPROTOENT_R_1300', 0, () => {
      let data: number = getprotoent_r_test.ProtoentR_1300();
      expect(data).assertEqual(0);
    })
  })
}
