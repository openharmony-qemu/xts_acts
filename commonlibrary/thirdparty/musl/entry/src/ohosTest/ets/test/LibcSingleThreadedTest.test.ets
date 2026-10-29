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

import { describe, it, expect } from '@ohos/hypium'
import libc_single_threaded_test from 'liblibc_single_threaded_test.so'

export default function LibcSingleThreadedTest() {
  describe('MuslLibcSingleThreadedTest', () => {

    /**
     * @tc.name   testMuslLibcSingleThreaded0100
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_SINGLE_THREADED_0100
     * @tc.desc   __libc_single_threaded初始值为0(测试环境已多线程)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_LIBC_SINGLE_THREADED_0100', 0, () => {
      let data: number = libc_single_threaded_test.SingleThreaded_0100();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslLibcSingleThreaded0200
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_SINGLE_THREADED_0200
     * @tc.desc   pthread_create后__libc_single_threaded值为0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_LIBC_SINGLE_THREADED_0200', 0, () => {
      let data: number = libc_single_threaded_test.SingleThreaded_0200();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslLibcSingleThreaded0300
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_SINGLE_THREADED_0300
     * @tc.desc   join后__libc_single_threaded值仍为0(不可逆)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_LIBC_SINGLE_THREADED_0300', 0, () => {
      let data: number = libc_single_threaded_test.SingleThreaded_0300();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslLibcSingleThreaded0400
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_SINGLE_THREADED_0400
     * @tc.desc   __libc_single_threaded变量类型为char
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_LIBC_SINGLE_THREADED_0400', 0, () => {
      let data: number = libc_single_threaded_test.SingleThreaded_0400();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslLibcSingleThreaded0500
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_SINGLE_THREADED_0500
     * @tc.desc   多次create+join循环后__libc_single_threaded值仍为0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_LIBC_SINGLE_THREADED_0500', 0, () => {
      let data: number = libc_single_threaded_test.SingleThreaded_0500();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslLibcSingleThreaded0600
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_SINGLE_THREADED_0600
     * @tc.desc   多线程并发读__libc_single_threaded无崩溃
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_LIBC_SINGLE_THREADED_0600', 0, () => {
      let data: number = libc_single_threaded_test.SingleThreaded_0600();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslLibcSingleThreaded0700
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_SINGLE_THREADED_0700
     * @tc.desc   读取__libc_single_threaded不修改errno
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_LIBC_SINGLE_THREADED_0700', 0, () => {
      let data: number = libc_single_threaded_test.SingleThreaded_0700();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslLibcSingleThreaded0800
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_SINGLE_THREADED_0800
     * @tc.desc   fork后子进程继承__libc_single_threaded值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_LIBC_SINGLE_THREADED_0800', 0, () => {
      let data: number = libc_single_threaded_test.SingleThreaded_0800();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslLibcSingleThreaded0900
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_SINGLE_THREADED_0900
     * @tc.desc   多线程父fork后子进程__libc_single_threaded值为0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_LIBC_SINGLE_THREADED_0900', 0, () => {
      let data: number = libc_single_threaded_test.SingleThreaded_0900();
      expect(data).assertEqual(0);
    });
  })
}
