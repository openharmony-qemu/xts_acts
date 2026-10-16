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
  INVALID_PREHASHED_33,
  OTHER,
  PREHASHED_32,
  PREHASHED_48,
  PREHASHED_64,
  SHA256_ABC,
  TARGET,
  VALUE_A,
  VALUE_B,
  ErrorLike,
  assertUint8ArrayEqual,
  buildElement,
  buildProtocol,
  buildTarget,
  uint8ArrayEquals
} from './utils/privacyComputation/PrivacyComputationUtils';

const EMPTY_DATA: Uint8Array = new Uint8Array(0);
const MAX_KEY_DATA_SIZE: number = 1024;
const OVERLONG_KEY_DATA_SIZE: number = 1025;
const LARGE_VALUE_SIZE: number = 10 * 1024;

export default function SecurityPrivacyComputationFuncTest(): void {
  describe('SecurityPrivacyComputationFuncTest', () => {

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0100
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0100
     * @tc.desc   PIR_PROTOCOL/SIZE_128 privacy computation succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0100';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(privacyComputation.DataSetSize.SIZE_128, privacyComputation.ProtocolType.PIR_PROTOCOL);
        const targetElement: privacyComputation.TargetElement = buildTarget(TARGET, privacyComputation.HashAlg.SHA256);
        const elements: privacyComputation.Element[] = [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256), buildElement(OTHER, VALUE_B, privacyComputation.HashAlg.SHA256)];
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        expect(searchResult.valueCipherText?.length ?? 0).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).not().assertUndefined();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        assertUint8ArrayEqual(attachedValues[0], VALUE_A);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0200
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0200
     * @tc.desc   PIR_PROTOCOL/SIZE_256 privacy computation succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0200';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(privacyComputation.DataSetSize.SIZE_256, privacyComputation.ProtocolType.PIR_PROTOCOL);
        const targetElement: privacyComputation.TargetElement = buildTarget(TARGET, privacyComputation.HashAlg.SHA256);
        const elements: privacyComputation.Element[] = [buildElement(OTHER, VALUE_B, privacyComputation.HashAlg.SHA256), buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256)];
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        expect(searchResult.valueCipherText?.length ?? 0).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).not().assertUndefined();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        assertUint8ArrayEqual(attachedValues[0], VALUE_A);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0300
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0300
     * @tc.desc   PSI_PROTOCOL/SIZE_512 privacy computation succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0300';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(privacyComputation.DataSetSize.SIZE_512, privacyComputation.ProtocolType.PSI_PROTOCOL);
        const targetElement: privacyComputation.TargetElement = buildTarget(TARGET, privacyComputation.HashAlg.SHA256);
        const elements: privacyComputation.Element[] = [buildElement(TARGET, undefined, privacyComputation.HashAlg.SHA256), buildElement(OTHER, undefined, privacyComputation.HashAlg.SHA256)];
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
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
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0400
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0400
     * @tc.desc   HashAlg.SHA256 privacy computation succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0400';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(privacyComputation.DataSetSize.SIZE_256, privacyComputation.ProtocolType.PIR_PROTOCOL);
        const targetElement: privacyComputation.TargetElement = buildTarget(TARGET, privacyComputation.HashAlg.SHA256);
        const elements: privacyComputation.Element[] = [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256)];
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        expect(searchResult.valueCipherText?.length ?? 0).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).not().assertUndefined();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        assertUint8ArrayEqual(attachedValues[0], VALUE_A);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0500
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0500
     * @tc.desc   HashAlg.SHA384 privacy computation succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0500';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(privacyComputation.DataSetSize.SIZE_256, privacyComputation.ProtocolType.PIR_PROTOCOL);
        const targetElement: privacyComputation.TargetElement = buildTarget(TARGET, privacyComputation.HashAlg.SHA384);
        const elements: privacyComputation.Element[] = [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA384)];
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        expect(searchResult.valueCipherText?.length ?? 0).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).not().assertUndefined();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        assertUint8ArrayEqual(attachedValues[0], VALUE_A);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0600
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0600
     * @tc.desc   HashAlg.SHA512 privacy computation succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0600';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(privacyComputation.DataSetSize.SIZE_256, privacyComputation.ProtocolType.PIR_PROTOCOL);
        const targetElement: privacyComputation.TargetElement = buildTarget(TARGET, privacyComputation.HashAlg.SHA512);
        const elements: privacyComputation.Element[] = [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA512)];
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        expect(searchResult.valueCipherText?.length ?? 0).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).not().assertUndefined();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        assertUint8ArrayEqual(attachedValues[0], VALUE_A);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0700
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0700
     * @tc.desc   HashAlg.NONE with a 32-byte digest privacy computation succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0700';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(privacyComputation.DataSetSize.SIZE_256, privacyComputation.ProtocolType.PIR_PROTOCOL);
        const targetElement: privacyComputation.TargetElement = buildTarget(PREHASHED_32, privacyComputation.HashAlg.NONE);
        const elements: privacyComputation.Element[] = [buildElement(PREHASHED_32, VALUE_A, privacyComputation.HashAlg.NONE)];
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        expect(searchResult.valueCipherText?.length ?? 0).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).not().assertUndefined();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        assertUint8ArrayEqual(attachedValues[0], VALUE_A);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0800
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0800
     * @tc.desc   HashAlg.NONE with a 48-byte digest privacy computation succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0800';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(privacyComputation.DataSetSize.SIZE_256, privacyComputation.ProtocolType.PIR_PROTOCOL);
        const targetElement: privacyComputation.TargetElement = buildTarget(PREHASHED_48, privacyComputation.HashAlg.NONE);
        const elements: privacyComputation.Element[] = [buildElement(PREHASHED_48, VALUE_A, privacyComputation.HashAlg.NONE)];
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        expect(searchResult.valueCipherText?.length ?? 0).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).not().assertUndefined();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        assertUint8ArrayEqual(attachedValues[0], VALUE_A);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0900
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0900
     * @tc.desc   HashAlg.NONE with a 64-byte digest privacy computation succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_0900';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(privacyComputation.DataSetSize.SIZE_256, privacyComputation.ProtocolType.PIR_PROTOCOL);
        const targetElement: privacyComputation.TargetElement = buildTarget(PREHASHED_64, privacyComputation.HashAlg.NONE);
        const elements: privacyComputation.Element[] = [buildElement(PREHASHED_64, VALUE_A, privacyComputation.HashAlg.NONE)];
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        expect(searchResult.valueCipherText?.length ?? 0).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).not().assertUndefined();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        assertUint8ArrayEqual(attachedValues[0], VALUE_A);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1000
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1000
     * @tc.desc   PIR_PROTOCOL/SIZE_256 result contains no matched attached value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1000';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(privacyComputation.DataSetSize.SIZE_256, privacyComputation.ProtocolType.PIR_PROTOCOL);
        const targetElement: privacyComputation.TargetElement = buildTarget(TARGET, privacyComputation.HashAlg.SHA256);
        const elements: privacyComputation.Element[] = [buildElement(OTHER, VALUE_A, privacyComputation.HashAlg.SHA256)];
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        expect(searchResult.valueCipherText?.length ?? 0).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertFalse();
        expect(result.attachedValues).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1100
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1100
     * @tc.desc   PIR_PROTOCOL/SIZE_256 result contains one matched attached value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1100';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(privacyComputation.DataSetSize.SIZE_256, privacyComputation.ProtocolType.PIR_PROTOCOL);
        const targetElement: privacyComputation.TargetElement = buildTarget(TARGET, privacyComputation.HashAlg.SHA256);
        const elements: privacyComputation.Element[] = [buildElement(OTHER, VALUE_B, privacyComputation.HashAlg.SHA256), buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256)];
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        expect(searchResult.valueCipherText?.length ?? 0).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).not().assertUndefined();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        assertUint8ArrayEqual(attachedValues[0], VALUE_A);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1200
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1200
     * @tc.desc   PIR_PROTOCOL/SIZE_256 result contains two matched attached values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1200';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(privacyComputation.DataSetSize.SIZE_256, privacyComputation.ProtocolType.PIR_PROTOCOL);
        const targetElement: privacyComputation.TargetElement = buildTarget(TARGET, privacyComputation.HashAlg.SHA256);
        const elements: privacyComputation.Element[] = [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256), buildElement(OTHER, VALUE_B, privacyComputation.HashAlg.SHA256), buildElement(TARGET, VALUE_B, privacyComputation.HashAlg.SHA256)];
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        expect(searchResult.valueCipherText?.length ?? 0).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).not().assertUndefined();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(2);
        if (uint8ArrayEquals(attachedValues[0], VALUE_A)) {
          assertUint8ArrayEqual(attachedValues[0], VALUE_A);
          assertUint8ArrayEqual(attachedValues[1], VALUE_B);
        } else {
          assertUint8ArrayEqual(attachedValues[0], VALUE_B);
          assertUint8ArrayEqual(attachedValues[1], VALUE_A);
        }
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1300
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1300
     * @tc.desc   PSI_PROTOCOL/SIZE_512 matchedResult is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1300';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(privacyComputation.DataSetSize.SIZE_512, privacyComputation.ProtocolType.PSI_PROTOCOL);
        const targetElement: privacyComputation.TargetElement = buildTarget(TARGET, privacyComputation.HashAlg.SHA256);
        const elements: privacyComputation.Element[] = [buildElement(TARGET, undefined, privacyComputation.HashAlg.SHA256)];
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
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
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1400
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1400
     * @tc.desc   PSI_PROTOCOL/SIZE_512 matchedResult is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1400';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(privacyComputation.DataSetSize.SIZE_512, privacyComputation.ProtocolType.PSI_PROTOCOL);
        const targetElement: privacyComputation.TargetElement = buildTarget(TARGET, privacyComputation.HashAlg.SHA256);
        const elements: privacyComputation.Element[] = [buildElement(OTHER, undefined, privacyComputation.HashAlg.SHA256)];
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertFalse();
        expect(result.attachedValues).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1500
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1500
     * @tc.desc   Unsupported PIR_PROTOCOL/SIZE_512 combination reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1500';
      const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_512,
        privacyComputation.ProtocolType.PIR_PROTOCOL
      );
      try {
        await privacyComputation.genPrivacyTarget(
          buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
          protocol
        );
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1600
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1600
     * @tc.desc   Unsupported PSI_PROTOCOL/SIZE_128 combination reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1600';
      const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_128,
        privacyComputation.ProtocolType.PSI_PROTOCOL
      );
      try {
        await privacyComputation.genPrivacyTarget(
          buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
          protocol
        );
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1700
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1700
     * @tc.desc   Unsupported PSI_PROTOCOL/SIZE_256 combination reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1700';
      const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_256,
        privacyComputation.ProtocolType.PSI_PROTOCOL
      );
      try {
        await privacyComputation.genPrivacyTarget(
          buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
          protocol
        );
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1800
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1800
     * @tc.desc   genPrivacyTarget with HashAlg.NONE and a 33-byte digest reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1800';
      const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_256,
        privacyComputation.ProtocolType.PIR_PROTOCOL
      );
      try {
        await privacyComputation.genPrivacyTarget(
          buildTarget(INVALID_PREHASHED_33, privacyComputation.HashAlg.NONE),
          protocol
        );
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1900
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1900
     * @tc.desc   PIR getSearchResult reports error 24000009 when target uses SIZE_128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_1900';
      const expectedProtocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_256,
        privacyComputation.ProtocolType.PIR_PROTOCOL
      );
      const mismatchedProtocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_128,
        privacyComputation.ProtocolType.PIR_PROTOCOL
      );
      const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(
        buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
        mismatchedProtocol
      );
      expect(privacyTarget.length).assertLarger(0);
      const searchResult: privacyComputation.PrivacySearchResult =
        await privacyComputation.privacySearch(
          privacyTarget,
          [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256)],
          expectedProtocol
        );
      expect(searchResult.resultCipherText.length).assertLarger(0);
      expect(searchResult.valueCipherText).not().assertUndefined();
      expect(searchResult.valueCipherText?.length ?? 0).assertLarger(0);
      try {
        await privacyComputation.getSearchResult(searchResult, expectedProtocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000009);
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2000
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2000
     * @tc.desc   PIR getSearchResult reports error 24000009 when privacySearch uses SIZE_128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2000';
      const expectedProtocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_256,
        privacyComputation.ProtocolType.PIR_PROTOCOL
      );
      const mismatchedProtocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_128,
        privacyComputation.ProtocolType.PIR_PROTOCOL
      );
      const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(
        buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
        expectedProtocol
      );
      expect(privacyTarget.length).assertLarger(0);
      const searchResult: privacyComputation.PrivacySearchResult =
        await privacyComputation.privacySearch(
          privacyTarget,
          [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256)],
          mismatchedProtocol
        );
      expect(searchResult.resultCipherText.length).assertLarger(0);
      expect(searchResult.valueCipherText).not().assertUndefined();
      expect(searchResult.valueCipherText?.length ?? 0).assertLarger(0);
      try {
        await privacyComputation.getSearchResult(searchResult, expectedProtocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000009);
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2100
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2100
     * @tc.desc   PIR_PROTOCOL/SIZE_256 privacy computation uses SIZE_128 in getSearchResult and returns no match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2100';
      try {
        const expectedProtocol: privacyComputation.PrivacyProtocol = buildProtocol(
          privacyComputation.DataSetSize.SIZE_256,
          privacyComputation.ProtocolType.PIR_PROTOCOL
        );
        const mismatchedProtocol: privacyComputation.PrivacyProtocol = buildProtocol(
          privacyComputation.DataSetSize.SIZE_128,
          privacyComputation.ProtocolType.PIR_PROTOCOL
        );
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(
          buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
          expectedProtocol
        );
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(
            privacyTarget,
            [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256)],
            expectedProtocol
          );
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, mismatchedProtocol);
        expect(result.matchedResult).assertFalse();
        expect(result.attachedValues).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
