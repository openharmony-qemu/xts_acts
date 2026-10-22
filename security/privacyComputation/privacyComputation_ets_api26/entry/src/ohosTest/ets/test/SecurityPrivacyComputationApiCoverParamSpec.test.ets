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
const VALID_TARGET: privacyComputation.TargetElement =
  buildTarget(TARGET, privacyComputation.HashAlg.SHA256);
const VALID_ELEMENTS: privacyComputation.Element[] =
  [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256)];

async function createValidPrivacyTarget(): Promise<Uint8Array> {
  return privacyComputation.genPrivacyTarget(VALID_TARGET, VALID_PROTOCOL);
}

async function createValidSearchResult(): Promise<privacyComputation.PrivacySearchResult> {
  const privacyTarget: Uint8Array = await createValidPrivacyTarget();
  return privacyComputation.privacySearch(privacyTarget, VALID_ELEMENTS, VALID_PROTOCOL);
}

export default function SecurityPrivacyComputationApiCoverParamSpecTest(): void {
  describe('SecurityPrivacyComputationApiCoverParamSpecTest', () => {
    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0100
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0100
     * @tc.desc   genPrivacyTarget with null targetElement reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0100';
      try {
        await privacyComputation.genPrivacyTarget(null, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0200
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0200
     * @tc.desc   genPrivacyTarget with undefined targetElement reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0200';
      try {
        await privacyComputation.genPrivacyTarget(undefined, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0300
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0300
     * @tc.desc   genPrivacyTarget with missing elemData reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0300';
      const invalidTarget: privacyComputation.TargetElement = {
        hashAlg: privacyComputation.HashAlg.SHA256
      } as privacyComputation.TargetElement;
      try {
        await privacyComputation.genPrivacyTarget(invalidTarget, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0400
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0400
     * @tc.desc   genPrivacyTarget with wrong elemData type reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0400';
      const invalidTarget: privacyComputation.TargetElement = buildTarget(
        'invalid' as Object as Uint8Array,
        privacyComputation.HashAlg.SHA256
      );
      try {
        await privacyComputation.genPrivacyTarget(invalidTarget, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0500
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0500
     * @tc.desc   genPrivacyTarget with null privacyProtocol reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0500';
      try {
        await privacyComputation.genPrivacyTarget(VALID_TARGET, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0600
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0600
     * @tc.desc   genPrivacyTarget with undefined privacyProtocol reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0600';
      try {
        await privacyComputation.genPrivacyTarget(VALID_TARGET, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0700
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0700
     * @tc.desc   genPrivacyTarget with missing dataSetSize reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0700';
      const invalidProtocol: privacyComputation.PrivacyProtocol = {
        protocolType: privacyComputation.ProtocolType.PIR_PROTOCOL
      } as privacyComputation.PrivacyProtocol;
      try {
        await privacyComputation.genPrivacyTarget(VALID_TARGET, invalidProtocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0800
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0800
     * @tc.desc   genPrivacyTarget with missing protocolType reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0800';
      const invalidProtocol: privacyComputation.PrivacyProtocol = {
        dataSetSize: privacyComputation.DataSetSize.SIZE_256
      } as privacyComputation.PrivacyProtocol;
      try {
        await privacyComputation.genPrivacyTarget(VALID_TARGET, invalidProtocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0900
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0900
     * @tc.desc   privacySearch with null privacyTarget reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_0900';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      try {
        await privacyComputation.privacySearch(null, VALID_ELEMENTS, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1000
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1000
     * @tc.desc   privacySearch with undefined privacyTarget reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1000';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      try {
        await privacyComputation.privacySearch(undefined, VALID_ELEMENTS, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1100
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1100
     * @tc.desc   privacySearch with wrong privacyTarget type reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1100';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      const invalidPrivacyTarget: Uint8Array = 'invalid' as Object as Uint8Array;
      try {
        await privacyComputation.privacySearch(invalidPrivacyTarget, VALID_ELEMENTS, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1200
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1200
     * @tc.desc   privacySearch with empty privacyTarget reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1200';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      const invalidPrivacyTarget: Uint8Array = new Uint8Array(0);
      try {
        await privacyComputation.privacySearch(invalidPrivacyTarget, VALID_ELEMENTS, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1300
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1300
     * @tc.desc   privacySearch with null elements reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1300';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      try {
        await privacyComputation.privacySearch(privacyTarget, null, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1400
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1400
     * @tc.desc   privacySearch with undefined elements reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1400';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      try {
        await privacyComputation.privacySearch(privacyTarget, undefined, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1500
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1500
     * @tc.desc   privacySearch with wrong elements type reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1500';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      const invalidElements: privacyComputation.Element[] = 'invalid' as Object as privacyComputation.Element[];
      try {
        await privacyComputation.privacySearch(privacyTarget, invalidElements, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1600
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1600
     * @tc.desc   privacySearch with empty elements reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1600';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      const emptyElements: privacyComputation.Element[] = [];
      try {
        await privacyComputation.privacySearch(privacyTarget, emptyElements, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1700
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1700
     * @tc.desc   privacySearch with missing elemKey reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1700';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      const invalidElement: privacyComputation.Element = {
        elemValue: VALUE_A,
        hashAlg: privacyComputation.HashAlg.SHA256
      } as privacyComputation.Element;
      const invalidElements: privacyComputation.Element[] = [invalidElement];
      try {
        await privacyComputation.privacySearch(privacyTarget, invalidElements, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1800
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1800
     * @tc.desc   privacySearch with wrong elemKey type reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1800';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      const invalidElement: privacyComputation.Element = buildElement(
        'invalid' as Object as Uint8Array,
        VALUE_A,
        privacyComputation.HashAlg.SHA256
      );
      const invalidElements: privacyComputation.Element[] = [invalidElement];
      try {
        await privacyComputation.privacySearch(privacyTarget, invalidElements, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1900
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1900
     * @tc.desc   privacySearch with null privacyProtocol reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_1900';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      try {
        await privacyComputation.privacySearch(privacyTarget, VALID_ELEMENTS, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2000
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2000
     * @tc.desc   privacySearch with undefined privacyProtocol reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2000';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      try {
        await privacyComputation.privacySearch(privacyTarget, VALID_ELEMENTS, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2100
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2100
     * @tc.desc   privacySearch with missing dataSetSize reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2100';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      const invalidProtocol: privacyComputation.PrivacyProtocol = {
        protocolType: privacyComputation.ProtocolType.PIR_PROTOCOL
      } as privacyComputation.PrivacyProtocol;
      try {
        await privacyComputation.privacySearch(privacyTarget, VALID_ELEMENTS, invalidProtocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2200
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2200
     * @tc.desc   privacySearch with missing protocolType reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2200';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      const invalidProtocol: privacyComputation.PrivacyProtocol = {
        dataSetSize: privacyComputation.DataSetSize.SIZE_256
      } as privacyComputation.PrivacyProtocol;
      try {
        await privacyComputation.privacySearch(privacyTarget, VALID_ELEMENTS, invalidProtocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2300
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2300
     * @tc.desc   getSearchResult with null privacySearchResult reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2300';
      try {
        await privacyComputation.getSearchResult(null, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2400
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2400
     * @tc.desc   getSearchResult with undefined privacySearchResult reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2400';
      try {
        await privacyComputation.getSearchResult(undefined, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2500
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2500
     * @tc.desc   getSearchResult with missing resultCipherText reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2500';
      const validSearchResult: privacyComputation.PrivacySearchResult = await createValidSearchResult();
      const invalidSearchResult: privacyComputation.PrivacySearchResult = {
        valueCipherText: validSearchResult.valueCipherText
      } as privacyComputation.PrivacySearchResult;
      try {
        await privacyComputation.getSearchResult(invalidSearchResult, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2600
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2600
     * @tc.desc   getSearchResult with wrong resultCipherText type reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2600';
      const searchResult: privacyComputation.PrivacySearchResult = await createValidSearchResult();
      searchResult.resultCipherText = 'invalid' as Object as Uint8Array[];
      try {
        await privacyComputation.getSearchResult(searchResult, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2700
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2700
     * @tc.desc   getSearchResult with empty resultCipherText reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2700';
      const searchResult: privacyComputation.PrivacySearchResult = await createValidSearchResult();
      searchResult.resultCipherText = [];
      try {
        await privacyComputation.getSearchResult(searchResult, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2800
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2800
     * @tc.desc   getSearchResult with wrong valueCipherText type reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2800';
      const searchResult: privacyComputation.PrivacySearchResult = await createValidSearchResult();
      searchResult.valueCipherText = 'invalid' as Object as Uint8Array[];
      try {
        await privacyComputation.getSearchResult(searchResult, VALID_PROTOCOL);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2900
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2900
     * @tc.desc   getSearchResult with null privacyProtocol reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_2900';
      const searchResult: privacyComputation.PrivacySearchResult = await createValidSearchResult();
      try {
        await privacyComputation.getSearchResult(searchResult, null);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3000
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3000
     * @tc.desc   getSearchResult with undefined privacyProtocol reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3000';
      const searchResult: privacyComputation.PrivacySearchResult = await createValidSearchResult();
      try {
        await privacyComputation.getSearchResult(searchResult, undefined);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3100
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3100
     * @tc.desc   getSearchResult with missing dataSetSize reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3100';
      const searchResult: privacyComputation.PrivacySearchResult = await createValidSearchResult();
      const invalidProtocol: privacyComputation.PrivacyProtocol = {
        protocolType: privacyComputation.ProtocolType.PIR_PROTOCOL
      } as privacyComputation.PrivacyProtocol;
      try {
        await privacyComputation.getSearchResult(searchResult, invalidProtocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3200
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3200
     * @tc.desc   getSearchResult with missing protocolType reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3200';
      const searchResult: privacyComputation.PrivacySearchResult = await createValidSearchResult();
      const invalidProtocol: privacyComputation.PrivacyProtocol = {
        dataSetSize: privacyComputation.DataSetSize.SIZE_256
      } as privacyComputation.PrivacyProtocol;
      try {
        await privacyComputation.getSearchResult(searchResult, invalidProtocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3300
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3300
     * @tc.desc   genPrivacyTarget with protocolType -1 reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3300';
      const invalidProtocol: privacyComputation.PrivacyProtocol = {
        dataSetSize: privacyComputation.DataSetSize.SIZE_256,
        protocolType: -1 as privacyComputation.ProtocolType
      };
      try {
        await privacyComputation.genPrivacyTarget(
          buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
          invalidProtocol
        );
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3400
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3400
     * @tc.desc   genPrivacyTarget with protocolType 2 reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3400';
      const invalidProtocol: privacyComputation.PrivacyProtocol = {
        dataSetSize: privacyComputation.DataSetSize.SIZE_256,
        protocolType: 2 as privacyComputation.ProtocolType
      };
      try {
        await privacyComputation.genPrivacyTarget(
          buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
          invalidProtocol
        );
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3500
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3500
     * @tc.desc   privacySearch with protocolType -1 reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3500';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      const invalidProtocol: privacyComputation.PrivacyProtocol = {
        dataSetSize: privacyComputation.DataSetSize.SIZE_256,
        protocolType: -1 as privacyComputation.ProtocolType
      };
      try {
        await privacyComputation.privacySearch(
          privacyTarget,
          [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256)],
          invalidProtocol
        );
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3600
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3600
     * @tc.desc   privacySearch with protocolType 2 reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3600';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      const invalidProtocol: privacyComputation.PrivacyProtocol = {
        dataSetSize: privacyComputation.DataSetSize.SIZE_256,
        protocolType: 2 as privacyComputation.ProtocolType
      };
      try {
        await privacyComputation.privacySearch(
          privacyTarget,
          [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256)],
          invalidProtocol
        );
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3700
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3700
     * @tc.desc   getSearchResult with protocolType -1 reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3700';
      const searchResult: privacyComputation.PrivacySearchResult = await createValidSearchResult();
      const invalidProtocol: privacyComputation.PrivacyProtocol = {
        dataSetSize: privacyComputation.DataSetSize.SIZE_256,
        protocolType: -1 as privacyComputation.ProtocolType
      };
      try {
        await privacyComputation.getSearchResult(searchResult, invalidProtocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3800
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3800
     * @tc.desc   getSearchResult with protocolType 2 reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3800';
      const searchResult: privacyComputation.PrivacySearchResult = await createValidSearchResult();
      const invalidProtocol: privacyComputation.PrivacyProtocol = {
        dataSetSize: privacyComputation.DataSetSize.SIZE_256,
        protocolType: 2 as privacyComputation.ProtocolType
      };
      try {
        await privacyComputation.getSearchResult(searchResult, invalidProtocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3900
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3900
     * @tc.desc   genPrivacyTarget with dataSetSize -1 reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_3900';
      const invalidProtocol: privacyComputation.PrivacyProtocol = {
        dataSetSize: -1 as privacyComputation.DataSetSize,
        protocolType: privacyComputation.ProtocolType.PIR_PROTOCOL
      };
      try {
        await privacyComputation.genPrivacyTarget(
          buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
          invalidProtocol
        );
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4000
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4000
     * @tc.desc   genPrivacyTarget with dataSetSize 3 reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4000';
      const invalidProtocol: privacyComputation.PrivacyProtocol = {
        dataSetSize: 3 as privacyComputation.DataSetSize,
        protocolType: privacyComputation.ProtocolType.PIR_PROTOCOL
      };
      try {
        await privacyComputation.genPrivacyTarget(
          buildTarget(TARGET, privacyComputation.HashAlg.SHA256),
          invalidProtocol
        );
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4100
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4100
     * @tc.desc   privacySearch with dataSetSize -1 reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4100';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      const invalidProtocol: privacyComputation.PrivacyProtocol = {
        dataSetSize: -1 as privacyComputation.DataSetSize,
        protocolType: privacyComputation.ProtocolType.PIR_PROTOCOL
      };
      try {
        await privacyComputation.privacySearch(
          privacyTarget,
          [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256)],
          invalidProtocol
        );
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4200
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4200
     * @tc.desc   privacySearch with dataSetSize 3 reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4200';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      const invalidProtocol: privacyComputation.PrivacyProtocol = {
        dataSetSize: 3 as privacyComputation.DataSetSize,
        protocolType: privacyComputation.ProtocolType.PIR_PROTOCOL
      };
      try {
        await privacyComputation.privacySearch(
          privacyTarget,
          [buildElement(TARGET, VALUE_A, privacyComputation.HashAlg.SHA256)],
          invalidProtocol
        );
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4300
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4300
     * @tc.desc   getSearchResult with dataSetSize -1 reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4300';
      const searchResult: privacyComputation.PrivacySearchResult = await createValidSearchResult();
      const invalidProtocol: privacyComputation.PrivacyProtocol = {
        dataSetSize: -1 as privacyComputation.DataSetSize,
        protocolType: privacyComputation.ProtocolType.PIR_PROTOCOL
      };
      try {
        await privacyComputation.getSearchResult(searchResult, invalidProtocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4400
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4400
     * @tc.desc   getSearchResult with dataSetSize 3 reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4400';
      const searchResult: privacyComputation.PrivacySearchResult = await createValidSearchResult();
      const invalidProtocol: privacyComputation.PrivacyProtocol = {
        dataSetSize: 3 as privacyComputation.DataSetSize,
        protocolType: privacyComputation.ProtocolType.PIR_PROTOCOL
      };
      try {
        await privacyComputation.getSearchResult(searchResult, invalidProtocol);
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4500
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4500
     * @tc.desc   genPrivacyTarget with hashAlg -1 reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4500';
      try {
        await privacyComputation.genPrivacyTarget(
          buildTarget(TARGET, -1 as privacyComputation.HashAlg),
          VALID_PROTOCOL
        );
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4600
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4600
     * @tc.desc   genPrivacyTarget with hashAlg 4 reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4600';
      try {
        await privacyComputation.genPrivacyTarget(
          buildTarget(TARGET, 4 as privacyComputation.HashAlg),
          VALID_PROTOCOL
        );
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4700
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4700
     * @tc.desc   privacySearch with hashAlg -1 reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4700';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      try {
        await privacyComputation.privacySearch(
          privacyTarget,
          [buildElement(TARGET, VALUE_A, -1 as privacyComputation.HashAlg)],
          VALID_PROTOCOL
        );
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

    /**
     * @tc.name   SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4800
     * @tc.number SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4800
     * @tc.desc   privacySearch with hashAlg 4 reports error 24000018
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testNumber: string = 'SUB_SECURITY_HPIC_PrivacyComputation_API26_PARAMSPEC_4800';
      const privacyTarget: Uint8Array = await createValidPrivacyTarget();
      try {
        await privacyComputation.privacySearch(
          privacyTarget,
          [buildElement(TARGET, VALUE_A, 4 as privacyComputation.HashAlg)],
          VALID_PROTOCOL
        );
        expect(null).assertFail();
      } catch (err) {
        Logger.error(`${testNumber} catch error ${JSON.stringify(err)}`);
        expect((err as ErrorLike).code).assertEqual(24000018);
      }
    });

  });
}
