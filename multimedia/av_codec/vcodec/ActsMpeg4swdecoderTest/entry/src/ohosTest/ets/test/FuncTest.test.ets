import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libentry from "libentry.so"
import Utils, { Log } from './Util.test';

const fileArr = [
  "mpeg4_mainlevel4_1920x1080_30.m4v",
]

export default function FuncTest() {
  describe('FuncTest', () => {
    beforeAll(async () => {
      let context = getContext()
      for (let i = 0; i < fileArr.length; i++) {
        const fileName = fileArr[i]
        Utils.copyRawfileToFilesDirSync(fileName, context)
      }
      Log.info(`[rawfile_copy_to_sandbox] sandbox path: ${context.filesDir}/`)
      await Utils.sleep(500)
      await libentry.initTests();
    })
    beforeEach(async () => {
      let context = getContext()
      Log.info(`AudioText beforeEach`);
      for (let i = 0; i < fileArr.length; i++) {
        const fileName = fileArr[i];
        if (Utils.fileCheckSync(fileName, context)) {
          Log.info(`AudioText ${fileName} file exists`);
        } else {
          Log.info(`AudioText ${fileName} file does not exists!`);
        }
      }
      await Utils.sleep(500)
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_VIDEO_DECODE_SYNC_SWMPEG4_FUNC_00100
     * @tc.number SUB_VIDEO_DECODE_SYNC_SWMPEG4_FUNC_00100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_VIDEO_DECODE_SYNC_SWMPEG4_FUNC_00100', Level.LEVEL1, async (done: Function) => {
      const result: number = await libentry.VideoDecodeSyncSwMpeg4Func00100Test();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_DECODE_SYNC_SWMPEG4_FUNC_00200
     * @tc.number SUB_VIDEO_DECODE_SYNC_SWMPEG4_FUNC_00200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VIDEO_DECODE_SYNC_SWMPEG4_FUNC_00200', Level.LEVEL0, async (done: Function) => {
      const result: number = await libentry.VideoDecodeSyncSwMpeg4Func00200Test();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_DECODE_SYNC_SWMPEG4_FUNC_00400
     * @tc.number SUB_VIDEO_DECODE_SYNC_SWMPEG4_FUNC_00400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_VIDEO_DECODE_SYNC_SWMPEG4_FUNC_00400', Level.LEVEL1, async (done: Function) => {
      const result: number = await libentry.VideoDecodeSyncSwMpeg4Func00400Test();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_MPEG4SWDEC_BLANK_FRAME_00100
     * @tc.number SUB_VIDEO_MPEG4SWDEC_BLANK_FRAME_00100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_VIDEO_MPEG4SWDEC_BLANK_FRAME_00100', Level.LEVEL1, async (done: Function) => {
      const result: number = await libentry.VideoMpeg4SwdecBlankFrame00100Test();
      expect(result).assertEqual(0);
      done();
    })
  })
}
