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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level} from '../../../../../../hypium';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { colorSpaceManager } from '@kit.ArkGraphics2D';
import { Context } from '@kit.ArkUI';

const TAG = 'static_setAuxiliaryPictureInfo';
async function setAuxiliaryPictureInfoPromiseTest(done: () => void, testName: string, AuxiliaryPictureType: image.AuxiliaryPictureType,
 callback: (res:image.AuxiliaryPictureInfo | undefined ) => void) {
  let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
  let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
  const resourceMgr = testContext.resourceManager;
  let info: image.AuxiliaryPictureInfo = {
    auxiliaryPictureType:AuxiliaryPictureType,
    size: { height: 100, width: 200 },
    pixelFormat: image.PixelMapFormat.RGBA_8888,
    rowStride: 0,
    colorSpace: colorSpaceManager.create(colorSpaceName)
  };
  const rawFile = await resourceMgr.getRawFileContent("AllAuxiliaryPictures_exclude_fragment.jpg");
      let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
      let auxSize: image.Size = { height: 180, width: 240 };
      let auxPictureObj = image.createAuxiliaryPicture(auxBuffer, auxSize, AuxiliaryPictureType);
      console.info(TAG, testName,`auxPictureObj success:`,auxPictureObj!);
    if (auxPictureObj != null) {
      auxPictureObj!.setAuxiliaryPictureInfo(info);
      let res: image.AuxiliaryPictureInfo | undefined = auxPictureObj!.getAuxiliaryPictureInfo();
      console.info(TAG, testName, `auxPictureObj getAuxiliaryPictureInfo success:`, JSON.stringify(res!));
      callback(res!);
    } else {
      console.error(TAG,testName,'AuxPictureObj is null.');
      expect().assertFail();
    }
  auxPictureObj!.release();
  done();
}
async function setAuxiliaryPictureInfoPromiseChangeInfoTest(done: () => void, testName: string, AuxiliaryPictureType: image.AuxiliaryPictureType,info: image.AuxiliaryPictureInfo,
  callback: (res:image.AuxiliaryPictureInfo | undefined ) => void) {
  let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
  const resourceMgr = testContext.resourceManager;
  const rawFile = await resourceMgr.getRawFileContent("AllAuxiliaryPictures_exclude_fragment.jpg");
  let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
  let auxSize: image.Size = { height: 180, width: 240 };
  let auxPictureObj = image.createAuxiliaryPicture(auxBuffer, auxSize, AuxiliaryPictureType);
  console.info(TAG, testName,`auxPictureObj success:`,auxPictureObj!);
  if (auxPictureObj != null) {
    auxPictureObj!.setAuxiliaryPictureInfo(info);
    let res: image.AuxiliaryPictureInfo | undefined = auxPictureObj!.getAuxiliaryPictureInfo();
    console.info(TAG, testName, `auxPictureObj getAuxiliaryPictureInfo success:`, JSON.stringify(res!));
    callback(res!);
  } else {
    console.error(TAG,testName,'AuxPictureObj is null.');
    expect().assertFail();
  }
  auxPictureObj!.release();
  done();
}
  export default function setAuxiliaryPictureGetMetadataStaticTest(): void {
    describe('setAuxiliaryPictureGetMetadataStaticTest', (): void => {
      let context: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      let filesDir: string | undefined | null;
      let filePath: string = '';
      let fdNumber: int;
      const getFd = (fileName: string): int => {
        filePath = filesDir + "/" + fileName;
        console.info("image filePath:" + filePath);
        const file = fs.openSync(filePath!);
        fdNumber = file.fd as int;
        return fdNumber;
      };
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
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_0100
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_0100
     * @tc.desc   setAuxiliaryPictureInfo,cover AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_0100';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      try {
        await setAuxiliaryPictureInfoPromiseTest(done, testName, AuxiliaryPictureType, (res:image.AuxiliaryPictureInfo | undefined) => {
            expect(res!.auxiliaryPictureType).assertEqual(1);
            expect(res!.size.height).assertEqual(100);
            expect(res!.size.width).assertEqual(200);
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0200
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0200
     * @tc.desc   setAuxiliaryPictureInfo, auxiliaryPictureType: image.AuxiliaryPictureType.DEPTH_MAP,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0200';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP
      try {
        await setAuxiliaryPictureInfoPromiseTest(done, testName, AuxiliaryPictureType,
          (res:image.AuxiliaryPictureInfo | undefined) => {
            expect(res!.auxiliaryPictureType).assertEqual(2);
            expect(res!.size.height).assertEqual(100);
            expect(res!.size.width).assertEqual(200);
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0300
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0300
     * @tc.desc   setAuxiliaryPictureInfo  AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0300';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      try {
        await setAuxiliaryPictureInfoPromiseTest(done, testName, AuxiliaryPictureType,
          (res:image.AuxiliaryPictureInfo | undefined) => {
            expect(res!.auxiliaryPictureType).assertEqual(3);
            expect(res!.size.height).assertEqual(100);
            expect(res!.size.width).assertEqual(200);
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0400
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0400
     * @tc.desc   setAuxiliaryPictureInfo cover；AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0400';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
      try {
        await setAuxiliaryPictureInfoPromiseTest(done, testName, AuxiliaryPictureType,
          (res:image.AuxiliaryPictureInfo | undefined) => {
            expect(res!.auxiliaryPictureType).assertEqual(4);
            expect(res!.size.height).assertEqual(100);
            expect(res!.size.width).assertEqual(200);
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0500
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0500
     * @tc.desc   setAuxiliaryPictureInfo cover；AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0500';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      try {
        await setAuxiliaryPictureInfoPromiseTest(done, testName, AuxiliaryPictureType,
          (res:image.AuxiliaryPictureInfo | undefined) => {
            expect(res!.auxiliaryPictureType).assertEqual(5);
            expect(res!.size.height).assertEqual(100);
            expect(res!.size.width).assertEqual(200);
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })



    /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0600
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0600
     * @tc.desc   setAuxiliaryPictureInfo cover:  pixelFormat: image.PixelMapFormat.RGB_565,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0600';
      const path = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: AuxiliaryPictureType,
        size: { height: 200, width: 100 },
        pixelFormat: image.PixelMapFormat.RGB_565,
        rowStride: 0,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      try {
        await setAuxiliaryPictureInfoPromiseChangeInfoTest(done, testName, AuxiliaryPictureType,info,
          (res:image.AuxiliaryPictureInfo | undefined) => {
            expect(res!.auxiliaryPictureType).assertEqual(1);
            expect(res!.rowStride).assertEqual(0);
            expect(res!.pixelFormat).assertEqual(2);
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0700
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0700
     * @tc.desc   setAuxiliaryPictureInfo ,cover: rowStride: 100,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0700';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: AuxiliaryPictureType,
        size: { height: 200, width: 100 },
        pixelFormat: image.PixelMapFormat.BGRA_8888,
        rowStride: 100,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      try {
        await setAuxiliaryPictureInfoPromiseChangeInfoTest(done, testName, AuxiliaryPictureType,info,
          (res:image.AuxiliaryPictureInfo | undefined) => {
            expect(res!.auxiliaryPictureType).assertEqual(5);
            expect(res!.rowStride).assertEqual(100);
            expect(res!.pixelFormat).assertEqual(4);
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0800
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0800
     * @tc.desc   setAuxiliaryPictureInfo cover pixelFormat: image.PixelMapFormat.RGB_888,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0800';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: AuxiliaryPictureType,
        size: { height: 200, width: 100 },
        pixelFormat: image.PixelMapFormat.RGB_888,
        rowStride: 100,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      try {
        await setAuxiliaryPictureInfoPromiseChangeInfoTest(done, testName, AuxiliaryPictureType,info,
          (res:image.AuxiliaryPictureInfo | undefined) => {
            expect(res!.auxiliaryPictureType).assertEqual(5);
            expect(res!.rowStride).assertEqual(100);
            expect(res!.pixelFormat).assertEqual(5);
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0900
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0900
     * @tc.desc   setAuxiliaryPictureInfo cover: pixelFormat: image.PixelMapFormat.ALPHA_8,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_0900';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: AuxiliaryPictureType,
        size: { height: 200, width: 100 },
        pixelFormat: image.PixelMapFormat.ALPHA_8,
        rowStride: 100,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      try {
        await setAuxiliaryPictureInfoPromiseChangeInfoTest(done, testName, AuxiliaryPictureType,info,
          (res:image.AuxiliaryPictureInfo | undefined) => {
            expect(res!.auxiliaryPictureType).assertEqual(3);
            expect(res!.rowStride).assertEqual(100);
            expect(res!.pixelFormat).assertEqual(6);
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1000
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1000
     * @tc.desc   setAuxiliaryPictureInfo,pixelFormat: image.PixelMapFormat.RGBA_F16,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1000';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType: AuxiliaryPictureType,
        size: { height: 200, width: 100 },
        pixelFormat:image.PixelMapFormat.RGBA_F16,
        rowStride: 100,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      try {
        await setAuxiliaryPictureInfoPromiseChangeInfoTest(done, testName, AuxiliaryPictureType,info,
          (res:image.AuxiliaryPictureInfo | undefined) => {
            expect(res!.auxiliaryPictureType).assertEqual(3);
            expect(res!.rowStride).assertEqual(100);
            expect(res!.pixelFormat).assertEqual(7);
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })


      /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1100
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1100
     * @tc.desc   setAuxiliaryPictureInfo cover: pixelFormat: image.PixelMapFormat.NV21,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1100';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType:AuxiliaryPictureType,
        size: { height: 200, width: 100 },
        pixelFormat: image.PixelMapFormat.NV21,
        rowStride: 100,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      try {
        await setAuxiliaryPictureInfoPromiseChangeInfoTest(done, testName, AuxiliaryPictureType,info,
          (res:image.AuxiliaryPictureInfo | undefined) => {
            expect(res!.auxiliaryPictureType).assertEqual(3);
            expect(res!.rowStride).assertEqual(100);
            expect(res!.pixelFormat).assertEqual(8);
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1200
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1200
     * @tc.desc   setAuxiliaryPictureInfo cover: pixelFormat: image.PixelMapFormat.NV12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1200';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType:AuxiliaryPictureType,
        size: { height: 200, width: 100 },
        pixelFormat: image.PixelMapFormat.NV12,
        rowStride: 100,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      try {
        await setAuxiliaryPictureInfoPromiseChangeInfoTest(done, testName, AuxiliaryPictureType,info,
          (res:image.AuxiliaryPictureInfo | undefined) => {
            expect(res!.auxiliaryPictureType).assertEqual(3);
            expect(res!.rowStride).assertEqual(100);
            expect(res!.pixelFormat).assertEqual(9);
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1300
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1300
     * @tc.desc   setAuxiliaryPictureInfo cover: image.PixelMapFormat.RGBA_1010102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1300';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType:AuxiliaryPictureType,
        size: { height: 200, width: 100 },
        pixelFormat: image.PixelMapFormat.RGBA_1010102,
        rowStride: 100,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      try {
        await setAuxiliaryPictureInfoPromiseChangeInfoTest(done, testName, AuxiliaryPictureType,info,
          (res:image.AuxiliaryPictureInfo | undefined) => {
            expect(res!.auxiliaryPictureType).assertEqual(3);
            expect(res!.rowStride).assertEqual(100);
            expect(res!.pixelFormat).assertEqual(10);
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1400
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1400
     * @tc.desc   setAuxiliaryPictureInfo cover: image.PixelMapFormat.YCBCR_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1400';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType:AuxiliaryPictureType,
        size: { height: 200, width: 100 },
        pixelFormat: image.PixelMapFormat.YCBCR_P010,
        rowStride: 100,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      try {
        await setAuxiliaryPictureInfoPromiseChangeInfoTest(done, testName, AuxiliaryPictureType,info,
          (res:image.AuxiliaryPictureInfo | undefined) => {
            expect(res!.auxiliaryPictureType).assertEqual(3);
            expect(res!.rowStride).assertEqual(100);
            expect(res!.pixelFormat).assertEqual(11);
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1500
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1500
     * @tc.desc   setAuxiliaryPictureInfo cover: image.PixelMapFormat.YCRCB_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1500';
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let info: image.AuxiliaryPictureInfo = {
        auxiliaryPictureType:AuxiliaryPictureType,
        size: { height: 200, width: 100 },
        pixelFormat: image.PixelMapFormat.YCRCB_P010,
        rowStride: 100,
        colorSpace: colorSpaceManager.create(colorSpaceName)
      };
      try {
        await setAuxiliaryPictureInfoPromiseChangeInfoTest(done, testName, AuxiliaryPictureType,info,
          (res:image.AuxiliaryPictureInfo | undefined) => {
            expect(res!.auxiliaryPictureType).assertEqual(3);
            expect(res!.rowStride).assertEqual(100);
            expect(res!.pixelFormat).assertEqual(12);
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })


      /**
       * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1600
       * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1600
       * @tc.desc   getAuxiliaryPictureInfo the auxiliaryPictureType emu the size,"test.jpeg"
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1600', Level.LEVEL0, async (done: () => void) => {
        const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1600';
        const resourceMgr = context.resourceManager;
        console.info(TAG, testName,`resourceMgr success:`,resourceMgr);
        const rawFile = await resourceMgr.getRawFileContent("test.jpeg");
        console.info(TAG, testName,`rawFile success:`,rawFile);
        let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
        let auxSize: image.Size = { height: 180, width: 240 };
        const formats = [
          image.AuxiliaryPictureType.GAINMAP,
          image.AuxiliaryPictureType.DEPTH_MAP,
          image.AuxiliaryPictureType.UNREFOCUS_MAP,
          image.AuxiliaryPictureType.LINEAR_MAP,
          image.AuxiliaryPictureType.FRAGMENT_MAP];
        console.info(TAG, testName,`formats success:`,formats);
        for (const format of formats) {
          let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
          console.info(TAG, testName,`image.AuxiliaryPictureType success:`,auxType);
          let auxPictureObj = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
          console.info(TAG, testName,`auxPictureObj success:`,auxPictureObj);
          try {
            if (auxPictureObj != null) {
              let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
              let info: image.AuxiliaryPictureInfo = {
                auxiliaryPictureType: format,
                size: { height: 100, width: 200 },
                pixelFormat: image.PixelMapFormat.RGBA_8888,
                rowStride: 0,
                colorSpace: colorSpaceManager.create(colorSpaceName),
              };
              auxPictureObj.setAuxiliaryPictureInfo(info);
              console.info(TAG, testName,`setAuxiliaryPictureInfo success:`,);
              let res:image.AuxiliaryPictureInfo | undefined = auxPictureObj.getAuxiliaryPictureInfo();
              console.info(TAG, testName,`auxPictureObj getAuxiliaryPictureInfo success:`,JSON.stringify(res?.pixelFormat));
              expect(res!.auxiliaryPictureType == format).assertTrue();
            } else {
              console.error(TAG, testName, 'AuxPictureObj is null.');
              expect().assertFail();
            }
          } catch (error) {
            console.info(TAG, testName, `failed; error: ${error},${error.code}`, testName);
            expect(error.code).assertFail();
          } finally {
            auxPictureObj.release();
          }
        }
        done();
      })
      // /**
      //  * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1700
      //  * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1700
      //  * @tc.desc   getAuxiliaryPictureInfo the auxiliaryPictureType emu the size,"AllAuxiliaryPictures_exclude_fragment.jpg"
      //  * @tc.type   FUNCTION
      //  * @tc.size   MEDIUMTEST
      //  * @tc.level  LEVEL0
      //  */
      // it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1700', Level.LEVEL0, async (done: () => void) => {
      //   const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1700';
      //   const resourceMgr = context.resourceManager;
      //   console.info(TAG, testName,`resourceMgr success:`,resourceMgr);
      //   const rawFile = await resourceMgr.getRawFileContent("AllAuxiliaryPictures_exclude_fragment.jpg");
      //   console.info(TAG, testName,`rawFile success:`,rawFile);
      //   let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
      //   let auxSize: image.Size = { height: 180, width: 240 };
      //   const formats = [
      //     image.AuxiliaryPictureType.GAINMAP,
      //     image.AuxiliaryPictureType.DEPTH_MAP,
      //     image.AuxiliaryPictureType.UNREFOCUS_MAP,
      //     image.AuxiliaryPictureType.LINEAR_MAP,
      //     image.AuxiliaryPictureType.FRAGMENT_MAP];
      //   console.info(TAG, testName,`formats success:`,formats);
      //   for (const format of formats) {
      //     let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      //     console.info(TAG, testName,`image.AuxiliaryPictureType success:`,auxType);
      //     let auxPictureObj = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
      //     console.info(TAG, testName,`auxPictureObj success:`,auxPictureObj);
      //     try {
      //       if (auxPictureObj != null) {
      //         let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      //         let info: image.AuxiliaryPictureInfo = {
      //           auxiliaryPictureType: format,
      //           size: { height: 100, width: 200 },
      //           pixelFormat: image.PixelMapFormat.RGBA_8888,
      //           rowStride: 0,
      //           colorSpace: colorSpaceManager.create(colorSpaceName),
      //         };
      //         auxPictureObj.setAuxiliaryPictureInfo(info);
      //         console.info(TAG, testName,`setAuxiliaryPictureInfo success:`,);
      //         let res:image.AuxiliaryPictureInfo | undefined = auxPictureObj.getAuxiliaryPictureInfo();
      //         console.info(TAG, testName,`auxPictureObj getAuxiliaryPictureInfo success:`,JSON.stringify(res?.pixelFormat));
      //         expect(res!.auxiliaryPictureType == format).assertTrue();
      //       } else {
      //         console.error(TAG, testName, 'AuxPictureObj is null.');
      //         expect().assertFail();
      //       }
      //     } catch (error) {
      //       console.info(TAG, testName, `failed; error: ${error},${error.code}`, testName);
      //       expect(error.code).assertFail();
      //     } finally {
      //       auxPictureObj.release();
      //     }
      //   }
      //   done();
      // })
      /**
       * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1800
       * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1800
       * @tc.desc   setAuxiliaryPictureInfo cover: image.AuxiliaryPictureType.GAINMAP;
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1800', Level.LEVEL0, async (done: () => void) => {
        const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1800';
        const AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
        let info: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType:AuxiliaryPictureType,
          size: { height: 200, width: 100 },
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          rowStride: 100,
          colorSpace: colorSpaceManager.create(colorSpaceName)
        };
        try {
          await setAuxiliaryPictureInfoPromiseChangeInfoTest(done, testName, AuxiliaryPictureType,info,
            (res:image.AuxiliaryPictureInfo | undefined) => {
              expect(res!.auxiliaryPictureType).assertEqual(1);
            })
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFail();
        }
        done();
      })
      /**
       * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1900
       * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1900
       * @tc.desc   setAuxiliaryPictureInfo cover: image.AuxiliaryPictureType.DEPTH_MAP;
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1900', Level.LEVEL0, async (done: () => void) => {
        const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1900';
        const AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
        let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
        let info: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType:AuxiliaryPictureType,
          size: { height: 200, width: 100 },
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          rowStride: 100,
          colorSpace: colorSpaceManager.create(colorSpaceName)
        };
        try {
          await setAuxiliaryPictureInfoPromiseChangeInfoTest(done, testName, AuxiliaryPictureType,info,
            (res:image.AuxiliaryPictureInfo | undefined) => {
              expect(res!.auxiliaryPictureType).assertEqual(2);
            })
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFail();
        }
        done();
      })
      /**
       * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1700
       * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1700
       * @tc.desc   setAuxiliaryPictureInfo cover: image.AuxiliaryPictureType.UNREFOCUS_MAP;
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1700', Level.LEVEL0, async (done: () => void) => {
        const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_1700';
        const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
        let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
        let info: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType:AuxiliaryPictureType,
          size: { height: 200, width: 100 },
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          rowStride: 100,
          colorSpace: colorSpaceManager.create(colorSpaceName)
        };
        try {
          await setAuxiliaryPictureInfoPromiseChangeInfoTest(done, testName, AuxiliaryPictureType,info,
            (res:image.AuxiliaryPictureInfo | undefined) => {
              expect(res!.auxiliaryPictureType).assertEqual(3);
            })
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFail();
        }
        done();
      })
      /**
       * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_2000
       * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_2000
       * @tc.desc   setAuxiliaryPictureInfo cover: image.AuxiliaryPictureType.LINEAR_MAP;
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_2000', Level.LEVEL0, async (done: () => void) => {
        const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_2000';
        const AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
        let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
        let info: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType:AuxiliaryPictureType,
          size: { height: 200, width: 100 },
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          rowStride: 100,
          colorSpace: colorSpaceManager.create(colorSpaceName)
        };
        try {
          await setAuxiliaryPictureInfoPromiseChangeInfoTest(done, testName, AuxiliaryPictureType,info,
            (res:image.AuxiliaryPictureInfo | undefined) => {
              expect(res!.auxiliaryPictureType).assertEqual(4);
            })
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFail();
        }
        done();
      })
      /**
       * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_2100
       * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_2100
       * @tc.desc   setAuxiliaryPictureInfo cover: image.AuxiliaryPictureType.FRAGMENT_MAP;
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_2100', Level.LEVEL0, async (done: () => void) => {
        const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_2100';
        const AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
        let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
        let info: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType:AuxiliaryPictureType,
          size: { height: 200, width: 100 },
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          rowStride: 100,
          colorSpace: colorSpaceManager.create(colorSpaceName)
        };
        try {
          await setAuxiliaryPictureInfoPromiseChangeInfoTest(done, testName, AuxiliaryPictureType,info,
            (res:image.AuxiliaryPictureInfo | undefined) => {
              expect(res!.auxiliaryPictureType).assertEqual(5);
            })
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFail();
        }
        done();
      })
      /**
       * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_2200
       * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_2200
       * @tc.desc   setAuxiliaryPictureInfo cover: image.AuxiliaryPictureType.LHDR_GAINMAP;
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_2200', Level.LEVEL0, async (done: () => void) => {
        const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_setAuxiliaryPictureInfo_promise_Static_2200';
        const AuxiliaryPictureType = image.AuxiliaryPictureType.LHDR_GAINMAP;
        let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
        let info: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType:AuxiliaryPictureType,
          size: { height: 200, width: 100 },
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          rowStride: 100,
          colorSpace: colorSpaceManager.create(colorSpaceName)
        };
        try {
          await setAuxiliaryPictureInfoPromiseChangeInfoTest(done, testName, AuxiliaryPictureType,info,
            (res:image.AuxiliaryPictureInfo | undefined) => {
              expect(res!.auxiliaryPictureType).assertEqual(10);
            })
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect().assertFail();
        }
        done();
      })
  })
}