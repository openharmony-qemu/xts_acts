import cameraNoPermissionStaticTest from "./CameraNoPermissionStaticTest.test";
import cameraPhotoSessionTest from "./cameraPhotoSession/CameraPhotoSessionTest.test";
import CameraVideoSessionErrorTest from "./cameraVideoSession/CameraVideoSessionErrorTest.test";
import CameraVideoSessionTest from "./cameraVideoSession/CameraVideoSessionTest.test";
import CameraManagerTest from "./Manager/CameraManagerTest.test";
import CameraOISTest from "./CameraOIS/CameraOIS.test";
import CameraOISQueryTest from "./CameraOISQuery/CameraOISQuery.test";
import ApertureTest from "./cameraPhotoSession/Aperture.test";
import ApertureQueryGetSupportedPhysicalAperturesTest
  from "./cameraPhotoSession/ApertureQueryGetSupportedPhysicalApertures.test";
import { photoSessionInfoChangeStaticTest } from "./cameraPhotoSession/PhotoSessionInfoChange.test";
import CameraStaticTest from "./Camera/Camera.test";
import CameraManagerSuppStaticTest from "./CameraManager/CameraManagerTest.test";
import ManualExposureStaticTest from "./ManualExposure/ManualExposure.test";
import PhotoOutputToStaticTest from "./PhotoOutput/PhotoOutput.test";
import PreviewOutputStaticTest from "./PreviewOutput/PreviewOutput.test";
import SecureSessionStaticTest from "./SecureSession/SecureSession.test";
import VideoOutputStaticTest from "./VideoOutput/VideoOutput.test";
import VideoSessionStaticTest from "./VideoSession/VideoSession.test";
import CameraManagerStaticTest from "./CameraManagerSuppStatic.test";
import { cameraPickerTest } from "./ExposureMeteringMode/CameraPicker.test";
import MetadataOutputTest from "./ExposureMeteringMode/MetadataOutput.test";
import ExposureMeteringModeStaticTest from "./ExposureMeteringMode/AutoExposureMeteringMode.test";

export default function testsuite(): void {
  cameraNoPermissionStaticTest();
  CameraVideoSessionErrorTest();
  CameraVideoSessionTest();
  cameraPhotoSessionTest();
  CameraManagerTest();
  CameraOISQueryTest();
  CameraOISTest();
  ApertureTest();
  ApertureQueryGetSupportedPhysicalAperturesTest();
  photoSessionInfoChangeStaticTest();
  CameraStaticTest();
  CameraManagerSuppStaticTest();
  ManualExposureStaticTest();
  PhotoOutputToStaticTest();
  PreviewOutputStaticTest();
  SecureSessionStaticTest();
  VideoOutputStaticTest();
  VideoSessionStaticTest();
  CameraManagerStaticTest();
  cameraPickerTest();
  MetadataOutputTest();
  ExposureMeteringModeStaticTest();
}