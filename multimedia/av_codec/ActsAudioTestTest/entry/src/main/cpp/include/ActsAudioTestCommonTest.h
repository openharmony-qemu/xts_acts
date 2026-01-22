/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef ACTS_AUDIO_TEST_COMMON_TEST_H
#define ACTS_AUDIO_TEST_COMMON_TEST_H

#include <fstream>
#include <atomic>
#include <mutex>
#include <condition_variable>
#include <string_view>
#include <cstdint>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <map>
#include <vector>
#include <mutex>
#include <atomic>
#include <queue>
#include <string>
#include <thread>
#include <set>
#include <cstdint>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avbuffer.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/native_audio_channel_layout.h>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>

namespace OHOS {
constexpr uint32_t CHANNEL_COUNT = 2;
constexpr uint32_t SAMPLE_RATE = 44100;
constexpr int64_t BITS_RATE = 261000;
constexpr uint32_t FRAME_DURATION_US = 33000;
constexpr uint32_t AAC_DEFAULT_FRAME_BYTES = 2 * 1024 * 4;

const char* const AAC_INPUT_FILE_PATH = "/data/test/media/aac_2c_44100hz_199k.pcm";
const char* const AAC_OUTPUT_FILE_PATH = "/data/test/media/aac_2c_44100hz_encode.aac";

const int RESULT_OK = 0;
const int RESULT_CONFIG_FAIL = -1;
const int RESULT_UNEXPECTED_CONFIG_SUCCESS = -2;
const int RESULT_DESTROY_FAIL = -3;
const int RESULT_UNDEFINED_ERROR = -4;
const int FLUSH_ERROR = -5;
const int DESTROY_ERROR = -6;
const int START_CODEC_FAILED = -7;
const int ERROR_FLUSH_FAILED = -8;
const int ERROR_DESTROY_FAILED = -9;

// AEncSignalAv 类声明
class AEncSignalAv {
public:
    std::mutex inMutex_;
    std::mutex outMutex_;
    std::mutex startMutex_;
    std::condition_variable inCond_;
    std::condition_variable outCond_;
    std::condition_variable startCond_;
    std::queue<uint32_t> inQueue_;
    std::queue<uint32_t> outQueue_;
    std::queue<OH_AVBuffer*> inBufferQueue_;
    std::queue<OH_AVBuffer*> outBufferQueue_;
};

// 回调函数声明
void OnError(OH_AVCodec *codec, int32_t errorCode, void *userData);
void OnOutputFormatChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData);
void OnInputBufferAvailableAv(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *data, void *userData);
void OnOutputBufferAvailableAv(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *data, void *userData);

// AudioCodeCapiEncoderNdkTest 类声明
class AudioCodeCapiEncoderNdkTest {
public:
    ~AudioCodeCapiEncoderNdkTest()
    {
        TearDown();
    }
    static void SetUpTestCase(void);
    static void TearDownTestCase(void);
    void SetUp();
    void TearDown();
    int32_t ProceByMimeFunc(const std::string mime, bool isEncoder);
    int32_t ProceByCapabilityFunc(const std::string mime, bool isEncoder);
    void InputFuncAv();
    void OutputFuncAv();
    void HeAACSampleRateTest(int32_t profile);
    void ChannelLayoutTest(std::map<OH_AudioChannelLayout, int32_t> &supportedLayoutMap, int32_t profile);
    void ChannelCountTest(std::set<int32_t> &supportedChannelCntSet, int32_t profile);
    bool IsSupportHeAac();

    int32_t EncoderConfigureLCAAC();
    int32_t EncoderConfigureHEAAC();
    int32_t EncoderConfigureHEAACv2();
    int32_t EncoderConfigureByCap();
    int32_t SampleRate();
    int32_t ChannelCountV1();
    int32_t ChannelCountV2();
    int32_t ChannelLayoutV1();
    int32_t ChannelLayoutV2();
    int32_t AacProfile();
protected:
    std::atomic<bool> isRunning_{false};
    std::unique_ptr<std::ifstream> inputFile_;
    std::unique_ptr<std::thread> inputLoop_;
    std::unique_ptr<std::thread> outputLoop_;
    int32_t index_;
    uint32_t frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    std::string inputFilePath_ = AAC_INPUT_FILE_PATH;
    std::string outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    struct OH_AVCodecCallback avcb_;
    AEncSignalAv *signalAv_ = nullptr;
    OH_AVCodec *audioEnc_;
    OH_AVFormat *format;
    bool isFirstFrame_ = true;
    int64_t timeStamp_ = 0;
private:
    //EncoderConfigureHEAAC
    void SetHeAacConfig();
    int32_t ValidateAndConfigureEncoder();
    int32_t ManageHeAacThreadsAndResources();
    //EncoderConfigureHEAACv2
    void SetHeAacV2Config();
    int32_t ConfigureAudioEncoder();
    int32_t StartAndManageThreads();
    void CleanupResources();
    //EncoderConfigureByCap
    void SetCapConfig();
    int32_t CreateAndStartThreads();
    void CleanupCapResources();
};
} // namespace OHOS

#endif // ACTS_AUDIO_TEST_COMMON_TEST_H