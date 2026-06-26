
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import zip from 'libentry.so'
import fs from '@ohos.file.fs';

const ARCHIVE_OK: number = 0;
const TEST_SUCCESS: number = 1;

export default function Oh_Archive_Test() {
  describe('Archivetest', () => {
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
     * @tc.number   SUB_BASIC_SERVICES_ARCHIVE_COMPRESS_0001
     * @tc.name     Archive Compress And Decompress Test
     * @tc.desc     Test Archive Compress And Decompress Function
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */

    it('test_archive_compresss001', 0, async() => {
      let data = await zip.archive_compress(ARCHIVE_OK);
      console.info("oh archive_compresss001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
    })
    /**
     * @tc.number   SUB_BASIC_SERVICES_ARCHIVE_COMPRESS_0002
     * @tc.name     Archive Compress Muti File Test
     * @tc.desc     Test Archive Compress Muti File Function
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */

    it('test_archive_compresss002', 0, async() => {
      let data = await zip.archive_compress_muti_file(ARCHIVE_OK);
      console.info("oh archive_compresss002 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
    })

    /**
     * @tc.number   SUB_BASIC_SERVICES_ARCHIVE_COMPRESS_0003
     * @tc.name     Archive Compress Cancel Test
     * @tc.desc     Test Archive Compress Cancel Function
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */

    it('test_archive_compresss003', 0, async() => {
      let data = await zip.archive_compress_cancel(ARCHIVE_OK);
      console.info("oh archive_compresss003 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
    })

    /**
     * @tc.number   SUB_BASIC_SERVICES_ARCHIVE_COMPRESS_0004
     * @tc.name     Archive Decompress Cancel Test
     * @tc.desc     Test Archive Decompress Cancel Function
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('test_archive_compresss004', 0, async() => {
      let data = await zip.archive_decompress_cancel(ARCHIVE_OK);
      console.info("oh archive_compresss004 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
    })

    /**
     * @tc.number   SUB_BASIC_SERVICES_ARCHIVE_COMPRESS_0005
     * @tc.name     Archive Compress And Decompress Abnormal Params Test
     * @tc.desc     Test Archive Compress And Decompress Abnormal Params
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */

    it('test_archive_compresss005', 0, async() => {
      let data = await zip.archive_compress_abnormal(ARCHIVE_OK);
      console.info("oh archive_compresss005 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
    })
    /**
     * @tc.number   SUB_BASIC_SERVICES_ARCHIVE_BUFFER_0001
     * @tc.name     Archive Buffer Compress And Decompres Test
     * @tc.desc     Test Archive Buffer Compress And Decompress
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('test_archive_buffer_test001', 0, async() => {
      let data = zip.archive_buffer_test(ARCHIVE_OK);
      console.info("archive_buffer_test data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
    });
    /**
     * @tc.number   SUB_BASIC_SERVICES_ARCHIVE_BUFFER_0002
     * @tc.name     Archive Buffer Compress And Decompress Abnormal Params Test
     * @tc.desc     Test Archive Buffer Compress And Decompress Abnormal Params
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('test_archive_buffer_test002', 0, async() => {
      let data = zip.archive_buffer_test_abnormal(ARCHIVE_OK);
      console.info("archive_buffer_test data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
    });

    /**
     * @tc.number   SUB_BASIC_SERVICES_ARCHIVE_STREAM_0001
     * @tc.name     Archive Stream Compress And Decompress Test
     * @tc.desc     Test Archive Stream Compress And Decompress
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('test_archive_stream_test001', 0, async() => {
      let data = zip.archive_stream_test(ARCHIVE_OK);
      console.info("archive_stream_testdata = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
    });

    /**
     * @tc.number   SUB_BASIC_SERVICES_ARCHIVE_STREAM_0002
     * @tc.name     Archive Stream Compress Cancel Test
     * @tc.desc     Test Archive Stream Compress Cancel
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('test_archive_stream_test002', 0, async() => {
      let data = zip.archive_stream_zipquit(ARCHIVE_OK);
      console.info("archive_stream_testdata = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
    });
    /**
     * @tc.number   SUB_BASIC_SERVICES_ARCHIVE_STREAM_0003
     * @tc.name     Archive Stream Decompress Cancel Test
     * @tc.desc     Test Archive Stream Decompress Cancel
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('test_archive_stream_test003', 0, async() => {
      let data = zip.archive_stream_unzipquit(ARCHIVE_OK);
      console.info("archive_stream_testdata = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
    });
    /**
     * @tc.number   SUB_BASIC_SERVICES_ARCHIVE_STREAM_0004
     * @tc.name     Archive Stream Compress And Decompress Abnormal Params Test
     * @tc.desc     Test Archive Stream Compress And Decompress Abnormal Params
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('test_archive_stream_test004', 0, async() => {
      let data = zip.archive_stream_test_abnormal(ARCHIVE_OK);
      console.info("archive_stream_testdata = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
    });

  })
}