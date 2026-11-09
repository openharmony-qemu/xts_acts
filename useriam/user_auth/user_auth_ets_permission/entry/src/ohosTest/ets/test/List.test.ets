import UserAuthTest from './UserAuth.test';
import PinAuthPermissionTest from './PinAuthPermissionTest';
import PinAuthSystemTest from './PinAuthSystemTest';

export default function testsuite() {
  UserAuthTest();
  PinAuthPermissionTest();
  PinAuthSystemTest();
}
