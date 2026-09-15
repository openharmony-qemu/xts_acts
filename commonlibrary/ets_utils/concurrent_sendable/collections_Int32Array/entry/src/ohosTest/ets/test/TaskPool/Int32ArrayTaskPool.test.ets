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
  testInt32ArrayTaskPool0001,
  testInt32ArrayTaskPool0002,
  testInt32ArrayTaskPool0003,
  testInt32ArrayTaskPool0004,
  testInt32ArrayTaskPool0005,
  testInt32ArrayTaskPool0006,
  testInt32ArrayTaskPool0007,
  testInt32ArrayTaskPool0008,
  testInt32ArrayTaskPool0009,
  testInt32ArrayTaskPool0010,
  testInt32ArrayTaskPool0011,
  testInt32ArrayTaskPool0012,
  testInt32ArrayTaskPool0013,
  testInt32ArrayTaskPool0014,
  testInt32ArrayTaskPool0015,
  testInt32ArrayTaskPool0016,
  testInt32ArrayTaskPool0017,
  testInt32ArrayTaskPool0018,
  testInt32ArrayTaskPool0019,
  testInt32ArrayTaskPool0020,
  testInt32ArrayTaskPool0021,
  testInt32ArrayTaskPool0022,
  testInt32ArrayTaskPool0023,
  testInt32ArrayTaskPool0024,
  testInt32ArrayTaskPool0025,
  testInt32ArrayTaskPool0026,
  testInt32ArrayTaskPool0027,
  testInt32ArrayTaskPool0028,
  testInt32ArrayTaskPool0029,
  testInt32ArrayTaskPool0030,
  testInt32ArrayTaskPool0031,
  testInt32ArrayTaskPool0032,
  testInt32ArrayTaskPool0033,
  testInt32ArrayTaskPool0034,
  testInt32ArrayTaskPool0035,
  testInt32ArrayTaskPool0036,
  testInt32ArrayTaskPool0037,
  testInt32ArrayTaskPool0038,
  testInt32ArrayTaskPool0039,
  testInt32ArrayTaskPool0040,
  testInt32ArrayTaskPool0041,
  testInt32ArrayTaskPool0042,
  testInt32ArrayTaskPool0043,
  testInt32ArrayTaskPool0044,
  testInt32ArrayTaskPool0045,
  testInt32ArrayTaskPool0046,
  testInt32ArrayTaskPool0047,
  testInt32ArrayTaskPool0048,
  testInt32ArrayTaskPool0049,
  testInt32ArrayTaskPool0050,
  testInt32ArrayTaskPool0051,
  testInt32ArrayTaskPool0052,
  testInt32ArrayTaskPool0053,
  testInt32ArrayTaskPool0054,
  testInt32ArrayTaskPool0055,
  testInt32ArrayTaskPool0056,
  testInt32ArrayTaskPool0057,
  testInt32ArrayTaskPool0058,
  testInt32ArrayTaskPool0059,
  testInt32ArrayTaskPool0060,
  testInt32ArrayTaskPool0061,
  testInt32ArrayTaskPool0062,
  testInt32ArrayTaskPool0063,
  testInt32ArrayTaskPool0064,
  testInt32ArrayTaskPool0065,
  testInt32ArrayTaskPool0066,
  testInt32ArrayTaskPool0067,
  testInt32ArrayTaskPool0068,
  testInt32ArrayTaskPool0069,
  testInt32ArrayTaskPool0070,
  testInt32ArrayTaskPool0071,
  testInt32ArrayTaskPool0072,
  testInt32ArrayTaskPool0073,
  testInt32ArrayTaskPool0074,
  testInt32ArrayTaskPool0075,
  testInt32ArrayTaskPool0076,
  testInt32ArrayTaskPool0077,
  testInt32ArrayTaskPool0078,
  testInt32ArrayTaskPool0079,
  testInt32ArrayTaskPool0080,
  testInt32ArrayTaskPool0081,
  testInt32ArrayTaskPool0082,
  testInt32ArrayTaskPool0083,
  testInt32ArrayTaskPool0084,
  testInt32ArrayTaskPool0085,
  testInt32ArrayTaskPool0086,
  testInt32ArrayTaskPool0087,
  testInt32ArrayTaskPool0088,
  testInt32ArrayTaskPool0089,
  testInt32ArrayTaskPool0090,
  testInt32ArrayTaskPool0091,
  testInt32ArrayTaskPool0092,
  testInt32ArrayTaskPool0093,
  testInt32ArrayTaskPool0094,
  testInt32ArrayTaskPool0095,
  testInt32ArrayTaskPool0096,
  testInt32ArrayTaskPool0097,
  testInt32ArrayTaskPool0098,
  testInt32ArrayTaskPool0099,
  testInt32ArrayTaskPool0100,
  testInt32ArrayTaskPool0101,
  testInt32ArrayTaskPool0102,
  testInt32ArrayTaskPool0103,
  testInt32ArrayTaskPool0104,
  testInt32ArrayTaskPool0105,
  testInt32ArrayTaskPool0106,
  testInt32ArrayTaskPool0107,
  testInt32ArrayTaskPool0108,
  testInt32ArrayTaskPool0109,
  testInt32ArrayTaskPool0110,
  testInt32ArrayTaskPool0111,
  testInt32ArrayTaskPool0112,
  testInt32ArrayTaskPool0113,
  testInt32ArrayTaskPool0114,
  testInt32ArrayTaskPool0115,
  testInt32ArrayTaskPool0116,
  testInt32ArrayTaskPool0117,
  testInt32ArrayTaskPool0118,
  testInt32ArrayTaskPool0119,
  testInt32ArrayTaskPool0120,
  testInt32ArrayTaskPool0121,
  testInt32ArrayTaskPool0122,
  testInt32ArrayTaskPool0123,
  testInt32ArrayTaskPool0124,
  testInt32ArrayTaskPool0125,
  testInt32ArrayTaskPool0126,
  testInt32ArrayTaskPool0127,
  testInt32ArrayTaskPool0128,
  testInt32ArrayTaskPool0129,
  testInt32ArrayTaskPool0130,
  testInt32ArrayTaskPool0131,
  testInt32ArrayTaskPool0132,
  testInt32ArrayTaskPool0133,
  testInt32ArrayTaskPool0134,
  testInt32ArrayTaskPool0135,
  testInt32ArrayTaskPool0136,
  testInt32ArrayTaskPool0137,
  testInt32ArrayTaskPool0138,
  testInt32ArrayTaskPool0139,
  testInt32ArrayTaskPool0140,
  testInt32ArrayTaskPool0141,
  testInt32ArrayTaskPool0142,
  testInt32ArrayTaskPool0143,
  testInt32ArrayTaskPool0144,
  testInt32ArrayTaskPool0145,
  testInt32ArrayTaskPool0146,
  testInt32ArrayTaskPool0147,
  testInt32ArrayTaskPool0148,
  testInt32ArrayTaskPool0149,
  testInt32ArrayTaskPool0150,
  testInt32ArrayTaskPool0151,
  testInt32ArrayTaskPool0152,
  testInt32ArrayTaskPool0153,
  testInt32ArrayTaskPool0154,
  testInt32ArrayTaskPool0155,
  testInt32ArrayTaskPool0156,
  testInt32ArrayTaskPool0157,
  testInt32ArrayTaskPool0158,
  testInt32ArrayTaskPool0159,
  testInt32ArrayTaskPool0160,
  testInt32ArrayTaskPool0161,
  testInt32ArrayTaskPool0162,
  testInt32ArrayTaskPool0163,
  testInt32ArrayTaskPool0164,
  testInt32ArrayTaskPool0165,
  testInt32ArrayTaskPool0166,
  testInt32ArrayTaskPool0167,
  testInt32ArrayTaskPool0168,
  testInt32ArrayTaskPool0169,
  testInt32ArrayTaskPool0170,
  testInt32ArrayTaskPool0171,
  testInt32ArrayTaskPool0172,
  testInt32ArrayTaskPool0173,
  testInt32ArrayTaskPool0174,
  testInt32ArrayTaskPool0175,
  testInt32ArrayTaskPool0176,
  testInt32ArrayTaskPool0177,
  testInt32ArrayTaskPool0178,
  testInt32ArrayTaskPool0179,
  testInt32ArrayTaskPool0180,
  testInt32ArrayTaskPool0181,
  testInt32ArrayTaskPool0182,
  testInt32ArrayTaskPool0183,
  testInt32ArrayTaskPool0184,
  testInt32ArrayTaskPool0185,
  testInt32ArrayTaskPool0186,
  testInt32ArrayTaskPool0187,
} from './int32Array_function';

