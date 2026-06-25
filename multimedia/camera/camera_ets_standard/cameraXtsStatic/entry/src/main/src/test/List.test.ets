import cameraNoPermissionStaticTest from "./CameraNoPermissionStaticTest.test";
import CameraManagerTest from "./Manager/CameraManagerTest.test";
import CameraVideoSessionErrorTest from "./cameraVideoSession/CameraVideoSessionErrorTest.test";
import CameraVideoSessionTest from "./cameraVideoSession/CameraVideoSessionTest.test";
import PhotoOutputStaticTest from "./cameraPhotoSession/CameraPhotoSessionTest.test";
import PhotoOutputToStaticTest from "./PhotoOutput/PhotoOutput.test";
import CameraDeviceStaticTest from "./cameraDevice/CameraDeviceTest.test";
import CameraEnumStaticTest from "./CameraEnum.test";
import MetadataOutputStaticTest from "./MetadataOutput/MetadataOutput.test";

export default function testsuite() {
  cameraNoPermissionStaticTest();
  CameraManagerTest();
  CameraVideoSessionTest();
  CameraVideoSessionErrorTest();
  PhotoOutputStaticTest();
  PhotoOutputToStaticTest();
  CameraDeviceStaticTest();
  CameraEnumStaticTest();
  MetadataOutputStaticTest();
}