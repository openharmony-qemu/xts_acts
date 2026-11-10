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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Hypium } from '@ohos/hypium-static/src/main/indexStatic';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import { Context } from '@kit.AbilityKit';
import common from '@ohos.app.ability.common';

const TAG = 'ImageSource.getDelayTimeList'
let fdNumber: int;

async function getFd(fileName: string): Promise<int> {
  let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
  let filesDir: string | undefined | null;
  let filePath: string = '';
  filePath = testContext.filesDir + "/" + fileName;
  console.info(TAG, "image filePath:" + filePath);
  const file = fs.openSync(filePath!);
  fdNumber = file.fd as int;
  return fdNumber;
};

async function getImageSource(path: string): Promise<image.ImageSource | undefined> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  // console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

export default function ImageSourceGetDelayTimeListSupp() {
  describe('ImageSourceGetDelayTimeListSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_0100
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_0100
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_0100';
      const imageSourceApi = await getImageSource('pixel_gif_3072x4096.gif');
      try {
        let delayTimes: Array<int> = await imageSourceApi!.getDelayTimeList();
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(delayTimes));
        expect(delayTimes.length >0).assertFalse();
        done();
      } catch(err) {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(62980149);
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_0200
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_0200
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_0200';
      const imageSourceApi = await getImageSource('pixel_gif_481x361.gif');
      try {
        let delayTimes: Array<int> = await  imageSourceApi!.getDelayTimeList();
          console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(delayTimes));
          expect(delayTimes.length >0).assertFalse();
          done();
      } catch(err) {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(62980149);
        done();
      }
    })
  });
}