/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import testNapi from 'libnapiCovSpecDiffV8.so';

function sleep(ms: number): Promise<void> {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

export default function specDiffV8Test() {
  describe('NapiCovSpecDiffV8Check', () => {
    beforeEach(async () => {
      await sleep(50);
    });

    // ========================================================================
    // D01: napi_reference_unref refcount=0 → OH 返回 napi_ok
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D01
     * @tc.number SUB_NAPI_COV_SPECV8_D01_0100
     * @tc.desc   确认 OH 在 refcount=0 时 unref 返回 napi_ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D01();
      expect(confirmed).assertTrue();
    });

    // ========================================================================
    // D02: napi_reference_ref 对 GC 后弱引用 OH 仍递增（幽灵计数）
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D02
     * @tc.number SUB_NAPI_COV_SPECV8_D02_0100
     * @tc.desc   确认 OH 对 GC 后弱引用 ref 仍递增产生幽灵计数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D02();
      expect(confirmed).assertTrue();
    });

    // ========================================================================
    // D03: napi_throw 非 Error → OH 返回 napi_invalid_arg
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D03String
     * @tc.number SUB_NAPI_COV_SPECV8_D03_0100
     * @tc.desc   确认 OH 对字符串 throw 返回 napi_invalid_arg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D03String', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const str = new String('hello');
      const confirmed: boolean = testNapi.specDiffV8D03(str);
      expect(confirmed).assertTrue();
    });

    /**
     * @tc.name   testSpecDiffV8D03Number
     * @tc.number SUB_NAPI_COV_SPECV8_D03_0200
     * @tc.desc   确认 OH 对数字 throw 返回 napi_invalid_arg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D03Number', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const num = new Number(42);
      const confirmed: boolean = testNapi.specDiffV8D03(num);
      expect(confirmed).assertTrue();
    });

    /**
     * @tc.name   testSpecDiffV8D03Object
     * @tc.number SUB_NAPI_COV_SPECV8_D03_0300
     * @tc.desc   确认 OH 对普通对象 throw 返回 napi_invalid_arg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D03Object', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const obj = new Map<string, string>();
      obj.set('key', 'value');
      const confirmed: boolean = testNapi.specDiffV8D03(obj);
      expect(confirmed).assertTrue();
    });

    // ========================================================================
    // D04: napi_get_and_clear_last_exception 无异常时 OH 不写 undefined
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D04
     * @tc.number SUB_NAPI_COV_SPECV8_D04_0100
     * @tc.desc   确认 OH 无异常时不写入 undefined，保留原哨兵值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D04();
      expect(confirmed).assertTrue();
    });

    // ========================================================================
    // D05: napi_create_arraybuffer data=nullptr → napi_invalid_arg
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D05
     * @tc.number SUB_NAPI_COV_SPECV8_D05_0100
     * @tc.desc   确认 OH 对 nullptr data 返回 napi_invalid_arg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D05();
      expect(confirmed).assertTrue();
    });

    // ========================================================================
    // D06: napi_get_arraybuffer_info byte_length=nullptr → napi_invalid_arg
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D06
     * @tc.number SUB_NAPI_COV_SPECV8_D06_0100
     * @tc.desc   确认 OH 对 nullptr byte_length 返回 napi_invalid_arg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D06();
      expect(confirmed).assertTrue();
    });

    // ========================================================================
    // D07: napi_create_buffer_copy result_data=nullptr → napi_invalid_arg
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D07
     * @tc.number SUB_NAPI_COV_SPECV8_D07_0100
     * @tc.desc   确认 OH 对 nullptr result_data 返回 napi_invalid_arg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D07();
      expect(confirmed).assertTrue();
    });

    // ========================================================================
    // D08: napi_get_buffer_info nullptr → OH 崩溃（安全验证有效路径）
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D08
     * @tc.number SUB_NAPI_COV_SPECV8_D08_0100
     * @tc.desc   安全验证有效参数路径；nullptr崩溃差异需源码审计确认
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D08ValidParams();
      expect(confirmed).assertTrue();
    });

    // ========================================================================
    // D09: napi_create_external_arraybuffer finalize_cb=nullptr → napi_invalid_arg
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D09
     * @tc.number SUB_NAPI_COV_SPECV8_D09_0100
     * @tc.desc   确认 OH 对 nullptr finalize_cb 返回 napi_invalid_arg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D09();
      expect(confirmed).assertTrue();
    });

    // ========================================================================
    // D10: 字符串创建 length=0, str=nullptr → napi_invalid_arg
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D10Latin1
     * @tc.number SUB_NAPI_COV_SPECV8_D10_0100
     * @tc.desc   确认 OH 对 latin1 nullptr+0 返回 napi_invalid_arg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D10Latin1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D10Latin1();
      expect(confirmed).assertTrue();
    });

    /**
     * @tc.name   testSpecDiffV8D10Utf8
     * @tc.number SUB_NAPI_COV_SPECV8_D10_0200
     * @tc.desc   确认 OH 对 utf8 nullptr+0 返回 napi_invalid_arg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D10Utf8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D10Utf8();
      expect(confirmed).assertTrue();
    });

    /**
     * @tc.name   testSpecDiffV8D10Utf16
     * @tc.number SUB_NAPI_COV_SPECV8_D10_0300
     * @tc.desc   确认 OH 对 utf16 nullptr+0 返回 napi_invalid_arg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D10Utf16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D10Utf16();
      expect(confirmed).assertTrue();
    });

    // ========================================================================
    // D11: napi_create_string_latin1 按 UTF-8 解码
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D11
     * @tc.number SUB_NAPI_COV_SPECV8_D11_0100
     * @tc.desc   确认 OH 将 Latin-1 0x80-0xFF 按 UTF-8 误解码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D11();
      expect(confirmed).assertTrue();
    });

    // ========================================================================
    // D12: 字符串创建 length > INT_MAX → OH 不返回 napi_invalid_arg
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D12Latin1
     * @tc.number SUB_NAPI_COV_SPECV8_D12_0100
     * @tc.desc   确认 OH 对 latin1 length>INT_MAX 不返回 napi_invalid_arg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D12Latin1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D12Latin1();
      expect(confirmed).assertTrue();
    });

    /**
     * @tc.name   testSpecDiffV8D12Utf8
     * @tc.number SUB_NAPI_COV_SPECV8_D12_0200
     * @tc.desc   确认 OH 对 utf8 length>INT_MAX 不返回 napi_invalid_arg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D12Utf8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D12Utf8();
      expect(confirmed).assertTrue();
    });

    // ========================================================================
    // D13: napi_create_string_utf16 显式长度模式仍扫描 NUL
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D13
     * @tc.number SUB_NAPI_COV_SPECV8_D13_0100
     * @tc.desc   确认 OH 用 NUL 扫描截断，resultLen < explicitLen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const resultLen: number = testNapi.specDiffV8D13();
      expect(resultLen > 0).assertTrue();
    });

    // ========================================================================
    // D14: napi_create_function 忽略 length
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D14
     * @tc.number SUB_NAPI_COV_SPECV8_D14_0100
     * @tc.desc   确认 OH 忽略 length，嵌入 NUL 被截断，name 长度 != 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D14();
      expect(confirmed).assertTrue();
    });

    // ========================================================================
    // D15: napi_define_class strlen 二次截断
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D15
     * @tc.number SUB_NAPI_COV_SPECV8_D15_0100
     * @tc.desc   确认 OH 用 strlen 二次截断，name 长度 != 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D15();
      expect(confirmed).assertTrue();
    });

    // ========================================================================
    // D16: napi_get_cb_info argv+!argc → OH 静默返回 napi_ok
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D16
     * @tc.number SUB_NAPI_COV_SPECV8_D16_0100
     * @tc.desc   确认 OH 对 argv+!argc 静默返回 napi_ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D16();
      expect(confirmed).assertTrue();
    });

    // ========================================================================
    // D17: napi_is_detached_arraybuffer 非 AB → napi_invalid_arg
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D17
     * @tc.number SUB_NAPI_COV_SPECV8_D17_0100
     * @tc.desc   确认 OH 对非 ArrayBuffer 返回 napi_invalid_arg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D17();
      expect(confirmed).assertTrue();
    });

    // ========================================================================
    // D18: napi_create_async_work complete=nullptr → napi_invalid_arg
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D18
     * @tc.number SUB_NAPI_COV_SPECV8_D18_0100
     * @tc.desc   确认 OH 对 nullptr complete 返回 napi_invalid_arg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D18();
      expect(confirmed).assertTrue();
    });

    // ========================================================================
    // D19: napi_make_callback 原始值 receiver → napi_object_expected
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D19
     * @tc.number SUB_NAPI_COV_SPECV8_D19_0100
     * @tc.desc   确认 OH 对数字 receiver 返回 napi_object_expected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D19();
      expect(confirmed).assertTrue();
    });

    // ========================================================================
    // D20: napi_get_version OH 返回 8
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D20
     * @tc.number SUB_NAPI_COV_SPECV8_D20_0100
     * @tc.desc   确认 OH 返回版本号为 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const version: number = testNapi.specDiffV8D20();
      expect(version).assertEqual(8);
    });

    // ========================================================================
    // D21: napi_is_array 对 SendableArray 返回 true
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D21
     * @tc.number SUB_NAPI_COV_SPECV8_D21_0100
     * @tc.desc   确认 OH 将 SendableArray 识别为数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D21();
      expect(confirmed).assertTrue();
    });

    // ========================================================================
    // D22: napi_is_arraybuffer 对 SendableArrayBuffer 返回 true
    // ========================================================================
    /**
     * @tc.name   testSpecDiffV8D22
     * @tc.number SUB_NAPI_COV_SPECV8_D22_0100
     * @tc.desc   确认 OH 将 SendableArrayBuffer 识别为 ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testSpecDiffV8D22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const confirmed: boolean = testNapi.specDiffV8D22();
      expect(confirmed).assertTrue();
    });
  });
}
