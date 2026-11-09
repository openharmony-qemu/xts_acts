import UserAuthTest from './UserAuth.test';
import PinAuthParamTest from './PinAuthParamTest';
import PinAuthReturnTest from './PinAuthReturnTest';
import PinAuthErrorCodeTest from './PinAuthErrorCodeTest';

export default function testsuite() {
  UserAuthTest();
  PinAuthParamTest();
  PinAuthReturnTest();
  PinAuthErrorCodeTest();
}
