'use static';

import baseEnumConstructorTest from "./enum/BaseEnumConstructorTest.test.ets";
import baseEnumGetNameTest from "./enum/BaseEnumGetNameTest.test.ets";
import baseEnumTest from "./enum/BaseEnumTest.test.ets";
import baseEnumToStringTest from "./enum/BaseEnumToStringTest.test.ets";
import baseEnumValueOfTest from "./enum/BaseEnumValueOfTest.test.ets";

export default function testsuite(): void {

  baseEnumConstructorTest();
  baseEnumGetNameTest();
  baseEnumTest();
  baseEnumToStringTest();
  baseEnumValueOfTest();

}