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
  testUint8ClampedArrayTaskPool0001,
  testUint8ClampedArrayTaskPool0002,
  testUint8ClampedArrayTaskPool0003,
  testUint8ClampedArrayTaskPool0004,
  testUint8ClampedArrayTaskPool0005,
  testUint8ClampedArrayTaskPool0006,
  testUint8ClampedArrayTaskPool0007,
  testUint8ClampedArrayTaskPool0008,
  testUint8ClampedArrayTaskPool0009,
  testUint8ClampedArrayTaskPool0010,
  testUint8ClampedArrayTaskPool0011,
  testUint8ClampedArrayTaskPool0012,
  testUint8ClampedArrayTaskPool0013,
  testUint8ClampedArrayTaskPool0014,
  testUint8ClampedArrayTaskPool0015,
  testUint8ClampedArrayTaskPool0016,
  testUint8ClampedArrayTaskPool0017,
  testUint8ClampedArrayTaskPool0018,
  testUint8ClampedArrayTaskPool0019,
  testUint8ClampedArrayTaskPool0020,
  testUint8ClampedArrayTaskPool0021,
  testUint8ClampedArrayTaskPool0022,
  testUint8ClampedArrayTaskPool0023,
  testUint8ClampedArrayTaskPool0024,
  testUint8ClampedArrayTaskPool0025,
  testUint8ClampedArrayTaskPool0026,
  testUint8ClampedArrayTaskPool0027,
  testUint8ClampedArrayTaskPool0028,
  testUint8ClampedArrayTaskPool0029,
  testUint8ClampedArrayTaskPool0030,
  testUint8ClampedArrayTaskPool0031,
  testUint8ClampedArrayTaskPool0032,
  testUint8ClampedArrayTaskPool0033,
  testUint8ClampedArrayTaskPool0034,
  testUint8ClampedArrayTaskPool0035,
  testUint8ClampedArrayTaskPool0036,
  testUint8ClampedArrayTaskPool0037,
  testUint8ClampedArrayTaskPool0038,
  testUint8ClampedArrayTaskPool0039,
  testUint8ClampedArrayTaskPool0040,
  testUint8ClampedArrayTaskPool0041,
  testUint8ClampedArrayTaskPool0042,
  testUint8ClampedArrayTaskPool0043,
  testUint8ClampedArrayTaskPool0044,
  testUint8ClampedArrayTaskPool0045,
  testUint8ClampedArrayTaskPool0046,
  testUint8ClampedArrayTaskPool0047,
  testUint8ClampedArrayTaskPool0048,
  testUint8ClampedArrayTaskPool0049,
  testUint8ClampedArrayTaskPool0050,
  testUint8ClampedArrayTaskPool0051,
  testUint8ClampedArrayTaskPool0052,
  testUint8ClampedArrayTaskPool0053,
  testUint8ClampedArrayTaskPool0054,
  testUint8ClampedArrayTaskPool0055,
  testUint8ClampedArrayTaskPool0056,
  testUint8ClampedArrayTaskPool0057,
  testUint8ClampedArrayTaskPool0058,
  testUint8ClampedArrayTaskPool0059,
  testUint8ClampedArrayTaskPool0060,
  testUint8ClampedArrayTaskPool0061,
  testUint8ClampedArrayTaskPool0062,
  testUint8ClampedArrayTaskPool0063,
  testUint8ClampedArrayTaskPool0064,
  testUint8ClampedArrayTaskPool0065,
  testUint8ClampedArrayTaskPool0066,
  testUint8ClampedArrayTaskPool0067,
  testUint8ClampedArrayTaskPool0068,
  testUint8ClampedArrayTaskPool0069,
  testUint8ClampedArrayTaskPool0070,
  testUint8ClampedArrayTaskPool0071,
  testUint8ClampedArrayTaskPool0072,
  testUint8ClampedArrayTaskPool0073,
  testUint8ClampedArrayTaskPool0074,
  testUint8ClampedArrayTaskPool0075,
  testUint8ClampedArrayTaskPool0076,
  testUint8ClampedArrayTaskPool0077,
  testUint8ClampedArrayTaskPool0078,
  testUint8ClampedArrayTaskPool0079,
  testUint8ClampedArrayTaskPool0080,
  testUint8ClampedArrayTaskPool0081,
  testUint8ClampedArrayTaskPool0082,
  testUint8ClampedArrayTaskPool0083,
  testUint8ClampedArrayTaskPool0084,
  testUint8ClampedArrayTaskPool0085,
  testUint8ClampedArrayTaskPool0086,
  testUint8ClampedArrayTaskPool0087,
  testUint8ClampedArrayTaskPool0088,
  testUint8ClampedArrayTaskPool0089,
  testUint8ClampedArrayTaskPool0090,
  testUint8ClampedArrayTaskPool0091,
  testUint8ClampedArrayTaskPool0092,
  testUint8ClampedArrayTaskPool0093,
  testUint8ClampedArrayTaskPool0094,
  testUint8ClampedArrayTaskPool0095,
  testUint8ClampedArrayTaskPool0096,
  testUint8ClampedArrayTaskPool0097,
  testUint8ClampedArrayTaskPool0098,
  testUint8ClampedArrayTaskPool0099,
  testUint8ClampedArrayTaskPool0100,
  testUint8ClampedArrayTaskPool0101,
  testUint8ClampedArrayTaskPool0102,
  testUint8ClampedArrayTaskPool0103,
  testUint8ClampedArrayTaskPool0104,
  testUint8ClampedArrayTaskPool0105,
  testUint8ClampedArrayTaskPool0106,
  testUint8ClampedArrayTaskPool0107,
  testUint8ClampedArrayTaskPool0108,
  testUint8ClampedArrayTaskPool0109,
  testUint8ClampedArrayTaskPool0110,
  testUint8ClampedArrayTaskPool0111,
  testUint8ClampedArrayTaskPool0112,
  testUint8ClampedArrayTaskPool0113,
  testUint8ClampedArrayTaskPool0114,
  testUint8ClampedArrayTaskPool0115,
  testUint8ClampedArrayTaskPool0116,
  testUint8ClampedArrayTaskPool0117,
  testUint8ClampedArrayTaskPool0118,
  testUint8ClampedArrayTaskPool0119,
  testUint8ClampedArrayTaskPool0120,
  testUint8ClampedArrayTaskPool0121,
  testUint8ClampedArrayTaskPool0122,
  testUint8ClampedArrayTaskPool0123,
  testUint8ClampedArrayTaskPool0124,
  testUint8ClampedArrayTaskPool0125,
  testUint8ClampedArrayTaskPool0126,
  testUint8ClampedArrayTaskPool0127,
  testUint8ClampedArrayTaskPool0128,
  testUint8ClampedArrayTaskPool0129,
  testUint8ClampedArrayTaskPool0130,
  testUint8ClampedArrayTaskPool0131,
  testUint8ClampedArrayTaskPool0132,
  testUint8ClampedArrayTaskPool0133,
  testUint8ClampedArrayTaskPool0134,
  testUint8ClampedArrayTaskPool0135,
  testUint8ClampedArrayTaskPool0136,
  testUint8ClampedArrayTaskPool0137,
  testUint8ClampedArrayTaskPool0138,
  testUint8ClampedArrayTaskPool0139,
  testUint8ClampedArrayTaskPool0140,
  testUint8ClampedArrayTaskPool0141,
  testUint8ClampedArrayTaskPool0142,
  testUint8ClampedArrayTaskPool0143,
  testUint8ClampedArrayTaskPool0144,
  testUint8ClampedArrayTaskPool0145,
  testUint8ClampedArrayTaskPool0146,
  testUint8ClampedArrayTaskPool0147,
  testUint8ClampedArrayTaskPool0148,
  testUint8ClampedArrayTaskPool0149,
  testUint8ClampedArrayTaskPool0150,
  testUint8ClampedArrayTaskPool0151,
  testUint8ClampedArrayTaskPool0152,
  testUint8ClampedArrayTaskPool0153,
  testUint8ClampedArrayTaskPool0154,
  testUint8ClampedArrayTaskPool0155,
  testUint8ClampedArrayTaskPool0156,
  testUint8ClampedArrayTaskPool0157,
  testUint8ClampedArrayTaskPool0158,
  testUint8ClampedArrayTaskPool0159,
  testUint8ClampedArrayTaskPool0160,
  testUint8ClampedArrayTaskPool0161,
  testUint8ClampedArrayTaskPool0162,
  testUint8ClampedArrayTaskPool0163,
  testUint8ClampedArrayTaskPool0164,
  testUint8ClampedArrayTaskPool0165,
  testUint8ClampedArrayTaskPool0166,
  testUint8ClampedArrayTaskPool0167,
  testUint8ClampedArrayTaskPool0168,
  testUint8ClampedArrayTaskPool0169,
  testUint8ClampedArrayTaskPool0170,
  testUint8ClampedArrayTaskPool0171,
  testUint8ClampedArrayTaskPool0172,
  testUint8ClampedArrayTaskPool0173,
  testUint8ClampedArrayTaskPool0174,
  testUint8ClampedArrayTaskPool0175,
  testUint8ClampedArrayTaskPool0176,
  testUint8ClampedArrayTaskPool0177,
  testUint8ClampedArrayTaskPool0178,
  testUint8ClampedArrayTaskPool0179,
  testUint8ClampedArrayTaskPool0180,
  testUint8ClampedArrayTaskPool0181,
  testUint8ClampedArrayTaskPool0182,
  testUint8ClampedArrayTaskPool0183,
  testUint8ClampedArrayTaskPool0184,
  testUint8ClampedArrayTaskPool0185,
  testUint8ClampedArrayTaskPool0186,
  testUint8ClampedArrayTaskPool0187,
} from './uint8ClampedArray_function';

