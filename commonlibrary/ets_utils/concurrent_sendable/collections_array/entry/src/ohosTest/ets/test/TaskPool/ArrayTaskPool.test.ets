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
