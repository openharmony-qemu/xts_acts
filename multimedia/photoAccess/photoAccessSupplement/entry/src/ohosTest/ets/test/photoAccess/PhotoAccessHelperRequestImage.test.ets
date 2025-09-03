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
import { image } from '@kit.ImageKit';
import { JSON } from '@kit.ArkTS';
import { Driver, MatchPattern, ON } from '@kit.TestKit';
import { dataSharePredicates } from '@kit.ArkData';


const TAG = LOG_TAG + 'requestImageSupp';

class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<image.ImageSource> {
  onDataPrepared(data: image.ImageSource) {
    if (data === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    console.info('on image data prepared');
  }
}

class MediaDataHandler implements photoAccessHelper.MediaAssetDataHandler<ArrayBuffer> {
  onDataPrepared(data: ArrayBuffer) {
    if (data === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    console.info('on image data prepared');
  }
}
class QuickImageDataHandler implements photoAccessHelper.QuickImageDataHandler<image.Picture> {
  onDataPrepared(data: image.Picture, imageSource: image.ImageSource, map: Map<string, string>) {
    console.info('on image data prepared');
  }
}

async function requestImagePromiseTest(done: Function, testName: string, fetchOptions: photoAccessHelper.FetchOptions,
  requestOptions: photoAccessHelper.RequestOptions, callback: (errCode: number) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  console.info(TAG, 'testContext successfully', JSON.stringify(testContext));
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  console.info(TAG, 'phAccessHelper successfully', phAccessHelper);
  const handler = new MediaHandler();
  try {
    let fetchResult = await phAccessHelper.getAssets(fetchOptions);
    console.info(TAG, 'fetchResult success');
    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    console.info(TAG, 'photoAsset success',photoAsset);
    let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler);
    console.info(TAG, 'requestImage successfully', requestId);
    expect().assertFail();
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, error.code);
    callback(error.code)
  }
  done();
}

async function requestQuickRequestImageTest(done: Function, testName: string, fetchOptions: photoAccessHelper.FetchOptions,
  requestOptions: photoAccessHelper.RequestOptions|null|undefined,callback: (errCode: number) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  const handler = new QuickImageDataHandler();
  try {
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      console.info(TAG, 'fetchResult success');
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      console.info(TAG, 'photoAsset success',photoAsset);
    let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler);
    console.info(TAG, 'quickRequestImage successfully',requestId);
    expect().assertFail();
  } catch (error) {
    console.info(TAG, `failed; error: ${error.code}`, testName);
    callback(error.code)
  }
  done();
}


let power: ESObject;

