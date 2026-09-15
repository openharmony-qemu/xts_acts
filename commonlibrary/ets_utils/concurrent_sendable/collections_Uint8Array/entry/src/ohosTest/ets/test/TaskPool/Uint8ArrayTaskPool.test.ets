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
  testUint8ArrayTaskPool0001,
  testUint8ArrayTaskPool0002,
  testUint8ArrayTaskPool0003,
  testUint8ArrayTaskPool0004,
  testUint8ArrayTaskPool0005,
  testUint8ArrayTaskPool0006,
  testUint8ArrayTaskPool0007,
  testUint8ArrayTaskPool0008,
  testUint8ArrayTaskPool0009,
  testUint8ArrayTaskPool0010,
  testUint8ArrayTaskPool0011,
  testUint8ArrayTaskPool0012,
  testUint8ArrayTaskPool0013,
  testUint8ArrayTaskPool0014,
  testUint8ArrayTaskPool0015,
  testUint8ArrayTaskPool0016,
  testUint8ArrayTaskPool0017,
  testUint8ArrayTaskPool0018,
  testUint8ArrayTaskPool0019,
  testUint8ArrayTaskPool0020,
  testUint8ArrayTaskPool0021,
  testUint8ArrayTaskPool0022,
  testUint8ArrayTaskPool0023,
  testUint8ArrayTaskPool0024,
  testUint8ArrayTaskPool0025,
  testUint8ArrayTaskPool0026,
  testUint8ArrayTaskPool0027,
  testUint8ArrayTaskPool0028,
  testUint8ArrayTaskPool0029,
  testUint8ArrayTaskPool0030,
  testUint8ArrayTaskPool0031,
  testUint8ArrayTaskPool0032,
  testUint8ArrayTaskPool0033,
  testUint8ArrayTaskPool0034,
  testUint8ArrayTaskPool0035,
  testUint8ArrayTaskPool0036,
  testUint8ArrayTaskPool0037,
  testUint8ArrayTaskPool0038,
  testUint8ArrayTaskPool0039,
  testUint8ArrayTaskPool0040,
  testUint8ArrayTaskPool0041,
  testUint8ArrayTaskPool0042,
  testUint8ArrayTaskPool0043,
  testUint8ArrayTaskPool0044,
  testUint8ArrayTaskPool0045,
  testUint8ArrayTaskPool0046,
  testUint8ArrayTaskPool0047,
  testUint8ArrayTaskPool0048,
  testUint8ArrayTaskPool0049,
  testUint8ArrayTaskPool0050,
  testUint8ArrayTaskPool0051,
  testUint8ArrayTaskPool0052,
  testUint8ArrayTaskPool0053,
  testUint8ArrayTaskPool0054,
  testUint8ArrayTaskPool0055,
  testUint8ArrayTaskPool0056,
  testUint8ArrayTaskPool0057,
  testUint8ArrayTaskPool0058,
  testUint8ArrayTaskPool0059,
  testUint8ArrayTaskPool0060,
  testUint8ArrayTaskPool0061,
  testUint8ArrayTaskPool0062,
  testUint8ArrayTaskPool0063,
  testUint8ArrayTaskPool0064,
  testUint8ArrayTaskPool0065,
  testUint8ArrayTaskPool0066,
  testUint8ArrayTaskPool0067,
  testUint8ArrayTaskPool0068,
  testUint8ArrayTaskPool0069,
  testUint8ArrayTaskPool0070,
  testUint8ArrayTaskPool0071,
  testUint8ArrayTaskPool0072,
  testUint8ArrayTaskPool0073,
  testUint8ArrayTaskPool0074,
  testUint8ArrayTaskPool0075,
  testUint8ArrayTaskPool0076,
  testUint8ArrayTaskPool0077,
  testUint8ArrayTaskPool0078,
  testUint8ArrayTaskPool0079,
  testUint8ArrayTaskPool0080,
  testUint8ArrayTaskPool0081,
  testUint8ArrayTaskPool0082,
  testUint8ArrayTaskPool0083,
  testUint8ArrayTaskPool0084,
  testUint8ArrayTaskPool0085,
  testUint8ArrayTaskPool0086,
  testUint8ArrayTaskPool0087,
  testUint8ArrayTaskPool0088,
  testUint8ArrayTaskPool0089,
  testUint8ArrayTaskPool0090,
  testUint8ArrayTaskPool0091,
  testUint8ArrayTaskPool0092,
  testUint8ArrayTaskPool0093,
  testUint8ArrayTaskPool0094,
  testUint8ArrayTaskPool0095,
  testUint8ArrayTaskPool0096,
  testUint8ArrayTaskPool0097,
  testUint8ArrayTaskPool0098,
  testUint8ArrayTaskPool0099,
  testUint8ArrayTaskPool0100,
  testUint8ArrayTaskPool0101,
  testUint8ArrayTaskPool0102,
  testUint8ArrayTaskPool0103,
  testUint8ArrayTaskPool0104,
  testUint8ArrayTaskPool0105,
  testUint8ArrayTaskPool0106,
  testUint8ArrayTaskPool0107,
  testUint8ArrayTaskPool0108,
  testUint8ArrayTaskPool0109,
  testUint8ArrayTaskPool0110,
  testUint8ArrayTaskPool0111,
  testUint8ArrayTaskPool0112,
  testUint8ArrayTaskPool0113,
  testUint8ArrayTaskPool0114,
  testUint8ArrayTaskPool0115,
  testUint8ArrayTaskPool0116,
  testUint8ArrayTaskPool0117,
  testUint8ArrayTaskPool0118,
  testUint8ArrayTaskPool0119,
  testUint8ArrayTaskPool0120,
  testUint8ArrayTaskPool0121,
  testUint8ArrayTaskPool0122,
  testUint8ArrayTaskPool0123,
  testUint8ArrayTaskPool0124,
  testUint8ArrayTaskPool0125,
  testUint8ArrayTaskPool0126,
  testUint8ArrayTaskPool0127,
  testUint8ArrayTaskPool0128,
  testUint8ArrayTaskPool0129,
  testUint8ArrayTaskPool0130,
  testUint8ArrayTaskPool0131,
  testUint8ArrayTaskPool0132,
  testUint8ArrayTaskPool0133,
  testUint8ArrayTaskPool0134,
  testUint8ArrayTaskPool0135,
  testUint8ArrayTaskPool0136,
  testUint8ArrayTaskPool0137,
  testUint8ArrayTaskPool0138,
  testUint8ArrayTaskPool0139,
  testUint8ArrayTaskPool0140,
  testUint8ArrayTaskPool0141,
  testUint8ArrayTaskPool0142,
  testUint8ArrayTaskPool0143,
  testUint8ArrayTaskPool0144,
  testUint8ArrayTaskPool0145,
  testUint8ArrayTaskPool0146,
  testUint8ArrayTaskPool0147,
  testUint8ArrayTaskPool0148,
  testUint8ArrayTaskPool0149,
  testUint8ArrayTaskPool0150,
  testUint8ArrayTaskPool0151,
  testUint8ArrayTaskPool0152,
  testUint8ArrayTaskPool0153,
  testUint8ArrayTaskPool0154,
  testUint8ArrayTaskPool0155,
  testUint8ArrayTaskPool0156,
  testUint8ArrayTaskPool0157,
  testUint8ArrayTaskPool0158,
  testUint8ArrayTaskPool0159,
  testUint8ArrayTaskPool0160,
  testUint8ArrayTaskPool0161,
  testUint8ArrayTaskPool0162,
  testUint8ArrayTaskPool0163,
  testUint8ArrayTaskPool0164,
  testUint8ArrayTaskPool0165,
  testUint8ArrayTaskPool0166,
  testUint8ArrayTaskPool0167,
  testUint8ArrayTaskPool0168,
  testUint8ArrayTaskPool0169,
  testUint8ArrayTaskPool0170,
  testUint8ArrayTaskPool0171,
  testUint8ArrayTaskPool0172,
  testUint8ArrayTaskPool0173,
  testUint8ArrayTaskPool0174,
  testUint8ArrayTaskPool0175,
  testUint8ArrayTaskPool0176,
  testUint8ArrayTaskPool0177,
  testUint8ArrayTaskPool0178,
  testUint8ArrayTaskPool0179,
  testUint8ArrayTaskPool0180,
  testUint8ArrayTaskPool0181,
  testUint8ArrayTaskPool0182,
  testUint8ArrayTaskPool0183,
  testUint8ArrayTaskPool0184,
  testUint8ArrayTaskPool0185,
  testUint8ArrayTaskPool0186,
  testUint8ArrayTaskPool0187,
} from './uint8Array_function';

export default function Uint8ArrayTaskPoolTest() {
  describe('Uint8ArrayTaskPoolTest', () => {
    /**
     * @tc.name   testUint8ArrayTaskPool0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_TASKPOOL_0001
     * @tc.desc   Testing the iterative ability of Uint8Array using a for loop in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ArrayTaskPool0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ArrayTaskPool0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ArrayTaskPool0001).then((value) => {
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
     * @tc.name   testUint8ArrayTaskPool0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_TASKPOOL_0002
     * @tc.desc   Testing the iterative ability of Uint8Array using ... deconstruction in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ArrayTaskPool0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ArrayTaskPool0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ArrayTaskPool0002).then((value) => {
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
     * @tc.name   testUint8ArrayTaskPool0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_TASKPOOL_0003
     * @tc.desc   Testing create an empty ArkTS TypedArray object with Uint8Array in TaskPool.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUint8ArrayTaskPool0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testUint8ArrayTaskPool0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testUint8ArrayTaskPool0003).then((value) => {
            num++;
            expect(value).assertEqual(true);
          }).catch(() => { console.error('catch error'); });
        }
        while (num < 10) {
