'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import { sleep } from '../../../ImageCommon.test';
import { BusinessError } from '@ohos.base';

const TAG =  'xtsStatic_Picture.PackingPictureSupp';

let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;

async function pictureCreatImageSource(done: () => void, testName: string,pathUri: string, callback:(pixelMap: image.PixelMap,imageSource:image.ImageSource) => Promise<void>): Promise<void> {
  try {
    let path = `file://${testContext.filesDir}/${pathUri}`;
    let imageSource: image.ImageSource | undefined = image.createImageSource(path);
    if(imageSource==undefined){
      console.error(TAG,testName,'No such file');
      expect().assertFail();
      done();
    }else {
      console.info(TAG, testName,'creat imageSource Success.',imageSource);
      let pixelMap: image.PixelMap | undefined = await imageSource!.createPixelMap();
      if(pixelMap == undefined){
        console.error(TAG,testName,'createPixelMap failed');
        expect().assertFail();
        done();
      }else{
        console.info(TAG, testName,'creat pixelMap Success.',pixelMap);
        await callback(pixelMap!,imageSource!);
      }
    }
  } catch (err) {
    console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`);
    expect().assertFail();
    done();
  }
}

export default function PicturePackingPixelMapFirTestSupp(): void {
  describe('PicturePackingPixelMapFirTestSupp', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
    });
    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });
    afterEach(async () => {
      console.info(TAG, 'afterEach case.');
      await sleep(500);
    });
    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });


    /**
     * @tc.number     SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_1000
     * @tc.name       SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_1000
     * @tc.desc       image.imageSource.packToFile,isEditable:false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_1000';
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        const path: string = testContext.filesDir + "/SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_1000.jpg";
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
        const imageInfo =await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, ' imageSourceObj getImageInfo succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_2000
     * @tc.name       SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_2000
     * @tc.desc       image.imageSource.packToFile,isEditable:true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_2000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_2000';
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        const path: string = testContext.filesDir + "/SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPP_static_0400.jpg";
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
        const imageInfo =await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, 'Packing succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_Supp_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_Supp_static_0100
     * @tc.desc       image.imageSource.packToFile,isEditable:true/false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_Supp_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_Supp_static_0100';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let booleanValues = [true, false];
        for (const flag of booleanValues) {
          const opts: image.InitializationOptions = {
            editable: flag,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: {height: 4, width: 6}
          };
          const path: string = `${testContext.filesDir}/SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_static_0100.jpg`;
          console.info(TAG, testName, 'path is:',path);
          let pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
          console.info(TAG, testName, 'image.createPixelMap',pixelmap);
          const packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
          const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
          const imagePackerObj: image.ImagePacker = image.createImagePacker();
          console.info(TAG, testName, 'image.createImagePacker',imagePackerObj);
          imagePackerObj.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError | null) => {
            if (err) {
              console.error(TAG, testName, `Failed to pack. code=${err.code}, msg=${err.message}`);
              expect().assertFail();
            } else {
              const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
              const imageInfo = imageSourceObj!.getImageInfoSync();
              console.info(TAG, testName, 'Packing succeeded.');
              expect(imageInfo!.size.width > 0).assertTrue();
            }
            Promise.all([
              pixelmap.release(),
              imagePackerObj!.release()
            ]
            ).then(() => {
              console.info(TAG, testName, 'pixelmap imagePackerObj release.');
              done();
            })
          })
        }
      }catch (err) {
        console.error(TAG, testName, `Unexpected error: code=${err.code}, msg=${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_Supp_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_Supp_static_0200
     * @tc.desc       image.imageSource.packToFile,image.PackingDynamicRange.AUTO, needsPackProperties: true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_Supp_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_Supp_static_0200';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        };
        const path: string = `${testContext.filesDir}/SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXMAP_CALLBACK_Supp_static_0200`;
        let pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        const packOpts: image.PackingOption = { format: "image/jpeg", desiredDynamicRange: image.PackingDynamicRange.AUTO, needsPackProperties: true,quality: 98 };
        const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        imagePackerObj.packToFile(pixelmap, file.fd, packOpts, (err: BusinessError | null) => {
          if (err) {
            console.error(TAG, testName, `Failed to pack. code=${err.code}, msg=${err.message}`);
            expect().assertFail();
          } else {
            const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd);
            const imageInfo = imageSourceObj!.getImageInfoSync();
            console.info(TAG, testName, 'Packing succeeded.');
            expect(imageInfo!.size.width > 0).assertTrue();
          }
          Promise.all([
            pixelmap.release(),
            imagePackerObj!.release()
          ]
          ).then(() => {
            console.info(TAG, testName, 'pixelmap imagePackerObj release.');
            done();
          })
        })
      } catch (err) {
        console.error(TAG, testName, `Unexpected error: code=${err.code}, msg=${err.message}`);
        expect().assertFail();
        done();
      }
    });





    /**
     * @tc.number     SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_Supp_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_Supp_static_0100
     * @tc.desc       image.imageSource.packToFile,isEditable:true, desiredDynamicRange: image.PackingDynamicRange.AUTO
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_Supp_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_Supp_static_0100';
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        const path: string = testContext.filesDir + "/SUB_MEDIA_IMAGE_SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPP_static_0400.jpg";
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          quality: 0
        };
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
        const imageInfo =await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, 'Packing succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })



    /**
     * @tc.number     SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0200
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0200';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0
      };
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const path: string = testContext.filesDir + "/SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0200.jpg";
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
        const imageInfo =await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, 'Packing succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })


    /**
     * @tc.number     SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0300
     * @tc.name       SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0300
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0300';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0,
        needsPackProperties:false
      };
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const path: string = testContext.filesDir + "/SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0300.jpg";
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
        const imageInfo =await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, 'Packing succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })


    /**
     * @tc.number     SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0400
     * @tc.name       SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0400
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0400';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0,
        needsPackProperties: true
      }
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const path: string = testContext.filesDir + "/SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0400.jpg";
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
        const imageInfo =await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, 'Packing succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })



    /**
     * @tc.number     SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0500
     * @tc.name       SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0500
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,format: "image/png",
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0500';
      let packOpts: image.PackingOption = {
        format: "image/png",
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        quality: 0
      };
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const path: string = testContext.filesDir + "/SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0500.jpg";
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
        const imageInfo =await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, 'Packing succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })


    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_0600
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_0600
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,format: "image/png",
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_0600';
      let packOpts: image.PackingOption = {
        format: "image/png",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0
      };
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const path: string = testContext.filesDir + "/SUB_MEDIA_IMAGE_imagePackerPACK_TO_FILE_PIXELMAP_PROMISE_SUPPP_FIR_static_0500.jpg";
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
        const imageInfo =await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, 'Packing succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_0700
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_0700
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_0700';
      let packOpts: image.PackingOption = {
        format: "image/png",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0,
        needsPackProperties:false
      };
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const path: string = testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_0700.jpg";
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
        const imageInfo =await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, 'Packing succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_0800
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_0800
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:true, format: "image/png"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_0800';
      let packOpts: image.PackingOption = {
        format: "image/png",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0,
        needsPackProperties:true
      };
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const path: string = testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_0800.jpg";
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
        const imageInfo =await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, 'Packing succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })




    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_0900
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_0900
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_0900';
      let packOpts: image.PackingOption = {
        format: "image/webp",
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        quality: 0
      };
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const path: string = testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_0900.jpg";
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource|undefined = image.createImageSource(file.fd.toInt());
        const imageInfo =await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, 'Packing succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1100
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1100
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1100';
      let packOpts: image.PackingOption = {
        format: "image/webp",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0
      };
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const path: string = testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1100.jpg";
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
        const imageInfo = await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, 'Packing succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })


    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1200
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1200
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1200';
      let packOpts: image.PackingOption = {
        format: "image/webp",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0,
        needsPackProperties: false
      };
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const path: string = testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1200.jpg";
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
        const imageInfo = await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, 'Packing succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })


    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1300
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1300
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1300';
      let packOpts: image.PackingOption = {
        format: "image/webp",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0,
        needsPackProperties:true
      };
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const path: string = testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1300.jpg";
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
        const imageInfo = await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, 'Packing succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })


    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1400
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1400
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.AUTO,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1400', Level.LEVEL0, async(done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1400';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        desiredDynamicRange: image.PackingDynamicRange.AUTO,
        quality: 0
      };
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const path: string = testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1400.jpg";
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
        const imageInfo = await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, 'Packing succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1500
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1500
     * @tc.desc       desiredDynamicRange: image.PackingDynamicRange.SDR,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1500';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0
      };
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const path: string = testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1500.jpg";
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
        const imageInfo = await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, 'Packing succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })
    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1600
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1600
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:false,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1600';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0,
        needsPackProperties:false
      };
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const path: string = testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1600.jpg";
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
        const imageInfo = await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, 'Packing succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })

    /**
     * @tc.number     SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1700
     * @tc.name       SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1700
     * @tc.desc       needsPackProperties: image.PackingOption.needsPackProperties:true,
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1700', Level.LEVEL0, async(done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1700';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        desiredDynamicRange: image.PackingDynamicRange.SDR,
        quality: 0,
        needsPackProperties: true
      }
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        const path: string = testContext.filesDir + "/SUB_MULTIMEDIA_IMAGE_ImagePacker_packToFile_PIXELMAP_FIR_Supp_Static_1700.jpg";
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 }
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        const pixelmap: image.PixelMap = await image.createPixelMap(color, opts);
        await imagePackerObj.packToFile(pixelmap!, file.fd, packOpts);
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(file.fd.toInt());
        const imageInfo = await imageSourceObj!.getImageInfo();
        console.info(TAG, testName, 'Packing succeeded.');
        expect(imageInfo!.size.width > 0).assertTrue();
        await pixelmap!.release();
        done();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      await imagePackerObj!.release();
      done();
    })

  })
}