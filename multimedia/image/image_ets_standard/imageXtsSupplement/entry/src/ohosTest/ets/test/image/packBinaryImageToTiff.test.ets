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

import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import fs from '@ohos.file.fs';

const TAG = 'packBinaryImageToTiffSupp';
let fdNumber: number;

const IMAGE_ERR_INVALID_PARAM = 7800202;

async function getFd(fileName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

export default function packBinaryImageToTiffTest() {
  const context: common.UIAbilityContext = AppStorage.get('context') as common.UIAbilityContext;
  describe('packBinaryImageToTiffTest', () => {

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
     * @tc.number     SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0100
     * @tc.name       SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0100
     * @tc.desc       packBinaryImageToTiffFile 枚举覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0100';
      const width = 100;
      const height = 100;
      const rowBytes = 13;
      const bufferSize = rowBytes * height;
      const data: ArrayBuffer = new ArrayBuffer(bufferSize);
      let bufferInfo: image.BinaryBufferInfo = {
        size: { width: width, height: height },
        data: data,
        bytesPerRow: rowBytes
      };
      const orientations = [
        image.Orientation.TOP_LEFT,
        image.Orientation.TOP_RIGHT,
        image.Orientation.BOTTOM_RIGHT,
        image.Orientation.BOTTOM_LEFT,
        image.Orientation.LEFT_TOP,
        image.Orientation.RIGHT_TOP,
        image.Orientation.RIGHT_BOTTOM,
        image.Orientation.LEFT_BOTTOM,
      ];
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      for (const orientation of orientations) {
        let file: fileIo.File | null = null;
        try {
          const filePath: string = `${context.filesDir}/output_${orientation}.tiff`;
          file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
          let tiffOptions: image.PackingOptionsForTiff = {
            compression: 4,
            orientation: orientation
          };
          let packResult = await imagePackerObj.packBinaryImageToTiffFile(bufferInfo, file.fd, tiffOptions);
          console.info(TAG, testName, `Orientation ${orientation} succeeded.`, JSON.stringify(packResult));
          let fileExist = fileIo.accessSync(filePath);
          expect(fileExist).assertTrue();
          fileIo.closeSync(file);
        } catch (error) {
          console.info(TAG, testName,
            `Orientation ${orientation} failed. code ${error.code}, message is ${error.message}`);
          expect().assertFail();
        }
      }
      await imagePackerObj.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0200
     * @tc.name       SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0200
     * @tc.desc       packBinaryImageToTiffFile 第一个参数覆盖null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0200';
      let file: fileIo.File | null = null;
      try {
        const filePath: string = context.filesDir + "/output.tiff";
        file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
        let tiffOptions: image.PackingOptionsForTiff = {
          compression: 4,
        };
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        let packResult = await imagePackerObj.packBinaryImageToTiffFile(null, file.fd, tiffOptions);
        console.info(TAG, testName, 'Succeeded in packing binary image to tiff data.', JSON.stringify(packResult));
        expect().assertFail();
        fileIo.closeSync(file);
        await imagePackerObj.release();
        done();
      } catch (error) {
        console.info(TAG, testName,
          `Failed to pack binary image to tiff data. code ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(IMAGE_ERR_INVALID_PARAM);
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0300
     * @tc.name       SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0300
     * @tc.desc       packBinaryImageToTiffFile 第一个参数覆盖undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0300';
      let file: fileIo.File | null = null;
      try {
        const filePath: string = context.filesDir + "/output.tiff";
        file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
        let tiffOptions: image.PackingOptionsForTiff = {
          compression: 4,
        };
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        let packResult = await imagePackerObj.packBinaryImageToTiffFile(undefined, file.fd, tiffOptions);
        console.info(TAG, testName, 'Succeeded in packing binary image to tiff data.', JSON.stringify(packResult));
        expect().assertFail();
        fileIo.closeSync(file);
        await imagePackerObj.release();
        done();
      } catch (error) {
        console.info(TAG, testName,
          `Failed to pack binary image to tiff data. code ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(IMAGE_ERR_INVALID_PARAM);
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0400
     * @tc.name       SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0400
     * @tc.desc       packBinaryImageToTiffFile 第二个参数覆盖null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0400';
      const width = 100;
      const height = 100;
      const rowBytes = 13;
      const bufferSize = rowBytes * height;
      const data: ArrayBuffer = new ArrayBuffer(bufferSize);
      let bufferInfo: image.BinaryBufferInfo = {
        size: { width: width, height: height },
        data: data,
        bytesPerRow: rowBytes
      };
      let file: fileIo.File | null = null;
      try {
        let tiffOptions: image.PackingOptionsForTiff = {
          compression: 4,
        };
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        let packResult = await imagePackerObj.packBinaryImageToTiffFile(bufferInfo, null, tiffOptions);
        console.info(TAG, testName, 'Succeeded in packing binary image to tiff data.', JSON.stringify(packResult));
        expect().assertFail();
        fileIo.closeSync(file);
        await imagePackerObj.release();
        done();
      } catch (error) {
        console.info(TAG, testName,
          `Failed to pack binary image to tiff data. code ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(IMAGE_ERR_INVALID_PARAM);
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0500
     * @tc.name       SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0500
     * @tc.desc       packBinaryImageToTiffFile 第二个参数覆盖undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0500';
      const width = 100;
      const height = 100;
      const rowBytes = 13;
      const bufferSize = rowBytes * height;
      const data: ArrayBuffer = new ArrayBuffer(bufferSize);
      let bufferInfo: image.BinaryBufferInfo = {
        size: { width: width, height: height },
        data: data,
        bytesPerRow: rowBytes
      };
      let file: fileIo.File | null = null;
      try {
        let tiffOptions: image.PackingOptionsForTiff = {
          compression: 4,
        };
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        let packResult = await imagePackerObj.packBinaryImageToTiffFile(bufferInfo, undefined, tiffOptions);
        console.info(TAG, testName, 'Succeeded in packing binary image to tiff data.', JSON.stringify(packResult));
        expect().assertFail();
        fileIo.closeSync(file);
        await imagePackerObj.release();
        done();
      } catch (error) {
        console.info(TAG, testName,
          `Failed to pack binary image to tiff data. code ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(IMAGE_ERR_INVALID_PARAM);
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0600
     * @tc.name       SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0600
     * @tc.desc       packBinaryImageToTiffFile 第三个参数覆盖null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0600';
      const width = 100;
      const height = 100;
      const rowBytes = 13;
      const bufferSize = rowBytes * height;
      const data: ArrayBuffer = new ArrayBuffer(bufferSize);
      let bufferInfo: image.BinaryBufferInfo = {
        size: { width: width, height: height },
        data: data,
        bytesPerRow: rowBytes
      };
      let file: fileIo.File | null = null;
      try {
        const filePath: string = context.filesDir + "/output.tiff";
        file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        let packResult = await imagePackerObj.packBinaryImageToTiffFile(bufferInfo, file.fd, null);
        console.info(TAG, testName, 'Succeeded in packing binary image to tiff data.', JSON.stringify(packResult));
        let fileExist = fileIo.accessSync(filePath);
        expect(fileExist).assertTrue();
        fileIo.closeSync(file);
        await imagePackerObj.release();
        done();
      } catch (error) {
        console.info(TAG, testName,
          `Failed to pack binary image to tiff data. code ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(IMAGE_ERR_INVALID_PARAM);
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0700
     * @tc.name       SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0700
     * @tc.desc       packBinaryImageToTiffFile 第三个参数覆盖undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packBinaryImageToTiffFile_0700';
      const width = 100;
      const height = 100;
      const rowBytes = 13;
      const bufferSize = rowBytes * height;
      const data: ArrayBuffer = new ArrayBuffer(bufferSize);
      let bufferInfo: image.BinaryBufferInfo = {
        size: { width: width, height: height },
        data: data,
        bytesPerRow: rowBytes
      };
      let file: fileIo.File | null = null;
      try {
        const filePath: string = context.filesDir + "/output.tiff";
        file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
        const imagePackerObj: image.ImagePacker = image.createImagePacker();
        let packResult = await imagePackerObj.packBinaryImageToTiffFile(bufferInfo, file.fd, undefined);
        console.info(TAG, testName, 'Succeeded in packing binary image to tiff data.', JSON.stringify(packResult));
        let fileExist = fileIo.accessSync(filePath);
        expect(fileExist).assertTrue();
        fileIo.closeSync(file);
        await imagePackerObj.release();
        done();
      } catch (error) {
        console.info(TAG, testName,
          `Failed to pack binary image to tiff data. code ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(IMAGE_ERR_INVALID_PARAM);
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0100
     * @tc.name       SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0100
     * @tc.desc       packBinaryImageToTiffData 枚举覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0100';
      const width = 100;
      const height = 100;
      const rowBytes = 13;
      const bufferSize = rowBytes * height;
      const data: ArrayBuffer = new ArrayBuffer(bufferSize);
      let bufferInfo: image.BinaryBufferInfo = {
        size: { width: width, height: height },
        data: data,
        bytesPerRow: rowBytes
      };
      const orientations = [
        image.Orientation.TOP_LEFT,
        image.Orientation.TOP_RIGHT,
        image.Orientation.BOTTOM_RIGHT,
        image.Orientation.BOTTOM_LEFT,
        image.Orientation.LEFT_TOP,
        image.Orientation.RIGHT_TOP,
        image.Orientation.RIGHT_BOTTOM,
        image.Orientation.LEFT_BOTTOM,
      ];
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      for (const orientation of orientations) {
        try {
          let tiffOptions: image.PackingOptionsForTiff = {
            compression: 4,
            orientation: orientation
          };
          let data = await imagePackerObj.packBinaryImageToTiffData(bufferInfo, tiffOptions)
          console.info(TAG, testName, `Orientation ${orientation} succeeded.`, JSON.stringify(data));
          expect(data != undefined).assertTrue();
        } catch (error) {
          console.info(TAG, testName,
            `Orientation ${orientation} failed. code ${error.code}, message is ${error.message}`);
          expect().assertFail();
        }
      }
      await imagePackerObj.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0200
     * @tc.name       SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0200
     * @tc.desc       packBinaryImageToTiffData 第一个参数覆盖null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0200';
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        let tiffOptions: image.PackingOptionsForTiff = {
          compression: 4,
        };
        let data = await imagePackerObj.packBinaryImageToTiffData(null, tiffOptions)
        console.info(TAG, testName, 'Succeeded in packing binary image to tiff data.', JSON.stringify(data));
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName,
          `Failed to pack binary image to tiff data. code ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(IMAGE_ERR_INVALID_PARAM);
      }
      await imagePackerObj.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0300
     * @tc.name       SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0300
     * @tc.desc       packBinaryImageToTiffData 第一个参数覆盖undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0300';
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        let tiffOptions: image.PackingOptionsForTiff = {
          compression: 4,
        };
        let data = await imagePackerObj.packBinaryImageToTiffData(undefined, tiffOptions)
        console.info(TAG, testName, 'Succeeded in packing binary image to tiff data.', JSON.stringify(data));
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName,
          `Failed to pack binary image to tiff data. code ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(IMAGE_ERR_INVALID_PARAM);
      }
      await imagePackerObj.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0400
     * @tc.name       SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0400
     * @tc.desc       packBinaryImageToTiffData 第二个参数覆盖null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0400';
      const width = 100;
      const height = 100;
      const rowBytes = 13;
      const bufferSize = rowBytes * height;
      const data: ArrayBuffer = new ArrayBuffer(bufferSize);
      let bufferInfo: image.BinaryBufferInfo = {
        size: { width: width, height: height },
        data: data,
        bytesPerRow: rowBytes
      };
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        let data = await imagePackerObj.packBinaryImageToTiffData(bufferInfo, null)
        console.info(TAG, testName, 'Succeeded in packing binary image to tiff data.', JSON.stringify(data));
        expect(data != undefined).assertTrue();
      } catch (error) {
        console.info(TAG, testName,
          `Failed to pack binary image to tiff data. code ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await imagePackerObj.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0500
     * @tc.name       SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0500
     * @tc.desc       packBinaryImageToTiffData 第二个参数覆盖undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packBinaryImageToTiffData_0500';
      const width = 100;
      const height = 100;
      const rowBytes = 13;
      const bufferSize = rowBytes * height;
      const data: ArrayBuffer = new ArrayBuffer(bufferSize);
      let bufferInfo: image.BinaryBufferInfo = {
        size: { width: width, height: height },
        data: data,
        bytesPerRow: rowBytes
      };
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        let data = await imagePackerObj.packBinaryImageToTiffData(bufferInfo, undefined)
        console.info(TAG, testName, 'Succeeded in packing binary image to tiff data.', JSON.stringify(data));
        expect(data != undefined).assertTrue();
      } catch (error) {
        console.info(TAG, testName,
          `Failed to pack binary image to tiff data. code ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await imagePackerObj.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_packing_0100
     * @tc.name       SUB_MEDIA_IMAGE_packing_0100
     * @tc.desc       packing 枚举覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packing_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packing_0100';
      const orientations = [
        image.Orientation.TOP_LEFT,
        image.Orientation.TOP_RIGHT,
        image.Orientation.BOTTOM_RIGHT,
        image.Orientation.BOTTOM_LEFT,
        image.Orientation.LEFT_TOP,
        image.Orientation.RIGHT_TOP,
        image.Orientation.RIGHT_BOTTOM,
        image.Orientation.LEFT_BOTTOM,
      ];
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
      let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      for (const orientation of orientations) {
        try {
          let opts: image.PackingOption = {
            format: "image/jpeg",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            tiffPackingOptions: {
              orientation: orientation
            }
          };
          let data = await imagePackerObj.packing(pictureObj, opts);
          console.info(TAG, testName, `Orientation ${orientation} succeeded, data length: ${data?.byteLength ?? 0}`);
          expect(data.byteLength > 0).assertTrue();
        } catch (error) {
          console.error(TAG, testName, `Failed to pack the image.code ${error.code},message is ${error.message}`);
          expect().assertFail();
        }
      }
      await imagePackerObj.release();
      pictureObj.release();
      await commodityPixelMap.release();
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_packing_0200
     * @tc.name       SUB_MEDIA_IMAGE_packing_0200
     * @tc.desc       packing 枚举覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packing_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packing_0200';
      const Level = [
        image.AntiAliasingLevel.NONE,
        image.AntiAliasingLevel.LOW,
        image.AntiAliasingLevel.MEDIUM,
        image.AntiAliasingLevel.HIGH,
      ];
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
      let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      for (const level of Level) {
        try {
          let opts: image.PackingOption = {
            format: "image/jpeg",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            sizeLimit: {
              maxSize: { width: 0, height: 0 },
              level: level
            }
          };
          let data = await imagePackerObj.packing(pictureObj, opts);
          console.info(TAG, testName, `AntiAliasingLevel ${level} succeeded, data length: ${data.byteLength}`);
          expect(data.byteLength > 0).assertTrue();
        } catch (error) {
          console.error(TAG, testName, `Failed to pack the image.code ${error.code},message is ${error.message}`);
          expect().assertFail();
        }
      }
      await imagePackerObj.release();
      pictureObj.release();
      await commodityPixelMap.release();
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_packing_0300
     * @tc.name       SUB_MEDIA_IMAGE_packing_0300
     * @tc.desc       packing needsPackGPS cover true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packing_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packing_0300';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
      let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
        try {
          let opts: image.PackingOption = {
            format: "image/jpeg",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            needsPackGPS: true
          };
          let data = await imagePackerObj.packing(pictureObj, opts);
          console.info(TAG, testName, 'Succeeded in packing the image.'+ data);
          expect(data.byteLength > 0).assertTrue();
        } catch (error) {
          console.error(TAG, testName, `Failed to pack the image.code ${error.code},message is ${error.message}`);
          expect().assertFail();
        }
      await imagePackerObj.release();
      pictureObj.release();
      await commodityPixelMap.release();
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_packing_0400
     * @tc.name       SUB_MEDIA_IMAGE_packing_0400
     * @tc.desc       packing needsPackGPS cover false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packing_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packing_0400';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
      let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        let opts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackGPS: false
        };
        let data = await imagePackerObj.packing(pictureObj, opts);
        console.info(TAG, testName, 'Succeeded in packing the image.'+ data);
        expect(data.byteLength > 0).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to pack the image.code ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      await imagePackerObj.release();
      pictureObj.release();
      await commodityPixelMap.release();
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_packToFile_0100
     * @tc.name       SUB_MEDIA_IMAGE_packToFile_0100
     * @tc.desc       packToFile 枚举覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packToFile_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packToFile_0100';
      const orientations = [
        image.Orientation.TOP_LEFT,
        image.Orientation.TOP_RIGHT,
        image.Orientation.BOTTOM_RIGHT,
        image.Orientation.BOTTOM_LEFT,
        image.Orientation.LEFT_TOP,
        image.Orientation.RIGHT_TOP,
        image.Orientation.RIGHT_BOTTOM,
        image.Orientation.LEFT_BOTTOM,
      ];
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
      let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      for (const orientation of orientations) {
        try {
          const filePath = `${context.filesDir}/pack_output_${orientation}.jpg`;
          let file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            tiffPackingOptions: {
              orientation: orientation
            }
          };
          await imagePackerObj.packToFile(pictureObj, file.fd, packOpts);
          console.info(TAG, testName, 'Succeeded in packing the image to file.');
          expect(fileIo.accessSync(filePath)).assertTrue();
          fileIo.closeSync(file);
        } catch (error) {
          console.error(TAG, testName, `Failed to pack the image.code ${error.code},message is ${error.message}`);
          expect().assertFail();
        }
      }
      await imagePackerObj.release();
      pictureObj.release();
      await commodityPixelMap.release();
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_packToFile_0200
     * @tc.name       SUB_MEDIA_IMAGE_packToFile_0200
     * @tc.desc       packToFile 枚举覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packToFile_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packToFile_0200';
      const Level = [
        image.AntiAliasingLevel.NONE,
        image.AntiAliasingLevel.LOW,
        image.AntiAliasingLevel.MEDIUM,
        image.AntiAliasingLevel.HIGH,
      ];
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
      let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      for (const level of Level) {
        try {
          const filePath = `${context.filesDir}/pack_output_${level}.jpg`;
          let file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
          let packOpts: image.PackingOption = {
            format: "image/jpeg",
            quality: 98,
            desiredDynamicRange: image.PackingDynamicRange.AUTO,
            sizeLimit: {
              maxSize: { width: 0, height: 0 },
              level: level
            }
          };
          await imagePackerObj.packToFile(pictureObj, file.fd, packOpts);
          console.info(TAG, testName, 'Succeeded in packing the image to file.');
          expect(fileIo.accessSync(filePath)).assertTrue();
          fileIo.closeSync(file);
        } catch (error) {
          console.error(TAG, testName, `Failed to pack the image.code ${error.code},message is ${error.message}`);
          expect().assertFail();
        }
      }
      await imagePackerObj.release();
      pictureObj.release();
      await commodityPixelMap.release();
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_packToFile_0300
     * @tc.name       SUB_MEDIA_IMAGE_packToFile_0300
     * @tc.desc       packToFile needsPackGPS cover true
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packToFile_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packToFile_0300';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
      let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const filePath: string = context.filesDir + "/SUB_MEDIA_IMAGE_packToFile_0300.jpg";
        let file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackGPS: true
        };
        await imagePackerObj.packToFile(pictureObj, file.fd, packOpts);
        console.info(TAG, testName, 'Succeeded in packing the image to file.');
        expect(fileIo.accessSync(filePath)).assertTrue();
        fileIo.closeSync(file);
      } catch (error) {
        console.error(TAG, testName, `Failed to pack the image.code ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      await imagePackerObj.release();
      pictureObj.release();
      await commodityPixelMap.release();
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_packToFile_0400
     * @tc.name       SUB_MEDIA_IMAGE_packToFile_0400
     * @tc.desc       packToFile needsPackGPS cover false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_packToFile_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_packToFile_0400';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
      let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
      const imagePackerObj: image.ImagePacker = image.createImagePacker();
      try {
        const filePath: string = context.filesDir + "/SUB_MEDIA_IMAGE_packToFile_0400.jpg";
        let file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          desiredDynamicRange: image.PackingDynamicRange.AUTO,
          needsPackGPS: false
        };
        await imagePackerObj.packToFile(pictureObj, file.fd, packOpts);
        console.info(TAG, testName, 'Succeeded in packing the image to file.');
        expect(fileIo.accessSync(filePath)).assertTrue();
        fileIo.closeSync(file);
      } catch (error) {
        console.error(TAG, testName, `Failed to pack the image.code ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      await imagePackerObj.release();
      pictureObj.release();
      await commodityPixelMap.release();
      await imageSourceApi.release();
      done();
    })
  })
}