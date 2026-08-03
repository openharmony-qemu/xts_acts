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
     * @tc.name   AsonSendableTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_SENDABLE_TEST_0100
     * @tc.desc   Verify ASON.stringify serializes Sendable object fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsonSendableTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const data: AsonJsonData = new AsonJsonData()
      data.name_ = 'Test'
      data.age_ = 25
      data.active_ = true
      const jsonStr: string = ArkTSUtils.ASON.stringify(data)
      expect(jsonStr.indexOf('Test') >= 0).assertTrue()
      expect(jsonStr.indexOf('25') >= 0).assertTrue()
      expect(jsonStr.indexOf('true') >= 0).assertTrue()
    })

    /**
     * @tc.name   AsonSendableTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_SENDABLE_TEST_0200
     * @tc.desc   Verify ASON.parse returns Sendable object for JSON text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsonSendableTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const jsonText: string = '{"name_":"Alice","age_":30,"active_":false}'
      const parsed: lang.ISendable = ArkTSUtils.ASON.parse(jsonText) as lang.ISendable
      expect(ArkTSUtils.isSendable(parsed)).assertTrue()
      const again: string = ArkTSUtils.ASON.stringify(parsed)
      expect(again.indexOf('Alice') >= 0).assertTrue()
      expect(again.indexOf('30') >= 0).assertTrue()
    })

    /**
     * @tc.name   AsonSendableTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ASON_SENDABLE_TEST_0300
     * @tc.desc   Verify ASON stringify then parse round-trip keeps Sendable and values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsonSendableTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const data: AsonJsonData = new AsonJsonData()
      data.name_ = 'Bob'
      data.age_ = 18
      data.active_ = true
      const jsonStr: string = ArkTSUtils.ASON.stringify(data)
      const parsed: lang.ISendable = ArkTSUtils.ASON.parse(jsonStr) as lang.ISendable
      expect(ArkTSUtils.isSendable(parsed)).assertTrue()
      const round: string = ArkTSUtils.ASON.stringify(parsed)
      expect(round.indexOf('Bob') >= 0).assertTrue()
      expect(round.indexOf('18') >= 0).assertTrue()
    })
  })
}
