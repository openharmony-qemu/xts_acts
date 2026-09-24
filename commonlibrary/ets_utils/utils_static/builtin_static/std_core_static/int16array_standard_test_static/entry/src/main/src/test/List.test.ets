'use static';


import ability from './Ability.test';
import Int16ArrayFilterTest01 from './int16array/Int16ArrayFilterTest01.test';
import Int16ArrayFilterTest02 from './int16array/Int16ArrayFilterTest02.test';
import Int16ArrayOverviewTest01 from './int16array/Int16ArrayOverviewTest01.test';
import Int16ArrayOverviewTest02 from './int16array/Int16ArrayOverviewTest02.test';
import Int16ArrayOverviewTest03 from './int16array/Int16ArrayOverviewTest03.test';
import Int16ArrayOverviewTest04 from './int16array/Int16ArrayOverviewTest04.test';
import Int16ArrayPropertiesTest01 from './int16array/Int16ArrayPropertiesTest01.test';
import Int16ArrayPropertiesTest02 from './int16array/Int16ArrayPropertiesTest02.test';
import Int16ArrayReverseTest01 from './int16array/Int16ArrayReverseTest01.test';
import Int16ArrayReverseTest02 from './int16array/Int16ArrayReverseTest02.test';
import Int16ArrayToLocaleStringTest01 from './int16array/Int16ArrayToLocaleStringTest01.test';
import Int16ArrayToLocaleStringTest02 from './int16array/Int16ArrayToLocaleStringTest02.test';
import Int16ArrayToSortedTest01 from './int16array/Int16ArrayToSortedTest01.test';
import Int16ArrayToSortedTest02 from './int16array/Int16ArrayToSortedTest02.test';
import Int16ArrayToStringTest01 from './int16array/Int16ArrayToStringTest01.test';

export default function testsuite(): void {
  ability();
  Int16ArrayFilterTest01();
  Int16ArrayFilterTest02();
  Int16ArrayOverviewTest01();
  Int16ArrayOverviewTest02();
  Int16ArrayOverviewTest03();
  Int16ArrayOverviewTest04();
  Int16ArrayPropertiesTest01();
  Int16ArrayPropertiesTest02();
  Int16ArrayReverseTest01();
  Int16ArrayReverseTest02();
  Int16ArrayToLocaleStringTest01();
  Int16ArrayToLocaleStringTest02();
  Int16ArrayToSortedTest01();
  Int16ArrayToSortedTest02();
  Int16ArrayToStringTest01();
}
