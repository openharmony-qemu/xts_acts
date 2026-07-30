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
import fs from '@ohos.file.fs';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Hypium
} from '../../../../../../hypium';
import { BusinessError } from '@ohos.base';

const TAG = 'Image.GetComponent'

async function getComponentPromiseTest(done: () => void, testName: string): Promise<void> {
  try {
    let size: image.Size = {
      height: 8192,
      width: 8
    }
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    creator.dequeueImage((err: BusinessError<void> | null, img: image.Image | undefined) => {
      if (err) {
        console.error(TAG, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      } else {
        img?.getComponent(image.ComponentType.JPEG).then((component: image.Component) => {
          console.info(TAG, 'Succeeded getComponent_promise in dequeuing the Image.');
          done();
        }).catch((error) => {
          console.error(TAG, `Failed to get the component.code ${error.code},message is ${error.message}`);
          expect().assertFail();
          done();
        })
      }
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getComponentAbnormalPromiseTest(done: () => void, testName: string, ComponentType: image.ComponentType): Promise<void> {
  try {
    let size: image.Size = {
      height: 8192,
      width: 8
    }
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    creator.dequeueImage((err: BusinessError<void> | null, img: image.Image | undefined) => {
      if (err) {
        console.error(TAG, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      } else {
        img?.getComponent(ComponentType).then(() => {
          console.info(TAG, 'Succeeded getComponent_promise_abnormal in dequeuing the Image.');
          done();
        }).catch((error) => {
          console.error(TAG, `Failed to get the component.code ${error.code},message is ${error.message}`);
          expect().assertFail();
          done();
        })
      }
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getComponentCallbackTest(done: () => void, testName: string): Promise<void> {
  try {
    let size: image.Size = {
      height: 8192,
      width: 8
    }
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    creator.dequeueImage((err: BusinessError | null, img: image.Image | undefined) => {
      if (err) {
        console.error(TAG, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      } else {
        console.info('Succeeded in dequeuing the Image.');
        img?.getComponent(image.ComponentType.JPEG, (error: BusinessError | null, component: image.Component | undefined) => {
          if (error) {
            console.error(TAG, `Failed to get the component.code ${error.code},message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, 'Succeeded in getting callback component.');
            done();
          }
        })
      }
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getComponentAbnormalCallbackTest(done: () => void, testName: string, componentType: image.ComponentType): Promise<void> {
  try {
    let size: image.Size = {
      height: 8192,
      width: 8
    }
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    creator.dequeueImage((err: BusinessError | null, img: image.Image | undefined) => {
      if (err) {
        console.error(TAG, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      } else {
        console.info('Succeeded in dequeuing the Image.');
        img?.getComponent(componentType, (error: BusinessError | null, component: image.Component | undefined) => {
          if (error) {
            console.error(TAG, `Failed to get the component.code ${error.code},message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, 'Succeeded in getting abnormal_callback component.');
            done();
          }
        })
      }
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function ImageGetComponentTest(): void {
  describe('ImageGetComponentTest', () => {

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
     * @tc.name SUB_MEDIA_IMAGE_getComponent_promise_static_0100
     * @tc.number SUB_MEDIA_IMAGE_getComponent_promise_static_0100
     * @tc.desc   Image_getComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getComponent_promise_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getComponent_promise_static_0100';
      try {
        await getComponentPromiseTest(done, testName);
      } catch (error) {
        console.error(TAG, `Failed to get component.code ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getComponent_abnormal_promise_static_0100
     * @tc.number SUB_MEDIA_IMAGE_getComponent_abnormal_promise_static_0100
     * @tc.desc   Image_getComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getComponent_abnormal_promise_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getComponent_abnormal_promise_static_0100';
      const componentType = image.ComponentType.YUV_Y;
      try {
        await getComponentAbnormalPromiseTest(done, testName, componentType);
      } catch (error) {
        console.error(TAG, `Failed to get component.code ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getComponent_abnormal_promise_static_0200
     * @tc.number SUB_MEDIA_IMAGE_getComponent_abnormal_promise_static_0200
     * @tc.desc   Image_getComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getComponent_abnormal_promise_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getComponent_abnormal_promise_static_0200';
      const componentType = image.ComponentType.YUV_U;
      try {
        await getComponentAbnormalPromiseTest(done, testName, componentType);
      } catch (error) {
        console.error(TAG, `Failed to get component.code ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getComponent_abnormal_promise_static_0300
     * @tc.number SUB_MEDIA_IMAGE_getComponent_abnormal_promise_static_0300
     * @tc.desc   Image_getComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getComponent_abnormal_promise_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getComponent_abnormal_promise_static_0300';
      const componentType = image.ComponentType.YUV_V;
      try {
        await getComponentAbnormalPromiseTest(done, testName, componentType);
      } catch (error) {
        console.error(TAG, `Failed to get component.code ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getComponent_callback_static_0100
     * @tc.number SUB_MEDIA_IMAGE_getComponent_callback_static_0100
     * @tc.desc   Image_getComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getComponent_callback_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getComponent_callback_static_0100';
      try {
        await getComponentCallbackTest(done, testName);
      } catch (error) {
        console.error(TAG, `Failed to get component.code ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getComponent_abnormal_callback_static_0100
     * @tc.number SUB_MEDIA_IMAGE_getComponent_abnormal_callback_static_0100
     * @tc.desc   Image_getComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getComponent_abnormal_callback_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getComponent_abnormal_callback_static_0100';
      const componentType = image.ComponentType.YUV_Y;
      try {
        await getComponentAbnormalCallbackTest(done, testName, componentType);
      } catch (error) {
        console.error(TAG, `Failed to get component.code ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getComponent_abnormal_callback_static_0200
     * @tc.number SUB_MEDIA_IMAGE_getComponent_abnormal_callback_static_0200
     * @tc.desc   Image_getComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getComponent_abnormal_callback_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getComponent_abnormal_callback_static_0200';
      const componentType = image.ComponentType.YUV_U;
      try {
        await getComponentAbnormalCallbackTest(done, testName, componentType);
      } catch (error) {
        console.error(TAG, `Failed to get component.code ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getComponent_abnormal_callback_static_0300
     * @tc.number SUB_MEDIA_IMAGE_getComponent_abnormal_callback_static_0300
     * @tc.desc   Image_getComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getComponent_abnormal_callback_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getComponent_abnormal_callback_static_0300';
      const componentType = image.ComponentType.YUV_V;
      try {
        await getComponentAbnormalCallbackTest(done, testName, componentType);
      } catch (error) {
        console.error(TAG, `Failed to get component.code ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
  })
}