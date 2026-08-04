import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';

import CameraCapturePhotosWithMultiDiffConfig from './CameraCapturePhotosWithMultiDiffConfig.test'
import CameraVideoRecordWithMultiDiffConfig from './CameraVideoRecordWithMultiDiffConfig.test'
import CameraCaptureXDRawPhotosWithMultiDiffConfig from './CameraCaptureXDRawPhotosWithMultiDiffConfig.test'

let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
const cameraManager = camera.getCameraManager(testContext);
const cameraDeviceArray = cameraManager.getSupportedCameras();

export default function cameraKit() {
  if (cameraDeviceArray.length != 0) {
    CameraCapturePhotosWithMultiDiffConfig();
    CameraVideoRecordWithMultiDiffConfig();
    CameraCaptureXDRawPhotosWithMultiDiffConfig();
  }
}