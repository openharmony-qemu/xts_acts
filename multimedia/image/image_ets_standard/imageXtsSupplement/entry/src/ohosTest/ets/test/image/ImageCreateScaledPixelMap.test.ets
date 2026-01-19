
import { image } from '@kit.ImageKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { JSON } from '@kit.ArkTS';
const TAG = 'Xts.imageCreateScaledPixelMap'

async function createPixelMapTest(context : Context):Promise<image.PixelMap> {
  const param: image.InitializationOptions = {
    alphaType: image.AlphaType.UNKNOWN,
    editable: false,
    srcPixelFormat: image.PixelMapFormat.BGRA_8888,
    pixelFormat: image.PixelMapFormat.RGBA_8888,
    scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
    size: { height: 50, width: 50 }
  };
  const allocatorType = image.AllocatorType.AUTO;

  let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
    console.info(TAG,'Succeeded in creating pixelMap object.',JSON.stringify(pixelMap));
    return pixelMap;
}
 function createPixelMapSUPP(context : Context):image.PixelMap {
  const param: image.InitializationOptions = {
    alphaType: image.AlphaType.UNKNOWN,
    editable: false,
    srcPixelFormat: image.PixelMapFormat.BGRA_8888,
    pixelFormat: image.PixelMapFormat.RGBA_8888,
    scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
    size: { height: 50, width: 50 }
  };
  const allocatorType = image.AllocatorType.AUTO;

  let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
  console.info(TAG,'Succeeded in creating pixelMap object.',JSON.stringify(pixelMap));
  return pixelMap;
}

export default function imageCreateCroppedAndScaledPixelMap() {
  describe('imageCreateCroppedAndScaledPixelMap', () => {
    let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    beforeAll(async () => {

      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_001
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_001
     * @tc.desc      createCroppedAndScaledPixelMap region cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      const scaleX: number = 2.0;
      const scaleY: number = 2.0;
      try {
     await pixelMapObj.createCroppedAndScaledPixelMap(null, scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect(error.code).assertEqual('7600204');
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_002
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_002
     * @tc.desc      createCroppedAndScaledPixelMap region cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      const scaleX: number = 2.0;
      const scaleY: number = 2.0;
      try {
        await pixelMapObj.createCroppedAndScaledPixelMap(undefined, scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect(error.code).assertEqual('7600204');
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_003
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_003
     * @tc.desc      createCroppedAndScaledPixelMap X cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleY: number = 2.0;
      try {
        await pixelMapObj.createCroppedAndScaledPixelMap(region, null, scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect(error.code).assertEqual('7600201');
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_004
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_004
     * @tc.desc      createCroppedAndScaledPixelMap X cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_004";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleY: number = 2.0;
      try {
        await pixelMapObj.createCroppedAndScaledPixelMap(region, null, scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect(error.code).assertEqual('7600201');
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_005
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_005
     * @tc.desc      createCroppedAndScaledPixelMap Y cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_005', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_005";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleX: number = 2.0;
      try {
        await pixelMapObj.createCroppedAndScaledPixelMap(region, scaleX, null, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect(error.code).assertEqual('7600201');
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_006
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_006
     * @tc.desc      createCroppedAndScaledPixelMap Y cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_006', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_006";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleX: number = 2.0;
      try {
        await pixelMapObj.createCroppedAndScaledPixelMap(region, scaleX, null, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect(error.code).assertEqual('7600201');
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_001
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_001
     * @tc.desc      createCroppedAndScaledPixelMapSync region cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_001";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      const scaleX: number = 2.0;
      const scaleY: number = 2.0;
      try {
        pixelMapObj.createCroppedAndScaledPixelMapSync(null, scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect(error.code).assertEqual('7600204');
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_002
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_002
     * @tc.desc      createCroppedAndScaledPixelMapSync region cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_002";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      const scaleX: number = 2.0;
      const scaleY: number = 2.0;
      try {
        pixelMapObj.createCroppedAndScaledPixelMapSync(undefined, scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect(error.code).assertEqual('7600204');
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_003
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_003
     * @tc.desc      createCroppedAndScaledPixelMapSync X cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleY: number = 2.0;
      try {
        pixelMapObj.createCroppedAndScaledPixelMapSync(region, null, scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect(error.code).assertEqual('7600201');
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_004
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_004
     * @tc.desc      createCroppedAndScaledPixelMapSync X cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_004";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleY: number = 2.0;
      try {
        pixelMapObj.createCroppedAndScaledPixelMapSync(region, null, scaleY, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect(error.code).assertEqual('7600201');
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_005
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_005
     * @tc.desc      createCroppedAndScaledPixelMapSync Y cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_005', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_005";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = createPixelMapSUPP(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleX: number = 2.0;
      try {
        pixelMapObj.createCroppedAndScaledPixelMapSync(region, scaleX, null, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect(error.code).assertEqual('7600201');
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_006
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_006
     * @tc.desc      createCroppedAndScaledPixelMapSync Y cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_006', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_006";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj =  createPixelMapSUPP(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleX: number = 2.0;
      try {
        pixelMapObj.createCroppedAndScaledPixelMapSync(region, scaleX, null, image.AntiAliasingLevel.HIGH);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName,error,error.code)
        expect(error.code).assertEqual('7600201');
      }
      done();
    });
  });
};

