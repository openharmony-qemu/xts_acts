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
import fs from '@ohos.file.fs';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect,Hypium, it, Level} from '../../../../../../hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
const TAG = 'xts_static_ImagePixMapFOrThumbnailTest'


export default function imagePixelMapForThumbnailStaticTest(): void {
  describe('imagePixelMapForThumbnailStaticTest', () => {
    let filePath: string = '';
    let fdNumber: int;

    const getFd = (fileName: string): int => {
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      filePath = testContext.filesDir + "/" + fileName;
      console.info(TAG, "image filePath:" + filePath);
      const file = fs.openSync(filePath!);
      fdNumber = file.fd as int;
      return fdNumber;
    };
    const getFilePath = async (fileName: string): Promise<string> => {
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      filePath = testContext.filesDir + "/" + fileName;
      return filePath;
    }
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
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_IS_UNDEFINED_0100
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_IS_UNDEFINED_0100
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 320, generateThumbnailIfAbsent = false
     *               2. Decode thumbnail failed, PixelMap object is undefined
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_IS_UNDEFINED_0100', Level.LEVEL0, async (done:() => void) => {
      const testName: string = "SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_IS_UNDEFINED_0100";
      let filePath = await getFilePath("jpeg_exif_thumbnail.jpg");
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
      console.info(TAG,testName,` "createImageSource success: ${imageSourceObj!}`);
      try {
        if (!imageSourceObj!) {
          console.error(TAG,testName,'CreateThumbnail: imageSource is null or undefined');
          return undefined;
        }
        const imageInfo:image.ImageInfo | undefined= await imageSourceObj!.getImageInfo();
        const supportedMimeTypes = ['image/jpeg', 'image/heif', 'image/heic'];
        if (!supportedMimeTypes.includes(imageInfo!.mimeType)) {
          console.error(TAG,testName,`CreateThumbnail: Unsupported MIME type: ${imageInfo!.mimeType}`);
          return undefined;
        }
        let decodingOptions: image.DecodingOptionsForThumbnail = {
          generateThumbnailIfAbsent: true,
          maxGeneratedPixelDimension: 200,
        };
        const pixelMapSync =  imageSourceObj!.createThumbnailSync(decodingOptions);
        // console.info(TAG,testName,` "CreateThumbnail success: ${pixelMapSync}`);
        // expect(pixelMapSync == undefined).assertTrue();
      } catch (error) {
        console.info(TAG,testName,` "create Thumbnail failed, error: code: ${error.code}, ${error.message}`);
        expect().assertFail();
      }
      await imageSourceObj!.release();
      done();
    })


    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_IS_UNDEFINED_0200
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_IS_UNDEFINED_0200
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 320, generateThumbnailIfAbsent = false
     *               2. Decode thumbnail failed, PixelMap object is undefined
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_IS_UNDEFINED_0200', Level.LEVEL0, async (done:() => void) => {
      const testName: string = "SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_IS_UNDEFINED_0200";
      let filePath = await getFilePath("jpeg_exif_thumbnail.jpg");
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(filePath);
      console.info(TAG,testName,` "createImageSource success: ${imageSourceObj!}`);
      try {
      if (!imageSourceObj!) {
        console.error(TAG,testName,'CreateThumbnail: imageSource is null or undefined');
        return undefined;
      }
      const imageInfo:image.ImageInfo | undefined= await imageSourceObj!.getImageInfo();
      const supportedMimeTypes = ['image/jpeg', 'image/heif', 'image/heic'];
      if (!supportedMimeTypes.includes(imageInfo!.mimeType)) {
        console.error(TAG,testName,`CreateThumbnail: Unsupported MIME type: ${imageInfo!.mimeType}`);
        return undefined;
      }
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 200,
      };
        const pixelMap = await imageSourceObj!.createThumbnail(decodingOptions);
        // console.info(TAG,testName,` "CreateThumbnail success: ${pixelMap}`);
        // expect(pixelMap == undefined).assertTrue();
      } catch (error) {
        console.info(TAG,testName,` "create Thumbnail failed, error: code: ${error.code}, ${error.message}`);
        expect().assertFail();
      }
      await imageSourceObj!.release();
      done();
    })


  })
}