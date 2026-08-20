/*
 * Copyright (c) 2026 RKH Corp.
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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { ArkTSUtils, lang } from '@kit.ArkTS'

@Sendable
class AsonJsonData implements lang.ISendable {
  public name_: string = ''
  public age_: number = 0
  public active_: boolean = false
}

export default function AsonSendableTest(): void {
  describe('AsonSendableTest', (): void => {
    /**
     * @tc.name   testAsonSendable0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_SENDABLE_TEST_0100
     * @tc.desc   Verify ASON.stringify serializes Sendable object fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsonSendable0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const data: AsonJsonData = new AsonJsonData()
      data.name_ = 'Test'
      data.age_ = 25
      data.active_ = true
      const jsonStr: string = ArkTSUtils.ASON.stringify(data)
      const parsed: AsonJsonData = ArkTSUtils.ASON.parse(jsonStr) as AsonJsonData
      expect(parsed.name_).assertEqual('Test')
      expect(parsed.age_).assertEqual(25)
      expect(parsed.active_).assertTrue()
    })

    /**
     * @tc.name   testAsonSendable0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_SENDABLE_TEST_0200
     * @tc.desc   Verify ASON.parse returns Sendable object for JSON text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsonSendable0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const jsonText: string = '{"name_":"Alice","age_":30,"active_":false}'
      const parsed: AsonJsonData = ArkTSUtils.ASON.parse(jsonText) as AsonJsonData
      expect(ArkTSUtils.isSendable(parsed)).assertTrue()
      expect(parsed.name_).assertEqual('Alice')
      expect(parsed.age_).assertEqual(30)
      expect(parsed.active_).assertFalse()
    })

    /**
     * @tc.name   testAsonSendable0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_SENDABLE_TEST_0300
     * @tc.desc   Verify ASON stringify then parse round-trip keeps Sendable and values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAsonSendable0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const data: AsonJsonData = new AsonJsonData()
      data.name_ = 'Bob'
      data.age_ = 18
      data.active_ = true
      const jsonStr: string = ArkTSUtils.ASON.stringify(data)
      const parsed: AsonJsonData = ArkTSUtils.ASON.parse(jsonStr) as AsonJsonData
      expect(ArkTSUtils.isSendable(parsed)).assertTrue()
      expect(parsed.name_).assertEqual('Bob')
      expect(parsed.age_).assertEqual(18)
      expect(parsed.active_).assertTrue()
    })
  })
}
