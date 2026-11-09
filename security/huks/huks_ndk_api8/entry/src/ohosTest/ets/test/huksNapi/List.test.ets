/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import HuksAgreeDhTest from './HuksAgreeDhTest.test';
import HuksAgreeEcdhTest from './HuksAgreeEcdhTest.test';
import HuksAgreeX25519Test from './HuksAgreeX25519Test.test';
import HuksAttestTest from './HuksAttestTest.test';
import HuksCipherAesTest from './HuksCipherAesTest.test';
import HuksCipherRsaTest from './HuksCipherRsaTest.test';
import HuksCipherSm4Test from './HuksCipherSm4Test.test';
import HuksDeriveHkdfTest from './HuksDeriveHkdfTest.test';
import HuksDerivePbkdfTest from './HuksDerivePbkdfTest.test';
import HuksHmacTest from './HuksHmacTest.test';
import HuksMiscTest from './HuksMiscTest.test';
import HuksNullptrTest from './HuksNullptrTest.test';
import HuksSignVerifyDsaTest from './HuksSignVerifyDsaTest.test';
import HuksSignVerifyEccTest from './HuksSignVerifyEccTest.test';
import HuksSignVerifyEd25519Test from './HuksSignVerifyEd25519Test.test';
import HuksSignVerifyRsaTest from './HuksSignVerifyRsaTest.test';
import HuksSignVerifySm2Test from './HuksSignVerifySm2Test.test';
import HuksWrappedTest from './HuksWrappedTest.test';

export default function huksNapiSuite() {
  HuksAgreeDhTest();
  HuksAgreeEcdhTest();
  HuksAgreeX25519Test();
  HuksAttestTest();
  HuksCipherAesTest();
  HuksCipherRsaTest();
  HuksCipherSm4Test();
  HuksDeriveHkdfTest();
  HuksDerivePbkdfTest();
  HuksHmacTest();
  HuksMiscTest();
  HuksNullptrTest();
  HuksSignVerifyDsaTest();
  HuksSignVerifyEccTest();
  HuksSignVerifyEd25519Test();
  HuksSignVerifyRsaTest();
  HuksSignVerifySm2Test();
  HuksWrappedTest();
}
