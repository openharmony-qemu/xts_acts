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

#include <SLES/OpenSLES.h>
#include <SLES/OpenSLES_OpenHarmony.h>
#include <SLES/OpenSLES_Platform.h>
#include <string>
#include "file_utils.h"
#include "hilog/log.h"

#undef LOG_DOMAIN
#define LOG_DOMAIN 0x0001
#undef LOG_TAG
#define LOG_TAG "ActsAudioTest"

using namespace std;

namespace {

struct WAV_HEADER {
    /* RIFF Chunk Descriptor */
    uint8_t RIFF[4] = {'R', 'I', 'F', 'F'}; // RIFF Header Magic header
    uint32_t ChunkSize = 0; // RIFF Chunk Size
    uint8_t WAVE[4] = {'W', 'A', 'V', 'E'}; // WAVE Header
    /* "fmt" sub-chunk */
    uint8_t fmt[4] = {'f', 'm', 't', ' '}; // FMT header
    uint32_t Subchunk1Size = 16; // Size of the fmt chunk
    uint16_t AudioFormat = 1; // Audio format 1=PCM
    uint16_t NumOfChan = 2; // Number of channels 1=Mono 2=Stereo
    uint32_t SamplesPerSec = 44100; // Sampling Frequency in Hz
    uint32_t bytesPerSec = 176400; // bytes per second
    uint16_t blockAlign = 2; // 2=16-bit mono, 4=16-bit stereo
    uint16_t bitsPerSample = 16; // Number of bits per sample
    /* "data" sub-chunk */
    uint8_t Subchunk2ID[4] = {'d', 'a', 't', 'a'}; // "data"  string
    uint32_t Subchunk2Size = 0; // Sampled data length
};

using wav_hdr = struct WAV_HEADER;

void SetUpTestCase() {}
void TearDownTestCase() {}
void SetUp() {}
void TearDown() {}

static void BuqqerQueueCallback(SLOHBufferQueueItf sBufferQueueItf, void *pContext, SLuint32 size);

static SLuint32 PlayerStart(SLPlayItf sPlayItf, SLOHBufferQueueItf sBufferQueueItf, FILE *wavFile);

static SLuint32 PlayerStop(SLPlayItf sPlayItf, SLOHBufferQueueItf sBufferQueueItf);

static SLresult OpenSlTest();

static SLresult OpenSlTestConcurrent();

const SLuint32 number = 3;
//const char* READPATH1 = "/data/audio/S16LE_2_44100.pcm";
//const char* READPATH2 = "/data/audio/S16LE_2_64000.pcm";
const char* READPATH1 = "/data/storage/el2/base/files/audio/S16LE_2_44100.pcm";
const char* READPATH2 = "/data/storage/el2/base/files/audio/S16LE_2_64000.pcm";
FILE *wavFile_ = nullptr;
FILE *wavFile1_ = nullptr;
FILE *wavFile2_ = nullptr;
wav_hdr wavHeader_;
wav_hdr wavHeader1_;
wav_hdr wavHeader2_;
SLObjectItf engineObject = nullptr;
SLObjectItf outputMixObject = nullptr;
SLPlayItf playItf;
SLPlayItf playItf1;
SLPlayItf playItf2;
SLVolumeItf volumeItf1;
SLVolumeItf volumeItf2;
SLOHBufferQueueItf bufferQueueItf;
SLOHBufferQueueItf bufferQueueItf1;
SLOHBufferQueueItf bufferQueueItf2;
SLObjectItf pcmPlayerObject = nullptr;
SLObjectItf pcmPlayerObject1 = nullptr;
SLObjectItf pcmPlayerObject2 = nullptr;

static SLresult OpenSlTest()
{
    OH_LOG_INFO(LOG_APP, "OpenSlTest enter");
    // DEBUG_TAG_START
    OH_LOG_INFO(LOG_APP, "[DEBUG_LOG] OpenSlTest wavHeader: NumOfChan=%{public}d, SamplesPerSec=%{public}d, bitsPerSample=%{public}d",
        wavHeader_.NumOfChan, wavHeader_.SamplesPerSec, wavHeader_.bitsPerSample);
    // DEBUG_TAG_END
    engineObject = nullptr;
    SLEngineItf engineEngine = nullptr;
    SLresult result = slCreateEngine(&engineObject, 0, nullptr, 0, nullptr, nullptr);
    // get engine object
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTest slCreateEngine result: %{public}lu", result);
        return result;
    }
    result = (*engineObject)->Realize(engineObject, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTest Realize result: %{public}lu", result);
        return result;
    }
    // get engineEngine object
    result = (*engineObject)->GetInterface(engineObject, SL_IID_ENGINE, &engineEngine);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTest get engineEngine result: %{public}lu", result);
        return result;
    }
    outputMixObject = nullptr;
    result = (*engineEngine)->CreateOutputMix(engineEngine, &outputMixObject, 0, nullptr, nullptr);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTest CreateOutputMix result: %{public}lu", result);
        return result;
    }
    result = (*outputMixObject)->Realize(outputMixObject, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTest outPut Realize result: %{public}lu", result);
        return result;
    }

    SLDataLocator_OutputMix slOutputMix = {SL_DATALOCATOR_OUTPUTMIX, outputMixObject};
    SLDataSink slSink = {&slOutputMix, nullptr};
    SLDataLocator_BufferQueue slBufferQueue = {
        SL_DATALOCATOR_BUFFERQUEUE,
        0
    };
    SLDataFormat_PCM pcmFormat = {
        SL_DATAFORMAT_PCM,
        wavHeader_.NumOfChan,
        wavHeader_.SamplesPerSec * 1000,
        wavHeader_.bitsPerSample,
        0,
        0,
        0
    };
    SLDataSource slSource = {&slBufferQueue, &pcmFormat};
    // DEBUG_TAG_START
    OH_LOG_INFO(LOG_APP, "[DEBUG_LOG] OpenSlTest pcmFormat: numChannels=%{public}d, samplesPerSec=%{public}d, bitsPerSample=%{public}d",
        pcmFormat.numChannels, pcmFormat.samplesPerSec, pcmFormat.bitsPerSample);
    // DEBUG_TAG_END

    result = (*engineEngine)->CreateAudioPlayer(engineEngine, &pcmPlayerObject,
        &slSource, &slSink, number, nullptr, nullptr);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTest CreateAudioPlayer result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject)->Realize(pcmPlayerObject, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTest CreateAudioPlayer Realize result: %{public}lu", result);
        return result;
    }
    // get bufferQueueItf object
    result = (*pcmPlayerObject)->GetInterface(pcmPlayerObject, SL_IID_PLAY, &playItf);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTest get playItf result: %{public}lu", result);
        return result;
    }
    SLVolumeItf volumeItf;
    result = (*pcmPlayerObject)->GetInterface(pcmPlayerObject, SL_IID_VOLUME, &volumeItf);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTest get volumeItf result: %{public}lu", result);
        return result;
    }
    SLmillibel pLevel = 0;
    result = (*volumeItf)->GetVolumeLevel(volumeItf, &pLevel);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTest GetVolumeLevel result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject)->GetInterface(pcmPlayerObject, SL_IID_OH_BUFFERQUEUE, &bufferQueueItf);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTest get bufferQueueItf result: %{public}lu", result);
        return result;
    }
    result = (*bufferQueueItf)->RegisterCallback(bufferQueueItf, BuqqerQueueCallback, wavFile_);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTest RegisterCallback result: %{public}lu", result);
        return result;
    }
    result = PlayerStart(playItf, bufferQueueItf, wavFile_);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTest PlayerStart result: %{public}lu", result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "OpenSlTest return  result: %{public}lu", result);
    return result;
}

