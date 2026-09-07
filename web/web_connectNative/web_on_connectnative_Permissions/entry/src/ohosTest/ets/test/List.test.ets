import abilityTest from './Ability.test';
import startAbilityForResultPermissionTest from './StartAbilityForResult.test';
import connectNativePermission201 from './ConnectNativePermission201.test';

export default function testsuite() {
  abilityTest();
  startAbilityForResultPermissionTest();
  connectNativePermission201();
}