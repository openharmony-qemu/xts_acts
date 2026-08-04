'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect,Hypium, it, Level,Size, TestType} from '../../../../../../hypium/index';


const TAG = 'xtsStatic_cloneStatic';
let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
let filesDir: string | undefined | null;
let filePath: string = '';
let fdNumber: int;

const getFd = (fileName: string): int => {
  filePath =  testContext.filesDir + "/" + fileName;
  console.info(TAG,"image filePath:" + filePath);
  const file = fs.openSync(filePath!);
  fdNumber = file.fd as int;
  return fdNumber;
};

async function createPixelMapTest(testContext : common.UIAbilityContext):Promise<image.PixelMap> {
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


function createPixelMapSUPP(testContext : common.UIAbilityContext ):image.PixelMap {
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

async function sourceRelease(imageSourceApi: image.ImageSource |undefined): Promise<void> {
  await imageSourceApi!.release();
}

export default function metadataCloneStaticSuppTest(): void {
  describe('metadataCloneStaticSuppTest', () => {
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
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0100
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0100
     * @tc.desc      clone isEditable
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0100', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0100";
      console.info(TAG, `start：${testName}`);
      let PixelMap = await createPixelMapTest(testContext);
      try {
        let newPixelMap = await PixelMap.clone();
        console.info(TAG,testName,'Succeeded clone pixelmap.');
        expect(newPixelMap.isEditable).assertEqual(PixelMap.isEditable);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0200
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0200
     * @tc.desc      clone isStrideAlignment
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0200', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0200";
      console.info(TAG, `start：${testName}`);
      let PixelMap = await createPixelMapTest(testContext);
      try {
        let newPixelMap = await PixelMap.clone();
        console.info(TAG,testName,'Succeeded clone pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(PixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0300
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0300
     * @tc.desc      clone isStrideAlignment editable: true,
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0300', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0300";
      console.info(TAG, `start：${testName}`);
      try {
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: true,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
        const allocatorType = image.AllocatorType.AUTO;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.clone();
        console.info(TAG, testName, 'Succeeded clone pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(pixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0400
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0400
     * @tc.desc      clone ,paramater only size
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0400', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0400";
      console.info(TAG, `start：${testName}`);
      try {
        const param: image.InitializationOptions = {
          size: { height: 50, width: 50 }
        };
        const allocatorType = image.AllocatorType.AUTO;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.clone();
        console.info(TAG, testName, 'Succeeded clone pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(pixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0500
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0500
     * @tc.desc      clone ,paramater only size, allocatorType = image.AllocatorType.DMA
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0500', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0500";
      console.info(TAG, `start：${testName}`);
      try {
        const param: image.InitializationOptions = {
          size: { height: 50, width: 50 }
        };
        const allocatorType = image.AllocatorType.DMA;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.clone();
        console.info(TAG, testName, 'Succeeded clone pixelmap.');
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(error.code).assertEqual(7600201);
      }
      done();
    });
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0600
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0600
     * @tc.desc      clone ,paramater only size, allocatorType = image.AllocatorType.SHARE_MEMORY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0600', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0600";
      console.info(TAG, `start：${testName}`);
      try {
        const param: image.InitializationOptions = {
          size: { height: 50, width: 50 }
        };
        const allocatorType = image.AllocatorType.SHARE_MEMORY;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.clone();
        console.info(TAG, testName, 'Succeeded clone pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(pixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0700
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0700
     * @tc.desc      clone ,paramater only size, PixelMapFormat.UNKNOWN
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0700', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0700";
      console.info(TAG, `start：${testName}`);
      try {
        const param: image.InitializationOptions = {
          alphaType: image.AlphaType.UNKNOWN,
          editable: true,
          srcPixelFormat: image.PixelMapFormat.UNKNOWN,
          pixelFormat: image.PixelMapFormat.UNKNOWN,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 50, width: 50 }
        };
        const allocatorType = image.AllocatorType.SHARE_MEMORY;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.clone();
        console.info(TAG, testName, 'Succeeded clone pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(pixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0800
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0800
     * @tc.desc      clone ,paramater only size, PixelMapFormat.ARGB_8888
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0800', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0800";
      console.info(TAG, `start：${testName}`);
      try {
        const param: image.InitializationOptions = {
          alphaType: image.AlphaType.UNKNOWN,
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 50, width: 50 }
        };
        const allocatorType = image.AllocatorType.SHARE_MEMORY;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.clone();
        console.info(TAG, testName, 'Succeeded clone pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(pixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0900
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0900
     * @tc.desc      clone ,paramater only size, PixelMapFormat.RGB_565
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0900', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0900";
      console.info(TAG, `start：${testName}`);
      try {
        const param: image.InitializationOptions = {
          alphaType: image.AlphaType.UNKNOWN,
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGB_565,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 50, width: 50 }
        };
        const allocatorType = image.AllocatorType.SHARE_MEMORY;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.clone();
        console.info(TAG, testName, 'Succeeded clone pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(pixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_1000
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_1000
     * @tc.desc      clone ,paramater only size, PixelMapFormat.ALPHA_8
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_1000', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_1000";
      console.info(TAG, `start：${testName}`);
      try {
        const param: image.InitializationOptions = {
          alphaType: image.AlphaType.UNKNOWN,
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ALPHA_8,
          pixelFormat: image.PixelMapFormat.ALPHA_8,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 50, width: 50 }
        };
        const allocatorType = image.AllocatorType.SHARE_MEMORY;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.clone();
        console.info(TAG, testName, 'Succeeded clone pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(pixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_1100
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_1100
     * @tc.desc      clone ,paramater only size, PixelMapFormat.BGRA_8888
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_1100', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_1100";
      console.info(TAG, `start：${testName}`);
      try {
        const param: image.InitializationOptions = {
          alphaType: image.AlphaType.UNKNOWN,
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 50, width: 50 }
        };
        const allocatorType = image.AllocatorType.SHARE_MEMORY;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.clone();
        console.info(TAG, testName, 'Succeeded clone pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(pixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_1200
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_1200
     * @tc.desc      clone ,paramater only size, PixelMapFormat.RGBA_F16
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_1200', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_1200";
      console.info(TAG, `start：${testName}`);
      try {
        const param: image.InitializationOptions = {
          alphaType: image.AlphaType.UNKNOWN,
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_F16,
          pixelFormat: image.PixelMapFormat.RGBA_F16,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 50, width: 50 }
        };
        const allocatorType = image.AllocatorType.SHARE_MEMORY;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.clone();
        console.info(TAG, testName, 'Succeeded clone pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(pixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });


    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0100
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0100
     * @tc.desc      cloneSync isEditable
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0100', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0100";
      console.info(TAG, `start：${testName}`);
      let PixelMap = createPixelMapSUPP(testContext);
      try {
        let newPixelMap = PixelMap.cloneSync();
        console.info(TAG, testName,'Succeeded clone pixelmap.');
        expect(newPixelMap.isEditable).assertEqual(PixelMap.isEditable);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0200
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0200
     * @tc.desc      cloneSync isStrideAlignment
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0200', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0200";
      console.info(TAG, `start：${testName}`);
      let PixelMap = createPixelMapSUPP(testContext);
      try {
        let newPixelMap = PixelMap.cloneSync();
        console.info(TAG, testName,'Succeeded clone pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(PixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0300
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0300
     * @tc.desc      cloneSync  editable: true,
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0300', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0300";
      console.info(TAG, `start：${testName}`);
      try {
        const param: image.InitializationOptions = {
          alphaType: image.AlphaType.UNKNOWN,
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 50, width: 50 }
        };
        const allocatorType = image.AllocatorType.AUTO;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.cloneSync();
        console.info(TAG, testName, 'Succeeded cloneSync pixelmap.');
        expect(newPixelMap.isEditable).assertEqual(pixelMap.isEditable);
        expect(newPixelMap.isStrideAlignment).assertEqual(pixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0400
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0400
     * @tc.desc      clone ,paramater only size
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0400', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0400";
      console.info(TAG, `start：${testName}`);
      try {
        const param: image.InitializationOptions = {
          size: { height: 50, width: 50 }
        };
        const allocatorType = image.AllocatorType.AUTO;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.cloneSync();
        console.info(TAG, testName, 'Succeeded cloneSync pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(pixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0500
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0500
     * @tc.desc      clone ,paramater only size, allocatorType = image.AllocatorType.DMA
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0500', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0500";
      console.info(TAG, `start：${testName}`);
      try {
        const param: image.InitializationOptions = {
          size: { height: 50, width: 50 }
        };
        const allocatorType = image.AllocatorType.DMA;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.cloneSync();
        console.info(TAG, testName, 'Succeeded cloneSync pixelmap.');
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(error.code).assertEqual(7600201);
      }
      done();
    });
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0600
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0600
     * @tc.desc      clone ,paramater only size, allocatorType = image.AllocatorType.SHARE_MEMORY
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0600', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0600";
      console.info(TAG, `start：${testName}`);
      try {
        const param: image.InitializationOptions = {
          size: { height: 50, width: 50 }
        };
        const allocatorType = image.AllocatorType.SHARE_MEMORY;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.cloneSync();
        console.info(TAG, testName, 'Succeeded cloneSync pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(pixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0700
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0700
     * @tc.desc      clone ,paramater only size, PixelMapFormat.UNKNOWN
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0700', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0700";
      console.info(TAG, `start：${testName}`);
      try {
        const param: image.InitializationOptions = {
          alphaType: image.AlphaType.UNKNOWN,
          editable: true,
          srcPixelFormat: image.PixelMapFormat.UNKNOWN,
          pixelFormat: image.PixelMapFormat.UNKNOWN,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 50, width: 50 }
        };
        const allocatorType = image.AllocatorType.SHARE_MEMORY;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.cloneSync();
        console.info(TAG, testName, 'Succeeded cloneSync pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(pixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0800
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0800
     * @tc.desc      clone ,paramater only size, PixelMapFormat.ARGB_8888
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0800', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0800";
      console.info(TAG, `start：${testName}`);
      try {
        const param: image.InitializationOptions = {
          alphaType: image.AlphaType.UNKNOWN,
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ARGB_8888,
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 50, width: 50 }
        };
        const allocatorType = image.AllocatorType.SHARE_MEMORY;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.cloneSync();
        console.info(TAG, testName, 'Succeeded cloneSync pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(pixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0900
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0900
     * @tc.desc      clone ,paramater only size, PixelMapFormat.RGB_565
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0900', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0900";
      console.info(TAG, `start：${testName}`);
      try {
        const param: image.InitializationOptions = {
          alphaType: image.AlphaType.UNKNOWN,
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGB_565,
          pixelFormat: image.PixelMapFormat.RGB_565,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 50, width: 50 }
        };
        const allocatorType = image.AllocatorType.SHARE_MEMORY;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.cloneSync();
        console.info(TAG, testName, 'Succeeded cloneSync pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(pixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_1000
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_1000
     * @tc.desc      clone ,paramater only size, PixelMapFormat.ALPHA_8
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_1000', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_1000";
      console.info(TAG, `start：${testName}`);
      try {
        const param: image.InitializationOptions = {
          alphaType: image.AlphaType.UNKNOWN,
          editable: true,
          srcPixelFormat: image.PixelMapFormat.ALPHA_8,
          pixelFormat: image.PixelMapFormat.ALPHA_8,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 50, width: 50 }
        };
        const allocatorType = image.AllocatorType.SHARE_MEMORY;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.cloneSync();
        console.info(TAG, testName, 'Succeeded cloneSync pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(pixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_1100
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_1100
     * @tc.desc      clone ,paramater only size, PixelMapFormat.BGRA_8888
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_1100', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_1100";
      console.info(TAG, `start：${testName}`);
      try {
        const param: image.InitializationOptions = {
          alphaType: image.AlphaType.UNKNOWN,
          editable: true,
          srcPixelFormat: image.PixelMapFormat.BGRA_8888,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 50, width: 50 }
        };
        const allocatorType = image.AllocatorType.SHARE_MEMORY;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.cloneSync();
        console.info(TAG, testName, 'Succeeded cloneSync pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(pixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_1200
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_1200
     * @tc.desc      clone ,paramater only size, PixelMapFormat.RGBA_F16
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_1200', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_1200";
      console.info(TAG, `start：${testName}`);
      try {
        const param: image.InitializationOptions = {
          alphaType: image.AlphaType.UNKNOWN,
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_F16,
          pixelFormat: image.PixelMapFormat.RGBA_F16,
          scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
          size: { height: 50, width: 50 }
        };
        const allocatorType = image.AllocatorType.SHARE_MEMORY;
        let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
        console.info(TAG, 'Succeeded in creating pixelMap object.', JSON.stringify(pixelMap));
        let newPixelMap = await pixelMap.cloneSync();
        console.info(TAG, testName, 'Succeeded cloneSync pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(pixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });


  })
}