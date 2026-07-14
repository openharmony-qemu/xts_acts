'use static';
import abilityTest from './Ability.test';
import ErrorsInvokeTest from './errors/ErrorsInvokeTest.test';
import ErrorsAggregateErrorInvokeTest from './errors/ErrorsAggregateErrorInvokeTest.test';
import ErrorsAggregateErrorConstructorTest from './errors/ErrorsAggregateErrorConstructorTest.test';
import ErrorsAggregateErrorPropertyTest from './errors/ErrorsAggregateErrorPropertyTest.test';
import ErrorsConstructorTest from './errors/ErrorsConstructorTest.test';
import ErrorsOverallTest from './errors/ErrorsOverallTest.test';
export default function testsuite():void {
  abilityTest();
  ErrorsInvokeTest();
  ErrorsAggregateErrorInvokeTest();
  ErrorsAggregateErrorConstructorTest();
  ErrorsAggregateErrorPropertyTest();
  ErrorsConstructorTest();
  ErrorsOverallTest();
}
