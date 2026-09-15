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
import { taskpool } from '@kit.ArkTS';
import {
  sleep,
  testCollectionsArray0001,
  testCollectionsArray0002,
  testCollectionsArray0003,
  testCollectionsArray0004,
  testCollectionsArray0005,
  testCollectionsArray0006,
  testCollectionsArray0007,
  testCollectionsArray0008,
  testCollectionsArray0009,
  testCollectionsArray0010,
  testCollectionsArray0011,
  testCollectionsArray0012,
  testCollectionsArray0013,
  testCollectionsArray0014,
  testCollectionsArray0015,
  testCollectionsArray0016,
  testCollectionsArray0017,
  testCollectionsArray0018,
  testCollectionsArray0019,
  testCollectionsArray0020,
  testCollectionsArray0021,
  testCollectionsArray0022,
  testCollectionsArray0023,
  testCollectionsArray0024,
  testCollectionsArray0025,
  testCollectionsArray0026,
  testCollectionsArray0027,
  testCollectionsArray0028,
  testCollectionsArray0029,
  testCollectionsArray0030,
  testCollectionsArray0031,
  testCollectionsArray0032,
  testCollectionsArray0033,
  testCollectionsArray0034,
  testCollectionsArray0035,
  testCollectionsArray0036,
  testCollectionsArray0037,
  testCollectionsArray0038,
  testCollectionsArray0039,
  testCollectionsArray0040,
  testCollectionsArray0041,
  testCollectionsArray0042,
  testCollectionsArray0043,
  testCollectionsArray0044,
  testCollectionsArray0045,
  testCollectionsArray0046,
  testCollectionsArray0047,
  testCollectionsArray0048,
  testCollectionsArray0049,
  testCollectionsArray0050,
  testCollectionsArray0051,
  testCollectionsArray0052,
  testCollectionsArray0053,
  testCollectionsArray0054,
  testCollectionsArray0055,
  testCollectionsArray0056,
  testCollectionsArray0057,
  testCollectionsArray0058,
  testCollectionsArray0059,
  testCollectionsArray0060,
  testCollectionsArray0061,
  testCollectionsArray0062,
  testCollectionsArray0063,
  testCollectionsArray0064,
  testCollectionsArray0065,
  testCollectionsArray0066,
  testCollectionsArray0067,
  testCollectionsArray0068,
  testCollectionsArray0069,
  testCollectionsArray0070,
  testCollectionsArray0071,
  testCollectionsArray0072,
  testCollectionsArray0073,
  testCollectionsArray0074,
  testCollectionsArray0075,
  testCollectionsArray0076,
  testCollectionsArray0077,
  testCollectionsArray0078,
  testCollectionsArray0079,
  testCollectionsArray0080,
  testCollectionsArray0081,
  testCollectionsArray0082,
  testCollectionsArray0083,
  testCollectionsArray0084,
  testCollectionsArray0085,
  testCollectionsArray0086,
  testCollectionsArray0087,
  testCollectionsArray0088,
  testCollectionsArray0089,
  testCollectionsArray0090,
  testCollectionsArray0091,
  testCollectionsArray0092,
  testCollectionsArray0093,
  testCollectionsArray0094,
  testCollectionsArray0095,
  testCollectionsArray0096,
  testCollectionsArray0097,
  testCollectionsArray0098,
  testCollectionsArray0099,
  testCollectionsArray0100,
  testCollectionsArray0101,
  testCollectionsArray0102,
  testCollectionsArray0103,
  testCollectionsArray0104,
  testCollectionsArray0105,
  testCollectionsArray0106,
  testCollectionsArray0107,
  testCollectionsArray0108,
  testCollectionsArray0109,
  testCollectionsArray0110,
  testCollectionsArray0111,
  testCollectionsArray0112,
  testCollectionsArray0113,
  testCollectionsArray0114,
  testCollectionsArray0115,
  testCollectionsArray0116,
  testCollectionsArray0117,
  testCollectionsArray0118,
  testCollectionsArray0119,
  testCollectionsArray0120,
  testCollectionsArray0121,
  testCollectionsArray0122,
  testCollectionsArray0123,
  testCollectionsArray0124,
  testCollectionsArray0125,
  testCollectionsArray0126,
  testCollectionsArray0127,
  testCollectionsArray0128,
  testCollectionsArray0129,
  testCollectionsArray0130,
  testCollectionsArray0131,
  testCollectionsArray0132,
  testCollectionsArray0133,
  testCollectionsArray0134,
  testCollectionsArray0135,
  testCollectionsArray0136,
  testCollectionsArray0137,
  testCollectionsArray0138,
  testCollectionsArray0139,
  testCollectionsArray0140,
  testCollectionsArray0141,
  testCollectionsArray0142,
  testCollectionsArray0143,
  testCollectionsArray0144,
  testCollectionsArray0145,
  testCollectionsArray0146,
  testCollectionsArray0147,
  testCollectionsArray0148,
  testCollectionsArray0149,
  testCollectionsArray0150,
  testCollectionsArray0151,
  testCollectionsArray0152,
  testCollectionsArray0153,
  testCollectionsArray0154,
  testCollectionsArray0155,
  testCollectionsArray0156,
  testCollectionsArray0157,
  testCollectionsArray0158,
  testCollectionsArray0159,
  testCollectionsArray0160,
  testCollectionsArray0161,
  testCollectionsArray0162,
  testCollectionsArray0163,
  testCollectionsArray0164,
  testCollectionsArray0165,
  testCollectionsArray0166,
  testCollectionsArray0167,
  testCollectionsArray0168,
  testCollectionsArray0169,
  testCollectionsArray0170,
  testCollectionsArray0171,
  testCollectionsArray0172,
  testCollectionsArray0173,
  testCollectionsArray0174,
  testCollectionsArray0175,
  testCollectionsArray0176,
  testCollectionsArray0177,
  testCollectionsArray0178,
  testCollectionsArray0179,
  testCollectionsArray0180,
  testCollectionsArray0181,
  testCollectionsArray0182,
  testCollectionsArray0183,
  testCollectionsArray0184,
  testCollectionsArray0185,
  testCollectionsArray0186,
  testCollectionsArray0187,
  testCollectionsArray0188,
  testCollectionsArray0189,
  testCollectionsArray0190,
  testCollectionsArray0191,
  testCollectionsArray0192,
  testCollectionsArray0193,
  testCollectionsArray0194,
  testCollectionsArray0195,
  testCollectionsArray0196,
  testCollectionsArray0197,
  testCollectionsArray0198,
  testCollectionsArray0199,
  testCollectionsArray0200,
  testCollectionsArray0201,
  testCollectionsArray0202,
  testCollectionsArray0203,
  testCollectionsArray0204,
  testCollectionsArray0205,
  testCollectionsArray0206,
  testCollectionsArray0207,
  testCollectionsArray0208,
  testCollectionsArray0209,
  testCollectionsArray0210,
  testCollectionsArray0211,
} from './Array_function';

