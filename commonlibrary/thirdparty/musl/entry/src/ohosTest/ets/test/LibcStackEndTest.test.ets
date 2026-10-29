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
import libc_stack_end_test from 'liblibc_stack_end_test.so'

export default function LibcStackEndTest() {
  describe('MuslLibcStackEndTest', () => {

    /**
     * @tc.name   testMuslLibcStackEnd0100
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_STACK_END_0100
     * @tc.desc   __libc_stack_end值非NULL验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_LIBC_STACK_END_0100', 0, () => {
      let data: number = libc_stack_end_test.StackEnd_0100();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslLibcStackEnd0200
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_STACK_END_0200
     * @tc.desc   __libc_stack_end值不低于栈局部变量地址
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_LIBC_STACK_END_0200', 0, () => {
      let data: number = libc_stack_end_test.StackEnd_0200();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslLibcStackEnd0300
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_STACK_END_0300
     * @tc.desc   __libc_stack_end两次读取值恒定不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_LIBC_STACK_END_0300', 0, () => {
      let data: number = libc_stack_end_test.StackEnd_0300();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslLibcStackEnd0400
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_STACK_END_0400
     * @tc.desc   __libc_stack_end值指向可读内存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_LIBC_STACK_END_0400', 0, () => {
      let data: number = libc_stack_end_test.StackEnd_0400();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslLibcStackEnd0500
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_STACK_END_0500
     * @tc.desc   __libc_stack_end extern声明可正确链接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_LIBC_STACK_END_0500', 0, () => {
      let data: number = libc_stack_end_test.StackEnd_0500();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslLibcStackEnd0600
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_STACK_END_0600
     * @tc.desc   __libc_stack_end变量类型为void指针
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_LIBC_STACK_END_0600', 0, () => {
      let data: number = libc_stack_end_test.StackEnd_0600();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslLibcStackEnd0700
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_STACK_END_0700
     * @tc.desc   多线程并发读__libc_stack_end无崩溃
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_LIBC_STACK_END_0700', 0, () => {
      let data: number = libc_stack_end_test.StackEnd_0700();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslLibcStackEnd0800
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_STACK_END_0800
     * @tc.desc   __libc_stack_end值位于proc maps栈区间
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_LIBC_STACK_END_0800', 0, () => {
      let data: number = libc_stack_end_test.StackEnd_0800();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslLibcStackEnd0900
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_STACK_END_0900
     * @tc.desc   __libc_stack_end值按页大小对齐
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_LIBC_STACK_END_0900', 0, () => {
      let data: number = libc_stack_end_test.StackEnd_0900();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslLibcStackEnd1000
     * @tc.number SUB_THIRDPARTY_MUSL_LIBC_STACK_END_1000
     * @tc.desc   非主线程读取__libc_stack_end值仍为主线程栈顶
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_LIBC_STACK_END_1000', 0, () => {
      let data: number = libc_stack_end_test.StackEnd_1000();
      expect(data).assertEqual(0);
    });
  })
}
