'use static';
import AsyncFunctionTest from "./AsyncFunction/AsyncFunction.test";
import AwaitExpressionTest from "./AwaitExpression/AwaitExpression.test";
import PromiseTest from "./Promise/Promise.test";
import AsyncLockTest from "./AsyncLock/AsyncLock.test";
import AtomicsTest from "./Atomics/Atomics.test";
import SchedulingTest from "./Scheduling/Scheduling.test";
import ClassInterfaceConcurrencyTest from './ClassInterfaceConcurrency/ClassInterfaceConcurrency.test'
import ExpressionStatementConcurrencyTest from './ExpressionStatementConcurrency/ExpressionStatementConcurrency.test'
import GenericsConcurrencyTest from './GenericsConcurrency/GenericsConcurrency.test'
import ModuleConcurrencyTest from './ModuleConcurrency/ModuleConcurrency.test'

export default function testsuite():void {
  AsyncFunctionTest();
  AsyncLockTest();
  AtomicsTest();
  AwaitExpressionTest();
  ClassInterfaceConcurrencyTest();
  ExpressionStatementConcurrencyTest();
  GenericsConcurrencyTest();
  ModuleConcurrencyTest();
  PromiseTest();
  SchedulingTest();
}