export default function Int32ArrayTaskPoolTest() {
  describe('Int32ArrayTaskPoolTest', () => {
    /**
     * @tc.name   testInt32ArrayTaskPool0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0001
     * @tc.desc   Testing the iterative ability of Int32Array using a for loop in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0001).then((value) => {
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
     * @tc.name   testInt32ArrayTaskPool0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0002
     * @tc.desc   Testing the iterative ability of Int32Array using ... deconstruction in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0002).then((value) => {
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
     * @tc.name   testInt32ArrayTaskPool0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0003
     * @tc.desc   Testing create an empty ArkTS TypedArray object with Int32Array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0003).then((value) => {
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
     * @tc.name   testInt32ArrayTaskPool0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0004
     * @tc.desc   Testing creation of ArkTS TypedArray object with invalid size in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0004).then((value) => {
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
     * @tc.name   testInt32ArrayTaskPool0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0005
     * @tc.desc   Testing ArrayLength constructs 0 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0005).then((value) => {
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
     * @tc.name   testInt32ArrayTaskPool0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0006
     * @tc.desc   Testing ArrayLength constructs 10 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0006).then((value) => {
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
     * @tc.name   testInt32ArrayTaskPool0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0007
     * @tc.desc   Testing ArrayLength constructs 100000 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0007';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0007).then((value) => {
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
     * @tc.name   testInt32ArrayTaskPool0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0008
     * @tc.desc   Testing construct an object from an ArrayLike in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0008';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0008).then((value) => {
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
     * @tc.name   testInt32ArrayTaskPool0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0009
     * @tc.desc   Testing construct an object from an ArrayBuffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0009';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0009).then((value) => {
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
     * @tc.name   testInt32ArrayTaskPool0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0010
     * @tc.desc   Testing construct an object from another ArkTS TypedArray in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0010';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0010).then((value) => {
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
     * @tc.name   testInt32ArrayTaskPool0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0011
     * @tc.desc   Testing create an ArrayBuffer with an empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0011';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0011).then((value) => {
            num++;
            expect(value).assertEqual('');
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
     * @tc.name   testInt32ArrayTaskPool0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0012
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0012';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0012).then((value) => {
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
     * @tc.name   testInt32ArrayTaskPool0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0013
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0013';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0013).then((value) => {
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
     * @tc.name   testInt32ArrayTaskPool0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0014
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0014';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0014).then((value) => {
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
     * @tc.name   testInt32ArrayTaskPool0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0015
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0015';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0015).then((value) => {
            num++;
            expect(value).assertEqual('');
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
     * @tc.name   testInt32ArrayTaskPool0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0016
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0016';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0016).then((value) => {
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
     * @tc.name   testInt32ArrayTaskPool0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0017
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0017';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0017).then((value) => {
            num++;
            expect(value).assertEqual('1,2');
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
     * @tc.name   testInt32ArrayTaskPool0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0018
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0018';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0018).then((value) => {
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
     * @tc.name   testInt32ArrayTaskPool0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0019
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0019';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0019).then((value) => {
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
     * @tc.name   testInt32ArrayTaskPool0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0020
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0020';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0020).then((value) => {
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
     * @tc.name   testInt32ArrayTaskPool0021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0021
     * @tc.desc   Testing the 'from' interface with an array-like structure [1, 3, 5] in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0021';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0021).then((value) => {
            num++;
            expect(value).assertEqual('1,3,5');
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
     * @tc.name   testInt32ArrayTaskPool0022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0022
     * @tc.desc   Testing the 'from' interface with an array-like structure [] in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0022';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0022).then((value) => {
            num++;
            expect(value).assertEqual('');
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
     * @tc.name   testInt32ArrayTaskPool0023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0023
     * @tc.desc   Testing the array-like map function created from an object in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0023';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0023).then((value) => {
            num++;
            expect(value).assertEqual('0,1,2,3,4');
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
     * @tc.name   testInt32ArrayTaskPool0024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0024
     * @tc.desc   Testing the array-like map function created from a character array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0024';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0024).then((value) => {
            num++;
            expect(value).assertEqual('1,3,5');
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
     * @tc.name   testInt32ArrayTaskPool0025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0025
     * @tc.desc   Testing the array-like map function created from a string in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0025';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0025).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5');
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
     * @tc.name   testInt32ArrayTaskPool0026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0026
     * @tc.desc   Testing the array-like map function created from a num array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0026';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0026).then((value) => {
            num++;
            expect(value).assertEqual('1,3,5');
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
     * @tc.name   testInt32ArrayTaskPool0027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0027
     * @tc.desc   Testing the array-like map function created from a nesting array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0027';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0027).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6');
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
     * @tc.name   testInt32ArrayTaskPool0028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0028
     * @tc.desc   Testing the array-like map function without specifying a mapping function in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0028';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0028).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3');
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
     * @tc.name   testInt32ArrayTaskPool0029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0029
     * @tc.desc   Testing the array-like map function with specifying a mapping function in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0029';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0029).then((value) => {
            num++;
            expect(value).assertEqual('1,3,5');
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
     * @tc.name   testInt32ArrayTaskPool0030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0030
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0030';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0030).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,2,3,6,7,8');
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
     * @tc.name   testInt32ArrayTaskPool0031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0031
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0031';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0031).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
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
     * @tc.name   testInt32ArrayTaskPool0032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0032
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0032';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0032).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,1');
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
     * @tc.name   testInt32ArrayTaskPool0033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0033
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0033';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0033).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
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
     * @tc.name   testInt32ArrayTaskPool0034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0034
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0034';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0034).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,1');
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
     * @tc.name   testInt32ArrayTaskPool0035
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0035
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0035';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0035).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,1');
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
     * @tc.name   testInt32ArrayTaskPool0036
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0036
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0036';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0036).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,3');
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
     * @tc.name   testInt32ArrayTaskPool0037
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0037
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0037';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0037).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
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
     * @tc.name   testInt32ArrayTaskPool0038
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0038
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0038';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0038).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
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
     * @tc.name   testInt32ArrayTaskPool0039
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0039
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0039';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0039).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,3');
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
     * @tc.name   testInt32ArrayTaskPool0040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0040
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0040';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0040).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
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
     * @tc.name   testInt32ArrayTaskPool0041
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0041
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0041';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0041).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
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
     * @tc.name   testInt32ArrayTaskPool0042
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT32_ARRAY_TASKPOOL_0042
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt32ArrayTaskPool0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt32ArrayTaskPool0042';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt32ArrayTaskPool0042).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
