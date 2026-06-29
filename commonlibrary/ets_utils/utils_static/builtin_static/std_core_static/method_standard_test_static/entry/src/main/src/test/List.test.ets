import MethodEqualsTest from "./method/MethodEqualsTest.test";
import MethodGetAccessModifierTest from "./method/MethodGetAccessModifierTest.test";
import MethodGetAttributesTest from "./method/MethodGetAttributesTest.test";
import MethodGetNameTest from "./method/MethodGetNameTest.test";
import MethodGetOwnerTypeTest from "./method/MethodGetOwnerTypeTest.test";
import MethodGetTypeTest from "./method/MethodGetTypeTest.test";
import MethodInvokeTest from "./method/MethodInvokeTest.test";
import MethodIsAbstractTest from "./method/MethodIsAbstractTest.test";
import MethodIsAsyncTest from "./method/MethodIsAsyncTest.test";
import MethodIsConstructorTest from "./method/MethodIsConstructorTest.test";
import MethodIsFinalTest from "./method/MethodIsFinalTest.test";
import MethodIsGetterTest from "./method/MethodIsGetterTest.test";
import MethodIsNativeTest from "./method/MethodIsNativeTest.test";
import MethodIsSetterTest from "./method/MethodIsSetterTest.test";
import MethodIsStaticTest from "./method/MethodIsStaticTest.test";
import MethodToStringTest from "./method/MethodToStringTest.test";

export default function testsuite(): void {
  MethodEqualsTest();
  MethodGetAccessModifierTest();
  MethodGetAttributesTest();
  MethodGetNameTest();
  MethodGetOwnerTypeTest();
  MethodGetTypeTest();
  MethodInvokeTest();
  MethodIsAbstractTest();
  MethodIsAsyncTest();
  MethodIsConstructorTest();
  MethodIsFinalTest();
  MethodIsGetterTest();
  MethodIsNativeTest();
  MethodIsSetterTest();
  MethodIsStaticTest();
  MethodToStringTest();
}