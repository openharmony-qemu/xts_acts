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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0001
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
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0002
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
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0003
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
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0004
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
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0005
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
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0006
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
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0007
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
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0008
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
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0009
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
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0010
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
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0011
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
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0012
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
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0013
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
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0014
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
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0015
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
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
          await sleep(100);
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0016
     * @tc.desc   Testing the Constructor of set, element is boolean, has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0016';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0016).then((value) => {
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
     * @tc.name   testSet0017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0017
     * @tc.desc   Testing the Constructor of set, element is undefined, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0017';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0017).then((value) => {
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
     * @tc.name   testSet0018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0018
     * @tc.desc   Testing the Constructor of set, element is undefined, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0018';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0018).then((value) => {
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
     * @tc.name   testSet0019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0019
     * @tc.desc   Testing the Constructor of set, element is undefined, has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0019';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0019).then((value) => {
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
     * @tc.name   testSet0020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0020
     * @tc.desc   Testing the Constructor of set, element is null, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0020';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0020).then((value) => {
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
     * @tc.name   testSet0021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0021
     * @tc.desc   Testing the Constructor of set, element is null, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0021';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0021).then((value) => {
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
     * @tc.name   testSet0022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0022
     * @tc.desc   Testing the Constructor of set, element is null, has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0022';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0022).then((value) => {
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
     * @tc.name   testSet0023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0023
     * @tc.desc   Testing the Constructor of set, element is bigint, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0023';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0023).then((value) => {
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
     * @tc.name   testSet0024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0024
     * @tc.desc   Testing the Constructor of set, element is bigint, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0024';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0024).then((value) => {
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
     * @tc.name   testSet0025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0025
     * @tc.desc   Testing the Constructor of set, element is bigint, has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0025';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0025).then((value) => {
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
     * @tc.name   testSet0026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0026
     * @tc.desc   Testing the Constructor of set, element is Array, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0026';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0026).then((value) => {
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
     * @tc.name   testSet0027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0027
     * @tc.desc   Testing the Constructor of set, element is Array, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0027';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0027).then((value) => {
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
     * @tc.name   testSet0028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0028
     * @tc.desc   Testing the Constructor of set, element is Array, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0028';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0028).then((value) => {
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
     * @tc.name   testSet0029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0029
     * @tc.desc   Testing the Constructor of set, element is Map, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0029';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0029).then((value) => {
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
     * @tc.name   testSet0030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0030
     * @tc.desc   Testing the Constructor of set, element is Map, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0030';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0030).then((value) => {
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
     * @tc.name   testSet0031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0031
     * @tc.desc   Testing the Constructor of set, element is Map, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0031';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0031).then((value) => {
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
     * @tc.name   testSet0032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0032
     * @tc.desc   Testing the Constructor of set, element is Set, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0032';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0032).then((value) => {
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
     * @tc.name   testSet0033
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0033
     * @tc.desc   Testing the Constructor of set, element is Set, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0033';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0033).then((value) => {
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
     * @tc.name   testSet0034
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0034
     * @tc.desc   Testing the Constructor of set, element is Set, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0034';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0034).then((value) => {
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
     * @tc.name   testSet0035
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0035
     * @tc.desc   Testing the Constructor of set, element is ArrayBuffer, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0035';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0035).then((value) => {
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
     * @tc.name   testSet0036
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0036
     * @tc.desc   Testing the Constructor of set, element is ArrayBuffer, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0036';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0036).then((value) => {
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
     * @tc.name   testSet0037
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0037
     * @tc.desc   Testing the Constructor of set, element is ArrayBuffer, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0037';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0037).then((value) => {
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
     * @tc.name   testSet0038
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0038
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int8Array), add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0038';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0038).then((value) => {
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
     * @tc.name   testSet0039
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0039
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int8Array), delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0039';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0039).then((value) => {
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
     * @tc.name   testSet0040
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0040
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int8Array), has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0040';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0040).then((value) => {
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
     * @tc.name   testSet0041
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0041
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint8Array), add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0041';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0041).then((value) => {
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
     * @tc.name   testSet0042
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0042
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint8Array), delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0042';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0042).then((value) => {
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
     * @tc.name   testSet0043
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0043
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint8Array), has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0043';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0043).then((value) => {
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
     * @tc.name   testSet0044
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0044
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint8ClampedArray), add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0044';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0044).then((value) => {
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
     * @tc.name   testSet0045
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0045
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint8ClampedArray), delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0045';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0045).then((value) => {
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
     * @tc.name   testSet0046
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0046
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint8ClampedArray), has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0046';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0046).then((value) => {
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
     * @tc.name   testSet0047
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0047
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int16Array), add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0047';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0047).then((value) => {
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
     * @tc.name   testSet0048
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0048
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int16Array), delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0048';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0048).then((value) => {
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
     * @tc.name   testSet0049
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0049
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int16Array), has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0049';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0049).then((value) => {
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
     * @tc.name   testSet0050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0050
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint16Array), add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0050';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0050).then((value) => {
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
     * @tc.name   testSet0051
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0051
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint16Array), delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0051';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0051).then((value) => {
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
     * @tc.name   testSet0052
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0052
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint16Array), has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0052';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0052).then((value) => {
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
     * @tc.name   testSet0053
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0053
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int32Array), add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0053';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0053).then((value) => {
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
     * @tc.name   testSet0054
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0054
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int32Array), delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0054';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0054).then((value) => {
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
     * @tc.name   testSet0055
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0055
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int32Array), has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0055';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0055).then((value) => {
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
     * @tc.name   testSet0056
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0056
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Float32Array), add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0056';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0056).then((value) => {
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
     * @tc.name   testSet0057
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0057
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Float32Array), delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0057';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0057).then((value) => {
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
     * @tc.name   testSet0058
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0058
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Float32Array), has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0058';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0058).then((value) => {
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
     * @tc.name   testSet0059
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0059
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint32Array), add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0059';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0059).then((value) => {
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
     * @tc.name   testSet0060
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0060
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint32Array), delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0060';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0060).then((value) => {
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
     * @tc.name   testSet0061
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0061
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint32Array), has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0061';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0061).then((value) => {
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
     * @tc.name   testSet0062
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0062
     * @tc.desc   Testing the Constructor of set, element is ConcatArray, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0062';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0062).then((value) => {
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
     * @tc.name   testSet0063
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0063
     * @tc.desc   Testing the Constructor of set, element is ConcatArray, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0063';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0063).then((value) => {
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
     * @tc.name   testSet0064
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0064
     * @tc.desc   Testing the Constructor of set, element is ConcatArray, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0064';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0064).then((value) => {
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
     * @tc.name   testSet0065
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0065
     * @tc.desc   Testing the Constructor of set, element is ConcatArray, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0065';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0065).then((value) => {
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
     * @tc.name   testSet0066
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0066
     * @tc.desc   Testing the Constructor of set, element is Array, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0066';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0066).then((value) => {
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
     * @tc.name   testSet0067
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0067
     * @tc.desc   Testing the Constructor of set, element is Map, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0067';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0067).then((value) => {
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
     * @tc.name   testSet0068
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0068
     * @tc.desc   Testing the Constructor of set, element is Set, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0068';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0068).then((value) => {
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
     * @tc.name   testSet0069
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0069
     * @tc.desc   Testing the Constructor of set, element is string, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0069';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0069).then((value) => {
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
     * @tc.name   testSet0070
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0070
     * @tc.desc   Testing the Constructor of set, element is number, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0070';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0070).then((value) => {
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
     * @tc.name   testSet0071
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0071
     * @tc.desc   Testing the Constructor of set, element is boolean, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0071';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0071).then((value) => {
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
     * @tc.name   testSet0072
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0072
     * @tc.desc   Testing the Constructor of set, element is undefined, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0072';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0072).then((value) => {
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
     * @tc.name   testSet0073
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0073
     * @tc.desc   Testing the Constructor of set, element is null, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0073';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0073).then((value) => {
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
     * @tc.name   testSet0074
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0074
     * @tc.desc   Testing the Constructor of set, element is bigint, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0074';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0074).then((value) => {
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
     * @tc.name   testSet0075
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0075
     * @tc.desc   Testing the Constructor of set, element is ArrayBuffer, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0075';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0075).then((value) => {
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
     * @tc.name   testSet0076
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0076
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int8Array), clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0076';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0076).then((value) => {
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
     * @tc.name   testSet0077
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0077
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint8Array), clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0077';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0077).then((value) => {
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
     * @tc.name   testSet0078
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0078
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint8ClampedArray), clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0078';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0078).then((value) => {
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
     * @tc.name   testSet0079
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0079
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int16Array), clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0079';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0079).then((value) => {
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
     * @tc.name   testSet0080
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0080
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint16Array), clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0080';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0080).then((value) => {
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
     * @tc.name   testSet0081
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0081
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Int32Array), clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0081';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0081).then((value) => {
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
     * @tc.name   testSet0082
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0082
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Uint32Array), clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0082';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0082).then((value) => {
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
     * @tc.name   testSet0083
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0083
     * @tc.desc   Testing the Constructor of set, element is TypedArray(Float32Array), clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0083';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0083).then((value) => {
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
     * @tc.name   testSet0084
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0084
     * @tc.desc   Testing the Constructor of set, element is collections.BitVector, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0084';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0084).then((value) => {
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
     * @tc.name   testSet0085
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0085
     * @tc.desc   Testing the Constructor of set, element is collections.BitVector, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0085';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0085).then((value) => {
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
     * @tc.name   testSet0086
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0086
     * @tc.desc   Testing the Constructor of set, element is collections.BitVector, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0086';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0086).then((value) => {
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
     * @tc.name   testSet0087
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0087
     * @tc.desc   Testing the Constructor of set, element is collections.BitVector, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0087';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0087).then((value) => {
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
     * @tc.name   testSet0088
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0088
     * @tc.desc   Testing the Constructor of set, element is ArkTSUtils.locks.AsyncLock, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0088';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0088).then((value) => {
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
     * @tc.name   testSet0089
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0089
     * @tc.desc   Testing the Constructor of set, element is ArkTSUtils.locks.AsyncLock, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0089';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0089).then((value) => {
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
     * @tc.name   testSet0090
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0090
     * @tc.desc   Testing the Constructor of set, element is ArkTSUtils.locks.AsyncLock, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0090';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0090).then((value) => {
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
     * @tc.name   testSet0091
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0091
     * @tc.desc   Testing the Constructor of set, element is ArkTSUtils.locks.AsyncLock, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0091';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0091).then((value) => {
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
     * @tc.name   testSet0092
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0092
     * @tc.desc   Testing the Constructor of set, element is sendableClass, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0092';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0092).then((value) => {
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
     * @tc.name   testSet0093
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0093
     * @tc.desc   Testing the Constructor of set, element is sendableClass, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0093';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0093).then((value) => {
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
     * @tc.name   testSet0094
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0094
     * @tc.desc   Testing the Constructor of set, element is sendableClass, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0094';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0094).then((value) => {
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
     * @tc.name   testSet0095
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0095
     * @tc.desc   Testing the Constructor of set, element is sendableClass, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0095';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0095).then((value) => {
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
     * @tc.name   testSet0096
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0096
     * @tc.desc   Testing the Constructor of set, element is union, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0096';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0096).then((value) => {
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
     * @tc.name   testSet0097
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0097
     * @tc.desc   Testing the Constructor of set, element is union, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0097';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0097).then((value) => {
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
     * @tc.name   testSet0098
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0098
     * @tc.desc   Testing the Constructor of set, element is union, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0098';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0098).then((value) => {
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
     * @tc.name   testSet0099
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0099
     * @tc.desc   Testing the Constructor of set, element is union, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0099';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0099).then((value) => {
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
     * @tc.name   testSet0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0100
     * @tc.desc   Testing the Constructor of set, element is sendable class of extends, add.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0100';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0100).then((value) => {
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
     * @tc.name   testSet0101
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0101
     * @tc.desc   Testing the Constructor of set, element is sendable class of extends, delete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0101';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0101).then((value) => {
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
     * @tc.name   testSet0102
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0102
     * @tc.desc   Testing the Constructor of set, element is sendable class of extends, clear.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0102';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0102).then((value) => {
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
     * @tc.name   testSet0103
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0103
     * @tc.desc   Testing the Constructor of set, element is sendable class of extends, has.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0103';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0103).then((value) => {
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
     * @tc.name   testSet0104
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0104
     * @tc.desc   Testing the entries of set, set is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0104';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0104).then((value) => {
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
     * @tc.name   testSet0105
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0105
     * @tc.desc   Testing the entries of set, set is not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0105';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0105).then((value) => {
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
     * @tc.name   testSet0106
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0106
     * @tc.desc   Testing the entries of set, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0106';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0106).then((value) => {
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
     * @tc.name   testSet0107
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0107
     * @tc.desc   Testing the entries of set, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0107';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0107).then((value) => {
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
     * @tc.name   testSet0108
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0108
     * @tc.desc   Testing the entries of set, clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0108';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0108).then((value) => {
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
     * @tc.name   testSet0109
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0109
     * @tc.desc   Testing the forEach of set, set is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0109';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0109).then((value) => {
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
     * @tc.name   testSet0110
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0110
     * @tc.desc   Testing the forEach of set, set is not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0110';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0110).then((value) => {
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
     * @tc.name   testSet0111
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0111
     * @tc.desc   Testing the forEach of set, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0111';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0111).then((value) => {
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
     * @tc.name   testSet0112
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0112
     * @tc.desc   Testing the forEach of set, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0112';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0112).then((value) => {
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
     * @tc.name   testSet0113
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0113
     * @tc.desc   Testing the forEach of set, clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0113';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0113).then((value) => {
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
     * @tc.name   testSet0114
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0114
     * @tc.desc   Testing the keys of set, set is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0114';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0114).then((value) => {
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
     * @tc.name   testSet0115
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0115
     * @tc.desc   Testing the keys of set, set is not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0115';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0115).then((value) => {
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
     * @tc.name   testSet0116
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0116
     * @tc.desc   Testing the values of set, set is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0116';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0116).then((value) => {
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
     * @tc.name   testSet0117
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0117
     * @tc.desc   Testing the values of set, set is not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0117';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0117).then((value) => {
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
     * @tc.name   testSet0118
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0118
     * @tc.desc   Testing the values of set, set is not null, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0118';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0118).then((value) => {
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
     * @tc.name   testSet0119
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0119
     * @tc.desc   Testing the values of set, set is not null, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0119';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0119).then((value) => {
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
     * @tc.name   testSet0120
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0120
     * @tc.desc   Testing the values of set, set is not null, clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0120';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0120).then((value) => {
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
     * @tc.name   testSet0121
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0121
     * @tc.desc   Testing the clear of set, set is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0121';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0121).then((value) => {
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
     * @tc.name   testSet0122
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0122
     * @tc.desc   Testing the clear of set, set is not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0122';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0122).then((value) => {
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
     * @tc.name   testSet0123
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0123
     * @tc.desc   Testing the clear of set, set is not null, clear, add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0123';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0123).then((value) => {
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
     * @tc.name   testSet0124
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0124
     * @tc.desc   Testing the delete of set, delete non-exist keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0124';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0124).then((value) => {
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
     * @tc.name   testSet0125
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0125
     * @tc.desc   Testing the delete of set, delete exist keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0125';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0125).then((value) => {
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
     * @tc.name   testSet0126
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0126
     * @tc.desc   Testing the delete of set, delete null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0126';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0126).then((value) => {
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
     * @tc.name   testSet0127
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0127
     * @tc.desc   Testing the delete of set, delete undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0127';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0127).then((value) => {
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
     * @tc.name   testSet0128
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0128
     * @tc.desc   Testing the has of set, has non-exist keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0128';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0128).then((value) => {
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
     * @tc.name   testSet0129
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0129
     * @tc.desc   Testing the has of set, has exist keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0129';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0129).then((value) => {
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
     * @tc.name   testSet0130
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0130
     * @tc.desc   Testing the has of set, has null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0130';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0130).then((value) => {
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
     * @tc.name   testSet0131
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0131
     * @tc.desc   Testing the has of set, has undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0131';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0131).then((value) => {
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
     * @tc.name   testSet0132
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0132
     * @tc.desc   Testing the add of set, add non-exist value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0132';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0132).then((value) => {
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
     * @tc.name   testSet0133
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0133
     * @tc.desc   Testing the add of set, add exist value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0133';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0133).then((value) => {
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
     * @tc.name   testSet0134
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0134
     * @tc.desc   Testing the add of set, add null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0134';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0134).then((value) => {
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
     * @tc.name   testSet0135
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SET_TASKPOOL_0135
     * @tc.desc   Testing the add of set, add undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSet0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSet0135';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSet0135).then((value) => {
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
  })
}