export default function Uint8ClampedArrayTaskPoolTest() {
  describe('Uint8ClampedArrayTaskPoolTest', () => {
    /**
     * @tc.name   testUint8ClampedArrayTaskPool0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0001
     * @tc.desc   Testing the iterative ability of Uint8ClampedArray using a for loop in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0001).then((value) => {
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
     * @tc.name   testUint8ClampedArrayTaskPool0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0002
     * @tc.desc   Testing the iterative ability of Uint8ClampedArray using ... deconstruction in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0002).then((value) => {
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
     * @tc.name   testUint8ClampedArrayTaskPool0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0003
     * @tc.desc   Testing create an empty ArkTS TypedArray object with Uint8ClampedArray in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0003).then((value) => {
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
     * @tc.name   testUint8ClampedArrayTaskPool0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0004
     * @tc.desc   Testing creation of ArkTS TypedArray object with invalid size in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0004).then((value) => {
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
     * @tc.name   testUint8ClampedArrayTaskPool0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0005
     * @tc.desc   Testing ArrayLength constructs 0 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0005).then((value) => {
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
     * @tc.name   testUint8ClampedArrayTaskPool0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0006
     * @tc.desc   Testing ArrayLength constructs 10 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0006).then((value) => {
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
     * @tc.name   testUint8ClampedArrayTaskPool0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0007
     * @tc.desc   Testing ArrayLength constructs 100000 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0007';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0007).then((value) => {
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
     * @tc.name   testUint8ClampedArrayTaskPool0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0008
     * @tc.desc   Testing construct an object from an ArrayLike in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0008';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0008).then((value) => {
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
     * @tc.name   testUint8ClampedArrayTaskPool0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0009
     * @tc.desc   Testing construct an object from an ArrayBuffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0009';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0009).then((value) => {
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
     * @tc.name   testUint8ClampedArrayTaskPool0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0010
     * @tc.desc   Testing construct an object from another ArkTS TypedArray in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0010';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0010).then((value) => {
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
     * @tc.name   testUint8ClampedArrayTaskPool0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0011
     * @tc.desc   Testing create an ArrayBuffer with an empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0011';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0011).then((value) => {
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
     * @tc.name   testUint8ClampedArrayTaskPool0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0012
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0012';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0012).then((value) => {
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
     * @tc.name   testUint8ClampedArrayTaskPool0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0013
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0013';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0013).then((value) => {
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
     * @tc.name   testUint8ClampedArrayTaskPool0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0014
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0014';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0014).then((value) => {
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
     * @tc.name   testUint8ClampedArrayTaskPool0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0015
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0015';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0015).then((value) => {
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
     * @tc.name   testUint8ClampedArrayTaskPool0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0016
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0016';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0016).then((value) => {
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
     * @tc.name   testUint8ClampedArrayTaskPool0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0017
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0017';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0017).then((value) => {
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
     * @tc.name   testUint8ClampedArrayTaskPool0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0018
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0018';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0018).then((value) => {
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
     * @tc.name   testUint8ClampedArrayTaskPool0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0019
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0019';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0019).then((value) => {
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
     * @tc.name   testUint8ClampedArrayTaskPool0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0020
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0020';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0020).then((value) => {
            num++;
            expect(value).assertEqual('3,4');
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
     * @tc.name   testUint8ClampedArrayTaskPool0021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_CLAMPED_ARRAY_TASKPOOL_0021
     * @tc.desc   Testing the 'from' interface with an array-like structure [1, 3, 5] in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ClampedArrayTaskPool0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ClampedArrayTaskPool0021';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ClampedArrayTaskPool0021).then((value) => {
            num++;
            expect(value).assertEqual('1,3,5');
