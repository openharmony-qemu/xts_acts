import builtinsBlockTest from './BuiltinsBlockTest.test.ets'
import builtinsBreakTest from './BuiltinsBreakTest.test.ets'
import builtinsContinueTest from './BuiltinsContinueTest.test.ets'
import builtinsForOfTest from './BuiltinsForOfTest.test.ets'
import builtinsForTest from './BuiltinsForTest.test.ets'
import builtinsIfTest from './BuiltinsIfTest.test.ets'
import builtinsReturnTest from './BuiltinsReturnTest.test.ets'
import builtinsSwitchTest from './BuiltinsSwitchTest.test.ets'
import builtinsThrowTest from './BuiltinsThrowTest.test.ets'
import builtinsTryTest from './BuiltinsTryTest.test.ets'
import builtinsWhileTest from './BuiltinsWhileTest.test.ets'
export default function testsuite() {
  builtinsBlockTest();
  builtinsBreakTest();
  builtinsContinueTest();
  builtinsForOfTest();
  builtinsForTest();
  builtinsIfTest();
  builtinsReturnTest();
  builtinsSwitchTest();
  builtinsThrowTest();
  builtinsTryTest();
  builtinsWhileTest();
}