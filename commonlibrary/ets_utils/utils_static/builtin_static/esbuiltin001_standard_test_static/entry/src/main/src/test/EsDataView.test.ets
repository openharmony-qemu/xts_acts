/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
function getBI(data: int, ...dataEx: int[]): BigInt{
  let bi: BigInt = 0n;
  if (data < 0){
    bi = new BigInt(data & 0x7fffffff) + 2147483648n
  } else {
    bi = new BigInt(data)
  }
  let xishu = 4294967296n;
  for(let i = 0;i < dataEx.length; i++) {
    if(dataEx[i] < 0) {
      let tmp: BigInt = new BigInt(dataEx[i] & 0x7fffffff) + 2147483648n
      bi = tmp * xishu + bi;
    } else {
      bi = new BigInt(dataEx[i]) * xishu + bi;
    }

    xishu *= 4294967296n;
  }
  return bi;
}
export default function EsDataViewTest(){
  describe('EsDataViewTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0001
     * @tc.name ESDataViewTest0001
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0001';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let dv1 = new DataView(buffer, 0);
      let dv2 = new DataView(buffer, 0);
      expect(dv1.buffer).assertEqual(buffer);
      expect(dv2.buffer).assertEqual(buffer);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0002
     * @tc.name ESDataViewTest0002
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0002';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let dv1 = new DataView(buffer, 0);
      let dv2 = new DataView(buffer, 0);
      expect(dv1.buffer).assertEqual(buffer);
      expect(dv2.buffer).assertEqual(buffer);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0003
     * @tc.name ESDataViewTest0003
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0003';
      console.info(`${caseName}, test start`);
      let threw = false;
      let ab = new ArrayBuffer(42);
      try{
        new DataView(ab, -1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0004
     * @tc.name ESDataViewTest0004
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0004';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(3);
      let sample = new DataView(buffer, 1, 2);
      expect(sample.byteLength).assertEqual(2);
      expect(sample.byteOffset).assertEqual(1);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 1, 0);
      expect(sample.byteLength).assertEqual(0);
      expect(sample.byteOffset).assertEqual(1);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 0, 3);
      expect(sample.byteLength).assertEqual(3);
      expect(sample.byteOffset).assertEqual(0);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 3, 0);
      expect(sample.byteLength).assertEqual(0);
      expect(sample.byteOffset).assertEqual(3);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 0, 1);
      expect(sample.byteLength).assertEqual(1);
      expect(sample.byteOffset).assertEqual(0);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 0, 2);
      expect(sample.byteLength).assertEqual(2);
      expect(sample.byteOffset).assertEqual(0);
      expect(sample.buffer).assertEqual(buffer);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0005
     * @tc.name ESDataViewTest0005
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0005';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(4);
      let sample = new DataView(buffer, 0, undefined);
      expect(sample.byteLength).assertEqual(4);
      expect(sample.byteOffset).assertEqual(0);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 1, undefined);
      expect(sample.byteLength).assertEqual(3);
      expect(sample.byteOffset).assertEqual(1);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 2, undefined);
      expect(sample.byteLength).assertEqual(2);
      expect(sample.byteOffset).assertEqual(2);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 3, undefined);
      expect(sample.byteLength).assertEqual(1);
      expect(sample.byteOffset).assertEqual(3);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 4, undefined);
      expect(sample.byteLength).assertEqual(0);
      expect(sample.byteOffset).assertEqual(4);
      expect(sample.buffer).assertEqual(buffer);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0006
     * @tc.name ESDataViewTest0006
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0006';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(4);
      let sample = new DataView(buffer, 0);
      expect(sample.byteLength).assertEqual(4);
      expect(sample.byteOffset).assertEqual(0);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 1);
      expect(sample.byteLength).assertEqual(3);
      expect(sample.byteOffset).assertEqual(1);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 2);
      expect(sample.byteLength).assertEqual(2);
      expect(sample.byteOffset).assertEqual(2);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 3);
      expect(sample.byteLength).assertEqual(1);
      expect(sample.byteOffset).assertEqual(3);
      expect(sample.buffer).assertEqual(buffer);
      sample = new DataView(buffer, 4);
      expect(sample.byteLength).assertEqual(0);
      expect(sample.byteOffset).assertEqual(4);
      expect(sample.buffer).assertEqual(buffer);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0007
     * @tc.name ESDataViewTest0007
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0007';
      console.info(`${caseName}, test start`);
      let threw = false;
      let ab = new ArrayBuffer(3);
      try{
        let sample = new DataView(ab, 2, 2);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0008
     * @tc.name ESDataViewTest0008
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0008';
      console.info(`${caseName}, test start`);
      let threw = false;
      let ab = new ArrayBuffer(1);
      try{
        let sample = new DataView(ab, 2);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0009
     * @tc.name ESDataViewTest0009
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0009';
      console.info(`${caseName}, test start`);
      let ab = new ArrayBuffer(42);
      let sample = new DataView(ab, 0, -0);
      let threw = false;
      expect(sample.byteLength).assertEqual(0);
      sample = new DataView(ab, 0, 0);
      expect(sample.byteLength).assertEqual(0);
      sample = new DataView(ab, 0, 1);
      expect(sample.byteLength).assertEqual(1);
      sample = new DataView(ab, 0, 2);
      expect(sample.byteLength).assertEqual(2);
      try {
        sample = new DataView(ab, 0, -1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0010
     * @tc.name ESDataViewTest0010
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0010';
      console.info(`${caseName}, test start`);
      let threw = false;
      let ab = new ArrayBuffer(42);
      let sample = new DataView(ab, -0);
      expect(sample.byteLength).assertEqual(42);
      sample = new DataView(ab, 0);
      expect(sample.byteLength).assertEqual(42);
      sample = new DataView(ab, 1);
      expect(sample.byteLength).assertEqual(41);
      sample = new DataView(ab, 2);
      expect(sample.byteLength).assertEqual(40);
      try{
        sample = new DataView(ab, -1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0011
     * @tc.name ESDataViewTest0011
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0011';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(1);
      let dv = new DataView(buffer, 0);
      expect(dv.buffer).assertEqual(buffer);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0012
     * @tc.name ESDataViewTest0012
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0012';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample1 = new DataView(buffer, 0);
      let sample2 = new DataView(buffer, 4);
      let sample3 = new DataView(buffer, 6, 4);
      let sample4 = new DataView(buffer, 12);
      expect(sample1.byteLength).assertEqual(12);
      expect(sample2.byteLength).assertEqual(8);
      expect(sample3.byteLength).assertEqual(4);
      expect(sample4.byteLength).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0013
     * @tc.name ESDataViewTest0013
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0013';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample1 = new DataView(buffer, 0);
      let sample2 = new DataView(buffer, 4);
      let sample3 = new DataView(buffer, 6, 4);
      let sample4 = new DataView(buffer, 12);
      let sample5 = new DataView(buffer, 0, 2);
      expect(sample1.byteOffset).assertEqual(0);
      expect(sample2.byteOffset).assertEqual(4);
      expect(sample3.byteOffset).assertEqual(6);
      expect(sample4.byteOffset).assertEqual(12);
      expect(sample5.byteOffset).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0014
     * @tc.name ESDataViewTest0014
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0014';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int): void => {
        let threw = false;
        try {
          sample.getBigInt64(offset)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expectError(sample, 13);
      expectError(sample, 9);
      expectError(sample, 5);
      expect(sample.getBigInt64(4)).assertEqual(0n);
      sample = new DataView(buffer, 4);
      expectError(sample, 1);
      expect(sample.getBigInt64(0)).assertEqual(0n);
      sample = new DataView(buffer, 8);
      expectError(sample, 1);
      sample = new DataView(buffer, 9);
      expectError(sample, 0);
      sample = new DataView(buffer, 0, 8);
      expectError(sample, 1);
      expect(sample.getBigInt64(0)).assertEqual(0n);
      sample = new DataView(buffer, 0, 7);
      expectError(sample, 0);
      sample = new DataView(buffer, 4, 8);
      expectError(sample, 1);
      sample = new DataView(buffer, 4, 7);
      expectError(sample, 0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0015
     * @tc.name ESDataViewTest0015
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0015';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try {
        sample.getBigInt64(-1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0016
     * @tc.name ESDataViewTest0016
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0016';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expect(sample.getBigInt64(0, true)).assertEqual(0n);
      expect(sample.getBigInt64(1, true)).assertEqual(0n);
      expect(sample.getBigInt64(2, true)).assertEqual(0n);
      expect(sample.getBigInt64(3, true)).assertEqual(0n);
      expect(sample.getBigInt64(4, true)).assertEqual(0n);
      expect(sample.getBigInt64(0, false)).assertEqual(0n);
      expect(sample.getBigInt64(1, false)).assertEqual(0n);
      expect(sample.getBigInt64(2, false)).assertEqual(0n);
      expect(sample.getBigInt64(3, false)).assertEqual(0n);
      expect(sample.getBigInt64(4, false)).assertEqual(0n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0017
     * @tc.name ESDataViewTest0017
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0017';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(16);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0x27);
      sample.setUint8(1, 0x02);
      sample.setUint8(2, 0x06);
      sample.setUint8(3, 0x02);
      sample.setUint8(4, 0x80);
      sample.setUint8(5, 0x00);
      sample.setUint8(6, 0x80);
      sample.setUint8(7, 0x01);
      sample.setUint8(8, 0x7f);
      sample.setUint8(9, 0x00);
      sample.setUint8(10, 0x01);
      sample.setUint8(11, 0x02);
      sample.setUint8(12, 0x80);
      sample.setUint8(13, 0x7f);
      sample.setUint8(14, 0xff);
      sample.setUint8(15, 0x80);
      sample = new DataView(buffer, 4);
      expect(sample.getBigInt64(0, false)).assertEqual(new BigInt(-0x7fff7ffe80fffefe));
      expect(sample.getBigInt64(1, false)).assertEqual(new BigInt(0x80017f00010280));
      expect(sample.getBigInt64(2, false)).assertEqual(new BigInt(-0x7ffe80fffefd7f81));
      expect(sample.getBigInt64(3, false)).assertEqual(new BigInt(0x17f000102807fff));
      expect(sample.getBigInt64(4, false)).assertEqual(new BigInt(0x7f000102807fff80));
      expect(sample.getBigInt64(0, true)).assertEqual(new BigInt(0x201007f01800080));
      expect(sample.getBigInt64(1, true)).assertEqual(new BigInt(-0x7ffdfeff80fe8000));
      expect(sample.getBigInt64(2, true)).assertEqual(new BigInt(0x7f800201007f0180));
      expect(sample.getBigInt64(3, true)).assertEqual(new BigInt(-0x807ffdfeff80ff));
      expect(sample.getBigInt64(4, true)).assertEqual(new BigInt(-0x7f00807ffdfeff81));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0018
     * @tc.name ESDataViewTest0018
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0018';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(16);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0x27);
      sample.setUint8(1, 0x02);
      sample.setUint8(2, 0x06);
      sample.setUint8(3, 0x02);
      sample.setUint8(4, 0x80);
      sample.setUint8(5, 0x00);
      sample.setUint8(6, 0x80);
      sample.setUint8(7, 0x01);
      sample.setUint8(8, 0x7f);
      sample.setUint8(9, 0x00);
      sample.setUint8(10, 0x01);
      sample.setUint8(11, 0x02);
      sample.setUint8(12, 0x80);
      sample.setUint8(13, 0x7f);
      sample.setUint8(14, 0xff);
      sample.setUint8(15, 0x80);
      expect(sample.getBigInt64(0, false)).assertEqual(new BigInt(0x2702060280008001));
      expect(sample.getBigInt64(1, false)).assertEqual(new BigInt(0x20602800080017f));
      expect(sample.getBigInt64(2, false)).assertEqual(new BigInt(0x602800080017f00));
      expect(sample.getBigInt64(3, false)).assertEqual(new BigInt(0x2800080017f0001));
      expect(sample.getBigInt64(4, false)).assertEqual(new BigInt(-0x7fff7ffe80fffefe));
      expect(sample.getBigInt64(5, false)).assertEqual(new BigInt(0x80017f00010280));
      expect(sample.getBigInt64(6, false)).assertEqual(new BigInt(-0x7ffe80fffefd7f81));
      expect(sample.getBigInt64(7, false)).assertEqual(new BigInt(0x17f000102807fff));
      expect(sample.getBigInt64(8, false)).assertEqual(new BigInt(0x7f000102807fff80));
      expect(sample.getBigInt64(0, true)).assertEqual(new BigInt(0x180008002060227));
      expect(sample.getBigInt64(1, true)).assertEqual(new BigInt(0x7f01800080020602));
      expect(sample.getBigInt64(2, true)).assertEqual(new BigInt(0x7f018000800206));
      expect(sample.getBigInt64(3, true)).assertEqual(new BigInt(0x1007f0180008002));
      expect(sample.getBigInt64(4, true)).assertEqual(new BigInt(0x201007f01800080));
      expect(sample.getBigInt64(5, true)).assertEqual(new BigInt(-0x7ffdfeff80fe8000));
      expect(sample.getBigInt64(6, true)).assertEqual(new BigInt(0x7f800201007f0180));
      expect(sample.getBigInt64(7, true)).assertEqual(new BigInt(-0x807ffdfeff80ff));
      expect(sample.getBigInt64(8, true)).assertEqual(new BigInt(-0x7f00807ffdfeff81));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0019
     * @tc.name ESDataViewTest0019
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0019';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(7, 0xff);
      expect(sample.getBigInt64(0)).assertEqual(new BigInt(0xff));
      expect(sample.getBigInt64(0, false)).assertEqual(new BigInt(0xff));
      expect(sample.getBigInt64(0, true)).assertEqual(new BigInt(-0x100000000000000));
      expect(sample.getBigInt64(0, undefined)).assertEqual(new BigInt(0xff));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0020
     * @tc.name ESDataViewTest0020
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0020';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int, msg1: string, msg2: string): void =>{
        let threw = false;
        try {
          sample.getBigInt64(offset)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0x27);
      sample.setUint8(1, 0x02);
      sample.setUint8(2, 0x06);
      sample.setUint8(3, 0x02);
      sample.setUint8(4, 0x80);
      sample.setUint8(5, 0x00);
      sample.setUint8(6, 0x80);
      sample.setUint8(7, 0x01);
      sample.setUint8(8, 0x7f);
      sample.setUint8(9, 0x00);
      sample.setUint8(10, 0x01);
      sample.setUint8(11, 0x02);
      expect(sample.getBigInt64(0)).assertEqual(new BigInt(0x2702060280008001));
      expect(sample.getBigInt64(1)).assertEqual(new BigInt(0x20602800080017f));
      expect(sample.getBigInt64(2)).assertEqual(new BigInt(0x602800080017F00));
      expect(sample.getBigInt64(3)).assertEqual(new BigInt(0x2800080017F0001));
      expect(sample.getBigInt64(4)).assertEqual(new BigInt(0x800080017F000102));
      expectError(sample, -1, "-1", "wrong index");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0021
     * @tc.name ESDataViewTest0021
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0021';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int): void => {
        let threw = false;
        try {
          sample.getBigUint64(offset)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }

      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expectError(sample, 13);
      expectError(sample, 9);
      expectError(sample, 5);
      expect(sample.getBigUint64(4)).assertEqual(0n);
      sample = new DataView(buffer, 4);
      expectError(sample, 1);
      expect(sample.getBigUint64(0)).assertEqual(0n);
      sample = new DataView(buffer, 8);
      expectError(sample, 1);
      sample = new DataView(buffer, 9);
      expectError(sample, 0);
      sample = new DataView(buffer, 0, 8);
      expectError(sample, 1);
      expect(sample.getBigUint64(0)).assertEqual(0n);
      sample = new DataView(buffer, 0, 7);
      expectError(sample, 0);
      sample = new DataView(buffer, 4, 8);
      expectError(sample, 1);
      sample = new DataView(buffer, 4, 7);
      expectError(sample, 0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0022
     * @tc.name ESDataViewTest0022
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0022';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.getBigUint64(-1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0023
     * @tc.name ESDataViewTest0023
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0023';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expect(sample.getBigUint64(0, true)).assertEqual(0n);
      expect(sample.getBigUint64(1, true)).assertEqual(0n);
      expect(sample.getBigUint64(2, true)).assertEqual(0n);
      expect(sample.getBigUint64(3, true)).assertEqual(0n);
      expect(sample.getBigUint64(4, true)).assertEqual(0n);
      expect(sample.getBigUint64(0, false)).assertEqual(0n);
      expect(sample.getBigUint64(1, false)).assertEqual(0n);
      expect(sample.getBigUint64(2, false)).assertEqual(0n);
      expect(sample.getBigUint64(3, false)).assertEqual(0n);
      expect(sample.getBigUint64(4, false)).assertEqual(0n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0024
     * @tc.name ESDataViewTest0024
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0024';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(16);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0x27);
      sample.setUint8(1, 0x02);
      sample.setUint8(2, 0x06);
      sample.setUint8(3, 0x02);
      sample.setUint8(4, 0x80);
      sample.setUint8(5, 0x00);
      sample.setUint8(6, 0x80);
      sample.setUint8(7, 0x01);
      sample.setUint8(8, 0x7f);
      sample.setUint8(9, 0x00);
      sample.setUint8(10, 0x01);
      sample.setUint8(11, 0x02);
      sample.setUint8(12, 0x80);
      sample.setUint8(13, 0x7f);
      sample.setUint8(14, 0xff);
      sample.setUint8(15, 0x80);
      sample = new DataView(buffer, 4);
      expect(sample.getBigUint64(0, false)).assertEqual(new BigInt(0x800080017f0001) * 256n + 2n);
      expect(sample.getBigUint64(1, false)).assertEqual(new BigInt(0x80017f00010280));
      expect(sample.getBigUint64(2, false)).assertEqual(new BigInt(0x80017f00010280) * 256n + 127n);
      expect(sample.getBigUint64(3, false)).assertEqual(new BigInt(0x17f000102807fff));
      expect(sample.getBigUint64(4, false)).assertEqual(new BigInt(0x7f000102807fff80));
      expect(sample.getBigUint64(0, true)).assertEqual(new BigInt(0x201007f01800080));
      expect(sample.getBigUint64(1, true)).assertEqual(new BigInt(0x800201007f0180) * 256n);
      expect(sample.getBigUint64(2, true)).assertEqual(new BigInt(0x7f800201007f0180));
      expect(sample.getBigUint64(3, true)).assertEqual(new BigInt(0xff7f800201007f) * 256n + 1n);
      expect(sample.getBigUint64(4, true)).assertEqual(new BigInt(0x80ff7f80020100) * 256n + 127n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0025
     * @tc.name ESDataViewTest0025
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0025';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(16);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0x27);
      sample.setUint8(1, 0x02);
      sample.setUint8(2, 0x06);
      sample.setUint8(3, 0x02);
      sample.setUint8(4, 0x80);
      sample.setUint8(5, 0x00);
      sample.setUint8(6, 0x80);
      sample.setUint8(7, 0x01);
      sample.setUint8(8, 0x7f);
      sample.setUint8(9, 0x00);
      sample.setUint8(10, 0x01);
      sample.setUint8(11, 0x02);
      sample.setUint8(12, 0x80);
      sample.setUint8(13, 0x7f);
      sample.setUint8(14, 0xff);
      sample.setUint8(15, 0x80);
      expect(sample.getBigUint64(0, false)).assertEqual(new BigInt(0x2702060280008001));
      expect(sample.getBigUint64(1, false)).assertEqual(new BigInt(0x20602800080017f));
      expect(sample.getBigUint64(2, false)).assertEqual(new BigInt(0x602800080017f00));
      expect(sample.getBigUint64(3, false)).assertEqual(new BigInt(0x2800080017f0001));
      expect(sample.getBigUint64(4, false)).assertEqual(new BigInt(0x800080017f0001) * 256n + 2n);
      expect(sample.getBigUint64(5, false)).assertEqual(new BigInt(0x80017f00010280));
      expect(sample.getBigUint64(6, false)).assertEqual(new BigInt(0x80017f00010280) * 256n + 127n);
      expect(sample.getBigUint64(7, false)).assertEqual(new BigInt(0x17f000102807fff));
      expect(sample.getBigUint64(8, false)).assertEqual(new BigInt(0x7f000102807fff80));
      expect(sample.getBigUint64(0, true)).assertEqual(new bigint(0x180008002060227));
      expect(sample.getBigUint64(1, true)).assertEqual(new bigint(0x7f01800080020602));
      expect(sample.getBigUint64(2, true)).assertEqual(new bigint(0x7f018000800206));
      expect(sample.getBigUint64(3, true)).assertEqual(new bigint(0x1007f0180008002));
      expect(sample.getBigUint64(4, true)).assertEqual(new bigint(0x201007f01800080));
      expect(sample.getBigUint64(5, true)).assertEqual(new bigint(0x800201007F0180) * 256n);
      expect(sample.getBigUint64(6, true)).assertEqual(new bigint(0x7f800201007f0180));
      expect(sample.getBigUint64(7, true)).assertEqual(new bigint(0xff7f800201007f) * 256n + 1n);
      expect(sample.getBigUint64(8, true)).assertEqual(new bigint(0x80ff7f80020100) * 256n + 127n);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0026
     * @tc.name ESDataViewTest0026
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0026';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(7, 0xff);
      expect(sample.getBigUint64(0)).assertEqual(new BigInt(0xff));
      expect(sample.getBigUint64(0, false)).assertEqual(new BigInt(0xff));
      expect(sample.getBigUint64(0, true)).assertEqual(new BigInt(0xff000000000000) * 256n);
      expect(sample.getBigUint64(0, undefined)).assertEqual(new BigInt(0xff));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0027
     * @tc.name ESDataViewTest0027
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0027';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int, msg1: string, msg2: string): void => {
        let threw = false;
        try {
          sample.getBigUint64(offset)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0x27);
      sample.setUint8(1, 0x02);
      sample.setUint8(2, 0x06);
      sample.setUint8(3, 0x02);
      sample.setUint8(4, 0x80);
      sample.setUint8(5, 0x00);
      sample.setUint8(6, 0x80);
      sample.setUint8(7, 0x01);
      sample.setUint8(8, 0x7f);
      sample.setUint8(9, 0x00);
      sample.setUint8(10, 0x01);
      sample.setUint8(11, 0x02);
      expect(sample.getBigUint64(0)).assertEqual(new BigInt(0x2702060280008001));
      expect(sample.getBigUint64(1)).assertEqual(new BigInt(0x20602800080017f));
      expect(sample.getBigUint64(2)).assertEqual(new BigInt(0x602800080017F00));
      expect(sample.getBigUint64(3)).assertEqual(new BigInt(0x2800080017F0001));
      expect(sample.getBigUint64(4)).assertEqual(new BigInt(0x800080017F0001) * 256n + 2n);
      expectError(sample, -1, "-1", "wrong index");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0028
     * @tc.name ESDataViewTest0028
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0028';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int): void => {
        let threw = false;
        try {
          sample.getFloat32(offset)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }

      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expectError(sample, 13);
      expectError(sample, 11);
      expectError(sample, 9);
      expect(sample.getFloat32(8)).assertEqual(0);
      sample = new DataView(buffer, 8);
      expectError(sample, 1);
      expect(sample.getFloat32(0)).assertEqual(0);
      sample = new DataView(buffer, 9);
      expectError(sample, 0);
      sample = new DataView(buffer, 0, 4);
      expectError(sample, 1);
      sample = new DataView(buffer, 0, 3);
      expectError(sample, 0);
      sample = new DataView(buffer, 4, 4);
      expectError(sample, 1);
      expect(sample.getFloat32(0)).assertEqual(0);
      sample = new DataView(buffer, 4, 3);
      expectError(sample, 0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0029
     * @tc.name ESDataViewTest0029
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0029';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.getFloat32(-1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0030
     * @tc.name ESDataViewTest0030
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0030';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 128);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 255);
      sample.setUint8(5, 128);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      expect(sample.getFloat32(0)).assertEqual(Infinity);
      expect(sample.getFloat32(4)).assertEqual(-Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0031
     * @tc.name ESDataViewTest0031
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0031';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 192);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 255);
      sample.setUint8(5, 192);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      expect(Number.isNaN(sample.getFloat32(0))).assertEqual(true);
      expect(Number.isNaN(sample.getFloat32(4))).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0032
     * @tc.name ESDataViewTest0032
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0032';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      expect(sample.getFloat32(0, true)).assertEqual(0);
      expect(sample.getFloat32(1, true)).assertEqual(0);
      expect(sample.getFloat32(2, true)).assertEqual(0);
      expect(sample.getFloat32(3, true)).assertEqual(0);
      expect(sample.getFloat32(4, true)).assertEqual(0);
      expect(sample.getFloat32(0, false)).assertEqual(0);
      expect(sample.getFloat32(1, false)).assertEqual(0);
      expect(sample.getFloat32(2, false)).assertEqual(0);
      expect(sample.getFloat32(3, false)).assertEqual(0);
      expect(sample.getFloat32(4, false)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0033
     * @tc.name ESDataViewTest0033
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0033';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setUint8(4, 75);
      sample.setUint8(5, 75);
      sample.setUint8(6, 75);
      sample.setUint8(7, 75);
      sample.setUint8(8, 76);
      sample.setUint8(9, 76);
      sample.setUint8(10, 77);
      sample.setUint8(11, 77);
      sample = new DataView(buffer, 4);
      expect(sample.getFloat32(0, false)).assertEqual(13323083);
      expect(sample.getFloat32(1, false)).assertEqual(13323084);
      expect(sample.getFloat32(2, false)).assertEqual(13323340);
      expect(sample.getFloat32(3, false)).assertEqual(13388877);
      expect(sample.getFloat32(4, false)).assertEqual(53556532);
      expect(sample.getFloat32(0, true)).assertEqual(13323083);
      expect(sample.getFloat32(1, true)).assertEqual(53292332);
      expect(sample.getFloat32(2, true)).assertEqual(53554476);
      expect(sample.getFloat32(3, true)).assertEqual(214222000);
      expect(sample.getFloat32(4, true)).assertEqual(215270592);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0034
     * @tc.name ESDataViewTest0034
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0034';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 66);
      sample.setUint8(1, 40);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 64);
      sample.setUint8(5, 224);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      expect(sample.getFloat32(0, false)).assertEqual(42);
      expect(sample.getFloat32(1, false)).assertEqual(7.105481567709626e-15);
      expect(sample.getFloat32(2, false)).assertEqual(2.327276489550656e-41);
      expect(sample.getFloat32(3, false)).assertEqual(5.95782781324968e-39);
      expect(sample.getFloat32(4, false)).assertEqual(7);
      expect(sample.getFloat32(0, true)).assertEqual(1.4441781973331565e-41);
      expect(sample.getFloat32(1, true)).assertEqual(2.000009536743164);
      expect(sample.getFloat32(2, true)).assertEqual(-55340232221128655000.0);
      expect(sample.getFloat32(3, true)).assertEqual(2.059411001342953e-38);
      expect(sample.getFloat32(4, true)).assertEqual(8.04457422399591e-41);
      sample.setUint8(0, 75);
      sample.setUint8(1, 75);
      sample.setUint8(2, 76);
      sample.setUint8(3, 76);
      sample.setUint8(4, 75);
      sample.setUint8(5, 75);
      sample.setUint8(6, 76);
      sample.setUint8(7, 76);
      expect(sample.getFloat32(0, false)).assertEqual(13323340);
      expect(sample.getFloat32(1, false)).assertEqual(13388875);
      expect(sample.getFloat32(2, false)).assertEqual(53554476);
      expect(sample.getFloat32(3, false)).assertEqual(53292336);
      expect(sample.getFloat32(4, false)).assertEqual(13323340);
      expect(sample.getFloat32(0, true)).assertEqual(53554476);
      expect(sample.getFloat32(1, true)).assertEqual(13388875);
      expect(sample.getFloat32(2, true)).assertEqual(13323340);
      expect(sample.getFloat32(3, true)).assertEqual(53292336);
      expect(sample.getFloat32(4, true)).assertEqual(53554476);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0035
     * @tc.name ESDataViewTest0035
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0035';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(4);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 75);
      sample.setUint8(1, 75);
      sample.setUint8(2, 76);
      sample.setUint8(3, 76);
      expect(sample.getFloat32(0)).assertEqual(13323340);
      expect(sample.getFloat32(0, undefined)).assertEqual(13323340);
      expect(sample.getFloat32(0, false)).assertEqual(13323340);
      expect(sample.getFloat32(0, true)).assertEqual(53554476);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0036
     * @tc.name ESDataViewTest0036
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0036';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 75);
      sample.setUint8(1, 75);
      sample.setUint8(2, 76);
      sample.setUint8(3, 76);
      sample.setUint8(4, 75);
      sample.setUint8(5, 75);
      sample.setUint8(6, 76);
      sample.setUint8(7, 76);
      expect(sample.getFloat32(0)).assertEqual(13323340);
      expect(sample.getFloat32(-0)).assertEqual(13323340);
      expect(sample.getFloat32(1)).assertEqual(13388875);
      expect(sample.getFloat32(2)).assertEqual(53554476);
      expect(sample.getFloat32(3)).assertEqual(53292336);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0037
     * @tc.name ESDataViewTest0037
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0037';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int): void => {
        let threw = false;
        try {
          sample.getFloat64(offset)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expectError(sample, 13);
      expectError(sample, 9);
      expectError(sample, 5);
      expect(sample.getFloat64(4)).assertEqual(0);
      sample = new DataView(buffer, 8);
      expectError(sample, 1);
      sample = new DataView(buffer, 9);
      expectError(sample, 0);
      sample = new DataView(buffer, 0, 8);
      expectError(sample, 1);
      sample = new DataView(buffer, 0, 7);
      expectError(sample, 0);
      sample = new DataView(buffer, 4, 8);
      expectError(sample, 1);
      sample = new DataView(buffer, 4, 7);
      expectError(sample, 0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0038
     * @tc.name ESDataViewTest0038
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0038';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.getFloat64(-1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0039
     * @tc.name ESDataViewTest0039
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0039';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 240);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 0);
      sample.setUint8(5, 0);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      expect(sample.getFloat64(0)).assertEqual(Infinity);
      sample.setUint8(0, 255);
      sample.setUint8(1, 240);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 0);
      sample.setUint8(5, 0);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      expect(sample.getFloat64(0)).assertEqual(-Infinity);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0040
     * @tc.name ESDataViewTest0040
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0040';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 248);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 0);
      sample.setUint8(5, 0);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      expect(Number.isNaN(sample.getFloat64(0))).assertEqual(true);
      sample.setUint8(0, 127);
      sample.setUint8(1, 249);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 0);
      sample.setUint8(5, 0);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      expect(Number.isNaN(sample.getFloat64(0))).assertEqual(true);
      sample.setUint8(0, 127);
      sample.setUint8(1, 250);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 0);
      sample.setUint8(5, 0);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      expect(Number.isNaN(sample.getFloat64(0))).assertEqual(true);
      sample.setUint8(0, 127);
      sample.setUint8(1, 251);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 0);
      sample.setUint8(5, 0);
      sample.setUint8(6, 0);
      sample.setUint8(7, 0);
      expect(Number.isNaN(sample.getFloat64(0))).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0041
     * @tc.name ESDataViewTest0041
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0041';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expect(sample.getFloat64(0, true)).assertEqual(0);
      expect(sample.getFloat64(1, true)).assertEqual(0);
      expect(sample.getFloat64(2, true)).assertEqual(0);
      expect(sample.getFloat64(3, true)).assertEqual(0);
      expect(sample.getFloat64(4, true)).assertEqual(0);
      expect(sample.getFloat64(0, false)).assertEqual(0);
      expect(sample.getFloat64(1, false)).assertEqual(0);
      expect(sample.getFloat64(2, false)).assertEqual(0);
      expect(sample.getFloat64(3, false)).assertEqual(0);
      expect(sample.getFloat64(4, false)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0042
     * @tc.name ESDataViewTest0042
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0042';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(16);
      let sample = new DataView(buffer, 0);
      sample.setUint8(4, 67);
      sample.setUint8(5, 67);
      sample.setUint8(6, 68);
      sample.setUint8(7, 68);
      sample.setUint8(8, 67);
      sample.setUint8(9, 67);
      sample.setUint8(10, 68);
      sample.setUint8(11, 68);
      sample.setUint8(12, 67);
      sample.setUint8(13, 67);
      sample.setUint8(14, 68);
      sample.setUint8(15, 68);
      sample = new DataView(buffer, 4);
      expect(sample.getFloat64(0, false)).assertEqual(10846169068898440);
      expect(sample.getFloat64(1, false)).assertEqual(11409110432516230);
      expect(sample.getFloat64(2, false)).assertEqual(747563348316297500000.0);
      expect(sample.getFloat64(3, false)).assertEqual(710670423110242000000.0);
      expect(sample.getFloat64(4, false)).assertEqual(10846169068898440);
      expect(sample.getFloat64(0, true)).assertEqual(747563348316297500000.0);
      expect(sample.getFloat64(1, true)).assertEqual(11409110432516230);
      expect(sample.getFloat64(2, true)).assertEqual(10846169068898440);
      expect(sample.getFloat64(3, true)).assertEqual(710670423110242000000.0);
      expect(sample.getFloat64(4, true)).assertEqual(747563348316297500000.0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0043
     * @tc.name ESDataViewTest0043
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0043';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(16);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 67);
      sample.setUint8(1, 67);
      sample.setUint8(2, 68);
      sample.setUint8(3, 68);
      sample.setUint8(4, 67);
      sample.setUint8(5, 67);
      sample.setUint8(6, 68);
      sample.setUint8(7, 68);
      sample.setUint8(8, 67);
      sample.setUint8(9, 67);
      sample.setUint8(10, 68);
      sample.setUint8(11, 68);
      sample.setUint8(12, 0);
      sample.setUint8(13, 0);
      sample.setUint8(14, 0);
      sample.setUint8(15, 0);
      expect(sample.getFloat64(0, false)).assertEqual(10846169068898440);
      expect(sample.getFloat64(1, false)).assertEqual(11409110432516230);
      expect(sample.getFloat64(2, false)).assertEqual(747563348316297500000.0);
      expect(sample.getFloat64(3, false)).assertEqual(710670423110242000000.0);
      expect(sample.getFloat64(4, false)).assertEqual(10846169068898440);
      expect(sample.getFloat64(5, false)).assertEqual(11409110432516096);
      expect(sample.getFloat64(6, false)).assertEqual(747563348314040600000.0);
      expect(sample.getFloat64(7, false)).assertEqual(710670422532459300000.0);
      expect(sample.getFloat64(8, false)).assertEqual(10846166811934720);
      expect(sample.getFloat64(0, true)).assertEqual(747563348316297500000.0);
      expect(sample.getFloat64(1, true)).assertEqual(11409110432516230);
      expect(sample.getFloat64(2, true)).assertEqual(10846169068898440);
      expect(sample.getFloat64(3, true)).assertEqual(710670423110242000000.0);
      expect(sample.getFloat64(4, true)).assertEqual(747563348316297500000.0);
      expect(sample.getFloat64(5, true)).assertEqual(2.254739805726094e-307);
      expect(sample.getFloat64(6, true)).assertEqual(3.7084555987028e-310);
      expect(sample.getFloat64(7, true)).assertEqual(1.44861546824e-312);
      expect(sample.getFloat64(8, true)).assertEqual(5.65865417e-315);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0044
     * @tc.name ESDataViewTest0044
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0044';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 67);
      sample.setUint8(1, 17);
      sample.setUint8(2, 0);
      sample.setUint8(3, 0);
      sample.setUint8(4, 0);
      sample.setUint8(5, 0);
      sample.setUint8(6, 20);
      sample.setUint8(7, 68);
      expect(sample.getFloat64(0)).assertEqual(1196268651021585);
      expect(sample.getFloat64(0, undefined)).assertEqual(1196268651021585);
      expect(sample.getFloat64(0, false)).assertEqual(1196268651021585);
      expect(sample.getFloat64(0, true)).assertEqual(92233720368620160000.0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0045
     * @tc.name ESDataViewTest0045
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0045';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 67);
      sample.setUint8(1, 67);
      sample.setUint8(2, 68);
      sample.setUint8(3, 68);
      sample.setUint8(4, 67);
      sample.setUint8(5, 67);
      sample.setUint8(6, 68);
      sample.setUint8(7, 68);
      sample.setUint8(8, 67);
      sample.setUint8(9, 68);
      sample.setUint8(10, 68);
      sample.setUint8(11, 68);
      expect(sample.getFloat64(0)).assertEqual(10846169068898440);
      expect(sample.getFloat64(1)).assertEqual(11409110432516230);
      expect(sample.getFloat64(2)).assertEqual(747563348316297600000.0);
      expect(sample.getFloat64(-0)).assertEqual(10846169068898440);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0046
     * @tc.name ESDataViewTest0046
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0046';
      console.info(`${caseName}, test start`);
      let expectError = (sample: DataView, offset: int, msg: string): void => {
        let threw = false;
        try {
          sample.getInt16(offset)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      expectError(sample, 13, "13 + 2 > 12");
      expectError(sample, 11, "11 + 2 > 12");
      expect(sample.getInt16(10)).assertEqual(0);
      sample = new DataView(buffer, 10);
      expectError(sample, 1, "1 + 2 > 2 (offset)");
      sample = new DataView(buffer, 11);
      expectError(sample, 0, "0 + 2 > 1 (offset)");
      sample = new DataView(buffer, 0, 2);
      expectError(sample, 1, "1 + 2 > 2 (length)");
      sample = new DataView(buffer, 0, 1);
      expectError(sample, 0, "0 + 2 > 1 (length)");
      sample = new DataView(buffer, 4, 2);
      expectError(sample, 1, "1 + 2 > 2 (offset+length)");
      sample = new DataView(buffer, 4, 1);
      expectError(sample, 0, "0 + 2 > 1 (offset+length)");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0047
     * @tc.name ESDataViewTest0047
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0047';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.getInt16(-1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0048
     * @tc.name ESDataViewTest0048
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0048';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(6);
      let sample = new DataView(buffer, 0);
      expect(sample.getInt16(0, true)).assertEqual(0);
      expect(sample.getInt16(1, true)).assertEqual(0);
      expect(sample.getInt16(2, true)).assertEqual(0);
      expect(sample.getInt16(3, true)).assertEqual(0);
      expect(sample.getInt16(4, true)).assertEqual(0);
      expect(sample.getInt16(0, false)).assertEqual(0);
      expect(sample.getInt16(1, false)).assertEqual(0);
      expect(sample.getInt16(2, false)).assertEqual(0);
      expect(sample.getInt16(3, false)).assertEqual(0);
      expect(sample.getInt16(4, false)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0049
     * @tc.name ESDataViewTest0049
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0049';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0);
      sample.setUint8(1, 2);
      sample.setUint8(2, 6);
      sample.setUint8(3, 2);
      sample.setUint8(4, 128);
      sample.setUint8(5, 42);
      sample.setUint8(6, 128);
      sample.setUint8(7, 39);
      sample = new DataView(buffer, 4);
      expect(sample.getInt16(0, false)).assertEqual(-32726);
      expect(sample.getInt16(1, false)).assertEqual(10880);
      expect(sample.getInt16(2, false)).assertEqual(-32729);
      expect(sample.getInt16(0, true)).assertEqual(10880);
      expect(sample.getInt16(1, true)).assertEqual(-32726);
      expect(sample.getInt16(2, true)).assertEqual(10112);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0050
     * @tc.name ESDataViewTest0050
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0050';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 255);
      sample.setUint8(2, 255);
      sample.setUint8(3, 255);
      sample.setUint8(4, 128);
      sample.setUint8(5, 0);
      sample.setUint8(6, 1);
      sample.setUint8(7, 0);
      expect(sample.getInt16(0, false)).assertEqual(32767);
      expect(sample.getInt16(1, false)).assertEqual(-1);
      expect(sample.getInt16(2, false)).assertEqual(-1);
      expect(sample.getInt16(3, false)).assertEqual(-128);
      expect(sample.getInt16(4, false)).assertEqual(-32768);
      expect(sample.getInt16(5, false)).assertEqual(1);
      expect(sample.getInt16(6, false)).assertEqual(256);
      expect(sample.getInt16(0, true)).assertEqual(-129);
      expect(sample.getInt16(1, true)).assertEqual(-1);
      expect(sample.getInt16(2, true)).assertEqual(-1);
      expect(sample.getInt16(3, true)).assertEqual(-32513);
      expect(sample.getInt16(4, true)).assertEqual(128);
      expect(sample.getInt16(5, true)).assertEqual(256);
      expect(sample.getInt16(6, true)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0051
     * @tc.name ESDataViewTest0051
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0051';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(2);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 0);
      sample.setUint8(1, 42);
      expect(sample.getInt16(0)).assertEqual(42);
      expect(sample.getInt16(0, undefined)).assertEqual(42);
      expect(sample.getInt16(0, false)).assertEqual(42);
      expect(sample.getInt16(0, true)).assertEqual(10752);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0052
     * @tc.name ESDataViewTest0052
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0052';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      sample.setUint8(0, 127);
      sample.setUint8(1, 255);
      sample.setUint8(2, 1);
      sample.setUint8(3, 127);
      sample.setUint8(4, 255);
      expect(sample.getInt16(-0)).assertEqual(32767);
      expect(sample.getInt16(0)).assertEqual(32767);
      expect(sample.getInt16(1)).assertEqual(-255);
      expect(sample.getInt16(2)).assertEqual(383);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0053
     * @tc.name ESDataViewTest0053
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0053';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      let expectError = (sample: DataView, offset: int, msg: string): void => {
        let threw = false;
        try {
          sample.getInt32(offset)
          expect(false).assertEqual(true);
        } catch (err) {
          if (err instanceof RangeError) threw = true;
        }
        expect(threw).assertEqual(true);
      }
      expectError(sample, 13, "13 + 4 > 12");
      expectError(sample, 12, "12 + 4 > 12");
      expectError(sample, 11, "11 + 4 > 12");
      expectError(sample, 10, "10 + 4 > 12");
      expectError(sample, 9, "9 + 4 > 12");
      expect(sample.getInt32(8)).assertEqual(0);
      sample = new DataView(buffer, 8);
      expectError(sample, 1, "1 + 4 > 4 (offset)");
      sample = new DataView(buffer, 9);
      expectError(sample, 0, "0 + 4 > 3 (offset)");
      sample = new DataView(buffer, 0, 4);
      expectError(sample, 1, "1 + 4 > 4 (length)");
      sample = new DataView(buffer, 0, 3);
      expectError(sample, 0, "0 + 4 > 3 (length)");
      sample = new DataView(buffer, 4, 4);
      expectError(sample, 1, "1 + 4 > 4 (offset+length)");
      sample = new DataView(buffer, 4, 3);
      expectError(sample, 0, "0 + 4 > 3 (offset+length)");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0054
     * @tc.name ESDataViewTest0054
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0054';
      console.info(`${caseName}, test start`);
      let threw = false;
      let buffer = new ArrayBuffer(12);
      let sample = new DataView(buffer, 0);
      try{
        sample.getInt32(-1);
        expect(false).assertEqual(true);
      } catch (err) {
        if (err instanceof RangeError) threw = true;
      }
      expect(threw).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_DATAVIEW_0055
     * @tc.name ESDataViewTest0055
     * @tc.desc Test ES Builtins-Api in DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESDataViewTest0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESDataViewTest0055';
      console.info(`${caseName}, test start`);
      let buffer = new ArrayBuffer(8);
      let sample = new DataView(buffer, 0);
      expect(sample.getInt32(0, true)).assertEqual(0);
      expect(sample.getInt32(1, true)).assertEqual(0);
      expect(sample.getInt32(2, true)).assertEqual(0);
      expect(sample.getInt32(3, true)).assertEqual(0);
      expect(sample.getInt32(4, true)).assertEqual(0);
      expect(sample.getInt32(0, false)).assertEqual(0);
      expect(sample.getInt32(1, false)).assertEqual(0);
      expect(sample.getInt32(2, false)).assertEqual(0);
      expect(sample.getInt32(3, false)).assertEqual(0);
      expect(sample.getInt32(4, false)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });
  })
}