static SLresult OpenSlTestConcurrent()
{
    OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent start");
    // DEBUG_TAG_START
    OH_LOG_INFO(LOG_APP, "[DEBUG_LOG] OpenSlTestConcurrent wavHeader1: NumOfChan=%{public}d, SamplesPerSec=%{public}d, bitsPerSample=%{public}d",
        wavHeader1_.NumOfChan, wavHeader1_.SamplesPerSec, wavHeader1_.bitsPerSample);
    OH_LOG_INFO(LOG_APP, "[DEBUG_LOG] OpenSlTestConcurrent wavHeader2: NumOfChan=%{public}d, SamplesPerSec=%{public}d, bitsPerSample=%{public}d",
        wavHeader2_.NumOfChan, wavHeader2_.SamplesPerSec, wavHeader2_.bitsPerSample);
    // DEBUG_TAG_END
    engineObject = nullptr;
    SLEngineItf engineEngine = nullptr;
    SLresult result = slCreateEngine(&engineObject, 0, nullptr, 0, nullptr, nullptr);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent slCreateEngine result: %{public}lu", result);
        return result;
    }
    result = (*engineObject)->Realize(engineObject, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent Realize result: %{public}lu", result);
        return result;
    }

    result = (*engineObject)->GetInterface(engineObject, SL_IID_ENGINE, &engineEngine);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent get engineEngine result: %{public}lu", result);
        return result;
    }

    outputMixObject = nullptr;
    result = (*engineEngine)->CreateOutputMix(engineEngine, &outputMixObject, 0, nullptr, nullptr);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent CreateOutputMix result: %{public}lu", result);
        return result;
    }
    result = (*outputMixObject)->Realize(outputMixObject, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent outPut Realize result: %{public}lu", result);
        return result;
    }
    SLuint32 state;
    result = (*outputMixObject)->GetState(outputMixObject, &state);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent outPut GetState result: %{public}lu", result);
        return result;
    }

    SLDataLocator_OutputMix slOutputMix = {SL_DATALOCATOR_OUTPUTMIX, outputMixObject};
    SLDataSink slSink = {&slOutputMix, nullptr};
    SLDataLocator_BufferQueue slBufferQueue = {
        SL_DATALOCATOR_BUFFERQUEUE,
        0
    };
    SLDataFormat_PCM pcmFormat1 = {
        SL_DATAFORMAT_PCM,
        wavHeader1_.NumOfChan,
        wavHeader1_.SamplesPerSec * 1000,
        wavHeader1_.bitsPerSample,
        0,
        0,
        0
    };
    SLDataFormat_PCM pcmFormat2 = {
        SL_DATAFORMAT_PCM,
        wavHeader2_.NumOfChan,
        wavHeader2_.SamplesPerSec * 1000,
        wavHeader2_.bitsPerSample,
        0,
        0,
        0
    };
    SLDataSource slSource1 = {&slBufferQueue, &pcmFormat1};
    SLDataSource slSource2 = {&slBufferQueue, &pcmFormat2};
    // DEBUG_TAG_START
    OH_LOG_INFO(LOG_APP, "[DEBUG_LOG] OpenSlTestConcurrent pcmFormat1: numChannels=%{public}d, samplesPerSec=%{public}d, bitsPerSample=%{public}d",
        pcmFormat1.numChannels, pcmFormat1.samplesPerSec, pcmFormat1.bitsPerSample);
    OH_LOG_INFO(LOG_APP, "[DEBUG_LOG] OpenSlTestConcurrent pcmFormat2: numChannels=%{public}d, samplesPerSec=%{public}d, bitsPerSample=%{public}d",
        pcmFormat2.numChannels, pcmFormat2.samplesPerSec, pcmFormat2.bitsPerSample);
    // DEBUG_TAG_END

    result = (*engineEngine)->CreateAudioPlayer(engineEngine, &pcmPlayerObject1, &slSource1,
        &slSink, number, nullptr, nullptr);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent CreateAudioPlayer pcmPlayerObject1 Realize result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject1)->Realize(pcmPlayerObject1, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent outPut Realize pcmPlayerObject1 result: %{public}lu", result);
        return result;
    }

    result = (*engineEngine)->CreateAudioPlayer(engineEngine, &pcmPlayerObject2, &slSource2, &slSink,
        number, nullptr, nullptr);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent CreateAudioPlayer pcmPlayerObject2 result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject2)->Realize(pcmPlayerObject2, SL_BOOLEAN_FALSE);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent Realize pcmPlayerObject2 result: %{public}lu", result);
        return result;
    }

    result = (*pcmPlayerObject1)->GetInterface(pcmPlayerObject1, SL_IID_PLAY, &playItf1);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent playItf1 result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject2)->GetInterface(pcmPlayerObject2, SL_IID_PLAY, &playItf2);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent playItf2 result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject1)->GetInterface(pcmPlayerObject1, SL_IID_VOLUME, &volumeItf1);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent volumeItf1 result: %{public}lu", result);
        return result;
    }

    SLmillibel level1 = 0;
    (*volumeItf1)->GetMaxVolumeLevel(volumeItf1, &level1);
    SLmillibel temp = 2; // SetVolumeLevel level1
    level1 = (SLmillibel) (level1 / temp);
    (*volumeItf1)->SetVolumeLevel(volumeItf1, level1);
    (*pcmPlayerObject2)->GetInterface(pcmPlayerObject2, SL_IID_VOLUME, &volumeItf2);
    SLmillibel level2 = 0;
    (*volumeItf2)->GetMaxVolumeLevel(volumeItf2, &level2);
    temp = 15; // SetVolumeLevel level2
    level2 = (SLmillibel) (level2 / temp);
    (*volumeItf2)->SetVolumeLevel(volumeItf2, level2);

    result = (*pcmPlayerObject1)->GetInterface(pcmPlayerObject1, SL_IID_OH_BUFFERQUEUE, &bufferQueueItf1);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent bufferQueueItf1 result: %{public}lu", result);
        return result;
    }
    result = (*pcmPlayerObject2)->GetInterface(pcmPlayerObject2, SL_IID_OH_BUFFERQUEUE, &bufferQueueItf2);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent bufferQueueItf2 result: %{public}lu", result);
        return result;
    }
    result = (*bufferQueueItf1)->RegisterCallback(bufferQueueItf1, BuqqerQueueCallback, wavFile1_);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent RegisterCallback1 result: %{public}lu", result);
        return result;
    }
    result = (*bufferQueueItf2)->RegisterCallback(bufferQueueItf2, BuqqerQueueCallback, wavFile2_);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent RegisterCallback2 result: %{public}lu", result);
        return result;
    }
    result = PlayerStart(playItf1, bufferQueueItf1, wavFile1_);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent playItf1 PlayerStart result: %{public}lu", result);
        return result;
    }
    result = PlayerStart(playItf2, bufferQueueItf2, wavFile2_);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent playItf2 PlayerStart result: %{public}lu", result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "OpenSlTestConcurrent return  result: %{public}lu", result);
    return result;
}

