'use static';
import UserAuthTest from "./UserAuth.test";
import PinAuthParamTest from "./PinAuthParamTest.test";
import PinAuthReturnTest from "./PinAuthReturnTest.test";
import PinAuthErrorCodeTest from "./PinAuthErrorCodeTest.test";

export default function testsuite() {
    UserAuthTest();
    PinAuthParamTest();
    PinAuthReturnTest();
    PinAuthErrorCodeTest();
}
