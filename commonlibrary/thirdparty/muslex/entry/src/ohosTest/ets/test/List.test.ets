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


import Fcntl64NdkTest from './Fcntl64Ndk.test';
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
  Fcntl64NdkTest();
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