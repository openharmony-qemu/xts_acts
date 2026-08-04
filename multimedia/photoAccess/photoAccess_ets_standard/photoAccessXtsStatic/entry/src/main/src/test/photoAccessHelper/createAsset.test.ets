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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll, Hypium } from '../../../../hypium/index';
import { getPermission, LOG_TAG } from '../common';
import { BusinessError } from '@kit.BasicServicesKit';
import { Context } from '@kit.ArkUI';

const TAG = LOG_TAG + 'createAssetTest';

let testContext: Context = Hypium.get('Context') as Context;
const helper = photoAccessHelper.getPhotoAccessHelper(testContext);


export default function createAssetTest(): void {
  describe('createAssetTest', () => {
    const testTitle = 'createAssetTest';

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      await getPermission();
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
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0010
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0010
     * @tc.desc   callback, image, with options, extension->jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0010';
      console.info(TAG, testName);
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      try {
        helper!.createAsset(photoAccessHelper.PhotoType.IMAGE, 'jpg', options,
          (error: BusinessError<void> | null, uri: string | undefined) => {
            expect(uri!.length > 0).assertTrue();
            console.info(TAG, `createAsset success, uri: ${uri}`);
            done();
          })
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0030
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0030
     * @tc.desc   callback, image, with options, extension->jpg, subtype->MOVING_PHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0030';
      console.info(TAG, testName);
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
      };
      try {
        helper!.createAsset(photoAccessHelper.PhotoType.IMAGE, 'jpg', options,
          (error: BusinessError<void> | null, uri: string | undefined) => {
            expect(uri!.length > 0).assertTrue();
            console.info(TAG, `createAsset success, uri: ${uri}`);
            done();
          })
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0040
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0040
     * @tc.desc   callback, image, with options, extension->jpg, subtype->BURST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0040';
      console.info(TAG, testName);
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.BURST
      };
      try {
        helper!.createAsset(photoAccessHelper.PhotoType.IMAGE, 'jpg', options,
          (error: BusinessError<void> | null, uri: string | undefined) => {
            expect(uri!.length > 0).assertTrue();
            console.info(TAG, `createAsset success, uri: ${uri}`);
            done();
          })
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0050
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0050
     * @tc.desc   callback, video, with options, extension->mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0050';
      console.info(TAG, testName);
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      try {
        helper!.createAsset(photoAccessHelper.PhotoType.VIDEO, 'mp4', options,
          (error: BusinessError<void> | null, uri: string | undefined) => {
            expect(uri!.length > 0).assertTrue();
            console.info(TAG, `createAsset success, uri: ${uri}`);
            done();
          })
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0070
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0070
     * @tc.desc   callback, video, with options, extension->mp4, subtype->MOVING_PHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0070', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0070';
      console.info(TAG, testName);
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
      };
      try {
        helper!.createAsset(photoAccessHelper.PhotoType.VIDEO, 'mp4', options,
          (error: BusinessError<void> | null, uri: string | undefined) => {
            expect(uri!.length > 0).assertTrue();
            console.info(TAG, `createAsset success, uri: ${uri}`);
            done();
          })
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0080
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0080
     * @tc.desc   callback, video, with options, extension->mp4, subtype->BURST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0080', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0080';
      console.info(TAG, testName);
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.BURST
      };
      try {
        helper!.createAsset(photoAccessHelper.PhotoType.VIDEO, 'mp4', options,
          (error: BusinessError<void> | null, uri: string | undefined) => {
            expect(uri!.length > 0).assertTrue();
            console.info(TAG, `createAsset success, uri: ${uri}`);
            done();
          })
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0090
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0090
     * @tc.desc   callback, image, extension->jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0090', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0090';
      console.info(TAG, testName);
      try {
        helper!.createAsset(photoAccessHelper.PhotoType.IMAGE, 'jpg',
          (error: BusinessError<void> | null, uri: string | undefined) => {
            expect(uri!.length > 0).assertTrue();
            console.info(TAG, `createAsset success, uri: ${uri}`);
            done();
          })
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0110
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0110
     * @tc.desc   callback, video, extension->mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0110', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0110';
      console.info(TAG, testName);
      try {
        helper!.createAsset(photoAccessHelper.PhotoType.VIDEO, 'mp4',
          (error: BusinessError<void> | null, uri: string | undefined) => {
            expect(uri!.length > 0).assertTrue();
            console.info(TAG, `createAsset success, uri: ${uri}`);
            done();
          })
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0130
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0130
     * @tc.desc   promise, image, with options, extension->jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0130', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0130';
      console.info(TAG, testName);
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      try {
        const uri = await helper!.createAsset(photoAccessHelper.PhotoType.IMAGE, 'jpg', options);
        expect(uri.toString().includes('file:')).assertTrue();
        console.info(TAG,testName, `createAsset success; uri: ${uri}`);
        done();
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0140
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0140
     * @tc.desc   promise, image, with options, extension->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0140', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0140';
      console.info(TAG, testName);
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      try {
        const uri = await helper!.createAsset(photoAccessHelper.PhotoType.IMAGE, 'invalid', options);
        expect().assertFail();
        console.info(TAG,testName, `createAsset success; uri: ${uri}`);
        done();
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0150
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0150
     * @tc.desc   promise, image, with options, extension->jpg, subtype->MOVING_PHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0150', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0150';
      console.info(TAG, testName);
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
      };
      try {
        const uri = await helper!.createAsset(photoAccessHelper.PhotoType.IMAGE, 'jpg', options);
        expect(uri.toString().includes('file:')).assertTrue();
        console.info(TAG,testName, `createAsset success; uri: ${uri}`);
        done();
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0160
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0160
     * @tc.desc   promise, image, with options, extension->jpg, subtype->BURST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0160', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0160';
      console.info(TAG, testName);
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.BURST
      };
      try {
        const uri = await helper!.createAsset(photoAccessHelper.PhotoType.IMAGE, 'jpg', options);
        expect(uri.toString().includes('file:')).assertTrue();
        console.info(TAG,testName, `createAsset success; uri: ${uri}`);
        done();
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0170
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0170
     * @tc.desc   promise, video, with options, extension->mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0170', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0170';
      console.info(TAG, testName);
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      try {
        const uri = await helper!.createAsset(photoAccessHelper.PhotoType.VIDEO, 'mp4', options);
        expect(uri.toString().includes('file:')).assertTrue();
        console.info(TAG,testName, `createAsset success; uri: ${uri}`);
        done();
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0180
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0180
     * @tc.desc   promise, video, with options, extension->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0180', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0180';
      console.info(TAG, testName);
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle
      };
      try {
        const uri = await helper!.createAsset(photoAccessHelper.PhotoType.VIDEO, 'invalid', options);
        expect().assertFail();
        console.info(TAG,testName, `createAsset success; uri: ${uri}`);
        done();
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0190
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0190
     * @tc.desc   promise, video, with options, extension->mp4, subtype->MOVING_PHOTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0190', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0190';
      console.info(TAG, testName);
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
      };
      try {
        const uri = await helper!.createAsset(photoAccessHelper.PhotoType.VIDEO, 'mp4', options);
        expect(uri.toString().includes('file:')).assertTrue();
        console.info(TAG,testName, `createAsset success; uri: ${uri}`);
        done();
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0200
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0200
     * @tc.desc   promise, video, with options, extension->mp4, subtype->BURST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0200';
      console.info(TAG, testName);
      const options: photoAccessHelper.CreateOptions = {
        title: testTitle,
        subtype: photoAccessHelper.PhotoSubtype.BURST
      };
      try {
        const uri = await helper!.createAsset(photoAccessHelper.PhotoType.VIDEO, 'mp4', options);
        expect(uri.toString().includes('file:')).assertTrue();
        console.info(TAG,testName, `createAsset success; uri: ${uri}`);
        done();
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0210
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0210
     * @tc.desc   promise, image, extension->jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0210', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0210';
      console.info(TAG, testName);

      try {
        const uri = await helper!.createAsset(photoAccessHelper.PhotoType.IMAGE, 'jpg');
        expect(uri.toString().includes('file:')).assertTrue();
        console.info(TAG,testName, `createAsset success; uri: ${uri}`);
        done();
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0220
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0220
     * @tc.desc   promise, image, extension->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0220', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0220';
      console.info(TAG, testName);
      try {
        await helper!.createAsset(photoAccessHelper.PhotoType.IMAGE, 'invalid');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0230
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0230
     * @tc.desc   promise, video, extension->mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0230', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0230';
      console.info(TAG, testName);
      try {
        const uri = await helper!.createAsset(photoAccessHelper.PhotoType.VIDEO, 'mp4');
        expect(uri.toString().includes('file:')).assertTrue();
        console.info(TAG,testName, `createAsset success; uri: ${uri}`);
        done();
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0240
     * @tc.number SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0240
     * @tc.desc   promise, video, extension->invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0240', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_STATIC_0240';
      console.info(TAG, testName);
      try {
        await helper!.createAsset(photoAccessHelper.PhotoType.VIDEO, 'invalid');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `createAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

  })
}