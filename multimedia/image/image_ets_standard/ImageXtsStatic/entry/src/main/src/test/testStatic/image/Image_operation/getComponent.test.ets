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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../../hypium';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = '[Image_operation].getComponent';

async function getComponentPromiseTest(done: () => void, testName: string): Promise<void> {
  let size: image.Size = {
    height: 8192,
    width: 8
  }
  const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
  let img: image.Image = await creator.dequeueImage();
  let component: image.Component = await img.getComponent(image.ComponentType.JPEG);
  expect(component != undefined).assertTrue();
  console.info(TAG, 'Succeeded in getting component.');
  done();

}

async function getComponentAbnormalPromiseTest(done: () => void, testName: string,
  ComponentType: image.ComponentType): Promise<void> {
  let size: image.Size = {
    height: 8192,
    width: 8
  }
  const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
  let img: image.Image = await creator.dequeueImage();
  let component: image.Component = await img.getComponent(ComponentType);
  expect(component != undefined).assertTrue();
  console.info(TAG, 'Succeeded in getting component.');
  done();
}

async function getComponentCallbackTest(done: () => void, testName: string): Promise<void> {
  let size: image.Size = {
    height: 8192,
    width: 8
  }
  const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
  let img: image.Image = await creator.dequeueImage();
  let component: image.Component = await img.getComponent(image.ComponentType.JPEG);
  expect(component != undefined).assertTrue();
  console.info(TAG, 'Succeeded in getting component.');
  done();
}

async function getComponentAbnormalCallbackTest(done: () => void, testName: string,
  componentType: image.ComponentType): Promise<void> {
  let size: image.Size = {
    height: 8192,
    width: 8
  }
  const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
  let img: image.Image = await creator.dequeueImage();
  let component: image.Component = await img.getComponent(componentType);
  expect(component != undefined).assertTrue();
  console.info(TAG, 'Succeeded in getting component.');
  done();
}

export default
function ImageGetComponentTest(): void {
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
     * @tc.name   Image_getComponent_promise_001
     * @tc.number IMAGE_GET_COMPONENT_001
     * @tc.desc   Image_getComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Image_getComponent_promise_001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'Image_getComponent_promise_001';
      try {
        await getComponentPromiseTest(done, testName);
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, `Failed. code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Image_getComponent_abnormal_promise_001
     * @tc.number IMAGE_GET_COMPONENT_002
     * @tc.desc   Image_getComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Image_getComponent_abnormal_promise_001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'Image_getComponent_abnormal_promise_001';
      const componentType = image.ComponentType.YUV_Y;
      try {
        await getComponentAbnormalPromiseTest(done, testName, componentType);
      } catch (error) {
        // let err = error as BusinessError;
        let err = error as Error;
        console.error(TAG, `Failed. code ${err.code},message is ${err.message}`);
        expect(err).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Image_getComponent_abnormal_promise_002
     * @tc.number IMAGE_GET_COMPONENT_003
     * @tc.desc   Image_getComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Image_getComponent_abnormal_promise_002', Level.LEVEL0, async (done: () => void) => {
      const testName = 'Image_getComponent_abnormal_promise_002';
      const componentType = image.ComponentType.YUV_U;
      try {
        await getComponentAbnormalPromiseTest(done, testName, componentType);
      } catch (error) {
        let err = error as BusinessError;
        // let err = error as Error;
        console.error(TAG, `Failed. code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Image_getComponent_abnormal_promise_003
     * @tc.number IMAGE_GET_COMPONENT_004
     * @tc.desc   Image_getComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Image_getComponent_abnormal_promise_003', Level.LEVEL0, async (done: () => void) => {
      const testName = 'Image_getComponent_abnormal_promise_003';
      const componentType = image.ComponentType.YUV_V;
      try {
        await getComponentAbnormalPromiseTest(done, testName, componentType);
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, `Failed. code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Image_getComponent_callback_001
     * @tc.number IMAGE_GET_COMPONENT_005
     * @tc.desc   Image_getComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Image_getComponent_callback_001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'Image_getComponent_callback_001';
      try {
        await getComponentCallbackTest(done, testName);
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, `Failed. code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Image_getComponent_abnormal_callback_001
     * @tc.number IMAGE_GET_COMPONENT_006
     * @tc.desc   Image_getComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Image_getComponent_abnormal_callback_001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'Image_getComponent_abnormal_callback_001';
      const componentType = image.ComponentType.YUV_Y;
      try {
        await getComponentAbnormalCallbackTest(done, testName, componentType);
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, `Failed. code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Image_getComponent_abnormal_callback_002
     * @tc.number IMAGE_GET_COMPONENT_007
     * @tc.desc   Image_getComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Image_getComponent_abnormal_callback_002', Level.LEVEL0, async (done: () => void) => {
      const testName = 'Image_getComponent_abnormal_callback_002';
      const componentType = image.ComponentType.YUV_U;
      try {
        await getComponentAbnormalCallbackTest(done, testName, componentType);
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, `Failed. code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Image_getComponent_abnormal_callback_003
     * @tc.number IMAGE_GET_COMPONENT_008
     * @tc.desc   Image_getComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Image_getComponent_abnormal_callback_003', Level.LEVEL0, async (done: () => void) => {
      const testName = 'Image_getComponent_abnormal_callback_003';
      const componentType = image.ComponentType.YUV_V;
      try {
        await getComponentAbnormalCallbackTest(done, testName, componentType);
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, `Failed. code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    })
  })
}