import abilityTest from "./Ability.test";
import cameraNoPermissionStaticTest from "./CameraNoPermissionStaticTest.test";
import CameraManagerTest from "./Manager/CameraManagerTest.test";
export default function testsuite() {
  abilityTest();
  cameraNoPermissionStaticTest();
  CameraManagerTest();
}