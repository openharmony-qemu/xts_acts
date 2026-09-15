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
  testSet0001,
  testSet0002,
  testSet0003,
  testSet0004,
  testSet0005,
  testSet0006,
  testSet0007,
  testSet0008,
  testSet0009,
  testSet0010,
  testSet0011,
  testSet0012,
  testSet0013,
  testSet0014,
  testSet0015,
  testSet0016,
  testSet0017,
  testSet0018,
  testSet0019,
  testSet0020,
  testSet0021,
  testSet0022,
  testSet0023,
  testSet0024,
  testSet0025,
  testSet0026,
  testSet0027,
  testSet0028,
  testSet0029,
  testSet0030,
  testSet0031,
  testSet0032,
  testSet0033,
  testSet0034,
  testSet0035,
  testSet0036,
  testSet0037,
  testSet0038,
  testSet0039,
  testSet0040,
  testSet0041,
  testSet0042,
  testSet0043,
  testSet0044,
  testSet0045,
  testSet0046,
  testSet0047,
  testSet0048,
  testSet0049,
  testSet0050,
  testSet0051,
  testSet0052,
  testSet0053,
  testSet0054,
  testSet0055,
  testSet0056,
  testSet0057,
  testSet0058,
  testSet0059,
  testSet0060,
  testSet0061,
  testSet0062,
  testSet0063,
  testSet0064,
  testSet0065,
  testSet0066,
  testSet0067,
  testSet0068,
  testSet0069,
  testSet0070,
  testSet0071,
  testSet0072,
  testSet0073,
  testSet0074,
  testSet0075,
  testSet0076,
  testSet0077,
  testSet0078,
  testSet0079,
  testSet0080,
  testSet0081,
  testSet0082,
  testSet0083,
  testSet0084,
  testSet0085,
  testSet0086,
  testSet0087,
  testSet0088,
  testSet0089,
  testSet0090,
  testSet0091,
  testSet0092,
  testSet0093,
  testSet0094,
  testSet0095,
  testSet0096,
  testSet0097,
  testSet0098,
  testSet0099,
  testSet0100,
  testSet0101,
  testSet0102,
  testSet0103,
  testSet0104,
  testSet0105,
  testSet0106,
  testSet0107,
  testSet0108,
  testSet0109,
  testSet0110,
  testSet0111,
  testSet0112,
  testSet0113,
  testSet0114,
  testSet0115,
  testSet0116,
  testSet0117,
  testSet0118,
  testSet0119,
  testSet0120,
  testSet0121,
  testSet0122,
  testSet0123,
  testSet0124,
  testSet0125,
  testSet0126,
  testSet0127,
  testSet0128,
  testSet0129,
  testSet0130,
  testSet0131,
  testSet0132,
  testSet0133,
  testSet0134,
  testSet0135
} from './Set_function';

export default function SetTaskPoolTest() {
  describe('SetTaskPoolTest', () => {
    /**
     * @tc.name   testSet0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0100
     * @tc.desc   Testing the set for 1~10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0001).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testSet0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0200
     * @tc.desc   Testing the size of set, set is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0002).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testSet0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0300
     * @tc.desc   Testing the size of set, set is not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0003).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testSet0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0400
     * @tc.desc   Testing the size of set, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0004).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testSet0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0500
     * @tc.desc   Testing the size of set, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0005).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testSet0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0600
     * @tc.desc   Testing the size of set, clear set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0006).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testSet0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0700
     * @tc.desc   Testing the size of set, add repeating element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0007';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0007).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testSet0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0800
     * @tc.desc   Testing the Constructor of set, element is string, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0008';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0008).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testSet0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_0900
     * @tc.desc   Testing the Constructor of set, element is string, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0009';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0009).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testSet0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1000
     * @tc.desc   Testing the Constructor of set, element is string, has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0010';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0010).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testSet0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1100
     * @tc.desc   Testing the Constructor of set, element is number, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0011';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0011).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testSet0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1200
     * @tc.desc   Testing the Constructor of set, element is number, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0012';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0012).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testSet0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1300
     * @tc.desc   Testing the Constructor of set, element is number, has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0013';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0013).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testSet0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1400
     * @tc.desc   Testing the Constructor of set, element is boolean, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0014';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0014).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testSet0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1500
     * @tc.desc   Testing the Constructor of set, element is boolean, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0015';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0015).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
      done()
    })
    /**
     * @tc.name   testSet0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_SET_1600
     * @tc.desc   Testing the Constructor of set, element is boolean, has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