static void BuqqerQueueCallback(SLOHBufferQueueItf sBufferQueueItf, void *pContext, SLuint32 size)
{
    FILE *wavFile = (FILE *)pContext;
    if (!feof(wavFile)) {
        SLuint8 *buffer = nullptr;
        SLuint32 pSize = 0;
        SLresult result = (*sBufferQueueItf)->GetBuffer(sBufferQueueItf, &buffer, &pSize);
        if (SL_RESULT_SUCCESS != result) {
            OH_LOG_INFO(LOG_APP, "BuqqerQueueCallback GetBuffer result: %{public}lu", result);
            return ;
        }
        fread(buffer, 1, size, wavFile);
        result = (*sBufferQueueItf)->Enqueue(sBufferQueueItf, buffer, size);
        if (SL_RESULT_SUCCESS != result) {
            OH_LOG_INFO(LOG_APP, "BuqqerQueueCallback Enqueue result: %{public}lu", result);
            return ;
        }
    }
    return ;
}

static SLresult PlayerStart(SLPlayItf sPlayItf, SLOHBufferQueueItf sBufferQueueItf, FILE *wavFile)
{
    OH_LOG_INFO(LOG_APP, "PlayerStart enter");
    SLresult result = (*sPlayItf)->SetPlayState(sPlayItf, SL_PLAYSTATE_PLAYING);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "PlayerStart SetPlayState result: %{public}lu", result);
        return result;
    }
    SLuint32 state = SL_PLAYSTATE_PLAYING;
    result = (*sPlayItf)->GetPlayState(sPlayItf, &state);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "PlayerStart GetPlayState result: %{public}lu", result);
        return result;
    }
    if (!feof(wavFile)) {
        SLuint8* buffer = nullptr;
        SLuint32 pSize = 0;
        result = (*sBufferQueueItf)->GetBuffer(sBufferQueueItf, &buffer, &pSize);
        if (SL_RESULT_SUCCESS != result) {
            OH_LOG_INFO(LOG_APP, "PlayerStart GetBuffer result: %{public}lu", result);
            return result;
        }
        fread(buffer, 1, pSize, wavFile);
        result = (*sBufferQueueItf)->Enqueue(sBufferQueueItf, buffer, pSize);
        if (SL_RESULT_SUCCESS != result) {
            OH_LOG_INFO(LOG_APP, "PlayerStart Enqueue result: %{public}lu", result);
            return result;
        }
    }
    OH_LOG_INFO(LOG_APP, "PlayerStart return  result: %{public}lu", result);
    return result;
}

