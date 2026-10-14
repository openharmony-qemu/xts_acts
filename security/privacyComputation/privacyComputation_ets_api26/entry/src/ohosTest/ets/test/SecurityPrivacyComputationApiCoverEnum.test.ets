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
  ErrorLike,
  TARGET,
  VALUE_A,
  buildElement,
  buildProtocol,
  buildTarget
} from './utils/privacyComputation/PrivacyComputationUtils';

const VALID_PROTOCOL: privacyComputation.PrivacyProtocol = buildProtocol(
  privacyComputation.DataSetSize.SIZE_256,
  privacyComputation.ProtocolType.PIR_PROTOCOL
);

async function createValidPrivacyTarget(): Promise<Uint8Array> {
  return privacyComputation.genPrivacyTarget(
    buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
    VALID_PROTOCOL
  );
}

async function createValidSearchResult(): Promise<privacyComputation.PrivacySearchResult> {
  const privacyTarget: Uint8Array = await createValidPrivacyTarget();
  return privacyComputation.privacySearch(
    privacyTarget,
    [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256)],
    VALID_PROTOCOL
  );
}

export default function SecurityPrivacyComputationApiCoverEnumTest(): void {
  describe('SecurityPrivacyComputationApiCoverEnumTest', () => {
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_ENUM_0100
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_ENUM_0100
     * @tc.desc   ProtocolType enum values are compatible with API definitions
     * @tc.type   COMPATIBILITY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_ENUM_0100', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(privacyComputation.ProtocolType.PSI_PROTOCOL).assertEqual(0);
      expect(privacyComputation.ProtocolType.PIR_PROTOCOL).assertEqual(1);
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_ENUM_0200
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_ENUM_0200
     * @tc.desc   DataSetSize enum values are compatible with API definitions
     * @tc.type   COMPATIBILITY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_ENUM_0200', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(privacyComputation.DataSetSize.SIZE_128).assertEqual(0);
      expect(privacyComputation.DataSetSize.SIZE_256).assertEqual(1);
      expect(privacyComputation.DataSetSize.SIZE_512).assertEqual(2);
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_ENUM_0300
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_ENUM_0300
     * @tc.desc   HashAlg enum values are compatible with API definitions
     * @tc.type   COMPATIBILITY
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_ENUM_0300', TestType.COMPATIBILITY | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(privacyComputation.HashAlg.NONE).assertEqual(0);
      expect(privacyComputation.HashAlg.SHA256).assertEqual(1);
      expect(privacyComputation.HashAlg.SHA384).assertEqual(2);
      expect(privacyComputation.HashAlg.SHA512).assertEqual(3);
    });

  });
}
