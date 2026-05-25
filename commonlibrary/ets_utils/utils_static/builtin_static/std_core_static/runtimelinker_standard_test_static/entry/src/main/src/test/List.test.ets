
import bootRuntimeLinkerTest from "./runtimelinker/BootRuntimeLinkerTest.test";
import runtimeLinkerFindAndLoadClassTest from "./runtimelinker/RuntimeLinkerFindAndLoadClassTest.test";
import getBootRuntimeLinkerTest from "./runtimelinker/GetBootRuntimeLinkerTest.test";
import runtimeLinkerInstanceTest from "./runtimelinker/RuntimeLinkerInstanceTest.test";

export default function testsuite(): void {

  bootRuntimeLinkerTest();
  runtimeLinkerFindAndLoadClassTest();
  getBootRuntimeLinkerTest();
  runtimeLinkerInstanceTest();

}
