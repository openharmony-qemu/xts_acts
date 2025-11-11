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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';
import fileio from '@ohos.fileio'
import { sleep, isEmpty } from '../common';
import common from '@ohos.app.ability.common';
import { rpc } from '@kit.IPCKit';

const TAG = 'Image.ImageCreatePixelMapFromParcelSupp'
let fdNumber: number;

async function getFd(fileName: string) {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG, 'image case filePath is ' + filePath);
  await fileio.open(filePath).then((data) => {
    fdNumber = data;
    console.info(TAG, "image case open fd success " + fdNumber);
  }, (err: BusinessError) => {
    console.info(TAG, "image cese open fd fail" + err)
  }).catch((err: BusinessError) => {
    console.info(TAG, "image case open fd err " + err);
  })
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

class MySequence implements rpc.Parcelable {
  pixel_map: image.PixelMap;
  constructor(conPixelmap: image.PixelMap) {
    this.pixel_map = conPixelmap;
  }
  marshalling(messageSequence: rpc.MessageSequence) {
    this.pixel_map.marshalling(messageSequence);
    return true;
  }
  unmarshalling(messageSequence: rpc.MessageSequence) {
    try {
      this.pixel_map = image.createPixelMapFromParcel(messageSequence);
    } catch(e) {
      let error = e as BusinessError;
      console.error(TAG,`createPixelMapFromParcel error. code is ${error.code}, message is ${error.message}`);
      return false;
    }
    return true;
  }
}
async function createPixelMapFromParcelTest(done: Function, testName: string, color: ArrayBuffer,
  ) {
  // const color: ArrayBuffer = new ArrayBuffer(color);
  let bufferArr: Uint8Array = new Uint8Array(color);
  for (let i = 0; i < bufferArr.length; i++) {
    bufferArr[i] = 0x80;
  }
  let opts: image.InitializationOptions = {
    editable: true,
    pixelFormat: image.PixelMapFormat.BGRA_8888,
    size: { height: 4, width: 6 },
    alphaType: image.AlphaType.UNPREMUL
  }
  let pixelMap: image.PixelMap | undefined = undefined;
  await image.createPixelMap(color, opts).then((srcPixelMap: image.PixelMap) => {
    pixelMap = srcPixelMap;
  })
  if (pixelMap != undefined) {
    // 序列化。
    let parcelable: MySequence = new MySequence(pixelMap);
    let data: rpc.MessageSequence = rpc.MessageSequence.create();
    data.writeParcelable(parcelable);

    // 反序列化rpc获取到data。
    let ret: MySequence = new MySequence(pixelMap);
    data.readParcelable(ret);

    // 获取到pixelmap。
    let unmarshPixelmap = ret.pixel_map;
  }
}

export default function ImageCreatePixelMapFromParcelSupp() {
  describe('ImageCreatePixelMapFromParcelSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      await sleep(500);
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await sleep(500)
    });
    afterAll(() => {
      console.info('afterAll case');
    });


    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_001
     * @tc.name      : sendableImage_createPixelMapFromParcel_sendable_promise_001
     * @tc.desc      : sendableImage_createPixelMapFromParcel
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMapFromParcel_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapFromParcel_sendable_promise_001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      await createPixelMapFromParcelTest(done, testName, color);
    })



  })
}