/**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2200
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2200
     * @tc.desc   PSI computation still matches when target uses PIR and SIZE_256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2200';
      try {
        const expectedProtocol: privacyComputation.PrivacyProtocol = buildProtocol(
          privacyComputation.DataSetSize.SIZE_512,
          privacyComputation.ProtocolType.PSI_PROTOCOL
        );
        const mismatchedProtocol: privacyComputation.PrivacyProtocol = buildProtocol(
          privacyComputation.DataSetSize.SIZE_256,
          privacyComputation.ProtocolType.PIR_PROTOCOL
        );
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(
          buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
          mismatchedProtocol
        );
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(
            privacyTarget,
            [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256)],
            expectedProtocol
          );
        expect(searchResult.resultCipherText.length).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, expectedProtocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2300
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2300
     * @tc.desc   PSI computation still matches when privacySearch uses PIR and SIZE_256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2300';
      try {
        const expectedProtocol: privacyComputation.PrivacyProtocol = buildProtocol(
          privacyComputation.DataSetSize.SIZE_512,
          privacyComputation.ProtocolType.PSI_PROTOCOL
        );
        const mismatchedProtocol: privacyComputation.PrivacyProtocol = buildProtocol(
          privacyComputation.DataSetSize.SIZE_256,
          privacyComputation.ProtocolType.PIR_PROTOCOL
        );
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(
          buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
          expectedProtocol
        );
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(
            privacyTarget,
            [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256)],
            mismatchedProtocol
          );
        expect(searchResult.resultCipherText.length).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, expectedProtocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
/**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2400
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2400
     * @tc.desc   PSI getSearchResult reports error 24000009 with PIR and SIZE_256 protocol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2400';
      const expectedProtocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_512,
        privacyComputation.ProtocolType.PSI_PROTOCOL
      );
      const mismatchedProtocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_256,
        privacyComputation.ProtocolType.PIR_PROTOCOL
      );
      const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(
        buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
        expectedProtocol
      );
      expect(privacyTarget.length).assertLarger(0);
      const searchResult: privacyComputation.PrivacySearchResult =
        await privacyComputation.privacySearch(
          privacyTarget,
          [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256)],
          expectedProtocol
        );
      expect(searchResult.resultCipherText.length).assertLarger(0);
      try {
        await privacyComputation.getSearchResult(searchResult, mismatchedProtocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000009);
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2500
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2500
     * @tc.desc   HashAlg.SHA256 target and HashAlg.SHA384 dataset return no match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2500';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
          privacyComputation.DataSetSize.SIZE_256,
          privacyComputation.ProtocolType.PIR_PROTOCOL
        );
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(
          buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
          protocol
        );
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(
            privacyTarget,
            [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA384)],
            protocol
          );
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertFalse();
        expect(result.attachedValues).assertEqual(undefined);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2600
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2600
     * @tc.desc   HashAlg.NONE target and HashAlg.SHA256 dataset use the same digest and match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2600';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
          privacyComputation.DataSetSize.SIZE_512,
          privacyComputation.ProtocolType.PSI_PROTOCOL
        );
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(
          buildTarget(SHA256_ABC, privacyComputation.HashAlg.NONE),
          protocol
        );
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(
            privacyTarget,
            [buildElement(ABC, undefined, privacyComputation.HashAlg.SHA256)],
            protocol
          );
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
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2700
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2700
     * @tc.desc   TargetElement.hashAlg omitted defaults to NONE and Element.hashAlg SHA256 match in PIR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2700';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(privacyComputation.DataSetSize.SIZE_256, privacyComputation.ProtocolType.PIR_PROTOCOL);
        const targetElement: privacyComputation.TargetElement = buildTarget(SHA256_ABC);
        const elements: privacyComputation.Element[] = [buildElement(ABC, VALUE_A, privacyComputation.HashAlg.SHA256), buildElement(OTHER, VALUE_B, privacyComputation.HashAlg.SHA256)];
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        expect(searchResult.valueCipherText?.length ?? 0).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).not().assertUndefined();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        assertUint8ArrayEqual(attachedValues[0], VALUE_A);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2800
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2800
     * @tc.desc   Element.hashAlg omitted defaults to NONE and TargetElement.hashAlg SHA256 match in PIR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2800';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(privacyComputation.DataSetSize.SIZE_256, privacyComputation.ProtocolType.PIR_PROTOCOL);
        const targetElement: privacyComputation.TargetElement = buildTarget(ABC, privacyComputation.HashAlg.SHA256);
        const elements: privacyComputation.Element[] = [buildElement(SHA256_ABC, VALUE_A), buildElement(PREHASHED_32, VALUE_B)];
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        expect(searchResult.valueCipherText?.length ?? 0).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).not().assertUndefined();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        assertUint8ArrayEqual(attachedValues[0], VALUE_A);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2900
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2900
     * @tc.desc   TargetElement.hashAlg and Element.hashAlg omitted default to NONE and match in PIR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_2900';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(privacyComputation.DataSetSize.SIZE_256, privacyComputation.ProtocolType.PIR_PROTOCOL);
        const targetElement: privacyComputation.TargetElement = buildTarget(SHA256_ABC);
        const elements: privacyComputation.Element[] = [buildElement(SHA256_ABC, VALUE_A), buildElement(PREHASHED_32, VALUE_B)];
        const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        expect(searchResult.valueCipherText?.length ?? 0).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).not().assertUndefined();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        assertUint8ArrayEqual(attachedValues[0], VALUE_A);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3000
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3000
     * @tc.desc   PIR_PROTOCOL Element.elemValue omitted reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3000';
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
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3100
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3100
     * @tc.desc   PSI_PROTOCOL ignores an extra valueCipherText and succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3100';
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
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3200
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3200
     * @tc.desc   TargetElement.hashAlg omitted defaults to NONE and rejects a raw 3-byte digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3200';
      const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_512,
        privacyComputation.ProtocolType.PSI_PROTOCOL
      );
      try {
        await privacyComputation.genPrivacyTarget(buildTarget(TARGET), protocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3300
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3300
     * @tc.desc   Element.hashAlg omitted defaults to NONE and rejects a raw 3-byte digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3300';
      const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_512,
        privacyComputation.ProtocolType.PSI_PROTOCOL
      );
      const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(
        buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
        protocol
      );
      expect(privacyTarget.length).assertLarger(0);
      try {
        await privacyComputation.privacySearch(
          privacyTarget,
          [buildElement(TARGET, undefined)],
          protocol
        );
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3400
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3400
     * @tc.desc   Empty elemData reports error 24000018 in PIR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3400';
      const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_256,
        privacyComputation.ProtocolType.PIR_PROTOCOL
      );
      const targetElement: privacyComputation.TargetElement =
        buildTarget(EMPTY_DATA, privacyComputation.HashAlg.SHA256);
      try {
        await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3500
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3500
     * @tc.desc   1 KB elemData and elemKey succeed in PIR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3500';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
          privacyComputation.DataSetSize.SIZE_256,
          privacyComputation.ProtocolType.PIR_PROTOCOL
        );
        const boundaryData: Uint8Array = new Uint8Array(MAX_KEY_DATA_SIZE);
        boundaryData.fill(0x41);
        const targetElement: privacyComputation.TargetElement =
          buildTarget(boundaryData, privacyComputation.HashAlg.SHA256);
        const elements: privacyComputation.Element[] =
          [buildElement(boundaryData, VALUE_A, privacyComputation.HashAlg.SHA256)];
        const privacyTarget: Uint8Array =
          await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        expect(searchResult.valueCipherText?.length ?? 0).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).not().assertUndefined();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        expect(attachedValues[0].length).assertEqual(VALUE_A.length);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3600
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3600
     * @tc.desc   10 KB elemValue succeeds and is returned in PIR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3600';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
          privacyComputation.DataSetSize.SIZE_256,
          privacyComputation.ProtocolType.PIR_PROTOCOL
        );
        const largeValue: Uint8Array = new Uint8Array(LARGE_VALUE_SIZE);
        largeValue.fill(0x42);
        const targetElement: privacyComputation.TargetElement =
          buildTarget(TARGET, privacyComputation.HashAlg.SHA256);
        const elements: privacyComputation.Element[] =
          [buildElement(TARGET, largeValue, privacyComputation.HashAlg.SHA256)];
        const privacyTarget: Uint8Array =
          await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        expect(searchResult.valueCipherText?.length ?? 0).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).not().assertUndefined();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        expect(attachedValues[0].length).assertEqual(LARGE_VALUE_SIZE);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3700
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3700
     * @tc.desc   1000 elements with SIZE_256 generate four result ciphertexts
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3700';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
          privacyComputation.DataSetSize.SIZE_256,
          privacyComputation.ProtocolType.PIR_PROTOCOL
        );
        const targetElement: privacyComputation.TargetElement =
          buildTarget(new Uint8Array([0x00, 0x00]), privacyComputation.HashAlg.SHA256);
        const elements: privacyComputation.Element[] = [];
        for (let i: number = 0; i < 1000; i++) {
          elements.push(
            buildElement(
              new Uint8Array([Math.floor(i / 256), i % 256]),
              VALUE_A,
              privacyComputation.HashAlg.SHA256
            )
          );
        }
        const privacyTarget: Uint8Array =
          await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertEqual(4);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).not().assertUndefined();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        assertUint8ArrayEqual(attachedValues[0], VALUE_A);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3800
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3800
     * @tc.desc   Empty elemKey reports error 24000018 in PIR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3800';
      const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_256,
        privacyComputation.ProtocolType.PIR_PROTOCOL
      );
      const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(
        buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
        protocol
      );
      const elements: privacyComputation.Element[] =
        [buildElement(EMPTY_DATA, VALUE_A, privacyComputation.HashAlg.SHA256)];
      try {
        await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3900
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3900
     * @tc.desc   One empty elemKey in multiple elements reports error 24000018 in PIR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_3900';
      const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_256,
        privacyComputation.ProtocolType.PIR_PROTOCOL
      );
      const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(
        buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
        protocol
      );
      const elements: privacyComputation.Element[] = [
        buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256),
        buildElement(EMPTY_DATA, VALUE_B, privacyComputation.HashAlg.SHA256),
        buildElement(OTHER, VALUE_B, privacyComputation.HashAlg.SHA256)
      ];
      try {
        await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4000
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4000
     * @tc.desc   Empty elemValue succeeds and is returned in PIR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4000';
      try {
        const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
          privacyComputation.DataSetSize.SIZE_256,
          privacyComputation.ProtocolType.PIR_PROTOCOL
        );
        const targetElement: privacyComputation.TargetElement =
          buildTarget(TARGET, privacyComputation.HashAlg.SHA256);
        const elements: privacyComputation.Element[] =
          [buildElement(TARGET, EMPTY_DATA, privacyComputation.HashAlg.SHA256)];
        const privacyTarget: Uint8Array =
          await privacyComputation.genPrivacyTarget(targetElement, protocol);
        expect(privacyTarget.length).assertLarger(0);
        const searchResult: privacyComputation.PrivacySearchResult =
          await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(searchResult.resultCipherText.length).assertLarger(0);
        expect(searchResult.valueCipherText).not().assertUndefined();
        expect(searchResult.valueCipherText?.length ?? 0).assertLarger(0);
        const result: privacyComputation.SearchResult =
          await privacyComputation.getSearchResult(searchResult, protocol);
        expect(result.matchedResult).assertTrue();
        expect(result.attachedValues).not().assertUndefined();
        const attachedValues: Uint8Array[] = result.attachedValues as Uint8Array[];
        expect(attachedValues.length).assertEqual(1);
        assertUint8ArrayEqual(attachedValues[0], EMPTY_DATA);
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4100
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4100
     * @tc.desc   1025-byte elemData reports error 24000018 in PIR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4100';
      const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_256,
        privacyComputation.ProtocolType.PIR_PROTOCOL
      );
      const overlongData: Uint8Array = new Uint8Array(OVERLONG_KEY_DATA_SIZE);
      overlongData.fill(0x43);
      try {
        await privacyComputation.genPrivacyTarget(
          buildTarget(overlongData, privacyComputation.HashAlg.SHA256),
          protocol
        );
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4200
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4200
     * @tc.desc   One 1025-byte elemKey in multiple elements reports error 24000018 in PIR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4200';
      const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_256,
        privacyComputation.ProtocolType.PIR_PROTOCOL
      );
      const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(
        buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
        protocol
      );
      expect(privacyTarget.length).assertLarger(0);
      const overlongKey: Uint8Array = new Uint8Array(OVERLONG_KEY_DATA_SIZE);
      overlongKey.fill(0x44);
      const elements: privacyComputation.Element[] = [
        buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256),
        buildElement(overlongKey, VALUE_B, privacyComputation.HashAlg.SHA256),
        buildElement(OTHER, VALUE_B, privacyComputation.HashAlg.SHA256)
      ];
      try {
        await privacyComputation.privacySearch(privacyTarget, elements, protocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4300
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4300
     * @tc.desc   getSearchResult reports error 24000009 when resultCipherText is tampered in PIR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_FUNC_4300';
      const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
        privacyComputation.DataSetSize.SIZE_256,
        privacyComputation.ProtocolType.PIR_PROTOCOL
      );
      const privacyTarget: Uint8Array = await privacyComputation.genPrivacyTarget(
        buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
        protocol
      );
      expect(privacyTarget.length).assertLarger(0);
      const searchResult: privacyComputation.PrivacySearchResult =
        await privacyComputation.privacySearch(
          privacyTarget,
          [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256)],
          protocol
        );
      expect(searchResult.resultCipherText.length).assertLarger(0);
      expect(searchResult.resultCipherText[0].length).assertLarger(0);
      expect(searchResult.valueCipherText).not().assertUndefined();
      const originalCipher: Uint8Array = searchResult.resultCipherText[0];
      const tamperedCipher: Uint8Array = originalCipher.slice(0) as Uint8Array;
      tamperedCipher[0] = tamperedCipher[0] ^ 0xff;
      searchResult.resultCipherText[0] = tamperedCipher;
      try {
        await privacyComputation.getSearchResult(searchResult, protocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000009);
      }
    });
  });
}
