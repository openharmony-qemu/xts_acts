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

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium-dynamic';
import { ArkTSUtils, lang, JSON, collections } from '@kit.ArkTS';
import { taskpool } from '@kit.ArkTS';
import { hidebug } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { GetTime } from '../utils/utils';
import {
  verifyDoubledNumericKeys, verifyCharKeys, verifyAlternatingKeys, verifyNestedNumericKeys,
  verifyDictModeValueTypes, parseSendableInTask, modifyNumericKeyInTask, enumerateKeysInTask
} from '../utils/arkTSUtilsCommon';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

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

type RootRecord = Record<string, Object>;

type ReviverFn = (key: string, value: lang.ISendable | undefined | null) => lang.ISendable | undefined | null;

function buildMixedKeyJson(count: number): string {
  let props: string[] = [];
  for (let i = 0; i < count; i++) {
    props.push(`"${i}":"value-${i}"`);
  }
  props.push('"name":"test-name"');
  return `{${props.join(',')}}`;
}

function buildDoubledNumericKeyJson(keyCount: number): string {
  let props: string[] = [];
  for (let i = 0; i < keyCount; i++) {
    props.push(`"${i}":${i * 2}`);
  }
  return `{${props.join(',')}}`;
}

function buildCharKeyJson(keyCount: number): string {
  let props: string[] = [];
  for (let i = 0; i < keyCount; i++) {
    props.push(`"key-${i}":"value-${i}"`);
  }
  return `{${props.join(',')}}`;
}

function buildAlternatingKeyJson(keyCount: number): string {
  let props: string[] = [];
  let numericIndex = 0;
  let charIndex = 0;
  for (let i = 0; i < keyCount; i++) {
    if (i % 2 === 0) {
      props.push(`"${numericIndex}":"numeric-${numericIndex}"`);
      numericIndex++;
    } else {
      props.push(`"str-${charIndex}":"char-${charIndex}"`);
      charIndex++;
    }
  }
  return `{${props.join(',')}}`;
}

function buildPseudoNumericKeyJson(): string {
  return '{"01":"pseudo-01","00":"pseudo-00","+1":"pseudo-plus-1","-0":"pseudo-minus-0",' +
    '"1.0":"pseudo-1-0","1e2":"pseudo-1e2","4294967295":"pseudo-max-index"}';
}

function buildNestedNumericKeyJson(): string {
  let deepest: string[] = [];
  for (let i = 0; i < 1025; i++) {
    deepest.push(`"char-key-${i}":"leaf-${i}"`);
  }
  let middle: string[] = [];
  middle.push(`"0":{${deepest.join(',')}}`);
  for (let i = 1; i < 1025; i++) {
    middle.push(`"${i}":{"m2":"m2-${i}"}`);
  }
  let top: string[] = [];
  top.push(`"0":{${middle.join(',')}}`);
  for (let i = 1; i < 1025; i++) {
    top.push(`"${i}":{"m1":"m1-${i}"}`);
  }
  return `{${top.join(',')}}`;
}

function buildMixedNestedKeyJson(): string {
  let pseudoLayer = '{"01":"pv-01","00":"pv-00","+1":"pv-plus-1","-0":"pv-minus-0",' +
    '"1.0":"pv-1-0","1e2":"pv-1e2","4294967295":"pv-max"}';
  let middle: string[] = [];
  middle.push(`"a":${pseudoLayer}`);
  for (let i = 0; i < 89; i++) {
    middle.push(`"${i}":{"deep":"d-${i}"}`);
  }
  let top: string[] = [];
  top.push(`"0":{${middle.join(',')}}`);
  for (let i = 1; i < 90; i++) {
    top.push(`"${i}":{"m1":"m1-${i}"}`);
  }
  return `{${top.join(',')}}`;
}

function buildLayeredValueTypesJson(): string {
  let inner: string[] = [];
  for (let i = 1; i < 85; i++) {
    inner.push(`"${i}":${i}`);
  }
  return `{"0":{"0":["layer3-string",{"0":42}],${inner.join(',')}}}`;
}

function buildDictModeValueTypesJson(): string {
  let props: string[] = [];
  for (let i = 0; i < 90; i++) {
    let kind = Math.floor(i / 10) % 6;
    if (kind === 0) {
      props.push(`"${i}":"v-${i}"`);
    } else if (kind === 1) {
      props.push(`"${i}":${i}`);
    } else if (kind === 2) {
      props.push(`"${i}":${i % 2 === 0}`);
    } else if (kind === 3) {
      props.push(`"${i}":null`);
    } else if (kind === 4) {
      props.push(`"${i}":{"sub":"sub-${i}"}`);
    } else {
      props.push(`"${i}":[${i},${i + 1}]`);
    }
  }
  return `{${props.join(',')}}`;
}

function buildSizedJson(targetBytes: number): string {
  let valueLength = 500;
  let entryBytes = valueLength + 16;
  let entryCount = Math.ceil(targetBytes / entryBytes);
  let padding = 'x'.repeat(valueLength);
  let props: string[] = [];
  for (let i = 0; i < entryCount; i++) {
    props.push(`"key-${i}":"${padding}"`);
  }
  return `{${props.join(',')}}`;
}

