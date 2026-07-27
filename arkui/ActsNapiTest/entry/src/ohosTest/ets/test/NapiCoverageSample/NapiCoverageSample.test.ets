/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import napiCoverageSample from 'libnapicoveragesamplendktest.so';
import type {
  CriticalScopeStatus,
  EnumValues,
  ExternalStringResult,
  FatalExceptionResult,
  ModuleRegisterResult,
  StrongSendableReferenceResult,
  ThrowBusinessErrorResult,
} from 'libnapicoveragesamplendktest.so';

const NAPI_OK: number = 0;
const NAPI_INVALID_ARG: number = 1;

export default function napiCoverageSampleTest() {
  describe('NapiCoverageSampleTest', () => {
    /**
     * @tc.name   testNapiCoverageEnumValues001
     * @tc.number SUB_THIRDPARTY_NAPI_COVERAGE_ENUM_VALUES_0100
     * @tc.desc   Verify uncovered NAPI enum values can be observed from native side.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNapiCoverageEnumValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const values: EnumValues = napiCoverageSample.testEnumValues();
      expect(values.qosBackground).assertEqual(0);
      expect(values.qosUtility).assertEqual(1);
      expect(values.eventModeDefault).assertEqual(0);
      expect(values.priorityImmediate).assertEqual(0);
    });

    /**
     * @tc.name   testNapiCoverageModuleRegister001
     * @tc.number SUB_THIRDPARTY_NAPI_COVERAGE_MODULE_REGISTER_0100
     * @tc.desc   Verify napi_module_register can be called from native side.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNapiCoverageModuleRegister001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const result: ModuleRegisterResult = napiCoverageSample.testModuleRegister();
      expect(result.registerCalled).assertTrue();
    });

    /**
     * @tc.name   testNapiCoverageFatalException001
     * @tc.number SUB_THIRDPARTY_NAPI_COVERAGE_FATAL_EXCEPTION_0100
     * @tc.desc   Verify napi_fatal_exception returns napi_invalid_arg for non-Error value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNapiCoverageFatalException001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const result: FatalExceptionResult = napiCoverageSample.testFatalExceptionInvalidArg();
      expect(result.createStringStatus).assertEqual(NAPI_OK);
      expect(result.fatalStatus).assertEqual(NAPI_INVALID_ARG);
    });

    /**
     * @tc.name   testNapiCoverageCriticalScope001
     * @tc.number SUB_THIRDPARTY_NAPI_COVERAGE_CRITICAL_SCOPE_0100
     * @tc.desc   Verify critical scope open, buffer read, and close return napi_ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNapiCoverageCriticalScope001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const status: CriticalScopeStatus = napiCoverageSample.testCriticalScopeOpenClose();
      expect(status.openStatus).assertEqual(NAPI_OK);
      expect(status.getBufferStatus).assertEqual(NAPI_OK);
      expect(status.closeStatus).assertEqual(NAPI_OK);
      expect(status.length).assertEqual(2);
      expect(status.contentMatched).assertTrue();
    });

    /**
     * @tc.name   testNapiCoverageExternalString001
     * @tc.number SUB_THIRDPARTY_NAPI_COVERAGE_EXTERNAL_STRING_0100
     * @tc.desc   Verify external UTF16 and ASCII strings return napi_ok and preserve content.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNapiCoverageExternalString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const result: ExternalStringResult = napiCoverageSample.testExternalString();
      expect(result.utf16Status).assertEqual(NAPI_OK);
      expect(result.readUtf16Status).assertEqual(NAPI_OK);
      expect(result.utf16Matched).assertTrue();
      expect(result.asciiStatus).assertEqual(NAPI_OK);
      expect(result.readAsciiStatus).assertEqual(NAPI_OK);
      expect(result.asciiMatched).assertTrue();
    });

    /**
     * @tc.name   testNapiCoverageStrongSendableReference001
     * @tc.number SUB_THIRDPARTY_NAPI_COVERAGE_STRONG_SENDABLE_REFERENCE_0100
     * @tc.desc   Verify strong sendable reference create, get, and delete return napi_ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNapiCoverageStrongSendableReference001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const result: StrongSendableReferenceResult = napiCoverageSample.testStrongSendableReference();
      expect(result.createArrayStatus).assertEqual(NAPI_OK);
      expect(result.createRefStatus).assertEqual(NAPI_OK);
      expect(result.getRefStatus).assertEqual(NAPI_OK);
      expect(result.isSendableStatus).assertEqual(NAPI_OK);
      expect(result.isSendable).assertTrue();
      expect(result.deleteRefStatus).assertEqual(NAPI_OK);
    });

    /**
     * @tc.name   testNapiCoverageThrowBusinessError001
     * @tc.number SUB_THIRDPARTY_NAPI_COVERAGE_THROW_BUSINESS_ERROR_0100
     * @tc.desc   Verify napi_throw_business_error returns napi_ok and pending exception is cleared in native side.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNapiCoverageThrowBusinessError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const result: ThrowBusinessErrorResult = napiCoverageSample.testThrowBusinessError();
      expect(result.throwStatus).assertEqual(NAPI_OK);
      expect(result.pendingStatus).assertEqual(NAPI_OK);
      expect(result.pendingAfterThrow).assertTrue();
      expect(result.clearStatus).assertEqual(NAPI_OK);
      expect(result.pendingAfterClearStatus).assertEqual(NAPI_OK);
      expect(result.pendingAfterClear).assertFalse();
    });
  });
}
