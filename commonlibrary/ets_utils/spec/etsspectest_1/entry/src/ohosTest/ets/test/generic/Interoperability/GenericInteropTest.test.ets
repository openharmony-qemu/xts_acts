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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium';
import { etsIdentity, EtsBox } from './ets_producer'
import { runEtsFunctionInterop, runEtsClassInterop, runEtsInterfaceInterop } from './ets_consumer'
import { tsIdentity, tsAsync, tsReject, tsArray, tsReadMap, tsThrower } from './genericInteropTsHelper'
import { tsCallsEtsIdentity, tsReceivesEtsReturn, tsCheckClassIdentity, EtsProducerApi } from './ts_consumer'
import { jsIdentity, jsDynamicValue, lengthBounded } from './js_producer'


function identity<T>(value: T): T {
  return value
}

function createEtsBox<T>(value: T): EtsBox<T> {
  return new EtsBox(value)
}

const etsProducerApi: EtsProducerApi = {
  etsIdentity: etsIdentity,
  createEtsBox: createEtsBox
}

export default function GenericInteropTest() {
  describe('GenericInteropTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_GENERIC_IO_INTEROP_0100
     * @tc.name      testgeneric0001
     * @tc.desc      Verify ETS exports generic function and another ETS module imports it (GTP-IO-001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testEtsExportGenericFn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(runEtsFunctionInterop()).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_IO_INTEROP_0200
     * @tc.name      testgeneric0002
     * @tc.desc      Verify ETS exports generic class and cross-module maintains instance behavior (GTP-IO-002)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testEtsExportGenericClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(runEtsClassInterop()).assertEqual('hello')
    })

    /**
     * @tc.number    SUB_GENERIC_IO_INTEROP_0300
     * @tc.name      testgeneric0003
     * @tc.desc      Verify ETS exports generic interface / type-only contract (GTP-IO-003)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEtsExportGenericIface0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(runEtsInterfaceInterop()).assertEqual('a')
    })

    /**
     * @tc.number    SUB_GENERIC_IO_INTEROP_0400
     * @tc.name      testgeneric0004
     * @tc.desc      Verify ETS calls TS-exported generic function (GTP-IO-004)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testEtsCallTsGenericFn0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(tsIdentity<number>(42)).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_IO_INTEROP_0500
     * @tc.name      testgeneric0005
     * @tc.desc      Verify TS consumes ETS generic function via injected callable (GTP-IO-005). .ts→.ets import forbidden (10605999); ETS injects etsIdentity into ts_consumer via api param.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTsCallEtsGenericFnClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(tsCallsEtsIdentity(etsProducerApi)).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_IO_INTEROP_0600
     * @tc.name      testgeneric0006
     * @tc.desc      Verify ETS generic function receives JS dynamic value (GTP-IO-006). Boundary: type-check on JS dynamic values passed to generic TBD; .js import requires .d.ts.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testEtsGenericFnJsDynamic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(identity<number>(jsDynamicValue)).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_IO_INTEROP_0700
     * @tc.name      testgeneric0007
     * @tc.desc      Verify ETS calls JS-exported generic function via .d.ts contract (GTP-IO-006). Boundary: type-check on cross-language generic call TBD.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testEtsCallJsGenericFn0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(jsIdentity<number>(42)).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_IO_INTEROP_0800
     * @tc.name      testgeneric0008
     * @tc.desc      Verify ETS generic return value passed to TS via injected class constructor maintains value (GTP-IO-007). .ts→.ets import forbidden (10605999); ETS injects EtsBox ctor into ts_consumer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEtsReturnToTs0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(tsReceivesEtsReturn(etsProducerApi)).assertEqual('ets-value')
    })

    /**
     * @tc.number    SUB_GENERIC_IO_INTEROP_0900
     * @tc.name      testgeneric0009
     * @tc.desc      Verify cross-language Promise<T> resolve (GTP-IO-008)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCrossLangPromiseResolve0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result = await tsAsync<number>(42)
      expect(result).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_IO_INTEROP_1000
     * @tc.name      testgeneric0010
     * @tc.desc      Verify cross-language Promise<T> reject propagates to ETS caller (GTP-IO-008)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCrossLangPromiseReject0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let caught: boolean = false
      try {
        await tsReject('boom')
      } catch (e) {
        caught = true
        expect(e.message).assertEqual('boom')
      }
      expect(caught).assertEqual(true)
    })

    /**
     * @tc.number    SUB_GENERIC_IO_INTEROP_1100
     * @tc.name      testgeneric0011
     * @tc.desc      Verify cross-language Array<T> read/write (GTP-IO-009)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCrossLangArray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = tsArray<number>(1, 2, 3)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(1)
      expect(arr[2]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_GENERIC_IO_INTEROP_1200
     * @tc.name      testgeneric0012
     * @tc.desc      Verify cross-language Map<K,V> read/write (GTP-IO-009)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCrossLangMap0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stringMap: Map<number, string> = new Map()
      stringMap.set(1, 'a')
      stringMap.set(2, 'b')
      expect(tsReadMap<string>(stringMap, 1)).assertEqual('a')
    })

    /**
     * @tc.number    SUB_GENERIC_IO_INTEROP_1300
     * @tc.name      testgeneric0013
     * @tc.desc      Verify generic class instance constructor identity via injected reference after crossing languages (GTP-IO-010). .ts→.ets import forbidden (10605999); ETS injects EtsBox ctor into ts_consumer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCrossLangConstructorIdentity0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(tsCheckClassIdentity(etsProducerApi)).assertEqual(true)
    })

    /**
     * @tc.number    SUB_GENERIC_IO_INTEROP_1400
     * @tc.name      testgeneric0014
     * @tc.desc      Verify .d.ts generic constraint matches actual JS export (GTP-IO-011). fail_compile case in generic_dts_contract_mismatch_fail_compile.ets: calling lengthBounded<number>(42) violates `.d.ts` constraint `T extends { length: number }`.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDtsConstraintMatch0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(lengthBounded('abc')).assertEqual(3)
    })

    /**
     * @tc.number    SUB_GENERIC_IO_INTEROP_1500
     * @tc.name      testgeneric0015
     * @tc.desc      Verify cross-language exception propagation from TS to ETS caller (GTP-IO-012). Runtime/ABC observation TBD.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCrossLangException0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let caught: boolean = false
      try {
        tsThrower('cross-lang error')
      } catch (e) {
        caught = true
        expect(e.message).assertEqual('cross-lang error')
      }
      expect(caught).assertEqual(true)
    })
  })
}
