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
import pthreadyield from 'libpthreadyield.so'

export default function PthreadYieldTest() {
  describe('MuslPthreadYieldTest', () => {
    beforeEach(async () => { await Utils.sleep(50) })

    /**
     * @tc.name   testMuslPthreadYield0100
     * @tc.number SUB_THIRDPARTY_MUSL_YIELD_0100
     * @tc.desc   pthread_yield主线程单次调用验证返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadYield0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadyield.PthreadYield_0100();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadYield0200
     * @tc.number SUB_THIRDPARTY_MUSL_YIELD_0200
     * @tc.desc   pthread_yield工作线程单次调用验证返回0与线程回收
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadYield0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadyield.PthreadYield_0200();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadYield0300
     * @tc.number SUB_THIRDPARTY_MUSL_YIELD_0300
     * @tc.desc   pthread_yield非PC设备调用验证返回ENOSYS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadYield0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadyield.PthreadYield_0300();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadYield0400
     * @tc.number SUB_THIRDPARTY_MUSL_YIELD_0400
     * @tc.desc   pthread_yield多线程并发调用验证无数据竞争(4线程100次)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadYield0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadyield.PthreadYield_0400();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadYield0500
     * @tc.number SUB_THIRDPARTY_MUSL_YIELD_0500
     * @tc.desc   pthread_yield多线程并发调用验证无数据竞争(100线程10次)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadYield0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadyield.PthreadYield_0500();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadYield0600
     * @tc.number SUB_THIRDPARTY_MUSL_YIELD_0600
     * @tc.desc   pthread_yield连续调用稳定性验证(1000次)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPthreadYield0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = pthreadyield.PthreadYield_0600();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadYield0700
     * @tc.number SUB_THIRDPARTY_MUSL_YIELD_0700
     * @tc.desc   pthread_yield连续调用稳定性验证(10000次)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPthreadYield0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = pthreadyield.PthreadYield_0700();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadYield0800
     * @tc.number SUB_THIRDPARTY_MUSL_YIELD_0800
     * @tc.desc   pthread_yield与join循环验证无死锁(100轮)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadYield0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadyield.PthreadYield_0800();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadYield0900
     * @tc.number SUB_THIRDPARTY_MUSL_YIELD_0900
     * @tc.desc   pthread_yield调用验证调度行为与非阻塞返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadYield0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadyield.PthreadYield_0900();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadYield1000
     * @tc.number SUB_THIRDPARTY_MUSL_YIELD_1000
     * @tc.desc   pthread_yield长时间调用验证内存安全(10000次)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPthreadYield1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = pthreadyield.PthreadYield_1000();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadYield1100
     * @tc.number SUB_THIRDPARTY_MUSL_YIELD_1100
     * @tc.desc   pthread_yield两线程交替协作调度验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadYield1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadyield.PthreadYield_1100();
      expect(data).assertEqual(0);
      done();
    });
  })
}
