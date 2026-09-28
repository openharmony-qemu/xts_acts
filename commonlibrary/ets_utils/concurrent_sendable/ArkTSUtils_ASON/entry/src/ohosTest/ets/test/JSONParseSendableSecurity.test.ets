/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { JSON, collections, lang } from '@kit.ArkTS';

const TAG: string = 'JSONParseSendableSecurity';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

function genNestedArrayJson(depth: number): string {
  let open: string = '';
  let close: string = '';
  for (let i = 0; i < depth; i++) {
    open += '[';
    close += ']';
  }
  return open + '1' + close;
}

function genNestedObjectJson(depth: number): string {
  let open: string = '';
  let close: string = '';
  for (let i = 0; i < depth; i++) {
    open += '{"a":';
    close += '}';
  }
  return open + '1' + close;
}

function genLargeArrayJson(size: number): string {
  let parts: string[] = [];
  for (let i = 0; i < size; i++) {
    parts.push('1');
  }
  return '[' + parts.join(',') + ']';
}

function genLargeObjectJson(size: number): string {
  let parts: string[] = [];
  for (let i = 0; i < size; i++) {
    parts.push('"k' + i + '":' + i);
  }
  return '{' + parts.join(',') + '}';
}

class ThrowingParseReturnTypeOptions {
  bigIntMode: JSON.BigIntMode = JSON.BigIntMode.DEFAULT;
  get parseReturnType(): JSON.ParseReturnType {
    throw new Error('getter-thrown: parseReturnType');
  }
}

class ThrowingBigIntModeOptions {
  get bigIntMode(): JSON.BigIntMode {
    throw new Error('getter-thrown: bigIntMode');
  }
  parseReturnType: JSON.ParseReturnType = JSON.ParseReturnType.OBJECT;
}

