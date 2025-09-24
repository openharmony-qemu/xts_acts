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

import common from '@ohos.app.ability.common';
import { image } from '@kit.ImageKit';
import { copyImageToSandbox} from '../common';
import { resourceManager } from '@kit.LocalizationKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';

const TAG = 'createImageSourceSupp';

async function createImageSourcePromiseTest(done: Function, testName: string, pathUri: string,fileName:string,callback: (err: number) => void) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path ='file://' + testContext.filesDir + "/" + pathUri + fileName;
    const imageSourceApi: image.ImageSource = image.createImageSource(path);
    expect(imageSourceApi).assertUndefined()
    done();
  } catch (error) {
    console.info(TAG, `failed; error:`, JSON.stringify(error),error.code,testName);
    expect().assertFail();
    done();
  }
}


async function createImageSourceOptionsPromiseTest(done: Function, testName: string, pathUri: string,callback: (err: number) => void,
  SourceOptions?: image.SourceOptions) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource =
      SourceOptions ? image.createImageSource(path, SourceOptions) : image.createImageSource(path);
    expect(imageSourceApi !== undefined).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error:`, JSON.stringify(error), error.code,error.code,testName);
    expect().assertFail();
    done();
  }
}

export default function ImageCreateImageSourcePathTest() {
  describe('ImageCreateImageSourcePathTest', () => {

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
     * @tc.number     createImageSource_promise_004
     * @tc.name       createImageSource_promise_004
     * @tc.desc       createImageSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createImageSource_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_004';
      const fileName = 'test.txt';
      const path = new Date().getTime() + 'test.txt';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path,fileName,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     createImageSource_promise_005
     * @tc.name       createImageSource_promise_005
     * @tc.desc       createImageSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createImageSource_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageSource_promise_005';
      const fileName = 'test.abc';
      const path = new Date().getTime() + 'test.abc';
      await copyImageToSandbox(fileName, path);
      await createImageSourcePromiseTest(done, testName, path,fileName,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     createImageSource_promise_006
     * @tc.name       createImageSource_promise_006
     * @tc.desc       createImageSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createImageSource_promise_006', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
        sourceDensity: 0
      };
      const testName = 'createImageSource_promise_006';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions,);
    })

    /**
     *
     * @tc.number     createImageSource_promise_007
     * @tc.name       createImageSource_promise_007
     * @tc.desc       createImageSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createImageSource_promise_007', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.ARGB_8888,
        sourceDensity: 0
      };
      const testName = 'createImageSource_promise_007';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.number     createImageSource_promise_008
     * @tc.name       createImageSource_promise_008
     * @tc.desc       createImageSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createImageSource_promise_008', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_565,
        sourceDensity: 0
      };
      const testName = 'createImageSource_promise_008';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.number     createImageSource_promise_009
     * @tc.name       createImageSource_promise_009
     * @tc.desc       createImageSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createImageSource_promise_009', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGBA_8888,
        sourceDensity: 0
      };
      const testName = 'createImageSource_promise_009';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.number     createImageSource_promise_010
     * @tc.name       createImageSource_promise_010
     * @tc.desc       createImageSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createImageSource_promise_010', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.BGRA_8888,
        sourceDensity: 0
      };
      const testName = 'createImageSource_promise_010';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.number     createImageSource_promise_011
     * @tc.name       createImageSource_promise_011
     * @tc.desc       createImageSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createImageSource_promise_011', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGB_888,
        sourceDensity: 0
      };
      const testName = 'createImageSource_promise_011';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.number     createImageSource_promise_012
     * @tc.name       createImageSource_promise_012
     * @tc.desc       createImageSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createImageSource_promise_012', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.ALPHA_8,
        sourceDensity: 0
      };
      const testName = 'createImageSource_promise_012';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.number     createImageSource_promise_013
     * @tc.name       createImageSource_promise_013
     * @tc.desc       createImageSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createImageSource_promise_013', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGBA_F16,
        sourceDensity: 0
      };
      const testName = 'createImageSource_promise_013';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.number     createImageSource_promise_014
     * @tc.name       createImageSource_promise_014
     * @tc.desc       createImageSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createImageSource_promise_014', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.NV21,
        sourceDensity: 0
      };
      const testName = 'createImageSource_promise_014';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.number     createImageSource_promise_015
     * @tc.name       createImageSource_promise_015
     * @tc.desc       createImageSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createImageSource_promise_015', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.NV12,
        sourceDensity: 0
      };
      const testName = 'createImageSource_promise_015';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.number     createImageSource_promise_016
     * @tc.name       createImageSource_promise_016
     * @tc.desc       createImageSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createImageSource_promise_016', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.RGBA_1010102,
        sourceDensity: 0
      };
      const testName = 'createImageSource_promise_016';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.number     createImageSource_promise_017
     * @tc.name       createImageSource_promise_017
     * @tc.desc       createImageSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createImageSource_promise_017', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.YCBCR_P010,
        sourceDensity: 0
      };
      const testName = 'createImageSource_promise_017';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.number     createImageSource_promise_018
     * @tc.name       createImageSource_promise_018
     * @tc.desc       createImageSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createImageSource_promise_018', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.YCBCR_P010,
        sourceDensity: 0
      };
      const testName = 'createImageSource_promise_018';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.number     createImageSource_promise_019
     * @tc.name       createImageSource_promise_019
     * @tc.desc       createImageSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createImageSource_promise_019', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.YCRCB_P010,
        sourceDensity: 0
      };
      const testName = 'createImageSource_promise_019';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.number     createImageSource_promise_020
     * @tc.name       createImageSource_promise_020
     * @tc.desc       createImageSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createImageSource_promise_020', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourcePixelFormat: image.PixelMapFormat.ASTC_4x4,
        sourceDensity: 0
      };
      const testName = 'createImageSource_promise_020';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })

    /**
     * @tc.number     createImageSource_promise_021
     * @tc.name       createImageSource_promise_021
     * @tc.desc       createImageSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createImageSource_promise_021', Level.LEVEL0, async (done: Function) => {
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 0,
        sourceSize:{
          height: 100,
          width: 100
        }
      };
      const testName = 'createImageSource_promise_021';
      const fileName = 'test.jpg';
      const path = new Date().getTime() + 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await createImageSourceOptionsPromiseTest(done, testName, path,(errCode) => {
        expect().assertFail();
      },sourceOptions);
    })


  })
}