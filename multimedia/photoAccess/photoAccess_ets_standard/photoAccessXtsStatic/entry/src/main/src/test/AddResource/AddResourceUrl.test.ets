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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { AppStorage } from '@kit.ArkUI'
import { BusinessError } from '@ohos.base'
import { describe, it, expect, beforeAll, Level, afterAll, Hypium } from '../../../../hypium'
import { getPermission, sleep } from '../common'
import { Context } from '@kit.ArkUI'

function isEmpty(str: string | undefined | null | ESValue): boolean {
  return str === undefined || str === null || str === '';
}
let TAG = 'AddResourceChangeRequestUrlSuppTest';

let testContext: Context = Hypium.get('Context')! as Context;
let helper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext)!;

const addResourceFileUriImageErrorTest = async (done: () => void, testName: string,
  type: Object, fileUri: Object,
  callback: (errCode: number) => void): Promise<void> => {
  try {
    console.info(TAG + testName + 'Start');
    let photoType = photoAccessHelper.PhotoType.IMAGE;
    let extension = 'jpg';
    let path: string = '';
    if (typeof fileUri === 'string') {
      path = isEmpty(fileUri as string) ? fileUri as string :
        'file://' + testContext.filesDir + "/" + (fileUri as string);
    } else {
      path = fileUri as string;
    }
    let assetChangeRequest =
      photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension)!;
    assetChangeRequest.addResource(type as photoAccessHelper.ResourceType, path);
    console.info(TAG + testName + 'Success addResourceFileUriImageErrorTest');
    expect().assertFail();
    done();
  } catch (error) {
    console.error(TAG + testName + 'Failed addResourceFileUriImageErrorTest ' + error.code);
    callback(error.code);
    done();
  }
}
const addResourceFileUriVideoErrorTest =
  async (done: () => void, testName: string,
    type: Object, fileUri: Object,
    callback: (errCode: number) => void): Promise<void> => {
    try {
      console.info(TAG + testName + 'Start');
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      let path: string = '';
      if (typeof fileUri === 'string') {
        path = isEmpty(fileUri as string) ? fileUri as string :
          'file://' + testContext.filesDir + "/" + (fileUri as string);
      } else {
        path = fileUri as string;
      }
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension)!;
      assetChangeRequest.addResource(type as photoAccessHelper.ResourceType, path);
      console.info(TAG + testName + 'Success addResourceFileUriVideoErrorTest');
      expect().assertFail();
      done();
    } catch (error) {
      console.error(TAG + testName + 'Failed addResourceFileUriVideoErrorTest ' + error.code);
      callback(error.code);
      done();
    }
  }
const addResourceFileUriImageTest =
  async (done: () => void, testNum: string, type: photoAccessHelper.ResourceType, fileUri: string,
    type1: photoAccessHelper.ResourceType, fileUri1: string,
    callback: (errCode: number) => void): Promise<void> => {
    try {
      console.info(TAG + testNum + ' Start');
      let photoType = photoAccessHelper.PhotoType.IMAGE;
      let extension = 'jpg';
      const path = isEmpty(fileUri) ? fileUri : 'file://' + testContext.filesDir + "/" + fileUri;
      const path1 = isEmpty(fileUri1) ? fileUri1 : 'file://' + testContext.filesDir + "/" + fileUri1;
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension)!;
      assetChangeRequest.addResource(type, path);
      assetChangeRequest.addResource(type1, path1);
      console.info(TAG + testNum + ' Success addResourceFileUriImageTest');
      expect().assertFail();
      done();
    } catch (error) {
      console.error(TAG + testNum + ' Failed addResourceFileUriImageTest ' + error.code);
      callback(error.code);
      done();
    }
  }
const addResourceFileUriVideoTest =
  async (done: () => void, testNum: string, type: photoAccessHelper.ResourceType, fileUri: string,
    type1: photoAccessHelper.ResourceType, fileUri1: string,
    callback: (errCode: number) => void): Promise<void> => {
    try {
      console.info(TAG + testNum + ' Start');
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      const path = isEmpty(fileUri) ? fileUri : 'file://' + testContext.filesDir + "/" + fileUri;
      const path1 = isEmpty(fileUri1) ? fileUri1 : 'file://' + testContext.filesDir + "/" + fileUri1;
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension)!;
      assetChangeRequest.addResource(type, path);
      assetChangeRequest.addResource(type1, path1);
      console.info(TAG + testNum + ' Success addResourceFileUriVideoTest');
      expect().assertFail();
      done();
    } catch (error) {
      console.error(TAG + testNum + ' Failed addResourceFileUriVideoTest ' + error.code);
      callback(error.code);
      done();
    }
  }

