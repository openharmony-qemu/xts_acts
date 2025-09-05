import CameraSessionFlashSuppTest from './camera/CameraSessionFlashSupp.test';
import { CameraConcurrentTest } from './camera/CameraConcurrentInfosTest.test';
import CameraVideoCodecTypeTest from './camera/CameraVideoCodecTypeTestSupp.test';

export default function testsuite() {
  CameraSessionFlashSuppTest();
  CameraConcurrentTest();
  CameraVideoCodecTypeTest();
}