export default function ArrayTaskPoolTest() {
  describe('ArrayTaskPoolTest', () => {
    /**
     * @tc.name   testCollectionsArray0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0001
     * @tc.desc   Testing the iterative ability of Int8Array using a for loop in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0001).then((value) => {
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
     * @tc.name   testCollectionsArray0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0002
     * @tc.desc   Testing the iterative ability of Int8Array using a for loop in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 100; i++) {
          taskpool.execute(testCollectionsArray0002).then((value) => {
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
     * @tc.name   testCollectionsArray0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0003
     * @tc.desc   Testing Collections of Array Constructor, not new.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0003).then((value) => {
            num++;
            expect(value).assertEqual('1');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0004
     * @tc.desc   Testing Collections of Array Constructor, param string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0004).then((value) => {
            num++;
            expect(value).assertEqual('a,b');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0005
     * @tc.desc   Testing Collections of Array Constructor, param number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0005).then((value) => {
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
     * @tc.name   testCollectionsArray0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0006
     * @tc.desc   Testing Collections of Array Constructor, param boolean.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0006).then((value) => {
            num++;
            expect(value).assertEqual('true,false,true');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0007
     * @tc.desc   Testing Collections of Array Constructor, param undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0007';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0007).then((value) => {
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
     * @tc.name   testCollectionsArray0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0008
     * @tc.desc   Testing Collections of Array Constructor, param null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0008';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0008).then((value) => {
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
     * @tc.name   testCollectionsArray0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0009
     * @tc.desc   Testing Collections of Array Constructor, param bigint.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0009';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0009).then((value) => {
            num++;
            expect(value).assertEqual('98765432109876543210,12345678901234567890');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0010
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0010';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0010).then((value) => {
            num++;
            expect(value).assertEqual('1,2,4,6,8');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0011
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0011';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0011).then((value) => {
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
     * @tc.name   testCollectionsArray0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0012
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0012';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0012).then((value) => {
            num++;
            expect(value).assertEqual('1,2,4');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0013
     * @tc.desc   Testing Collections of Array Constructor, collections.Array<collections.Array>.push element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0013';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0013).then((value) => {
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
     * @tc.name   testCollectionsArray0014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0014
     * @tc.desc   Testing Collections of Array Constructor, collections.Array<collections.Array>.pop element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0014';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0014).then((value) => {
            num++;
            expect(value).assertEqual('Before is 1,2,3,4,5,6 and After is 1,2,3');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0015
     * @tc.desc   Testing Collections of Array Constructor, collections.Array<collections.Array>.index element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0015';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0015).then((value) => {
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
     * @tc.name   testCollectionsArray0016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0016
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0016';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0016).then((value) => {
            num++;
            expect(value).assertEqual('10,20');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0017
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0017';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0017).then((value) => {
            num++;
            expect(value).assertEqual('10,20,10');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0018
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0018';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0018).then((value) => {
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
     * @tc.name   testCollectionsArray0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0019
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0019';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0019).then((value) => {
            num++;
            expect(value).assertEqual('-1,2,3,8,9');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0020
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0020';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0020).then((value) => {
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
     * @tc.name   testCollectionsArray0021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0021
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0021';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0021).then((value) => {
            num++;
            expect(value).assertEqual('Before is true and After is 8,9');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0022
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0022';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0022).then((value) => {
            num++;
            expect(value).assertEqual('255,2,3,8,9');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0023
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0023';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0023).then((value) => {
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
     * @tc.name   testCollectionsArray0024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0024
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0024';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0024).then((value) => {
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
     * @tc.name   testCollectionsArray0025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0025
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0025';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0025).then((value) => {
            num++;
            expect(value).assertEqual('0,50,90,150,255');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0026
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0026';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0026).then((value) => {
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
     * @tc.name   testCollectionsArray0027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0027
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0027';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0027).then((value) => {
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
     * @tc.name   testCollectionsArray0028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0028
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0028';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0028).then((value) => {
            num++;
            expect(value).assertEqual('-10,50,100');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0029
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0029';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0029).then((value) => {
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
     * @tc.name   testCollectionsArray0030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0030
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0030';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0030).then((value) => {
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
     * @tc.name   testCollectionsArray0031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0031
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0031';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0031).then((value) => {
            num++;
            expect(value).assertEqual('65526,50,100');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0032
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0032';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0032).then((value) => {
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
     * @tc.name   testCollectionsArray0033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0033
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0033';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0033).then((value) => {
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
     * @tc.name   testCollectionsArray0034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0034
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0034';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0034).then((value) => {
            num++;
            expect(value).assertEqual('-10,50,100');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0035
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0035
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0035';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0035).then((value) => {
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
     * @tc.name   testCollectionsArray0036
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0036
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0036';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0036).then((value) => {
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
     * @tc.name   testCollectionsArray0037
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0037
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0037';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0037).then((value) => {
            num++;
            expect(value).assertEqual('4294967286,50,100');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0038
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0038
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0038';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0038).then((value) => {
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
     * @tc.name   testCollectionsArray0039
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0039
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0039';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0039).then((value) => {
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
     * @tc.name   testCollectionsArray0040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0040
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0040';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0040).then((value) => {
            num++;
            expect(value).assertEqual('0,5,10');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0041
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0041
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0041';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0041).then((value) => {
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
     * @tc.name   testCollectionsArray0042
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0042
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0042';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0042).then((value) => {
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
     * @tc.name   testCollectionsArray0043
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0043
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0043';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0043).then((value) => {
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
     * @tc.name   testCollectionsArray0044
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0044
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0044';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0044).then((value) => {
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
     * @tc.name   testCollectionsArray0045
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0045
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0045';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0045).then((value) => {
            num++;
            expect(value).assertEqual('foo,bar');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0046
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0046
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0046';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0046).then((value) => {
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
     * @tc.name   testCollectionsArray0047
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0047
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0047';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0047).then((value) => {
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
     * @tc.name   testCollectionsArray0048
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0048
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0048';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0048).then((value) => {
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
     * @tc.name   testCollectionsArray0049
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0049
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0049';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0049).then((value) => {
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
     * @tc.name   testCollectionsArray0050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0050
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0050';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0050).then((value) => {
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
     * @tc.name   testCollectionsArray0051
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0051
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0051';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0051).then((value) => {
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
     * @tc.name   testCollectionsArray0052
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0052
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0052';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0052).then((value) => {
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
     * @tc.name   testCollectionsArray0053
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0053
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0053';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0053).then((value) => {
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
     * @tc.name   testCollectionsArray0054
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0054
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0054';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0054).then((value) => {
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
     * @tc.name   testCollectionsArray0055
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0055
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0055';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0055).then((value) => {
            num++;
            expect(value).assertEqual(30);
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0056
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0056
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0056';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0056).then((value) => {
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
     * @tc.name   testCollectionsArray0057
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0057
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0057';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0057).then((value) => {
            num++;
            expect(value).assertEqual(22);
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0058
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0058
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0058';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0058).then((value) => {
            num++;
            expect(value).assertEqual(30);
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0059
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0059
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0059';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0059).then((value) => {
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
     * @tc.name   testCollectionsArray0060
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0060
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0060';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0060).then((value) => {
            num++;
            expect(value).assertEqual('2,20');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0061
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0061
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0061';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0061).then((value) => {
            num++;
            expect(value).assertEqual('1,a');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0062
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0062
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0062';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0062).then((value) => {
            num++;
            expect(value).assertEqual('1,a,2');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0063
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0063
     * @tc.desc   Testing Collections of Array Constructor,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0063';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0063).then((value) => {
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
     * @tc.name   testCollectionsArray0064
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0064
     * @tc.desc   Testing Collections of Array create, arrayLength -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0064';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0064).then((value) => {
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
     * @tc.name   testCollectionsArray0065
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0065
     * @tc.desc   Testing Collections of Array create, arrayLength 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0065';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0065).then((value) => {
            num++;
            expect(value).assertEqual(',0');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0066
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0066
     * @tc.desc   Testing Collections of Array create, arrayLength 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0066';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0066).then((value) => {
            num++;
            expect(value).assertEqual('3,3,3,3,3,3,3,3,3,3,10');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0067
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0067
     * @tc.desc   Testing Collections of Array create, arrayLength 100000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0067';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0067).then((value) => {
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
     * @tc.name   testCollectionsArray0068
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0068
     * @tc.desc   Testing Collections of Array create, arrayLength 1,initialValue RegExp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0068';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0068).then((value) => {
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
     * @tc.name   testCollectionsArray0069
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0069
     * @tc.desc   Testing Collections of Array from, arrayLike Array<T>.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0069';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0069).then((value) => {
            num++;
            expect(value).assertEqual('d,e,f');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0070
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0070
     * @tc.desc   Testing Collections of Array from, arrayLike [].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0070';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0070).then((value) => {
            num++;
            expect(value).assertEqual(',0');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0071
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0071
     * @tc.desc   Testing Collections of Array from, arrayLike [null].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0071';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0071).then((value) => {
            num++;
            expect(value).assertEqual(',1');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0072
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0072
     * @tc.desc   Testing Collections of Array from, arrayLike [undefined].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0072';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0072).then((value) => {
            num++;
            expect(value).assertEqual(',1');
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0073
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0073
     * @tc.desc   Testing Collections of Array from, arrayLike arrayLike abnormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0073';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0073).then((value) => {
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
     * @tc.name   testCollectionsArray0074
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0074
     * @tc.desc   Testing Collections of Array pop, non collectionsArray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0074';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0074).then((value) => {
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
     * @tc.name   testCollectionsArray0075
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0075
     * @tc.desc   Testing Collections of Array pop, collectionsArray is ''.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0075';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0075).then((value) => {
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
     * @tc.name   testCollectionsArray0076
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0076
     * @tc.desc   Testing Collections of Array pop, collectionsArray is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0076';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0076).then((value) => {
            num++;
            expect(value).assertEqual(null);
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testCollectionsArray0077
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0077
     * @tc.desc   Testing Collections of Array pop, collectionsArray is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0077';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0077).then((value) => {
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
     * @tc.name   testCollectionsArray0078
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0078
     * @tc.desc   Testing Collections of Array pop, collectionsArray is [1,2,3].
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0078';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0078).then((value) => {
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
     * @tc.name   testCollectionsArray0079
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0079
     * @tc.desc   Testing Collections of Array push, push non.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0079';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0079).then((value) => {
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
    });
    /**
     * @tc.name   testCollectionsArray0080
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0080
     * @tc.desc   Testing Collections of Array push, push 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0080';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0080).then((value) => {
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
     * @tc.name   testCollectionsArray0081
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_TASKPOOL_0081
     * @tc.desc   Testing Collections of Array push, push ''.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArray0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testCollectionsArray0081';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testCollectionsArray0081).then((value) => {
