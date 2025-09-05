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
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { getPermission, driveFn, LOG_TAG, fetchAllOption, sleep, isEmpty, copyImageToSandbox } from '../common';
import common from '@ohos.app.ability.common';
import { JSON } from '@kit.ArkTS';
import { Driver, MatchPattern, ON } from '@kit.TestKit';
import { dataSharePredicates } from '@kit.ArkData';



const TAG = LOG_TAG + 'requestImageDataSupp';

class MediaDataHandler implements photoAccessHelper.MediaAssetDataHandler<ArrayBuffer> {
  onDataPrepared(data: ArrayBuffer) {
    if (data === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    console.info('on image data prepared');
  }
}


async function requestImageDataPromiseTest(done: Function, testName: string, fetchOptions: photoAccessHelper.FetchOptions,
  requestOptions: photoAccessHelper.RequestOptions,callback: (errCode: number) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  const handler = new MediaDataHandler();
  try {
    let fetchResult = await phAccessHelper.getAssets(fetchOptions);
    console.info(TAG, 'fetchResult success');
    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    console.info(TAG, 'photoAsset success',photoAsset);
    let requestId = await  photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler);
    console.info(TAG, 'requestImageData successfully',requestId);
    expect().assertFail();
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    callback(error.code)
  }
  done();
}


let power: ESObject;

export default function MediaAssetManagerRequestImageDataTest() {
  describe('MediaAssetManagerRequestImageDataTest', () => {
    let dr = Driver.create();
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
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
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_001
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_001
     * @tc.desc      : requestImageDataPromiseTest deliveryMode -1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_001';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode:-1,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_001 + requestImagePromiseTest: " + requestImageDataPromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_002
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_002
     * @tc.desc      : requestImageDataPromiseTest deliveryMode 3
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_002';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode:3,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_002 + requestImageDataPromiseTest: " + requestImageDataPromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_003
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_003
     * @tc.desc      : requestImageDataPromiseTest input deliveryMode is -10000
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_003';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: -10000,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_003 + requestImageDataPromiseTest: " + requestImageDataPromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_004
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_004
     * @tc.desc      : requestImageDataPromiseTest compatibleMode -1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_004';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        compatibleMode: -1,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_004 + requestImageDataPromiseTest: " + requestImageDataPromiseTest);
      done();
    })

    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_005
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_005
     * @tc.desc      : requestImageDataPromiseTest compatibleMode 2
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_005';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        compatibleMode: 2,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_005 + requestImageDataPromiseTest: " + requestImageDataPromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_006
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_006
     * @tc.desc      : requestImageDataPromiseTest compatibleMode undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_006';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        compatibleMode: undefined,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_006 + requestImageDataPromiseTest: " + requestImageDataPromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_007
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_007
     * @tc.desc      : requestImageDataPromiseTest mediaAssetProgressHandler undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_007';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        mediaAssetProgressHandler:undefined,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_007 + requestImageDataPromiseTest: " + requestImageDataPromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_008
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_008
     * @tc.desc      : requestImageDataPromiseTest mediaAssetProgressHandler all negative
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_008';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: -1,
        compatibleMode: -1,
        mediaAssetProgressHandler:undefined,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_008 + requestImageDataPromiseTest: " + requestImageDataPromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_009
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_009
     * @tc.desc      : requestImageDataPromiseTest mediaAssetProgressHandler all max+1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_009';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: 2,
        compatibleMode: 3,
        mediaAssetProgressHandler:undefined,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_009 + requestImageDataPromiseTest: " + requestImageDataPromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0010
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0010
     * @tc.desc      : requestImageDataPromiseTest predicates is error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0010';
      const fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['uri', 'title'],
        predicates: AppStorage.get('') as dataSharePredicates.DataSharePredicates
      };
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: 2,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode == 14000011).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0010 + requestImageDataPromiseTest: " + requestImageDataPromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0011
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0011
     * @tc.desc      : requestImageDataPromiseTest fetchColumns is ['']
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0011';
      const fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates:  new dataSharePredicates.DataSharePredicates()
      };
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: 2,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode == 13900020).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0011 + requestImageDataPromiseTest: " + requestImageDataPromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0012
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0012
     * @tc.desc      : requestImageDataPromiseTest fetchColumns ['text']
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0012';
      const fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['text'],
        predicates:  new dataSharePredicates.DataSharePredicates()
      };
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: 2,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode == 13900020).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0012 + requestImageDataPromiseTest: " + requestImageDataPromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0013
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0013
     * @tc.desc      : requestImageDataPromiseTest asset null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0013', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0013';
      const handler = new MediaDataHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: 2,
      };
      try {
        let requestId = await  photoAccessHelper.MediaAssetManager.requestImageData(testContext, null, requestOptions, handler);
        console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0013 + requestId: " + requestId);
        expect().assertFail();
      }
      catch (err) {
        console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0013 + requestImageDataPromiseTest: " + err.code);
        expect(err.code == 401).assertTrue()
      }
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0014
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0014
     * @tc.desc      : requestImageDataPromiseTest asset undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0014', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0014';
      const handler = new MediaDataHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: 2,
      };
      try {
        let requestId = await  photoAccessHelper.MediaAssetManager.requestImageData(testContext, undefined, requestOptions, handler);
        console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0014 + requestId: " + requestId);
        expect().assertFail();
      }
      catch (err) {
        console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0014 + requestImageDataPromiseTest: " + err.code);
        expect(err.code == 401).assertTrue()
      }
      done();
    })
  })
}