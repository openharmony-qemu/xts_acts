import abilityTest from "./Ability.test";
import arkTSUtilsLockTest from "./ArkTSUtilsLock.test";
import LockTest from "./LockTest.test";
import AsyncLockTest from "./AsyncLockTest.test";
export default function testsuite() {
  abilityTest();
  arkTSUtilsLockTest();
  LockTest();
  AsyncLockTest();
}