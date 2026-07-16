'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from "../../../../hypium/index";

let x: FixedArray<Number> = [1, 2, 3];
let y: FixedArray<Object> = x;

function foo_1(ca: FixedArray<Object>) {
  ca[0] = new Object();
}

class Base { }
class Derived extends Base { }
function fooBB<T>(p: T): T { return p };
function fooBD<T, G extends T>(p: T): G { return p as G };
function fooDB<G extends T, T>(p: G): T { return p as T };
function fooDD<G extends T, T>(p: G): G { return p };

function fooBBN<T>(p: T, n: number): T { return p };
function fooBDN<T, G extends T>(p: T, n: number): G { return p as G };
function fooDBN<G extends T, T>(p: G, n: number): T { return p as T };
function fooDDN<G extends T, T>(p: G, n: number): G { return p };

function fooBBO<T>(p: T, n?: number): T { return p };
function fooBDO<T, G extends T>(p: T, n?: number): G { return p as G };
function fooDBO<G extends T, T>(p: G, n?: number): T { return p as T };
function fooDDO<G extends T, T>(p: G, n?: number): G { return p };

function fooBBR<T>(p: T, ...n: number[]): T { return p };
function fooBDR<T, G extends T>(p: T, ...n: number[]): G { return p as G };
function fooDBR<G extends T, T>(p: G, ...n: number[]): T { return p as T };
function fooDDR<G extends T, T>(p: G, ...n: number[]): G { return p };

let foobb = fooBB<Base>
let foobd = fooBD<Base, Derived>
let foodb = fooDB<Derived, Base>
let foodd = fooDD<Derived, Derived>

let foobbn = fooBBN<Base>
let foobdn = fooBDN<Base, Derived>
let foodbn = fooDBN<Derived, Base>
let fooddn = fooDDN<Derived, Derived>

let foobbo = fooBBO<Base>
let foobdo = fooBDO<Base, Derived>
let foodbo = fooDBO<Derived, Base>
let fooddo = fooDDO<Derived, Derived>

let foobbr = fooBBR<Base>
let foobdr = fooBDR<Base, Derived>
let foodbr = fooDBR<Derived, Base>
let fooddr = fooDDR<Derived, Derived>

foodbn = foobd
foodbo = foobd
foodbr = foobd
foodbn = fooddn
foodbo = fooddo
foodbr = fooddr
foodbn = foobdn
foodbo = foobdo
foodbr = foobdr
foodb = foodd
foobbr = foobb
foobbr = foobd

function fooBB_6(p: Base): Base { return p };
function fooBD_6(p: Base): Derived { return new Derived() };
function fooDB_6(p: Derived): Base { return new Base() };
function fooDD_6(p: Derived): Derived { return p };

function fooBBN_6(p: Base, n: number): Base { return p };
function fooBDN_6(p: Base, n: number): Derived { return new Derived() };
function fooDBN_6(p: Derived, n: number): Base { return new Base() };
function fooDDN_6(p: Derived, n: number): Derived { return p };

function fooBBO_6(p: Base, n?: number): Base { return p };
function fooBDO_6(p: Base, n?: number): Derived { return new Derived() };
function fooDBO_6(p: Derived, n?: number): Base { return new Base() };
function fooDDO_6(p: Derived, n?: number): Derived { return p };

function fooBBR_6(p: Base, ...n: number[]): Base { return p };
function fooBDR_6(p: Base, ...n: number[]): Derived { return new Derived() };
function fooDBR_6(p: Derived, ...n: number[]): Base { return new Base() };
function fooDDR_6(p: Derived, ...n: number[]): Derived { return p };

class Base_7 {
  b: string = 'b'
}
class Derived_7 extends Base_7 {
  override b: string = 'd'
}

function fooBD_7(p: Base_7): Derived_7 { return new Derived_7() }
function fooBBN_7(p: Base_7, n: number): Base_7 { return p }
let foobbn_7 = fooBBN_7
foobbn_7 = fooBD_7

