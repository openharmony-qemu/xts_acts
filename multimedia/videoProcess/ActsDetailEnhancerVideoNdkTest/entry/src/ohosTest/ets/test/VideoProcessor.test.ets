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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { videoProcessing} from '@kit.MediaKit';

export default function VpeVideoNdkTest() {
describe('VpeVideoNdkTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
    // Presets an action, which is performed only once before all test cases of the test suite start.
    // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
    // Presets an action, which is performed before each unit test case starts.
    // The number of execution times is the same as the number of test cases defined by **it**.
    // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
    // Presets a clear action, which is performed after each unit test case ends.
    // The number of execution times is the same as the number of test cases defined by **it**.
    // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
    // Presets a clear action, which is performed after all test cases of the test suite end.
    // This API supports only one parameter: clear action function.
    })

    /**
    * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0100
    * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0100
    * @tc.desc   test createVideoProcessor funtion
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0100', Level.LEVEL0, async(done: Function) => {
    try {
        let videoProcessor = videoProcessing.createVideoProcessor();
        expect(videoProcessor != null).assertTrue();
        done();
    } catch (err) {
        console.info('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0100 failed, error is' + err.message);
        expect(err.code == undefined).assertTrue();
        done();
    }
    })

    /**
    * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0200
    * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0200
    * @tc.desc   test getStatus function returns VideoProcessorStatus or undefined
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0200', Level.LEVEL0, async(done: Function) => {
    try {
        let videoProcessor = videoProcessing.createVideoProcessor();
        expect(videoProcessor != null).assertTrue();
        let status = await videoProcessor.getStatus();
        if (status == undefined) {
        expect(true).assertTrue();
        done();
        } else {
        if (status.aiHdr != null) {
            if (status.aiHdr.enabled != null) {
            expect(typeof status.aiHdr.enabled == 'boolean').assertTrue();
            done();
            } else {
            expect(true).assertTrue();
            done();
            }
        } else {
            expect(true).assertTrue();
            done();
        }
        }
    } catch (err) {
        console.info('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0200 failed, error is' + err.message);
        expect(err.code == undefined).assertTrue();
        done();
    }
    })

    /**
    * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0300
    * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0300
    * @tc.desc   test onStatusChange and offStatusChange function with specific callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0300', Level.LEVEL0, async(done: Function) => {
    try {
        let videoProcessor = videoProcessing.createVideoProcessor();
        expect(videoProcessor != null).assertTrue();
        let statusCallback = (status : videoProcessing.VideoProcessorStatus) => {
        console.info('call statusCallback');
        }
        videoProcessor.onStatusChange(statusCallback);
        videoProcessor.offStatusChange(statusCallback);
        expect(true).assertTrue();
        done();
    } catch (err) {
        console.info('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0300 failed, error is' + err.message);
        expect(err.code == undefined).assertTrue();
        done();
    }
    })

    /**
    * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0400
    * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0400
    * @tc.desc   test offStatusChange without callback to remove all callbacks
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0400', Level.LEVEL0, async(done: Function) => {
    try {
        let videoProcessor = videoProcessing.createVideoProcessor();
        expect(videoProcessor != null).assertTrue();
        let statusCallback = (status : videoProcessing.VideoProcessorStatus) => {
        console.info('call statusCallback');
        }
        videoProcessor.onStatusChange(statusCallback);
        videoProcessor.offStatusChange();
        expect(true).assertTrue();
        done();
    } catch (err) {
        console.info('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0400 failed, error is' + err.message);
        expect(err.code == undefined).assertTrue();
        done();
    }
    })

    /**
    * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0500
    * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0500
    * @tc.desc   test multiple onStatusChange callbacks and offStatusChange
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0500', Level.LEVEL0, async(done: Function) => {
    try {
        let videoProcessor = videoProcessing.createVideoProcessor();
        expect(videoProcessor != null).assertTrue();
        let statusCallback1 = (status : videoProcessing.VideoProcessorStatus) => {
        console.info('call statusCallback1');
        }
        let statusCallback2 = (status : videoProcessing.VideoProcessorStatus) => {
        console.info('call statusCallback2');
        }
        videoProcessor.onStatusChange(statusCallback1);
        videoProcessor.onStatusChange(statusCallback2);
        videoProcessor.offStatusChange();
        expect(true).assertTrue();
        done();
    } catch (err) {
        console.info('SUB_MULTIMIEDIA_VIDEO_PROCESSING_ENGINE_VIDEO_PROCESSOR_0500 failed, error is' + err.message);
        expect(err.code == undefined).assertTrue();
        done();
    }
    })
})
}