static SLresult PlayerStop(SLPlayItf sPlayItf, SLOHBufferQueueItf sBufferQueueItf)
{
    OH_LOG_INFO(LOG_APP, "PlayerStop enetr");

    SLresult result = (*sPlayItf)->SetPlayState(sPlayItf, SL_PLAYSTATE_STOPPED);
    if (SL_RESULT_SUCCESS != result) {
        OH_LOG_INFO(LOG_APP, "PlayerStop SetPlayState result: %{public}lu", result);
        return result;
    }
    OH_LOG_INFO(LOG_APP, "PlayerStop return  result: %{public}lu", result);
    return result;
}
}

/**
 * @tc.name   SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0100
 * @tc.number SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0100
 * @tc.desc   Basic function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
static int SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0100()
{
    // 重新初始化 wavHeader，确保使用默认值
    wavHeader1_ = wav_hdr();
    wavHeader2_ = wav_hdr();
    
    size_t headerSize = sizeof(wav_hdr);
    char path[PATH_MAX + 1] = {0x00};
    if ((strlen(READPATH1) > PATH_MAX) || (realpath(READPATH1, path) == nullptr)) {
        OH_LOG_ERROR(LOG_APP, "Invalid path");
        return -1;
    }
    wavFile1_ = fopen(path, "rb");
    if (wavFile1_ == nullptr) {
        OH_LOG_ERROR(LOG_APP, "AudioRendererTest: Unable to open wave file");
        return -1;
    }
    // PCM文件无WAV头部，不读取，直接使用wavHeader的默认值
    // fread(&wavHeader1_, 1, headerSize, wavFile1_);

    headerSize = sizeof(wav_hdr);
    if ((strlen(READPATH2) > PATH_MAX) || (realpath(READPATH2, path) == nullptr)) {
        OH_LOG_ERROR(LOG_APP, "Invalid path");
        return -1;
    }
    wavFile2_ = fopen(path, "rb");
    if (wavFile2_ == nullptr) {
        OH_LOG_ERROR(LOG_APP, "AudioRendererTest: Unable to open wave file");
        return -1;
    }
    // PCM文件无WAV头部，不读取，直接使用wavHeader的默认值
    // fread(&wavHeader2_, 1, headerSize, wavFile2_);
    SLresult result = OpenSlTestConcurrent();
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }
    // 最大播放时间5秒，避免无限等待导致ANR
    int maxWaitTime = 5;
    int waitCount = 0;
    while ((!feof(wavFile1_) || !feof(wavFile2_)) && waitCount < maxWaitTime) {
        sleep(1);
        waitCount++;
    }
    result = PlayerStop(playItf1, bufferQueueItf1);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }

    result = PlayerStop(playItf2, bufferQueueItf2);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }
    (*pcmPlayerObject1)->Destroy(pcmPlayerObject1);
    (*pcmPlayerObject2)->Destroy(pcmPlayerObject2);
    (*outputMixObject)->Destroy(outputMixObject);
    (*engineObject)->Destroy(engineObject);
    return 0;
}

/**
 * @tc.name   SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0200
 * @tc.number SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0200
 * @tc.desc   Basic function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
static int SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0200()
{
    // 重新初始化 wavHeader，确保使用默认值
    wavHeader_ = wav_hdr();
    
    size_t headerSize = sizeof(wav_hdr);
        char path[PATH_MAX + 1] = {0x00};
        if ((strlen(READPATH1) > PATH_MAX) || (realpath(READPATH1, path) == nullptr)) {
            OH_LOG_ERROR(LOG_APP, "Invalid path");
            return -1;
        }
        wavFile_ = fopen(path, "rb");
        if (wavFile_ == nullptr) {
            OH_LOG_ERROR(LOG_APP, "AudioRendererTest: Unable to open wave file");
            return -1;
        }
        // PCM文件无WAV头部，不读取，直接使用wavHeader的默认值
        // fread(&wavHeader_, 1, headerSize, wavFile_);

        SLresult result = OpenSlTest();
        if (result != SL_RESULT_SUCCESS) {
            return -1;
        }

        // 最大播放时间2秒（两个文件共计4秒，避免超过6秒ANR阈值）
        int maxWaitTime = 3;
        int waitCount = 0;
        while (!feof(wavFile_) && waitCount < maxWaitTime) {
            sleep(1);
            waitCount++;
        }
        result = PlayerStop(playItf, bufferQueueItf);
        if (result != SL_RESULT_SUCCESS) {
            return -1;
        }
        (*pcmPlayerObject)->Destroy(pcmPlayerObject);
        (*outputMixObject)->Destroy(outputMixObject);
        (*engineObject)->Destroy(engineObject);

        char path2[PATH_MAX + 1] = {0x00};
        if ((strlen(READPATH2) > PATH_MAX) || (realpath(READPATH2, path2) == nullptr)) {
            OH_LOG_ERROR(LOG_APP, "Invalid path");
            return -1;
        }
        wavFile_ = fopen(path2, "rb");
        if (wavFile_ == nullptr) {
            OH_LOG_ERROR(LOG_APP, "AudioRendererTest: Unable to open wave file");
            return -1;
        }
        // PCM文件无WAV头部，不读取，直接使用wavHeader的默认值
        // fread(&wavHeader_, 1, headerSize, wavFile_);

        result = OpenSlTest();
        if (result != SL_RESULT_SUCCESS) {
            return -1;
        }

        // 最大播放时间2秒
        maxWaitTime = 2;
        waitCount = 0;
        while (!feof(wavFile_) && waitCount < maxWaitTime) {
            sleep(1);
            waitCount++;
        }
        result = PlayerStop(playItf, bufferQueueItf);
        if (result != SL_RESULT_SUCCESS) {
            return -1;
        }
        (*pcmPlayerObject)->Destroy(pcmPlayerObject);
        (*outputMixObject)->Destroy(outputMixObject);
        (*engineObject)->Destroy(engineObject);
        return 0;
}

/**
 * @tc.name   SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0100
 * @tc.number SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0100
 * @tc.desc   Basic function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
static int SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0100()
{
    SLEngineItf engineEngine = nullptr;
    engineObject = nullptr;
    SLresult result = slCreateEngine(&engineObject, 0, nullptr, 0, nullptr, nullptr);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }

    result = (*engineObject)->GetInterface(engineObject, SL_IID_ENGINE, &engineEngine);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }

    SLresult result1 = (*engineEngine)->CreateLEDDevice(engineEngine, nullptr, 0, 0, nullptr, nullptr);
    if (result1 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result2 = (*engineEngine)->CreateVibraDevice(engineEngine, nullptr, 0, 0, nullptr, nullptr);
    if (result2 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result4 = (*engineEngine)->CreateListener(engineEngine, nullptr, 0, nullptr, nullptr);
    if (result4 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result5 = (*engineEngine)->Create3DGroup(engineEngine, nullptr, 0, nullptr, nullptr);
    if (result5 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result6 = (*engineEngine)->CreateMetadataExtractor(engineEngine, nullptr, nullptr, 0, nullptr, nullptr);
    if (result6 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result7 = (*engineEngine)->CreateExtensionObject(engineEngine, nullptr, nullptr, 0,
        0, nullptr, nullptr);
    if (result7 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result8 = (*engineEngine)->QueryNumSupportedInterfaces(engineEngine, 0, nullptr);
    if (result8 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result9 = (*engineEngine)->QuerySupportedInterfaces(engineEngine, 0, 0, nullptr);
    if (result9 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result10 = (*engineEngine)->QueryNumSupportedExtensions(engineEngine, nullptr);
    if (result10 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result11 = (*engineEngine)->QuerySupportedExtension(engineEngine, 0, nullptr, nullptr);
    if (result11 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result12 = (*engineEngine)->IsExtensionSupported(engineEngine, nullptr, nullptr);
    if (result12 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0200
 * @tc.number SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0200
 * @tc.desc   Basic function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
static int SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0200()
{
    SLObjectItf engineObject_;
    SLresult result = slCreateEngine(&engineObject_, 0, nullptr, 0, nullptr, nullptr);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }

    SLresult result1 = (*engineObject_)->RegisterCallback(engineObject_, nullptr, nullptr);
    if (result1 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    (*engineObject_)->AbortAsyncOperation(engineObject_);

    SLresult result2 = (*engineObject_)->SetPriority(engineObject_, 0, SL_BOOLEAN_FALSE);
    if (result2 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result3 = (*engineObject_)->GetPriority(engineObject_, nullptr, nullptr);
    if (result3 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result4 = (*engineObject_)->SetLossOfControlInterfaces(engineObject_, 0, nullptr, false);
    if (result4 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0300
 * @tc.number SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0300
 * @tc.desc   Basic function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
static int SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0300()
{
    // get engineObject
    engineObject = nullptr;
    SLresult result = slCreateEngine(&engineObject, 0, nullptr, 0, nullptr, nullptr);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }

    // get engineEngine
    SLEngineItf engineEngine = nullptr;
    result = (*engineObject)->GetInterface(engineObject, SL_IID_ENGINE, &engineEngine);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }

    // get pcmPlayerObject
    pcmPlayerObject = nullptr;
    SLDataLocator_OutputMix slOutputMix = {SL_DATALOCATOR_OUTPUTMIX, outputMixObject};
    SLDataSink slSink = {&slOutputMix, nullptr};
    SLDataLocator_BufferQueue slBufferQueue = {
        SL_DATALOCATOR_BUFFERQUEUE,
        0};
    SLDataFormat_PCM pcmFormat = {
        SL_DATAFORMAT_PCM,
        wavHeader_.NumOfChan,
        wavHeader_.SamplesPerSec * 1000,
        wavHeader_.bitsPerSample,
        0,
        0,
        0};
    SLDataSource slSource = {&slBufferQueue, &pcmFormat};
    result = (*engineEngine)->CreateAudioPlayer(engineEngine, &pcmPlayerObject, &slSource, &slSink,
        number, nullptr, nullptr);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }

    // get playItf
    playItf = nullptr;
    result = (*pcmPlayerObject)->GetInterface(pcmPlayerObject, SL_IID_PLAY, &playItf);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }

    SLresult result1 = (*playItf)->GetDuration(playItf, nullptr);
    if (result1 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result2 = (*playItf)->GetPositionUpdatePeriod(playItf, nullptr);
    if (result2 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result3 = (*playItf)->RegisterCallback(playItf, nullptr, nullptr);
    if (result3 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result4 = (*playItf)->SetCallbackEventsMask(playItf, 0);
    if (result4 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result5 = (*playItf)->GetCallbackEventsMask(playItf, 0);
    if (result5 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result6 = (*playItf)->SetMarkerPosition(playItf, 0);
    if (result6 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result7 = (*playItf)->GetMarkerPosition(playItf, nullptr);
    if (result7 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result8 = (*playItf)->SetPositionUpdatePeriod(playItf, 0);
    if (result8 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result9 = (*playItf)->ClearMarkerPosition(playItf);
    if (result9 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result10 = (*playItf)->GetPosition(playItf, nullptr);
    if (result10 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0400
 * @tc.number SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0400
 * @tc.desc   Basic function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
static int SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0400()
{
    // get engineObject
    engineObject = nullptr;
    SLresult result = slCreateEngine(&engineObject, 0, nullptr, 0, nullptr, nullptr);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }

    // get engineEngine
    SLEngineItf engineEngine = nullptr;
    result = (*engineObject)->GetInterface(engineObject, SL_IID_ENGINE, &engineEngine);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }

    // get pcmPlayerObject
    pcmPlayerObject = nullptr;
    SLDataLocator_OutputMix slOutputMix = {SL_DATALOCATOR_OUTPUTMIX, outputMixObject};
    SLDataSink slSink = {&slOutputMix, nullptr};
    SLDataLocator_BufferQueue slBufferQueue = {
        SL_DATALOCATOR_BUFFERQUEUE,
        0};
    SLDataFormat_PCM pcmFormat = {
        SL_DATAFORMAT_PCM,
        wavHeader_.NumOfChan,
        wavHeader_.SamplesPerSec * 1000,
        wavHeader_.bitsPerSample,
        0,
        0,
        0};
    SLDataSource slSource = {&slBufferQueue, &pcmFormat};
    result = (*engineEngine)->CreateAudioPlayer(engineEngine, &pcmPlayerObject, &slSource,
        &slSink, number, nullptr, nullptr);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }

    // get volumeItf
    SLVolumeItf volumeItf = nullptr;
    result = (*pcmPlayerObject)->GetInterface(pcmPlayerObject, SL_IID_VOLUME, &volumeItf);
    if (result != SL_RESULT_SUCCESS) {
        return -1;
    }

    SLresult result1 = (*volumeItf)->SetMute(volumeItf, SL_BOOLEAN_FALSE);
    if (result1 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result2 = (*volumeItf)->GetMute(volumeItf, nullptr);
    if (result2 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result3 = (*volumeItf)->EnableStereoPosition(volumeItf, SL_BOOLEAN_FALSE);
    if (result3 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result4 = (*volumeItf)->IsEnabledStereoPosition(volumeItf, nullptr);
    if (result4 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result5 = (*volumeItf)->SetStereoPosition(volumeItf, 0);
    if (result5 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }

    SLresult result6 = (*volumeItf)->GetStereoPosition(volumeItf, nullptr);
    if (result6 != SL_RESULT_FEATURE_UNSUPPORTED) {
        return -1;
    }
    return 0;
}