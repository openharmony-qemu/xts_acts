'use static';
import arktsStaExceptionsTest from "./xts/ArktsStaExceptionsTest.test";
import exceptionsConstructorTest from "./xts/ExceptionsConstructorTest.test";
import exceptionsExceptionTypesTest from "./xts/ExceptionsExceptionTypesTest.test";
import exceptionsNewScenariosTest from "./xts/ExceptionsNewScenariosTest.test";

export default function testsuite(): void {
  exceptionsConstructorTest();
  arktsStaExceptionsTest();
  exceptionsExceptionTypesTest();
  exceptionsNewScenariosTest();
}
