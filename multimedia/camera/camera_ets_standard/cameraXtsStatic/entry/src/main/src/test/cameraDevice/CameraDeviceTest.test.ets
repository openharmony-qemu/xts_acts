import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level, Hypium } from '../../../../hypium/index';
import { camera } from '@kit.CameraKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { getPermission } from '../Common.test';
import { Context } from '@kit.ArkUI';

const TAG = "CameraDeviceStaticTest";
let mCameraManager: camera.CameraManager | undefined;
let mCameraDeviceArray: Array<camera.CameraDevice> | undefined;

function getCameraManager(): camera.CameraManager | undefined {
  let testContext: Context = Hypium.get("Context") as Context;
  try {
    mCameraManager = camera.getCameraManager(testContext);
  } catch (error) {
    let err = error as BusinessError;
    console.error(`The getCameraManager call failed. error code: ${err.code}`);
  }
  return mCameraManager;
}

function getSupportedCameraDeviceArray() {
  console.info(TAG, 'getSupportedCameraDeviceArray.');
  mCameraDeviceArray = mCameraManager!.getSupportedCameras();
  if (mCameraDeviceArray == undefined || mCameraDeviceArray!.length == 0) {
    return false;
  }
  console.info(TAG, 'getSupportedCameraDeviceArray length: ' + mCameraDeviceArray!.length);
  return true;
}


export default function CameraDeviceStaticTest() {
  describe('CameraDeviceStaticTest', () => {

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      getCameraManager();
      getSupportedCameraDeviceArray();
    });

    beforeEach(() => {
      console.info('afterEach case');
    });

    afterEach(async () => {
      console.info('afterEach case');

    });

    afterAll(async () => {
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_MEDIA_CAMERA_CAMERA_DEVICE_STATIC_0100
     * @tc.number SUB_MEDIA_CAMERA_CAMERA_DEVICE_STATIC_0100
     * @tc.desc   automotiveCameraPosition normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_CAMERA_CAMERA_DEVICE_STATIC_0100',Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'test010_automotiveCameraPositionStatic';
      try {
        let position = camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
        let type = camera.CameraType.CAMERA_TYPE_DEFAULT;
        for (let index = 0; index < mCameraDeviceArray!.length; index++) {
          const camera = mCameraDeviceArray![index];
          if (camera.cameraPosition == position && camera.cameraType == type) {
            let device = mCameraManager?.getCameraDevice(position, type)
            console.info(TAG,testName,'getCameraDevice: ', device);
            let automotiveCameraPosition = device!.automotiveCameraPosition;
            console.info(TAG,testName,'automotiveCameraPosition: ', automotiveCameraPosition);
            expect(automotiveCameraPosition).assertLargerOrEqual(0);
          }
        }
      } catch (error) {
        console.error(TAG,testName, error, error.code)
        expect().assertFail();
      }
    });
  })
}

