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

export default function arkTSUtilsIsSendableTest() {
  describe('arkTSUtilsIsSendableTest', () => {

    /**
     * @tc.name   testISendable0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_5300
     * @tc.desc   Test the function of the interface ISendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testISendable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testISendable0001";
      try {
        type ISendable = lang.ISendable;
        let jsonText = '{"name": "John", "age": 30, "city": "ChongQing"}';
        let obj = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        expect((obj as object)?.["name"]).assertEqual('John');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0001
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_7900
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0001";
      try {
        let value: [] = [];
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0002
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8000
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0002";
      try {
        let value = null;
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0003
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8100
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0003";
      try {
        let value = undefined;
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0004
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8200
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0004";
      try {
        let value: number = 1;
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0005
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8300
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0005";
      try {
        let value: boolean = false;
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0006
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8400
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0006";
      try {
        let value: bigint = 1n;
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0007
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8500
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0007";
      try {
        let value: Date = new Date();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0008
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8600
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0008";
      try {
        let value: String = '1';
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0009
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8700
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0009";
      try {
        let value: RegExp = /1/g;
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0010
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8800
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0010";
      try {
        let value: Array<string> = new Array()
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0011
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_8900
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0011";
      try {
        let value: Map<string, string> = new Map()
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0012
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9000
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0012";
      try {
        let value: Set<string> = new Set();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0013
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9100
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0013";
      try {
        interface Object {
          a: 1,
          b: 2
        };
        let value: Object = {
          a: 1, b: 2
        };
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0014
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9200
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0014";
      try {
        let value: Object = new Object();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0015
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9300
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0015";
      try {
        let value: ArrayBuffer = new ArrayBuffer(1);
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0016
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9400
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0016";
      try {
        let value: Int8Array = new Int8Array();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0017
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9500
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0017";
      try {
        let value: Uint8Array = new Uint8Array();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0018
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9600
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0018";
      try {
        let value: Uint8ClampedArray = new Uint8ClampedArray();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0019
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9700
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0019";
      try {
        let value: Int16Array = new Int16Array();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0020
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9800
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0020";
      try {
        let value: Uint16Array = new Uint16Array()
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0021
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_9900
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0021";
      try {
        let value: Int32Array = new Int32Array();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0022
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10000
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0022";
      try {
        let value: Uint32Array = new Uint32Array();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0023
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10100
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0023";
      try {
        let value: Float32Array = new Float32Array();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0024
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10200
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0024";
      try {
        let value: Float64Array = new Float64Array();
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0025
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10300
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0025";
      try {
        let value: Function = () => {
        };
        expect(ArkTSUtils.isSendable(value)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0026
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10400
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0026";
      try {
        let value = new NumClass()
        expect(ArkTSUtils.isSendable(value.GetA())).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail()
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0027
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10500
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0027";
      try {
        let value = new NumClass();
        expect(ArkTSUtils.isSendable(value.a)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0028
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10600
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0028";
      try {
        expect(ArkTSUtils.isSendable(NumClass.GetB())).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0029
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10700
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0029";
      try {
        expect(ArkTSUtils.isSendable(NumClass.b)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0030
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10800
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0030";
      try {
        let value: collections.ConcatArray<string> = new collections.Array();
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0031
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_10900
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0031";
      try {
        let value: collections.Array<string> = new collections.Array();
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0032
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11000
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0032";
      try {
        let value: collections.Map<string, string> = new collections.Map();
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0033
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11100
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0033";
      try {
        let value: collections.Set<string> = new collections.Set();
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0034
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11200
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0034";
      try {
        let value: collections.BitVector = new collections.BitVector(1);
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0035
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11300
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0035";
      try {
        let value: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0036
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11400
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0036";
      try {
        let sendableClass: SendableClass = new SendableClass();
        expect(ArkTSUtils.isSendable(sendableClass.count_)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0037
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11500
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0037";
      try {
        let sendableClass: SendableClass = new SendableClass();
        expect(ArkTSUtils.isSendable(sendableClass.getCount_())).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0038
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11600
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0038";
      try {
        let sendableClass: SendableClass = new SendableClass();
        expect(ArkTSUtils.isSendable(sendableClass)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0039
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11700
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0039";
      try {
        let sendableClass: SendableClass = new SendableClass();
        expect(ArkTSUtils.isSendable(typeof sendableClass)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0040
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11800
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0040";
      try {
        expect(ArkTSUtils.isSendable(SendableClass.count)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0041
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_11900
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0041";
      try {
        expect(ArkTSUtils.isSendable(SendableClass.getCount())).assertEqual(true);
        expect(ArkTSUtils.isSendable(SendableClass.getPromiseCount())).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0042
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_12000
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0042";
      try {
        type ISendable = lang.ISendable;
        let jsonText = '{"name": "John", "age": 30, "city": "ChongQing"}';
        let value = ArkTSUtils.ASON.parse(jsonText) as ISendable;
        expect(ArkTSUtils.isSendable(value)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   testIsSendable0043
     * @tc.number SUB_RUNTIME_LANGUAGE_BACKEND_ARK_TS_UTILS_12100
     * @tc.desc   Test the function of the interface IsSendable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendable0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testIsSendable0043";
      try {
        expect(ArkTSUtils.isSendable(sendableFunction)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
      done()
    })
  })
}