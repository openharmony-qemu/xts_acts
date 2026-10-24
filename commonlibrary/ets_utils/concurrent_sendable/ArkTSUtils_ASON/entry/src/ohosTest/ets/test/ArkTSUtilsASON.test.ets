/**
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, lang, taskpool } from '@kit.ArkTS';
import { Sleep } from '../utils/utils';
import {
  exclusiveTask,
  exclusiveTimeTask,
  loadCase,
  lockExclusiveTask,
  locksTask,
  locksTimeTask,
  NumClass,
  SendableClass,
  sendableFunction,
  sharedTaskTime,
  sharedTimeTask
} from '../utils/arkTSUtilsCommon';


@Concurrent
function supAsonConsume001(obj: lang.ISendable): string {
  return (obj as object)?.['name'] as string;
}

@Concurrent
function supAsonMapConsume001(m: collections.Map<string, bigint>): bigint {
  m.set('x', 9n);
  return m.get('k') as bigint;
}

@Sendable
class SupAsonShared001 {
  map: collections.Map<string, string> = new collections.Map<string, string>();
}

@Concurrent
function supAsonWrite001(shared: SupAsonShared001, key: string, json: string): void {
  let obj = ArkTSUtils.ASON.parse(json) as lang.ISendable;
  shared.map.set(key, (obj as object)?.['v'] as string);
}
export default function arkTSUtilsASONTest() {
  describe('arkTSUtilsASONTest', () => {

    /**
     * @tc.name   testTransformer0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5400
     * @tc.desc   Test ASON.parse with PARSE_AS_BIGINT options (BigIntMode/ParseReturnType).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransformer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testTransformer0001";
      try {
        type ISendable = lang.ISendable;
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        }
        let numberText = '{"largeNumber":1}';
        let numberObj = ArkTSUtils.ASON.parse(numberText, undefined, options) as ISendable;
        expect((numberObj as object)?.["largeNumber"]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testBigIntModeOptions0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5500
     * @tc.desc   Test ASON.parse with BigIntMode/ParseReturnType options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBigIntModeOptions0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBigIntModeOptions0001";
      try {
        type ISendable = lang.ISendable;
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        }
        let numberText = '{"largeNumber":112233445566778899n}';
        let numberObj = ArkTSUtils.ASON.parse(numberText, undefined, options) as ISendable;
        console.info(`${TAG} result:` + (numberObj as object)?.["largeNumber"]);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
      done()
    })

    /**
     * @tc.name   testBigIntModeOptions0002
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5600
     * @tc.desc   Test ASON.parse with BigIntMode/ParseReturnType options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBigIntModeOptions0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBigIntModeOptions0002";
      try {
        type ISendable = lang.ISendable;
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        }
        let numberText = '{"largeNumber":9007199254740992}';
        let numberObj = ArkTSUtils.ASON.parse(numberText, undefined, options) as ISendable;
        console.info(`${TAG} result:` + typeof (numberObj as object)?.["largeNumber"]);
        expect(typeof (numberObj as object)?.["largeNumber"]).assertEqual(`bigint`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testBigIntModeOptions0003
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5700
     * @tc.desc   Test ASON.parse with BigIntMode/ParseReturnType options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBigIntModeOptions0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBigIntModeOptions0003";
      try {
        type ISendable = lang.ISendable;
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.ALWAYS_PARSE_AS_BIGINT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        }
        let numberText = '{"largeNumber":1}';
        let numberObj = ArkTSUtils.ASON.parse(numberText, undefined, options) as ISendable;
        console.info(`${TAG} result:` + typeof (numberObj as object)?.["largeNumber"]);
        expect(typeof (numberObj as object)?.["largeNumber"]).assertEqual(`bigint`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testBigIntModeOptions0004
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5800
     * @tc.desc   Test ASON.parse with BigIntMode/ParseReturnType options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBigIntModeOptions0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testBigIntModeOptions0004";
      try {
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        }
        let numberText = '{"largeNumber":1}';
        let numberObj = ArkTSUtils.ASON.parse(numberText, undefined, options);
        console.info(`${TAG} result:` + numberObj);
        expect(ArkTSUtils.isSendable(numberObj)).assertTrue();
        expect(typeof numberObj).assertEqual('object');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParse0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5900
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParse0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParse0001";
      try {
        type ISendable = lang.ISendable;
        let text = '';
        ArkTSUtils.ASON.parse(text) as ISendable;
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
      done()
    })

    /**
     * @tc.name   testParse0002
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6000
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParse0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParse0002";
      try {
        type ISendable = lang.ISendable;
        let text = '{"name" "John", "age": 30, "city": "ChongQing"}';
        ArkTSUtils.ASON.parse(text) as ISendable;
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
      done()
    })

    /**
     * @tc.name   testParse0003
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6100
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParse0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParse0003";
      try {
        type ISendable = lang.ISendable;
        let jsonText = '{"name": "John", "age": 30, "city": "ChongQing"}';
        const obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        expect((obj as object)?.["name"]).assertEqual("John");
        expect(ArkTSUtils.isSendable(obj)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParse0004
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6200
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParse0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParse0004";
      try {
        type ISendable = lang.ISendable;
        let jsonText = '{"name": "John", "age": 30, "city": "ChongQing"}';
        const obj = ArkTSUtils.ASON.parse(jsonText, undefined, undefined) as ISendable;
        expect((obj as object)?.["name"]).assertEqual("John");
        expect(ArkTSUtils.isSendable(obj)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParse0005
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6300
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParse0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParse0005";
      try {
        type ISendable = lang.ISendable;
        let jsonText = '{"name": "John", "age": 30, "bigInt": 1234567890123456789012345678901234567890}';
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        };
        const obj = ArkTSUtils.ASON.parse(jsonText, undefined, options) as ISendable;
        expect((obj as object)?.["bigInt"]).assertEqual(1.2345678901234568e+39);
        expect((obj as object)?.["age"]).assertEqual(30);
        expect(ArkTSUtils.isSendable(obj)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParse0006
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6400
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParse0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParse0006";
      try {
        type ISendable = lang.ISendable;
        let jsonText = '{"name": "John", "age": 30, "bigInt": 1234567890123456789012345678901234567890}';
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        }
        const obj = ArkTSUtils.ASON.parse(jsonText, undefined, options) as ISendable;
        expect((obj as object)?.["bigInt"]).assertEqual(1234567890123456789012345678901234567890n);
        expect((obj as object)?.["age"]).assertEqual(30);
        expect(ArkTSUtils.isSendable(obj)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParse0007
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6500
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParse0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParse0007";
      try {
        type ISendable = lang.ISendable;
        let jsonText = '{"name": "John", "age": 30, "bigInt": 1234567890123456789012345678901234567890}';
        let options: ArkTSUtils.ASON.ParseOptions = {
          bigIntMode: ArkTSUtils.ASON.BigIntMode.ALWAYS_PARSE_AS_BIGINT,
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
        }
        const obj = ArkTSUtils.ASON.parse(jsonText, undefined, options) as ISendable;
        expect((obj as object)?.["bigInt"]).assertEqual(1234567890123456789012345678901234567890n);
        expect((obj as object)?.["age"]).assertEqual(30n);
        expect(ArkTSUtils.isSendable(obj)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testStringify0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6600
     * @tc.desc   Test the function of the interface Stringify.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStringify0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0001";
      try {
        let str = ArkTSUtils.ASON.stringify(null);
        expect(str).assertEqual(JSON.stringify(null));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testStringify0002
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6700
     * @tc.desc   Test the function of the interface Stringify.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStringify0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0002";
      try {
        let str = ArkTSUtils.ASON.stringify(undefined);
        expect(str).assertEqual(JSON.stringify(undefined));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testStringify0003
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6800
     * @tc.desc   Test the function of the interface Stringify.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStringify0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0003";
      try {
        let str = ArkTSUtils.ASON.stringify(4);
        expect(str).assertEqual(JSON.stringify(4));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testStringify0004
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_6900
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStringify0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0004";
      try {
        let str = ArkTSUtils.ASON.stringify(true);
        expect(str).assertEqual(JSON.stringify(true));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })
    /**
     * @tc.name   testStringify0005
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_7000
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStringify0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0005";
      try {
        let num: bigint = 123456789012345123456789012345n;
        let str = ArkTSUtils.ASON.stringify(num);
        let value = num.valueOf()
        expect(str).assertEqual(value.toString())
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testStringify0006
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_7100
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStringify0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0006";
      try {
        let str = ArkTSUtils.ASON.stringify('testStringify0009');
        expect(str).assertEqual(JSON.stringify('testStringify0009'));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testStringify0007
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_7200
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStringify0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0007";
      try {
        type ISendable = lang.ISendable;
        let value: ISendable | number | null;
        value = 10;
        value = null;
        let str = ArkTSUtils.ASON.stringify(value);
        expect(str).assertEqual(JSON.stringify(value));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testStringify0008
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_7300
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStringify0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0008";
      try {
        let lock1 = new ArkTSUtils.locks.AsyncLock();
        let str = ArkTSUtils.ASON.stringify(lock1);
        expect(str).assertEqual(JSON.stringify(lock1));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testStringify0009
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_7400
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStringify0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0009";
      try {
        let value = new collections.BitVector(1);
        let str = ArkTSUtils.ASON.stringify(value);
        expect(str).assertEqual(JSON.stringify(value));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testStringify0011
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_7600
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStringify0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0011";
      try {
        let value = new collections.Map<string, string>();
        let str = ArkTSUtils.ASON.stringify(value);
        expect(str).assertEqual(JSON.stringify(value));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testStringify0012
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_7700
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStringify0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0012";
      try {
        let value = new collections.Array<number>(1, 2, 3);
        let str = ArkTSUtils.ASON.stringify(value);
        expect(str).assertEqual(JSON.stringify(value));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testStringify0013
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_7800
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testStringify0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testStringify0013";
      try {
        let concatArray: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 4);
        let str = ArkTSUtils.ASON.stringify(concatArray);
        expect(str).assertEqual(JSON.stringify(concatArray));
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.number  SUB_ASON_PARSE_REVIVER_IGNORE_0100
     * @tc.name    testAsonParseReviverIgnore0001
     * @tc.desc    Verify ASON.parse rejects non-undefined reviver (throws)
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testAsonParseReviverIgnore0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let reviverIgnore001: (key: string, value: lang.ISendable | undefined | null) => lang.ISendable | undefined | null =
        (key: string, value: lang.ISendable | undefined | null): lang.ISendable | undefined | null => value;
      let threw = false;
      try {
        ArkTSUtils.ASON.parse('{"a":1}', reviverIgnore001);
      } catch (error) {
        threw = true;
      }
      expect(threw).assertTrue();
      done()
    })

    /**
     * @tc.number  SUB_ASON_CONC_TASKPOOL_0200
     * @tc.name    testAsonConcTaskpool0002
     * @tc.desc    Verify ASON.parse result visibility across TaskPool
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testAsonConcTaskpool0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let parsed = ArkTSUtils.ASON.parse('{"name":"John"}') as lang.ISendable;
      let envName = await taskpool.execute(new taskpool.Task(supAsonConsume001, parsed)) as string;
      expect(envName).assertEqual('John');
      done()
    })

    /**
     * @tc.number  SUB_ASON_CONC_TASKPOOL_MAP_0300
     * @tc.name    testAsonConcTaskpoolMap0003
     * @tc.desc    Verify ASON.parse MAP result readable and writable across TaskPool
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testAsonConcTaskpoolMap0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let map = ArkTSUtils.ASON.parse('{"k":1,"v":2}', undefined,
        {
          parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP,
          bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT
        }) as collections.Map<string, bigint>;
      let got = await taskpool.execute(new taskpool.Task(supAsonMapConsume001, map)) as bigint;
      expect(BigInt(got)).assertEqual(1n);
      expect(map.get('x')).assertEqual(9n);
      done()
    })

    /**
     * @tc.number  SUB_ASON_CONC_MULTI_WRITE_0400
     * @tc.name    testAsonConcMultiWrite0004
     * @tc.desc    Verify concurrent ASON.parse writes to shared map keep all keys correct
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testAsonConcMultiWrite0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let shared = new SupAsonShared001();
      let tasks: taskpool.Task[] = [];
      for (let t = 0; t < 5; t++) {
        tasks.push(new taskpool.Task(supAsonWrite001, shared, `k${t}`, `{"v":"v${t}"}`));
      }
      for (let t = 0; t < tasks.length; t++) {
        await taskpool.execute(tasks[t]);
      }
      for (let t = 0; t < 5; t++) {
        expect(shared.map.get(`k${t}`)).assertEqual(`v${t}`);
      }
      done()
    })

    /**
     * @tc.number  SUB_ASON_BIGINT_DEFAULT_LOSSY_0500
     * @tc.name    testAsonBigintDefaultLossy0005
     * @tc.desc    Verify DEFAULT mode parses large integer with precision loss
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testAsonBigintDefaultLossy0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let opts: ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT
      };
      let obj = ArkTSUtils.ASON.parse('{"n":112233445566778899}', undefined, opts) as lang.ISendable;
      let nval: number = (obj as object)?.['n'] as number;
      expect(typeof nval).assertEqual('number');
      expect(BigInt(nval) === 112233445566778899n).assertFalse();
      done()
    })
  })
}