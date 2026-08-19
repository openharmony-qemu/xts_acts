import { camera } from '@kit.CameraKit';

import CameraCapturePhotosWithMultiDiffConfig from './CameraCapturePhotosWithMultiDiffConfig.test'

let testContext = await getContext();
const cameraManager = camera.getCameraManager(testContext);
const cameraDeviceArray = cameraManager.getSupportedCameras();
 
export default function cameraKit() {
	if (cameraDeviceArray.length != 0) {
		CameraCapturePhotosWithMultiDiffConfig();
	}
}