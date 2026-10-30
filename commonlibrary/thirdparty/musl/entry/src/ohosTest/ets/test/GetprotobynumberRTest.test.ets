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
import getprotobynumber_r_test from 'libgetprotobynumber_r_test.so';

export default function GetprotobynumberRTest() {
  describe('MuslGetprotobynumberRTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
     * @tc.name   testMuslProtobynumberR0100
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNUMBER_R_0100
     * @tc.desc   getprotobynumber_r按号查找proto6返回tcp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslProtobynumberR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = getprotobynumber_r_test.ProtobynumberR_0100();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynumberR0200
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNUMBER_R_0200
     * @tc.desc   getprotobynumber_r按号查找proto17返回udp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslProtobynumberR0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = getprotobynumber_r_test.ProtobynumberR_0200();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynumberR0300
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNUMBER_R_0300
     * @tc.desc   getprotobynumber_r按号查找proto0返回ip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslProtobynumberR0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getprotobynumber_r_test.ProtobynumberR_0300();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynumberR0400
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNUMBER_R_0400
     * @tc.desc   getprotobynumber_r按号查找proto255返回raw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslProtobynumberR0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getprotobynumber_r_test.ProtobynumberR_0400();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynumberR0500
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNUMBER_R_0500
     * @tc.desc   getprotobynumber_r未匹配协议号返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslProtobynumberR0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = getprotobynumber_r_test.ProtobynumberR_0500();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynumberR0600
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNUMBER_R_0600
     * @tc.desc   getprotobynumber_r buf不足返回ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslProtobynumberR0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getprotobynumber_r_test.ProtobynumberR_0600();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynumberR0700
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNUMBER_R_0700
     * @tc.desc   getprotobynumber_r负数协议号返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslProtobynumberR0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getprotobynumber_r_test.ProtobynumberR_0700();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynumberR0800
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNUMBER_R_0800
     * @tc.desc   getprotobynumber_r无静态状态线程安全
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslProtobynumberR0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getprotobynumber_r_test.ProtobynumberR_0800();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynumberR0900
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNUMBER_R_0900
     * @tc.desc   getprotobynumber_r result成功时指向res
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslProtobynumberR0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getprotobynumber_r_test.ProtobynumberR_0900();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynumberR1000
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNUMBER_R_1000
     * @tc.desc   getprotobynumber_r p_aliases为NULL结尾
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslProtobynumberR1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getprotobynumber_r_test.ProtobynumberR_1000();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynumberR1100
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNUMBER_R_1100
     * @tc.desc   getprotobynumber_r遍历整个protos数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslProtobynumberR1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getprotobynumber_r_test.ProtobynumberR_1100();
      expect(data).assertEqual(0);
      done()
    })
  })
}
