import cameraNoPermissionStaticTest from "./CameraNoPermissionStaticTest.test";
import CameraManagerTest from "./Manager/CameraManagerTest.test";
import CameraVideoSessionErrorTest from "./cameraVideoSession/CameraVideoSessionErrorTest.test";
import CameraVideoSessionTest from "./cameraVideoSession/CameraVideoSessionTest.test";
export default function testsuite() {
  cameraNoPermissionStaticTest();
  CameraManagerTest();
  CameraVideoSessionTest();
  CameraVideoSessionErrorTest();
}