export default function MediaAssetManagerRequestImageTest() {
  describe('MediaAssetManagerRequestImageTest', () => {
    let dr = Driver.create();
    const imageDisplayName = 'testGetAsset.jpg';
    const videoDisplayName = 'testGetAsset.mp4';
    const abnormalDisplayName = 'text';
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
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
     * @tc.number    : MEDIA_ASSET_MANAGER_REQUEST_ERROR_001
     * @tc.name      : MEDIA_ASSET_MANAGER_REQUEST_ERROR_001
     * @tc.desc      : requestImagePromiseTest RequestOptions deliveryMode max+1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_001';
      const testContext=''
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode:3,
        };
      await requestImagePromiseTest(done, testName,fetchOptions, requestOptions, (errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_REQUEST_ERROR_001+requestImagePromiseTest: " + requestImagePromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_REQUEST_ERROR_002
     * @tc.name      : MEDIA_ASSET_MANAGER_REQUEST_ERROR_002
     * @tc.desc      : requestImagePromiseTest RequestOptions deliveryMode -1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_002';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode:-1,
      };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_REQUEST_ERROR_002+requestImagePromiseTest: " + requestImagePromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_REQUEST_ERROR_003
     * @tc.name      : MEDIA_ASSET_MANAGER_REQUEST_ERROR_003
     * @tc.desc      : requestImagePromiseTest RequestOptions deliveryMode -1000
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_003';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode:-1000,
      };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_REQUEST_ERROR_003+requestImagePromiseTest: " + requestImagePromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_REQUEST_ERROR_004
     * @tc.name      : MEDIA_ASSET_MANAGER_REQUEST_ERROR_004
     * @tc.desc      : requestImagePromiseTest RequestOptions compatibleMode -1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_004';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        compatibleMode: -1,
      };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_REQUEST_ERROR_004+requestImagePromiseTest: " + requestImagePromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_REQUEST_ERROR_005
     * @tc.name      : MEDIA_ASSET_MANAGER_REQUEST_ERROR_005
     * @tc.desc      : requestImagePromiseTest RequestOptions compatibleMode max+1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_005';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        compatibleMode: 2
      };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_REQUEST_ERROR_005+requestImagePromiseTest: " + requestImagePromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_REQUEST_ERROR_006
     * @tc.name      : MEDIA_ASSET_MANAGER_REQUEST_ERROR_006
     * @tc.desc      : requestImagePromiseTest RequestOptions compatibleMode undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_006';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions =
        {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
          compatibleMode: undefined,
        };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_REQUEST_ERROR_006+requestImagePromiseTest: " + requestImagePromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_REQUEST_ERROR_007
     * @tc.name      : MEDIA_ASSET_MANAGER_REQUEST_ERROR_007
     * @tc.desc      : requestImagePromiseTest RequestOptions mediaAssetProgressHandler undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_007';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions =
        {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
          mediaAssetProgressHandler:undefined,
        };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_REQUEST_ERROR_007+requestImagePromiseTest: " + requestImagePromiseTest);
      done();
    })

    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_REQUEST_ERROR_008
     * @tc.name      : MEDIA_ASSET_MANAGER_REQUEST_ERROR_008
     * @tc.desc      : requestImagePromiseTest RequestOptions mediaAssetProgressHandler all negative
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_008';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions =
        {
          deliveryMode:-1,
          compatibleMode: -1,
          mediaAssetProgressHandler:undefined,
        };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_REQUEST_ERROR_008 + requestImagePromiseTest: " + requestImagePromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_REQUEST_ERROR_009
     * @tc.name      : MEDIA_ASSET_MANAGER_REQUEST_ERROR_009
     * @tc.desc      : requestImagePromiseTest RequestOptions mediaAssetProgressHandler all max+1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_009';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions =
        {
          deliveryMode:3,
          compatibleMode: 2,
          mediaAssetProgressHandler:undefined,
        };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_REQUEST_ERROR_009 + requestImagePromiseTest: " + requestImagePromiseTest);
      done();
    })

    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_REQUEST_ERROR_010
     * @tc.name      : MEDIA_ASSET_MANAGER_REQUEST_ERROR_010
     * @tc.desc      : requestImagePromiseTest fetchColumns is ['']
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_010';
      const fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates:  new dataSharePredicates.DataSharePredicates()
      };
      let requestOptions: photoAccessHelper.RequestOptions =
        {
          deliveryMode:3,
        };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode == 13900020).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_REQUEST_ERROR_010 + requestImagePromiseTest: " + requestImagePromiseTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_REQUEST_ERROR_011
     * @tc.name      : MEDIA_ASSET_MANAGER_REQUEST_ERROR_011
     * @tc.desc      : requestImagePromiseTest fetchColumns is ['text']
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_011';
      const fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['text'],
        predicates:  new dataSharePredicates.DataSharePredicates()
      };
      let requestOptions: photoAccessHelper.RequestOptions =
        {
          deliveryMode:3,
        };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode == 13900020).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_REQUEST_ERROR_011 + requestImagePromiseTest: " + requestImagePromiseTest);
      done();
    })

    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_REQUEST_ERROR_012
     * @tc.name      : MEDIA_ASSET_MANAGER_REQUEST_ERROR_012
     * @tc.desc      : requestImagePromiseTest predicates is error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_012';
      const fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['uri', 'title'],
        predicates: AppStorage.get('') as dataSharePredicates.DataSharePredicates
      };
      let requestOptions: photoAccessHelper.RequestOptions =
        {
          deliveryMode:3,
        };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode == 14000011).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_REQUEST_ERROR_012 + requestImagePromiseTest: " + requestImagePromiseTest);
      done();
    })

    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_REQUEST_ERROR_0013
     * @tc.name      : MEDIA_ASSET_MANAGER_REQUEST_ERROR_0013
     * @tc.desc      : requestImagePromiseTest RequestOptions asset null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_0013', Level.LEVEL0, async (done: Function) => {
      const handler = new MediaHandler();
      let requestOptions: photoAccessHelper.RequestOptions =
        {
          deliveryMode:3,
        };
      try {
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, null, requestOptions, handler);
        console.info(TAG, 'requestImage successfully', requestId);
        expect().assertFail();
      } catch (err) {
        console.info(TAG + "MEDIA_ASSET_MANAGER_REQUEST_ERROR_0013 + requestImagePromiseTest: " + err.code);
        expect(err.code == 401).assertTrue()
      }
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_REQUEST_ERROR_0014
     * @tc.name      : MEDIA_ASSET_MANAGER_REQUEST_ERROR_0014
     * @tc.desc      : requestImagePromiseTest RequestOptions asset undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_0014', Level.LEVEL0, async (done: Function) => {
      const handler = new MediaHandler();
      let requestOptions: photoAccessHelper.RequestOptions =
        {
          deliveryMode:3,
        };
      try {
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, undefined, requestOptions, handler);
        console.info(TAG, 'requestImage successfully', requestId);
        expect().assertFail();
      } catch (err) {
        console.info(TAG + "MEDIA_ASSET_MANAGER_REQUEST_ERROR_0014 + requestImagePromiseTest: " + err.code);
        expect(err.code == 401).assertTrue()
      }
      done();
    })



    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_001
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_001
     * @tc.desc      : quickRequestImage input deliveryMode is -10000
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_001';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: -10000,
      };
      await requestQuickRequestImageTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_001 + quickRequestImage: " + requestQuickRequestImageTest);
      done();
    })

    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_002
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_002
     * @tc.desc      : quickRequestImage input deliveryMode is -1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_002';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: -1,
      };
      await requestQuickRequestImageTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_002 + quickRequestImage: " + requestQuickRequestImageTest);
      done();
    })

    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_003
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_003
     * @tc.desc      : quickRequestImage input deliveryMode is 3
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_003';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: 3,
      };
      await requestQuickRequestImageTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_003 + quickRequestImage: " + requestQuickRequestImageTest);
      done();
    })

    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_004
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_004
     * @tc.desc      : quickRequestImage input fetchColumns is " "
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_004';
      const fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      await requestQuickRequestImageTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode == 13900020).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_004 + quickRequestImage: " + requestQuickRequestImageTest);
      done();
    })

    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_005
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_005
     * @tc.desc      : quickRequestImage input fetchColumns is ['text']
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'qMEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_005';
      const fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['text'],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      await requestQuickRequestImageTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode == 13900020 ).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_005 + quickRequestImage: " + requestQuickRequestImageTest);
      done();
    })

    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_006
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_006
     * @tc.desc      : quickRequestImage input predicates is error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_006';
      const fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['uri', 'title'],
        predicates: AppStorage.get('') as dataSharePredicates.DataSharePredicates
      };
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      await requestQuickRequestImageTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode == 14000011).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_006 + quickRequestImage: " + requestQuickRequestImageTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_007
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_007
     * @tc.desc      : quickRequestImage input requestOptions is null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_007';
      const fetchOptions = fetchAllOption();
      await requestQuickRequestImageTest(done, testName, fetchOptions, null,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_007 + quickRequestImage: " + requestQuickRequestImageTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_008
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_008
     * @tc.desc      : quickRequestImage input requestOptions is undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_008';
      const fetchOptions = fetchAllOption();
      await requestQuickRequestImageTest(done, testName, fetchOptions, undefined,(errCode) => {
        expect(errCode == 401).assertTrue()
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_008 + quickRequestImage: " + requestQuickRequestImageTest);
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_009
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_009
     * @tc.desc      : quickRequestImage input photoAsset is undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_009', Level.LEVEL0, async (done: Function) => {
      const handler = new QuickImageDataHandler();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      try {
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, undefined, requestOptions, handler);
        console.info(TAG, 'quickRequestImage successfully',requestId);
        expect().assertFail();
      }catch (err) {
        console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_009 + quickRequestImage: " + err.code);
        expect(err.code == 401).assertTrue()
      }
      done();
    })
    /**
     * @tc.number    : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_0010
     * @tc.name      : MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_0010
     * @tc.desc      : quickRequestImage input photoAsset is null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_0010', Level.LEVEL0, async (done: Function) => {
      const handler = new QuickImageDataHandler();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      try {
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, null, requestOptions, handler);
        console.info(TAG, 'quickRequestImage successfully',requestId);
        expect().assertFail();
      }catch (err) {
        console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_0010 + quickRequestImage: " + err.code);
        expect(err.code == 401).assertTrue()
      }
      done();
    })
  })
}