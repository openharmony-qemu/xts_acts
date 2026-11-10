'use static';

import ability from './Ability.test';
import Int16ArrayFindLastTest from './int16array/Int16ArrayFindLastTest.test';
import Int16ArrayIncludesTest from './int16array/Int16ArrayIncludesTest.test';
import Int16ArrayIteratorTest from './int16array/Int16ArrayIteratorTest.test';
import Int16ArrayReduceRightTest from './int16array/Int16ArrayReduceRightTest.test';
import Int16ArrayReduceTest from './int16array/Int16ArrayReduceTest.test';
import Int16ArraySetTest from './int16array/Int16ArraySetTest.test';
import Int16ArrayToReversedTest from './int16array/Int16ArrayToReversedTest.test';

export default function testsuite(): void {
  ability();
  Int16ArrayFindLastTest();
  Int16ArrayIncludesTest();
  Int16ArrayIteratorTest();
  Int16ArrayReduceRightTest();
  Int16ArrayReduceTest();
  Int16ArraySetTest();
  Int16ArrayToReversedTest();
}
