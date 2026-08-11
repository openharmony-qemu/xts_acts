'use static';
/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog';
import videoProcessing from '@ohos.multimedia.videoProcessing';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'VideoProcessorTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function videoProcessorTest() {
  describe("videoProcessorTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
    * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0100
    * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0100
    * @tc.desc   test createVideoProcessor funtion
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        let videoProcessor = videoProcessing.createVideoProcessor();
        expect(videoProcessor != null).assertTrue();
        done();
      } catch (err) {
        console.info('SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0100 failed, error is' + err.message);
        expect(err.code == undefined).assertTrue();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0200
    * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0200
    * @tc.desc   test getStatus function returns VideoProcessorStatus or undefined
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        let videoProcessor = videoProcessing.createVideoProcessor();
        expect(videoProcessor != null).assertTrue();
        let status = await videoProcessor.getStatus();
        expect(status != null).assertTrue();
        if (status == undefined) {
          done();
        } else {
          if (status?.aiHdr != null) {
            if (status?.aiHdr?.enabled != null) {
              expect(typeof status?.aiHdr?.enabled == 'boolean').assertTrue();
              done();
            } else {
              done();
            }
          } else {
            done();
          }
        }
      } catch (err) {
        console.info('SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0200 failed, error is' + err.message);
        expect(err.code == undefined).assertTrue();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0300
    * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0300
    * @tc.desc   test onStatusChange and offStatusChange function with specific callback
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        let videoProcessor = videoProcessing.createVideoProcessor();
        expect(videoProcessor != null).assertTrue();
        let statusCallback = (status : videoProcessing.VideoProcessorStatus) => {
          console.info('call statusCallback');
        }
        videoProcessor.onStatusChange(statusCallback);
        videoProcessor.offStatusChange(statusCallback);
        done();
      } catch (err) {
        console.info('SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0300 failed, error is' + err.message);
        expect(err.code == undefined).assertTrue();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0400
    * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0400
    * @tc.desc   test offStatusChange without callback to remove all callbacks
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        let videoProcessor = videoProcessing.createVideoProcessor();
        expect(videoProcessor != null).assertTrue();
        let statusCallback = (status : videoProcessing.VideoProcessorStatus) => {
          console.info('call statusCallback');
        }
        videoProcessor.onStatusChange(statusCallback);
        videoProcessor.offStatusChange();
        done();
      } catch (err) {
        console.info('SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0400 failed, error is' + err.message);
        expect(err.code == undefined).assertTrue();
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0500
    * @tc.number SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0500
    * @tc.desc   test multiple onStatusChange callbacks and offStatusChange
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it("SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0,
      async (done: () => void): Promise<void> => {
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
        done();
      } catch (err) {
        console.info('SUB_MULTIMIEDIA_VIDEO_PROCESSOR_STATIC_0500 failed, error is' + err.message);
        expect(err.code == undefined).assertTrue();
        done();
      }
    })
  })
}