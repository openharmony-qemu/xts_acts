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
  testInt16ArrayTaskPool0001,
  testInt16ArrayTaskPool0002,
  testInt16ArrayTaskPool0003,
  testInt16ArrayTaskPool0004,
  testInt16ArrayTaskPool0005,
  testInt16ArrayTaskPool0006,
  testInt16ArrayTaskPool0007,
  testInt16ArrayTaskPool0008,
  testInt16ArrayTaskPool0009,
  testInt16ArrayTaskPool0010,
  testInt16ArrayTaskPool0011,
  testInt16ArrayTaskPool0012,
  testInt16ArrayTaskPool0013,
  testInt16ArrayTaskPool0014,
  testInt16ArrayTaskPool0015,
  testInt16ArrayTaskPool0016,
  testInt16ArrayTaskPool0017,
  testInt16ArrayTaskPool0018,
  testInt16ArrayTaskPool0019,
  testInt16ArrayTaskPool0020,
  testInt16ArrayTaskPool0021,
  testInt16ArrayTaskPool0022,
  testInt16ArrayTaskPool0023,
  testInt16ArrayTaskPool0024,
  testInt16ArrayTaskPool0025,
  testInt16ArrayTaskPool0026,
  testInt16ArrayTaskPool0027,
  testInt16ArrayTaskPool0028,
  testInt16ArrayTaskPool0029,
  testInt16ArrayTaskPool0030,
  testInt16ArrayTaskPool0031,
  testInt16ArrayTaskPool0032,
  testInt16ArrayTaskPool0033,
  testInt16ArrayTaskPool0034,
  testInt16ArrayTaskPool0035,
  testInt16ArrayTaskPool0036,
  testInt16ArrayTaskPool0037,
  testInt16ArrayTaskPool0038,
  testInt16ArrayTaskPool0039,
  testInt16ArrayTaskPool0040,
  testInt16ArrayTaskPool0041,
  testInt16ArrayTaskPool0042,
  testInt16ArrayTaskPool0043,
  testInt16ArrayTaskPool0044,
  testInt16ArrayTaskPool0045,
  testInt16ArrayTaskPool0046,
  testInt16ArrayTaskPool0047,
  testInt16ArrayTaskPool0048,
  testInt16ArrayTaskPool0049,
  testInt16ArrayTaskPool0050,
  testInt16ArrayTaskPool0051,
  testInt16ArrayTaskPool0052,
  testInt16ArrayTaskPool0053,
  testInt16ArrayTaskPool0054,
  testInt16ArrayTaskPool0055,
  testInt16ArrayTaskPool0056,
  testInt16ArrayTaskPool0057,
  testInt16ArrayTaskPool0058,
  testInt16ArrayTaskPool0059,
  testInt16ArrayTaskPool0060,
  testInt16ArrayTaskPool0061,
  testInt16ArrayTaskPool0062,
  testInt16ArrayTaskPool0063,
  testInt16ArrayTaskPool0064,
  testInt16ArrayTaskPool0065,
  testInt16ArrayTaskPool0066,
  testInt16ArrayTaskPool0067,
  testInt16ArrayTaskPool0068,
  testInt16ArrayTaskPool0069,
  testInt16ArrayTaskPool0070,
  testInt16ArrayTaskPool0071,
  testInt16ArrayTaskPool0072,
  testInt16ArrayTaskPool0073,
  testInt16ArrayTaskPool0074,
  testInt16ArrayTaskPool0075,
  testInt16ArrayTaskPool0076,
  testInt16ArrayTaskPool0077,
  testInt16ArrayTaskPool0078,
  testInt16ArrayTaskPool0079,
  testInt16ArrayTaskPool0080,
  testInt16ArrayTaskPool0081,
  testInt16ArrayTaskPool0082,
  testInt16ArrayTaskPool0083,
  testInt16ArrayTaskPool0084,
  testInt16ArrayTaskPool0085,
  testInt16ArrayTaskPool0086,
  testInt16ArrayTaskPool0087,
  testInt16ArrayTaskPool0088,
  testInt16ArrayTaskPool0089,
  testInt16ArrayTaskPool0090,
  testInt16ArrayTaskPool0091,
  testInt16ArrayTaskPool0092,
  testInt16ArrayTaskPool0093,
  testInt16ArrayTaskPool0094,
  testInt16ArrayTaskPool0095,
  testInt16ArrayTaskPool0096,
  testInt16ArrayTaskPool0097,
  testInt16ArrayTaskPool0098,
  testInt16ArrayTaskPool0099,
  testInt16ArrayTaskPool0100,
  testInt16ArrayTaskPool0101,
  testInt16ArrayTaskPool0102,
  testInt16ArrayTaskPool0103,
  testInt16ArrayTaskPool0104,
  testInt16ArrayTaskPool0105,
  testInt16ArrayTaskPool0106,
  testInt16ArrayTaskPool0107,
  testInt16ArrayTaskPool0108,
  testInt16ArrayTaskPool0109,
  testInt16ArrayTaskPool0110,
  testInt16ArrayTaskPool0111,
  testInt16ArrayTaskPool0112,
  testInt16ArrayTaskPool0113,
  testInt16ArrayTaskPool0114,
  testInt16ArrayTaskPool0115,
  testInt16ArrayTaskPool0116,
  testInt16ArrayTaskPool0117,
  testInt16ArrayTaskPool0118,
  testInt16ArrayTaskPool0119,
  testInt16ArrayTaskPool0120,
  testInt16ArrayTaskPool0121,
  testInt16ArrayTaskPool0122,
  testInt16ArrayTaskPool0123,
  testInt16ArrayTaskPool0124,
  testInt16ArrayTaskPool0125,
  testInt16ArrayTaskPool0126,
  testInt16ArrayTaskPool0127,
  testInt16ArrayTaskPool0128,
  testInt16ArrayTaskPool0129,
  testInt16ArrayTaskPool0130,
  testInt16ArrayTaskPool0131,
  testInt16ArrayTaskPool0132,
  testInt16ArrayTaskPool0133,
  testInt16ArrayTaskPool0134,
  testInt16ArrayTaskPool0135,
  testInt16ArrayTaskPool0136,
  testInt16ArrayTaskPool0137,
  testInt16ArrayTaskPool0138,
  testInt16ArrayTaskPool0139,
  testInt16ArrayTaskPool0140,
  testInt16ArrayTaskPool0141,
  testInt16ArrayTaskPool0142,
  testInt16ArrayTaskPool0143,
  testInt16ArrayTaskPool0144,
  testInt16ArrayTaskPool0145,
  testInt16ArrayTaskPool0146,
  testInt16ArrayTaskPool0147,
  testInt16ArrayTaskPool0148,
  testInt16ArrayTaskPool0149,
  testInt16ArrayTaskPool0150,
  testInt16ArrayTaskPool0151,
  testInt16ArrayTaskPool0152,
  testInt16ArrayTaskPool0153,
  testInt16ArrayTaskPool0154,
  testInt16ArrayTaskPool0155,
  testInt16ArrayTaskPool0156,
  testInt16ArrayTaskPool0157,
  testInt16ArrayTaskPool0158,
  testInt16ArrayTaskPool0159,
  testInt16ArrayTaskPool0160,
  testInt16ArrayTaskPool0161,
  testInt16ArrayTaskPool0162,
  testInt16ArrayTaskPool0163,
  testInt16ArrayTaskPool0164,
  testInt16ArrayTaskPool0165,
  testInt16ArrayTaskPool0166,
  testInt16ArrayTaskPool0167,
  testInt16ArrayTaskPool0168,
  testInt16ArrayTaskPool0169,
  testInt16ArrayTaskPool0170,
  testInt16ArrayTaskPool0171,
  testInt16ArrayTaskPool0172,
  testInt16ArrayTaskPool0173,
  testInt16ArrayTaskPool0174,
  testInt16ArrayTaskPool0175,
  testInt16ArrayTaskPool0176,
  testInt16ArrayTaskPool0177,
  testInt16ArrayTaskPool0178,
  testInt16ArrayTaskPool0179,
  testInt16ArrayTaskPool0180,
  testInt16ArrayTaskPool0181,
  testInt16ArrayTaskPool0182,
  testInt16ArrayTaskPool0183,
  testInt16ArrayTaskPool0184,
  testInt16ArrayTaskPool0185,
  testInt16ArrayTaskPool0186,
  testInt16ArrayTaskPool0187,
} from './int16Array_function';