export default function FunctionTypeInferenceEnhancement(): void {
  describe('FunctionTypeInferenceEnhancement', () => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.number SUB_STATIC_SPEC_FUNCTIONTYPEINFERENCEENHANCEMENT_0100
     * @tc.name FunctionTypeInferenceEnhancementTest001
     * @tc.desc ArrayStoreError on covariant FixedArray modification with incompatible type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('FunctionTypeInferenceEnhancementTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        foo_1(y);
        expect().assertFail();
      } catch (err) {
        expect(err.name).assertEqual('ArrayStoreError');
      }
    })

    /**
     * @tc.number SUB_STATIC_SPEC_FUNCTIONTYPEINFERENCEENHANCEMENT_0200
     * @tc.name FunctionTypeInferenceEnhancementTest002
     * @tc.desc Function type assignability with various generic parameter constraints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('FunctionTypeInferenceEnhancementTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(foodbn.name).assertEqual('fooBDN');
      expect(foodbo.name).assertEqual('fooBDO');
      expect(foodbr.name).assertEqual('fooBDR');
      expect(foodb.name).assertEqual('fooDD');
      expect(foobbr.name).assertEqual('fooBD');
    })

    /**
     * @tc.number SUB_STATIC_SPEC_FUNCTIONTYPEINFERENCEENHANCEMENT_0300
     * @tc.name FunctionTypeInferenceEnhancementTest003
     * @tc.desc Function type inference for generic functions with required parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('FunctionTypeInferenceEnhancementTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let foobbn = fooBBN<Base>
      let foodbn = fooDBN<Derived, Base>
      foodbn = foobbn
      expect(foodbn(new Base, 1) instanceof Base).assertTrue();
    })

    /**
     * @tc.number SUB_STATIC_SPEC_FUNCTIONTYPEINFERENCEENHANCEMENT_0400
     * @tc.name FunctionTypeInferenceEnhancementTest004
     * @tc.desc Function type inference for generic functions with optional parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('FunctionTypeInferenceEnhancementTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let foobbo = fooBBO<Base>
      let foodbo = fooDBO<Derived, Base>
      foodbo = foobbo
      expect(foodbo(new Base, 1) instanceof Base).assertTrue();
    })

    /**
     * @tc.number SUB_STATIC_SPEC_FUNCTIONTYPEINFERENCEENHANCEMENT_0500
     * @tc.name FunctionTypeInferenceEnhancementTest005
     * @tc.desc Function type inference for generic functions with rest parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('FunctionTypeInferenceEnhancementTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let foobbr = fooBBR<Base>
      let foodbr = fooDBR<Derived, Base>
      foodbr = foobbr
      expect(foodbr(new Base, 1) instanceof Base).assertTrue();
    })

    /**
     * @tc.number SUB_STATIC_SPEC_FUNCTIONTYPEINFERENCEENHANCEMENT_0600
     * @tc.name FunctionTypeInferenceEnhancementTest006
     * @tc.desc Function type inference for non-generic functions with required, optional, and rest parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('FunctionTypeInferenceEnhancementTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let foobb_6 = fooBB_6
      let foobd_6 = fooBD_6
      let foodb_6 = fooDB_6
      let foodd_6 = fooDD_6

      let foobbn_6 = fooBBN_6
      let foobdn_6 = fooBDN_6
      let foodbn_6 = fooDBN_6
      let fooddn_6 = fooDDN_6
      foodbn_6 = foobbn_6
      expect(foodbn_6(new Base, 1) instanceof Base).assertTrue();

      let foobbo_6 = fooBBO_6
      let foobdo_6 = fooBDO_6
      let foodbo_6 = fooDBO_6
      let fooddo_6 = fooDDO_6
      foodbo_6 = foobbo_6
      expect(foodbo_6(new Base) instanceof Base).assertTrue();

      let foobbr_6 = fooBBR_6
      let foobdr_6 = fooBDR_6
      let foodbr_6 = fooDBR_6
      let fooddr_6 = fooDDR_6
      foodbr_6 = foobbr_6
      expect(foodbr_6(new Base, 1, 2, 3) instanceof Base).assertTrue();

      foodbr_6 = foobd_6
      foobbr_6 = foobb_6
      foobbr_6 = foobd_6
    })

    /**
     * @tc.number SUB_STATIC_SPEC_FUNCTIONTYPEINFERENCEENHANCEMENT_0700
     * @tc.name FunctionTypeInferenceEnhancementTest007
     * @tc.desc Function type inference with covariant return type widening
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('FunctionTypeInferenceEnhancementTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(foobbn_7(new Base_7, 1) instanceof Derived_7).assertTrue();
      expect(foobbn_7(new Base_7, 5).b).assertEqual('d');
    })
  })
}
