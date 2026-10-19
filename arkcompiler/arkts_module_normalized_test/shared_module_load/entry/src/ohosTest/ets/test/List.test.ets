import sharedModuleSingletonTest from './SharedModuleSingleton.test';
import sharedModuleStateTest from './SharedModuleState.test';
import sharedModuleNonSharedRefTest from './SharedModuleNonSharedRef.test';
import sharedModuleLazyRefTest from './SharedModuleLazyRef.test';

export default function testsuite() {
  sharedModuleSingletonTest();
  sharedModuleStateTest();
  sharedModuleNonSharedRefTest();
  sharedModuleLazyRefTest();
}