const testInvalidResourceDataIMAGE =
  async (testNum: string, resourceType: Object, resourceData: Object, done: () => void,
    callback: (errCode: number) => void): Promise<void> => {
    try {
      console.info(TAG, testNum, 'Start');
      let photoType = photoAccessHelper.PhotoType.IMAGE;
      let extension = 'jpg';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension)!;
      assetChangeRequest.addResource(resourceType as photoAccessHelper.ResourceType, resourceData as ArrayBuffer);
      console.info(TAG, testNum, 'Success testInvalidResourceDataIMAGE');
      expect().assertFail();
      done();
    } catch (error) {
      console.error(TAG, testNum, `Failed testInvalidResourceDataIMAGE ${error.code}`);
      callback(error.code);
      done();
    }
  }
const testInvalidResourceDataIMAGE1 =
  async (testNum: string, done: () => void, fun: () => void, callback: (errCode: number) => void): Promise<void> => {
    try {
      console.info(TAG, testNum, 'Start');
      fun();
      console.info(TAG, testNum, 'Success testInvalidResourceDataIMAGE');
      expect().assertFail();
      done();
    } catch (error) {
      console.error(TAG, testNum, `Failed testInvalidResourceDataIMAGE ${error.code}`);
      callback(error.code);
      done();
    }
  }

const testInvalidResourceDataVIDEO =
  async (testNum: string, resourceType: Object, resourceData: Object,
    done: () => void, callback: (errCode: number) => void): Promise<void> => {
    try {
      console.info(TAG, testNum, 'Start');
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension)!;
      assetChangeRequest.addResource(resourceType as photoAccessHelper.ResourceType, resourceData as ArrayBuffer);
      console.info(TAG, testNum, 'Success testInvalidResourceDataVIDEO');
      expect().assertFail();
      done();
    } catch (error) {
      console.error(TAG, testNum, `Failed testInvalidResourceDataVIDEO ${error.code}`);
      callback(error.code);
      done();
    }
  }

const testInvalidResourceDataIVIDEO1 =
  async (testNum: string, done: () => void, fun: () => void, callback: (errCode: number) => void): Promise<void> => {
    try {
      console.info(TAG, testNum, 'Start');
      fun();
      console.info(TAG, testNum, 'Success testInvalidResourceDataIMAGE');
      expect().assertFail();
      done();
    } catch (error) {
      console.error(TAG, testNum, `Failed testInvalidResourceDataIMAGE ${error.code}`);
      callback(error.code);
      done();
    }
  }
const testInvalidIMAGE =
  async (testNum: string, resourceType: Object, resourceData: Object,
    done: () => void, resourceType1: Object, resourceData1: Object,
    callback: (errCode: number) => void): Promise<void> => {
    try {
      console.info(TAG, testNum, 'Start');
      let photoType = photoAccessHelper.PhotoType.IMAGE;
      let extension = 'jpg';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension)!;
      assetChangeRequest.addResource(resourceType as photoAccessHelper.ResourceType, resourceData as ArrayBuffer);
      assetChangeRequest.addResource(resourceType1 as photoAccessHelper.ResourceType, resourceData1 as ArrayBuffer);
      console.info(TAG, testNum, 'Success testInvalidIMAGE');
      expect().assertFail();
      done();
    } catch (error) {
      console.error(TAG, testNum, `Failed testInvalidIMAGE ${error.code}`);
      callback(error.code);
      done();
    }
  }
