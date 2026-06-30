import abilityTest from "./Ability.test";
import FieldEqualsTest from "./feild/FieldEqualsTest.test";
import FieldGetAccessModifierTest from "./feild/FieldGetAccessModifierTest.test";
import FieldGetAttributesTest from "./feild/FieldGetAttributesTest.test";
import FieldGetNameTest from "./feild/FieldGetNameTest.test";
import FieldGetOwnerTypeTest from "./feild/FieldGetOwnerTypeTest.test";
import FieldGetStaticValueTest from "./feild/FieldGetStaticValueTest.test";
import FieldGetTypeTest from "./feild/FieldGetTypeTest.test";
import FieldIsReadonlyTest from "./feild/FieldIsReadonlyTest.test";
import FieldIsStaticTest from "./feild/FieldIsStaticTest.test";
import FieldSetStaticValueTest from "./feild/FieldSetStaticValueTest.test";
import FieldToStringTest from "./feild/FieldToStringTest.test";
export default function testsuite():void {
  abilityTest();
  FieldEqualsTest();
  FieldGetAccessModifierTest();
  FieldGetAttributesTest();
  FieldGetNameTest();
  FieldGetOwnerTypeTest();
  FieldGetStaticValueTest();
  FieldGetTypeTest();
  FieldIsReadonlyTest();
  FieldIsStaticTest();
  FieldSetStaticValueTest();
  FieldToStringTest();
}