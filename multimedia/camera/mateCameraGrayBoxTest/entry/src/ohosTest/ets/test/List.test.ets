import CameraCapturePhotosWithMultiDiffConfig from './CameraCapturePhotosWithMultiDiffConfig.test'
import CameraVideoRecordWithMultiDiffConfig from './CameraVideoRecordWithMultiDiffConfig.test'
import CameraCapturePhotosWithPreconfig from './CameraCapturePhotosWithPreconfig.test'
import CameraCapturePhotosWithProfileNoSurfaceId from './CameraCapturePhotosWithProfileNoSurfaceId.test'
import CameraCapturePhotosWithProfileSurfaceId from './CameraCapturePhotosWithProfileSurfaceId.test'
import CameraDualChannelPreviewWithMultiDiffConfig from './CameraDualChannelPreviewWithMultiDiffConfig.test'
import CameraCaptureMovingPhotosWithMultiDiffConfig from './CameraCaptureMovingPhotosWithMultiDiffConfig.test'
import CameraInWorkerCaptureTest from './CameraInWorkerCaptureTest.test'
import CameraMacroStatusChangeTest from './CameraMacroStatusChange.test'
import CameraStatusInfoEqualCameraDevice from './CameraStatusInfoEqualCameraDevice.test'

export default function cameraKit() {
  CameraCapturePhotosWithMultiDiffConfig();
  CameraVideoRecordWithMultiDiffConfig();
  CameraCapturePhotosWithPreconfig();
  CameraCapturePhotosWithProfileNoSurfaceId();
  CameraCapturePhotosWithProfileSurfaceId();
  CameraDualChannelPreviewWithMultiDiffConfig();
  CameraCaptureMovingPhotosWithMultiDiffConfig();
  CameraInWorkerCaptureTest();
  CameraMacroStatusChangeTest();
  CameraStatusInfoEqualCameraDevice();
}