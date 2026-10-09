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
import pthreadsetcanceltype from 'libpthreadsetcanceltype.so'

export default function PthreadSetcanceltypeTest() {
  describe('MuslPthreadSetcanceltypeTest', () => {
    beforeEach(async () => { await Utils.sleep(50) })

    /**
     * @tc.name   testMuslPthreadSetcanceltype0100
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_0100
     * @tc.desc   setcanceltype设置DEFERRED取消类型验证原类型获取
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadSetcanceltype0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_0100();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadSetcanceltype0200
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_0200
     * @tc.desc   setcanceltype设置ASYNCHRONOUS取消类型验证原类型获取
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadSetcanceltype0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_0200();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadSetcanceltype0300
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_0300
     * @tc.desc   setcanceltype连续设置ASYNC到DEFERRED验证oldtype反映前次设置值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadSetcanceltype0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_0300();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadSetcanceltype0400
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_0400
     * @tc.desc   setcanceltype非法type值返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadSetcanceltype0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_0400();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadSetcanceltype0500
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_0500
     * @tc.desc   setcanceltype传oldtype为NULL不接收原取消类型
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPthreadSetcanceltype0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_0500();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadSetcanceltype0600
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_0600
     * @tc.desc   setcanceltype非PC设备返回ENOSYS验证stub模式
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadSetcanceltype0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_0600();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadSetcanceltype0700
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_0700
     * @tc.desc   setcanceltype任意调用条件不返回EINTR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadSetcanceltype0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_0700();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadSetcanceltype0800
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_0800
     * @tc.desc   setcanceltype ASYNC类型cancel立即取消无取消点验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadSetcanceltype0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_0800();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadSetcanceltype0900
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_0900
     * @tc.desc   setcanceltype DEFERRED加cancel延迟到testcancel验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadSetcanceltype0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_0900();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadSetcanceltype1000
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_1000
     * @tc.desc   setcanceltype多线程独立设置取消类型互不影响
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadSetcanceltype1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_1000();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadSetcanceltype1100
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_1100
     * @tc.desc   setcanceltype多线程并发调用稳定性MT-safe验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadSetcanceltype1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_1100();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadSetcanceltype1200
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_1200
     * @tc.desc   setcanceltype千次DEFERRED与ASYNC交替切换稳定性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPthreadSetcanceltype1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_1200();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadSetcanceltype1300
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_1300
     * @tc.desc   setcanceltype非法type后oldtype保持原值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadSetcanceltype1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_1300();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadSetcanceltype1400
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_1400
     * @tc.desc   setcancelstate与setcanceltype交互取消行为验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadSetcanceltype1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_1400();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadSetcanceltype1500
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_1500
     * @tc.desc   setcanceltype type为INT_MIN极端负值返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadSetcanceltype1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_1500();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadSetcanceltype1600
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_1600
     * @tc.desc   setcanceltype NULL oldtype配合ASYNC类型验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadSetcanceltype1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_1600();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadSetcanceltype1700
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_1700
     * @tc.desc   setcanceltype百线程高并发稳定性验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadSetcanceltype1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_1700();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadSetcanceltype1800
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_1800
     * @tc.desc   setcanceltype万次快速调用稳定性验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPthreadSetcanceltype1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_1800();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadSetcanceltype1900
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_1900
     * @tc.desc   setcanceltype交替合法与非法调用恢复序列验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPthreadSetcanceltype1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_1900();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPthreadSetcanceltype2000
     * @tc.number SUB_THIRDPARTY_MUSL_SETCANCELTYPE_2000
     * @tc.desc   setcanceltype万次调用后线程结构完整性验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPthreadSetcanceltype2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = pthreadsetcanceltype.PthreadSetcanceltype_2000();
      expect(data).assertEqual(0);
      done();
    });
  })
}