const testInvalidVIDEO =
  async (testNum: string, resourceType: Object, resourceData: Object,
    done: () => void, resourceType1: Object, resourceData1: Object,
    callback: (errCode: number) => void): Promise<void> => {
    try {
      console.info(TAG, testNum, 'Start');
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension)!;
      assetChangeRequest.addResource(resourceType as photoAccessHelper.ResourceType, resourceData as ArrayBuffer);
      assetChangeRequest.addResource(resourceType1 as photoAccessHelper.ResourceType, resourceData1 as ArrayBuffer);
      console.info(TAG, testNum, 'Success testInvalidIMAGE');
      expect().assertFail();
      done();
    } catch (error) {
      console.error(TAG, testNum, `Failed testInvalidIMAGE ${error.code}`);
      callback(error.code);
      done();
    }
  }

export default function AddResourceChangeRequestUrlSuppTest(): void {
  describe('AddResourceChangeRequestUrlSuppTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await getPermission();
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0300', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let maxEnum: number = 100;
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0300', maxEnum as Object,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(0);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0400', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0400', 1000 as Object,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(0);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0500', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0500', 0 as Object,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(0);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0600', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0600', -1 as Object,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(0);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0700', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0700', -1000 as Object,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(0);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0900', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_0900',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE, '', (errCode: number) => {
            expect(errCode).assertEqual(401);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_1000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_1000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_1000', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_1000',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, 'file://01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(13900002);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_1500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_1500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_1500', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_1500',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE, '', (errCode: number) => {
            expect(errCode).assertEqual(401);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_1600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_1600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_1600', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_1600',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE, 'file://01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_2100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_2100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_2100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_2100',
          photoAccessHelper.ResourceType.PHOTO_PROXY, '', (errCode: number) => {
            expect(errCode).assertEqual(401);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_2200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_2200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_2200', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_2200',
          photoAccessHelper.ResourceType.PHOTO_PROXY, 'file://01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_2700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_2700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_2700', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_2700',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, '', (errCode: number) => {
            expect(errCode).assertEqual(401);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_2800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_2800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_2800', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_2800',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, 'file://01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_3300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_3300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_3300', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_3300',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, 'file://01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_3400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_3400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_3400', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_3400',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, '', (errCode: number) => {
            expect(errCode).assertEqual(401);
          });
      });


    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_4100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_4100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_4100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let maxEnum: number = 100;
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_4100', maxEnum as Object,
          '01.mp4', (errCode: number) => {
            expect(errCode).assertEqual(0);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_4200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_4200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_4200', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_4200', 0 as Object,
          '01.mp4', (errCode: number) => {
            expect(errCode).assertEqual(0);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_4300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_4300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_4300', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_4300', -1 as Object,
          '01.mp4', (errCode: number) => {
            expect(errCode).assertEqual(0);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_5100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_5100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_5100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_5100',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE, '', (errCode: number) => {
            expect(errCode).assertEqual(13900002);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_5200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_5200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_5200', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_5200',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE, 'file://01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(13900002);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_5700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_5700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_5700', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_5700',
          photoAccessHelper.ResourceType.PHOTO_PROXY, '', (errCode: number) => {
            expect(errCode).assertEqual(401);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_5800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_5800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_5800', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_5800',
          photoAccessHelper.ResourceType.PHOTO_PROXY, 'file://test3.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_6300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_6300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_6300', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_6300',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, '', (errCode: number) => {
            expect(errCode).assertEqual(401);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_6400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_6400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_6400', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_6400',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, 'file://01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_6900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_6900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_6900', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_6900',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, '', (errCode: number) => {
            expect(errCode).assertEqual(401);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_7000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_7000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_7000', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_STATIC_7000',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, 'file://01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5300', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5300',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
          (errCode: number) => {
            expect(errCode).assertEqual(14000016);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5400', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5400',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE,
          '01.mp4', (errCode: number) => {
            expect(errCode).assertEqual(14000016);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5500', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5500',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
          photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
          (errCode: number) => {
            expect(errCode).assertEqual(14000016);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5600', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5600',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(14000016);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5700', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5700',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(14000016);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5800', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5800',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE,
          '01.mp4',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE,
          '01.mp4', (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5900', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_5900',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE,
          '01.mp4',
          photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
          (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6000', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6000',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE,
          '01.mp4',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6100',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE,
          '01.mp4',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6200', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6200',
          photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
          photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
          (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6300', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6300',
          photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6400', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6400',
          photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6500', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6500',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
          '01.jpg',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6600', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6600',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
          '01.jpg',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6700', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6700',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, '01.jpg',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6800', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6800',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
          (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6900', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_6900',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE,
          '01.mp4', (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7000', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7000',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
          photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
          (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7100',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7200', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7200',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7300', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7300',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE,
          '01.mp4',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE,
          '01.mp4', (errCode: number) => {
            expect(errCode).assertEqual(13900002);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7400', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7400',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE,
          '01.mp4',
          photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
          (errCode: number) => {
            expect(errCode).assertEqual(13900002);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7500', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7500',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE,
          '01.mp4',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(13900002);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7600', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7600',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE,
          '01.mp4',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(13900002);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7700', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7700',
          photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
          photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
          (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7800', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7800',
          photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7900', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_7900',
          photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_8000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_8000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_8000', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_8000',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
          '01.jpg',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_8100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_8100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_8100', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_8100',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
          '01.jpg',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_8200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_8200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_8200', Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_STATIC_8200',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
          '01.jpg',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
          '01.jpg', (errCode: number) => {
            expect(errCode).assertEqual(401);
          })
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_1300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_1300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_1300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_1300',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(0), done, (errCode: number) => {
          expect(errCode).assertEqual(401);
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_1700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_1700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_1700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_1700',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(0), done, (errCode: number) => {
          expect(errCode).assertEqual(401);
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_2100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_2100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_2100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_2100',
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(0), done, (errCode: number) => {
          expect(errCode).assertEqual(401);
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_2500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_2500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_2500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_2500',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(0), done, (errCode: number) => {
          expect(errCode).assertEqual(401);
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_2900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_2900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_2900', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_2900',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(0), done, (errCode: number) => {
          expect(errCode).assertEqual(401);
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_3300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_3300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_3300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_3300',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(0), done, (errCode: number) => {
          expect(errCode).assertEqual(401);
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_3700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_3700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_3700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_3700',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(0), done, (errCode: number) => {
          expect(errCode).assertEqual(401);
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_4100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_4100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_4100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_4100',
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(0), done, (errCode: number) => {
          expect(errCode).assertEqual(401);
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_4500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_4500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_4500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_4500',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(0), done, (errCode: number) => {
          expect(errCode).assertEqual(401);
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_4900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_4900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_4900', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_4900',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(0), done, (errCode: number) => {
          expect(errCode).assertEqual(401);
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5300',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(14000016);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5400',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(14000016);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5500',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(14000016);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5600',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(14000016);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5700',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(14000016);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5800', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5800',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5900', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_5900',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6000', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6000',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6100',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6200',
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6300',
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6400',
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6500',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6600',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6700',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6800', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6800',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6900', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_6900',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7000', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7000',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7100',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7200',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7300',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(14000016);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7400',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(14000016);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7500',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(14000016);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7600',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(14000016);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7700',
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7800', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7800',
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7900', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_7900',
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_8000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_8000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_8000', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_8000',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_8100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_8100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_8100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_8100',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_8200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_8200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_8200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_8200',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: number) => {
          expect(errCode).assertEqual(401);
        })
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_0700
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_0700
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_0700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let photoType = photoAccessHelper.PhotoType.IMAGE;
      let extension = 'jpg';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension)!;
      await testInvalidResourceDataIMAGE1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_0700', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, '' as string)
      }, (errCode: number) => {
        expect(errCode).assertEqual(401);
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_0800
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_0800
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_0800', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let photoType = photoAccessHelper.PhotoType.IMAGE;
      let extension = 'jpg';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension)!;
      await testInvalidResourceDataIMAGE1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_0800', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, '' as string)
      }, (errCode: number) => {
        expect(errCode).assertEqual(401);
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_0900
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_0900
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_0900', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension)!;
      await testInvalidResourceDataIVIDEO1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_0900', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, '')
      }, (errCode: number) => {
        expect(errCode).assertEqual(401);
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_1000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_1000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_1000', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension)!;
      await testInvalidResourceDataIVIDEO1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_1000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, '' as string)
      }, (errCode: number) => {
        expect(errCode).assertEqual(401);
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_1100
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_1100
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_1100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension)!;
      await testInvalidResourceDataIVIDEO1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_STATIC_1100', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, '' as string)
      }, (errCode: number) => {
        expect(errCode).assertEqual(401);
      });
    });
  });
}