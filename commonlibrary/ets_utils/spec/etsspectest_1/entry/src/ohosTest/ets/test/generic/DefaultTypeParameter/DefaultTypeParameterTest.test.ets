/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import {
  wrapWithDefault,
  makeEmpty,
  echoOrDefault,
  pairOmitTail,
  buildBoxDefault,
  buildBoxExplicit,
  readDefaultConstrained,
  IdHolderImpl
} from './defaultTypeParameterTsHelper'

interface DefaultTypeContainer<T = string> {
  value: T
}

function buildDefaultContainer(): DefaultTypeContainer {
  let container: DefaultTypeContainer = { value: 'default-iface' }
  return container
}

export default function DefaultTypeParameterTest() {
  describe('DefaultTypeParameterTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_GENERIC_DE_DEFAULT_0100
     * @tc.name      testFunctionDefaultTypeParam0001
     * @tc.desc      GTP-DE-001: makeEmpty with default T=string can store string element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFunctionDefaultTypeParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let empty: string[] = makeEmpty()
      empty.push('ok')
      expect(empty[0]).assertEqual('ok')
    })

    /**
     * @tc.number    SUB_GENERIC_DE_DEFAULT_0300
     * @tc.name      testInterfaceDefaultTypeParam0001
     * @tc.desc      GTP-DE-002: interface default type parameter yields string container value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceDefaultTypeParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(buildDefaultContainer().value).assertEqual('default-iface')
    })

    /**
     * @tc.number    SUB_GENERIC_DE_DEFAULT_0400
     * @tc.name      testClassDefaultTypeParam0001
     * @tc.desc      GTP-DE-003: class default type parameter stores number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDefaultTypeParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(buildBoxDefault().value).assertEqual(7)
    })

    /**
     * @tc.number    SUB_GENERIC_DE_DEFAULT_0500
     * @tc.name      testExplicitOverridesDefault0001
     * @tc.desc      GTP-DE-004: explicit MyBox<string> overrides default number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitOverridesDefault0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(buildBoxExplicit().value).assertEqual('explicit')
    })

    /**
     * @tc.number    SUB_GENERIC_DE_DEFAULT_0600
     * @tc.name      testExplicitOverridesDefault0002
     * @tc.desc      GTP-DE-004: explicit wrapWithDefault<number> overrides default string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitOverridesDefault0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(wrapWithDefault<number>(42).value).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_DE_DEFAULT_0700
     * @tc.name      testTrailingOptionalTypeParam0001
     * @tc.desc      GTP-DE-005: omitting trailing type argument uses default U=string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingOptionalTypeParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(pairOmitTail(1)).assertEqual('1:tail')
    })

    /**
     * @tc.number    SUB_GENERIC_DE_DEFAULT_0800
     * @tc.name      testTrailingOptionalTypeParam0002
     * @tc.desc      GTP-DE-005: providing trailing argument overrides default U
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTrailingOptionalTypeParam0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(pairOmitTail(1, 'x')).assertEqual('1:x')
    })

    /**
     * @tc.number    SUB_GENERIC_DE_DEFAULT_0900
     * @tc.name      testDefaultSatisfiesConstraint0001
     * @tc.desc      GTP-DE-007: default type satisfies constraint when argument omitted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDefaultTypeSatisfiesConstraint0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(readDefaultConstrained()).assertEqual(0)
    })

    /**
     * @tc.number    SUB_GENERIC_DE_DEFAULT_1000
     * @tc.name      testDefaultSatisfiesConstraint0002
     * @tc.desc      GTP-DE-007: constrained default API accepts IdHolderImpl argument
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDefaultSatisfiesConstraint0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(readDefaultConstrained(new IdHolderImpl(9))).assertEqual(9)
    })

    /**
     * @tc.number    SUB_GENERIC_DE_DEFAULT_1100
     * @tc.name      testInferenceVsDefault0001
     * @tc.desc      GTP-DE-009: value argument is inferred as number instead of default string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInferenceVsDefault0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(echoOrDefault(42)).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_DE_DEFAULT_1200
     * @tc.name      testInferenceVsDefault0002
     * @tc.desc      GTP-DE-009: no inference candidate uses default string fallback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInferenceVsDefault0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(echoOrDefault()).assertEqual('fallback')
    })
  })
}
