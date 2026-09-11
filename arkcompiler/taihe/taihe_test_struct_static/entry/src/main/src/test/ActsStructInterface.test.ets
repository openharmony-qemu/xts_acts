'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import {BusinessError} from '@ohos.base';
import * as StructTest from '../ets/struct_test';

export default function actsStructInterfaceTest() {
  describe('ActsStructInterface', () => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    let structD: StructTest.StructD = StructTest.getStructD();
    let structE: StructTest.StructE = StructTest.getStructE();
    let structF: StructTest.StructF = StructTest.getStructF();
    let structG: StructTest.StructG = StructTest.getStructG();
    let structDB5: StructTest.SDB5Readonly = StructTest.getSDB5Readonly();
    let structEB: StructTest.SEBReadonly = StructTest.getSEBReadonly();

    /**
     * @tc.number    SUB_Taihe_StructInterface_DBASE5_STATIC_0100
     * @tc.name      test_struct_dbase5
     * @tc.desc      Set and get StructD with DBase5 fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_struct_dbase5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_struct_dbase5 start');
      let str: StructTest.DBase5 = {
        param1: 8,
        param2: 16,
        param3: 32,
        param4: 64,
        param5: 'StructD',
      };
      structD.structD = str;
      let info = structD.structD;
      expect(str.param1).assertEqual(info.param1);
      console.log('test_struct_dbase5 done');
      done();
      console.log('test_struct_dbase5 end');
    })

    /**
     * @tc.number    SUB_Taihe_StructInterface_EBIGINT_STATIC_0100
     * @tc.name      test_struct_ebigint
     * @tc.desc      Set and get StructE with EBigint fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_struct_ebigint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_struct_ebigint start');
      let str: StructTest.EBigint = {
        param1: true,
        param2: 16.32f,
        param3: 32.16,
        param4: 641632,
      };
      structE.structE = str;
      let info = structE.structE;
      expect(str.param1).assertEqual(info.param1);
      console.log('test_struct_ebigint done');
      done();
      console.log('test_struct_ebigint end');
    })

    /**
     * @tc.number    SUB_Taihe_StructInterface_FUNION_STATIC_0100
     * @tc.name      test_struct_funion
     * @tc.desc      Set and get StructF with FUnion fields (optional, union, record).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_struct_funion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_struct_funion start');
      let str: StructTest.FUnion = {
        param1: 'optionalStr',
        param2: 'unionStr',
        param3: {'today': '19'}
      };
      structF.structF = str;
      let info = structF.structF;
      expect(str.param1).assertEqual(info.param1);
      console.log('test_struct_funion done');
      done();
      console.log('test_struct_funion end');
    })

    /**
     * @tc.number    SUB_Taihe_StructInterface_ARRAY_STATIC_0100
     * @tc.name      test_struct_array
     * @tc.desc      Set and get StructG with GArray fields (typedarray, arraybuffer).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_struct_array', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_struct_array start');
      let i8Array = new Int8Array([1, -2, 3, -4, 5]);
      let numbersU8: byte[] = [1, 2, 3, 4, 5];
      let arrayBuffer = new ArrayBuffer(numbersU8.length);
      for (let i = 0; i < numbersU8.length; i++) {
        arrayBuffer.set(i, numbersU8[i]);
      }
      let str: StructTest.GArray = {param1: i8Array, param2: arrayBuffer};
      structG.gArray = str;
      let info = structG.gArray;
      expect(str.param1[0]).assertEqual(info.param1[0]);
      console.log('test_struct_array done');
      done();
      console.log('test_struct_array end');
    })

    /**
     * @tc.number    SUB_Taihe_StructInterface_DBASE5READONLY_STATIC_0100
     * @tc.name      test_struct_dbase5readonly
     * @tc.desc      Get SDB5Readonly readonly struct fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_struct_dbase5readonly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_struct_dbase5readonly start');
      let info = structDB5.dB5Readonly;
      expect(info.param1).assertEqual(1);
      console.log('test_struct_dbase5readonly done');
      done();
      console.log('test_struct_dbase5readonly end');
    })

    /**
     * @tc.number    SUB_Taihe_StructInterface_SEBREADONLY_STATIC_0100
     * @tc.name      test_struct_sebreadonly
     * @tc.desc      Get SEBReadonly readonly struct fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_struct_sebreadonly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_struct_sebreadonly start');
      let info = structEB.sEBReadonly;
      expect(info.param1).assertEqual(true);
      console.log('test_struct_sebreadonly done');
      done();
      console.log('test_struct_sebreadonly end');
    })
  })
}