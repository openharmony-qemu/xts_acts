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
