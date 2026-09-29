import abilityTest from './Ability.test';
import startAbilityForResultPermissionTest from './StartAbilityForResult.test';
import connectNativePermissionCoverageDirect from './ConnectNativePermissionCoverageDirect.test';

export default function testsuite() {
  abilityTest();
  startAbilityForResultPermissionTest();
  connectNativePermissionCoverageDirect();
}