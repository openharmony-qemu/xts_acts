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
import AcosfFiniteNdkTest from './AcosfFiniteNdk.test';
import AsPrintfChkNdkTest from './AsprintfChkNdk.test';
import Atan2FiniteNdkTest from './Atan2FiniteNdk.test';
import CmsgNxthdrNdkTest from './CmsgNxthdrNdk.test';
import ExplicitBzeroChkNdkTest from './ExplicitBzeroChkNdk.test';
import FdeltChkNdkTest from './FdeltChkNdk.test';
import IsinffNdkTest from './IsinffNdk.test';
import FiniteNdkTest from './FiniteNdk.test';
import FinitefNdkTest from './FinitefNdk.test';
import FPrintfChkNdkTest from './FprintfChkNdk.test';
import GetauxvalNdkTest from './GetauxvalNdk.test';
import IsinfNdkTest from './IsinfNdk.test';
import IsnanfNdkTest from './IsnanfNdk.test';
import IsnanNdkTest from './IsnanNdk.test';

import DfxSetCrashLogConfigNdkTest from './DfxSetCrashLogConfigNdk.test';


import Fcntl64NativeTest from './Fcntl64Native.test';
import GetResTraceIdNdkTest from './GetResTraceIdNdk.test';
import GetaddrinfoCustomNdkTest from './GetaddrinfoCustomNdk.test';
import HilogBaseIsLoggableNdkTest from './HilogBaseIsLoggableNdk.test';
import HilogBasePrintNdkTest from './HilogBasePrintNdk.test';
import GwpAsanCollectNdkTest from './GwpAsanCollectNdk.test';
import GwpAsanRegisterFfrtNdkTest from './GwpAsanRegisterFfrtNdk.test';
import Exp2fFiniteNdkTest from './Exp2fFiniteNdk.test';
import Exp2FiniteNdkTest from './Exp2FiniteNdk.test';
import ExpFiniteNdkTest from './ExpFiniteNdk.test';
import FedisableExceptNdkTest from './FedisableExceptNdk.test';
import FeenableExceptNdkTest from './FeenableExceptNdk.test';
import FegetExceptNdkTest from './FegetExceptNdk.test';

export default function testsuite() {
  AcosfFiniteNdkTest();
  AsPrintfChkNdkTest();
  Atan2FiniteNdkTest();
  CmsgNxthdrNdkTest();
  ExplicitBzeroChkNdkTest();
  Exp2FiniteNdkTest();
  FdeltChkNdkTest();
  IsinffNdkTest();
  ExpFiniteNdkTest();
  FiniteNdkTest();
  FinitefNdkTest();
  FPrintfChkNdkTest();
  GetauxvalNdkTest();
  IsinfNdkTest();
  Exp2fFiniteNdkTest();
  IsnanfNdkTest();
  IsnanNdkTest();
  DfxSetCrashLogConfigNdkTest();
  Fcntl64NativeTest();
  FedisableExceptNdkTest();
  FeenableExceptNdkTest();
  FegetExceptNdkTest();
  GetResTraceIdNdkTest();
  GetaddrinfoCustomNdkTest();
  HilogBaseIsLoggableNdkTest();
  HilogBasePrintNdkTest();
  GwpAsanCollectNdkTest();
  GwpAsanRegisterFfrtNdkTest();
}