/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include <thread>
#include <chrono>
#include "oh_audio_render_unit_test.h"
#include "native_audio_routing_manager.h"
#include "native_audio_device_base.h"
#include <vector>

using namespace testing::ext;
using namespace std::chrono;

namespace {
    constexpr int32_t SAMPLE_RATE_48000 = 48000;
    constexpr int32_t CHANNEL_2 = 2;
}

namespace OHOS {
namespace AudioStandard {

void OHAudioRenderUnitTest::SetUpTestCase(void) { }

void OHAudioRenderUnitTest::TearDownTestCase(void) { }

void OHAudioRenderUnitTest::SetUp(void) { }

void OHAudioRenderUnitTest::TearDown(void) { }

const int32_t SAMPLING_RATE = 48000; // 48000:SAMPLING_RATE value
const int32_t CHANNEL_COUNT = 2; // 2:CHANNEL_COUNT value
const int32_t LATENCY_FORMAT = 0;
const int32_t SAMPLE_FORMAT = 1;
const int32_t FRAME_SIZE = 240; // 240:FRAME_SIZE value
uint32_t g_flag = 0;
const float MAX_AUDIO_VOLUME = 1.0f; // volume range is between 0 to 1.
const float MIN_AUDIO_VOLUME = 0.0f; // volume range is between 0 to 1.
const int32_t DURATIONMS = 40; // 40:fade out latency ms

static int32_t AudioRendererOnWriteData(OH_AudioRenderer* capturer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    return 0;
}

static void AudioRendererOnMarkReachedCb(OH_AudioRenderer* renderer, uint32_t samplePos, void* userData)
{
    g_flag = samplePos;
    printf("AudioRendererOnMarkReachedCb samplePos: %d \n", samplePos);
}

class OHAudioRendererWriteCallbackMock {
public:
    void OnWriteData(OH_AudioRenderer* renderer, void* userData,
    void* buffer,
    int32_t bufferLen)
    {
        exeCount_++;
        if (executor_) {
            executor_(renderer, userData, buffer, bufferLen);
        }
    }

    void Install(std::function<void(OH_AudioRenderer*, void*, void*, int32_t)> executor)
    {
        executor_ = executor;
    }

    uint32_t GetExeCount()
    {
        return exeCount_;
    }
private:
    std::function<void(OH_AudioRenderer*, void*, void*, int32_t)> executor_;
    std::atomic<uint32_t> exeCount_ = 0;
};

static int32_t AudioRendererOnWriteDataMock(OH_AudioRenderer* renderer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    OHAudioRendererWriteCallbackMock *mockPtr = static_cast<OHAudioRendererWriteCallbackMock*>(userData);
    mockPtr->OnWriteData(renderer, userData, buffer, bufferLen);

    return 0;
}

static OH_AudioData_Callback_Result OnWriteDataCallbackWithValidData(OH_AudioRenderer* renderer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    return AUDIO_DATA_CALLBACK_RESULT_VALID;
}

static OH_AudioData_Callback_Result OnWriteDataCallbackWithInvalidData(OH_AudioRenderer* renderer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    return AUDIO_DATA_CALLBACK_RESULT_INVALID;
}

struct UserData {
public:
    enum {
        WRITE_DATA_CALLBACK,

        WRITE_DATA_CALLBACK_WITH_RESULT
    } writeDataCallbackType;
};

static int32_t OnWriteDataCbMock(OH_AudioRenderer* renderer,
    void* userData,
    void* buffer,
    int32_t bufferLer)
{
    UserData *u = static_cast<UserData*>(userData);
    u->writeDataCallbackType = UserData::WRITE_DATA_CALLBACK;
    return 0;
}

static OH_AudioData_Callback_Result OnWriteDataCbWithValidDataMock(OH_AudioRenderer* renderer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    UserData *u = static_cast<UserData*>(userData);
    u->writeDataCallbackType = UserData::WRITE_DATA_CALLBACK_WITH_RESULT;
    return AUDIO_DATA_CALLBACK_RESULT_VALID;
}

static OH_AudioData_Callback_Result OnWriteDataCbWithInvalidDataMock(OH_AudioRenderer* renderer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    UserData *u = static_cast<UserData*>(userData);
    u->writeDataCallbackType = UserData::WRITE_DATA_CALLBACK_WITH_RESULT;
    return AUDIO_DATA_CALLBACK_RESULT_INVALID;
}

static bool GetCurrentDeviceIsTV()
{
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioDevice_Flag deviceFlage = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *audioDeviceDescriptorArray = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);

    OH_AudioCommon_Result res = OH_AudioRoutingManager_GetDevices(
        audioRoutingManager, deviceFlage, &audioDeviceDescriptorArray);
    EXPECT_EQ(res, OH_AudioCommon_Result::AUDIOCOMMON_RESULT_SUCCESS);

