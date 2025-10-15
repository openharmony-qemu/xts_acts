import ActsAANoPermissionTestStatic from './AANoPermissionStatic.test';
import ActsDANoPermissionTestStatic from './DANoPermissionStatic.test';
import ActsOANoPermissionTestStatic from './OANoPermissionStatic.test';

export default function testsuite() {
  ActsAANoPermissionTestStatic();
  ActsDANoPermissionTestStatic();
  ActsOANoPermissionTestStatic();
}