export default function Int16ArrayTaskPoolTest() {
  describe('Int16ArrayTaskPoolTest', () => {
    /**
     * @tc.name   testInt16ArrayTaskPool0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0001
     * @tc.desc   Testing the iterative ability of Int16Array using a for loop in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0001).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0002
     * @tc.desc   Testing the iterative ability of Int16Array using ... deconstruction in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0002).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0003
     * @tc.desc   Testing create an empty ArkTS TypedArray object with Int16Array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0003).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0004
     * @tc.desc   Testing creation of ArkTS TypedArray object with invalid size in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0004).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0005
     * @tc.desc   Testing ArrayLength constructs 0 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0005).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0006
     * @tc.desc   Testing ArrayLength constructs 10 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0006).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0007
     * @tc.desc   Testing ArrayLength constructs 100000 parameter and checks the length in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0007';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0007).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0008
     * @tc.desc   Testing construct an object from an ArrayLike in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0008';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0008).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0009
     * @tc.desc   Testing construct an object from an ArrayBuffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0009';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0009).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0010
     * @tc.desc   Testing construct an object from another ArkTS TypedArray in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0010';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0010).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0011
     * @tc.desc   Testing create an ArrayBuffer with an empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0011';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0011).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0012
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0012';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0012).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0013
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0013';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0013).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0014
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0014';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0014).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0015
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0015';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0015).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0016
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0016';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0016).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0017
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0017';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0017).then((value) => {
            num++;
            expect(value).assertEqual('1,0');
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
     * @tc.name   testInt16ArrayTaskPool0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0018
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0018';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0018).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0019
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0019';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0019).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0020
     * @tc.desc   Testing create an ArrayBuffer with a not empty buffer in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0020';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0020).then((value) => {
            num++;
            expect(value).assertEqual('0,2');
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
     * @tc.name   testInt16ArrayTaskPool0021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0021
     * @tc.desc   Testing the 'from' interface with an array-like structure [1, 3, 5] in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0021';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0021).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0022
     * @tc.desc   Testing the 'from' interface with an array-like structure [] in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0022';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0022).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0023
     * @tc.desc   Testing the array-like map function created from an object in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0023';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0023).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0024
     * @tc.desc   Testing the array-like map function created from a character array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0024';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0024).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0025
     * @tc.desc   Testing the array-like map function created from a string in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0025';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0025).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0026
     * @tc.desc   Testing the array-like map function created from a num array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0026';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0026).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0027
     * @tc.desc   Testing the array-like map function created from a nesting array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0027';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0027).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0028
     * @tc.desc   Testing the array-like map function without specifying a mapping function in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0028';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0028).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0029
     * @tc.desc   Testing the array-like map function with specifying a mapping function in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0029';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0029).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0030
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0030';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0030).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0031
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0031';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0031).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0032
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0032';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0032).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0033
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0033';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0033).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0034
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0034';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0034).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0035
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0035
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0035';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0035).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0036
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0036
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0036';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0036).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0037
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0037
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0037';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0037).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0038
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0038
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0038';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0038).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0039
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0039
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0039';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0039).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0040
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0040';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0040).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0041
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0041
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0041';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0041).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0042
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0042
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0042';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0042).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0043
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0043
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0043';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0043).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0044
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0044
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0044';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0044).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0045
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0045
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0045';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0045).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0046
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0046
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0046';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0046).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0047
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0047
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0047';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0047).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0048
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0048
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0048';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0048).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0049
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0049
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0049';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0049).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0050
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0050';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0050).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0051
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0051
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0051';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0051).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0052
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0052
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0052';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0052).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0053
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0053
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0053';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0053).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0054
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0054
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0054';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0054).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0055
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0055
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0055';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0055).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0056
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0056
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0056';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0056).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0057
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0057
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0057';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0057).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0058
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0058
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0058';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0058).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0059
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0059
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0059';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0059).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0060
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0060
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0060';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0060).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0061
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0061
     * @tc.desc   Testing the copyWithin function to copy part of the array within itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0061';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0061).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0062
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0062
     * @tc.desc   Testing whether it returns true when there are elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0062';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0062).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0063
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0063
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0063';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0063).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0064
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0064
     * @tc.desc   Testing whether it returns true when all elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0064';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0064).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0065
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0065
     * @tc.desc   Testing whether it returns true when all elements that meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0065';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0065).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0066
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0066
     * @tc.desc   Testing whether it returns false when not all elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0066';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0066).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0067
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0067
     * @tc.desc   Testing whether it returns false when no elements meet the specified conditions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0067';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0067).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0068
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0068
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0068';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0068).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0069
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0069
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0069';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0069).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0070
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0070
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0070';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0070).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0071
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0071
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0071';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0071).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0072
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0072
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0072';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0072).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0073
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0073
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0073';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0073).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0074
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0074
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0074';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0074).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0075
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0075
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0075';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0075).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0076
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0076
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0076';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0076).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0077
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0077
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0077';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0077).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0078
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0078
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0078';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0078).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0079
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0079
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0079';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0079).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0080
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0080
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0080';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0080).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0081
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0081
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0081';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0081).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0082
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0082
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0082';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0082).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0083
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0083
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0083';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0083).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0084
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0084
     * @tc.desc   Testing the filling of an ArkTS TypedArray within a specified range with specific values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0084';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0084).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0085
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0085
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0085';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0085).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0086
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0086
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0086';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0086).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0087
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0087
     * @tc.desc   Testing if filter returns a new ArkTS TypedArray with elements that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0087';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0087).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0088
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0088
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0088';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0088).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0089
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0089
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0089';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0089).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0090
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0090
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0090';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0090).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0091
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0091
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0091';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0091).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0092
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0092
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0092';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0092).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0093
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0093
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0093';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0093).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0094
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0094
     * @tc.desc   Testing if find returns a new ArkTS TypedArray with the first element that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0094';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0094).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0095
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0095
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0095';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0095).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0096
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0096
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0096';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0096).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0097
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0097
     * @tc.desc   Testing if findIndex returns the first element index that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0097';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0097).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0098
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0098
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0098';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0098).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0099
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0099
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0099';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0099).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0100
     * @tc.desc   Testing if forEach executes the provided callback function for each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0100';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0100).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0101
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0101
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0101';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0101).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0102
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0102
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0102';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0102).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0103
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0103
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0103';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0103).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0104
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0104
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0104';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0104).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0105
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0105
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0105';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0105).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0106
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0106
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0106';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0106).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0107
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0107
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0107';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0107).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0108
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0108
     * @tc.desc   Testing whether indexOf returns the first index of the given element or -1 if it does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0108';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0108).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0109
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0109
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0109';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0109).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0110
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0110
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0110';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0110).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0111
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0111
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0111';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0111).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0112
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0112
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0112';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0112).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0113
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0113
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0113';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0113).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0114
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0114
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0114';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0114).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0115
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0115
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0115';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0115).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0116
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0116
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0116';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0116).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0117
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0117
     * @tc.desc   Testing concatenation of all elements into a string with a specified delimiter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0117';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0117).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0118
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0118
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0118';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0118).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0119
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0119
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0119';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0119).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0120
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0120
     * @tc.desc   Testing applying a callback function to each element to create a new ArkTS TypedArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0120';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0120).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0121
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0121
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0121';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0121).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0122
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0122
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0122';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0122).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0123
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0123
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0123';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0123).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0124
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0124
     * @tc.desc   Testing a reduction function on each element and returning the final result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0124';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0124).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0125
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0125
     * @tc.desc   Testing reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0125';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0125).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0126
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0126
     * @tc.desc   Testing reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0126';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0126).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0127
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0127
     * @tc.desc   Testing reverse.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0127';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0127).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0128
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0128
     * @tc.desc   Testing the set of int16Array, offset is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0128';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0128).then((value) => {
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
     * @tc.name   testInt16ArrayTaskPool0129
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT16_ARRAY_TASKPOOL_0129
     * @tc.desc   Testing the set of int16Array, offset is null, forEach succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInt16ArrayTaskPool0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testInt16ArrayTaskPool0129';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testInt16ArrayTaskPool0129).then((value) => {
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
