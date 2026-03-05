/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

class SimpleObj {
  name: string = "";
  year: number = 0;
  value: number = 0;
}
class BoolObj {
  isTrue: boolean = true;
  isFalse: boolean = false;
}
class BooleanObj {
  boolVal: boolean = true;
}
class NullObj {
  val: Object | null = null;
}
class FloatObj {
  pi: number = 0;
}
class StringObj {
  msg: string = "";
}
class ArrayObj {
  list: number[] = [];
}
class NestedInner {
  innerVal: string = "";
}
class NestedOuter {
  out: NestedInner = new NestedInner();
}
class PathObj {
  path: string = "";
}
class SpecialCharObj {
  content: string = "";
}
class NestedDetail {
  name: string = "";
  value: number = 0;
}
class NestedObj {
  id: number = 0;
  detail: NestedDetail = new NestedDetail();
}
class NumericObj {
  byteVal: number = 0;
  shortVal: number = 0;
  intVal: number = 0;
  longVal: number = 0;
  floatVal: number = 0;
  doubleVal: number = 0;
}
class BigIntObj {
  val: bigint = 0n;
}
class UndefinedTest {
  visible: number = 1;
  hidden: Object | undefined = undefined;
}
class MaxIntObj {
  max: number = Number.MAX_SAFE_INTEGER;
}
class NumberArray {
  list: number[] = [1, 2, 3];
}

class BuiltinTestJsonReplacerTemp {
  jsonReplacer(): Record<string, Object> {
    throw new Error("frontend bug");
  }
}

