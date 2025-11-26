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

#include "napi/native_api.h"
#include "include/AudioSuiteBaseTest.h"
#include <cstdio>
#include <cstdlib>
#include <string>
#include <set>
#include <thread>

void *g_userData = nullptr;
int32_t g_samplingRate = 48000;
int32_t g_channelCount = 2;
int32_t g_bitsPerSample = 16;
int32_t g_frameSize = 2 * g_samplingRate * g_channelCount / 1000 * g_bitsPerSample / 8;
int32_t g_writeSize = g_frameSize;
const int32_t NUM_ONE = 1;
const int32_t NUM_TWO = 2;
const int32_t NUM_THREE = 3;
const OH_AudioFormat audioFormatInput = {.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000,
                                         .channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO,
                                         .channelCount = NUM_TWO,
                                         .encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW,
                                         .sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE};
const OH_AudioFormat audioFormatOutput = {.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000,
                                          .channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO,
                                          .channelCount = NUM_TWO,
                                          .encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW,
                                          .sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE};

std::vector<char> audioData(g_frameSize);
bool g_finishedFlag = false;
static int32_t MyOnWriteData( OH_AudioNode *audioNode, void *userData, void *audioData, int32_t audioDataSize,
                             bool *finished )
{
    std::fill(static_cast<char *>(audioData), static_cast<char *>(audioData) + audioDataSize, 1);
    *finished = true;
    return 1;
}
static napi_value AudioSuiteEngineCreateTest_0001(napi_env env, napi_callback_info info)
{
    OH_AudioSuite_Result result = CreateAudioSuiteEngine();

    napi_value res;
    if (result == OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    }

    return res;
}

static napi_value AudioSuiteEngineCreateTest_0002(napi_env env, napi_callback_info info)
{
    LOG("OH_AudioSuiteEngine_Create ");

    napi_value res;
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);

    return res;
}

static napi_value AudioSuiteEngineCreateTest_0003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuite_Result result1 = OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    if (result1 != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineCreateTest_0003 fail, result is: %{public}d", result1);
        return res;
    }
    OH_AudioSuite_Result result2 = OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineCreateTest_0004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_Create(nullptr);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineCreateTest_0004 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineCreateTest_0005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_STATE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineCreateTest_0005 fail, result is: %{public}d", result);
        return res;
    }
    OH_AudioSuite_Result result2 = OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineDestroyTest_0001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineDestroyTest_0001 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineDestroyTest_0002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_Destroy(nullptr);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineDestroyTest_0002 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineDestroyTest_0003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_STATE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineDestroyTest_0003 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

std::vector<OH_AudioNode_Type> audioNodeTypeTest = {
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_NOISE_REDUCTION_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SOUND_FIELD_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_MULTII_OUTPUT_NODE_TYPE_AUDIO_SEPARATION_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_VOICE_BEAUTIFIER_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_ENVIRONMENT_EFFECT_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_AUDIO_MIXER_TEST),
};

static napi_value AudioSuiteNodeBuilderSetNodeTypeTest_0001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *audioNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&audioNodeBuilder);
    for (auto setNodeType : static_cast<OH_AudioNode_Type>(audioNodeTypeTest)) {
        OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetNodeType(audioNodeBuilder, setNodeType);
        if (result != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("AudioSuiteNodeBuilderSetNodeTypeTest_0001 fail, result is: %{public}d", result);
        } else {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        }
    }
    OH_AudioSuiteNodeBuilder_Destroy(audioNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}

static napi_value AudioSuiteNodeBuilderSetNodeTypeTest_0002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *audioNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&audioNodeBuilder);
    for (const auto setNodeType : audioNodeTypeTest) {
        OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetNodeType(nullptr, setNodeType);
        if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_PARAM) {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("AudioSuiteNodeBuilderSetNodeTypeTest_0002 fail, result is: %{public}d", result);
        }else {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        }
    }
    OH_AudioSuiteNodeBuilder_Destroy(audioNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}

std::vector<OH_Audio_SampleFormat> audioSampleFormatTest = {
    static_cast<OH_Audio_SampleFormat>(AudioSampleFormatTest::AUDIO_SAMPLE_U8_TEST),
    static_cast<OH_Audio_SampleFormat>(AudioSampleFormatTest::AUDIO_SAMPLE_S16LE_TEST),
    static_cast<OH_Audio_SampleFormat>(AudioSampleFormatTest::AUDIO_SAMPLE_S24LE_TEST),
    static_cast<OH_Audio_SampleFormat>(AudioSampleFormatTest::AUDIO_SAMPLE_S32LE_TEST),
    static_cast<OH_Audio_SampleFormat>(AudioSampleFormatTest::AUDIO_SAMPLE_F32LE_TEST),
};

