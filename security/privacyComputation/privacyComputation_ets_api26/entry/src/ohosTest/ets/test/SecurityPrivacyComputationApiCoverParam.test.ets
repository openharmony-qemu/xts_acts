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
  ABC,
  EXTRA_VALUE_CIPHER,
  SHA256_ABC,
  TARGET,
  VALUE_A,
  assertUint8ArrayEqual,
  buildElement,
  buildProtocol,
  buildTarget,
  ErrorLike
} from './utils/privacyComputation/PrivacyComputationUtils';

export default function SecurityPrivacyComputationApiCoverParamTest(): void {
  describe('SecurityPrivacyComputationApiCoverParamTest', () => {
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0100
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0100
     * @tc.desc   TargetElement.hashAlg omitted defaults to NONE and matches SHA256 dataset in PIR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0100';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
          privacyComputation.DataSetSize.SIZE_256,
          privacyComputation.ProtocolType.PIR_PROTOCOL
        );
        const targetElement: privacyComputation.TargetElement = buildTarget(SHA256_ABC);
        const elements: privacyComputation.Element[] =
          [buildElement(ABC, VALUE_A, privacyComputation.HashAlg.SHA256)];
        const privacyTarget: Uint8Array =
          await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        assertUint8ArrayEqual(attachedValues[0], VALUE_A);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0200
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0200
     * @tc.desc   TargetElement.hashAlg explicitly set to NONE matches SHA256 dataset in PIR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0200';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
          privacyComputation.DataSetSize.SIZE_256,
          privacyComputation.ProtocolType.PIR_PROTOCOL
        );
        const targetElement: privacyComputation.TargetElement =
          buildTarget(SHA256_ABC, privacyComputation.HashAlg.NONE);
        const elements: privacyComputation.Element[] =
          [buildElement(ABC, VALUE_A, privacyComputation.HashAlg.SHA256)];
        const privacyTarget: Uint8Array =
          await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        assertUint8ArrayEqual(attachedValues[0], VALUE_A);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0300
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0300
     * @tc.desc   Element.hashAlg omitted defaults to NONE and matches SHA256 target in PIR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0300';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
          privacyComputation.DataSetSize.SIZE_256,
          privacyComputation.ProtocolType.PIR_PROTOCOL
        );
        const targetElement: privacyComputation.TargetElement =
          buildTarget(ABC, privacyComputation.HashAlg.SHA256);
        const elements: privacyComputation.Element[] = [buildElement(SHA256_ABC, VALUE_A)];
        const privacyTarget: Uint8Array =
          await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        assertUint8ArrayEqual(attachedValues[0], VALUE_A);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0400
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0400
     * @tc.desc   Element.hashAlg explicitly set to NONE matches SHA256 target in PIR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0400';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
          privacyComputation.DataSetSize.SIZE_256,
          privacyComputation.ProtocolType.PIR_PROTOCOL
        );
        const targetElement: privacyComputation.TargetElement =
          buildTarget(ABC, privacyComputation.HashAlg.SHA256);
        const elements: privacyComputation.Element[] =
          [buildElement(SHA256_ABC, VALUE_A, privacyComputation.HashAlg.NONE)];
        const privacyTarget: Uint8Array =
          await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        assertUint8ArrayEqual(attachedValues[0], VALUE_A);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0500
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0500
     * @tc.desc   Element.elemValue omitted reports error 24000018 in PIR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0500';
      const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_256,
        privacyComputation.ProtocolType.PIR_PROTOCOL
      );
      const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(
        buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
        protocol
      );
      expect(privacyTarget.length).assertLarger(0);
      try {
        await privacyComputation.privacySearch(
          privacyTarget,
          [buildElement(TARGET, undefined, privacyComputation.HashAlg.SHA256)],
          protocol
        );
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0600
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0600
     * @tc.desc   Element.elemValue specified succeeds and is returned in PIR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0600';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
          privacyComputation.DataSetSize.SIZE_256,
          privacyComputation.ProtocolType.PIR_PROTOCOL
        );
        const targetElement: privacyComputation.TargetElement =
          buildTarget(TARGET, privacyComputation.HashAlg.SHA256);
        const elements: privacyComputation.Element[] =
          [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256)];
        const privacyTarget: Uint8Array =
          await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        assertUint8ArrayEqual(attachedValues[0], VALUE_A);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0700
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0700
     * @tc.desc   PrivacySearchResult.valueCipherText omitted succeeds in PSI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0700';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
          privacyComputation.DataSetSize.SIZE_512,
          privacyComputation.ProtocolType.PSI_PROTOCOL
        );
        const targetElement: privacyComputation.TargetElement =
          buildTarget(TARGET, privacyComputation.HashAlg.SHA256);
        const elements: privacyComputation.Element[] =
          [buildElement(TARGET, undefined, privacyComputation.HashAlg.SHA256)];
        const privacyTarget: Uint8Array =
          await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).assertEqual(undefined);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0800
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0800
     * @tc.desc   PrivacySearchResult.valueCipherText specified is ignored in PSI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAM_0800';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
          privacyComputation.DataSetSize.SIZE_512,
          privacyComputation.ProtocolType.PSI_PROTOCOL
        );
        const targetElement: privacyComputation.TargetElement =
          buildTarget(TARGET, privacyComputation.HashAlg.SHA256);
        const elements: privacyComputation.Element[] =
          [buildElement(TARGET, undefined, privacyComputation.HashAlg.SHA256)];
        const privacyTarget: Uint8Array =
          await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).assertEqual(undefined);
        searchResult.valueCipherText = [EXTRA_VALUE_CIPHER];
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
  });
}
