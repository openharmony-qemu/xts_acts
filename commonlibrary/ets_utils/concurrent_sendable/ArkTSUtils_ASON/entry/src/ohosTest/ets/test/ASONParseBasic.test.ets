/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { ArkTSUtils, collections, lang } from '@kit.ArkTS';

interface Test11_Obj1 {
  id: number;
  active: boolean;
}

interface ArrWithObj {
  items: Test11_Obj1[];
}

interface ISendable {
  num: number;
  str: string;
  bool: boolean;
  nil: null;
}

@Sendable
class Test {
  name: string = '';
  value: number = 0;
}

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ASONParseBasicTest() {
  describe('ASONParseBasicTest', () => {
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
     * @tc.name   ASONTestClass001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0001
     * @tc.desc   ArkTS ASON parse BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ASONTestClass001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      let jsonText = '{"big":112233445566778898}';
      let obj = ArkTSUtils.ASON.parse(jsonText, undefined, options) as lang.ISendable;
      expect((obj as object)?.["big"]).assertEqual(112233445566778898n);
      done();
    })

    /**
     * @tc.name   ASONTestClass002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0002
     * @tc.desc   ArkTS ASON parse number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ASONTestClass002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let jsonText = '123';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      expect(obj).assertEqual(123);
      done();
    })

    /**
     * @tc.name   ASONTestClass003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0003
     * @tc.desc   ArkTS ASON parse number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ASONTestClass003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let jsonText = '{"number":123}';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      expect((obj as object)?.["number"]).assertEqual(123);
      done();
    })

    /**
     * @tc.name   ASONTestClass004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0004
     * @tc.desc   ArkTS ASON parse string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ASONTestClass004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let jsonText = '{"string":"testASON"}';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      expect((obj as object)?.["string"]).assertEqual("testASON");
      done();
    })

    /**
     * @tc.name   ASONTestClass005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0005
     * @tc.desc   ArkTS ASON parse string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ASONTestClass005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '"testASON"';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      expect(obj).assertEqual("testASON");
      done();
    })

    /**
     * @tc.name   ASONTestClass006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0006
     * @tc.desc   ArkTS ASON parse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ASONTestClass006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '[1,2,3]';
      let obj : collections.Array<number> = ArkTSUtils.ASON.parse(jsonText) as collections.Array<number>;
      expect(obj.at(1)).assertEqual(2);
      done();
    })

    /**
     * @tc.name   ASONTestClass007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0007
     * @tc.desc   ArkTS ASON parse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ASONTestClass007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{"arr":[1,3,5]}';
      let obj = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable;
      let arr : collections.Array<number> = (obj as object)?.["arr"];
      expect(arr.at(1)).assertEqual(3);
      done();
    })

    /**
     * @tc.name   ASONTestClass008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0008
     * @tc.desc   ArkTS ASON parse true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ASONTestClass008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = 'true';
      let obj = ArkTSUtils.ASON.parse(jsonText);
      expect(obj).assertEqual(true);
      done();
    })

    /**
     * @tc.name   ASONTestClass009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0009
     * @tc.desc   ArkTS ASON parse false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ASONTestClass009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = 'false';
      let obj = ArkTSUtils.ASON.parse(jsonText);
      expect(obj).assertEqual(false);
      done();
    })

    /**
     * @tc.name   ASONTestClass010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0010
     * @tc.desc   ArkTS ASON parse obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ASONTestClass010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{}';
      let obj = ArkTSUtils.ASON.parse(jsonText);
      expect(typeof obj).assertEqual("object");
      done();
    })

    /**
     * @tc.name   ASONTestClass011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0011
     * @tc.desc   ArkTS ASON parse obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ASONTestClass011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let jsonText = '{"123":"123"}';
      let obj = ArkTSUtils.ASON.parse(jsonText);
      expect((obj as object)?.["123"]).assertEqual("123");
      done();
    })

    /**
     * @tc.name   ASONTestClass012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0012
     * @tc.desc   ArkTS ASON parse Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ASONTestClass012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let jsonText = '{"big":112233445566778898}';
      let map = ArkTSUtils.ASON.parse(jsonText, undefined, options) as collections.Map<string,bigint>;
      expect(map.get("big")).assertEqual(112233445566778898n);
      done();
    })

    /**
     * @tc.name   ASONTestClass013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0013
     * @tc.desc   ArkTS ASON parse Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ASONTestClass013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let jsonText = '{}';
      let map = ArkTSUtils.ASON.parse(jsonText, undefined, options);
      expect(typeof map).assertEqual("object");
      done();
    })

    /**
     * @tc.name   ASONTestClass014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0014
     * @tc.desc   ArkTS ASON parse Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ASONTestClass014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      let jsonText = '{"feature":{"arr":[1,3,5]}}';
      let map : collections.Map<string,collections.Map<string,collections.Array<number>>>
          = ArkTSUtils.ASON.parse(jsonText, undefined, options) as collections.Map<string,collections.Map<string,collections.Array<number>>>;
      expect(typeof map.get("feature")).assertEqual("object");
      expect(map.get("feature")?.get("arr")?.at(1)).assertEqual(3);
      done();
    })

    /**
     * @tc.name   ASONTestClass015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0015
     * @tc.desc   ArkTS ASON parse Map Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ASONTestClass015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      try {
        let jsonText = '{';
        ArkTSUtils.ASON.parse(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual("Unexpected MAP Prop in JSON");
      }
      done();
    })

    /**
     * @tc.name   ASONTestClass016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0016
     * @tc.desc   ArkTS ASON parse obj Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ASONTestClass016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      try {
        let jsonText = '{';
        ArkTSUtils.ASON.parse(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual("Unexpected Object Prop in JSON");
      }
      done();
    })

    /**
     * @tc.name   ASONTestClass017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0017
     * @tc.desc   ArkTS ASON parse Map Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ASONTestClass017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
      }
      try {
        let jsonText = '{"error"}';
        ArkTSUtils.ASON.parse(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual("Unexpected MAP in JSON");
      }
      done();
    })

    /**
     * @tc.name   ASONTestClass018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0018
     * @tc.desc   ArkTS ASON parse obj Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ASONTestClass018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      try {
        let jsonText = '{"error"}';
        ArkTSUtils.ASON.parse(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertEqual("Unexpected Object in JSON");
      }
      done();
    })

    /**
     * @tc.name   ASONTestClass029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0019
     * @tc.desc   ArkTS ASON parse Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ASONTestClass029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      let jsonText = '{"feature":{"arr":[1,3,5]}}';
      let obj = ArkTSUtils.ASON.parse(jsonText, undefined, options) as lang.ISendable;
      let str = ArkTSUtils.ASON.stringify(obj);
      expect(str).assertEqual('{"feature":{"arr":[1,3,5]}}');
      done();
    })

    /**
     * @tc.name   asonParseNullUndefined004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0020
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
        let result = ArkTSUtils.ASON.parse(jsonText, undefined) as Test;
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0021
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
        let result = ArkTSUtils.ASON.parse(jsonText, undefined, undefined) as Test;
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0022
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
        let result = ArkTSUtils.ASON.parse(jsonText) as Test;
        expect(result.name).assertEqual("test");
        expect(result.value).assertEqual(42);
        expect(typeof result).assertEqual("object");

        // Test empty JSON object
        let emptyJsonText = '{}';
        let emptyResult = ArkTSUtils.ASON.parse(emptyJsonText);
        expect(JSON.stringify(emptyResult)).assertEqual("{}");
        expect(typeof emptyResult).assertEqual("object");

        // Test JSON array
        let arrayJsonText = '[1, 2, 3]';
        let arrayResult = ArkTSUtils.ASON.parse(arrayJsonText) as collections.Array<number>;
        expect(arrayResult.length).assertEqual(3);
        expect(arrayResult[0]).assertEqual(1);
        expect(arrayResult[1]).assertEqual(2);
        expect(arrayResult[2]).assertEqual(3);

        // Test null JSON text
        let nullJsonText = 'null';
        let nullResult = ArkTSUtils.ASON.parse(nullJsonText);
        expect(nullResult).assertEqual(null);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   asonParseEmptyString001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0023
     * @tc.desc   Test ASON.parse with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asonParseEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'asonParseEmptyString001';
      try {
        // Test with empty string parameter
        let result = ArkTSUtils.ASON.parse("");
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        // error code 401 expect(error.code).assertEqual(401);
      }
      done()
    })

    /**
     * @tc.name   asonParseEmptyString002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0024
     * @tc.desc   Test ASON.parse with empty string JSON object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asonParseEmptyString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'asonParseEmptyString002';
      try {
        // Test with empty JSON object string
        let result = ArkTSUtils.ASON.parse("{}");
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0025
     * @tc.desc   Test ASON.parse with empty string JSON array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asonParseEmptyString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'asonParseEmptyString003';
      try {
        // Test with empty JSON array string
        let result = ArkTSUtils.ASON.parse("[]") as collections.Array<number>;
        expect(result.length).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0026
     * @tc.name Ason1Test001
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "{}";
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable;
      expect(ArkTSUtils.ASON.stringify(result)).assertEqual('{}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0027
     * @tc.name Ason1Test002
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "true";
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable;
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0028
     * @tc.name Ason1Test003
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"typescript"';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual("typescript");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0029
     * @tc.name Ason1Test004
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "[10, 20, 30.5]";
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(ArkTSUtils.ASON.stringify(result)).assertEqual(ArkTSUtils.ASON.stringify([10, 20, 30.5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0030
     * @tc.name Ason1Test005
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "null";
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0031
     * @tc.name Ason1Test006
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
      const obj = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(ArkTSUtils.ASON.stringify(obj)).assertEqual('{"id":1,"info":{"name":"Alice","age":25}}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0032
     * @tc.name Ason1Test007
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface NegNumData {
        negInt: number;
        negFloat: number;
      }

      const jsonStr: string = '{"negInt": -100, "negFloat": -15.7}';
      const obj = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect((obj as object)?.["negInt"]).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0033
     * @tc.name Ason1Test008
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '{"a":1, "b":{"c":2, "d":{"e":3}}}';
      const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;
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

      expect(ArkTSUtils.ASON.stringify(keys)).assertEqual(ArkTSUtils.ASON.stringify(["a", "c", "e", "d", "b", ""]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0034
     * @tc.name Ason1Test009
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "[1, 2, 3, ]";
      let isSyntaxError: boolean = false;
      try {
        ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      } catch (error) {
        isSyntaxError = error instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0035
     * @tc.name Ason1Test010
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '{"key": "value", }';
      let isSyntaxError: boolean = false;
      try {
        ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      } catch (error) {
        isSyntaxError = error instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0036
     * @tc.name Ason1Test011
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"line1\\nline2"';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual("line1\nline2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0037
     * @tc.name Ason1Test012
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "[]";
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(ArkTSUtils.ASON.stringify(result)).assertEqual(ArkTSUtils.ASON.stringify([]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0038
     * @tc.name Ason1Test013
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "false";
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0039
     * @tc.name Ason1Test014
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface ChineseData {
        title: string;
        content: string;
      }

      const jsonStr: string = '{"title": "测试"}';
      const obj = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(ArkTSUtils.ASON.stringify(obj)).assertEqual('{"title":"测试"}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0040
     * @tc.name Ason1Test015
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "123";
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0041
     * @tc.name Ason1Test016
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface FloatData {
        price: number;
      }

      const jsonStr: string = '{"price": 99.99}';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result?.["price"]).assertEqual(99.99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0042
     * @tc.name Ason1Test019
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface SciData {
        value: number;
      }

      const jsonStr: string = '{"value": 1.8e4}';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result?.["value"]).assertEqual(18000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0043
     * @tc.name Ason1Test020
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[null, "a", "b"]';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result[0]).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0044
     * @tc.name Ason1Test021
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[-1, -3, -5]';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result[2]).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0045
     * @tc.name Ason1Test022
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '{key: "value"}';
      let isSyntaxError: boolean = false;
      try {
        ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0046
     * @tc.name Ason1Test023
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"He said \\"JSON\\""';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual('He said "JSON"');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0047
     * @tc.name Ason1Test024
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[Infinity]';
      let isSyntaxError: boolean = false;
      try {
        ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0048
     * @tc.name Ason1Test025
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface LongNum {
        num: number;
      }

      const jsonStr: string = '{"num": 9007199254740991}';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result?.["num"]).assertEqual(9007199254740991);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0049
     * @tc.name Ason1Test026
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '{"a": 1 "b": 2}';
      let isSyntaxError: boolean = false;
      try {
        ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0050
     * @tc.name Ason1Test027
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface NoReturn {
        x?: number;
        y: number;
      }

      const jsonStr: string = '{"x": 10, "y": 20}';
      const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

      const parsedObj = parsed as Record<string, number>;
      const result: NoReturn = {
        y: parsedObj["y"]
      };

      expect(result.x).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0051
     * @tc.name Ason1Test028
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface Key {
        key: String
      }

      const jsonStr: string = '[{}, {"key": "val"}]';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(Object.keys(result[0]).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0052
     * @tc.name Ason1Test029
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "123";
      const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

      const result: number = (parsed as number) + 77;

      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0053
     * @tc.name Ason1Test030
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface ArrWithObj {
        id: number;
        name: string;
      }

      const jsonStr: string = '[{"id": 1, "name": "A"}, {"id": 2, "name": "B"}]';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result[1].name).assertEqual("B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0054
     * @tc.name Ason1Test031
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[5, 10]';
      let isStrKey: boolean = true;

      const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0055
     * @tc.name Ason1Test032
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "{'key': 'value'}";
      let isSyntaxError: boolean = false;
      try {
        ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0056
     * @tc.name Ason1Test033
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface ObjToArr {
        data: (number | string)[];
      }

      interface VObj {
        id: number | string,
        name: number | string
      }

      const jsonStr: string = '{"data": {"id": 1, "name": "test"}}';
      const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

      const parsedObj = parsed as Record<string, Object>;
      const data = parsedObj["data"] as Record<string, number | string>;
      const dataArray: (number | string)[] = [data["id"], data["name"]];

      const result: ObjToArr = {
        data: dataArray
      };

      expect(result.data[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0057
     * @tc.name Ason1Test034
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"C:\\\\Program Files"';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual("C:\\Program Files");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0058
     * @tc.name Ason1Test035
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface ZeroVal {
        zero: number;
        negZero: number;
      }

      const jsonStr: string = '{"zero": 0, "negZero": -0}';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result?.["zero"]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0059
     * @tc.name Ason1Test036
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"col1\\tcol2\\tcol3"';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual("col1\tcol2\tcol3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0060
     * @tc.name Ason1Test037
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '{"a": {"b": 1}}';
      let lastKey: string = "";

      const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

      const parsedObj = parsed as Record<string, Object>;
      const a = parsedObj["a"] as Record<string, Object>;
      const keys = Object.keys(a);

      if (keys.length > 0) {
        lastKey = keys[keys.length - 1];
      }

      expect(lastKey).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0061
     * @tc.name Ason1Test038
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[-1.5, -2.5, -3.5]';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result[2]).assertEqual(-3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0062
     * @tc.name Ason1Test039
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface BoolToNum {
        success: number;
      }

      const jsonStr: string = '{"success": true}';
      const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

      const parsedObj = parsed as Record<string, Object>;
      const success = parsedObj["success"] as boolean;
      const successNum = success ? 1 : 0;

      const result: BoolToNum = {
        success: successNum
      };

      expect(result.success).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0063
     * @tc.name Ason1Test040
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface EmptyStr {
        str: string;
      }

      const jsonStr: string = '{"str": ""}';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result?.["str"]).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0064
     * @tc.name Ason1Test042
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
      const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0065
     * @tc.name Ason1Test043
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"\\u4F60\\u597D"';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual("你好");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0066
     * @tc.name Ason1Test044
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface InfStr {
        str: string;
      }

      const jsonStr: string = '{"str": "Infinity"}';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result?.["str"]).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0067
     * @tc.name Ason1Test045
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '{"key": "value"';
      let isSyntaxError: boolean = false;
      try {
        ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0068
     * @tc.name Ason1Test046
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[0, 0, 0]';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0069
     * @tc.name Ason1Test047
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"line1\\nline2\\nline3"';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual("line1\nline2\nline3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0070
     * @tc.name Ason1Test048
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface FuncStr {
        code: string;
      }

      const jsonStr: string = '{"code": "function() {}"}';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result?.["code"]).assertEqual("function() {}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0071
     * @tc.name Ason1Test049
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface ObjWithEmptyArr {
        list: never[];
      }

      const jsonStr: string = '{"list": []}';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result?.["list"].length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0072
     * @tc.name Ason1Test050
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface NullVal {
        data: null;
      }

      const jsonStr: string = '{"data": null}';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result?.["data"]).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0073
     * @tc.name Ason1Test051
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '{"a": 1, "b": 2, }'; // 对象末尾多余逗号
      let isSyntaxError: boolean = false;
      try {
        ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0074
     * @tc.name Ason1Test052
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"\\t\\n\\rtest"';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual("\t\n\rtest");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0075
     * @tc.name Ason1Test053
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '{key: "value", num: 123}';
      let isSyntaxError: boolean = false;
      try {
        ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0076
     * @tc.name Ason1Test054
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[[[1], [2]], [[3], [4]]]';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(((result[1] as number[][])[0] as number[])[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0077
     * @tc.name Ason1Test055
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"\\u263A\\u270C"';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual("☺✌");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0078
     * @tc.name Ason1Test056
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface NaNStr {
        str: string;
      }

      const jsonStr: string = '{"str": "NaN"}';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result?.["str"]).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0079
     * @tc.name Ason1Test057
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface B {}

      interface A {
        b: B
      }

      interface NestedEmptyObj {
        a: A
      }

      const jsonStr: string = '{"a": {"b": {}}}';
      const result: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

      const resultObj = result as Record<string, Object>;
      const a = resultObj["a"] as Record<string, Object>;
      const b = a["b"] as Record<string, Object>;

      expect(Object.keys(b).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0080
     * @tc.name Ason1Test058
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[1, 2, 3';
      let isSyntaxError: boolean = false;
      try {
        ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0081
     * @tc.name Ason1Test059
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[-0, 0, -0]';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result[0]).assertEqual(-0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0082
     * @tc.name Ason1Test060
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"line1\\rline2"';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual("line1\rline2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0083
     * @tc.name Ason1Test061
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '["function a(){}", "function b(){}"]';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result[1]).assertEqual("function b(){}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0084
     * @tc.name Ason1Test062
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[1, [], [2, 3]]';
      const result:object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect((result[1] as number[]).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0085
     * @tc.name Ason1Test063
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface A {
        b: null
      }

      interface NestedNull {
        a: A;
      }

      const jsonStr: string = '{"a": {"b": null}}';
      const result: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

      const resultObj = result as Record<string, Object>;
      const a = resultObj["a"] as Record<string, Object>;
      const b = a["b"];

      expect(b).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0086
     * @tc.name Ason1Test064
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '["a", "b", "c"]';
      let isAllStrIdx: boolean = true;

      const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0087
     * @tc.name Ason1Test065
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"\\u4E2D\\u6587\\u6D4B\\u8BD5"'; // 中文测试
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual("中文测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0088
     * @tc.name Ason1Test066
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"C:\\\\\\\\Users\\\\\\\\test"';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual(`C:\\\\Users\\\\test`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0089
     * @tc.name Ason1Test067
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"line1\\u000bline2"';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual("line1\vline2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0090
     * @tc.name Ason1Test068
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface RegexStr {
        pattern: string;
      }

      const jsonStr: string = '{"pattern": "/^[a-z]+$/"}';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result?.["pattern"]).assertEqual("/^[a-z]+$/");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0091
     * @tc.name Ason1Test069
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface A {
        b: never[]
      }

      interface ObjWithNestedEmptyArr {
        a: A;
      }

      const jsonStr: string = '{"a": {"b": []}}';
      const result: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

      const resultObj = result as Record<string, Object>;
      const a = resultObj["a"] as Record<string, never[]>;
      expect(a.b.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0092
     * @tc.name Ason1Test070
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[1, null, 3, null, 5]';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result[3]).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0093
     * @tc.name Ason1Test071
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"\\t\\u000b\\r\\ntest"';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual("\t\v\r\ntest");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0094
     * @tc.name Ason1Test072
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[1, 2, 3, 4, 5, 6]';
      const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

      const numbers = parsed as number[];
      const result = numbers.filter(num => num % 2 === 0);

      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0095
     * @tc.name Ason1Test073
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface CurrencyStr {
        amount: string;
      }

      const jsonStr: string = '{"amount": 1234.56}';
      const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

      const parsedObj = parsed as Record<string, Object>;
      const amount = parsedObj["amount"] as number;
      const formattedAmount = `$${amount.toFixed(2)}`;

      const result: CurrencyStr = {
        amount: formattedAmount
      };

      expect(result.amount).assertEqual("$1234.56");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0096
     * @tc.name Ason1Test074
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface LongChineseStr {
        content: string;
      }

      const longContent: string = "这是一段用于测试JSON解析的超长中文字符串，包含多个汉字和标点符号。";
      const jsonStr: string = `{"content": "${longContent}"}`;
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;

      expect(result?.["content"]).assertEqual(longContent);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0097
     * @tc.name Ason1Test075
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface Obj {
        default: string
      }

      interface EmptyObjAddProp {
        obj: Obj;
      }

      const jsonStr: string = '{"obj": {}}';
      const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0098
     * @tc.name Ason1Test076
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"He said: \'Hello!\'"';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual("He said: 'Hello!'");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0099
     * @tc.name Ason1Test077
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[3, 1, 2]';
      const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

      const numbers = parsed as number[];
      const result = numbers.sort((a, b) => a - b);

      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0100
     * @tc.name Ason1Test078
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '{user@id: "u123", price#tag: 99}';
      let isSyntaxError: boolean = false;
      try {
        ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      } catch (e) {
        isSyntaxError = e instanceof SyntaxError;
      }
      expect(isSyntaxError).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0101
     * @tc.name Ason1Test079
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[[[[[10], 20], 30], 40], 50]';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(((((result[0] as number[][][][])[0] as number[][][])[0] as number[][])[0] as number[])[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0102
     * @tc.name Ason1Test080
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"\\u2603\\u2600"';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual("☃☀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0103
     * @tc.name Ason1Test081
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '["NaN", "123", "456"]';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result[0]).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0104
     * @tc.name Ason1Test082
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '["-Infinity", "0", "Infinity"]';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result[0]).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0105
     * @tc.name Ason1Test083
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[[1, -0], [2, 3]]';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result[0][1]).assertEqual(-0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0106
     * @tc.name Ason1Test084
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"page1\\fpage2"';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual("page1\fpage2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0107
     * @tc.name Ason1Test085
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '[[], [1, []], [2, [3, []]]]';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result[1][1].length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0108
     * @tc.name Ason1Test086
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"\\u5E26\\u7B26\\u53F7\\u7684\\u5B57\\u7B26\\u4E32：!@#"';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual("带符号的字符串：!@#");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0109
     * @tc.name Ason1Test087
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"He said: \\"\\\\test\\""';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual('He said: "\\test"');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0110
     * @tc.name Ason1Test088
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"test"';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0111
     * @tc.name Ason1Test090
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"hello"';
      const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

      const result = (parsed as string).toUpperCase();

      expect(result).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0112
     * @tc.name Ason1Test091
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "[1,2,3]";
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0113
     * @tc.name Ason1Test092
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "3.14";
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0114
     * @tc.name Ason1Test093
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "3.14";
      const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

      const result = Math.floor(parsed as number);

      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0115
     * @tc.name Ason1Test094
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "-7";
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0116
     * @tc.name Ason1Test095
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"a\\nb"';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual("a\nb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0117
     * @tc.name Ason1Test096
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"a\\nb"';
      const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

      const result = (parsed as string).replace("\n", " ");

      expect(result).assertEqual("a b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0118
     * @tc.name Ason1Test097
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      interface Result {
        k: number
      }

      const jsonStr: string = '[{"k":1}]';
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result[0].k).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0119
     * @tc.name Ason1Test098
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "1e3";
      const result: object = ArkTSUtils.ASON.parse(jsonStr) as ISendable ;
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0120
     * @tc.name Ason1Test099
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = "1e3";
      const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

      const result = (parsed as number) + 500;

      expect(result).assertEqual(1500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_ASON_PARSE_BASIC_0121
     * @tc.name Ason1Test100
     * @tc.desc test Ason parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Ason1Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const jsonStr: string = '"中文"';
      const parsed: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;

      const result = `pre-${parsed as string}`;

      expect(result).assertEqual("pre-中文");
    });

  })
}