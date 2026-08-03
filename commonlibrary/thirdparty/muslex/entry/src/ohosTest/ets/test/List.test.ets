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
 
import QsortRNdkTest from './QsortRNdk.test';
import AcosfFiniteNdkTest from './AcosfFiniteNdk.test';
import AsPrintfChkNdkTest from './AsprintfChkNdk.test';
import Atan2FiniteNdkTest from './Atan2FiniteNdk.test';
import CmsgNxthdrNdkTest from './CmsgNxthdrNdk.test';
import ExplicitBzeroChkNdkTest from './ExplicitBzeroChkNdk.test';
import FdeltChkNdkTest from './FdeltChkNdk.test';
import OpenExtNdkTest from './OpenExtNdk.test';
import WcstofLNdkTest from './WcstofLNdk.test';
import WcstoldLNdkTest from './WcstoldLNdk.test';
import IsinffNdkTest from './IsinffNdk.test';
import FiniteNdkTest from './FiniteNdk.test';
import FinitefNdkTest from './FinitefNdk.test';
import FPrintfChkNdkTest from './FprintfChkNdk.test';
import GetauxvalNdkTest from './GetauxvalNdk.test';
import IsinfNdkTest from './IsinfNdk.test';
import IsnanfNdkTest from './IsnanfNdk.test';
import IsnanNdkTest from './IsnanNdk.test';
import Log10FiniteNdkTest from './Log10FiniteNdk.test';
import MbrlenNdkTest from './MbrlenNdk.test';
import PrintfChkNdkTest from './PrintfChkNdk.test';
import PthreadKeyCreateNdkTest from './PthreadKeyCreateNdk.test';
import RawmemchrNdkTest from './RawmemchrNdk.test';
import RealpathChkNdkTest from './RealpathChkNdk.test';
import RegisterAtforkNdkTest from './RegisterAtforkNdk.test';
import SchedCpufreeNdkTest from './SchedCpufreeNdk.test';
import StrdupNdkTest from './StrdupNdk.test';
import StrndupNdkTest from './StrndupNdk.test';
import StrtokRNdkTest from './StrtokRNdk.test';
import SyslogChkNdkTest from './SyslogChkNdk.test';
import VfPrintfChkNdkTest from './VfprintfChkNdk.test';
import DfxSetCrashLogConfigNdkTest from './DfxSetCrashLogConfigNdk.test';
import Log2fFiniteNdkTest from './Log2fFiniteNdk.test';
import Log2FiniteNdkTest from './Log2FiniteNdk.test';
import LogFiniteNdkTest from './LogFiniteNdk.test';
import LongjmpChkNdkTest from './LongjmpChkNdk.test';
import PowfFiniteNdkTest from './PowfFiniteNdk.test';
import PowFiniteNdkTest from './PowFiniteNdk.test';
import Fcntl64NativeTest from './Fcntl64Native.test';
import MuslVersionNdkTest from './MuslVersionNdk.test';
import GetResTraceIdNdkTest from './GetResTraceIdNdk.test';
import PthreadExtFuncPolicyNdkTest from './PthreadExtFuncPolicyNdk.test';
import GetaddrinfoCustomNdkTest from './GetaddrinfoCustomNdk.test';
import HilogBaseIsLoggableNdkTest from './HilogBaseIsLoggableNdk.test';
import HilogBasePrintNdkTest from './HilogBasePrintNdk.test';
import GwpAsanCollectNdkTest from './GwpAsanCollectNdk.test';
import GwpAsanRegisterFfrtNdkTest from './GwpAsanRegisterFfrtNdk.test';
import MallocCheckFromPtrNdkTest from './MallocCheckFromPtrNdk.test';
import MktimeNoenvNdkTest from './MktimeNoenvNdk.test';
import PthreadAttrExtDestroyNdkTest from './PthreadAttrExtDestroyNdk.test';
import PthreadAttrInitNdkTest from './PthreadAttrExtInitNdk.test';
import PthreadAttrGetaffinityNpNdkTest from './PthreadAttrGetaffinityNpNdk.test';
import PthreadAttrSetaffinityNpNdkTest from './PthreadAttrSetaffinityNpNdk.test';
import PthreadAtforkGwpasanNdkTest from './PthreadAtforkGwpasanNdk.test';
import RemoveCustomDnsNdkTest from './RemoveCustomDnsNdk.test';
import ResTraceFreeRegionNdkTest from './ResTraceFreeRegionNdk.test';
import ResTraceMoveNdkTest from './ResTraceMoveNdk.test';
import ResTraceNdkTest from './ResTraceNdk.test';
import ResTraceExtNdkTest from './ResTraceExtNdk.test';
import SetResTraceIdNdkTest from './SetResTraceIdNdk.test';
import SetPthreadExtFuncPolicyNdkTest from './SetPthreadExtFuncPolicyNdk.test';
import SetSigchainPreValidationNdkTest from './SetSigchainPreValidationNdk.test';
import SetCustomDnsNdkTest from './SetCustomDnsNdk.test';
import StrtollLNdkTest from './StrtollLNdk.test';
import StrtoullLNdkTest from './StrtoullLNdk.test';
import TimelocalNdkTest from './TimelocalNdk.test';
import Exp2fFiniteNdkTest from './Exp2fFiniteNdk.test';
import Exp2FiniteNdkTest from './Exp2FiniteNdk.test';
import ExpFiniteNdkTest from './ExpFiniteNdk.test';
import FedisableExceptNdkTest from './FedisableExceptNdk.test';
import FeenableExceptNdkTest from './FeenableExceptNdk.test';
import FegetExceptNdkTest from './FegetExceptNdk.test';

