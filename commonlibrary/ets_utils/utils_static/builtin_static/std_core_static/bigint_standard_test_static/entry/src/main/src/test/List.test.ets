'use static';
import runBigIntHypiumTests from './bigint/BigIntHypiumSuite.test';
import runBigInt01HypiumTests from './bigint01/BigInt01HypiumSuite.test';
import runBigInt02HypiumTests from './bigint02/BigInt02HypiumSuite.test';

export default function testsuite(): void {
  runBigIntHypiumTests();
  runBigInt01HypiumTests();
  runBigInt02HypiumTests();
}
