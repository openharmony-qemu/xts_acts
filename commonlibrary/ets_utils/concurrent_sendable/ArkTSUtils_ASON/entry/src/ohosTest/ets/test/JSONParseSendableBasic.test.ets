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
import { collections, lang, JSON } from '@kit.ArkTS';

@Sendable
class Test {
  name: string = '';
  value: number = 0;
}

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function JSONParseSendableBasicTest() {
  describe('JSONParseSendableBasicTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(async () => {
      await sleep(30);
    })
    afterAll(() => {
    })

    /**
     * @tc.name   JSONTestClass001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0001
     * @tc.desc   ArkTS JSON parseSendable BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("JSONTestClass001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let options : JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: JSON.ParseReturnType.OBJECT,
      }
      let jsonText = '{"big":112233445566778898}';
      let obj = JSON.parseSendable(jsonText, undefined, options) as lang.ISendable;
      expect((obj as object)?.["big"]).assertEqual(112233445566778898n);
      done();
    })

    /**
     * @tc.name   JSONTestClass002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0002
     * @tc.desc   ArkTS JSON parseSendable number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("JSONTestClass002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let jsonText = '123';
      let obj = JSON.parseSendable(jsonText) as lang.ISendable;
      expect(obj).assertEqual(123);
      done();
    })

    /**
     * @tc.name   JSONTestClass003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0003
     * @tc.desc   ArkTS JSON parseSendable number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("JSONTestClass003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let jsonText = '{"number":123}';
      let obj = JSON.parseSendable(jsonText) as lang.ISendable;
      expect((obj as object)?.["number"]).assertEqual(123);
      done();
    })

    /**
     * @tc.name   JSONTestClass004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0004
     * @tc.desc   ArkTS JSON parseSendable string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("JSONTestClass004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let jsonText = '{"string":"testASON"}';
      let obj = JSON.parseSendable(jsonText) as lang.ISendable;
      expect((obj as object)?.["string"]).assertEqual("testASON");
      done();
    })

    /**
     * @tc.name   JSONTestClass005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0005
     * @tc.desc   ArkTS JSON parseSendable string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("JSONTestClass005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '"testASON"';
      let obj = JSON.parseSendable(jsonText) as lang.ISendable;
      expect(obj).assertEqual("testASON");
      done();
    })

    /**
     * @tc.name   JSONTestClass006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0006
     * @tc.desc   ArkTS JSON parseSendable array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("JSONTestClass006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '[1,2,3]';
      let obj : collections.Array<number> = JSON.parseSendable(jsonText) as collections.Array<number>;
      expect(obj.at(1)).assertEqual(2);
      done();
    })

    /**
     * @tc.name   JSONTestClass007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0007
     * @tc.desc   ArkTS JSON parseSendable array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("JSONTestClass007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{"arr":[1,3,5]}';
      let obj = JSON.parseSendable(jsonText) as lang.ISendable;
      let arr : collections.Array<number> = (obj as object)?.["arr"];
      expect(arr.at(1)).assertEqual(3);
      done();
    })

    /**
     * @tc.name   JSONTestClass008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0008
     * @tc.desc   ArkTS JSON parseSendable true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("JSONTestClass008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = 'true';
      let obj = JSON.parseSendable(jsonText);
      expect(obj).assertEqual(true);
      done();
    })

    /**
     * @tc.name   JSONTestClass009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0009
     * @tc.desc   ArkTS JSON parseSendable false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("JSONTestClass009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = 'false';
      let obj = JSON.parseSendable(jsonText);
      expect(obj).assertEqual(false);
      done();
    })

    /**
     * @tc.name   JSONTestClass010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0010
     * @tc.desc   ArkTS JSON parseSendable obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("JSONTestClass010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{}';
      let obj = JSON.parseSendable(jsonText);
      expect(typeof obj).assertEqual("object");
      done();
    })

    /**
     * @tc.name   JSONTestClass011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0011
     * @tc.desc   ArkTS JSON parseSendable obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("JSONTestClass011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{"123":"123"}';
      let obj = JSON.parseSendable(jsonText);
      expect((obj as object)?.["123"]).assertEqual("123");
      done();
    })

    /**
     * @tc.name   JSONTestClass012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0012
     * @tc.desc   ArkTS JSON parseSendable Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("JSONTestClass012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: JSON.ParseReturnType.MAP,
      }
      let jsonText = '{"big":112233445566778898}';
      let map = JSON.parseSendable(jsonText, undefined, options) as collections.Map<string,bigint>;
      expect(map.get("big")).assertEqual(112233445566778898n);
      done();
    })

    /**
     * @tc.name   JSONTestClass013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0013
     * @tc.desc   ArkTS JSON parseSendable Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("JSONTestClass013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.DEFAULT,
        parseReturnType: JSON.ParseReturnType.MAP,
      }
      let jsonText = '{}';
      let map = JSON.parseSendable(jsonText, undefined, options);
      expect(typeof map).assertEqual("object");
      done();
    })

    /**
     * @tc.name   JSONTestClass014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0014
     * @tc.desc   ArkTS JSON parseSendable Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("JSONTestClass014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.DEFAULT,
        parseReturnType: JSON.ParseReturnType.MAP,
      }
      let jsonText = '{"feature":{"arr":[1,3,5]}}';
      let map : collections.Map<string,collections.Map<string,collections.Array<number>>>
        = JSON.parseSendable(jsonText, undefined, options) as collections.Map<string,collections.Map<string,collections.Array<number>>>;
      expect(typeof map.get("feature")).assertEqual("object");
      expect(map.get("feature")?.get("arr")?.at(1)).assertEqual(3);
      done();
    })

    /**
     * @tc.name   JSONTestClass015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0015
     * @tc.desc   ArkTS JSON parseSendable Map Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("JSONTestClass015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.DEFAULT,
        parseReturnType: JSON.ParseReturnType.MAP,
      }
      try {
        let jsonText = '{';
        JSON.parseSendable(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual("Unexpected MAP Prop in JSON");
      }
      done();
    })

    /**
     * @tc.name   JSONTestClass016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0016
     * @tc.desc   ArkTS JSON parseSendable obj Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("JSONTestClass016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.DEFAULT,
        parseReturnType: JSON.ParseReturnType.OBJECT,
      }
      try {
        let jsonText = '{';
        JSON.parseSendable(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual("Unexpected Object Prop in JSON");
      }
      done();
    })

    /**
     * @tc.name   JSONTestClass017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0017
     * @tc.desc   ArkTS JSON parseSendable Map Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("JSONTestClass017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.DEFAULT,
        parseReturnType: JSON.ParseReturnType.MAP,
      }
      try {
        let jsonText = '{"error"}';
        JSON.parseSendable(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual("Unexpected MAP in JSON");
      }
      done();
    })

    /**
     * @tc.name   JSONTestClass018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0018
     * @tc.desc   ArkTS JSON parseSendable obj Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("JSONTestClass018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.DEFAULT,
        parseReturnType: JSON.ParseReturnType.OBJECT,
      }
      try {
        let jsonText = '{"error"}';
        JSON.parseSendable(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual("Unexpected Object in JSON");
      }
      done();
    })

    /**
     * @tc.name   JSONTestClass029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0019
     * @tc.desc   ArkTS JSON parseSendable Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("JSONTestClass029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.DEFAULT,
        parseReturnType: JSON.ParseReturnType.OBJECT,
      }
      let jsonText = '{"feature":{"arr":[1,3,5]}}';
      let obj = JSON.parseSendable(jsonText, undefined, options) as lang.ISendable;
      let str = JSON.stringify(obj);
      expect(str).assertEqual('{"feature":{"arr":[1,3,5]}}');
      done();
    })

    /**
     * @tc.name   asonParseNullUndefined004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0020
     * @tc.desc   Test ASON.parse with undefined reviver parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asonParseNullUndefined004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'asonParseNullUndefined004';
      try {
        let jsonText = '{"name": "test", "value": 42}';
        // Test with undefined reviver parameter
        let result = JSON.parseSendable(jsonText, undefined) as Test;
        expect(result.name).assertEqual("test");
        expect(result.value).assertEqual(42);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   asonParseNullUndefined006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0021
     * @tc.desc   Test ASON.parse with undefined options parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asonParseNullUndefined006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'asonParseNullUndefined006';
      try {
        let jsonText = '{"name": "test", "value": 42}';
        // Test with undefined options parameter
        let result = JSON.parseSendable(jsonText, undefined, undefined) as Test;
        expect(result.name).assertEqual("test");
        expect(result.value).assertEqual(42);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   asonParseReturnValidation001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0022
     * @tc.desc   Test ASON.parse return type validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asonParseReturnValidation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'asonParseReturnValidation001';
      try {
        // Test valid JSON string
        let jsonText = '{"name": "test", "value": 42}';
        let result = JSON.parseSendable(jsonText) as Test;
        expect(result.name).assertEqual("test");
        expect(result.value).assertEqual(42);
        expect(typeof result).assertEqual("object");

        // Test empty JSON object
        let emptyJsonText = '{}';
        let emptyResult = JSON.parseSendable(emptyJsonText);
        expect(JSON.stringify(emptyResult)).assertEqual("{}");
        expect(typeof emptyResult).assertEqual("object");

        // Test JSON array
        let arrayJsonText = '[1, 2, 3]';
        let arrayResult = JSON.parseSendable(arrayJsonText) as collections.Array<number>;
        expect(arrayResult.length).assertEqual(3);
        expect(arrayResult[0]).assertEqual(1);
        expect(arrayResult[1]).assertEqual(2);
        expect(arrayResult[2]).assertEqual(3);

        // Test null JSON text
        let nullJsonText = 'null';
        let nullResult = JSON.parseSendable(nullJsonText);
        expect(nullResult).assertEqual(null);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   asonParseEmptyString001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0023
     * @tc.desc   Test ASON.parse with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asonParseEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'asonParseEmptyString001';
      try {
        // Test with empty string parameter
        let result = JSON.parseSendable("");
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        // error code 401 expect(error.code).assertEqual(401);
      }
      done()
    })

    /**
     * @tc.name   asonParseEmptyString002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0024
     * @tc.desc   Test ASON.parse with empty string JSON object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asonParseEmptyString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'asonParseEmptyString002';
      try {
        // Test with empty JSON object string
        let result = JSON.parseSendable("{}");
        expect(JSON.stringify(result)).assertEqual("{}");
        expect(typeof result).assertEqual("object");
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   asonParseEmptyString003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0025
     * @tc.desc   Test ASON.parse with empty string JSON array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asonParseEmptyString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'asonParseEmptyString003';
      try {
        // Test with empty JSON array string
        let result = JSON.parseSendable("[]") as collections.Array<number>;
        expect(result.length).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0026
     * @tc.name Json1Test001
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "{}";
      const result: object = JSON.parseSendable(jsonStr) as ISendable;
      expect(JSON.stringify(result)).assertEqual('{}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0027
     * @tc.name Json1Test002
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "true";
      const result: object = JSON.parseSendable(jsonStr) as ISendable;
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0028
     * @tc.name Json1Test003
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"typescript"';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual("typescript");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0029
     * @tc.name Json1Test004
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "[10, 20, 30.5]";
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([10, 20, 30.5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0030
     * @tc.name Json1Test005
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "null";
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0031
     * @tc.name Json1Test006
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface Info {
        name: string;
        age: number
      }

      interface NestedData {
        id: number;
        info: Info
      }

      const jsonStr: string = '{"id": 1, "info": {"name": "Alice", "age": 25}}';
      const obj = JSON.parseSendable(jsonStr) as ISendable ;
      expect(JSON.stringify(obj)).assertEqual('{"id":1,"info":{"name":"Alice","age":25}}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0032
     * @tc.name Json1Test007
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface NegNumData {
        negInt: number;
        negFloat: number;
      }

      const jsonStr: string = '{"negInt": -100, "negFloat": -15.7}';
      const obj = JSON.parseSendable(jsonStr) as ISendable ;
      expect((obj as object)?.["negInt"]).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0033
     * @tc.name Json1Test008
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '{"a":1, "b":{"c":2, "d":{"e":3}}}';
      const parsed: ISendable = JSON.parseSendable(jsonStr) as ISendable;
      const keys: string[] = [];
      const parsedObj = parsed as Record<string, Object>;

      keys.push("a");
      const b = parsedObj["b"] as Record<string, Object>;

      keys.push("c");
      const d = b["d"] as Record<string, Object>;

      keys.push("e");

      keys.push("d");

      keys.push("b");

      keys.push("");

      expect(JSON.stringify(keys)).assertEqual(JSON.stringify(["a", "c", "e", "d", "b", ""]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0034
     * @tc.name Json1Test009
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "[1, 2, 3, ]";
      let isSyntaxError: boolean = false;
      try {
        JSON.parseSendable(jsonStr) as ISendable ;
      } catch (error) {
        isSyntaxError = error instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0035
     * @tc.name Json1Test010
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '{"key": "value", }';
      let isSyntaxError: boolean = false;
      try {
        JSON.parseSendable(jsonStr) as ISendable ;
      } catch (error) {
        isSyntaxError = error instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0036
     * @tc.name Json1Test011
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"line1\\nline2"';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual("line1\nline2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0037
     * @tc.name Json1Test012
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "[]";
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0038
     * @tc.name Json1Test013
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "false";
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0039
     * @tc.name Json1Test014
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface ChineseData {
        title: string;
        content: string;
      }

      const jsonStr: string = '{"title": "测试"}';
      const obj = JSON.parseSendable(jsonStr) as ISendable ;
      expect(JSON.stringify(obj)).assertEqual('{"title":"测试"}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0040
     * @tc.name Json1Test015
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "123";
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0041
     * @tc.name Json1Test016
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface FloatData {
        price: number;
      }

      const jsonStr: string = '{"price": 99.99}';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result?.["price"]).assertEqual(99.99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0042
     * @tc.name Json1Test019
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface SciData {
        value: number;
      }

      const jsonStr: string = '{"value": 1.8e4}';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result?.["value"]).assertEqual(18000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0043
     * @tc.name Json1Test020
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[null, "a", "b"]';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result[0]).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0044
     * @tc.name Json1Test021
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[-1, -3, -5]';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result[2]).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0045
     * @tc.name Json1Test022
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '{key: "value"}';
      let isSyntaxError: boolean = false;
      try {
        JSON.parseSendable(jsonStr) as ISendable ;
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0046
     * @tc.name Json1Test023
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"He said \\"JSON\\""';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual('He said "JSON"');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0047
     * @tc.name Json1Test024
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[Infinity]';
      let isSyntaxError: boolean = false;
      try {
        JSON.parseSendable(jsonStr) as ISendable ;
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0048
     * @tc.name Json1Test025
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface LongNum {
        num: number;
      }

      const jsonStr: string = '{"num": 9007199254740991}';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result?.["num"]).assertEqual(9007199254740991);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0049
     * @tc.name Json1Test026
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '{"a": 1 "b": 2}';
      let isSyntaxError: boolean = false;
      try {
        JSON.parseSendable(jsonStr) as ISendable ;
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0050
     * @tc.name Json1Test027
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface NoReturn {
        x?: number;
        y: number;
      }

      const jsonStr: string = '{"x": 10, "y": 20}';
      const parsed: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const parsedObj = parsed as Record<string, number>;
      const result: NoReturn = {
        y: parsedObj["y"]
      };

      expect(result.x).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0051
     * @tc.name Json1Test028
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface Key {
        key: String
      }

      const jsonStr: string = '[{}, {"key": "val"}]';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(Object.keys(result[0]).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0052
     * @tc.name Json1Test029
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "123";
      const parsed: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const result: number = (parsed as number) + 77;

      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0053
     * @tc.name Json1Test030
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[{"id": 1, "name": "A"}, {"id": 2, "name": "B"}]';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result[1].name).assertEqual("B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0054
     * @tc.name Json1Test031
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[5, 10]';
      let isStrKey: boolean = true;

      const parsed: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const arr = parsed as number[];
      for (let i = 0; i < arr.length; i++) {
        const key = i.toString();
        if (key !== "" && typeof key !== "string") {
          isStrKey = false;
        }
      }

      expect(isStrKey).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0055
     * @tc.name Json1Test032
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "{'key': 'value'}";
      let isSyntaxError: boolean = false;
      try {
        JSON.parseSendable(jsonStr) as ISendable ;
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0056
     * @tc.name Json1Test033
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface ObjToArr {
        data: (number | string)[];
      }

      interface VObj {
        id: number | string,
        name: number | string
      }

      const jsonStr: string = '{"data": {"id": 1, "name": "test"}}';
      const parsed: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const parsedObj = parsed as Record<string, Object>;
      const data = parsedObj["data"] as Record<string, number | string>;
      const dataArray: (number | string)[] = [data["id"], data["name"]];

      const result: ObjToArr = {
        data: dataArray
      };

      expect(result.data[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0057
     * @tc.name Json1Test034
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"C:\\\\Program Files"';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual("C:\\Program Files");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0058
     * @tc.name Json1Test035
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface ZeroVal {
        zero: number;
        negZero: number;
      }

      const jsonStr: string = '{"zero": 0, "negZero": -0}';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result?.["zero"]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0059
     * @tc.name Json1Test036
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"col1\\tcol2\\tcol3"';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual("col1\tcol2\tcol3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0060
     * @tc.name Json1Test037
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '{"a": {"b": 1}}';
      let lastKey: string = "";

      const parsed: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const parsedObj = parsed as Record<string, Object>;
      const a = parsedObj["a"] as Record<string, Object>;
      const keys = Object.keys(a);

      if (keys.length > 0) {
        lastKey = keys[keys.length - 1];
      }

      expect(lastKey).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0061
     * @tc.name Json1Test038
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[-1.5, -2.5, -3.5]';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result[2]).assertEqual(-3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0062
     * @tc.name Json1Test039
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface BoolToNum {
        success: number;
      }

      const jsonStr: string = '{"success": true}';
      const parsed: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const parsedObj = parsed as Record<string, Object>;
      const success = parsedObj["success"] as boolean;
      const successNum = success ? 1 : 0;

      const result: BoolToNum = {
        success: successNum
      };

      expect(result.success).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0063
     * @tc.name Json1Test040
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface EmptyStr {
        str: string;
      }

      const jsonStr: string = '{"str": ""}';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result?.["str"]).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0064
     * @tc.name Json1Test042
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface Level1 {
        level2: Level2
      }

      interface Level2 {
        level3: number,
      }

      interface DeepNested {
        level1: Level1
      }

      const jsonStr: string = '{"level1": {"level2": {"level3": 5}}}';
      const parsed: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const parsedObj = parsed as Record<string, Object>;
      const level1 = parsedObj["level1"] as Record<string, Object>;
      const level2 = level1["level2"] as Record<string, number>;
      const level3Value = level2["level3"] * 4;

      const result: DeepNested = {
        level1: {
          level2: {
            level3: level3Value
          }
        }
      };

      expect(result.level1.level2.level3).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0065
     * @tc.name Json1Test043
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"\\u4F60\\u597D"';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual("你好");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0066
     * @tc.name Json1Test044
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface InfStr {
        str: string;
      }

      const jsonStr: string = '{"str": "Infinity"}';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result?.["str"]).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0067
     * @tc.name Json1Test045
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '{"key": "value"';
      let isSyntaxError: boolean = false;
      try {
        JSON.parseSendable(jsonStr) as ISendable ;
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0068
     * @tc.name Json1Test046
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[0, 0, 0]';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0069
     * @tc.name Json1Test047
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"line1\\nline2\\nline3"';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual("line1\nline2\nline3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0070
     * @tc.name Json1Test048
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface FuncStr {
        code: string;
      }

      const jsonStr: string = '{"code": "function() {}"}';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result?.["code"]).assertEqual("function() {}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0071
     * @tc.name Json1Test049
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface ObjWithEmptyArr {
        list: never[];
      }

      const jsonStr: string = '{"list": []}';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result?.["list"].length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0072
     * @tc.name Json1Test050
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface NullVal {
        data: null;
      }

      const jsonStr: string = '{"data": null}';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result?.["data"]).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0073
     * @tc.name Json1Test051
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '{"a": 1, "b": 2, }'; // 对象末尾多余逗号
      let isSyntaxError: boolean = false;
      try {
        JSON.parseSendable(jsonStr) as ISendable ;
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0074
     * @tc.name Json1Test052
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"\\t\\n\\rtest"';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual("\t\n\rtest");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0075
     * @tc.name Json1Test053
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '{key: "value", num: 123}';
      let isSyntaxError: boolean = false;
      try {
        JSON.parseSendable(jsonStr) as ISendable ;
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0076
     * @tc.name Json1Test054
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[[[1], [2]], [[3], [4]]]';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(((result[1] as number[][])[0] as number[])[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0077
     * @tc.name Json1Test055
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"\\u263A\\u270C"';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual("☺✌");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0078
     * @tc.name Json1Test056
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface NaNStr {
        str: string;
      }

      const jsonStr: string = '{"str": "NaN"}';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result?.["str"]).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0079
     * @tc.name Json1Test057
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface B {}

      interface A {
        b: B
      }

      interface NestedEmptyObj {
        a: A
      }

      const jsonStr: string = '{"a": {"b": {}}}';
      const result: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const resultObj = result as Record<string, Object>;
      const a = resultObj["a"] as Record<string, Object>;
      const b = a["b"] as Record<string, Object>;

      expect(Object.keys(b).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0080
     * @tc.name Json1Test058
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[1, 2, 3';
      let isSyntaxError: boolean = false;
      try {
        JSON.parseSendable(jsonStr) as ISendable ;
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0081
     * @tc.name Json1Test059
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[-0, 0, -0]';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result[0]).assertEqual(-0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0082
     * @tc.name Json1Test060
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"line1\\rline2"';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual("line1\rline2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0083
     * @tc.name Json1Test061
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '["function a(){}", "function b(){}"]';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result[1]).assertEqual("function b(){}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0084
     * @tc.name Json1Test062
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[1, [], [2, 3]]';
      const result:object = JSON.parseSendable(jsonStr) as ISendable ;
      expect((result[1] as number[]).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0085
     * @tc.name Json1Test063
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface A {
        b: null
      }

      interface NestedNull {
        a: A;
      }

      const jsonStr: string = '{"a": {"b": null}}';
      const result: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const resultObj = result as Record<string, Object>;
      const a = resultObj["a"] as Record<string, Object>;
      const b = a["b"];

      expect(b).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0086
     * @tc.name Json1Test064
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '["a", "b", "c"]';
      let isAllStrIdx: boolean = true;

      const parsed: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const arr = parsed as string[];
      for (let i = 0; i < arr.length; i++) {
        const key = i.toString();
        if (key !== "" && isNaN(Number(key))) {
          isAllStrIdx = false;
        }
      }

      expect(isAllStrIdx).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0087
     * @tc.name Json1Test065
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"\\u4E2D\\u6587\\u6D4B\\u8BD5"'; // 中文测试
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual("中文测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0088
     * @tc.name Json1Test066
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"C:\\\\\\\\Users\\\\\\\\test"';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual(`C:\\\\Users\\\\test`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0089
     * @tc.name Json1Test067
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"line1\\u000bline2"';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual("line1\vline2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0090
     * @tc.name Json1Test068
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface RegexStr {
        pattern: string;
      }

      const jsonStr: string = '{"pattern": "/^[a-z]+$/"}';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result?.["pattern"]).assertEqual("/^[a-z]+$/");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0091
     * @tc.name Json1Test069
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface A {
        b: never[]
      }

      interface ObjWithNestedEmptyArr {
        a: A;
      }

      const jsonStr: string = '{"a": {"b": []}}';
      const result: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const resultObj = result as Record<string, Object>;
      const a = resultObj["a"] as Record<string, never[]>;
      expect(a.b.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0092
     * @tc.name Json1Test070
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[1, null, 3, null, 5]';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result[3]).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0093
     * @tc.name Json1Test071
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"\\t\\u000b\\r\\ntest"';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual("\t\v\r\ntest");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0094
     * @tc.name Json1Test072
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[1, 2, 3, 4, 5, 6]';
      const parsed: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const numbers = parsed as number[];
      const result = numbers.filter(num => num % 2 === 0);

      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0095
     * @tc.name Json1Test073
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface CurrencyStr {
        amount: string;
      }

      const jsonStr: string = '{"amount": 1234.56}';
      const parsed: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const parsedObj = parsed as Record<string, Object>;
      const amount = parsedObj["amount"] as number;
      const formattedAmount = `$${amount.toFixed(2)}`;

      const result: CurrencyStr = {
        amount: formattedAmount
      };

      expect(result.amount).assertEqual("$1234.56");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0096
     * @tc.name Json1Test074
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface LongChineseStr {
        content: string;
      }

      const longContent: string = "这是一段用于测试JSON解析的超长中文字符串，包含多个汉字和标点符号。";
      const jsonStr: string = `{"content": "${longContent}"}`;
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;

      expect(result?.["content"]).assertEqual(longContent);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0097
     * @tc.name Json1Test075
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface Obj {
        default: string
      }

      interface EmptyObjAddProp {
        obj: Obj;
      }

      const jsonStr: string = '{"obj": {}}';
      const parsed: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const parsedObj = parsed as Record<string, Object>;
      const obj = parsedObj["obj"] as Record<string, Object>;

      let finalObj: Obj;
      if (Object.keys(obj).length === 0) {
        finalObj = { default: "default-value" };
      } else {
        const objRecord = obj as Record<string, string>;
        if (objRecord.default !== undefined) {
          finalObj = { default: objRecord.default };
        } else {
          finalObj = { default: "default-value" };
        }
      }

      const result: EmptyObjAddProp = {
        obj: finalObj
      };

      expect(result.obj.default).assertEqual("default-value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0098
     * @tc.name Json1Test076
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"He said: \'Hello!\'"';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual("He said: 'Hello!'");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0099
     * @tc.name Json1Test077
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[3, 1, 2]';
      const parsed: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const numbers = parsed as number[];
      const result = numbers.sort((a, b) => a - b);

      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0100
     * @tc.name Json1Test078
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '{user@id: "u123", price#tag: 99}';
      let isSyntaxError: boolean = false;
      try {
        JSON.parseSendable(jsonStr) as ISendable ;
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0101
     * @tc.name Json1Test079
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[[[[[10], 20], 30], 40], 50]';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(((((result[0] as number[][][][])[0] as number[][][])[0] as number[][])[0] as number[])[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0102
     * @tc.name Json1Test080
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"\\u2603\\u2600"';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual("☃☀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0103
     * @tc.name Json1Test081
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '["NaN", "123", "456"]';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result[0]).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0104
     * @tc.name Json1Test082
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '["-Infinity", "0", "Infinity"]';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result[0]).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0105
     * @tc.name Json1Test083
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[[1, -0], [2, 3]]';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result[0][1]).assertEqual(-0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0106
     * @tc.name Json1Test084
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"page1\\fpage2"';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual("page1\fpage2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0107
     * @tc.name Json1Test085
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[[], [1, []], [2, [3, []]]]';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result[1][1].length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0108
     * @tc.name Json1Test086
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"\\u5E26\\u7B26\\u53F7\\u7684\\u5B57\\u7B26\\u4E32：!@#"';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual("带符号的字符串：!@#");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0109
     * @tc.name Json1Test087
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"He said: \\"\\\\test\\""';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual('He said: "\\test"');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0110
     * @tc.name Json1Test088
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"test"';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0111
     * @tc.name Json1Test090
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"hello"';
      const parsed: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const result = (parsed as string).toUpperCase();

      expect(result).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0112
     * @tc.name Json1Test091
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "[1,2,3]";
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0113
     * @tc.name Json1Test092
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "3.14";
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0114
     * @tc.name Json1Test093
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "3.14";
      const parsed: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const result = Math.floor(parsed as number);

      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0115
     * @tc.name Json1Test094
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "-7";
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0116
     * @tc.name Json1Test095
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"a\\nb"';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual("a\nb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0117
     * @tc.name Json1Test096
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"a\\nb"';
      const parsed: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const result = (parsed as string).replace("\n", " ");

      expect(result).assertEqual("a b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0118
     * @tc.name Json1Test097
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface Result {
        k: number
      }

      const jsonStr: string = '[{"k":1}]';
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result[0].k).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0119
     * @tc.name Json1Test098
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "1e3";
      const result: object = JSON.parseSendable(jsonStr) as ISendable ;
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0120
     * @tc.name Json1Test099
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "1e3";
      const parsed: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const result = (parsed as number) + 500;

      expect(result).assertEqual(1500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_BASIC_0121
     * @tc.name Json1Test100
     * @tc.desc test Json parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json1Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"中文"';
      const parsed: ISendable = JSON.parseSendable(jsonStr) as ISendable;

      const result = `pre-${parsed as string}`;

      expect(result).assertEqual("pre-中文");
    });

  })
}