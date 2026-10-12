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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { beforeEach, describe, expect, it, TestType, Size, Level } from "@ohos/hypium-dynamic"
import Utils from './Utils'
import pthreadkeycreate from 'libpthreadkeycreate.so'

export default function PthreadKeyCreateTest() {
  describe('MuslPthreadKeyCreateTest', () => {
    beforeEach(async () => { await Utils.sleep(50) })

    /**
     * @tc.name   testMuslPthreadKeyCreate0100
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEYCREATE_0100
     * @tc.desc   pthread_key_create基本创建成功key值有效
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKeyCreate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadkeycreate.PthreadKeyCreate_Basic_0100();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKeyCreate0200
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEYCREATE_0200
     * @tc.desc   pthread_key_create带dtor回调创建成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKeyCreate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadkeycreate.PthreadKeyCreate_WithDtor_0200();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKeyCreate0300
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEYCREATE_0300
     * @tc.desc   连续创建10个key全成功且互不相同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKeyCreate0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadkeycreate.PthreadKeyCreate_MultiCreate_0300();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKeyCreate0400
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEYCREATE_0400
     * @tc.desc   pthread_key_create符号可用性验证(合法key创建删除)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKeyCreate0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadkeycreate.PthreadKeyCreate_NullKeyPtr_0400();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKeyCreate0500
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEYCREATE_0500
     * @tc.desc   create后setspecific/getspecific一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKeyCreate0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadkeycreate.PthreadKeyCreate_RoundTripSpecific_0500();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKeyCreate0600
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEYCREATE_0600
     * @tc.desc   子线程create带dtor+setspecific+exit时dtor被调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKeyCreate0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadkeycreate.PthreadKeyCreate_DtorOnExit_0600();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKeyCreate0700
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEYCREATE_0700
     * @tc.desc   setspecific(k,NULL)+退出时dtor不被调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKeyCreate0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadkeycreate.PthreadKeyCreate_DtorNullValueSkipped_0700();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKeyCreate0800
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEYCREATE_0800
     * @tc.desc   dtor重置非NULL值退出后反复调用直到PTHREAD_DESTRUCTOR_ITERATIONS次
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKeyCreate0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadkeycreate.PthreadKeyCreate_DtorIteration_0800();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKeyCreate0900
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEYCREATE_0900
     * @tc.desc   create后delete再create成功(槽复用)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKeyCreate0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadkeycreate.PthreadKeyCreate_ReuseAfterDelete_0900();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKeyCreate1000
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEYCREATE_1000
     * @tc.desc   循环create+delete 1000次全成功无累积失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKeyCreate1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadkeycreate.PthreadKeyCreate_StressCreateDelete_1000();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKeyCreate1100
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEYCREATE_1100
     * @tc.desc   4线程并发各自create+set+get互不影响
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKeyCreate1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadkeycreate.PthreadKeyCreate_ConcurrentCreate_1100();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKeyCreate1200
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEYCREATE_1200
     * @tc.desc   实测可创建key上限M并打印(M>=102通过)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKeyCreate1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let m: number = pthreadkeycreate.PthreadKeyCreate_FindMax_1200();
      hilog.info(0x0000, 'testTag', '===== actual max keys = %{public}d (fail if <101) =====', m);
      expect(m).assertLargerOrEqual(101);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKeyCreate1300
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEYCREATE_1300
     * @tc.desc   create M个全成功第M+1个必EAGAIN且delete后复用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKeyCreate1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadkeycreate.PthreadKeyCreate_ExhaustEagain_1300();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadKeyCreate1400
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADKEYCREATE_1400
     * @tc.desc   create满delete全再create满两次上限相等无泄漏
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadKeyCreate1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadkeycreate.PthreadKeyCreate_NoLeakUnderStress_1400();
      expect(data).assertEqual(0);
      done();
    });
  })
}
