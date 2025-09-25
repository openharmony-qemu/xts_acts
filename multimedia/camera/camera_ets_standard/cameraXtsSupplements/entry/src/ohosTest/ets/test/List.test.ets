import CameraSessionFlashSuppTest from './camera/CameraSessionFlashSupp.test';
import cameraSetFocusModeTest from './camera/CameraSetFocusModeTest.test';
import cameraSessionIsFocusModeSupported from './camera/CameraIsFocusModeSupportedTest.test';
import { CameraConcurrentTest } from './camera/CameraConcurrentInfosTest.test';
import CameraVideoCodecTypeTest from './camera/CameraVideoCodecTypeTestSupp.test';
import cameraSetFocusPointTest from './camera/CameraSetFocusPointTest.test';
import CameraSessionCameraRotationSuppTest from './camera/CameraSessionCameraRotationSuppTest.test';
import CameraVideoOutputSuppTest from './camera/CameraVideoOutputSuppTest.test';
import CameraSessionZoomSuppTest from './camera/CameraSessionZoomSuppTest.test';


export default function testsuite() {
  CameraSessionFlashSuppTest();
  cameraSetFocusModeTest();
  CameraConcurrentTest();
  CameraVideoCodecTypeTest();
  cameraSetFocusPointTest();
  cameraSessionIsFocusModeSupported();
  CameraSessionCameraRotationSuppTest();
  CameraVideoOutputSuppTest();
  CameraSessionZoomSuppTest();
}