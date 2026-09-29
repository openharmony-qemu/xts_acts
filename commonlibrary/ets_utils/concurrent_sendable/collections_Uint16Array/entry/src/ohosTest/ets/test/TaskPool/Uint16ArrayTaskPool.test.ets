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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium-dynamic';
import { collections, taskpool } from '@kit.ArkTS';
import {
  sleep,
  testUint16ArrayTaskPool0001,
  testUint16ArrayTaskPool0002,
  testUint16ArrayTaskPool0003,
  testUint16ArrayTaskPool0004,
  testUint16ArrayTaskPool0005,
  testUint16ArrayTaskPool0006,
  testUint16ArrayTaskPool0007,
  testUint16ArrayTaskPool0008,
  testUint16ArrayTaskPool0009,
  testUint16ArrayTaskPool0010,
  testUint16ArrayTaskPool0011,
  testUint16ArrayTaskPool0012,
  testUint16ArrayTaskPool0013,
  testUint16ArrayTaskPool0014,
  testUint16ArrayTaskPool0015,
  testUint16ArrayTaskPool0016,
  testUint16ArrayTaskPool0017,
  testUint16ArrayTaskPool0018,
  testUint16ArrayTaskPool0019,
  testUint16ArrayTaskPool0020,
  testUint16ArrayTaskPool0021,
  testUint16ArrayTaskPool0022,
  testUint16ArrayTaskPool0023,
  testUint16ArrayTaskPool0024,
  testUint16ArrayTaskPool0025,
  testUint16ArrayTaskPool0026,
  testUint16ArrayTaskPool0027,
  testUint16ArrayTaskPool0028,
  testUint16ArrayTaskPool0029,
  testUint16ArrayTaskPool0030,
  testUint16ArrayTaskPool0031,
  testUint16ArrayTaskPool0032,
  testUint16ArrayTaskPool0033,
  testUint16ArrayTaskPool0034,
  testUint16ArrayTaskPool0035,
  testUint16ArrayTaskPool0036,
  testUint16ArrayTaskPool0037,
  testUint16ArrayTaskPool0038,
  testUint16ArrayTaskPool0039,
  testUint16ArrayTaskPool0040,
  testUint16ArrayTaskPool0041,
  testUint16ArrayTaskPool0042,
  testUint16ArrayTaskPool0043,
  testUint16ArrayTaskPool0044,
  testUint16ArrayTaskPool0045,
  testUint16ArrayTaskPool0046,
  testUint16ArrayTaskPool0047,
  testUint16ArrayTaskPool0048,
  testUint16ArrayTaskPool0049,
  testUint16ArrayTaskPool0050,
  testUint16ArrayTaskPool0051,
  testUint16ArrayTaskPool0052,
  testUint16ArrayTaskPool0053,
  testUint16ArrayTaskPool0054,
  testUint16ArrayTaskPool0055,
  testUint16ArrayTaskPool0056,
  testUint16ArrayTaskPool0057,
  testUint16ArrayTaskPool0058,
  testUint16ArrayTaskPool0059,
  testUint16ArrayTaskPool0060,
  testUint16ArrayTaskPool0061,
  testUint16ArrayTaskPool0062,
  testUint16ArrayTaskPool0063,
  testUint16ArrayTaskPool0064,
  testUint16ArrayTaskPool0065,
  testUint16ArrayTaskPool0066,
  testUint16ArrayTaskPool0067,
  testUint16ArrayTaskPool0068,
  testUint16ArrayTaskPool0069,
  testUint16ArrayTaskPool0070,
  testUint16ArrayTaskPool0071,
  testUint16ArrayTaskPool0072,
  testUint16ArrayTaskPool0073,
  testUint16ArrayTaskPool0074,
  testUint16ArrayTaskPool0075,
  testUint16ArrayTaskPool0076,
  testUint16ArrayTaskPool0077,
  testUint16ArrayTaskPool0078,
  testUint16ArrayTaskPool0079,
  testUint16ArrayTaskPool0080,
  testUint16ArrayTaskPool0081,
  testUint16ArrayTaskPool0082,
  testUint16ArrayTaskPool0083,
  testUint16ArrayTaskPool0084,
  testUint16ArrayTaskPool0085,
  testUint16ArrayTaskPool0086,
  testUint16ArrayTaskPool0087,
  testUint16ArrayTaskPool0088,
  testUint16ArrayTaskPool0089,
  testUint16ArrayTaskPool0090,
  testUint16ArrayTaskPool0091,
  testUint16ArrayTaskPool0092,
  testUint16ArrayTaskPool0093,
  testUint16ArrayTaskPool0094,
  testUint16ArrayTaskPool0095,
  testUint16ArrayTaskPool0096,
  testUint16ArrayTaskPool0097,
  testUint16ArrayTaskPool0098,
  testUint16ArrayTaskPool0099,
  testUint16ArrayTaskPool0100,
  testUint16ArrayTaskPool0101,
  testUint16ArrayTaskPool0102,
  testUint16ArrayTaskPool0103,
  testUint16ArrayTaskPool0104,
  testUint16ArrayTaskPool0105,
  testUint16ArrayTaskPool0106,
  testUint16ArrayTaskPool0107,
  testUint16ArrayTaskPool0108,
  testUint16ArrayTaskPool0109,
  testUint16ArrayTaskPool0110,
  testUint16ArrayTaskPool0111,
  testUint16ArrayTaskPool0112,
  testUint16ArrayTaskPool0113,
  testUint16ArrayTaskPool0114,
  testUint16ArrayTaskPool0115,
  testUint16ArrayTaskPool0116,
  testUint16ArrayTaskPool0117,
  testUint16ArrayTaskPool0118,
  testUint16ArrayTaskPool0119,
  testUint16ArrayTaskPool0120,
  testUint16ArrayTaskPool0121,
  testUint16ArrayTaskPool0122,
  testUint16ArrayTaskPool0123,
  testUint16ArrayTaskPool0124,
  testUint16ArrayTaskPool0125,
  testUint16ArrayTaskPool0126,
  testUint16ArrayTaskPool0127,
  testUint16ArrayTaskPool0128,
  testUint16ArrayTaskPool0129,
  testUint16ArrayTaskPool0130,
  testUint16ArrayTaskPool0131,
  testUint16ArrayTaskPool0132,
  testUint16ArrayTaskPool0133,
  testUint16ArrayTaskPool0134,
  testUint16ArrayTaskPool0135,
  testUint16ArrayTaskPool0136,
  testUint16ArrayTaskPool0137,
  testUint16ArrayTaskPool0138,
  testUint16ArrayTaskPool0139,
  testUint16ArrayTaskPool0140,
  testUint16ArrayTaskPool0141,
  testUint16ArrayTaskPool0142,
  testUint16ArrayTaskPool0143,
  testUint16ArrayTaskPool0144,
  testUint16ArrayTaskPool0145,
  testUint16ArrayTaskPool0146,
  testUint16ArrayTaskPool0147,
  testUint16ArrayTaskPool0148,
  testUint16ArrayTaskPool0149,
  testUint16ArrayTaskPool0150,
  testUint16ArrayTaskPool0151,
  testUint16ArrayTaskPool0152,
  testUint16ArrayTaskPool0153,
  testUint16ArrayTaskPool0154,
  testUint16ArrayTaskPool0155,
  testUint16ArrayTaskPool0156,
  testUint16ArrayTaskPool0157,
  testUint16ArrayTaskPool0158,
  testUint16ArrayTaskPool0159,
  testUint16ArrayTaskPool0160,
  testUint16ArrayTaskPool0161,
  testUint16ArrayTaskPool0162,
  testUint16ArrayTaskPool0163,
  testUint16ArrayTaskPool0164,
  testUint16ArrayTaskPool0165,
  testUint16ArrayTaskPool0166,
  testUint16ArrayTaskPool0167,
  testUint16ArrayTaskPool0168,
  testUint16ArrayTaskPool0169,
  testUint16ArrayTaskPool0170,
  testUint16ArrayTaskPool0171,
  testUint16ArrayTaskPool0172,
  testUint16ArrayTaskPool0173,
  testUint16ArrayTaskPool0174,
  testUint16ArrayTaskPool0175,
  testUint16ArrayTaskPool0176,
  testUint16ArrayTaskPool0177,
  testUint16ArrayTaskPool0178,
  testUint16ArrayTaskPool0179,
  testUint16ArrayTaskPool0180,
  testUint16ArrayTaskPool0181,
  testUint16ArrayTaskPool0182,
  testUint16ArrayTaskPool0183,
  testUint16ArrayTaskPool0184,
  testUint16ArrayTaskPool0185,
  testUint16ArrayTaskPool0186,
  testUint16ArrayTaskPool0187,
} from './uint16Array_function';