std::vector<OH_Audio_SampleRate> audioSampleRateTest = {
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_8000_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_11025_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_12000_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_16000_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_22050_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_24000_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_32000_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_44100_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_48000_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_64000_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_88200_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_96000_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_176400_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_192000_TEST),
};

static napi_value AudioSuiteNodeBuilderSetFormatTest_0001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *inputNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&inputNodeBuilder);
    const std::vector<OH_Audio_SampleFormat>& sampleFormats = audioSampleFormatTest;
    const std::vector<OH_Audio_SampleRate>& sampleRates = audioSampleRateTest;
    for (const auto &format : sampleFormats) {
        for (const auto &rate : sampleRates) {
            OH_AudioFormat audioFormatInput = {
                .samplingRate = rate,
                .channelLayout = OH_AudioChannelLayout::CH_LAYOUT_MONO,
                .channelCount = NUM_ONE,
                .encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW,
                .sampleFormat = format
            };
            OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetFormat(inputNodeBuilder, audioFormatInput);
            if (result != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
                napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
                LOG("AudioSuiteNodeBuilderSetFormatTest_0001 fail, result is: %{public}d", result);
            } else {
                napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
            }
        }
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(inputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}

static napi_value AudioSuiteNodeBuilderSetFormatTest_0002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *inputNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&inputNodeBuilder);
    const std::vector<OH_Audio_SampleFormat>& sampleFormats = audioSampleFormatTest;
    const std::vector<OH_Audio_SampleRate>& sampleRates = audioSampleRateTest;
    for (const auto &format : sampleFormats) {
        for (const auto &rate : sampleRates) {
            OH_AudioFormat audioFormatInput = {
                .samplingRate = rate,
                .channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO,
                .channelCount = NUM_TWO,
                .encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW,
                .sampleFormat = format
            };
            OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetFormat(inputNodeBuilder, audioFormatInput);
            if (result != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
                napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
                LOG("AudioSuiteNodeBuilderSetFormatTest_0002 fail, result is: %{public}d", result);
            } else {
                napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
            }
        }
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(inputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}

static napi_value AudioSuiteNodeBuilderSetFormatTest_0003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *inputNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&inputNodeBuilder);
    OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetFormat(nullptr, audioFormatInput);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteNodeBuilderSetFormatTest_0003 fail, result is: %{public}d", result);
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(inputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}

static napi_value AudioSuiteNodeBuilderSetFormatTest_0004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *inputNodeBuilder = nullptr;
    const OH_AudioFormat audioFormatInput = {
                                      .samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000,
                                      .channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO,
                                      .channelCount = NUM_THREE,
                                      .encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW,
                                      .sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE };
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&inputNodeBuilder);
    OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetFormat(inputNodeBuilder, audioFormatInput);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_UNSUPPORTED_FORMAT) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteNodeBuilderSetFormatTest_0004 fail, result is: %{public}d", result);
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(inputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}

