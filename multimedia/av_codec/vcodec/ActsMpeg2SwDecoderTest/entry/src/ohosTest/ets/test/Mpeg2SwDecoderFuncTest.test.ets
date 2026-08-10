import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libMpeg2SwDecoder from 'libmpeg2swdecoder_test.so';

export default function Mpeg2SwDecoderFuncTest() {
  describe('Mpeg2SwDecoderFuncTest', () => {
    beforeAll(async () => {
      await libMpeg2SwDecoder.initTests();
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_VIDEO_DECODE_SYNC_SWMPEG2_FUNC_00100
     * @tc.number SUB_VIDEO_DECODE_SYNC_SWMPEG2_FUNC_00100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_VIDEO_DECODE_SYNC_SWMPEG2_FUNC_00100', Level.LEVEL1, async (done: Function) => {
      const result: number = await libMpeg2SwDecoder.VideoDecodeSyncSwMpeg2Func00100Test();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_DECODE_SYNC_SWMPEG2_FUNC_00200
     * @tc.number SUB_VIDEO_DECODE_SYNC_SWMPEG2_FUNC_00200
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VIDEO_DECODE_SYNC_SWMPEG2_FUNC_00200', Level.LEVEL0, async (done: Function) => {
      const result: number = await libMpeg2SwDecoder.VideoDecodeSyncSwMpeg2Func00200Test();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_DECODE_SYNC_SWMPEG2_FUNC_00400
     * @tc.number SUB_VIDEO_DECODE_SYNC_SWMPEG2_FUNC_00400
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_VIDEO_DECODE_SYNC_SWMPEG2_FUNC_00400', Level.LEVEL1, async (done: Function) => {
      const result: number = await libMpeg2SwDecoder.VideoDecodeSyncSwMpeg2Func00400Test();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_DECODE_BLANK_FRAME_00100
     * @tc.number SUB_VIDEO_DECODE_BLANK_FRAME_00100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_VIDEO_DECODE_BLANK_FRAME_00100', Level.LEVEL1, async (done: Function) => {
      const result: number = await libMpeg2SwDecoder.VideoDecodeBlankFrame00100Test();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VIDEO_DECODE_BLANK_ADD_00100
     * @tc.number SUB_VIDEO_DECODE_BLANK_ADD_00100
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VIDEO_DECODE_BLANK_ADD_00100', Level.LEVEL2, async (done: Function) => {
      const result: number = await libMpeg2SwDecoder.VideoDecodeBlankAdd00100Test();
      expect(result).assertEqual(0);
      done();
    })

  })
}
