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
import getservent_r_test from 'libgetservent_r_test.so';

export default function GetserventRTest() {
  describe('MuslGetserventRTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })
    /**
     * @tc.name   testMuslServentR0100
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_0100
     * @tc.desc   getservent_r调用实际执行验证rv==0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslServentR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_0100();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslServentR0200
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_0200
     * @tc.desc   getservent_r非LiteOS stub返回0加result_NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslServentR0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_0200();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslServentR0300
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_0300
     * @tc.desc   getservent_r etc_services缺失返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslServentR0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_0300();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslServentR0400
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_0400
     * @tc.desc   getservent_r buf不足返回ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslServentR0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_0400();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslServentR0500
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_0500
     * @tc.desc   getservent_r ERANGE时fseek失败返回ESPIPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslServentR0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_0500();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslServentR0600
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_0600
     * @tc.desc   getservent_r跳过注释行
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslServentR0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_0600();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslServentR0700
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_0700
     * @tc.desc   getservent_r跳过非tcp_udp协议行
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslServentR0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_0700();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslServentR0800
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_0800
     * @tc.desc   getservent_r端口越界的行被跳过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslServentR0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_0800();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslServentR0900
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_0900
     * @tc.desc   getservent_r malloc失败返回ENOMEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslServentR0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_0900();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslServentR1000
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_1000
     * @tc.desc   getservent_r MAX_ALIAS_NO等于10别名上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslServentR1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_1000();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslServentR1100
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_1100
     * @tc.desc   getservent_r s_port为网络字节序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslServentR1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_1100();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslServentR1200
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_1200
     * @tc.desc   getservent_r serv_lock序列化并发访问
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslServentR1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_1200();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslServentR1300
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_1300
     * @tc.desc   getservent_r EOF时返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslServentR1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_1300();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslServentR1400
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_1400
     * @tc.desc   getservent_r errno设为rv错误路径
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslServentR1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_1400();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslServentR1500
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_1500
     * @tc.desc   getservent_r未调endservent的sd结构泄漏
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslServentR1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_1500();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslServentR1600
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_1600
     * @tc.desc   getservent_r枚举加endservent后sd正确释放
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslServentR1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_1600();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslServentR1700
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_1700
     * @tc.desc   getservent_r malloc失败无泄漏
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslServentR1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_1700();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslServentR1800
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_1800
     * @tc.desc   getservent_r fopen失败后free(sd)无泄漏
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslServentR1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_1800();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslServentR1900
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_1900
     * @tc.desc   getservent_r 1000次循环无内存增长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslServentR1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_1900();
      expect(data).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testMuslServentR2000
     * @tc.number SUB_THIRDPARTY_MUSL_GETSERVENT_R_2000
     * @tc.desc   getservent_r多线程并发1000次无泄漏无崩溃
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslServentR2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = getservent_r_test.ServentR_2000();
      expect(data).assertEqual(0);
      done()
    })
  })
}