static napi_value AudioSuiteNodeBuilderSetFormatTest_0005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *outputNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&outputNodeBuilder);
    const std::vector<OH_Audio_SampleFormat>& sampleFormats = audioSampleFormatTest;
    const std::vector<OH_Audio_SampleRate>& sampleRates = audioSampleRateTest;
    for (const auto &format : sampleFormats) {
        for (const auto &rate : sampleRates) {
            OH_AudioFormat audioFormatOutput = {
                .samplingRate = rate,
                .channelLayout = OH_AudioChannelLayout::CH_LAYOUT_MONO,
                .channelCount = NUM_ONE,
                .encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW,
                .sampleFormat = format
            };
            OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetFormat(outputNodeBuilder, audioFormatOutput);
            if (result != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
                napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
                LOG("AudioSuiteNodeBuilderSetFormatTest_0005 fail, result is: %{public}d", result);
            } else {
                napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
            }
        }
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(outputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}

static napi_value AudioSuiteNodeBuilderSetFormatTest_0006(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *outputNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&outputNodeBuilder);
    const std::vector<OH_Audio_SampleFormat>& sampleFormats = audioSampleFormatTest;
    const std::vector<OH_Audio_SampleRate>& sampleRates = audioSampleRateTest;
    for (const auto &format : sampleFormats) {
        for (const auto &rate : sampleRates) {
            OH_AudioFormat audioFormatOutput = {
                .samplingRate = rate,
                .channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO,
                .channelCount = NUM_TWO,
                .encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW,
                .sampleFormat = format
            };
            OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetFormat(outputNodeBuilder, audioFormatOutput);
            if (result != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
                napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
                LOG("AudioSuiteNodeBuilderSetFormatTest_0006 fail, result is: %{public}d", result);
            } else {
                napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
            }
        }
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(outputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}

static napi_value AudioSuiteNodeBuilderSetFormatTest_0007(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *outputNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&outputNodeBuilder);
    OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetFormat(nullptr, audioFormatOutput);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteNodeBuilderSetFormatTest_0007 fail, result is: %{public}d", result);
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(outputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}
static napi_value AudioSuiteNodeBuilderSetFormatTest_0008(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *outputNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&outputNodeBuilder);
    const OH_AudioFormat audioFormatOutput = {
                                      .samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000,
                                      .channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO,
                                      .channelCount = NUM_ONE,
                                      .encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW,
                                      .sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE };
    OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetFormat(outputNodeBuilder, audioFormatOutput);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_UNSUPPORTED_FORMAT) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteNodeBuilderSetFormatTest_0008 fail, result is: %{public}d", result);
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(outputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}
static napi_value InputNodeRequestDataCallbackTest_0001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *inputNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&inputNodeBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(inputNodeBuilder, static_cast
        <OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputNodeBuilder, audioFormatInput);
    OH_AudioSuite_Result result =
     OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inputNodeBuilder, MyOnWriteData, g_userData);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("InputNodeRequestDataCallbackTest_0001 fail, result is: %{public}d", result);
        return res;
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(inputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}
static napi_value InputNodeRequestDataCallbackTest_0002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *inputNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&inputNodeBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(inputNodeBuilder, static_cast
        <OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputNodeBuilder, audioFormatInput);
    OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetRequestDataCallback(
        inputNodeBuilder, nullptr, g_userData);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("InputNodeRequestDataCallbackTest_0002 fail, result is: %{public}d", result);
        return res;
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(inputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "AudioSuiteEngineCreateTest_0001", nullptr, AudioSuiteEngineCreateTest_0001,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineCreateTest_0002", nullptr, AudioSuiteEngineCreateTest_0002,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineCreateTest_0003", nullptr, AudioSuiteEngineCreateTest_0003,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineCreateTest_0004", nullptr, AudioSuiteEngineCreateTest_0004,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineCreateTest_0005", nullptr, AudioSuiteEngineCreateTest_0005,
        nullptr, nullptr, nullptr, napi_default, nullptr }, 
        { "AudioSuiteEngineDestroyTest_0001", nullptr, AudioSuiteEngineDestroyTest_0001,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineDestroyTest_0002", nullptr, AudioSuiteEngineDestroyTest_0002,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineDestroyTest_0003", nullptr, AudioSuiteEngineDestroyTest_0003,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetNodeTypeTest_0001", nullptr, AudioSuiteNodeBuilderSetNodeType_0001,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetNodeTypeTest_0002", nullptr, AudioSuiteNodeBuilderSetNodeType_0002,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetFormatTest_0001", nullptr, AudioSuiteNodeBuilderSetFormat_0001,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetFormatTest_0002", nullptr, AudioSuiteNodeBuilderSetFormat_0002,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetFormatTest_0003", nullptr, AudioSuiteNodeBuilderSetFormat_0003,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetFormatTest_0004", nullptr, AudioSuiteNodeBuilderSetFormat_0004,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetFormatTest_0005", nullptr, AudioSuiteNodeBuilderSetFormat_0005,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetFormatTest_0006", nullptr, AudioSuiteNodeBuilderSetFormat_0006,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetFormatTest_0007", nullptr, AudioSuiteNodeBuilderSetFormat_0007,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetFormatTest_0008", nullptr, AudioSuiteNodeBuilderSetFormat_0008,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "InputNodeRequestDataCallbackTest_0001", nullptr, InputNodeRequestDataCallback_0001,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "InputNodeRequestDataCallbackTest_0002", nullptr, InputNodeRequestDataCallback_0002,
        nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "audiosuiteenginetest",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
