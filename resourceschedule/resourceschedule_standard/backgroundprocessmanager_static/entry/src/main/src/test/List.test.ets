import ActsBackgroundProcessManagerNapStaticTest from "./ActsBackgroundProcessManagerNapStaticTest.test";
import ActsBackgroundProcessManagerStaticTest from "./ActsBackgroundProcessManagerStaticTest.test";
import ActsSystemloadStaticTest from "./ActsSystemloadStaticTest.test";
export default function testsuite() {
  ActsBackgroundProcessManagerNapStaticTest();
  ActsBackgroundProcessManagerStaticTest();
  ActsSystemloadStaticTest();
}