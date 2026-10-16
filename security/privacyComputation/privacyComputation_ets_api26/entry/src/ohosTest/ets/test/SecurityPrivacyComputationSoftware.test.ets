/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium-dynamic';
import privacyComputation from '@ohos.security.privacyComputation';
import { Logger } from './utils/common/Logger';
import {
  TARGET,
  VALUE_A,
  ErrorLike,
  buildElement,
  buildProtocol,
  buildTarget
} from './utils/privacyComputation/PrivacyComputationUtils';

export default function SecurityPrivacyComputationSoftwareTest(): void {
  describe('SecurityPrivacyComputationSoftwareTest', () => {
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4400
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4400
     * @tc.desc   genPrivacyTarget reports error 24000017 on the open-source device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4400';
      const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_128,
        privacyComputation.ProtocolType.PIR_PROTOCOL
      );
      const targetElement: privacyComputation.TargetElement = buildTarget(
        TARGET,
        privacyComputation.HashAlg.SHA256
      );
      try {
        await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000017);
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4500
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4500
     * @tc.desc   privacySearch reports error 24000017 on the open-source device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4500';
      const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_128,
        privacyComputation.ProtocolType.PIR_PROTOCOL
      );
      const elements: privacyComputation.Element[] = [
        buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256)
      ];
      try {
        await privacyComputation.privacySearch(TARGET, elements, protocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000017);
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4600
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4600
     * @tc.desc   getSearchResult reports error 24000017 on the open-source device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4600';
      const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_128,
        privacyComputation.ProtocolType.PIR_PROTOCOL
      );
      const searchResult: privacyComputation.PrivacySearchResult = {
        resultCipherText: [TARGET],
        valueCipherText: [VALUE_A]
      };
      try {
        await privacyComputation.getSearchResult(searchResult, protocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000017);
      }
    });
  });
}
