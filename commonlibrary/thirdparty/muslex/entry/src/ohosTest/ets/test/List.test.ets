import AcosfFiniteNdkTest from './AcosfFiniteNdk.test';
import AsPrintfChkNdkTest from './AsprintfChkNdk.test';
import Atan2FiniteNdkTest from './Atan2FiniteNdk.test';
import CmsgNxthdrNdkTest from './CmsgNxthdrNdk.test';
import DfxSetCrashLogConfigNdkTest from './DfxSetCrashLogConfigNdk.test';
import Exp2fFiniteNdkTest from './Exp2fFiniteNdk.test';
import Exp2FiniteNdkTest from './Exp2FiniteNdk.test';
import ExpFiniteNdkTest from './ExpFiniteNdk.test';
import ExplicitBzeroChkNdkTest from './ExplicitBzeroChkNdk.test';

export default function testsuite() {
  AcosfFiniteNdkTest();
  AsPrintfChkNdkTest();
  Atan2FiniteNdkTest();
  CmsgNxthdrNdkTest();
  DfxSetCrashLogConfigNdkTest();
  Exp2fFiniteNdkTest();
  Exp2FiniteNdkTest();
  ExpFiniteNdkTest();
  ExplicitBzeroChkNdkTest();
}