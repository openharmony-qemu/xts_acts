/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArkTSUtils, collections } from '@kit.ArkTS';

@Sendable
class TestPerson {
  name: string = 'test'
  age: number = 0
}

function mapParseOptions(): ArkTSUtils.ASON.ParseOptions {
  return {
    bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
    parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP
  }
}

// Value type must be Sendable (Object is not); string|number covers JSON object fields here
function parseAsMap(jsonStr: string): collections.Map<string, string | number> {
  return ArkTSUtils.ASON.parse(jsonStr, undefined, mapParseOptions()) as collections.Map<string, string | number>
}

export default function ASONTest(): void {
  if (!canIUse('SystemCapability.Utils.Lang')) {
    console.info('ASONTest skipped: SystemCapability.Utils.Lang is not supported')
    return
  }
  describe('ASONTest', (): void => {
    /**
     * @tc.name   ASONTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_TEST_0100
     * @tc.desc   Verify ASON.parse converts JSON string to Sendable Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let jsonStr: string = '{"name":"test","age":42}'
      // parse does not construct custom classes; use MAP + get()
      let result: collections.Map<string, string | number> = parseAsMap(jsonStr)
      expect(result.get('name') as string).assertEqual('test')
      expect(result.get('age') as number).assertEqual(42)
      let jsonOut: string = ArkTSUtils.ASON.stringify(result)
      let roundTrip: collections.Map<string, string | number> = parseAsMap(jsonOut)
      expect(roundTrip.get('name') as string).assertEqual('test')
      expect(roundTrip.get('age') as number).assertEqual(42)
    })

    /**
     * @tc.name   ASONTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_TEST_0200
     * @tc.desc   Verify ASON.stringify serializes Sendable object to JSON string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let person: TestPerson = new TestPerson()
      person.name = 'John'
      person.age = 30
      let jsonStr: string = ArkTSUtils.ASON.stringify(person)
      let parsed: collections.Map<string, string | number> = parseAsMap(jsonStr)
      expect(parsed.get('name') as string).assertEqual('John')
      expect(parsed.get('age') as number).assertEqual(30)
    })

    /**
     * @tc.name   ASONTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_TEST_0300
     * @tc.desc   Verify ASON.stringify converts collections.Map to JSON string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let map: collections.Map<string, number> = new collections.Map<string, number>()
      map.set('one', 1)
      map.set('two', 2)
      let jsonStr: string = ArkTSUtils.ASON.stringify(map)
      let parsed: collections.Map<string, string | number> = parseAsMap(jsonStr)
      expect(parsed.size).assertEqual(2)
      expect(parsed.get('one') as number).assertEqual(1)
      expect(parsed.get('two') as number).assertEqual(2)
    })

    /**
     * @tc.name   ASONTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_TEST_0400
     * @tc.desc   Verify ASON.stringify converts collections.Set to JSON string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let set: collections.Set<number> = new collections.Set<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let jsonStr: string = ArkTSUtils.ASON.stringify(set)
      let parsed: collections.Array<number> =
        ArkTSUtils.ASON.parse(jsonStr) as collections.Array<number>
      expect(parsed.length).assertEqual(3)
      expect(parsed[0]).assertEqual(1)
      expect(parsed[1]).assertEqual(2)
      expect(parsed[2]).assertEqual(3)
    })

    /**
     * @tc.name   ASONTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_TEST_0500
     * @tc.desc   Verify ASON.stringify converts native Map to JSON string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let map: Map<string, string> = new Map<string, string>()
      map.set('key1', 'value1')
      map.set('key2', 'value2')
      let jsonStr: string = ArkTSUtils.ASON.stringify(map)
      let parsed: collections.Map<string, string | number> = parseAsMap(jsonStr)
      expect(parsed.size).assertEqual(2)
      expect(parsed.get('key1') as string).assertEqual('value1')
      expect(parsed.get('key2') as string).assertEqual('value2')
    })

    /**
     * @tc.name   ASONTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_TEST_0600
     * @tc.desc   Verify ASON.stringify converts native Set to JSON string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let set: Set<number> = new Set<number>()
      set.add(10)
      set.add(20)
      let jsonStr: string = ArkTSUtils.ASON.stringify(set)
      let parsed: collections.Array<number> =
        ArkTSUtils.ASON.parse(jsonStr) as collections.Array<number>
      expect(parsed.length).assertEqual(2)
      expect(parsed[0]).assertEqual(10)
      expect(parsed[1]).assertEqual(20)
    })

    /**
     * @tc.name   ASONTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_TEST_0700
     * @tc.desc   Verify ASON.parse with ParseOptions bigIntMode configuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let jsonStr: string = '{"value":112233445566778899}'
      let options: ArkTSUtils.ASON.ParseOptions = {
        bigIntMode: ArkTSUtils.ASON.BigIntMode.PARSE_AS_BIGINT,
        parseReturnType: ArkTSUtils.ASON.ParseReturnType.MAP
      }
      let result: collections.Map<string, bigint> =
        ArkTSUtils.ASON.parse(jsonStr, undefined, options) as collections.Map<string, bigint>
      expect(result.size).assertEqual(1)
      let bigVal: bigint | undefined = result.get('value')
      expect(bigVal !== undefined).assertTrue()
      if (bigVal !== undefined) {
        expect(bigVal).assertEqual(112233445566778899n)
      }
    })

    /**
     * @tc.name   ASONTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_TEST_0800
     * @tc.desc   Verify ASON.parse throws error for invalid JSON string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ASONTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let invalidJson: string = '{invalid json}'
      let caughtError: boolean = false
      try {
        ArkTSUtils.ASON.parse(invalidJson)
        expect().assertFail()
      } catch (e) {
        caughtError = true
        // Invalid JSON: SyntaxError (matches asonutilstest / device; single path)
        expect(e instanceof SyntaxError).assertTrue()
        if (e instanceof SyntaxError) {
          expect(e.name).assertEqual('SyntaxError')
          expect(e.message.length > 0).assertTrue()
        }
      }
      expect(caughtError).assertTrue()
    })

    /**
     * @tc.name   ASONTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_TEST_0900
     * @tc.desc   Verify ASON.stringify with collections.Array produces valid JSON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ASONTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3)
      let jsonStr: string = ArkTSUtils.ASON.stringify(arr)
      let parsed: collections.Array<number> =
        ArkTSUtils.ASON.parse(jsonStr) as collections.Array<number>
      expect(parsed.length).assertEqual(3)
      expect(parsed[0]).assertEqual(1)
      expect(parsed[1]).assertEqual(2)
      expect(parsed[2]).assertEqual(3)
    })
  })
}