    OH_AudioDevice_Type deviceType;
    std::vector<uint8_t> deviceTypes;
    for (size_t i = 0; i < audioDeviceDescriptorArray->size; i++) {
        OH_AudioDeviceDescriptor_GetDeviceType(audioDeviceDescriptorArray->descriptors[i], &deviceType);
        deviceTypes.push_back(deviceType);
    }

    bool isTVDevice = false;
    for (auto& device : deviceTypes) {
        if (!isTVDevice && device == AUDIO_DEVICE_TYPE_DISPLAY_PORT) {
            isTVDevice = true;
            break;
        }
    }
    return isTVDevice;
}

OH_AudioStreamBuilder* OHAudioRenderUnitTest::CreateRenderBuilder()
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);
    return builder;
}

OH_AudioStreamBuilder* InitRenderBuilder()
{
    // create builder
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    // set params and callbacks
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder, (OH_AudioStream_LatencyMode)LATENCY_FORMAT);
    OH_AudioStreamBuilder_SetSampleFormat(builder, (OH_AudioStream_SampleFormat)SAMPLE_FORMAT);
    OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, FRAME_SIZE);

    return builder;
}

void CleanupAudioResources(OH_AudioStreamBuilder* builder, OH_AudioRenderer* audioRenderer)
{
    // stop and release client
    OH_AudioStream_Result result = OH_AudioRenderer_Stop(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    // destroy the builder
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name   OH_AudioRenderer_GetUnderflowCount_002
 * @tc.number OH_AudioRenderer_GetUnderflowCount_002
 * @tc.desc   Test OH_AudioRenderer_GetUnderflowCount interface.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioRenderUnitTest, OH_AudioRenderer_GetUnderflowCount_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLE_RATE_48000);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_2);
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_GAME;
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OHAudioRendererWriteCallbackMock writeCallbackMock;

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteDataMock;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, &writeCallbackMock);

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    std::mutex mutex;
    std::condition_variable cv;
    int32_t count = 0;
    writeCallbackMock.Install([&count, &mutex, &cv](OH_AudioRenderer* renderer, void* userData,
        void* buffer,
        int32_t bufferLen) {
            std::lock_guard lock(mutex);
            cv.notify_one();

            // sleep time trigger underflow
            if (count == 0) {
                std::this_thread::sleep_for(200ms);
            }
            count++;
        });

    result = OH_AudioRenderer_Start(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    std::unique_lock lock(mutex);
    cv.wait_for(lock, 1s, [&count] {
        // count > 1 ensure sleeped
        return count > 1;
    });
    lock.unlock();

    uint32_t underFlowCount;
    result = OH_AudioRenderer_GetUnderflowCount(audioRenderer, &underFlowCount);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    if (GetCurrentDeviceIsTV()) {
        EXPECT_GE(underFlowCount, 0);
    }
    else {
        EXPECT_GT(underFlowCount, 0);
    }

    OH_AudioRenderer_Stop(audioRenderer);
    OH_AudioRenderer_Release(audioRenderer);

    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name   OH_Audio_Render_SetLoudnessGain_001
 * @tc.number OH_AudioRenderer_SetLoudnessGain_001
 * @tc.desc   Test OH_AudioRenderer_SetLoudnessGain interface
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_MUSIC);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, -90.0f);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    sleep(1);

    float loudnessGain = 0;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    EXPECT_TRUE(AUDIOSTREAM_SUCCESS == result && -90.0f == loudnessGain);
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name   OH_Audio_Render_SetLoudnessGain_002
 * @tc.number OH_AudioRenderer_SetLoudnessGain_002
 * @tc.desc   Test OH_AudioRenderer_SetLoudnessGain interface
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_MUSIC);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, -89.9f);
    sleep(1);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    
    float loudnessGain = 0;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    EXPECT_TRUE((AUDIOSTREAM_SUCCESS == result) && (-89.9 - loudnessGain < 0.1 || loudnessGain + 89.9 < 0.1));
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name   OH_Audio_Render_SetLoudnessGain_003
 * @tc.number OH_AudioRenderer_SetLoudnessGain_003
 * @tc.desc   Test OH_AudioRenderer_SetLoudnessGain interface
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_003, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_MOVIE);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    sleep(1);

    float loudnessGain = 0;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    EXPECT_TRUE(AUDIOSTREAM_SUCCESS == result && 24.0f == loudnessGain);
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name   OH_Audio_Render_SetLoudnessGain_004
 * @tc.number OH_AudioRenderer_SetLoudnessGain_004
 * @tc.desc   Test OH_AudioRenderer_SetLoudnessGain interface
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_004, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_AUDIOBOOK);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 23.9f);
    sleep(1);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    
    float loudnessGain = 0;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    EXPECT_TRUE((AUDIOSTREAM_SUCCESS == result) && (23.9 - loudnessGain < 0.1 || loudnessGain - 23.9 < 0.1));
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name   OH_Audio_Render_SetLoudnessGain_005
 * @tc.number OH_AudioRenderer_SetLoudnessGain_005
 * @tc.desc   Test OH_AudioRenderer_SetLoudnessGain interface
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_005, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, (OH_AudioStream_LatencyMode)5);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_MOVIE);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    sleep(1);

    float loudnessGain = 0;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    EXPECT_TRUE(AUDIOSTREAM_SUCCESS == result && 24.0f == loudnessGain);
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name   OH_Audio_Render_SetLoudnessGain_021
 * @tc.number OH_AudioRenderer_SetLoudnessGain_021
 * @tc.desc   Test OH_AudioRenderer_SetLoudnessGain interface
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_021, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_MOVIE);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    int i = 0;
    float loudnessGain = 0;

    while (i < 2000) {
        result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 10.0f);
        EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

        result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
        EXPECT_TRUE(AUDIOSTREAM_SUCCESS == result && 10.0f == loudnessGain);

        result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, -10.0f);
        EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

        result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
        EXPECT_TRUE(AUDIOSTREAM_SUCCESS == result && -10.0f == loudnessGain);

        i++;
    }
    
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name   OH_Audio_Render_GetLoudnessGain_001
 * @tc.number OH_AudioRenderer_GetLoudnessGain_001
 * @tc.desc   Test OH_AudioRenderer_GetLoudnessGain interface
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_GetLoudnessGain_001, TestSize.Level2)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_MOVIE);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    sleep(1);

    float loudnessGain = 0;
    result = OH_AudioRenderer_GetLoudnessGain(nullptr, &loudnessGain);
    EXPECT_TRUE(AUDIOSTREAM_ERROR_INVALID_PARAM == result);
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name   OH_Audio_Render_GetLoudnessGain_002
 * @tc.number OH_AudioRenderer_GetLoudnessGain_002
 * @tc.desc   Test OH_AudioRenderer_GetLoudnessGain interface
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_GetLoudnessGain_002, TestSize.Level2)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_MOVIE);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    sleep(1);

    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, nullptr);
    EXPECT_TRUE(AUDIOSTREAM_ERROR_INVALID_PARAM == result);
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name   OH_AudioStreamManager_IsAcousticEchoCancelerSupported_001
 * @tc.number OH_AudioStreamManager_IsAcousticEchoCancelerSupported_001
 * @tc.desc   null check
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST(OHAudioRenderUnitTest, OH_AudioStreamManager_IsAcousticEchoCancelerSupported_001, TestSize.Level2)
{
    OH_AudioStreamManager* streamManager = nullptr;
    OH_AudioCommon_Result ret = OH_AudioManager_GetAudioStreamManager(&streamManager);

    EXPECT_EQ(ret, AUDIOCOMMON_RESULT_SUCCESS);
    EXPECT_NE(streamManager, nullptr);

    bool supported;
    ret = OH_AudioStreamManager_IsAcousticEchoCancelerSupported(nullptr, AUDIOSTREAM_SOURCE_TYPE_MIC, &supported);
    EXPECT_EQ(ret, AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM);

    ret = OH_AudioStreamManager_IsAcousticEchoCancelerSupported(streamManager, AUDIOSTREAM_SOURCE_TYPE_MIC, nullptr);
    EXPECT_EQ(ret, AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM);
}

/**
 * @tc.name   OH_AudioStreamManager_IsAcousticEchoCancelerSupported_002
 * @tc.number OH_AudioStreamManager_IsAcousticEchoCancelerSupported_002
 * @tc.desc   IsAcousticEchoCancelerSupported
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST(OHAudioRenderUnitTest, OH_AudioStreamManager_IsAcousticEchoCancelerSupported_002, TestSize.Level2)
{
    OH_AudioStreamManager* streamManager = nullptr;
    OH_AudioCommon_Result ret = OH_AudioManager_GetAudioStreamManager(&streamManager);

    EXPECT_EQ(ret, AUDIOCOMMON_RESULT_SUCCESS);
    EXPECT_NE(streamManager, nullptr);

    bool supported;
    ret = OH_AudioStreamManager_IsAcousticEchoCancelerSupported(streamManager, AUDIOSTREAM_SOURCE_TYPE_MIC, &supported);
    EXPECT_EQ(ret, AUDIOCOMMON_RESULT_SUCCESS);
    EXPECT_EQ(supported, false);
}

} // namespace AudioStandard
} // namespace OHOS