export default function testsuite() {
  QsortRNdkTest();
  AcosfFiniteNdkTest();
  AsPrintfChkNdkTest();
  Atan2FiniteNdkTest();
  CmsgNxthdrNdkTest();
  ExplicitBzeroChkNdkTest();
  Exp2FiniteNdkTest();
  FdeltChkNdkTest();
  OpenExtNdkTest();
  WcstofLNdkTest();
  WcstoldLNdkTest();
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
  Log10FiniteNdkTest();
  MbrlenNdkTest();
  PrintfChkNdkTest();
  PthreadKeyCreateNdkTest();
  RawmemchrNdkTest();
  RealpathChkNdkTest();
  RegisterAtforkNdkTest();
  SchedCpufreeNdkTest();
  StrdupNdkTest();
  StrndupNdkTest();
  StrtokRNdkTest();
  SyslogChkNdkTest();
  VfPrintfChkNdkTest();
  DfxSetCrashLogConfigNdkTest();
  Log2fFiniteNdkTest();
  Log2FiniteNdkTest();
  LogFiniteNdkTest();
  LongjmpChkNdkTest();
  PowfFiniteNdkTest();
  PowFiniteNdkTest();
  Fcntl64NativeTest();
  FedisableExceptNdkTest();
  FeenableExceptNdkTest();
  FegetExceptNdkTest();
  MuslVersionNdkTest();
  GetResTraceIdNdkTest();
  PthreadExtFuncPolicyNdkTest();
  GetaddrinfoCustomNdkTest();
  HilogBaseIsLoggableNdkTest();
  HilogBasePrintNdkTest();
  GwpAsanCollectNdkTest();
  GwpAsanRegisterFfrtNdkTest();
  MallocCheckFromPtrNdkTest();
  MktimeNoenvNdkTest();
  PthreadAttrExtDestroyNdkTest();
  PthreadAttrInitNdkTest();
  PthreadAttrGetaffinityNpNdkTest();
  PthreadAttrSetaffinityNpNdkTest();
  PthreadAtforkGwpasanNdkTest();
  RemoveCustomDnsNdkTest();
  ResTraceFreeRegionNdkTest();
  ResTraceMoveNdkTest();
  ResTraceNdkTest();
  ResTraceExtNdkTest();
  SetResTraceIdNdkTest();
  SetPthreadExtFuncPolicyNdkTest();
  SetSigchainPreValidationNdkTest();
  SetCustomDnsNdkTest();
  StrtollLNdkTest();
  StrtoullLNdkTest();
  TimelocalNdkTest();
}