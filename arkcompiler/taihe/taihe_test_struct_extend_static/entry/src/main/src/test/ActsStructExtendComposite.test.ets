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
import * as StructExtendTest from '../ets/struct_extend';

export default function actsStructExtendCompositeTest() {
  describe('ActsStructExtendComposite', () => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_StructExtendComposite_BAR_STATIC_0100
     * @tc.name      test_class_Bar
     * @tc.desc      Create Bar via factory, verify getE/setE methods.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_class_Bar', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_class_Bar start');
      let in_e: StructExtendTest.E = {param4: 4, param5: 5};
      let bar: StructExtendTest.Bar = StructExtendTest.create_Bar(in_e);
      expect(StructExtendTest.check_Bar(bar)).assertEqual(true);
      let e: StructExtendTest.E = bar.getE();
      expect(e.param4).assertEqual(4);
      expect(e.param5).assertEqual(5);
      let e1: StructExtendTest.E = {param4: 400, param5: 500};
      bar.setE(e1);
      let e2: StructExtendTest.E = bar.getE();
      expect(e2.param4).assertEqual(400);
      expect(e2.param5).assertEqual(500);
      console.log('test_class_Bar done');
      done();
      console.log('test_class_Bar end');
    })

    /**
     * @tc.number    SUB_Taihe_StructExtendComposite_F_STATIC_0100
     * @tc.name      test_struct_F
     * @tc.desc      Create F (struct with Bar field), verify check_F and barF.getE().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_struct_F', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_struct_F start');
      let in_e: StructExtendTest.E = {param4: 4, param5: 5};
      let f: StructExtendTest.F = StructExtendTest.create_F(in_e);
      expect(StructExtendTest.check_F(f)).assertEqual(true);
      let e: StructExtendTest.E = f.barF.getE();
      expect(e.param4).assertEqual(4);
      expect(e.param5).assertEqual(5);
      console.log('test_struct_F done');
      done();
      console.log('test_struct_F end');
    })

    /**
     * @tc.number    SUB_Taihe_StructExtendComposite_G_STATIC_0100
     * @tc.name      test_struct_G
     * @tc.desc      Create G (extends F, adds barG), verify check_F and both barF/barG getE().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_struct_G', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_struct_G start');
      let in_e: StructExtendTest.E = {param4: 4, param5: 5};
      let g: StructExtendTest.F = StructExtendTest.create_G(in_e);
      expect(StructExtendTest.check_F(g)).assertEqual(true);
      let e1: StructExtendTest.E = g.barF.getE();
      expect(e1.param4).assertEqual(4);
      expect(e1.param5).assertEqual(5);
      let e2: StructExtendTest.E = g.barG.getE();
      expect(e2.param4).assertEqual(4);
      expect(e2.param5).assertEqual(5);
      console.log('test_struct_G done');
      done();
      console.log('test_struct_G end');
    })

    /**
     * @tc.number    SUB_Taihe_StructExtendComposite_H_STATIC_0100
     * @tc.name      test_class_H
     * @tc.desc      Create H (@class extends G, adds barH), verify check_H and all bar getE().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_class_H', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_class_H start');
      let in_e: StructExtendTest.E = {param4: 4, param5: 5};
      let h: StructExtendTest.H = StructExtendTest.create_H(in_e);
      expect(StructExtendTest.check_H(h)).assertEqual(true);
      let e1: StructExtendTest.E = h.barF.getE();
      expect(e1.param4).assertEqual(4);
      expect(e1.param5).assertEqual(5);
      let e2: StructExtendTest.E = h.barG.getE();
      expect(e2.param4).assertEqual(4);
      expect(e2.param5).assertEqual(5);
      let e3: StructExtendTest.E = h.barH.getE();
      expect(e3.param4).assertEqual(4);
      expect(e3.param5).assertEqual(5);
      console.log('test_class_H done');
      done();
      console.log('test_class_H end');
    })

    /**
     * @tc.number    SUB_Taihe_StructExtendComposite_I_STATIC_0100
     * @tc.name      test_class_I
     * @tc.desc      Create I (@class extends H, adds barI), verify check_I and all bar getE().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_class_I', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_class_I start');
      let in_e: StructExtendTest.E = {param4: 4, param5: 5};
      let i: StructExtendTest.I = StructExtendTest.create_I(in_e);
      expect(StructExtendTest.check_I(i)).assertEqual(true);
      let e1: StructExtendTest.E = i.barF.getE();
      expect(e1.param4).assertEqual(4);
      expect(e1.param5).assertEqual(5);
      let e2: StructExtendTest.E = i.barG.getE();
      expect(e2.param4).assertEqual(4);
      expect(e2.param5).assertEqual(5);
      let e3: StructExtendTest.E = i.barH.getE();
      expect(e3.param4).assertEqual(4);
      expect(e3.param5).assertEqual(5);
      let e4: StructExtendTest.E = i.barI.getE();
      expect(e4.param4).assertEqual(4);
      expect(e4.param5).assertEqual(5);
      console.log('test_class_I done');
      done();
      console.log('test_class_I end');
    })

    /**
     * @tc.number    SUB_Taihe_StructExtendComposite_J_STATIC_0100
     * @tc.name      test_class_J
     * @tc.desc      Create J (@class extends I, adds barJ), verify check_J and all bar getE().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_class_J', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_class_J start');
      let in_e: StructExtendTest.E = {param4: 4, param5: 5};
      let j: StructExtendTest.J = StructExtendTest.create_J(in_e);
      expect(StructExtendTest.check_J(j)).assertEqual(true);
      let e1: StructExtendTest.E = j.barF.getE();
      expect(e1.param4).assertEqual(4);
      expect(e1.param5).assertEqual(5);
      let e2: StructExtendTest.E = j.barG.getE();
      expect(e2.param4).assertEqual(4);
      expect(e2.param5).assertEqual(5);
      let e3: StructExtendTest.E = j.barH.getE();
      expect(e3.param4).assertEqual(4);
      expect(e3.param5).assertEqual(5);
      let e4: StructExtendTest.E = j.barI.getE();
      expect(e4.param4).assertEqual(4);
      expect(e4.param5).assertEqual(5);
      let e5: StructExtendTest.E = j.barJ.getE();
      expect(e5.param4).assertEqual(4);
      expect(e5.param5).assertEqual(5);
      console.log('test_class_J done');
      done();
      console.log('test_class_J end');
    })
  })
}