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
import getprotobyname_r_test from 'libgetprotobyname_r_test.so';

export default function GetprotobynameRTest() {
  describe('MuslGetprotobynameRTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
     * @tc.name   testMuslProtobynameR0100
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNAME_R_0100
     * @tc.desc   getprotobyname_r按名查找tcp返回协议6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslProtobynameR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = getprotobyname_r_test.ProtobynameR_0100();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynameR0200
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNAME_R_0200
     * @tc.desc   getprotobyname_r按名查找udp返回协议17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslProtobynameR0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = getprotobyname_r_test.ProtobynameR_0200();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynameR0300
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNAME_R_0300
     * @tc.desc   getprotobyname_r按名查找ip返回协议0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslProtobynameR0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getprotobyname_r_test.ProtobynameR_0300();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynameR0400
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNAME_R_0400
     * @tc.desc   getprotobyname_r按名查找raw返回协议255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslProtobynameR0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getprotobyname_r_test.ProtobynameR_0400();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynameR0500
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNAME_R_0500
     * @tc.desc   getprotobyname_r name为NULL返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslProtobynameR0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = getprotobyname_r_test.ProtobynameR_0500();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynameR0600
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNAME_R_0600
     * @tc.desc   getprotobyname_r未匹配协议名返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslProtobynameR0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = getprotobyname_r_test.ProtobynameR_0600();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynameR0700
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNAME_R_0700
     * @tc.desc   getprotobyname_r buf不足返回ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslProtobynameR0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getprotobyname_r_test.ProtobynameR_0700();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynameR0800
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNAME_R_0800
     * @tc.desc   getprotobyname_r名称比较区分大小写
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslProtobynameR0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getprotobyname_r_test.ProtobynameR_0800();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynameR0900
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNAME_R_0900
     * @tc.desc   getprotobyname_r p_aliases为NULL结尾数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslProtobynameR0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getprotobyname_r_test.ProtobynameR_0900();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynameR1000
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNAME_R_1000
     * @tc.desc   getprotobyname_r无静态状态线程安全无需锁
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslProtobynameR1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getprotobyname_r_test.ProtobynameR_1000();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynameR1100
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNAME_R_1100
     * @tc.desc   getprotobyname_r p_name指向buf内部
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslProtobynameR1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getprotobyname_r_test.ProtobynameR_1100();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynameR1200
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNAME_R_1200
     * @tc.desc   getprotobyname_r编译期硬编码protos数组无文件依赖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslProtobynameR1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getprotobyname_r_test.ProtobynameR_1200();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynameR1300
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNAME_R_1300
     * @tc.desc   getprotobyname_r按名和按号查找同一协议一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslProtobynameR1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getprotobyname_r_test.ProtobynameR_1300();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynameR1400
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNAME_R_1400
     * @tc.desc   getprotobyname_r枚举中查找不影响游标
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslProtobynameR1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getprotobyname_r_test.ProtobynameR_1400();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslProtobynameR1500
     * @tc.number SUB_THIRDPARTY_MUSL_GETPROTOBYNAME_R_1500
     * @tc.desc   getprotobyname_r三种查找方式同一协议一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslProtobynameR1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getprotobyname_r_test.ProtobynameR_1500();
      expect(data).assertEqual(0);
      done()
    })
  })
}