export default function builtinsJsonTest() {
  describe('BuiltinsJSONTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })

    /**
     * @tc.name builtinsJsonTest0001
     * @tc.number BUILTINS_JSON_TEST_0001
     * @tc.desc Test parse basic object structure
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name":"ArkTS", "year":0, "value":100}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      expect(result).not().assertNull();
      if (result != null) {
        expect(result.name).assertEqual("ArkTS");
        expect(result.value).assertEqual(100);
      }
    });

    /**
     * @tc.name builtinsJsonTest0002
     * @tc.number BUILTINS_JSON_TEST_0002
     * @tc.desc Test parse Integer Zero
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "default", "year":0, "value":0}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(0);
      }
    });

    /**
     * @tc.name builtinsJsonTest0003
     * @tc.number BUILTINS_JSON_TEST_0003
     * @tc.desc Test parse Negative Integer
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "default", "year":0, "value":-12345}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(-12345);
      }
    });

    /**
     * @tc.name builtinsJsonTest0004
     * @tc.number BUILTINS_JSON_TEST_0004
     * @tc.desc Test parse Floating Point Number
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "default", "year":0, "value":3.14159}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(3.14159);
      }
    });

    /**
     * @tc.name builtinsJsonTest0005
     * @tc.number BUILTINS_JSON_TEST_0005
     * @tc.desc Test parse Scientific Notation
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "default", "year":0, "value":2.5e3}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(2500);
      }
    });

    /**
     * @tc.name builtinsJsonTest0006
     * @tc.number BUILTINS_JSON_TEST_0006
     * @tc.desc Test parse Max Safe Integer
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxSafe = Number.MAX_SAFE_INTEGER;
      const jsonStr = `{"name": "default", "year":0, "value":${maxSafe}}`;
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(maxSafe);
      }
    });

    /**
     * @tc.name builtinsJsonTest0007
     * @tc.number BUILTINS_JSON_TEST_0007
     * @tc.desc Test parse Boolean True
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"boolVal":true}';
      const result = JSON.parse<BooleanObj>(jsonStr, Class.from<BooleanObj>());
      if (result != null) {
        expect(result.boolVal).assertEqual(true);
      }
    });

    /**
     * @tc.name builtinsJsonTest0008
     * @tc.number BUILTINS_JSON_TEST_0008
     * @tc.desc Test parse Boolean False
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"boolVal":false}';
      const result = JSON.parse<BooleanObj>(jsonStr, Class.from<BooleanObj>());
      if (result != null) {
        expect(result.boolVal).assertEqual(false);
      }
    });

    /**
     * @tc.name builtinsJsonTest0009
     * @tc.number BUILTINS_JSON_TEST_0009
     * @tc.desc Test parse String with Escape Characters
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content":"Line\\nTab\\tQuote\\""}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual('Line\nTab\tQuote"');
      }
    });

    /**
     * @tc.name builtinsJsonTest0010
     * @tc.number BUILTINS_JSON_TEST_0010
     * @tc.desc Test parse String with Emoji
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content":"😊"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("😊");
      }
    });

    /**
     * @tc.name builtinsJsonTest0011
     * @tc.number BUILTINS_JSON_TEST_0011
     * @tc.desc Test parse Nested Object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"id":1, "detail":{"name":"Nested", "value":99}}';
      const result = JSON.parse<NestedObj>(jsonStr, Class.from<NestedObj>());
      if (result != null) {
        expect(result.id).assertEqual(1);
        expect(result.detail.name).assertEqual("Nested");
      }
    });

    /**
     * @tc.name builtinsJsonTest0012
     * @tc.number BUILTINS_JSON_TEST_0012
     * @tc.desc Test parse JSON with extra fields (Robustness)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name":"Robust", "year":0, "value":10, "extra":"ignored"}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("Robust");
      }
    });

    /**
     * @tc.name builtinsJsonTest0013
     * @tc.number BUILTINS_JSON_TEST_0013
     * @tc.desc Test parse String keyword values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content":"null"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("null");
      }
    });

    /**
     * @tc.name builtinsJsonTest0014
     * @tc.number BUILTINS_JSON_TEST_0014
     * @tc.desc Test parse Empty String value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content":""}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("");
      }
    });

    /**
     * @tc.name builtinsJsonTest0015
     * @tc.number BUILTINS_JSON_TEST_0015
     * @tc.desc Test parse with negative zero
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "", "year":0, "value":-0}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(0);
        expect(1 / result.value).assertEqual(-Infinity);
      }
    });

    /**
     * @tc.name builtinsJsonTest0016
     * @tc.number BUILTINS_JSON_TEST_0016
     * @tc.desc Test parse large number string (within safe limit)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "", "year":0, "value":9000000000000}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(9000000000000);
      }
    });

    /**
     * @tc.name builtinsJsonTest0017
     * @tc.number BUILTINS_JSON_TEST_0017
     * @tc.desc Test parse object with space in key (JSON valid)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "", "year":0, "value": 0, "name ": "value"}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("");
      }
    });

    /**
     * @tc.name builtinsJsonTest0018
     * @tc.number BUILTINS_JSON_TEST_0018
     * @tc.desc Test parse with multiple fields
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name":"A", "year":0, "value":1}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("A");
        expect(result.value).assertEqual(1);
      }
    });

    /**
     * @tc.name builtinsJsonTest0019
     * @tc.number BUILTINS_JSON_TEST_0019
     * @tc.desc Test parse with surrounding whitespace
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '  {"name": "", "year":0, "value": 100}  ';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(100);
      }
    });

    /**
     * @tc.name builtinsJsonTest0020
     * @tc.number BUILTINS_JSON_TEST_0020
     * @tc.desc Test parse object with boolean true string value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "true"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("true");
      }
    });

    /**
     * @tc.name builtinsJsonTest0021
     * @tc.number BUILTINS_JSON_TEST_0021
     * @tc.desc Test parse object with boolean false string value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "false"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("false");
      }
    });

    /**
     * @tc.name builtinsJsonTest0022
     * @tc.number BUILTINS_JSON_TEST_0022
     * @tc.desc Test parse float with high precision
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "", "year":0, "value": 0.123456789}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(0.123456789);
      }
    });

    /**
     * @tc.name builtinsJsonTest0023
     * @tc.number BUILTINS_JSON_TEST_0023
     * @tc.desc Test parse object with single quote in string (escaped)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "\'"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("'");
      }
    });

    /**
     * @tc.name builtinsJsonTest0024
     * @tc.number BUILTINS_JSON_TEST_0024
     * @tc.desc Test parse object with backslash in string
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "\\\\"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("\\");
      }
    });

    /**
     * @tc.name builtinsJsonTest0025
     * @tc.number BUILTINS_JSON_TEST_0025
     * @tc.desc Test parse object with forward slash
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "/"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("/");
      }
    });

    /**
     * @tc.name builtinsJsonTest0026
     * @tc.number BUILTINS_JSON_TEST_0026
     * @tc.desc Test parse Byte type range
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 127, "shortVal": 0, "intVal": 0, "longVal": 0, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.byteVal).assertEqual(127);
      }
    });

    /**
     * @tc.name builtinsJsonTest0027
     * @tc.number BUILTINS_JSON_TEST_0027
     * @tc.desc Test parse Byte type negative boundary
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": -128, "shortVal": 0, "intVal": 0, "longVal": 0, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.byteVal).assertEqual(-128);
      }
    });

    /**
     * @tc.name builtinsJsonTest0028
     * @tc.number BUILTINS_JSON_TEST_0028
     * @tc.desc Test parse Short type range
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 32767, "intVal": 0, "longVal": 0, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.shortVal).assertEqual(32767);
      }
    });

    /**
     * @tc.name builtinsJsonTest0029
     * @tc.number BUILTINS_JSON_TEST_0029
     * @tc.desc Test parse Short type negative boundary
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": -32768, "intVal": 0, "longVal": 0, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.shortVal).assertEqual(-32768);
      }
    });

    /**
     * @tc.name builtinsJsonTest0030
     * @tc.number BUILTINS_JSON_TEST_0030
     * @tc.desc Test parse Int type boundary
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 2147483647, "longVal": 0, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.intVal).assertEqual(2147483647);
      }
    });

    /**
     * @tc.name builtinsJsonTest0031
     * @tc.number BUILTINS_JSON_TEST_0031
     * @tc.desc Test parse Long type boundary
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": 9223372036854775807, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.longVal).assertEqual(9223372036854775807);
      }
    });

    /**
     * @tc.name builtinsJsonTest0032
     * @tc.number BUILTINS_JSON_TEST_0032
     * @tc.desc Test parse Float type
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": 0, "floatVal": 3.14, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(Math.abs(result.floatVal - 3.14) < 0.0001).assertTrue();
      }
    });

    /**
     * @tc.name builtinsJsonTest0033
     * @tc.number BUILTINS_JSON_TEST_0033
     * @tc.desc Test parse Double type precision
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": 0, "floatVal": 0, "doubleVal": 123.456789}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.doubleVal).assertEqual(123.456789);
      }
    });

    /**
     * @tc.name builtinsJsonTest0034
     * @tc.number BUILTINS_JSON_TEST_0034
     * @tc.desc Test parse String with newline escape
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "\\n"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("\n");
      }
    });

    /**
     * @tc.name builtinsJsonTest0035
     * @tc.number BUILTINS_JSON_TEST_0035
     * @tc.desc Test parse String with tab escape
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "\\t"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("\t");
      }
    });

    /**
     * @tc.name builtinsJsonTest0036
     * @tc.number BUILTINS_JSON_TEST_0036
     * @tc.desc Test parse String with carriage return escape
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "\\r"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("\r");
      }
    });

    /**
     * @tc.name builtinsJsonTest0037
     * @tc.number BUILTINS_JSON_TEST_0037
     * @tc.desc Test parse String with backspace escape
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "\\b"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("\b");
      }
    });

    /**
     * @tc.name builtinsJsonTest0038
     * @tc.number BUILTINS_JSON_TEST_0038
     * @tc.desc Test parse String with form feed escape
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "\\f"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("\f");
      }
    });

    /**
     * @tc.name builtinsJsonTest0039
     * @tc.number BUILTINS_JSON_TEST_0039
     * @tc.desc Test parse Max Safe Integer
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": 9007199254740991, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.longVal).assertEqual(9007199254740991);
      }
    });

    /**
     * @tc.name builtinsJsonTest0040
     * @tc.number BUILTINS_JSON_TEST_0040
     * @tc.desc Test parse Min Safe Integer
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": -9007199254740991, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.longVal).assertEqual(-9007199254740991);
      }
    });

    /**
     * @tc.name builtinsJsonTest0041
     * @tc.number BUILTINS_JSON_TEST_0041
     * @tc.desc Test parse numeric negative zero float
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": 0, "floatVal": -0.0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(1 / result.floatVal).assertEqual(-Infinity);
      }
    });

    /**
     * @tc.name builtinsJsonTest0042
     * @tc.number BUILTINS_JSON_TEST_0042
     * @tc.desc Test parse object with undefined value in JSON
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": undefined, "value": 0}';
      try {
        JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
        expect(false).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.name builtinsJsonTest0043
     * @tc.number BUILTINS_JSON_TEST_0043
     * @tc.desc Test parse object with null value for string field
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": null, "value": 0}';
      try {
        const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      } catch (e) {
      }
    });

    /**
     * @tc.name builtinsJsonTest0044
     * @tc.number BUILTINS_JSON_TEST_0044
     * @tc.desc Test JSON.parse with simple valid object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "ArkTS", "year": 0, "value": 123}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("ArkTS");
        expect(result.value).assertEqual(123);
      }
    });

    /**
     * @tc.name builtinsJsonTest0045
     * @tc.number BUILTINS_JSON_TEST_0045
     * @tc.desc Test JSON.parse with whitespace padding
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = ' \n\t {"name": " Space ", "year": 0, "value": 999} \n ';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual(" Space ");
        expect(result.value).assertEqual(999);
      }
    });

    /**
     * @tc.name builtinsJsonTest0046
     * @tc.number BUILTINS_JSON_TEST_0046
     * @tc.desc Test NumericObj with zero values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": 0, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.byteVal).assertEqual(0);
        expect(result.shortVal).assertEqual(0);
        expect(result.intVal).assertEqual(0);
        expect(result.longVal).assertEqual(0);
        expect(result.floatVal).assertEqual(0);
        expect(result.doubleVal).assertEqual(0);
      }
    });

    /**
     * @tc.name builtinsJsonTest0047
     * @tc.number BUILTINS_JSON_TEST_0047
     * @tc.desc Test NumericObj with negative boundary values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": -128, "shortVal": -32768, "intVal": -2147483648, "longVal": -9223372036854775808, "floatVal": -1.5, "doubleVal": -0.1}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.byteVal).assertEqual(-128);
        expect(result.shortVal).assertEqual(-32768);
        expect(result.intVal).assertEqual(-2147483648);
        expect(result.floatVal).assertEqual(-1.5);
      }
    });

    /**
     * @tc.name builtinsJsonTest0048
     * @tc.number BUILTINS_JSON_TEST_0048
     * @tc.desc Test NumericObj with floating point precision
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": 0, "floatVal": 0.123456, "doubleVal": 0.123456789012345}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(Math.abs(result.floatVal - 0.123456) < 0.00001).assertTrue();
        expect(Math.abs(result.doubleVal - 0.123456789012345) < 1e-15).assertTrue();
      }
    });

    /**
     * @tc.name builtinsJsonTest0049
     * @tc.number BUILTINS_JSON_TEST_0049
     * @tc.desc Test BooleanObj with true
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"boolVal": true}';
      const result = JSON.parse<BooleanObj>(jsonStr, Class.from<BooleanObj>());
      if (result != null) {
        expect(result.boolVal).assertEqual(true);
      }
    });

    /**
     * @tc.name builtinsJsonTest0050
     * @tc.number BUILTINS_JSON_TEST_0050
     * @tc.desc Test BooleanObj with false
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"boolVal": false}';
      const result = JSON.parse<BooleanObj>(jsonStr, Class.from<BooleanObj>());
      if (result != null) {
        expect(result.boolVal).assertEqual(false);
      }
    });

    /**
     * @tc.name builtinsJsonTest0051
     * @tc.number BUILTINS_JSON_TEST_0051
     * @tc.desc Test SpecialCharObj with control characters
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "Line1\\nLine2\\tTabbed"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("Line1\nLine2\tTabbed");
      }
    });

    /**
     * @tc.name builtinsJsonTest0052
     * @tc.number BUILTINS_JSON_TEST_0052
     * @tc.desc Test SpecialCharObj with quote and backslash
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "\\"Quoted\\" \\\\ Backslash"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual('"Quoted" \\ Backslash');
      }
    });

    /**
     * @tc.name builtinsJsonTest0053
     * @tc.number BUILTINS_JSON_TEST_0053
     * @tc.desc Test NestedObj structure
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"id": 100, "detail": {"name": "DetailName", "value": 55}}';
      const result = JSON.parse<NestedObj>(jsonStr, Class.from<NestedObj>());
      if (result != null) {
        expect(result.id).assertEqual(100);
        expect(result.detail.name).assertEqual("DetailName");
        expect(result.detail.value).assertEqual(55);
      }
    });

    /**
     * @tc.name builtinsJsonTest0054
     * @tc.number BUILTINS_JSON_TEST_0054
     * @tc.desc Test success when JSON is missing a field (should use default values)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"value": 123}';
      let error = false;
      try {
        JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      } catch (e) {
        error = true;
      }
      expect(error).assertFalse();
    });

    /**
     * @tc.name builtinsJsonTest0055
     * @tc.number BUILTINS_JSON_TEST_0055
     * @tc.desc Test success when JSON has extra field (should be ignored)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "Extra", "year":0, "value": 1, "extraField": "ignoreMe"}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("Extra");
        expect(result.value).assertEqual(1);
      }
    });

    /**
     * @tc.name builtinsJsonTest0056
     * @tc.number BUILTINS_JSON_TEST_0056
     * @tc.desc Test error when field type mismatches (String for Number)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "TypeFail", "value": "NotANumber"}';
      try {
        JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
        expect(false).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.name builtinsJsonTest0057
     * @tc.number BUILTINS_JSON_TEST_0057
     * @tc.desc Test empty object JSON for SimpleObj (should use default values)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{}';
      let error = false;
      try {
        JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      } catch (e) {
        error = true;
      }
      expect(error).assertFalse();
    });

    /**
     * @tc.name builtinsJsonTest0058
     * @tc.number BUILTINS_JSON_TEST_0058
     * @tc.desc Test valid object with empty strings and zero values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "", "year":0, "value": 0}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("");
        expect(result.value).assertEqual(0);
      }
    });

    /**
     * @tc.name builtinsJsonTest0059
     * @tc.number BUILTINS_JSON_TEST_0059
     * @tc.desc Test JSON.parse with simple valid object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "ArkTS", "year":0, "value": 123}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("ArkTS");
        expect(result.value).assertEqual(123);
      }
    });

    /**
     * @tc.name builtinsJsonTest0060
     * @tc.number BUILTINS_JSON_TEST_0060
     * @tc.desc Test JSON.parse with whitespace padding
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = ' \n\t {"name": " Space ", "year":0, "value": 999} \n ';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual(" Space ");
        expect(result.value).assertEqual(999);
      }
    });

    /**
     * @tc.name builtinsJsonTest0061
     * @tc.number BUILTINS_JSON_TEST_0061
     * @tc.desc Test NumericObj with zero values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": 0, "floatVal": 0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(result.byteVal).assertEqual(0);
        expect(result.shortVal).assertEqual(0);
        expect(result.intVal).assertEqual(0);
        expect(result.longVal).assertEqual(0);
        expect(result.floatVal).assertEqual(0);
        expect(result.doubleVal).assertEqual(0);
      }
    });

    /**
     * @tc.name builtinsJsonTest0062
     * @tc.number BUILTINS_JSON_TEST_0062
     * @tc.desc Test numeric negative zero float
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"byteVal": 0, "shortVal": 0, "intVal": 0, "longVal": 0, "floatVal": -0.0, "doubleVal": 0}';
      const result = JSON.parse<NumericObj>(jsonStr, Class.from<NumericObj>());
      if (result != null) {
        expect(1 / result.floatVal).assertEqual(-Infinity);
      }
    });

    /**
     * @tc.name builtinsJsonTest0063
     * @tc.number BUILTINS_JSON_TEST_0063
     * @tc.desc Test object with undefined value in JSON
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": undefined, "value": 0}';
      try {
        JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
        expect(false).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.name builtinsJsonTest0064
     * @tc.number BUILTINS_JSON_TEST_0064
     * @tc.desc Test object with null value for string field
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": null, "value": 0}';
      try {
        const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      } catch (e) {
      }
    });

    /**
     * @tc.name builtinsJsonTest0065
     * @tc.number BUILTINS_JSON_TEST_0065
     * @tc.desc Test JSON.parse nested object without reviver
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"id": 1, "detail": {"name": "Nested", "value": 10}}';
      const result = JSON.parse<NestedObj>(jsonStr, Class.from<NestedObj>());
      if (result != null) {
        expect(result.detail.value).assertEqual(10);
      }
    });

    /**
     * @tc.name builtinsJsonTest0066
     * @tc.number BUILTINS_JSON_TEST_0066
     * @tc.desc Test SpecialCharObj with control characters
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "Line1\\nLine2\\tTabbed"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("Line1\nLine2\tTabbed");
      }
    });

    /**
     * @tc.name builtinsJsonTest0067
     * @tc.number BUILTINS_JSON_TEST_0067
     * @tc.desc Test SpecialCharObj with quote and backslash
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "\\"Quoted\\" \\\\ Backslash"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual('"Quoted" \\ Backslash');
      }
    });

    /**
     * @tc.name builtinsJsonTest0068
     * @tc.number BUILTINS_JSON_TEST_0068
     * @tc.desc Test SpecialCharObj with literal characters (replacing unsupported unicode escape)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"content": "Hi"}';
      const result = JSON.parse<SpecialCharObj>(jsonStr, Class.from<SpecialCharObj>());
      if (result != null) {
        expect(result.content).assertEqual("Hi");
      }
    });

    /**
     * @tc.name builtinsJsonTest0069
     * @tc.number BUILTINS_JSON_TEST_0069
     * @tc.desc Test NestedObj structure
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"id": 100, "detail": {"name": "DetailName", "value": 55}}';
      const result = JSON.parse<NestedObj>(jsonStr, Class.from<NestedObj>());
      if (result != null) {
        expect(result.id).assertEqual(100);
        expect(result.detail.name).assertEqual("DetailName");
        expect(result.detail.value).assertEqual(55);
      }
    });

    /**
     * @tc.name builtinsJsonTest0070
     * @tc.number BUILTINS_JSON_TEST_0070
     * @tc.desc Test success when JSON is missing a field (should use default values)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"value": 123}';
      let error = false;
      try {
        JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      } catch (e) {
        error = true;
      }
      expect(error).assertFalse();
    });

    /**
     * @tc.name builtinsJsonTest0071
     * @tc.number BUILTINS_JSON_TEST_0071
     * @tc.desc Test JSON.parse simple object (modified from reviver test)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "ReviverTest", "year":0, "value": 10}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.value).assertEqual(10);
        expect(result.name).assertEqual("ReviverTest");
      }
    });

    /**
     * @tc.name builtinsJsonTest0072
     * @tc.number BUILTINS_JSON_TEST_0072
     * @tc.desc Test JSON.parse string case (modified from reviver test)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "lowercase", "year":0, "value": 1}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("lowercase");
      }
    });

    /**
     * @tc.name builtinsJsonTest0073
     * @tc.number BUILTINS_JSON_TEST_0073
     * @tc.desc Test JSON.parse nested object (modified from reviver test)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"id": 1, "detail": {"name": "Nested", "value": 5}}';
      const result = JSON.parse<NestedObj>(jsonStr, Class.from<NestedObj>());
      if (result != null) {
        expect(result.detail.value).assertEqual(5);
      }
    });

    /**
     * @tc.name builtinsJsonTest0074
     * @tc.number BUILTINS_JSON_TEST_0074
     * @tc.desc Test JSON.parse targeting BigInt field with default options (Should Fail)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"val": 12345}';
      try {
        JSON.parse<BigIntObj>(jsonStr, Class.from<BigIntObj>());
        expect(false).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.name builtinsJsonTest0075
     * @tc.number BUILTINS_JSON_TEST_0075
     * @tc.desc Test boolean parsing (modified from reviver test)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"boolVal": false}';
      const result = JSON.parse<BooleanObj>(jsonStr, Class.from<BooleanObj>());
      if (result != null) {
        expect(result.boolVal).assertEqual(false);
      }
    });

    /**
     * @tc.name builtinsJsonTest0076
     * @tc.number BUILTINS_JSON_TEST_0076
     * @tc.desc Test type mismatch failure
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"value": "NotANumber"}';
      try {
        JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
        expect(false).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.name builtinsJsonTest0077
     * @tc.number BUILTINS_JSON_TEST_0077
     * @tc.desc Test parse object string with literal 0 (modified from unicode escape)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "0", "year":0, "value": 0}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("0");
      }
    });

    /**
     * @tc.name builtinsJsonTest0078
     * @tc.number BUILTINS_JSON_TEST_0078
     * @tc.desc Test JSON.parse valid object final check
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const jsonStr = '{"name": "End", "year":0, "value": 999}';
      const result = JSON.parse<SimpleObj>(jsonStr, Class.from<SimpleObj>());
      if (result != null) {
        expect(result.name).assertEqual("End");
        expect(result.value).assertEqual(999);
      }
    });

    /**
     * @tc.name builtinsJsonTest0079
     * @tc.number BUILTINS_JSON_TEST_0079
     * @tc.desc Test JSON.stringify with basic string and integer
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data: SimpleObj = { name: "ArkTS", year: 2025, value: 0 };
      const result = JSON.stringify(data);
      expect(result.includes('"name":"ArkTS"')).assertTrue();
      expect(result.includes('"year":2025')).assertTrue();
    });

    /**
     * @tc.name builtinsJsonTest0080
     * @tc.number BUILTINS_JSON_TEST_0080
     * @tc.desc Test JSON.stringify with boolean values
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data: BoolObj = { isTrue: true, isFalse: false };
      const result = JSON.stringify(data);
      expect(result).assertEqual('{"isTrue":true,"isFalse":false}');
    });

    /**
     * @tc.name builtinsJsonTest0081
     * @tc.number BUILTINS_JSON_TEST_0081
     * @tc.desc Test JSON.stringify with null value
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data: NullObj = { val: null };
      const result = JSON.stringify(data);
      expect(result).assertEqual('{"val":null}');
    });

    /**
     * @tc.name builtinsJsonTest0082
     * @tc.number BUILTINS_JSON_TEST_0082
     * @tc.desc Test JSON.stringify with floating point numbers
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data: FloatObj = { pi: 3.14159 };
      const result = JSON.stringify(data);
      expect(result).assertEqual('{"pi":3.14159}');
    });

    /**
     * @tc.name builtinsJsonTest0083
     * @tc.number BUILTINS_JSON_TEST_0083
     * @tc.desc Test JSON.stringify with empty object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data: Object = {};
      const result = JSON.stringify(data);
      expect(result).assertEqual('{}');
    });

    /**
     * @tc.name builtinsJsonTest0084
     * @tc.number BUILTINS_JSON_TEST_0084
     * @tc.desc Test JSON.stringify with special characters in string
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data: StringObj = { msg: "Hello\nWorld" };
      const result = JSON.stringify(data);
      expect(result).assertEqual('{"msg":"Hello\\nWorld"}');
    });

    /**
     * @tc.name builtinsJsonTest0085
     * @tc.number BUILTINS_JSON_TEST_0085
     * @tc.desc Test JSON.stringify with Array inside Object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data: ArrayObj = { list: [1, 2, 3] };
      const result = JSON.stringify(data);
      expect(result).assertEqual('{"list":[1,2,3]}');
    });

    /**
     * @tc.name builtinsJsonTest0086
     * @tc.number BUILTINS_JSON_TEST_0086
     * @tc.desc Test JSON.stringify with nested Object
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data: NestedOuter = { out: { innerVal: "val" } };
      const result = JSON.stringify(data);
      expect(result).assertEqual('{"out":{"innerVal":"val"}}');
    });

    /**
     * @tc.name builtinsJsonTest0087
     * @tc.number BUILTINS_JSON_TEST_0087
     * @tc.desc Test JSON.stringify with undefined value (should be omitted)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data = new UndefinedTest();
      const result = JSON.stringify(data);
      expect(result).assertEqual('{"visible":1}');
    });

    /**
     * @tc.name builtinsJsonTest0088
     * @tc.number BUILTINS_JSON_TEST_0088
     * @tc.desc Test JSON.stringify with max safe integer
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data = new MaxIntObj();
      const result = JSON.stringify(data);
      expect(result).assertEqual(`{"max":${Number.MAX_SAFE_INTEGER}}`);
    });

    /**
     * @tc.name builtinsJsonTest0089
     * @tc.number BUILTINS_JSON_TEST_0089
     * @tc.desc Test JSON.stringify with value containing backslash
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const data: PathObj = { path: "C:\\Windows" };
      const result = JSON.stringify(data);
      expect(result).assertEqual('{"path":"C:\\\\Windows"}');
    });

    /**
     * @tc.name builtinsJsonTest0090
     * @tc.number BUILTINS_JSON_TEST_0090
     * @tc.desc Test stringifyAnyObj with primitive string
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = JSON.stringify("test");
      expect(result).assertEqual('"test"');
    });

    /**
     * @tc.name builtinsJsonTest0091
     * @tc.number BUILTINS_JSON_TEST_0091
     * @tc.desc Test stringifyAnyObj with primitive number
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = JSON.stringify(123);
      expect(result).assertEqual('123');
    });

    /**
     * @tc.name builtinsJsonTest0092
     * @tc.number BUILTINS_JSON_TEST_0092
     * @tc.desc Test stringifyAnyObj with boolean
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = JSON.stringify(true);
      expect(result).assertEqual('true');
    });

    /**
     * @tc.name builtinsJsonTest0093
     * @tc.number BUILTINS_JSON_TEST_0093
     * @tc.desc Test stringifyAnyObj with null
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = JSON.stringify(null);
      expect(result).assertEqual('null');
    });

    /**
     * @tc.name builtinsJsonTest0094
     * @tc.number BUILTINS_JSON_TEST_0094
     * @tc.desc Test stringify with null replacer
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let obj = new SimpleObj();
      obj.name = "Default";
      obj.value = 0;
      const result = JSON.stringify(obj as Object, null);
      expect(result).assertEqual('{"name":"Default","year":0,"value":0}');
    });

    /**
     * @tc.name builtinsJsonTest0095
     * @tc.number BUILTINS_JSON_TEST_0095
     * @tc.desc Test stringify with undefined replacer
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let obj = new SimpleObj();
      obj.name = "UndefinedReplacer";
      obj.value = 123;
      const result = JSON.stringify(obj as Object, undefined);
      expect(result).assertEqual('{"name":"UndefinedReplacer","year":0,"value":123}');
    });

    /**
     * @tc.name builtinsJsonTest0096
     * @tc.number BUILTINS_JSON_TEST_0096
     * @tc.desc Test stringify with space argument as number (2)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let obj = new SimpleObj();
      obj.name = "A";
      obj.value = 1;
      const result = JSON.stringify(obj as Object, null, 2);
      const expected = '{\n  "name": "A",\n  "year": 0,\n  "value": 1\n}';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name builtinsJsonTest0097
     * @tc.number BUILTINS_JSON_TEST_0097
     * @tc.desc Test stringify with space argument as number (4)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let obj = new BooleanObj();
      obj.boolVal = true;

      const result = JSON.stringify(obj, null, 4);
      const expected = '{\n    "boolVal": true\n}';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name builtinsJsonTest0098
     * @tc.number BUILTINS_JSON_TEST_0098
     * @tc.desc Test stringify with space argument as string (tab)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let obj = new SimpleObj();
      obj.name = "Tab";
      obj.value = 0;
      const result = JSON.stringify(obj as Object, null, "\t");
      const expected = '{\n\t"name": "Tab",\n\t"year": 0,\n\t"value": 0\n}';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name builtinsJsonTest0099
     * @tc.number BUILTINS_JSON_TEST_0099
     * @tc.desc Test stringify with space number larger than 10 (should cap at 10)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let obj = new SimpleObj();
      obj.value = 1;

      const result = JSON.stringify(obj, null, 15);
      const space10 = "          ";
      expect(result.includes('\n' + space10 + '"name"')).assertTrue();
      const space11 = "           ";
      expect(result.includes('\n' + space11 + '"name"')).assertFalse();
    });

    /**
     * @tc.name builtinsJsonTest0100
     * @tc.number BUILTINS_JSON_TEST_0100
     * @tc.desc Test stringify with space 0 (compact)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let obj = new SimpleObj();
      obj.name = "Compact";
      obj.value = 1;
      const result = JSON.stringify(obj as Object, null, 0);
      expect(result).assertEqual('{"name":"Compact","year":0,"value":1}');
    });

    /**
     * @tc.name builtinsJsonTest0101
     * @tc.number BUILTINS_JSON_TEST_0101
     * @tc.desc Test stringify with empty string space (compact)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let obj = new SimpleObj();
      obj.name = "CompactStr";
      obj.value = 1;
      const result = JSON.stringify(obj as Object, null, "");
      expect(result).assertEqual('{"name":"CompactStr","year":0,"value":1}');
    });

    /**
     * @tc.name builtinsJsonTest0102
     * @tc.number BUILTINS_JSON_TEST_0102
     * @tc.desc Test stringifyJsonElement with JsonNull
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elem: jsonx.JsonElement = jsonx.JsonElement.createNull();
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('null');
    });

    /**
     * @tc.name builtinsJsonTest0103
     * @tc.number BUILTINS_JSON_TEST_0103
     * @tc.desc Test stringifyJsonElement with JsonUndefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elem: jsonx.JsonElement = jsonx.JsonElement.createUndefined();
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('undefined');
    });

    /**
     * @tc.name builtinsJsonTest0104
     * @tc.number BUILTINS_JSON_TEST_0104
     * @tc.desc Test stringifyJsonElement with JsonTrue
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elem: jsonx.JsonElement = jsonx.JsonElement.createBoolean(true);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('true');
    });

    /**
     * @tc.name builtinsJsonTest0105
     * @tc.number BUILTINS_JSON_TEST_0105
     * @tc.desc Test stringifyJsonElement with JsonFalse
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elem: jsonx.JsonElement = jsonx.JsonElement.createBoolean(false);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('false');
    });

    /**
     * @tc.name builtinsJsonTest0106
     * @tc.number BUILTINS_JSON_TEST_0106
     * @tc.desc Test stringifyJsonElement with empty string
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const elem: jsonx.JsonElement = jsonx.JsonElement.createString('');
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('""');
    });

    /**
     * @tc.name builtinsJsonTest0107
     * @tc.number BUILTINS_JSON_TEST_0107
     * @tc.desc Test stringifyJsonElement with special characters string
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str: string = ' !"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      const elem: jsonx.JsonElement = jsonx.JsonElement.createString(str);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('" !\\"#$%&\'()*+,-./:;<=>?@[\\\\]^_`{|}~"');
    });

    /**
     * @tc.name builtinsJsonTest0108
     * @tc.number BUILTINS_JSON_TEST_0108
     * @tc.desc Test stringifyJsonElement with escape sequences
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('builtinsJsonTest0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str: string = '\\b\\f\\n\\r\\t\\\\\\"\\/';
      const elem: jsonx.JsonElement = jsonx.JsonElement.createString(str);
      const result: string = JSON.stringifyJsonElement(elem);

      expect(result).assertEqual('"\\\\b\\\\f\\\\n\\\\r\\\\t\\\\\\\\\\\\\\"\\\\/"');
    });
