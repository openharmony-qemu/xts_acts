/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from '@ohos/hypium';

function tpIdentity<T>(value: T): T {
  return value
}

class TpBox<T> {
  public value: T

  constructor(value: T) {
    this.value = value
  }
}

interface TpHolder<T> {
  getValue(): T
}

class TpStringHolder implements TpHolder<string> {
  private value: string

  constructor(value: string) {
    this.value = value
  }

  public getValue(): string {
    return this.value
  }
}

class TpMethodService {
  public echo<T>(value: T): T {
    return value
  }
}

class TpPair<K, V> {
  public key: K
  public value: V

  constructor(key: K, value: V) {
    this.key = key;
    this.value = value
  }
}

class OuterShadow<T> {
  private outerValue: T

  constructor(outerValue: T) {
    this.outerValue = outerValue
  }

  public readOuter(): T {
    return this.outerValue
  }

  public pickInner<T>(value: T): T {
    return value
  }
}

export default function GenericTypeParameterTest() {
  describe('GenericTypeParameterTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

      /**
       * @tc.number    SUB_GENERIC_TP_PARAMETER_0100
       * @tc.name      testSingleTypeParamFunctionNumber0001
       * @tc.desc      Verify generic function preserves a number type argument (GTP-TP-001)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testSingleTypeParamFunctionNumber0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let numberValue: number = tpIdentity<number>(101)
        expect(numberValue).assertEqual(101)
      })

      /**
       * @tc.number    SUB_GENERIC_TP_PARAMETER_0200
       * @tc.name      testSingleTypeParamFunctionString0002
       * @tc.desc      Verify generic function preserves a string type argument (GTP-TP-001)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testSingleTypeParamFunctionString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let stringValue: string = tpIdentity<string>('type-parameter')
        expect(stringValue).assertEqual('type-parameter')
      })

      /**
       * @tc.number    SUB_GENERIC_TP_PARAMETER_0300
       * @tc.name      testSingleTypeParamClassNumber0003
       * @tc.desc      Verify generic class stores a number type argument (GTP-TP-002)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testSingleTypeParamClassNumber0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let numberBox: TpBox<number> = new TpBox<number>(202)
        expect(numberBox.value).assertEqual(202)
      })

      /**
       * @tc.number    SUB_GENERIC_TP_PARAMETER_0400
       * @tc.name      testSingleTypeParamClassString0004
       * @tc.desc      Verify generic class stores a string type argument (GTP-TP-002)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testSingleTypeParamClassString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let stringBox: TpBox<string> = new TpBox<string>('class-box')
        expect(stringBox.value).assertEqual('class-box')
      })

      /**
       * @tc.number    SUB_GENERIC_TP_PARAMETER_0500
       * @tc.name      testSingleTypeParamInterface0005
       * @tc.desc      Verify generic interface implementation returns its declared type argument (GTP-TP-003)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testSingleTypeParamInterface0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let holder: TpHolder<string> = new TpStringHolder('interface-holder')
        expect(holder.getValue()).assertEqual('interface-holder')
      })

      /**
       * @tc.number    SUB_GENERIC_TP_PARAMETER_0600
       * @tc.name      testMethodTypeParamNumber0006
       * @tc.desc      Verify independent generic method preserves a number argument (GTP-TP-004)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testMethodTypeParamNumber0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let service: TpMethodService = new TpMethodService()
        expect(service.echo<number>(404)).assertEqual(404)
      })

      /**
       * @tc.number    SUB_GENERIC_TP_PARAMETER_0700
       * @tc.name      testMethodTypeParamString0007
       * @tc.desc      Verify independent generic method preserves a string argument (GTP-TP-004)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testMethodTypeParamString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let service: TpMethodService = new TpMethodService()
        expect(service.echo<string>('method-type')).assertEqual('method-type')
      })

      /**
       * @tc.number    SUB_GENERIC_TP_PARAMETER_0800
       * @tc.name      testMultipleTypeParamsKey0008
       * @tc.desc      Verify first type parameter in a pair is used independently (GTP-TP-005)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testMultipleTypeParamsKey0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let pair: TpPair<number, string> = new TpPair<number, string>(5, 'five')
        expect(pair.key).assertEqual(5)
      })

      /**
       * @tc.number    SUB_GENERIC_TP_PARAMETER_0900
       * @tc.name      testMultipleTypeParamsValue0009
       * @tc.desc      Verify second type parameter in a pair is used independently (GTP-TP-005)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testMultipleTypeParamsValue0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let pair: TpPair<number, string> = new TpPair<number, string>(5, 'five')
        expect(pair.value).assertEqual('five')
      })

      /**
       * @tc.number    SUB_GENERIC_TP_PARAMETER_1000
       * @tc.name      testTypeParamShadowingOuter0010
       * @tc.desc      Verify outer type parameter remains number under same-name method parameter shadowing (GTP-TP-007)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testTypeParamShadowingOuter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let outer: OuterShadow<number> = new OuterShadow<number>(707)
        outer.pickInner<string>('inner-shadow')
        expect(outer.readOuter()).assertEqual(707)
      })

      /**
       * @tc.number    SUB_GENERIC_TP_PARAMETER_1100
       * @tc.name      testTypeParamShadowingInner0011
       * @tc.desc      Verify inner same-name type parameter shadows the outer type parameter in method scope (GTP-TP-007)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testTypeParamShadowingInner0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let outer: OuterShadow<number> = new OuterShadow<number>(707)
        expect(outer.pickInner<string>('inner-shadow')).assertEqual('inner-shadow')
      })
    })
}
