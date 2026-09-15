/*
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
import { collections, taskpool } from '@kit.ArkTS';
import {
  sleep,
  testInt8ArrayTaskPool0001,
  testInt8ArrayTaskPool0002,
  testInt8ArrayTaskPool0003,
  testInt8ArrayTaskPool0004,
  testInt8ArrayTaskPool0005,
  testInt8ArrayTaskPool0006,
  testInt8ArrayTaskPool0007,
  testInt8ArrayTaskPool0008,
  testInt8ArrayTaskPool0009,
  testInt8ArrayTaskPool0010,
  testInt8ArrayTaskPool0011,
  testInt8ArrayTaskPool0012,
  testInt8ArrayTaskPool0013,
  testInt8ArrayTaskPool0014,
  testInt8ArrayTaskPool0015,
  testInt8ArrayTaskPool0016,
  testInt8ArrayTaskPool0017,
  testInt8ArrayTaskPool0018,
  testInt8ArrayTaskPool0019,
  testInt8ArrayTaskPool0020,
  testInt8ArrayTaskPool0021,
  testInt8ArrayTaskPool0022,
  testInt8ArrayTaskPool0023,
  testInt8ArrayTaskPool0024,
  testInt8ArrayTaskPool0025,
  testInt8ArrayTaskPool0026,
  testInt8ArrayTaskPool0027,
  testInt8ArrayTaskPool0028,
  testInt8ArrayTaskPool0029,
  testInt8ArrayTaskPool0030,
  testInt8ArrayTaskPool0031,
  testInt8ArrayTaskPool0032,
  testInt8ArrayTaskPool0033,
  testInt8ArrayTaskPool0034,
  testInt8ArrayTaskPool0035,
  testInt8ArrayTaskPool0036,
  testInt8ArrayTaskPool0037,
  testInt8ArrayTaskPool0038,
  testInt8ArrayTaskPool0039,
  testInt8ArrayTaskPool0040,
  testInt8ArrayTaskPool0041,
  testInt8ArrayTaskPool0042,
  testInt8ArrayTaskPool0043,
  testInt8ArrayTaskPool0044,
  testInt8ArrayTaskPool0045,
  testInt8ArrayTaskPool0046,
  testInt8ArrayTaskPool0047,
  testInt8ArrayTaskPool0048,
  testInt8ArrayTaskPool0049,
  testInt8ArrayTaskPool0050,
  testInt8ArrayTaskPool0051,
  testInt8ArrayTaskPool0052,
  testInt8ArrayTaskPool0053,
  testInt8ArrayTaskPool0054,
  testInt8ArrayTaskPool0055,
  testInt8ArrayTaskPool0056,
  testInt8ArrayTaskPool0057,
  testInt8ArrayTaskPool0058,
  testInt8ArrayTaskPool0059,
  testInt8ArrayTaskPool0060,
  testInt8ArrayTaskPool0061,
  testInt8ArrayTaskPool0062,
  testInt8ArrayTaskPool0063,
  testInt8ArrayTaskPool0064,
  testInt8ArrayTaskPool0065,
  testInt8ArrayTaskPool0066,
  testInt8ArrayTaskPool0067,
  testInt8ArrayTaskPool0068,
  testInt8ArrayTaskPool0069,
  testInt8ArrayTaskPool0070,
  testInt8ArrayTaskPool0071,
  testInt8ArrayTaskPool0072,
  testInt8ArrayTaskPool0073,
  testInt8ArrayTaskPool0074,
  testInt8ArrayTaskPool0075,
  testInt8ArrayTaskPool0076,
  testInt8ArrayTaskPool0077,
  testInt8ArrayTaskPool0078,
  testInt8ArrayTaskPool0079,
  testInt8ArrayTaskPool0080,
  testInt8ArrayTaskPool0081,
  testInt8ArrayTaskPool0082,
  testInt8ArrayTaskPool0083,
  testInt8ArrayTaskPool0084,
  testInt8ArrayTaskPool0085,
  testInt8ArrayTaskPool0086,
  testInt8ArrayTaskPool0087,
  testInt8ArrayTaskPool0088,
  testInt8ArrayTaskPool0089,
  testInt8ArrayTaskPool0090,
  testInt8ArrayTaskPool0091,
  testInt8ArrayTaskPool0092,
  testInt8ArrayTaskPool0093,
  testInt8ArrayTaskPool0094,
  testInt8ArrayTaskPool0095,
  testInt8ArrayTaskPool0096,
  testInt8ArrayTaskPool0097,
  testInt8ArrayTaskPool0098,
  testInt8ArrayTaskPool0099,
  testInt8ArrayTaskPool0100,
  testInt8ArrayTaskPool0101,
  testInt8ArrayTaskPool0102,
  testInt8ArrayTaskPool0103,
  testInt8ArrayTaskPool0104,
  testInt8ArrayTaskPool0105,
  testInt8ArrayTaskPool0106,
  testInt8ArrayTaskPool0107,
  testInt8ArrayTaskPool0108,
  testInt8ArrayTaskPool0109,
  testInt8ArrayTaskPool0110,
  testInt8ArrayTaskPool0111,
  testInt8ArrayTaskPool0112,
  testInt8ArrayTaskPool0113,
  testInt8ArrayTaskPool0114,
  testInt8ArrayTaskPool0115,
  testInt8ArrayTaskPool0116,
  testInt8ArrayTaskPool0117,
  testInt8ArrayTaskPool0118,
  testInt8ArrayTaskPool0119,
  testInt8ArrayTaskPool0120,
  testInt8ArrayTaskPool0121,
  testInt8ArrayTaskPool0122,
  testInt8ArrayTaskPool0123,
  testInt8ArrayTaskPool0124,
  testInt8ArrayTaskPool0125,
  testInt8ArrayTaskPool0126,
  testInt8ArrayTaskPool0127,
  testInt8ArrayTaskPool0128,
  testInt8ArrayTaskPool0129,
  testInt8ArrayTaskPool0130,
  testInt8ArrayTaskPool0131,
  testInt8ArrayTaskPool0132,
  testInt8ArrayTaskPool0133,
  testInt8ArrayTaskPool0134,
  testInt8ArrayTaskPool0135,
  testInt8ArrayTaskPool0136,
  testInt8ArrayTaskPool0137,
  testInt8ArrayTaskPool0138,
  testInt8ArrayTaskPool0139,
  testInt8ArrayTaskPool0140,
  testInt8ArrayTaskPool0141,
  testInt8ArrayTaskPool0142,
  testInt8ArrayTaskPool0143,
  testInt8ArrayTaskPool0144,
  testInt8ArrayTaskPool0145,
  testInt8ArrayTaskPool0146,
  testInt8ArrayTaskPool0147,
  testInt8ArrayTaskPool0148,
  testInt8ArrayTaskPool0149,
  testInt8ArrayTaskPool0150,
  testInt8ArrayTaskPool0151,
  testInt8ArrayTaskPool0152,
  testInt8ArrayTaskPool0153,
  testInt8ArrayTaskPool0154,
  testInt8ArrayTaskPool0155,
  testInt8ArrayTaskPool0156,
  testInt8ArrayTaskPool0157,
  testInt8ArrayTaskPool0158,
  testInt8ArrayTaskPool0159,
  testInt8ArrayTaskPool0160,
  testInt8ArrayTaskPool0161,
  testInt8ArrayTaskPool0162,
  testInt8ArrayTaskPool0163,
  testInt8ArrayTaskPool0164,
  testInt8ArrayTaskPool0165,
  testInt8ArrayTaskPool0166,
  testInt8ArrayTaskPool0167,
  testInt8ArrayTaskPool0168,
  testInt8ArrayTaskPool0169,
  testInt8ArrayTaskPool0170,
  testInt8ArrayTaskPool0171,
  testInt8ArrayTaskPool0172,
  testInt8ArrayTaskPool0173,
  testInt8ArrayTaskPool0174,
  testInt8ArrayTaskPool0175,
  testInt8ArrayTaskPool0176,
  testInt8ArrayTaskPool0177,
  testInt8ArrayTaskPool0178,
  testInt8ArrayTaskPool0179,
  testInt8ArrayTaskPool0180,
  testInt8ArrayTaskPool0181,
  testInt8ArrayTaskPool0182,
  testInt8ArrayTaskPool0183,
  testInt8ArrayTaskPool0184,
  testInt8ArrayTaskPool0185,
  testInt8ArrayTaskPool0186,
  testInt8ArrayTaskPool0187,
} from './int8Array_function';

export default function Int8ArrayTaskPoolTest() {
  describe('Int8ArrayTaskPoolTest', () => {
    /**
     * @tc.name   testInt8ArrayTaskPool0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_TASKPOOL_0001
     * @tc.desc   Testing the iterative ability of Int8Array using a for loop in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayTaskPool0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt8ArrayTaskPool0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt8ArrayTaskPool0001).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8,9,10');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt8ArrayTaskPool0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_TASKPOOL_0002
     * @tc.desc   Testing the iterative ability of Int8Array using ... deconstruction in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayTaskPool0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt8ArrayTaskPool0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt8ArrayTaskPool0002).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8,9,10');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt8ArrayTaskPool0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_TASKPOOL_0003
     * @tc.desc   Testing create an empty ArkTS TypedArray object with Int8Array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayTaskPool0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt8ArrayTaskPool0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt8ArrayTaskPool0003).then((value) => {
            num++;
            expect(value).assertEqual(true);
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })


    /**
     * @tc.name   testInt8ArrayTaskPool0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_TASKPOOL_0004
     * @tc.desc   Testing creation of ArkTS TypedArray object with invalid size in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayTaskPool0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt8ArrayTaskPool0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt8ArrayTaskPool0004).then((value) => {
            num++;
            expect(value).assertEqual('error');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt8ArrayTaskPool0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_TASKPOOL_0005
     * @tc.desc   Testing ArrayLength constructs 0 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayTaskPool0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt8ArrayTaskPool0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt8ArrayTaskPool0005).then((value) => {
            num++;
            expect(value).assertEqual(0);
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt8ArrayTaskPool0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_TASKPOOL_0006
     * @tc.desc   Testing ArrayLength constructs 10 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayTaskPool0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt8ArrayTaskPool0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt8ArrayTaskPool0006).then((value) => {
            num++;
            expect(value).assertEqual(10);
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt8ArrayTaskPool0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_TASKPOOL_0007
     * @tc.desc   Testing ArrayLength constructs 100000 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayTaskPool0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt8ArrayTaskPool0007';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt8ArrayTaskPool0007).then((value) => {
            num++;
            expect(value).assertEqual(100000);
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt8ArrayTaskPool0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_TASKPOOL_0008
     * @tc.desc   Testing construct an object from an ArrayLike in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayTaskPool0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt8ArrayTaskPool0008';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt8ArrayTaskPool0008).then((value) => {
            num++;
            expect(value).assertEqual(true);
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testInt8ArrayTaskPool0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_TASKPOOL_0009
     * @tc.desc   Testing construct an object from an ArrayBuffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt8ArrayTaskPool0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