export default function Uint16ArrayTaskPoolTest() {
  describe('Uint16ArrayTaskPoolTest', () => {
    /**
     * @tc.name   testUint16ArrayTaskPool0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0001
     * @tc.desc   Testing the iterative ability of Uint16Array using a for loop in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0001).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0002
     * @tc.desc   Testing the iterative ability of Uint16Array using ... deconstruction in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0002).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0003
     * @tc.desc   Testing create an empty ArkTS TypedArray object with Uint16Array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0003).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0004
     * @tc.desc   Testing creation of ArkTS TypedArray object with invalid size in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0004).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0005
     * @tc.desc   Testing ArrayLength constructs 0 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0005).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0006
     * @tc.desc   Testing ArrayLength constructs 10 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0006).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0007
     * @tc.desc   Testing ArrayLength constructs 100000 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0007';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0007).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0008
     * @tc.desc   Testing construct an object from an ArrayLike in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0008';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0008).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0009
     * @tc.desc   Testing construct an object from an ArrayBuffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0009';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0009).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0010
     * @tc.desc   Testing construct an object from another ArkTS TypedArray in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0010';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0010).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0011
     * @tc.desc   Testing create an ArrayBuffer with an empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0011';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0011).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0012
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0012';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0012).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0013
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0013';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0013).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0014
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0014';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0014).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0015
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0015';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0015).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0016
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0016';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0016).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0017
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0017';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0017).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0018
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0018';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0018).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0019
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0019';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0019).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0020
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0020';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0020).then((value) => {
            num++;
            expect(value).assertEqual('2,3');
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
     * @tc.name   testUint16ArrayTaskPool0021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0021
     * @tc.desc   Testing the 'from' interface with an array-like structure [1, 3, 5] in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0021';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0021).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0022
     * @tc.desc   Testing the 'from' interface with an array-like structure [] in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0022';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0022).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0023
     * @tc.desc   Testing the array-like map function created from an object in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0023';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0023).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0024
     * @tc.desc   Testing the array-like map function created from a character array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0024';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0024).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0025
     * @tc.desc   Testing the array-like map function created from a string in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0025';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0025).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0026
     * @tc.desc   Testing the array-like map function created from a num array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0026';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0026).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0027
     * @tc.desc   Testing the array-like map function created from a nesting array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0027';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0027).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0028
     * @tc.desc   Testing the array-like map function without specifying a mapping function in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0028';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0028).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0029
     * @tc.desc   Testing the array-like map function with specifying a mapping function in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0029';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0029).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0030
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0030';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0030).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0031
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0031';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0031).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0032
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0032';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0032).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0033
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0033';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0033).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0034
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0034';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0034).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0035
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0035
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0035';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0035).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0036
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0036
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0036';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0036).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0037
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0037
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0037';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0037).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0038
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0038
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0038';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0038).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0039
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0039
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0039';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0039).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0040
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0040';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0040).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0041
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0041
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0041';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0041).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0042
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0042
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0042';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0042).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0043
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0043
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0043';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0043).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0044
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0044
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0044';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0044).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0045
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0045
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0045';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0045).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0046
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0046
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0046';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0046).then((value) => {
            num++;
            expect(value).assertEqual('3,4,5,6,7,6,7,8');
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
     * @tc.name   testUint16ArrayTaskPool0047
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0047
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0047';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0047).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0048
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0048
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0048';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0048).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0049
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0049
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0049';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0049).then((value) => {
            num++;
            expect(value).assertEqual('3,4,5,6,7,8,7,8');
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
     * @tc.name   testUint16ArrayTaskPool0050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0050
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0050';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0050).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0051
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0051
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0051';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0051).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0052
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0052
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0052';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0052).then((value) => {
            num++;
            expect(value).assertEqual('1,2,1,2,3,4,5,6');
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
     * @tc.name   testUint16ArrayTaskPool0053
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0053
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0053';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0053).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0054
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0054
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0054';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0054).then((value) => {
            num++;
            expect(value).assertEqual('1,2,1,2,5,6,7,8');
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
     * @tc.name   testUint16ArrayTaskPool0055
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0055
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0055';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0055).then((value) => {
            num++;
            expect(value).assertEqual('1,2,1,2,3,4,5,6');
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
     * @tc.name   testUint16ArrayTaskPool0056
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0056
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0056';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0056).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0057
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0057
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0057';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0057).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0058
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0058
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0058';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0058).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0059
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0059
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0059';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0059).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0060
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0060
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0060';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0060).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0061
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0061
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0061';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0061).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0062
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0062
     * @tc.desc   Testing whether it returns true when there are elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0062';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0062).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0063
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0063
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0063';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0063).then((value) => {
            num++;
            expect(value).assertEqual(false);
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
     * @tc.name   testUint16ArrayTaskPool0064
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0064
     * @tc.desc   Testing whether it returns true when all elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0064';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0064).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0065
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0065
     * @tc.desc   Testing whether it returns true when all elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0065';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0065).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0066
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0066
     * @tc.desc   Testing whether it returns false when not all elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0066';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0066).then((value) => {
            num++;
            expect(value).assertEqual(false);
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
     * @tc.name   testUint16ArrayTaskPool0067
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0067
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0067';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0067).then((value) => {
            num++;
            expect(value).assertEqual(false);
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
     * @tc.name   testUint16ArrayTaskPool0068
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0068
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0068';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0068).then((value) => {
            num++;
            expect(value).assertEqual('4,4,4,1,4,4,1,4,3');
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
     * @tc.name   testUint16ArrayTaskPool0069
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0069
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0069';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0069).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0070
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0070
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0070';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0070).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0071
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0071
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0071';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0071).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0072
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0072
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0072';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0072).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,4');
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
     * @tc.name   testUint16ArrayTaskPool0073
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0073
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0073';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0073).then((value) => {
            num++;
            expect(value).assertEqual('4,4,4,4,4,6');
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
     * @tc.name   testUint16ArrayTaskPool0074
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0074
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0074';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0074).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0075
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0075
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0075';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0075).then((value) => {
            num++;
            expect(value).assertEqual('4,4,3,4,5,6');
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
     * @tc.name   testUint16ArrayTaskPool0076
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0076
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0076';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0076).then((value) => {
            num++;
            expect(value).assertEqual('4,4,4,4,4,4');
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
     * @tc.name   testUint16ArrayTaskPool0077
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0077
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0077';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0077).then((value) => {
            num++;
            expect(value).assertEqual('1,2,4,4,4,6');
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
     * @tc.name   testUint16ArrayTaskPool0078
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0078
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0078';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0078).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0079
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0079
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0079';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0079).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0080
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0080
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0080';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0080).then((value) => {
            num++;
            expect(value).assertEqual('1,2,4,4,4,4');
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
     * @tc.name   testUint16ArrayTaskPool0081
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0081
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0081';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0081).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0082
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0082
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0082';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0082).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0083
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0083
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0083';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0083).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0084
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0084
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0084';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0084).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0085
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0085
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0085';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0085).then((value) => {
            num++;
            expect(value).assertEqual('0,2,4');
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
     * @tc.name   testUint16ArrayTaskPool0086
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0086
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0086';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0086).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0087
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0087
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0087';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0087).then((value) => {
            num++;
            expect(value).assertEqual(' after set is 5,6');
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
     * @tc.name   testUint16ArrayTaskPool0088
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0088
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0088';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0088).then((value) => {
            num++;
            expect(value).assertEqual(3);
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
     * @tc.name   testUint16ArrayTaskPool0089
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0089
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0089';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0089).then((value) => {
            num++;
            expect(value).assertEqual(undefined);
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
     * @tc.name   testUint16ArrayTaskPool0090
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0090
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0090';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0090).then((value) => {
            num++;
            expect(value).assertEqual('undefined,5');
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
     * @tc.name   testUint16ArrayTaskPool0091
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0091
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0091';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0091).then((value) => {
            num++;
            expect(value).assertEqual(undefined);
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
     * @tc.name   testUint16ArrayTaskPool0092
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0092
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0092';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0092).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0093
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0093
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0093';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0093).then((value) => {
            num++;
            expect(value).assertEqual(undefined);
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
     * @tc.name   testUint16ArrayTaskPool0094
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0094
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0094';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0094).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0095
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0095
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0095';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0095).then((value) => {
            num++;
            expect(value).assertEqual(-1);
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
     * @tc.name   testUint16ArrayTaskPool0096
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0096
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0096';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0096).then((value) => {
            num++;
            expect(value).assertEqual(1);
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
     * @tc.name   testUint16ArrayTaskPool0097
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0097
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0097';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0097).then((value) => {
            num++;
            expect(value).assertEqual(-1);
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
     * @tc.name   testUint16ArrayTaskPool0098
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0098
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0098';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0098).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0099
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0099
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0099';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0099).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0100
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0100';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0100).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0101
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0101
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0101';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0101).then((value) => {
            num++;
            expect(value).assertEqual(-1);
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
     * @tc.name   testUint16ArrayTaskPool0102
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0102
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0102';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0102).then((value) => {
            num++;
            expect(value).assertEqual(-1);
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
     * @tc.name   testUint16ArrayTaskPool0103
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0103
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0103';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0103).then((value) => {
            num++;
            expect(value).assertEqual(1);
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
     * @tc.name   testUint16ArrayTaskPool0104
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0104
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0104';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0104).then((value) => {
            num++;
            expect(value).assertEqual(9);
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
     * @tc.name   testUint16ArrayTaskPool0105
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0105
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0105';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0105).then((value) => {
            num++;
            expect(value).assertEqual(6);
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
     * @tc.name   testUint16ArrayTaskPool0106
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0106
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0106';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0106).then((value) => {
            num++;
            expect(value).assertEqual(2);
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
     * @tc.name   testUint16ArrayTaskPool0107
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0107
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0107';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0107).then((value) => {
            num++;
            expect(value).assertEqual(3);
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
     * @tc.name   testUint16ArrayTaskPool0108
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0108
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0108';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0108).then((value) => {
            num++;
            expect(value).assertEqual(-1);
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
     * @tc.name   testUint16ArrayTaskPool0109
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0109
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0109';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0109).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0110
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0110
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0110';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0110).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0111
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0111
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0111';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0111).then((value) => {
            num++;
            expect(value).assertEqual("1,2,3,4,5");
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
     * @tc.name   testUint16ArrayTaskPool0112
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0112
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0112';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0112).then((value) => {
            num++;
            expect(value).assertEqual("12345");
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
     * @tc.name   testUint16ArrayTaskPool0113
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0113
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0113';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0113).then((value) => {
            num++;
            expect(value).assertEqual("1,2,3,4,5");
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
     * @tc.name   testUint16ArrayTaskPool0114
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0114
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0114';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0114).then((value) => {
            num++;
            expect(value).assertEqual("1/2/3/4/5");
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
     * @tc.name   testUint16ArrayTaskPool0115
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0115
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0115';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0115).then((value) => {
            num++;
            expect(value).assertEqual("1,。￥·2,。￥·3,。￥·4,。￥·5");
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
     * @tc.name   testUint16ArrayTaskPool0116
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0116
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0116';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0116).then((value) => {
            num++;
            expect(value).assertEqual("1녕하こんйте2녕하こんйте3녕하こんйте4녕하こんйте5");
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
     * @tc.name   testUint16ArrayTaskPool0117
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0117
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0117';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0117).then((value) => {
            num++;
            expect(value).assertEqual("1，2，3，4，5");
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
     * @tc.name   testUint16ArrayTaskPool0118
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0118
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0118';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0118).then((value) => {
            num++;
            expect(value).assertEqual("");
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
     * @tc.name   testUint16ArrayTaskPool0119
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0119
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0119';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0119).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0120
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0120
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0120';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0120).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0121
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0121
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0121';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0121).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0122
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0122
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0122';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0122).then((value) => {
            num++;
            expect(value).assertEqual(15);
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
     * @tc.name   testUint16ArrayTaskPool0123
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0123
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0123';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0123).then((value) => {
            num++;
            expect(value).assertEqual(23);
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
     * @tc.name   testUint16ArrayTaskPool0124
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0124
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0124';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0124).then((value) => {
            num++;
            expect(value).assertEqual('initialValue12345');
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
     * @tc.name   testUint16ArrayTaskPool0125
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0125
     * @tc.desc   Testing reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0125';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0125).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0126
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0126
     * @tc.desc   Testing reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0126';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0126).then((value) => {
            num++;
            expect(value).assertEqual('5,4,3,2,1');
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
     * @tc.name   testUint16ArrayTaskPool0127
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0127
     * @tc.desc   Testing reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0127';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0127).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0128
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0128
     * @tc.desc   Testing the set of uint16Array, offset is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0128';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0128).then((value) => {
            num++;
            expect(value).assertEqual("1,3,5,0,0,0,0,0");
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
     * @tc.name   testUint16ArrayTaskPool0129
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0129
     * @tc.desc   Testing the set of uint16Array, offset is null, forEach succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0129';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0129).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0130
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0130
     * @tc.desc   Testing the set of uint16Array, offset is -1, return failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0130';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0130).then((value) => {
            num++;
            expect(value).assertEqual("error");
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
     * @tc.name   testUint16ArrayTaskPool0131
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0131
     * @tc.desc   Testing the set of uint16Array, offset is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0131';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0131).then((value) => {
            num++;
            expect(value).assertEqual("1,3,5,0,0,0,0,0");
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
     * @tc.name   testUint16ArrayTaskPool0132
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0132
     * @tc.desc   Testing the set of uint16Array, offset is 0, forEach succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0132';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0132).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0133
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0133
     * @tc.desc   Testing the set of uint16Array, offset is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0133';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0133).then((value) => {
            num++;
            expect(value).assertEqual("0,0,1,3,5,0,0,0");
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
     * @tc.name   testUint16ArrayTaskPool0134
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0134
     * @tc.desc   Testing the set of uint16Array, offset is 2, forEach succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0134';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0134).then((value) => {
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
     * @tc.name   testUint16ArrayTaskPool0135
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0135
     * @tc.desc   Testing the set of uint16Array, offset is 10(overstep), return failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0135';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0135).then((value) => {
            num++;
            expect(value).assertEqual("error");
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
     * @tc.name   testUint16ArrayTaskPool0136
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0136
     * @tc.desc   Testing the Slice of uint16Array, array is null, start is 1, end is 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0136';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0136).then((value) => {
            num++;
            expect(value).assertEqual("");
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
     * @tc.name   testUint16ArrayTaskPool0137
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0137
     * @tc.desc   Testing the Slice of uint16Array, array is null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0137';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0137).then((value) => {
            num++;
            expect(value).assertEqual("");
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
     * @tc.name   testUint16ArrayTaskPool0138
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0138
     * @tc.desc   Testing the Slice of uint16Array, array is not null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0138';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0138).then((value) => {
            num++;
            expect(value).assertEqual("1,2,3,4,5");
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
     * @tc.name   testUint16ArrayTaskPool0139
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0139
     * @tc.desc   Testing the Slice of uint16Array, array is not null, parameter is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0139';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint16ArrayTaskPool0139).then((value) => {
            num++;
            expect(value).assertEqual("1,2,3,4,5");
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
     * @tc.name   testUint16ArrayTaskPool0140
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0140
     * @tc.desc   Testing the Slice of uint16Array, array is not null, parameter is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0140';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0140).then((value) => {
          num++;
          expect(value).assertEqual("5");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0141
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0141
     * @tc.desc   Testing the Slice of uint16Array, array is not null, start is -1, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0141';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0141).then((value) => {
          num++;
          expect(value).assertEqual("");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0142
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0142
     * @tc.desc   Testing the Slice of uint16Array, array is not null, start is -1, end is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0142';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0142).then((value) => {
          num++;
          expect(value).assertEqual("");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0143
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0143
     * @tc.desc   Testing the Slice of uint16Array, array is not null, start is 0, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0143';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0143).then((value) => {
          num++;
          expect(value).assertEqual("1,2,3,4");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0144
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0144
     * @tc.desc   Testing the Slice of uint16Array, array is not null, parameter is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0144';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0144).then((value) => {
          num++;
          expect(value).assertEqual("3,4,5");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0145
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0145
     * @tc.desc   Testing the Slice of uint16Array, array is not null, parameter is 10(overstep).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0145';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0145).then((value) => {
          num++;
          expect(value).assertEqual("");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0146
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0146
     * @tc.desc   Testing the Slice of uint16Array, array is not null, parameter is 10(overstep).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0146';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0146).then((value) => {
          num++;
          expect(value).assertEqual("");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0147
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0147
     * @tc.desc   Testing the Slice of uint16Array, array is not null, parameter is 10(overstep).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0147';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0147).then((value) => {
          num++;
          expect(value).assertEqual("");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0148
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0148
     * @tc.desc   Testing the Slice of uint16Array, array is not null, start is 2, end is 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0148';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0148).then((value) => {
          num++;
          expect(value).assertEqual("3,4");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0149
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0149
     * @tc.desc   Testing the sort of uint16Array, array is null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0149';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0149).then((value) => {
          num++;
          expect(value).assertEqual("");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0150
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0150
     * @tc.desc   Testing the sort of uint16Array, array is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0150';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0150).then((value) => {
          num++;
          expect(value).assertEqual("");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0151
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0151
     * @tc.desc   Testing the sort of uint16Array, array is not null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0151';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0151).then((value) => {
          num++;
          expect(value).assertEqual("1,2,3,4,5");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0152
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0152
     * @tc.desc   Testing the sort of uint16Array, array is not null, parameter is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0152';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0152).then((value) => {
          num++;
          expect(value).assertEqual("1,2,3,4,5");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0153
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0153
     * @tc.desc   Testing the sort of uint16Array, array is not null, parameter is grade down.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0153';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0153).then((value) => {
          num++;
          expect(value).assertEqual("5,4,3,2,1");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0154
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0154
     * @tc.desc   Testing the sort of uint16Array, array is not null, set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0154';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0154).then((value) => {
          num++;
          expect(value).assertEqual("2,5,7,8,9");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0155
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0155
     * @tc.desc   Testing the subarray of uint16Array, array is not null, parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0155';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0155).then((value) => {
          num++;
          expect(value).assertEqual("1,3,5,7,9");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0156
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0156
     * @tc.desc   Testing the subarray of uint16Array, array is not null, begin is -1, end is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0156';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0156).then((value) => {
          num++;
          expect(value).assertEqual("9");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0157
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0157
     * @tc.desc   Testing the subarray of uint16Array, array is not null, begin is -1, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0157';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0157).then((value) => {
          num++;
          expect(value).assertEqual("");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0158
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0158
     * @tc.desc   Testing the subarray of uint16Array, array is not null, begin is -1, end is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0158';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0158).then((value) => {
          num++;
          expect(value).assertEqual("");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0159
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0159
     * @tc.desc   Testing the subarray of uint16Array, array is not null, begin is -1, end is overstep.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0159';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0159).then((value) => {
          num++;
          expect(value).assertEqual("9");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0160
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0160
     * @tc.desc   Testing the subarray of uint16Array, array is not null, begin is 2, end is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0160';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0160).then((value) => {
          num++;
          expect(value).assertEqual("5,7,9");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0161
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0161
     * @tc.desc   Testing the subarray of uint16Array, array is not null, begin is 2, end is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0161';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0161).then((value) => {
          num++;
          expect(value).assertEqual("5,7");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0162
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0162
     * @tc.desc   Testing the subarray of uint16Array, array is not null, begin is 2, end is 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0162';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0162).then((value) => {
          num++;
          expect(value).assertEqual("");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0163
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0163
     * @tc.desc   Testing the subarray of uint16Array, array is not null, begin is 2, end is overstep.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0163';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0163).then((value) => {
          num++;
          expect(value).assertEqual("5,7,9");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0164
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0164
     * @tc.desc   Testing the subarray of uint16Array, array is not null, begin is overstep, end is overstep.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0164';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0164).then((value) => {
          num++;
          expect(value).assertEqual("");
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0165
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0165
     * @tc.desc   Testing Collections of uint16array, array is [], at(1), return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0165';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0165).then((value) => {
          num++;
          expect(value).assertEqual('undefined');
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0166
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0166
     * @tc.desc   Testing Collections of uint16array, array is [1,2,3], at(3), return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0166';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0166).then((value) => {
          num++;
          expect(value).assertEqual('undefined');
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0167
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0167
     * @tc.desc   Testing Collections of uint16array, array is [1,2,3], at(-1), return element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0167';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0167).then((value) => {
          num++;
          expect(value).assertEqual(3);
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0168
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0168
     * @tc.desc   Testing Collections of uint16array, array is [1,2,3], at(5), return undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0168';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0168).then((value) => {
          num++;
          expect(value).assertEqual('undefined');
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0169
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0169
     * @tc.desc   Testing Collections of uint16array, array is [1,2,3], at(0), return element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0169';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0169).then((value) => {
          num++;
          expect(value).assertEqual(1);
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0170
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0170
     * @tc.desc   Testing Collections of uint16array, array is [], includes(2), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0170';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0170).then((value) => {
          num++;
          expect(value).assertEqual(false);
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0171
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0171
     * @tc.desc   Testing Collections of uint16array, array is [1,2,3], includes(5,-1), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0171';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0171).then((value) => {
          num++;
          expect(value).assertEqual(false);
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0172
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0172
     * @tc.desc   Testing Collections of uint16array, array is [1,2,3], includes(3,-1), return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0172';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0172).then((value) => {
          num++;
          expect(value).assertEqual(true);
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0173
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0173
     * @tc.desc   Testing Collections of uint16array, array is [1,2,3], includes(10), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0173';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0173).then((value) => {
          num++;
          expect(value).assertEqual(false);
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0174
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0174
     * @tc.desc   Testing Collections of uint16array, array is [1,2,3], includes(1), return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0174';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0174).then((value) => {
          num++;
          expect(value).assertEqual(true);
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0175
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0175
     * @tc.desc   Testing Collections of uint16array, array is [1,2,3], includes(1,5), return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0175';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0175).then((value) => {
          num++;
          expect(value).assertEqual(false);
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0176
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0176
     * @tc.desc   Testing Collections of uint16array, array is [], entries(), undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0176';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0176).then((value) => {
          num++;
          expect(value).assertEqual('undefined');
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0177
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0177
     * @tc.desc   Testing Collections of uint16array, array is [1,2,3], entries().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0177';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0177).then((value) => {
          num++;
          expect(value).assertEqual('0,1');
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0178
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0178
     * @tc.desc   Testing Collections of uint16array, array is [], keys().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0178';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0178).then((value) => {
          num++;
          expect(value).assertEqual(0);
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0179
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0179
     * @tc.desc   Testing Collections of uint16array, array is [1,2,3], keys(),iterator.next().value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0179';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0179).then((value) => {
          num++;
          expect(value).assertEqual('0,1,2');
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testUint16ArrayTaskPool0180
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0180
     * @tc.desc   Testing Collections of uint16array, array is [1,2,3], keys(),for iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0180';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0180).then((value) => {
          num++;
          expect(value).assertEqual(true);
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0181
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0181
     * @tc.desc   Testing Collections of uint16array, array is [], values().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0181';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0181).then((value) => {
          num++;
          expect(value).assertEqual(true);
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0182
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0182
     * @tc.desc   Testing Collections of uint16array, array is [1,2,3], values(),iterator.next().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0182';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0182).then((value) => {
          num++;
          expect(value).assertEqual(true);
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0183
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0183
     * @tc.desc   Testing Collections of uint16array, array is [1,2,3], values(),for value iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0183';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0183).then((value) => {
          num++;
          expect(value).assertEqual(true);
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0184
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0184
     * @tc.desc   Testing Collections of uint16array, array is [1,2,3], set array,values(),for value iterator.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0184';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0184).then((value) => {
          num++;
          expect(value).assertEqual(true);
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0185
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0185
     * @tc.desc   Testing Collections of uint16array, array is [1,2,3], index < 0, array[index] = undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0185';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0185).then((value) => {
          num++;
          expect(value).assertEqual(true);
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0186
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0186
     * @tc.desc   Testing Collections of uint16array, array is [1,2,3], index > arrayLength, array[index] = undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0186';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0186).then((value) => {
          num++;
          expect(value).assertEqual(true);
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testUint16ArrayTaskPool0187
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT16_ARRAY_TASKPOOL_0187
     * @tc.desc   Testing Collections of uint16array, array is [1,2,3], 0 <= index < arrayLength, array[index] = array element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint16ArrayTaskPool0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint16ArrayTaskPool0187';
      console.info(`${caseName} test start`);
      let num = 0;
      for (let i = 0; i < 10; i++) {
        taskpool.execute(testUint16ArrayTaskPool0187).then((value) => {
          num++;
          expect(value).assertEqual(true);
        }).catch(() => { console.error('catch error'); });
      }
      while (num < 10) {
        await sleep(100);
      }
      console.info(`${caseName} test end`);
      done()
    })
  })
}