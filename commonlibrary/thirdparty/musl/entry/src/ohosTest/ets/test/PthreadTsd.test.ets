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
import pthreadtsd from 'libpthreadtsd.so'

export default function PthreadTsdTest() {
  describe('MuslPthreadTsdTest', () => {
    beforeEach(async () => { await Utils.sleep(50) })

    /**
     * @tc.name   testMuslPthreadTsd0100
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADTSD_0100
     * @tc.desc   pthread_gettsd在已初始化线程返回非空且稳定指针
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadTsd0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadtsd.PthreadTsd_0100();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadTsd0200
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADTSD_0200
     * @tc.desc   pthread_settsd替换tsd后pthread_gettsd返回新buf地址(往返一致)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadTsd0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadtsd.PthreadTsd_0200();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadTsd0300
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADTSD_0300
     * @tc.desc   settsd重定向后pthread_setspecific/getspecific在buf[k]读写且与gettsd()[k]一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadTsd0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadtsd.PthreadTsd_0300();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadTsd0400
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADTSD_0400
     * @tc.desc   主线程settsd替换不影响子线程tsd指针(per-thread隔离)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadTsd0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadtsd.PthreadTsd_0400();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadTsd0500
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADTSD_0500
     * @tc.desc   settsd替换后恢复原tsd指针且specific操作正常不污染后续
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadTsd0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadtsd.PthreadTsd_0500();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadTsd0600
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADTSD_0600
     * @tc.desc   pthread_settsd(NULL)触发进程终止abort(fork子进程+pipe探针隔离验证)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPthreadTsd0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = pthreadtsd.PthreadTsd_0600();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadTsd0700
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADTSD_0700
     * @tc.desc   settsd重定向后C11 tss_set/tss_get在buf[k]读写且与gettsd()[k]一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadTsd0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadtsd.PthreadTsd_0700();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadTsd0800
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADTSD_0800
     * @tc.desc   settsd后pthread_key_create/setspecific写buf[k],key_delete清零buf[k]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadTsd0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadtsd.PthreadTsd_0800();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadTsd0900
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADTSD_0900
     * @tc.desc   pthread_create为新线程初始化tsd,子线程gettsd非空且与specific一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadTsd0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadtsd.PthreadTsd_0900();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadTsd1000
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREADTSD_1000
     * @tc.desc   settsd重定向后pthread_exit触发__pthread_tsd_run_dtors在buf上跑析构函数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadTsd1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadtsd.PthreadTsd_1000();
      expect(data).assertEqual(0);
      done();
    });
  })
}
