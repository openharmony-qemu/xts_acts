'use static';
import UserAuthTest from "./UserAuth.test";
import PinAuthPermissionTest from "./PinAuthPermissionTest.test";

export default function testsuite() {
    UserAuthTest();
    PinAuthPermissionTest();
}