export default function arkTSUtilJSONTest() {
  describe('arkTSUtilJSONTest', () => {
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

    /**
     * @tc.name   testParseSendable0101
     * @tc.number SUB_JSON_PARSE_SENDABLE_0100
     * @tc.desc   Test parseSendable with basic numeric string keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0101";
      try {
        let parsed = JSON.parseSendable('{"0":"value-0","1":"value-1"}') as lang.ISendable;
        expect(parsed !== null).assertTrue();
        expect(parsed !== undefined).assertTrue();
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect((record['0'] as string)).assertEqual('value-0');
        expect((record['1'] as string)).assertEqual('value-1');
        expect(ArkTSUtils.isSendable(parsed)).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0102
     * @tc.number SUB_JSON_PARSE_SENDABLE_0200
     * @tc.desc   Test parseSendable with 85 consecutive numeric keys in inline mode boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0102";
      try {
        let parsed = JSON.parseSendable(buildDoubledNumericKeyJson(85)) as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(Object.keys(record).length).assertEqual(85);
        let code = await taskpool.execute(verifyDoubledNumericKeys, parsed, 85) as number;
        expect(code).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0103
     * @tc.number SUB_JSON_PARSE_SENDABLE_0300
     * @tc.desc   Test parseSendable with 86 consecutive numeric keys in dict mode conversion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0103";
      try {
        let parsed = JSON.parseSendable(buildDoubledNumericKeyJson(86)) as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(Object.keys(record).length).assertEqual(86);
        let code = await taskpool.execute(verifyDoubledNumericKeys, parsed, 86) as number;
        expect(code).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0104
     * @tc.number SUB_JSON_PARSE_SENDABLE_0400
     * @tc.desc   Test parseSendable with 1020 consecutive numeric keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0104";
      try {
        let parsed = JSON.parseSendable(buildDoubledNumericKeyJson(1020)) as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(Object.keys(record).length).assertEqual(1020);
        let code = await taskpool.execute(verifyDoubledNumericKeys, parsed, 1020) as number;
        expect(code).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0105
     * @tc.number SUB_JSON_PARSE_SENDABLE_0500
     * @tc.desc   Test parseSendable with 1021 consecutive numeric keys in dict mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0105";
      try {
        let parsed = JSON.parseSendable(buildDoubledNumericKeyJson(1021)) as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(Object.keys(record).length).assertEqual(1021);
        let code = await taskpool.execute(verifyDoubledNumericKeys, parsed, 1021) as number;
        expect(code).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0106
     * @tc.number SUB_JSON_PARSE_SENDABLE_0600
     * @tc.desc   Test parseSendable with 1025 consecutive numeric keys at large scale.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0106";
      try {
        let parsed = JSON.parseSendable(buildDoubledNumericKeyJson(1025)) as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(Object.keys(record).length).assertEqual(1025);
        let code = await taskpool.execute(verifyDoubledNumericKeys, parsed, 1025) as number;
        expect(code).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0107
     * @tc.number SUB_JSON_PARSE_SENDABLE_0700
     * @tc.desc   Test parseSendable with 1025 consecutive character keys stored as named properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0107";
      try {
        let parsed = JSON.parseSendable(buildCharKeyJson(1025)) as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(Object.keys(record).length).assertEqual(1025);
        let code = await taskpool.execute(verifyCharKeys, parsed, 1025) as number;
        expect(code).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0108
     * @tc.number SUB_JSON_PARSE_SENDABLE_0800
     * @tc.desc   Test parseSendable with 1025 alternating numeric and character keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0108";
      try {
        let parsed = JSON.parseSendable(buildAlternatingKeyJson(1025)) as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(Object.keys(record).length).assertEqual(1025);
        expect((record['512'] as string)).assertEqual('numeric-512');
        expect((record['str-511'] as string)).assertEqual('char-511');
        let code = await taskpool.execute(verifyAlternatingKeys, parsed, 1025) as number;
        expect(code).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0109
     * @tc.number SUB_JSON_PARSE_SENDABLE_0900
     * @tc.desc   Test parseSendable with digit-like character keys stored as named properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0109";
      try {
        let parsed = JSON.parseSendable(buildPseudoNumericKeyJson()) as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(Object.keys(record).length).assertEqual(7);
        expect((record['01'] as string)).assertEqual('pseudo-01');
        expect((record['00'] as string)).assertEqual('pseudo-00');
        expect((record['+1'] as string)).assertEqual('pseudo-plus-1');
        expect((record['-0'] as string)).assertEqual('pseudo-minus-0');
        expect((record['1.0'] as string)).assertEqual('pseudo-1-0');
        expect((record['1e2'] as string)).assertEqual('pseudo-1e2');
        expect((record['4294967295'] as string)).assertEqual('pseudo-max-index');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0157
     * @tc.number SUB_JSON_PARSE_SENDABLE_5700
     * @tc.desc   Test parseSendable and stringify round trip with mixed keys and value types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0157";
      try {
        let original = '{"0":"str","name":"origin","1":42,"2":true,"3":false,"4":null,' +
          '"5":{"nested":"val"},"6":[1,2,3],"7":3.14}';
        let parsed = JSON.parseSendable(original) as lang.ISendable;
        let roundTripped: string = JSON.stringify(parsed);
        let reParsed: Record<string, Object> = JSON.parse(roundTripped) as Record<string, Object>;
        let originParsed: Record<string, Object> = JSON.parse(original) as Record<string, Object>;
        expect(Object.keys(reParsed).length).assertEqual(9);
        expect(reParsed['0']).assertEqual(originParsed['0']);
        expect(reParsed['name']).assertEqual(originParsed['name']);
        expect(reParsed['1']).assertEqual(originParsed['1']);
        expect(reParsed['7']).assertEqual(originParsed['7']);
        let nested = reParsed['5'] as Record<string, Object>;
        let originNested = originParsed['5'] as Record<string, Object>;
        expect((nested['nested'] as string)).assertEqual(originNested['nested']);
        let arr = reParsed['6'] as Object[];
        expect(arr.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0158
     * @tc.number SUB_JSON_PARSE_SENDABLE_5800
     * @tc.desc   Test parseSendable and stringify round trip with multi-layer nested JSON.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0158";
      try {
        let original = buildMixedNestedKeyJson();
        let parsed = JSON.parseSendable(original) as lang.ISendable;
        let roundTripped: string = JSON.stringify(parsed);
        let reParsed: Record<string, Object> = JSON.parse(roundTripped) as Record<string, Object>;
        let originParsed: Record<string, Object> = JSON.parse(original) as Record<string, Object>;
        let layer1 = reParsed['0'] as Record<string, Object>;
        let originLayer1 = originParsed['0'] as Record<string, Object>;
        expect(Object.keys(layer1).length).assertEqual(Object.keys(originLayer1).length);
        let layer2 = layer1['a'] as Record<string, Object>;
        let originLayer2 = originLayer1['a'] as Record<string, Object>;
        expect((layer2['01'] as string)).assertEqual(originLayer2['01'] as string);
        expect((layer2['4294967295'] as string)).assertEqual(originLayer2['4294967295'] as string);
        let deep = layer1['0'] as Record<string, Object>;
        let originDeep = originLayer1['0'] as Record<string, Object>;
        expect((deep['deep'] as string)).assertEqual(originDeep['deep'] as string);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0110
     * @tc.number SUB_JSON_PARSE_SENDABLE_1000
     * @tc.desc   Test parseSendable in main thread and read values in a taskpool thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0110";
      try {
        let parsed = JSON.parseSendable(buildDoubledNumericKeyJson(1025)) as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(Object.keys(record).length).assertEqual(1025);
        expect((record['1024'] as number)).assertEqual(2048);
        let code = await taskpool.execute(verifyDoubledNumericKeys, parsed, 1025) as number;
        expect(code).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0111
     * @tc.number SUB_JSON_PARSE_SENDABLE_1100
     * @tc.desc   Test value modification in taskpool thread is observable in main thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0111";
      try {
        let parsed = JSON.parseSendable('{"0":"origin","1":"keep"}') as lang.ISendable;
        let code = await taskpool.execute(modifyNumericKeyInTask, parsed) as number;
        expect(code).assertEqual(0);
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect((record['0'] as string)).assertEqual('modified');
        expect((record['1'] as string)).assertEqual('keep');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0112
     * @tc.number SUB_JSON_PARSE_SENDABLE_1200
     * @tc.desc   Test parseSendable in taskpool thread and pass the result back to main thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0112";
      try {
        let numericParsed = await taskpool.execute(parseSendableInTask,
          buildDoubledNumericKeyJson(1025)) as lang.ISendable;
        let numericRecord: Record<string, Object> = numericParsed as Record<string, Object>;
        expect(Object.keys(numericRecord).length).assertEqual(1025);
        expect((numericRecord['1024'] as number)).assertEqual(2048);
        let charParsed = await taskpool.execute(parseSendableInTask,
          buildCharKeyJson(1025)) as lang.ISendable;
        let charRecord: Record<string, Object> = charParsed as Record<string, Object>;
        expect(Object.keys(charRecord).length).assertEqual(1025);
        expect((charRecord['key-1024'] as string)).assertEqual('value-1024');
        let mixedParsed = await taskpool.execute(parseSendableInTask,
          buildAlternatingKeyJson(1025)) as lang.ISendable;
        let mixedRecord: Record<string, Object> = mixedParsed as Record<string, Object>;
        expect(Object.keys(mixedRecord).length).assertEqual(1025);
        expect((mixedRecord['512'] as string)).assertEqual('numeric-512');
        expect((mixedRecord['str-511'] as string)).assertEqual('char-511');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0113
     * @tc.number SUB_JSON_PARSE_SENDABLE_1300
     * @tc.desc   Test multi-layer nested JSON parsed in taskpool thread and passed back to main thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0113";
      try {
        let nestedParsed = await taskpool.execute(parseSendableInTask,
          buildNestedNumericKeyJson()) as lang.ISendable;
        let root: Record<string, Object> = nestedParsed as Record<string, Object>;
        expect(Object.keys(root).length).assertEqual(1025);
        let layer1 = root['0'] as Record<string, Object>;
        expect(Object.keys(layer1).length).assertEqual(1025);
        let layer2 = layer1['0'] as Record<string, Object>;
        expect((layer2['char-key-1024'] as string)).assertEqual('leaf-1024');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0114
     * @tc.number SUB_JSON_PARSE_SENDABLE_1400
     * @tc.desc   Test object enumeration methods remain available across threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0114";
      try {
        let parsed = JSON.parseSendable(buildDoubledNumericKeyJson(90)) as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        let mainKeys: string[] = Object.keys(record);
        expect(mainKeys.length).assertEqual(90);
        let code = await taskpool.execute(enumerateKeysInTask, parsed, 90) as number;
        expect(code).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0115
     * @tc.number SUB_JSON_PARSE_SENDABLE_1500
     * @tc.desc   Test parseSendable numeric key with string value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0115";
      try {
        let parsed = JSON.parseSendable('{"0":"string-value"}') as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect((record['0'] as string)).assertEqual('string-value');
        expect(typeof record['0']).assertEqual('string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0116
     * @tc.number SUB_JSON_PARSE_SENDABLE_1600
     * @tc.desc   Test parseSendable numeric key with number value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0116";
      try {
        let parsed = JSON.parseSendable('{"0":42}') as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(record['0']).assertEqual(42);
        expect(typeof record['0']).assertEqual('number');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0117
     * @tc.number SUB_JSON_PARSE_SENDABLE_1700
     * @tc.desc   Test parseSendable numeric key with nested object value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0117";
      try {
        let parsed = JSON.parseSendable('{"0":{"nested":"val"}}') as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(typeof record['0']).assertEqual('object');
        let nested = record['0'] as Record<string, Object>;
        expect((nested['nested'] as string)).assertEqual('val');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0118
     * @tc.number SUB_JSON_PARSE_SENDABLE_1800
     * @tc.desc   Test parseSendable numeric key with array value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0118";
      try {
        let parsed = JSON.parseSendable('{"0":[1,2,3]}') as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        let arr: collections.Array<number> = record['0'] as collections.Array<number>;
        expect(arr.length).assertEqual(3);
        expect(arr.at(0)).assertEqual(1);
        expect(arr.at(2)).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0119
     * @tc.number SUB_JSON_PARSE_SENDABLE_1900
     * @tc.desc   Test parseSendable numeric keys with boolean and null values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0119";
      try {
        let parsed = JSON.parseSendable('{"0":true,"1":false,"2":null}') as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(record['0']).assertEqual(true);
        expect(record['1']).assertEqual(false);
        expect(record['2']).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0120
     * @tc.number SUB_JSON_PARSE_SENDABLE_2000
     * @tc.desc   Test parseSendable with multi-layer nested JSON of large data volume.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0120";
      try {
        let parsed = JSON.parseSendable(buildNestedNumericKeyJson()) as lang.ISendable;
        let code = await taskpool.execute(verifyNestedNumericKeys, parsed) as number;
        expect(code).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0121
     * @tc.number SUB_JSON_PARSE_SENDABLE_2100
     * @tc.desc   Test parseSendable with mixed key types across multiple nested layers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0121";
      try {
        let parsed = JSON.parseSendable(buildMixedNestedKeyJson()) as lang.ISendable;
        let root: Record<string, Object> = parsed as Record<string, Object>;
        expect(typeof root['0']).assertEqual('object');
        let layer1 = root['0'] as Record<string, Object>;
        expect(typeof layer1['a']).assertEqual('object');
        let layer2 = layer1['a'] as Record<string, Object>;
        expect((layer2['01'] as string)).assertEqual('pv-01');
        expect((layer2['4294967295'] as string)).assertEqual('pv-max');
        let deep = layer1['0'] as Record<string, Object>;
        expect((deep['deep'] as string)).assertEqual('d-0');
        let sibling = root['89'] as Record<string, Object>;
        expect((sibling['m1'] as string)).assertEqual('m1-89');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0145
     * @tc.number SUB_JSON_PARSE_SENDABLE_4500
     * @tc.desc   Test parseSendable numeric key with number boundary value full set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0145";
      try {
        let jsonText = '{"0":0,"1":-0,"2":9007199254740991,"3":-9007199254740991,' +
          '"4":1.7976931348623157e+308,"5":5e-324}';
        let parsed = JSON.parseSendable(jsonText) as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(record['0']).assertEqual(0);
        expect(record['1']).assertEqual(-0);
        expect(record['2']).assertEqual(9007199254740991);
        expect(record['3']).assertEqual(-9007199254740991);
        expect(record['4']).assertEqual(1.7976931348623157e+308);
        expect(record['5']).assertEqual(5e-324);
        let hasError = false;
        try {
          JSON.parseSendable('{"6":NaN}');
        } catch (err) {
          hasError = err instanceof SyntaxError;
        }
        expect(hasError).assertTrue();
        hasError = false;
        try {
          JSON.parseSendable('Infinity');
        } catch (err) {
          hasError = err instanceof SyntaxError;
        }
        expect(hasError).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0146
     * @tc.number SUB_JSON_PARSE_SENDABLE_4600
     * @tc.desc   Test parseSendable large integer with PARSE_AS_BIGINT mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0146";
      try {
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.PARSE_AS_BIGINT,
          parseReturnType: JSON.ParseReturnType.OBJECT,
        }
        let parsed = JSON.parseSendable('{"0":112233445566778899}', undefined, options) as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(record['0']).assertEqual(112233445566778899n);
        expect(typeof record['0']).assertEqual('bigint');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0147
     * @tc.number SUB_JSON_PARSE_SENDABLE_4700
     * @tc.desc   Test parseSendable common integer with ALWAYS_PARSE_AS_BIGINT mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0147";
      try {
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.ALWAYS_PARSE_AS_BIGINT,
          parseReturnType: JSON.ParseReturnType.OBJECT,
        }
        let parsed = JSON.parseSendable('{"0":42}', undefined, options) as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(record['0']).assertEqual(42n);
        expect(typeof record['0']).assertEqual('bigint');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0148
     * @tc.number SUB_JSON_PARSE_SENDABLE_4800
     * @tc.desc   Test parseSendable large integer with DEFAULT mode keeps number type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0148";
      try {
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.DEFAULT,
          parseReturnType: JSON.ParseReturnType.OBJECT,
        }
        let parsed = JSON.parseSendable('{"0":112233445566778899}', undefined, options) as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(typeof record['0']).assertEqual('number');
        expect(ArkTSUtils.isSendable(parsed)).assertTrue();
        console.info(`${TAG} default mode value: ${record['0']}`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0149
     * @tc.number SUB_JSON_PARSE_SENDABLE_4900
     * @tc.desc   Test parseSendable with mixed value types in a single JSON object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0149";
      try {
        let jsonText = '{"0":"str","1":42,"2":true,"3":false,"4":null,' +
          '"5":{"nested":"val"},"6":[1,2,3],"7":3.14}';
        let parsed = JSON.parseSendable(jsonText) as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect((record['0'] as string)).assertEqual('str');
        expect(record['1']).assertEqual(42);
        expect(record['2']).assertEqual(true);
        expect(record['3']).assertEqual(false);
        expect(record['4']).assertEqual(null);
        let nested = record['5'] as Record<string, Object>;
        expect((nested['nested'] as string)).assertEqual('val');
        let arr = record['6'] as collections.Array<number>;
        expect(arr.at(0)).assertEqual(1);
        expect(arr.at(2)).assertEqual(3);
        expect(record['7']).assertEqual(3.14);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0150
     * @tc.number SUB_JSON_PARSE_SENDABLE_5000
     * @tc.desc   Test parseSendable dict mode with rotating value types over 90 keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0150";
      try {
        let parsed = JSON.parseSendable(buildDictModeValueTypesJson()) as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(Object.keys(record).length).assertEqual(90);
        expect((record['0'] as string)).assertEqual('v-0');
        expect(record['10']).assertEqual(10);
        expect(record['20']).assertEqual(true);
        expect(record['30']).assertEqual(null);
        let sub = record['40'] as Record<string, Object>;
        expect((sub['sub'] as string)).assertEqual('sub-40');
        let arr = record['50'] as collections.Array<number>;
        expect(arr.at(1)).assertEqual(51);
        let code = await taskpool.execute(verifyDictModeValueTypes, parsed, 90) as number;
        expect(code).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0151
     * @tc.number SUB_JSON_PARSE_SENDABLE_5100
     * @tc.desc   Test parseSendable with layered mixed value types in nested numeric keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0151";
      try {
        let parsed = JSON.parseSendable(buildLayeredValueTypesJson()) as lang.ISendable;
        let root: Record<string, Object> = parsed as Record<string, Object>;
        expect(typeof root['0']).assertEqual('object');
        let layer1 = root['0'] as Record<string, Object>;
        expect(Object.keys(layer1).length).assertEqual(85);
        let layer2 = layer1['0'] as collections.Array<lang.ISendable>;
        expect((layer2.at(0) as string)).assertEqual('layer3-string');
        let layer4 = layer2.at(1) as Record<string, Object>;
        expect(layer4['0']).assertEqual(42);
        expect(layer1['84']).assertEqual(84);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0122
     * @tc.number SUB_JSON_PARSE_SENDABLE_2200
     * @tc.desc   Test parseSendable sized inputs keep full entries and log shared dirty memory delta.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0122";
      try {
        let tiers: number[] = [1024, 102400, 1048576, 10485760];
        for (let t = 0; t < tiers.length; t++) {
          let targetBytes = tiers[t];
          let text = buildSizedJson(targetBytes);
          let before: bigint = hidebug.getSharedDirty();
          let parsed = JSON.parseSendable(text) as lang.ISendable;
          let after: bigint = hidebug.getSharedDirty();
          let deltaKB = Number(after - before);
          let inputKB = targetBytes / 1024;
          let expectedCount = Math.ceil(targetBytes / 516);
          let record: Record<string, Object> = parsed as Record<string, Object>;
          let keys: string[] = Object.keys(record);
          expect(keys.length).assertEqual(expectedCount);
          expect((record['key-0'] as string).length).assertEqual(500);
          expect((record[`key-${expectedCount - 1}`] as string).length).assertEqual(500);
          expect(ArkTSUtils.isSendable(parsed)).assertTrue();
          console.info(`${TAG} tierBytes=${targetBytes} inputKB=${inputKB} deltaKB=${deltaKB}`);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0123
     * @tc.number SUB_JSON_PARSE_SENDABLE_2300
     * @tc.desc   Test parseSendable result matches JSON.parse baseline.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0123";
      try {
        let text = buildSizedJson(102400);
        let start = GetTime();
        let parsed = JSON.parseSendable(text) as lang.ISendable;
        let parseCostMs = GetTime() - start;
        let baseline: Record<string, Object> = JSON.parse(text) as Record<string, Object>;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        let keys: string[] = Object.keys(record);
        expect(keys.length).assertEqual(Object.keys(baseline).length);
        expect(record['key-0']).assertEqual(baseline['key-0']);
        expect(record[keys[keys.length - 1]]).assertEqual(baseline[keys[keys.length - 1]]);
        for (let i = 0; i < keys.length; i += 37) {
          expect(record[keys[i]]).assertEqual(baseline[keys[i]]);
        }
        expect(ArkTSUtils.isSendable(parsed)).assertTrue();
        console.info(`${TAG} entryCount=${keys.length} parseCostMs=${parseCostMs}`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0124
     * @tc.number SUB_JSON_PARSE_SENDABLE_2400
     * @tc.desc   Test parseSendable MAP mode for a 2-entry object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0124";
      try {
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.DEFAULT,
          parseReturnType: JSON.ParseReturnType.MAP,
        }
        let map = JSON.parseSendable('{"a":1,"b":2}', undefined, options) as collections.Map<string, number>;
        expect(map.size).assertEqual(2);
        expect(map.get('a')).assertEqual(1);
        expect(map.get('b')).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0125
     * @tc.number SUB_JSON_PARSE_SENDABLE_2500
     * @tc.desc   Test parseSendable MAP mode with more than 1018 entries keeps correct size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0125";
      try {
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.DEFAULT,
          parseReturnType: JSON.ParseReturnType.MAP,
        }
        let count = 1028;
        let map = JSON.parseSendable(buildFlatMapJson(count), undefined, options) as collections.Map<string, string>;
        expect(map.size).assertEqual(count);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0126
     * @tc.number SUB_JSON_PARSE_SENDABLE_2600
     * @tc.desc   Test parseSendable MAP mode map.get for entries beyond 1018.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0126";
      try {
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.DEFAULT,
          parseReturnType: JSON.ParseReturnType.MAP,
        }
        let count = 1028;
        let map = JSON.parseSendable(buildFlatMapJson(count), undefined, options) as collections.Map<string, string>;
        expect(map.get('key0')).assertEqual('value-0');
        expect(map.get('key1018')).assertEqual('value-1018');
        expect(map.get('key1027')).assertEqual('value-1027');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0127
     * @tc.number SUB_JSON_PARSE_SENDABLE_2700
     * @tc.desc   Test inline mode duplicate key uses the last value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0127";
      try {
        let parsed = JSON.parseSendable('{"a":1,"a":2}') as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(record['a']).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0128
     * @tc.number SUB_JSON_PARSE_SENDABLE_2800
     * @tc.desc   Test dict mode duplicate key uses the last value and keeps first occurrence position.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0128";
      try {
        let props: string[] = [];
        for (let i = 0; i < 85; i++) {
          props.push(`"k${i}":${i}`);
        }
        props.push('"dup":"first","tail":1,"dup":"second"');
        let parsed = JSON.parseSendable(`{${props.join(',')}}`) as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(record['dup']).assertEqual('second');
        let keys: string[] = Object.keys(record);
        expect(keys.indexOf('dup')).assertEqual(85);
        expect(keys.indexOf('dup') < keys.indexOf('tail')).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0129
     * @tc.number SUB_JSON_PARSE_SENDABLE_2900
     * @tc.desc   Test element mode duplicate numeric key uses the last value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0129";
      try {
        let parsed = JSON.parseSendable('{"0":1,"0":2}') as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(record['0']).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0130
     * @tc.number SUB_JSON_PARSE_SENDABLE_3000
     * @tc.desc   Test dict mode numeric and named keys are readable and enumerable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let parsed = JSON.parseSendable(buildMixedKeyJson(86)) as object;
      let keys = Object.keys(parsed);
      expect(keys.length).assertEqual(87);
      expect(keys.indexOf("0") >= 0).assertTrue();
      expect(keys.indexOf("name") >= 0).assertTrue();
      expect((parsed as object)?.["0"]).assertEqual("value-0");
      expect((parsed as object)?.["name"]).assertEqual("test-name");
      done()
    })

    /**
     * @tc.name   testParseSendable0131
     * @tc.number SUB_JSON_PARSE_SENDABLE_3100
     * @tc.desc   Test ASON.parse output matches JSON.parse baseline.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options: ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.DEFAULT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.OBJECT,
      }
      let inputs: string[] = [
        '{"name":"John","age":30,"city":"ChongQing"}',
        '{"Switch":{"0":"value-0","1":"value-1"}}',
        '{"arr":[1,3,5],"nested":{"a":"x"}}',
        '{"a":1,"b":true,"c":null,"d":3.14}',
        '{"empty":{},"list":[]}'
      ];
      for (let i = 0; i < inputs.length; i++) {
        let asonOut: string = JSON.stringify(ArkTSUtils.ASON.parse(inputs[i], undefined, options));
        let jsonOut: string = JSON.stringify(JSON.parse(inputs[i]));
        expect(asonOut).assertEqual(jsonOut);
      }
      let flat = '{"name":"John","age":30,"city":"ChongQing"}';
      let legacy = JSON.parse(flat) as RootRecord;
      let sendable = JSON.parseSendable(flat) as RootRecord;
      expect((sendable as object)?.["name"]).assertEqual((legacy as object)?.["name"]);
      expect((sendable as object)?.["age"]).assertEqual((legacy as object)?.["age"]);
      expect((sendable as object)?.["city"]).assertEqual((legacy as object)?.["city"]);
      expect(ArkTSUtils.isSendable(sendable)).assertEqual(true);
      done()
    })

    /**
     * @tc.name   testParseSendable0132
     * @tc.number SUB_JSON_PARSE_SENDABLE_3200
     * @tc.desc   Test legacy JSON.parseSendable behavior preserved and deterministic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let text = '{"name":"John","age":30}';
      let first = JSON.parseSendable(text) as RootRecord;
      let second = JSON.parseSendable(text) as RootRecord;
      expect((first as object)?.["name"]).assertEqual((second as object)?.["name"]);
      expect((first as object)?.["age"]).assertEqual((second as object)?.["age"]);
      let numeric = JSON.parseSendable(buildNumbericKeyJson(86)) as lang.ISendable;
      let sw = (numeric as object)?.["Switch"] as RootRecord;
      expect((sw as object)?.["85"]).assertEqual("value-85");
      expect(ArkTSUtils.isSendable(first)).assertEqual(true);
      expect(ArkTSUtils.isSendable(numeric)).assertEqual(true);
      done()
    })

    // /**
    //  * @tc.name   testParseSendable0133
    //  * @tc.number SUB_JSON_PARSE_SENDABLE_3300
    //  * @tc.desc   Test json_parser.cpp source diff is empty via git (manual).
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL1
    //  */
    // it("testParseSendable0133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
    //   // 源码 git diff 校验，属 CI/手工，设备侧无 git，占位。
    //   done()
    // })

    /**
     * @tc.name   testParseSendable0134
     * @tc.number SUB_JSON_PARSE_SENDABLE_3400
     * @tc.desc   Test non-string text parameter throws BusinessError 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let wrongTexts: ESObject[] = [123, null, undefined];
      for (let i = 0; i < wrongTexts.length; i++) {
        let threw1: boolean = false;
        try {
          JSON.parseSendable(wrongTexts[i] as string);
        } catch (err) {
          threw1 = true;
          expect((err as BusinessError).code).assertEqual(401);
        }
        expect(threw1).assertTrue();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0135
     * @tc.number SUB_JSON_PARSE_SENDABLE_3500
     * @tc.desc   Test non-undefined reviver parameter is rejected with reviver error message.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let func: ReviverFn = (key: string, value: lang.ISendable | undefined | null): lang.ISendable | undefined | null => {
        return value;
      };
      let badRevivers: ESObject[] = [func, null, {}];
      for (let i = 0; i < badRevivers.length; i++) {
        let threw1: boolean = false;
        try {
          JSON.parseSendable("{}", badRevivers[i] as ReviverFn);
        } catch (err) {
          threw1 = true;
          expect((err as Error).message).assertContain("Reviver only supports undefined");
        }
        expect(threw1).assertTrue();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0136
     * @tc.number SUB_JSON_PARSE_SENDABLE_3600
     * @tc.desc   Test parseSendable is supported in current runtime and returns sendable object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let obj = JSON.parseSendable('{"feature":1}') as RootRecord;
      expect((obj as object)?.["feature"]).assertEqual(1);
      expect(ArkTSUtils.isSendable(obj)).assertEqual(true);
      done()
    })

    /**
     * @tc.name   testParseSendable0137
     * @tc.number SUB_JSON_PARSE_SENDABLE_3700
     * @tc.desc   Test illegal JSON syntax throws SyntaxError.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let inputs: string[] = ["{a:1}", "{\"a\" 1}", "[1,2"];
      for (let i = 0; i < inputs.length; i++) {
        let threw: boolean = false;
        try {
          JSON.parseSendable(inputs[i]);
        } catch (err) {
          threw = true;
          expect((err as Error).name).assertEqual("SyntaxError");
        }
        expect(threw).assertTrue();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0138
     * @tc.number SUB_JSON_PARSE_SENDABLE_3800
     * @tc.desc   Test extra arguments are ignored while empty argument triggers a type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0138";
      try {
        const dynamicParse: ESObject = JSON.parseSendable;
        let threwOnFour = false;
        try {
          dynamicParse('{}', undefined, undefined, undefined);
        } catch (err) {
          threwOnFour = true;
        }
        expect(threwOnFour).assertFalse();
        let zeroArgMsg = '';
        try {
          dynamicParse();
        } catch (err) {
          zeroArgMsg = `${err}`;
        }
        expect(zeroArgMsg).assertContain('first param must be string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0139
     * @tc.number SUB_JSON_PARSE_SENDABLE_3900
     * @tc.desc   Test large-scale object parse (approximation of >UINT32_MAX properties).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0139";
      try {
        let count = 20000;
        let parsed = JSON.parseSendable(buildDoubledNumericKeyJson(count)) as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(Object.keys(record).length).assertEqual(count);
        expect(record[`${count - 1}`]).assertEqual((count - 1) * 2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0140
     * @tc.number SUB_JSON_PARSE_SENDABLE_4000
     * @tc.desc   Test large-scale MAP parse (approximation of >UINT32_MAX entries).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0140";
      try {
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.DEFAULT,
          parseReturnType: JSON.ParseReturnType.MAP,
        }
        let count = 20000;
        let map = JSON.parseSendable(buildFlatMapJson(count), undefined, options) as collections.Map<string, string>;
        expect(map.size).assertEqual(count);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0141
     * @tc.number SUB_JSON_PARSE_SENDABLE_4100
     * @tc.desc   Test parse result passes the Sendable terminal check.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0141";
      try {
        let samples: string[] = ['{"0":1}', '{"a":[1,2]}', '{"0":{"nested":"v"}}', '[]'];
        for (let i = 0; i < samples.length; i++) {
          let r = JSON.parseSendable(samples[i]) as lang.ISendable;
          expect(ArkTSUtils.isSendable(r)).assertTrue();
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0142
     * @tc.number SUB_JSON_PARSE_SENDABLE_4200
     * @tc.desc   Test 10000+ property JSON parses (long loop / CMC safepoint).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let big = JSON.parseSendable(buildNumbericKeyJson(10000)) as lang.ISendable;
      let rec = big as RootRecord;
      let sw = (rec as object)?.["Switch"] as RootRecord;
      expect((sw as object)?.["9999"]).assertEqual("value-9999");
      expect(Object.keys(sw).length).assertEqual(10000);
      done()
    })

    /**
     * @tc.name   testParseSendable0143
     * @tc.number SUB_JSON_PARSE_SENDABLE_4300
     * @tc.desc   Test repeated parsing produces stable results.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let stable: boolean = true;
      let lastVal: Object | undefined = undefined;
      for (let i = 0; i < 100; i++) {
        let parsed = JSON.parseSendable(buildNumbericKeyJson(200)) as lang.ISendable;
        let r = parsed as RootRecord;
        let sw = (r as object)?.["Switch"] as RootRecord;
        let v: Object | undefined = (sw as object)?.["199"];
        if (v !== "value-199") {
          stable = false;
        }
        lastVal = v;
      }
      expect(stable).assertTrue();
      expect(lastVal).assertEqual("value-199");
      done()
    })

    /**
     * @tc.name   testParseSendable0144
     * @tc.number SUB_JSON_PARSE_SENDABLE_4400
     * @tc.desc   Test parseSendable workload completes within time budget.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let begin: number = new Date().getTime();
      for (let i = 0; i < 50; i++) {
        JSON.parseSendable(buildNumbericKeyJson(1000));
      }
      let end: number = new Date().getTime();
      expect((end - begin) < 5000).assertTrue();
      done()
    })

    /**
     * @tc.name   testParseSendable0152
     * @tc.number SUB_JSON_PARSE_SENDABLE_5200
     * @tc.desc   Test inline duplicate key with changing value types uses the last value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0152";
      try {
        let parsed = JSON.parseSendable('{"0":"str","0":42,"0":true,"0":null}') as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(record['0']).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0153
     * @tc.number SUB_JSON_PARSE_SENDABLE_5300
     * @tc.desc   Test three consecutive duplicate keys use the last value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0153";
      try {
        let parsed = JSON.parseSendable('{"0":1,"0":2,"0":3}') as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(record['0']).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0154
     * @tc.number SUB_JSON_PARSE_SENDABLE_5400
     * @tc.desc   Test interleaved duplicate keys use the last value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0154";
      try {
        let parsed = JSON.parseSendable('{"0":1,"a":2,"0":3,"b":4,"0":5}') as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(record['0']).assertEqual(5);
        expect(record['a']).assertEqual(2);
        expect(record['b']).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0155
     * @tc.number SUB_JSON_PARSE_SENDABLE_5500
     * @tc.desc   Test dict mode duplicate key with changing value types uses the last value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0155";
      try {
        let props: string[] = [];
        for (let i = 0; i < 85; i++) {
          props.push(`"k${i}":${i}`);
        }
        props.push('"dup":"str","dup":42,"dup":true');
        let parsed = JSON.parseSendable(`{${props.join(',')}}`) as lang.ISendable;
        let record: Record<string, Object> = parsed as Record<string, Object>;
        expect(record['dup']).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0156
     * @tc.number SUB_JSON_PARSE_SENDABLE_5600
     * @tc.desc   Test duplicate key enumeration position is the first occurrence.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0156";
      try {
        let inlineParsed = JSON.parseSendable('{"a":1,"b":2,"a":3}') as lang.ISendable;
        let inlineKeys: string[] = Object.keys(inlineParsed as Record<string, Object>);
        expect(inlineKeys[0]).assertEqual('a');
        expect(inlineKeys[1]).assertEqual('b');

        let props: string[] = ['"head":0'];
        for (let i = 0; i < 85; i++) {
          props.push(`"k${i}":${i}`);
        }
        props.push('"dup":1,"tail":2,"dup":3');
        let dictParsed = JSON.parseSendable(`{${props.join(',')}}`) as lang.ISendable;
        let dictKeys: string[] = Object.keys(dictParsed as Record<string, Object>);
        expect((dictParsed as Record<string, Object>)['dup']).assertEqual(3);
        expect(dictKeys.indexOf('dup') < dictKeys.indexOf('tail')).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0159
     * @tc.number SUB_JSON_PARSE_SENDABLE_5900
     * @tc.desc   Test MAP mode parseSendable then stringify round-trip.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = "testParseSendable0159";
      try {
        let options: JSON.ParseOptions = {
          bigIntMode: JSON.BigIntMode.DEFAULT,
          parseReturnType: JSON.ParseReturnType.MAP,
        }
        let map = JSON.parseSendable('{"a":1,"b":2}', undefined, options) as collections.Map<string, number>;
        expect(map.size).assertEqual(2);
        let plain: Record<string, Object> = {};
        map.forEach((value: number, key: string) => {
          plain[key] = value;
        });
        let restored: string = JSON.stringify(plain);
        let reparsed: Record<string, Object> = JSON.parse(restored) as Record<string, Object>;
        expect(reparsed['a']).assertEqual(1);
        expect(reparsed['b']).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testParseSendable0160
     * @tc.number SUB_JSON_PARSE_SENDABLE_6000
     * @tc.desc   Test empty object boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let empty = JSON.parseSendable("{}") as RootRecord;
      expect(Object.keys(empty).length).assertEqual(0);
      expect(ArkTSUtils.isSendable(empty)).assertEqual(true);
      expect((empty as object)?.["any"] === undefined).assertTrue();
      done()
    })

    /**
     * @tc.name   testParseSendable0161
     * @tc.number SUB_JSON_PARSE_SENDABLE_6100
     * @tc.desc   Test empty array boundary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let arr = JSON.parseSendable("[]") as Array<Object>;
      expect(arr.length).assertEqual(0);
      expect(ArkTSUtils.isSendable(arr)).assertEqual(true);
      done()
    })

    /**
     * @tc.name   testParseSendable0162
     * @tc.number SUB_JSON_PARSE_SENDABLE_6200
     * @tc.desc   Test top-level leaf values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0162", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let s = JSON.parseSendable("\"string\"") as string;
      expect(s).assertEqual("string");
      let n = JSON.parseSendable("42") as number;
      expect(n).assertEqual(42);
      let t = JSON.parseSendable("true") as boolean;
      expect(t).assertEqual(true);
      let f = JSON.parseSendable("false") as boolean;
      expect(f).assertEqual(false);
      let nu = JSON.parseSendable("null");
      expect(nu).assertEqual(null);
      done()
    })

    /**
     * @tc.name   testParseSendable0163
     * @tc.number SUB_JSON_PARSE_SENDABLE_6300
     * @tc.desc   Test top-level big integer parsed as BigInt.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0163", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let options: JSON.ParseOptions = {
        bigIntMode: JSON.BigIntMode.ALWAYS_PARSE_AS_BIGINT,
        parseReturnType: JSON.ParseReturnType.OBJECT,
      };
      let bi = JSON.parseSendable("{\"0\":9007199254740993}", undefined, options) as RootRecord;
      expect((bi as object)?.["0"] as bigint).assertEqual(9007199254740993n);
      expect(ArkTSUtils.isSendable(bi)).assertEqual(true);
      done()
    })

    /**
     * @tc.name   testParseSendable0164
     * @tc.number SUB_JSON_PARSE_SENDABLE_6400
     * @tc.desc   Test multiple illegal JSON variants and edge inputs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testParseSendable0164", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let illegal: string[] = ["", "{\"a\":1", "{\"a\":1,}", "{\"a\" 1}"];
      for (let i = 0; i < illegal.length; i++) {
        let threw: boolean = false;
        try {
          JSON.parseSendable(illegal[i]);
        } catch (err) {
          threw = true;
          expect((err as Error).name).assertEqual("SyntaxError");
        }
        expect(threw).assertTrue();
      }
      let deep = JSON.parseSendable("[[[[1]]]]") as collections.Array<collections.Array<collections.Array<collections.Array<number>>>>;
      let l1 = deep.at(0) as collections.Array<collections.Array<collections.Array<number>>>;
      let l2 = l1.at(0) as collections.Array<collections.Array<number>>;
      let l3 = l2.at(0) as collections.Array<number>;
      let l4 = l3.at(0) as number;
      expect(l4).assertEqual(1);
      let nullKey = JSON.parseSendable("{\"\\u0000\":1}") as RootRecord;
      expect((nullKey as object)?.["\u0000"]).assertEqual(1);
      done()
    })
  })
}