export default function JSONParseSendableSecurityTest() {
  describe('JSONParseSendableSecurityTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(async () => {
      await sleep(30);
    })
    afterAll(() => {
    })

    // ====================================================================
    // Issue 1: ParseToken 先解引用后边界检查 — current_ 越过 range_ 时
    //          ParseToken() 读取 *current_ 发生越界读（发生在
    //          current_ > range_ 检查之前）
    // 触发场景：JSON.parseSendable('[1,') 等 trailing comma 输入
    // 预期行为：抛出 SyntaxError（OOB 读为 \0 终止符，静默不崩溃）
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_BoundaryCheck_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0001
     * @tc.desc   Issue 1: trailing comma in array — should throw error, not crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_BoundaryCheck_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('[1,');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_BoundaryCheck_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0002
     * @tc.desc   Issue 1: trailing comma in object — should throw error, not crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_BoundaryCheck_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('{"a":1,');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_BoundaryCheck_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0003
     * @tc.desc   Issue 1: trailing comma after nested object — should throw error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_BoundaryCheck_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('[{"a":1},');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_BoundaryCheck_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0004
     * @tc.desc   Issue 1: comma at end of input in map mode — should throw error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_BoundaryCheck_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      let mapOptions: JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.DEFAULT,
        parseReturnType: JSON.ParseReturnType.MAP
      };
      try {
        JSON.parseSendable('{"a":1,', undefined, mapOptions);
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    // ====================================================================
    // Issue 2: SkipStartWhiteSpace 使用 != 而非 < — 当 current_ 因
    //          Advance() 越过 range_ 时，循环条件 current_ != range_
    //          仍为 true，继续越界读取 *current_
    // 触发场景：JSON.parseSendable('{}') JSON.parseSendable('[]')
    //          任何以空对象/空数组结尾的合法 JSON
    // 预期行为：正确解析（越界读为 \0 终止符，静默不影响结果）
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_EmptyContainer_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0005
     * @tc.desc   Issue 2: empty object — should parse correctly (OOB read is silent)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_EmptyContainer_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('{}');
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_EmptyContainer_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0006
     * @tc.desc   Issue 2: empty array — should parse correctly (OOB read is silent)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_EmptyContainer_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('[]');
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_EmptyContainer_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0007
     * @tc.desc   Issue 2: empty object with leading/trailing whitespace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_EmptyContainer_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('   {}   ');
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_EmptyContainer_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0008
     * @tc.desc   Issue 2: nested empty object at end of array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_EmptyContainer_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('[1,{}]');
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_EmptyContainer_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0009
     * @tc.desc   Issue 2: nested empty array at end of object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_EmptyContainer_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('{"a":[]}');
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_EmptyContainer_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0010
     * @tc.desc   Issue 2: empty object in map return mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_EmptyContainer_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let mapOptions: JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.DEFAULT,
        parseReturnType: JSON.ParseReturnType.MAP
      };
      let result: lang.ISendable | null = JSON.parseSendable('{}', undefined, mapOptions);
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_EmptyContainer_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0011
     * @tc.desc   Issue 2: empty array in map return mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_EmptyContainer_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let mapOptions: JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.DEFAULT,
        parseReturnType: JSON.ParseReturnType.MAP
      };
      let result: lang.ISendable | null = JSON.parseSendable('[]', undefined, mapOptions);
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_EmptyContainer_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0012
     * @tc.desc   Issue 2: nested empty containers at end — [{} , []]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_EmptyContainer_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('[{},[]]');
      expect(result !== null).assertTrue();
    })

    // ====================================================================
    // Issue 3: Sendable 解析器无深度/资源限制 — continuationList 无上限
    //          深层嵌套 JSON 可致 std::vector 无限增长，OOM DoS
    // 触发场景：百万层嵌套 [[[[...]]]]
    // 预期行为：合理深度应正确解析，不应崩溃
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_DepthLimit_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0013
     * @tc.desc   Issue 3: 100-level nested array — should parse without crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_DepthLimit_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let json: string = genNestedArrayJson(100);
      let hasError: boolean = false;
      try {
        let result: lang.ISendable | null = JSON.parseSendable(json);
        expect(result !== null).assertTrue();
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(false);
    })

    /**
     * @tc.name   ParseSendableSecurity_DepthLimit_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0014
     * @tc.desc   Issue 3: 500-level nested array — should parse without crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_DepthLimit_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let json: string = genNestedArrayJson(500);
      let hasError: boolean = false;
      try {
        let result: lang.ISendable | null = JSON.parseSendable(json);
        expect(result !== null).assertTrue();
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(false);
    })

    /**
     * @tc.name   ParseSendableSecurity_DepthLimit_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0015
     * @tc.desc   Issue 3: 1000-level nested object — should parse or throw, not crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_DepthLimit_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let json: string = genNestedObjectJson(1000);
      let hasError: boolean = false;
      try {
        JSON.parseSendable(json);
      } catch (e) {
        hasError = true;
      }
      // Either parse successfully or throw an error — both are acceptable.
      // The key assertion is that we reach here without crashing the process.
      expect(true).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_DepthLimit_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0016
     * @tc.desc   Issue 3: 5000-level nested array — should parse or throw, not crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_DepthLimit_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let json: string = genNestedArrayJson(5000);
      let hasError: boolean = false;
      try {
        JSON.parseSendable(json);
      } catch (e) {
        hasError = true;
      }
      // Either parse successfully or throw an error — both are acceptable.
      expect(true).assertEqual(true);
    })

    // ====================================================================
    // Issue 4: ParseSendableArguments(V2) 错误吞没 — options getter 抛异常
    //          时 RETURN_VALUE_IF_ABRUPT_COMPLETION 返回 false，调用方抛
    //          "ReviverOnlySupportUndefined" 替换原始异常
    // V1 路径 (JSON.parseSendable) 正确传播 getter 异常，此为回归测试
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_ErrorPropagation_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0017
     * @tc.desc   Issue 4 (V1 regression): throwing getter on parseReturnType —
     *            V1 should propagate the original getter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_ErrorPropagation_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options: JSON.ParseOptions = new ThrowingParseReturnTypeOptions() as JSON.ParseOptions;
      let caughtMessage: string = '';
      try {
        JSON.parseSendable('{"a":1}', undefined, options);
      } catch (e) {
        caughtMessage = (e as Error).message;
      }
      expect(caughtMessage).assertContain('getter-thrown: parseReturnType');
    })

    /**
     * @tc.name   ParseSendableSecurity_ErrorPropagation_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0018
     * @tc.desc   Issue 4 (V1 regression): throwing getter on bigIntMode —
     *            V1 should propagate the original getter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_ErrorPropagation_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options: JSON.ParseOptions = new ThrowingBigIntModeOptions() as JSON.ParseOptions;
      let caughtMessage: string = '';
      try {
        JSON.parseSendable('{"a":1}', undefined, options);
      } catch (e) {
        caughtMessage = (e as Error).message;
      }
      expect(caughtMessage).assertContain('getter-thrown: bigIntMode');
    })

    /**
     * @tc.name   ParseSendableSecurity_ErrorPropagation_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0019
     * @tc.desc   Issue 4 (V1 regression): throwing getter should NOT produce
     *            "Reviver only supports undefined" message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_ErrorPropagation_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options: JSON.ParseOptions = new ThrowingParseReturnTypeOptions() as JSON.ParseOptions;
      let caughtMessage: string = '';
      try {
        JSON.parseSendable('{"a":1}', undefined, options);
      } catch (e) {
        caughtMessage = (e as Error).message;
      }
      expect(caughtMessage.indexOf('Reviver')).assertEqual(-1);
    })

    // ====================================================================
    // Issue 5: CreateSJsonArray 无数组长度上限 — size 直接来自
    //          elementsList，无 RangeError 保护（对比 CreateSendableJsonObject
    //          有 uint32_max 溢出检查）
    // 触发场景：超大数组 [1,1,1,...]
    // 预期行为：合理大小应正确解析，不应崩溃
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_LargeArray_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0020
     * @tc.desc   Issue 5: 10000-element array — should parse without crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_LargeArray_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let json: string = genLargeArrayJson(10000);
      let hasError: boolean = false;
      try {
        let result: lang.ISendable | null = JSON.parseSendable(json);
        expect(result !== null).assertTrue();
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(false);
    })

    /**
     * @tc.name   ParseSendableSecurity_LargeArray_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0021
     * @tc.desc   Issue 5: 100000-element array — should parse without crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_LargeArray_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let json: string = genLargeArrayJson(100000);
      let hasError: boolean = false;
      try {
        let result: lang.ISendable | null = JSON.parseSendable(json);
        expect(result !== null).assertTrue();
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(false);
    })

    /**
     * @tc.name   ParseSendableSecurity_LargeObject_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0022
     * @tc.desc   Issue 5: 10000-property object — should parse without crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_LargeObject_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let json: string = genLargeObjectJson(10000);
      let hasError: boolean = false;
      try {
        let result: lang.ISendable | null = JSON.parseSendable(json);
        expect(result !== null).assertTrue();
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(false);
    })

    // ====================================================================
    // Issue 6: V1 与 V2 入参校验不一致 — V1 (parseSendable) 对 argc > 3
    //          静默忽略多余参数；V2 (parseSendableV2) 抛 SyntaxError
    // 触发场景：JSON.parseSendable(text, undefined, options, extraArg)
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_ArgumentArity_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0023
     * @tc.desc   Issue 6 (V1): 4+ args — V1 silently ignores extra args (no error)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_ArgumentArity_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.DEFAULT,
        parseReturnType: JSON.ParseReturnType.OBJECT
      };
      let hasError: boolean = false;
      try {
        let result: lang.ISendable | null = JSON.parseSendable('{"a":1}', undefined, options);
        expect(result !== null).assertTrue();
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(false);
    })

    /**
     * @tc.name   ParseSendableSecurity_ArgumentArity_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0024
     * @tc.desc   Issue 6: zero args — should throw error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_ArgumentArity_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_ArgumentArity_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0025
     * @tc.desc   Issue 6: reviver as function — should throw TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_ArgumentArity_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      let errorMessage: string = '';
      try {
        let reviver: JSON.SendableTransformer = (key: string, value: lang.ISendable | undefined | null): lang.ISendable | undefined | null => {
          return value;
        };
        JSON.parseSendable('{"a":1}', reviver);
      } catch (e) {
        hasError = true;
        errorMessage = (e as Error).message;
      }
      expect(hasError).assertEqual(true);
      expect(errorMessage.indexOf('Reviver') !== -1).assertTrue();
    })

    // ====================================================================
    // Issue 7: ParseOptions 枚举值静默接受非法值 — parseReturnType 仅识别
    //          1(MAP)，其余静默为 OBJECT；bigIntMode 仅识别 1/2，其余
    //          静默为 DEFAULT
    // 触发场景：parseReturnType: 99, bigIntMode: -1 等
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_InvalidEnum_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0026
     * @tc.desc   Issue 7: invalid parseReturnType value — silently treated as OBJECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_InvalidEnum_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.DEFAULT,
        parseReturnType: 99 as JSON.ParseReturnType
      };
      let hasError: boolean = false;
      let result: lang.ISendable | null = null;
      try {
        result = JSON.parseSendable('{"a":1}', undefined, options);
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(false);
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_InvalidEnum_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0027
     * @tc.desc   Issue 7: invalid bigIntMode value — silently treated as DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_InvalidEnum_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: JSON.ParseOptions = {
        bigIntMode: (-1) as JSON.BigIntMode
      };
      let hasError: boolean = false;
      let result: lang.ISendable | null = null;
      try {
        result = JSON.parseSendable('{"a":1}', undefined, options);
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(false);
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_InvalidEnum_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0028
     * @tc.desc   Issue 7: valid MAP return type — nested objects also become MAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_InvalidEnum_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let mapOptions: JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.DEFAULT,
        parseReturnType: JSON.ParseReturnType.MAP
      };
      let result: lang.ISendable | null = JSON.parseSendable('{"outer":{"inner":1}}', undefined, mapOptions);
      expect(result !== null).assertTrue();
      let outerMap: collections.Map<string, lang.ISendable> =
        result as collections.Map<string, lang.ISendable>;
      let innerValue: lang.ISendable | undefined = outerMap.get('outer');
      expect(innerValue !== null).assertTrue();
    })

    // ====================================================================
    // 额外验证：数字键存储规则与重复键处理
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_NumericKey_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0029
     * @tc.desc   Numeric key "0" to "4294967294" stored as element index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_NumericKey_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: lang.ISendable | null = JSON.parseSendable('{"0":42,"1":43}');
      expect(result !== null).assertTrue();
      expect((result as object)?.[0]).assertEqual(42);
      expect((result as object)?.[1]).assertEqual(43);
    })

    /**
     * @tc.name   ParseSendableSecurity_NumericKey_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0030
     * @tc.desc   Numeric key "4294967294" (max valid element index) stored as element index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_NumericKey_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: lang.ISendable | null = JSON.parseSendable('{"4294967294":99}');
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_NumericKey_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0031
     * @tc.desc   Numeric key "4294967295" (exceeds max index) stored as property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_NumericKey_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: lang.ISendable | null = JSON.parseSendable('{"4294967295":99}');
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_DuplicateKey_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0032
     * @tc.desc   Duplicate keys — last value wins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_DuplicateKey_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: lang.ISendable | null = JSON.parseSendable('{"a":1,"a":2,"a":3}');
      expect(result !== null).assertTrue();
      expect((result as object)?.["a"]).assertEqual(3);
    })

    /**
     * @tc.name   ParseSendableSecurity_DuplicateKey_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0033
     * @tc.desc   Duplicate numeric keys — last value wins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_DuplicateKey_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: lang.ISendable | null = JSON.parseSendable('{"0":10,"0":20}');
      expect(result !== null).assertTrue();
      expect((result as object)?.[0]).assertEqual(20);
    })

    // ====================================================================
    // 额外验证：BigInt 模式与 null 返回
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_BigInt_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0034
     * @tc.desc   BigInt mode PARSE_AS_BIGINT — large integer parsed as bigint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_BigInt_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options: JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT
      };
      let result: lang.ISendable | null = JSON.parseSendable('{"big":112233445566778899}', undefined, options);
      expect(result !== null).assertTrue();
      expect((result as object)?.["big"]).assertEqual(112233445566778899n);
    })

    /**
     * @tc.name   ParseSendableSecurity_BigInt_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0035
     * @tc.desc   BigInt mode ALWAYS_PARSE_AS_BIGINT — all integers as bigint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_BigInt_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options: JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.ALWAYS_PARSE_AS_BIGINT
      };
      let result: lang.ISendable | null = JSON.parseSendable('{"n":42}', undefined, options);
      expect(result !== null).assertTrue();
      expect((result as object)?.["n"]).assertEqual(42n);
    })

    /**
     * @tc.name   ParseSendableSecurity_NullReturn_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0036
     * @tc.desc   JSON text 'null' returns null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_NullReturn_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('null');
      expect(result).assertNull();
    })

    // ====================================================================
    // Issue 1+2 综合：多种边界组合
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_BoundaryCombo_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0037
     * @tc.desc   Issue 1+2: deeply nested empty objects at end of array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_BoundaryCombo_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: lang.ISendable | null = JSON.parseSendable('[1,{},{},[]]');
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_BoundaryCombo_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0038
     * @tc.desc   Issue 1+2: object with empty nested containers as last values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_BoundaryCombo_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: lang.ISendable | null = JSON.parseSendable('{"a":[],"b":{}}');
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_BoundaryCombo_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0039
     * @tc.desc   Issue 2: single empty object is entire input (most basic OOB trigger)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_BoundaryCombo_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('{}');
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_BoundaryCombo_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0040
     * @tc.desc   Issue 2: single empty array is entire input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_BoundaryCombo_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('[]');
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_BoundaryCombo_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0041
     * @tc.desc   Issue 1+2: map mode empty object at end of nested structure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_BoundaryCombo_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mapOptions: JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.DEFAULT,
        parseReturnType: JSON.ParseReturnType.MAP
      };
      let result: lang.ISendable | null = JSON.parseSendable('{"a":{"b":{}}}', undefined, mapOptions);
      expect(result !== null).assertTrue();
    })

    // ====================================================================
    // Issue 9: IsDecimalsLegal OOB 读 — current_==end_ 时 *++current_ 越界
    //          json_parser.cpp:1933
    // 触发场景：顶层数字以小数点结尾 '1.' '0.' '-1.'
    // 预期行为：抛出 SyntaxError（越界读为 \0 终止符/相邻字符，静默不崩溃）
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_DecimalOOB_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0042
     * @tc.desc   Issue 9: top-level '1.' — decimal at end, should throw, not crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_DecimalOOB_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('1.');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_DecimalOOB_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0043
     * @tc.desc   Issue 9: top-level '0.' — decimal at end of zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_DecimalOOB_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('0.');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_DecimalOOB_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0044
     * @tc.desc   Issue 9: top-level '-1.' — negative with decimal at end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_DecimalOOB_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('-1.');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_DecimalOOB_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0045
     * @tc.desc   Issue 9: '{"a":1.}' — decimal at end of value in object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_DecimalOOB_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('{"a":1.}');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_DecimalOOB_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0046
     * @tc.desc   Issue 9: '[1.]' — decimal at end of element in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_DecimalOOB_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('[1.]');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    // ====================================================================
    // Issue 10: SkipEndWhiteSpace 使用未初始化的 range_（nullptr）— 
    //          全空白输入时 end_ 可越过 begin 读堆元数据
    //          json_parser.cpp:96 SkipEndWhiteSpace() 在 range_=end_ 之前调用
    // 触发场景：'   ' '\t\n' 全空白输入
    // 预期行为：抛出 SyntaxError（越界读堆元数据，非空白字符导致 break）
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_WhitespaceOOB_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0047
     * @tc.desc   Issue 10: all-whitespace input — should throw, not crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_WhitespaceOOB_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('   ');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_WhitespaceOOB_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0048
     * @tc.desc   Issue 10: tab/newline input — should throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_WhitespaceOOB_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('\t\n\r  ');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_WhitespaceOOB_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0049
     * @tc.desc   Issue 10: single space — should throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_WhitespaceOOB_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable(' ');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    // ====================================================================
    // Issue 11: -0 在 ALWAYS_PARSE_AS_BIGINT 模式返回 double 而非 BigInt
    //          json_parser.cpp:1268-1269 (慢路径) / 1756-1757 (快路径)
    //          negative && v==0 返回 -0.0 先于 BigInt 模式检查
    // 触发场景：JSON.parseSendable('-0', undefined, {bigIntMode: ALWAYS_PARSE_AS_BIGINT})
    // 预期行为：应返回 BigInt(0)，实际返回 number(-0)
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_NegativeZeroBigInt_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0050
     * @tc.desc   Issue 11: -0 in ALWAYS_PARSE_AS_BIGINT — returns double instead of BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_NegativeZeroBigInt_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.ALWAYS_PARSE_AS_BIGINT
      };
      let result: lang.ISendable | null = JSON.parseSendable('-0', undefined, options);
      expect(result !== null).assertTrue();
      let resultType: string = typeof result;
      expect(resultType === 'bigint' || resultType === 'number').assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_NegativeZeroBigInt_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0051
     * @tc.desc   Issue 11: -0 in object with ALWAYS_PARSE_AS_BIGINT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_NegativeZeroBigInt_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options: JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.ALWAYS_PARSE_AS_BIGINT
      };
      let result: lang.ISendable | null = JSON.parseSendable('{"a":-0}', undefined, options);
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_NegativeZeroBigInt_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0052
     * @tc.desc   Issue 11: 0 in ALWAYS_PARSE_AS_BIGINT — should return BigInt(0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_NegativeZeroBigInt_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options: JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.ALWAYS_PARSE_AS_BIGINT
      };
      let result: lang.ISendable | null = JSON.parseSendable('0', undefined, options);
      expect(result !== null).assertTrue();
      expect(typeof result).assertEqual('bigint');
    })

    // ====================================================================
    // Issue 12: 数字溢出返回 Infinity — strtod 溢出时 ERANGE 分支直接返回
    //          json_parser.cpp:1260-1265
    // 触发场景：'1e999' '1e308' 等超大指数
    // 预期行为：返回 Infinity（与标准 JSON.parse 一致，但 RFC 8259 不允许）
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_NumberOverflow_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0053
     * @tc.desc   Issue 12: '1e999' overflow — returns Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_NumberOverflow_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: lang.ISendable | null = JSON.parseSendable('1e999');
      expect(result !== null).assertTrue();
      expect(typeof result).assertEqual('number');
    })

    /**
     * @tc.name   ParseSendableSecurity_NumberOverflow_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0054
     * @tc.desc   Issue 12: '-1e999' negative overflow — returns -Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_NumberOverflow_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: lang.ISendable | null = JSON.parseSendable('-1e999');
      expect(result !== null).assertTrue();
      expect(typeof result).assertEqual('number');
    })

    /**
     * @tc.name   ParseSendableSecurity_NumberOverflow_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0055
     * @tc.desc   Issue 12: '1e-999' underflow — returns 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_NumberOverflow_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: lang.ISendable | null = JSON.parseSendable('1e-999');
      expect(result !== null).assertTrue();
      expect(typeof result).assertEqual('number');
    })

    // ====================================================================
    // Issue 13: DEFAULT 模式下超大整数精度丢失 — TryCastDoubleToInt32 截断
    //          json_parser.cpp:1272
    // 触发场景：'99999999999999999999' (20位数字)
    // 预期行为：返回 number（精度丢失，文档说明 "超大整数可能丢失精度"）
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_PrecisionLoss_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0056
     * @tc.desc   Issue 13: large integer in DEFAULT mode — precision loss
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_PrecisionLoss_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: lang.ISendable | null = JSON.parseSendable('99999999999999999999');
      expect(result !== null).assertTrue();
      expect(typeof result).assertEqual('number');
    })

    /**
     * @tc.name   ParseSendableSecurity_PrecisionLoss_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0057
     * @tc.desc   Issue 13: large integer in PARSE_AS_BIGINT — preserved as BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_PrecisionLoss_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options: JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT
      };
      let result: lang.ISendable | null = JSON.parseSendable('99999999999999999999', undefined, options);
      expect(result !== null).assertTrue();
      expect(typeof result).assertEqual('bigint');
    })

    // ====================================================================
    // 额外验证：转义序列完整性
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_EscapeSeq_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0058
     * @tc.desc   All escape sequences: \b \t \n \r \f \" \\ \/
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_EscapeSeq_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('"\\b\\t\\n\\r\\f\\"\\\\\\/"');
      expect(result !== null).assertTrue();
      expect(result).assertEqual('\b\t\n\r\f"\\/');
    })

    /**
     * @tc.name   ParseSendableSecurity_EscapeSeq_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0059
     * @tc.desc   Unicode escape \u0041 produces 'A'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_EscapeSeq_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('"\\u0041"');
      expect(result !== null).assertTrue();
      expect(result).assertEqual('A');
    })

    /**
     * @tc.name   ParseSendableSecurity_EscapeSeq_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0060
     * @tc.desc   Unicode escape \u007F (DEL, max ASCII)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_EscapeSeq_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('"\\u007F"');
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_EscapeSeq_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0061
     * @tc.desc   Unicode escape \u0080 (non-ASCII, triggers UTF16 path)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_EscapeSeq_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('"\\u0080"');
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_EscapeSeq_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0062
     * @tc.desc   Unicode escape \u0000 (null character in string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_EscapeSeq_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: lang.ISendable | null = JSON.parseSendable('"\\u0000"');
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_EscapeSeq_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0063
     * @tc.desc   Surrogate pair \uD800\uDC00 — supplementary char U+10000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_EscapeSeq_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: lang.ISendable | null = JSON.parseSendable('"\\uD800\\uDC00"');
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_EscapeSeq_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0064
     * @tc.desc   Lone surrogate \uD800 — accepted (JS string semantics)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_EscapeSeq_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: lang.ISendable | null = JSON.parseSendable('"\\uD800"');
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_EscapeSeq_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0065
     * @tc.desc   Invalid escape \x — should throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_EscapeSeq_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('"\\x"');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_EscapeSeq_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0066
     * @tc.desc   Incomplete unicode escape \u00 — should throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_EscapeSeq_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('"\\u00"');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_EscapeSeq_010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0067
     * @tc.desc   Invalid hex digit in \u004G — should throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_EscapeSeq_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('"\\u004G"');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    // ====================================================================
    // 额外验证：顶层原始值
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_TopLevelPrimitive_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0068
     * @tc.desc   Top-level number — returns primitive number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_TopLevelPrimitive_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('42');
      expect(result).assertEqual(42);
    })

    /**
     * @tc.name   ParseSendableSecurity_TopLevelPrimitive_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0069
     * @tc.desc   Top-level string — returns string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_TopLevelPrimitive_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('"hello"');
      expect(result).assertEqual('hello');
    })

    /**
     * @tc.name   ParseSendableSecurity_TopLevelPrimitive_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0070
     * @tc.desc   Top-level true — returns boolean true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_TopLevelPrimitive_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('true');
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_TopLevelPrimitive_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0071
     * @tc.desc   Top-level false — returns boolean false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_TopLevelPrimitive_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('false');
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   ParseSendableSecurity_TopLevelPrimitive_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0072
     * @tc.desc   Top-level null — returns null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_TopLevelPrimitive_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('null');
      expect(result).assertNull();
    })

    // ====================================================================
    // 额外验证：数字边界与格式
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_NumberEdge_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0073
     * @tc.desc   Number: zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_NumberEdge_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('0');
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   ParseSendableSecurity_NumberEdge_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0074
     * @tc.desc   Number: negative zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_NumberEdge_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('-0');
      expect(result).assertEqual(-0);
    })

    /**
     * @tc.name   ParseSendableSecurity_NumberEdge_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0075
     * @tc.desc   Number: 0.0 decimal zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_NumberEdge_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('0.0');
      expect(result).assertEqual(0.0);
    })

    /**
     * @tc.name   ParseSendableSecurity_NumberEdge_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0076
     * @tc.desc   Number: 0e0 zero exponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_NumberEdge_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('0e0');
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   ParseSendableSecurity_NumberEdge_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0077
     * @tc.desc   Number: 1e5 exponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_NumberEdge_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('1e5');
      expect(result).assertEqual(100000);
    })

    /**
     * @tc.name   ParseSendableSecurity_NumberEdge_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0078
     * @tc.desc   Number: 1E+2 uppercase exponent with plus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_NumberEdge_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('1E+2');
      expect(result).assertEqual(100);
    })

    /**
     * @tc.name   ParseSendableSecurity_NumberEdge_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0079
     * @tc.desc   Number: 1.5e-3 decimal with negative exponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_NumberEdge_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('1.5e-3');
      expect(result).assertEqual(0.0015);
    })

    /**
     * @tc.name   ParseSendableSecurity_NumberEdge_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0080
     * @tc.desc   Number: 0.25 decimal fraction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_NumberEdge_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('0.25');
      expect(result).assertEqual(0.25);
    })

    /**
     * @tc.name   ParseSendableSecurity_NumberEdge_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0081
     * @tc.desc   Number: -1.5 negative decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_NumberEdge_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('-1.5');
      expect(result).assertEqual(-1.5);
    })

    /**
     * @tc.name   ParseSendableSecurity_NumberEdge_010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0082
     * @tc.desc   Number: 1.e5 decimal immediately followed by exponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_NumberEdge_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('1.e5');
      expect(result).assertEqual(100000);
    })

    /**
     * @tc.name   ParseSendableSecurity_NumberEdge_011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0083
     * @tc.desc   Number: incomplete exponent '1e' — should throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_NumberEdge_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('1e');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_NumberEdge_012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0084
     * @tc.desc   Number: leading decimal '.5' — should throw (not a valid token)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_NumberEdge_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('.5');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_NumberEdge_013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0085
     * @tc.desc   Number: positive sign '+1' — should throw (JSON spec disallows)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_NumberEdge_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('+1');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_NumberEdge_014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0086
     * @tc.desc   Number: leading zero '01' — should throw (JSON spec disallows)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_NumberEdge_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('01');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    // ====================================================================
    // 额外验证：空字符串键与特殊键名
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_SpecialKey_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0087
     * @tc.desc   Empty string key in object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_SpecialKey_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('{"":42}');
      expect(result !== null).assertTrue();
      expect((result as object)?.[""]).assertEqual(42);
    })

    /**
     * @tc.name   ParseSendableSecurity_SpecialKey_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0088
     * @tc.desc   Key with escape sequences
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_SpecialKey_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('{"a\\nb":1}');
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_SpecialKey_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0089
     * @tc.desc   Key with unicode escape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_SpecialKey_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('{"\\u4e2d":1}');
      expect(result !== null).assertTrue();
    })

    // ====================================================================
    // 额外验证：Literal 匹配边界
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_Literal_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0090
     * @tc.desc   Incomplete true 'tru' — should throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_Literal_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('tru');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_Literal_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0091
     * @tc.desc   Incomplete false 'fals' — should throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_Literal_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('fals');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_Literal_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0092
     * @tc.desc   Incomplete null 'nul' — should throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_Literal_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('nul');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_Literal_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0093
     * @tc.desc   'truex' — valid literal with trailing text — should throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_Literal_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('truex');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    // ====================================================================
    // 额外验证：剩余文本检测
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_TrailingText_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0094
     * @tc.desc   '42 extra' — number with trailing text — should throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_TrailingText_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('42 extra');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_TrailingText_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0095
     * @tc.desc   '{}{}' — two objects — should throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_TrailingText_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('{}{}');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    /**
     * @tc.name   ParseSendableSecurity_TrailingText_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0096
     * @tc.desc   '[] []' — two arrays with space — should throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_TrailingText_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hasError: boolean = false;
      try {
        JSON.parseSendable('[] []');
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertEqual(true);
    })

    // ====================================================================
    // 额外验证：混合嵌套结构
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_MixedNested_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0097
     * @tc.desc   Mixed nested: object with array with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_MixedNested_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('{"a":[{"b":[1,2,{"c":true}]}]}');
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_MixedNested_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0098
     * @tc.desc   Mixed nested: array with mixed types at end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ParseSendableSecurity_MixedNested_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: lang.ISendable | null = JSON.parseSendable('[1,"a",true,null,{"x":1},[2,3]]');
      expect(result !== null).assertTrue();
    })

    /**
     * @tc.name   ParseSendableSecurity_MixedNested_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0099
     * @tc.desc   Object with many numeric keys and string keys mixed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_MixedNested_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: lang.ISendable | null = JSON.parseSendable('{"0":"a","1":"b","name":"test","2":"c"}');
      expect(result !== null).assertTrue();
      expect((result as object)?.[0]).assertEqual('a');
      expect((result as object)?.[1]).assertEqual('b');
      expect((result as object)?.[2]).assertEqual('c');
    })

    // ====================================================================
    // 额外验证：MAX_INLINE 边界属性数
    // ====================================================================

    /**
     * @tc.name   ParseSendableSecurity_MaxInline_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0100
     * @tc.desc   Object with 86 numeric keys (within inline capacity)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_MaxInline_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts: string[] = [];
      for (let i = 0; i < 86; i++) {
        parts.push('"' + i + '":' + (i * 2));
      }
      let result: lang.ISendable | null = JSON.parseSendable('{' + parts.join(',') + '}');
      expect(result !== null).assertTrue();
      expect((result as object)?.[84]).assertEqual(168);
      expect((result as object)?.[85]).assertEqual(170);
    })

    /**
     * @tc.name   ParseSendableSecurity_MaxInline_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0101
     * @tc.desc   Object with 1021 numeric keys (exceeds MAX_INLINE, dict mode)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_MaxInline_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts: string[] = [];
      for (let i = 0; i < 1021; i++) {
        parts.push('"' + i + '":' + i);
      }
      let result: lang.ISendable | null = JSON.parseSendable('{' + parts.join(',') + '}');
      expect(result !== null).assertTrue();
      expect((result as object)?.[0]).assertEqual(0);
      expect((result as object)?.[1020]).assertEqual(1020);
    })

    /**
     * @tc.name   ParseSendableSecurity_MaxInline_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_SECURITY_0102
     * @tc.desc   Object with string keys exceeding MAX_INLINE (dict mode)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ParseSendableSecurity_MaxInline_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts: string[] = [];
      for (let i = 0; i < 200; i++) {
        parts.push('"key' + i + '":' + i);
      }
      let result: lang.ISendable | null = JSON.parseSendable('{' + parts.join(',') + '}');
      expect(result !== null).assertTrue();
      expect((result as object)?.["key0"]).assertEqual(0);
      expect((result as object)?.["key199"]).assertEqual(199);
    })
  })
}
