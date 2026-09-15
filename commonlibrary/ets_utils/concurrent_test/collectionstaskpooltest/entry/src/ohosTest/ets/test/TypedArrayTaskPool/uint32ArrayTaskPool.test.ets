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
  testUint32ArrayTaskPool0001,
  testUint32ArrayTaskPool0002,
  testUint32ArrayTaskPool0003,
  testUint32ArrayTaskPool0004,
  testUint32ArrayTaskPool0005,
  testUint32ArrayTaskPool0006,
  testUint32ArrayTaskPool0007,
  testUint32ArrayTaskPool0008,
  testUint32ArrayTaskPool0009,
  testUint32ArrayTaskPool0010,
  testUint32ArrayTaskPool0011,
  testUint32ArrayTaskPool0012,
  testUint32ArrayTaskPool0013,
  testUint32ArrayTaskPool0014,
  testUint32ArrayTaskPool0015,
  testUint32ArrayTaskPool0016,
  testUint32ArrayTaskPool0017,
  testUint32ArrayTaskPool0018,
  testUint32ArrayTaskPool0019,
  testUint32ArrayTaskPool0020,
  testUint32ArrayTaskPool0021,
  testUint32ArrayTaskPool0022,
  testUint32ArrayTaskPool0023,
  testUint32ArrayTaskPool0024,
  testUint32ArrayTaskPool0025,
  testUint32ArrayTaskPool0026,
  testUint32ArrayTaskPool0027,
  testUint32ArrayTaskPool0028,
  testUint32ArrayTaskPool0029,
  testUint32ArrayTaskPool0030,
  testUint32ArrayTaskPool0031,
  testUint32ArrayTaskPool0032,
  testUint32ArrayTaskPool0033,
  testUint32ArrayTaskPool0034,
  testUint32ArrayTaskPool0035,
  testUint32ArrayTaskPool0036,
  testUint32ArrayTaskPool0037,
  testUint32ArrayTaskPool0038,
  testUint32ArrayTaskPool0039,
  testUint32ArrayTaskPool0040,
  testUint32ArrayTaskPool0041,
  testUint32ArrayTaskPool0042,
  testUint32ArrayTaskPool0043,
  testUint32ArrayTaskPool0044,
  testUint32ArrayTaskPool0045,
  testUint32ArrayTaskPool0046,
  testUint32ArrayTaskPool0047,
  testUint32ArrayTaskPool0048,
  testUint32ArrayTaskPool0049,
  testUint32ArrayTaskPool0050,
  testUint32ArrayTaskPool0051,
  testUint32ArrayTaskPool0052,
  testUint32ArrayTaskPool0053,
  testUint32ArrayTaskPool0054,
  testUint32ArrayTaskPool0055,
  testUint32ArrayTaskPool0056,
  testUint32ArrayTaskPool0057,
  testUint32ArrayTaskPool0058,
  testUint32ArrayTaskPool0059,
  testUint32ArrayTaskPool0060,
  testUint32ArrayTaskPool0061,
  testUint32ArrayTaskPool0062,
  testUint32ArrayTaskPool0063,
  testUint32ArrayTaskPool0064,
  testUint32ArrayTaskPool0065,
  testUint32ArrayTaskPool0066,
  testUint32ArrayTaskPool0067,
  testUint32ArrayTaskPool0068,
  testUint32ArrayTaskPool0069,
  testUint32ArrayTaskPool0070,
  testUint32ArrayTaskPool0071,
  testUint32ArrayTaskPool0072,
  testUint32ArrayTaskPool0073,
  testUint32ArrayTaskPool0074,
  testUint32ArrayTaskPool0075,
  testUint32ArrayTaskPool0076,
  testUint32ArrayTaskPool0077,
  testUint32ArrayTaskPool0078,
  testUint32ArrayTaskPool0079,
  testUint32ArrayTaskPool0080,
  testUint32ArrayTaskPool0081,
  testUint32ArrayTaskPool0082,
  testUint32ArrayTaskPool0083,
  testUint32ArrayTaskPool0084,
  testUint32ArrayTaskPool0085,
  testUint32ArrayTaskPool0086,
  testUint32ArrayTaskPool0087,
  testUint32ArrayTaskPool0088,
  testUint32ArrayTaskPool0089,
  testUint32ArrayTaskPool0090,
  testUint32ArrayTaskPool0091,
  testUint32ArrayTaskPool0092,
  testUint32ArrayTaskPool0093,
  testUint32ArrayTaskPool0094,
  testUint32ArrayTaskPool0095,
  testUint32ArrayTaskPool0096,
  testUint32ArrayTaskPool0097,
  testUint32ArrayTaskPool0098,
  testUint32ArrayTaskPool0099,
  testUint32ArrayTaskPool0100,
  testUint32ArrayTaskPool0101,
  testUint32ArrayTaskPool0102,
  testUint32ArrayTaskPool0103,
  testUint32ArrayTaskPool0104,
  testUint32ArrayTaskPool0105,
  testUint32ArrayTaskPool0106,
  testUint32ArrayTaskPool0107,
  testUint32ArrayTaskPool0108,
  testUint32ArrayTaskPool0109,
  testUint32ArrayTaskPool0110,
  testUint32ArrayTaskPool0111,
  testUint32ArrayTaskPool0112,
  testUint32ArrayTaskPool0113,
  testUint32ArrayTaskPool0114,
  testUint32ArrayTaskPool0115,
  testUint32ArrayTaskPool0116,
  testUint32ArrayTaskPool0117,
  testUint32ArrayTaskPool0118,
  testUint32ArrayTaskPool0119,
  testUint32ArrayTaskPool0120,
  testUint32ArrayTaskPool0121,
  testUint32ArrayTaskPool0122,
  testUint32ArrayTaskPool0123,
  testUint32ArrayTaskPool0124,
  testUint32ArrayTaskPool0125,
  testUint32ArrayTaskPool0126,
  testUint32ArrayTaskPool0127,
  testUint32ArrayTaskPool0128,
  testUint32ArrayTaskPool0129,
  testUint32ArrayTaskPool0130,
  testUint32ArrayTaskPool0131,
  testUint32ArrayTaskPool0132,
  testUint32ArrayTaskPool0133,
  testUint32ArrayTaskPool0134,
  testUint32ArrayTaskPool0135,
  testUint32ArrayTaskPool0136,
  testUint32ArrayTaskPool0137,
  testUint32ArrayTaskPool0138,
  testUint32ArrayTaskPool0139,
  testUint32ArrayTaskPool0140,
  testUint32ArrayTaskPool0141,
  testUint32ArrayTaskPool0142,
  testUint32ArrayTaskPool0143,
  testUint32ArrayTaskPool0144,
  testUint32ArrayTaskPool0145,
  testUint32ArrayTaskPool0146,
  testUint32ArrayTaskPool0147,
  testUint32ArrayTaskPool0148,
  testUint32ArrayTaskPool0149,
  testUint32ArrayTaskPool0150,
  testUint32ArrayTaskPool0151,
  testUint32ArrayTaskPool0152,
  testUint32ArrayTaskPool0153,
  testUint32ArrayTaskPool0154,
  testUint32ArrayTaskPool0155,
  testUint32ArrayTaskPool0156,
  testUint32ArrayTaskPool0157,
  testUint32ArrayTaskPool0158,
  testUint32ArrayTaskPool0159,
  testUint32ArrayTaskPool0160,
  testUint32ArrayTaskPool0161,
  testUint32ArrayTaskPool0162,
  testUint32ArrayTaskPool0163,
  testUint32ArrayTaskPool0164,
  testUint32ArrayTaskPool0165,
  testUint32ArrayTaskPool0166,
  testUint32ArrayTaskPool0167,
  testUint32ArrayTaskPool0168,
  testUint32ArrayTaskPool0169,
  testUint32ArrayTaskPool0170,
  testUint32ArrayTaskPool0171,
  testUint32ArrayTaskPool0172,
  testUint32ArrayTaskPool0173,
  testUint32ArrayTaskPool0174,
  testUint32ArrayTaskPool0175,
  testUint32ArrayTaskPool0176,
  testUint32ArrayTaskPool0177,
  testUint32ArrayTaskPool0178,
  testUint32ArrayTaskPool0179,
  testUint32ArrayTaskPool0180,
  testUint32ArrayTaskPool0181,
  testUint32ArrayTaskPool0182,
  testUint32ArrayTaskPool0183,
  testUint32ArrayTaskPool0184,
  testUint32ArrayTaskPool0185,
  testUint32ArrayTaskPool0186,
  testUint32ArrayTaskPool0187,
} from '../TypedArray_function/uint32Array_function';

export default function uint32ArrayTaskPoolTest() {
  describe('uint32ArrayTaskPoolTest', () => {
    /**
     * @tc.name   testUint32ArrayTaskPool0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_TASK_POOL_0100
     * @tc.desc   Testing the iterative ability of Uint32Array using a for loop in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayTaskPool0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint32ArrayTaskPool0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint32ArrayTaskPool0001).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8,9,10');
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
     * @tc.name   testUint32ArrayTaskPool0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_TASK_POOL_0200
     * @tc.desc   Testing the iterative ability of Uint32Array using ... deconstruction in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayTaskPool0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint32ArrayTaskPool0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint32ArrayTaskPool0002).then((value) => {
            num++;
            expect(value).assertEqual('1,2,3,4,5,6,7,8,9,10');
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
     * @tc.name   testUint32ArrayTaskPool0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_UINT32ARRAY_TASK_POOL_0300
     * @tc.desc   Testing create an empty ArkTS TypedArray object with Uint32Array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint32ArrayTaskPool0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint32ArrayTaskPool0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint32ArrayTaskPool0003).then((value) => {
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
