'use static';
import runtimeLinkerFindAndLoadClassTest from "./runtimelinker/RuntimeLinkerFindAndLoadClassTest.test";
import getBootRuntimeLinkerTest from "./runtimelinker/GetBootRuntimeLinkerTest.test";
import runtimeLinkerInstanceTest from "./runtimelinker/RuntimeLinkerInstanceTest.test";

export default function testsuite(): void {

  runtimeLinkerFindAndLoadClassTest();
  getBootRuntimeLinkerTest();
  runtimeLinkerInstanceTest();

}
