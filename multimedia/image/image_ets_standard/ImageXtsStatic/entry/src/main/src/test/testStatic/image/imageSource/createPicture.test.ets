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

import { image } from '@kit.ImageKit';
import { Context } from '@kit.AbilityKit';
import {afterAll,afterEach,beforeAll,beforeEach,describe,expect,Hypium, it, Level } from '@ohos/hypium-binary/src/main/indexStatic';

const TAG = 'xts.createPicture';

export default function CreatePictureTestSupp(): void {
  describe('CreatePictureTestSupp', () => {
    let context: Context = Hypium.get("Context") as Context;

    const getFilePath = async (fileName: string): Promise<string> => {
      let filePath = context.filesDir + "/" + fileName;
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
     * @tc.name   SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0100
     * @tc.number SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0100
     * @tc.desc   imageSource_createPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0100';
      let options: image.DecodingOptionsForPicture = {
        desiredAuxiliaryPictures: [image.AuxiliaryPictureType.GAINMAP]
      };
      try {
        let filePath = await getFilePath("test.jpeg");
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath);
        let pictureObj: image.Picture | undefined = await imageSourceApi!.createPicture(options);
        console.info(TAG, 'pictureObj', pictureObj);
        expect(pictureObj != null).assertTrue();
        await imageSourceApi!.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0200
     * @tc.number SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0200
     * @tc.desc   imageSource_createPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0200';
      let options: image.DecodingOptionsForPicture = {
        desiredAuxiliaryPictures: [image.AuxiliaryPictureType.DEPTH_MAP]
      };
      try {
        let filePath = await getFilePath("test.jpeg");
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath);
        let pictureObj: image.Picture | undefined = await imageSourceApi!.createPicture(options);
        console.info(TAG, 'pictureObj', pictureObj);
        expect(pictureObj != null).assertTrue();
        await imageSourceApi!.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0300
     * @tc.number SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0300
     * @tc.desc   imageSource_createPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0300';
      let options: image.DecodingOptionsForPicture = {
        desiredAuxiliaryPictures: [image.AuxiliaryPictureType.UNREFOCUS_MAP]
      };
      try {
        let filePath = await getFilePath("test.jpeg");
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath);
        let pictureObj: image.Picture | undefined = await imageSourceApi!.createPicture(options);
        console.info(TAG, 'pictureObj', pictureObj);
        expect(pictureObj != null).assertTrue();
        await imageSourceApi!.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0400
     * @tc.number SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0400
     * @tc.desc   imageSource_createPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0400';
      let options: image.DecodingOptionsForPicture = {
        desiredAuxiliaryPictures: [image.AuxiliaryPictureType.LINEAR_MAP]
      };
      try {
        let filePath = await getFilePath("test.jpeg");
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath);
        let pictureObj: image.Picture | undefined = await imageSourceApi!.createPicture(options);
        console.info(TAG, 'pictureObj', pictureObj);
        expect(pictureObj != null).assertTrue();
        await imageSourceApi!.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0500
     * @tc.number SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0500
     * @tc.desc   imageSource_createPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IAMGE_CREATE_PICTURE_static_0500';
      let options: image.DecodingOptionsForPicture = {
        desiredAuxiliaryPictures: [image.AuxiliaryPictureType.FRAGMENT_MAP]
      };
      try {
        let filePath = await getFilePath("test.jpeg");
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath);
        let pictureObj: image.Picture | undefined = await imageSourceApi!.createPicture(options);
        console.info(TAG, 'pictureObj', pictureObj);
        expect(pictureObj != null).assertTrue();
        await imageSourceApi!.release();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })
  })
}