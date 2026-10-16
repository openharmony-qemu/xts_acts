/**
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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, lang, JSON, collections } from '@kit.ArkTS';

function buildNumbericKeyJson(propertyCount: number): string {
  let props: string[] = [];
  for (let i = 0; i < propertyCount; i++) {
    props.push(`"${i}":"value-${i}"`);
  }
  return `{"Switch":{${props.join(',')}}}`;
}

function buildNonNumbericKeyJson(propertyCount: number): string {
  let props: string[] = [];
  for (let i = 0; i < propertyCount; i++) {
    props.push(`"k${i}":"value-${i}"`);
  }
  return `{"Switch":{${props.join(',')}}}`;
}

function buildDuplicateKeyJson(totalEntries: number): string {
  let props: string[] = [];
  props.push('"k0":"first-value"');
  for (let i = 1; i < totalEntries - 1; i++) {
    props.push(`"k${i}":"value-${i}"`);
  }
  props.push('"k0":"last-value"');
  return `{"Switch":{${props.join(',')}}}`;
}

function buildFlatMapJson(entryCount: number): string {
  let props: string[] = [];
  for (let i = 0; i < entryCount; i++) {
    props.push(`"key${i}":"value-${i}"`);
  }
  return `{${props.join(',')}}`;
}

function getSwitchRecord(parsed: lang.ISendable): Record<string, string> {
  let root: Record<string, Object> = parsed as Record<string, Object>;
  return root['Switch'] as Record<string, string>;
}

export default function arkTSUtilJSONTest() {
  describe('arkTSUtilJSONTest', () => {

    /**
     * @tc.name   testTransformer0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_5400
     * @tc.desc   Test the function of the interface Transformer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransformer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testTransformer0001";
      try {
        type ISendable = lang.ISendable;
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT,
          parseReturnType: JSON.ParseReturnType.OBJECT,
        }
        let numberText = '{"largeNumber":1}';
        let numberObj = JSON.parseSendable(numberText, undefined, options) as ISendable;
        expect((numberObj as object)?.["largeNumber"]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockParseOptions0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_5500
     * @tc.desc   Test the function of the interface LockAsyncParseOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockParseOptions0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockParseOptions0001";
      try {
        type ISendable = lang.ISendable;
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.DEFAULT,
          parseReturnType: JSON.ParseReturnType.OBJECT,
        }
        let numberText = '{"largeNumber":112233445566778899n}';
        let numberObj = JSON.parseSendable(numberText, undefined, options) as ISendable;
        console.info(`${TAG} result:` + (numberObj as object)?.["largeNumber"]);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockParseOptions0002
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_5600
     * @tc.desc   Test the function of the interface LockAsyncParseOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockParseOptions0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockParseOptions0002";
      try {
        type ISendable = lang.ISendable;
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT,
          parseReturnType: JSON.ParseReturnType.OBJECT,
        }
        let numberText = '{"largeNumber":9007199254740992}';
        let numberObj = JSON.parseSendable(numberText, undefined, options) as ISendable;
        console.info(`${TAG} result:` + typeof (numberObj as object)?.["largeNumber"]);
        expect(typeof (numberObj as object)?.["largeNumber"]).assertEqual(`bigint`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockParseOptions0003
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_5700
     * @tc.desc   Test the function of the interface LockAsyncParseOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockParseOptions0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockParseOptions0003";
      try {
        type ISendable = lang.ISendable;
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.ALWAYS_PARSE_AS_BIGINT,
          parseReturnType: JSON.ParseReturnType.OBJECT,
        }
        let numberText = '{"largeNumber":1}';
        let numberObj = JSON.parseSendable(numberText, undefined, options) as ISendable;
        console.info(`${TAG} result:` + typeof (numberObj as object)?.["largeNumber"]);
        expect(typeof (numberObj as object)?.["largeNumber"]).assertEqual(`bigint`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testAsyncLockParseOptions0004
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_5800
     * @tc.desc   Test the function of the interface LockAsyncParseOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncLockParseOptions0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testAsyncLockParseOptions0004";
      try {
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.DEFAULT,
          parseReturnType: JSON.ParseReturnType.OBJECT,
        }
        let numberText = '{"largeNumber":1}';
        let numberObj = JSON.parseSendable(numberText, undefined, options);
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
     * @tc.name   testParseSendable0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_5900
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0001";
      try {
        type ISendable = lang.ISendable;
        let text = '';
        JSON.parseSendable(text) as ISendable;
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0002
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_6000
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0002";
      try {
        type ISendable = lang.ISendable;
        let text = '{"name" "John", "age": 30, "city": "ChongQing"}';
        JSON.parseSendable(text) as ISendable;
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0003
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_6100
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0003";
      try {
        type ISendable = lang.ISendable;
        let jsonText = '{"name": "John", "age": 30, "city": "ChongQing"}';
        const obj = JSON.parseSendable(jsonText) as ISendable;
        expect((obj as object)?.["name"]).assertEqual("John");
        expect(ArkTSUtils.isSendable(obj)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0004
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_6200
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0004";
      try {
        type ISendable = lang.ISendable;
        let jsonText = '{"name": "John", "age": 30, "city": "ChongQing"}';
        const obj = JSON.parseSendable(jsonText, undefined, undefined) as ISendable;
        expect((obj as object)?.["name"]).assertEqual("John");
        expect(ArkTSUtils.isSendable(obj)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0005
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_6300
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0005";
      try {
        type ISendable = lang.ISendable;
        let jsonText = '{"name": "John", "age": 30, "bigInt": 1234567890123456789012345678901234567890}';
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.DEFAULT,
          parseReturnType: JSON.ParseReturnType.OBJECT,
        };
        const obj = JSON.parseSendable(jsonText, undefined, options) as ISendable;
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
     * @tc.name   testParseSendable0006
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_6400
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0006";
      try {
        type ISendable = lang.ISendable;
        let jsonText = '{"name": "John", "age": 30, "bigInt": 1234567890123456789012345678901234567890}';
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT,
          parseReturnType: JSON.ParseReturnType.OBJECT,
        }
        const obj = JSON.parseSendable(jsonText, undefined, options) as ISendable;
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
     * @tc.name   testParseSendable0007
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_6500
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0007";
      try {
        type ISendable = lang.ISendable;
        let jsonText = '{"name": "John", "age": 30, "bigInt": 1234567890123456789012345678901234567890}';
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.ALWAYS_PARSE_AS_BIGINT,
          parseReturnType: JSON.ParseReturnType.OBJECT,
        }
        const obj = JSON.parseSendable(jsonText, undefined, options) as ISendable;
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
     * @tc.name   testParseSendable0008
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_6600
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: JSON.ParseReturnType.MAP,
      }
      let jsonText = '{"feature":{"arr":[1,3,5]}}';
      let map: collections.Map<string, collections.Map<string, collections.Array<number>>>
        = JSON.parseSendable(jsonText, undefined, options) as collections.Map<string, collections.Map<string, collections.Array<number>>>;
      expect(typeof map.get("feature")).assertEqual("object");
      expect(map.get("feature")?.get("arr")?.at(1)).assertEqual(3);
      done()
    })

    /**
     * @tc.name   testParseSendable0009
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_6700
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: JSON.ParseReturnType.MAP,
      }
      try {
        let jsonText = '{';
        JSON.parseSendable(jsonText, undefined, options);
      } catch (err) {
        expect(err.message).assertContain('Unexpected MAP Prop in JSON');
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0010
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_6800
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options : JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: JSON.ParseReturnType.MAP,
      }
      let func = (key: string, value: lang.ISendable | undefined | null) : lang.ISendable | undefined | null => {
        return value;
      }
      try {
        let jsonText = '{"feature":{"arr":[1,3,5]}}';
        JSON.parseSendable(jsonText, func, options);
      } catch (err) {
        expect(err.message).assertContain('Reviver only supports undefined currently');
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0011
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_6900
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testParseSendable0011';
      try {
        let parsed = JSON.parseSendable(buildNumbericKeyJson(85)) as lang.ISendable;
        let sw = getSwitchRecord(parsed);
        expect(sw['84']).assertEqual('value-84');
        expect(Reflect.get(sw, '84')).assertEqual('value-84');
        expect(Object.keys(sw).length).assertEqual(85);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0012
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_7000
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testParseSendable0012';
      try {
        let parsed = JSON.parseSendable(buildNumbericKeyJson(86)) as lang.ISendable;
        let sw = getSwitchRecord(parsed);
        expect(sw['85']).assertEqual('value-85');
        expect(Reflect.get(sw, '85')).assertEqual('value-85');
        expect(Object.keys(sw).length).assertEqual(86);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0013
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_7100
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testParseSendable0013';
      try {
        let parsed = JSON.parseSendable(buildNumbericKeyJson(1020)) as lang.ISendable;
        let sw = getSwitchRecord(parsed);
        expect(sw['1019']).assertEqual('value-1019');
        expect(Reflect.get(sw, '1019')).assertEqual('value-1019');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0014
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_7200
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testParseSendable0014';
      try {
        let parsed = JSON.parseSendable(buildNumbericKeyJson(1021)) as lang.ISendable;
        let sw = getSwitchRecord(parsed);
        expect(sw['1020']).assertEqual('value-1020');
        expect(Reflect.get(sw, '1020')).assertEqual('value-1020');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0015
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_7300
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testParseSendable0015';
      try {
        let parsed = JSON.parseSendable(buildNonNumbericKeyJson(1020)) as lang.ISendable;
        let sw = getSwitchRecord(parsed);
        expect(Object.keys(sw).length).assertEqual(1020);
        expect(Object.values(sw).length).assertEqual(1020);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0016
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_7400
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testParseSendable0016';
      try {
        let parsed = JSON.parseSendable(buildNonNumbericKeyJson(1021)) as lang.ISendable;
        let sw = getSwitchRecord(parsed);
        expect(Object.keys(sw).length).assertEqual(1021);
        expect(Object.values(sw).length).assertEqual(1021);
        expect(Object.entries(sw).length).assertEqual(1021);
        expect(sw['k0']).assertEqual('value-0');
        expect(sw['k1020']).assertEqual('value-1020');
        expect(Object.getOwnPropertyNames(sw).length).assertEqual(1021);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0017
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_7500
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testParseSendable0017';
      try {
        let parsed = JSON.parseSendable(buildDuplicateKeyJson(1020)) as lang.ISendable;
        let sw = getSwitchRecord(parsed);
        expect(sw['k0']).assertEqual('last-value');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0018
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_7600
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testParseSendable0018';
      try {
        let parsed = JSON.parseSendable(buildDuplicateKeyJson(1021)) as lang.ISendable;
        let sw = getSwitchRecord(parsed);
        expect(sw['k0']).assertEqual('last-value');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0019
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_7700
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0019";
      try {
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT,
          parseReturnType: JSON.ParseReturnType.MAP,
        }
        let parsed = JSON.parseSendable(buildFlatMapJson(1020), undefined, options) as collections.Map<string, string>;
        expect(parsed.size).assertEqual(1020);
        expect(parsed.get('key0')).assertEqual('value-0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0020
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTIL_7800
     * @tc.desc   Test the function of the interface Parse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0020";
      try {
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT,
          parseReturnType: JSON.ParseReturnType.MAP,
        }
        let parsed = JSON.parseSendable(buildFlatMapJson(1019), undefined, options) as collections.Map<string, string>;
        expect(parsed.size).assertEqual(1019);
        expect(parsed.get('key0')).assertEqual('value-0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })
  })
}