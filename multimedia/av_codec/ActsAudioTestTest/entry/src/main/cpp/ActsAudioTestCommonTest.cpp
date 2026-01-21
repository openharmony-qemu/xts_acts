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

#include "include/ActsAudioTestCommonTest.h"
// 以下是补充的必要头文件（标注：仅为编译所需的基础头文件，无业务逻辑）
#include <iostream>
#include <unistd.h>
#include <fstream>

using namespace std;
//using namespace OHOS;

// 回调函数实现
void OHOS::OnError(OH_AVCodec *codec, int32_t errorCode, void *userData)
{
    (void)codec;
    (void)errorCode;
    (void)userData;
    cout << "Error received, errorCode:" << errorCode << endl;
}

void OHOS::OnOutputFormatChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
{
    (void)codec;
    (void)format;
    (void)userData;
    cout << "OnOutputFormatChanged received" << endl;
}

void OHOS::OnInputBufferAvailableAv(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *data, void *userData)
{
    (void)codec;
    AEncSignalAv *signal = static_cast<AEncSignalAv *>(userData);
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inQueue_.push(index);
    signal->inBufferQueue_.push(data);
    signal->inCond_.notify_all();
}

void OHOS::OnOutputBufferAvailableAv(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *data, void *userData)
{
    (void)codec;
    AEncSignalAv *signal = static_cast<AEncSignalAv *>(userData);
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outQueue_.push(index);
    signal->outBufferQueue_.push(data);
    if (data) {
    } else {
        cout << "OnOutputBufferAvailable error, attr is nullptr!" << endl;
    }
    signal->outCond_.notify_all();
}

// AudioCodeCapiEncoderNdkTest 类实现
void OHOS::AudioCodeCapiEncoderNdkTest::SetUpTestCase(void)
{
    cout << "[SetUpTestCase]: " << endl;
}

void OHOS::AudioCodeCapiEncoderNdkTest::TearDownTestCase(void)
{
    cout << "[TearDownTestCase]: " << endl;
}

void OHOS::AudioCodeCapiEncoderNdkTest::SetUp(void)
{
    cout << "[SetUp]: SetUp!!!" << endl;
}

void OHOS::AudioCodeCapiEncoderNdkTest::TearDown(void)
{
    if (signalAv_ != nullptr) {
        delete signalAv_;
        signalAv_ = nullptr;
    }
    cout << "[TearDown]: over!!!" << endl;
}

int32_t OHOS::AudioCodeCapiEncoderNdkTest::ProceByMimeFunc(const std::string mime, bool isEncoder)
{
    audioEnc_ = OH_AudioCodec_CreateByMime(mime.c_str(), isEncoder);
    if (audioEnc_ == nullptr) {
        return OHOS::RESULT_CONFIG_FAIL;
    }

    signalAv_ = new AEncSignalAv();
    if (signalAv_ == nullptr) {
        audioEnc_ = nullptr;
        return OHOS::RESULT_CONFIG_FAIL;
    }

    avcb_ = {&OnError, &OnOutputFormatChanged, &OnInputBufferAvailableAv, &OnOutputBufferAvailableAv};
    if (OH_AudioCodec_RegisterCallback(audioEnc_, avcb_, signalAv_) != AV_ERR_OK) {
        delete signalAv_;
        signalAv_ = nullptr;
        audioEnc_ = nullptr;
        return OHOS::RESULT_CONFIG_FAIL;
    }

    format = OH_AVFormat_Create();
    return AV_ERR_OK;
}

int32_t OHOS::AudioCodeCapiEncoderNdkTest::ProceByCapabilityFunc(const std::string mime, bool isEncoder)
{
    OH_AVCapability *cap = OH_AVCodec_GetCapability(mime.c_str(), isEncoder);
    const char *name = OH_AVCapability_GetName(cap);
    audioEnc_ = OH_AudioCodec_CreateByName(name);
    if (audioEnc_ == nullptr) {
        return OHOS::RESULT_CONFIG_FAIL;
    }

    signalAv_ = new AEncSignalAv();
    if (signalAv_ == nullptr) {
        audioEnc_ = nullptr;
        return OHOS::RESULT_CONFIG_FAIL;
    }

    avcb_ = {&OnError, &OnOutputFormatChanged, &OnInputBufferAvailableAv, &OnOutputBufferAvailableAv};
    if (OH_AudioCodec_RegisterCallback(audioEnc_, avcb_, signalAv_) != AV_ERR_OK) {
        delete signalAv_;
        signalAv_ = nullptr;
        audioEnc_ = nullptr;
        return OHOS::RESULT_CONFIG_FAIL;
    }

    format = OH_AVFormat_Create();
    return AV_ERR_OK;
}

void OHOS::AudioCodeCapiEncoderNdkTest::InputFuncAv()
{
    OH_AVCodecBufferAttr info = {};
    bool isEos = false;
    inputFile_ = std::make_unique<std::ifstream>(inputFilePath_, std::ios::binary);
    if (!inputFile_->is_open()) {
        std::cout << "open file failed, path: " << inputFilePath_ << std::endl;
        return;
    }
    while (isRunning_.load()) {
        unique_lock<mutex> lock(signalAv_->inMutex_);
        signalAv_ -> inCond_.wait(lock, [this]() -> bool {
            return (signalAv_->inQueue_.size() > 0) || (!isRunning_.load());
        });
        if (!isRunning_.load()) {
            break;
        }
        uint32_t index = signalAv_->inQueue_.front();
        auto buffer = signalAv_->inBufferQueue_.front();
        isEos = !inputFile_->eof();
        if (!isEos) {
            inputFile_->read((char *)OH_AVBuffer_GetAddr(buffer), frameBytes_);
        }
        info.size = frameBytes_;
        info.flags = AVCODEC_BUFFER_FLAGS_NONE;
        if (isEos) {
            info.size = 0;
            info.flags = AVCODEC_BUFFER_FLAGS_EOS;
        } else if (isFirstFrame_) {
            info.flags = AVCODEC_BUFFER_FLAGS_CODEC_DATA;
            isFirstFrame_ = false;
        }
        info.offset = 0;
        OH_AVBuffer_SetBufferAttr(buffer, &info);
        int32_t ret = OH_AudioCodec_PushInputBuffer(audioEnc_, index);
        signalAv_->inQueue_.pop();
        signalAv_->inBufferQueue_.pop();
        if (ret != AV_ERR_OK) {
            isRunning_ = false;
            break;
        }
        if (isEos) {
            break;
        }
        timeStamp_ += FRAME_DURATION_US;
    }
    inputFile_->close();
}

void OHOS::AudioCodeCapiEncoderNdkTest::OutputFuncAv()
{
    std::ofstream outputFile;
    outputFile.open(outputFilePath_, std::ios::out | std::ios::binary);
    if (!outputFile.is_open()) {
        std::cout << "open file failed, path: " << outputFilePath_ << std::endl;
        return;
    }

    while (isRunning_.load()) {
        unique_lock<mutex> lock(signalAv_->outMutex_);
        signalAv_ -> inCond_.wait(lock, [this]() -> bool {
            return (signalAv_->inQueue_.size() > 0) || (!isRunning_.load());
        });

        if (!isRunning_.load()) {
            cout << "wait to stop, exit" << endl;
            break;
        }

        uint32_t index = signalAv_->outQueue_.front();
        auto *data = signalAv_->outBufferQueue_.front();
        OH_AVCodecBufferAttr attr;
        OH_AVBuffer_GetBufferAttr(data, &attr);
        if (data != nullptr) {
            outputFile.write(reinterpret_cast<char *>(OH_AVBuffer_GetAddr(data)), attr.size);
        }
        if (data != nullptr && (attr.flags == AVCODEC_BUFFER_FLAGS_EOS || attr.size == 0)) {
            cout << "encode eos" << endl;
            isRunning_.store(false);
            signalAv_->startCond_.notify_all();
        }
        signalAv_->outBufferQueue_.pop();
        signalAv_->outQueue_.pop();
        if (OH_AudioCodec_FreeOutputBuffer(audioEnc_, index) != AV_ERR_OK) {
            cout << "Fatal: FreeOutputData fail" << endl;
            break;
        }
    }
    outputFile.close();
}

void OHOS::AudioCodeCapiEncoderNdkTest::HeAACSampleRateTest(int32_t profile)
{
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profile);
    set<uint32_t> supportedSampleRateSet = {
        16000, 22050, 24000, 32000, 44100, 48000, 64000, 88200, 96000,
    };
    for (const uint32_t rate : supportedSampleRateSet) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, rate);
        if (OH_AudioCodec_Configure(audioEnc_, format) != AV_ERR_OK) {} //return
        if (OH_AudioCodec_Reset(audioEnc_) != AV_ERR_OK) {}
    }
}

void OHOS::AudioCodeCapiEncoderNdkTest::ChannelCountTest(set<int32_t> &supportedChannelCntSet, int32_t profile)
{
    ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profile);
    for (const int32_t cnt : supportedChannelCntSet) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, cnt);
        if (OH_AudioCodec_Configure(audioEnc_, format) != AV_ERR_OK) {} //return
        if (OH_AudioCodec_Reset(audioEnc_) != AV_ERR_OK) {}
    }
}

void OHOS::AudioCodeCapiEncoderNdkTest::ChannelLayoutTest(map<OH_AudioChannelLayout, int32_t>LayoutMap, int32_t profile)
{
    ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profile);
    map<OH_AudioChannelLayout, int32_t>::iterator iter;
    for (iter = supportedLayoutMap.begin(); iter != supportedLayoutMap.end(); iter++) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, iter->second);
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_CHANNEL_LAYOUT, iter->first);
        if (OH_AudioCodec_Configure(audioEnc_, format) != AV_ERR_OK) {} //return
        if (OH_AudioCodec_Reset(audioEnc_) != AV_ERR_OK) {}
    }
}

bool OHOS::AudioCodeCapiEncoderNdkTest::IsSupportHeAac()
{
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability_GetSupportedProfiles(cap, &profiles, &profileNum);
    for (uint32_t i = 0; i < profileNum; i++) {
        if (profiles[i] == AAC_PROFILE_HE) {
            cout << "support HE-AAC" << endl;
            return true;
        }
    }
    cout << "not support HE-AAC" << endl;
    return false;
}
/**
 * @tc.name   EncoderConfigureLCAAC
 * @tc.number EncoderConfigureLCAAC
 * @tc.desc   EncoderConfigureLCAAC
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int32_t OHOS::AudioCodeCapiEncoderNdkTest::EncoderConfigureLCAAC()
{
    inputFilePath_ = AAC_INPUT_FILE_PATH;
    outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    if (OH_AudioCodec_Configure(audioEnc_, format) != AV_ERR_OK) {
        return OHOS::RESULT_CONFIG_FAIL;
    }
    isRunning_.store(true);
    
    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderNdkTest::InputFuncAv, this);
    if (inputLoop_ == nullptr) {
        return OHOS::RESULT_CONFIG_FAIL;
    }
    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderNdkTest::OutputFuncAv, this);
    if (outputLoop_ == nullptr) {
        return OHOS::RESULT_CONFIG_FAIL;
    }
    
    if (OHCodec_Start(audioEnc_) != AV_ERR_OK) {
        return OHOS::RESULT_UNDEFINED_ERROR;
    }
    while (isRunning_.load()) {
        sleep(1);
    }
    
    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->inMutex_);
            signalAv_->inCond_.notify_all();
        }
        inputLoop_->join();
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->outMutex_);
            signalAv_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    
    if (OH_AudioCodec_Flush(audioEnc_) != AV_ERR_OK) {
        return OHOS::FLUSH_ERROR;
    }
    if (OH_AudioCodec_Destroy(audioEnc_) != AV_ERR_OK) {
        return OHOS::ERROR_DESTROY_FAILED;
    }
    return AV_ERR_OK; //自加
}
/**
 * @tc.name   EncoderConfigureHEAAC
 * @tc.number EncoderConfigureHEAAC
 * @tc.desc   EncoderConfigureHEAAC
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
void OHOS::AudioCodeCapiEncoderNdkTest::SetHeAacConfig()
{
    inputFilePath_ = AAC_INPUT_FILE_PATH;
    outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, AAC_PROFILE_HE);
}

int32_t OHOS::AudioCodeCapiEncoderNdkTest::ValidateAndConfigureEncoder()
{
    if (IsSupportHeAac()) {
        if (OH_AudioCodec_Configure(audioEnc_, format) != AV_ERR_OK) {
            return OHOS::RESULT_CONFIG_FAIL;
        }
    } else {
        if (OH_AudioCodec_Configure(audioEnc_, format) == AV_ERR_OK) {
            return OHOS::RESULT_UNEXPECTED_CONFIG_SUCCESS;
        }
        if (OH_AudioCodec_Destroy(audioEnc_) != AV_ERR_OK) {
            return OHOS::RESULT_DESTROY_FAIL;
        }
        return OHOS::RESULT_UNDEFINED_ERROR;
    }
    return AV_ERR_OK;
}

int32_t OHOS::AudioCodeCapiEncoderNdkTest::ManageHeAacThreadsAndResources()
{
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderNdkTest::InputFuncAv, this);
    if (inputLoop_ == nullptr) {
        return OHOS::RESULT_CONFIG_FAIL;
    }

    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderNdkTest::OutputFuncAv, this);
    if (outputLoop_ == nullptr) {
        if (inputLoop_ != nullptr && inputLoop_->joinable()) {
            inputLoop_->join();
        }
        return OHOS::RESULT_DESTROY_FAIL;
    }

    if (OH_AudioCodec_Start(audioEnc_) != AV_ERR_OK) {
        return OHOS::START_CODEC_FAILED;
    }

    while (isRunning_.load()) {
        sleep(1);
    }

    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->inMutex_);
            signalAv_->inCond_.notify_all();
        }
        inputLoop_->join();
    }
    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->outMutex_);
            signalAv_->outCond_.notify_all();
        }
        outputLoop_->join();
    }

    if (OH_AudioCodec_Flush(audioEnc_) != AV_ERR_OK) {
        return OHOS::FLUSH_ERROR;
    }
    if (OH_AudioCodec_Destroy(audioEnc_) != AV_ERR_OK) {
        return OHOS::ERROR_DESTROY_FAILED;
    }

    return AV_ERR_OK;
}

int32_t OHOS::AudioCodeCapiEncoderNdkTest::EncoderConfigureHEAAC()
{
    SetHeAacConfig();

    int32_t ret = ValidateAndConfigureEncoder();
    if (ret != AV_ERR_OK) {
        return ret;
    }

    ret = ManageHeAacThreadsAndResources();
    if (ret != AV_ERR_OK) {
        return ret;
    }

    return ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
}
/**
 * @tc.name   EncoderConfigureHEAACv2
 * @tc.number EncoderConfigureHEAACv2
 * @tc.desc   EncoderConfigureHEAACv2
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
void OHOS::AudioCodeCapiEncoderNdkTest::SetHeAacV2Config()
{
    inputFilePath_ = AAC_INPUT_FILE_PATH;
    outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, AAC_PROFILE_HE_V2);
}

int32_t OHOS::AudioCodeCapiEncoderNdkTest::ConfigureAudioEncoder()
{
    if (IsSupportHeAac()) {
        if (OH_AudioCodec_Configure(audioEnc_, format) != AV_ERR_OK) {
            return OHOS::RESULT_CONFIG_FAIL;
        }
    } else {
        if (OH_AudioCodec_Configure(audioEnc_, format) == AV_ERR_OK) {
            return OHOS::RESULT_UNEXPECTED_CONFIG_SUCCESS;
        }
        if (OH_AudioCodec_Destroy(audioEnc_) != AV_ERR_OK) {
            return OHOS::RESULT_DESTROY_FAIL;
        }
        return OHOS::RESULT_UNDEFINED_ERROR;
    }
    return AV_ERR_OK;
}

int32_t OHOS::AudioCodeCapiEncoderNdkTest::StartAndManageThreads()
{
    isRunning_.store(true);

    inputLoop_ = std::make_unique<std::thread>(&AudioCodeCapiEncoderNdkTest::InputFuncAv, this);
    if (inputLoop_ == nullptr) {
        return OHOS::RESULT_CONFIG_FAIL;
    }

    outputLoop_ = std::make_unique<std::thread>(&AudioCodeCapiEncoderNdkTest::OutputFuncAv, this);
    if (OH_AudioCodec_Start(audioEnc_) != AV_ERR_OK) {
        return OHOS::START_CODEC_FAILED;
    }

    while (isRunning_.load()) {
        sleep(1);
    }

    return AV_ERR_OK;
}

void OHOS::AudioCodeCapiEncoderNdkTest::CleanupResources()
{
    isRunning_.store(false);

    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            std::unique_lock<std::mutex> lock(signalAv_->inMutex_);
            signalAv_->inCond_.notify_all();
        }
        inputLoop_->join();
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            std::unique_lock<std::mutex> lock(signalAv_->outMutex_);
            signalAv_->outCond_.notify_all();
        }
        outputLoop_->join();
    }

    if (OH_AudioCodec_Flush(audioEnc_) != AV_ERR_OK) {
        return;
    }
    if (OH_AudioCodec_Destroy(audioEnc_) != AV_ERR_OK) {
        return;
    }
}

int32_t OHOS::AudioCodeCapiEncoderNdkTest::EncoderConfigureHEAACv2()
{
    SetHeAacV2Config();

    int32_t ret = ConfigureAudioEncoder();
    if (ret != AV_ERR_OK) {
        return ret;
    }

    ret = StartAndManageThreads();
    if (ret != AV_ERR_OK) {
        return ret;
    }

    CleanupResources();

    return ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
}
/**
 * @tc.name   EncoderConfigureByCap
 * @tc.number EncoderConfigureByCap
 * @tc.desc   EncoderConfigureByCap
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
void OHOS::AudioCodeCapiEncoderNdkTest::SetCapConfig()
{
    inputFilePath_ = AAC_INPUT_FILE_PATH;
    outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    
    if (IsSupportHeAac()) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, AAC_PROFILE_HE);
    }
}

int32_t OHOS::AudioCodeCapiEncoderNdkTest::CreateAndStartThreads()
{
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderNdkTest::InputFuncAv, this);
    if (inputLoop_ == nullptr) {
        return OHOS::RESULT_CONFIG_FAIL;
    }

    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderNdkTest::OutputFuncAv, this);
    if (outputLoop_ == nullptr) {
        if (inputLoop_ != nullptr && inputLoop_->joinable()) {
            inputLoop_->join();
        }
        return OHOS::RESULT_CONFIG_FAIL;
    }

    if (OH_AudioCodec_Start(audioEnc_) != AV_ERR_OK) {
        return OHOS::RESULT_CONFIG_FAIL;
    }

    while (isRunning_.load()) {
        sleep(1);
    }

    return AV_ERR_OK;
}

void OHOS::AudioCodeCapiEncoderNdkTest::CleanupCapResources()
{
    isRunning_.store(false);

    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->inMutex_);
            signalAv_->inCond_.notify_all();
        }
        inputLoop_->join();
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->outMutex_);
            signalAv_->outCond_.notify_all();
        }
        outputLoop_->join();
    }

    if (OH_AudioCodec_Flush(audioEnc_) != AV_ERR_OK) {
        return;
    }
    if (OH_AudioCodec_Destroy(audioEnc_) != AV_ERR_OK) {
        return;
    }
}

int32_t OHOS::AudioCodeCapiEncoderNdkTest::EncoderConfigureByCap()
{
    SetCapConfig();

    if (OH_AudioCodec_Configure(audioEnc_, format) != AV_ERR_OK) {
        return OHOS::RESULT_CONFIG_FAIL;
    }

    int32_t ret = CreateAndStartThreads();
    if (ret != AV_ERR_OK) {
        return ret;
    }

    CleanupCapResources();

    return ProceByCapabilityFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
}
/**
 * @tc.name   GetSampleRate
 * @tc.number GetSampleRate
 * @tc.desc   GetSampleRate
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int32_t OHOS::AudioCodeCapiEncoderNdkTest::GetSampleRate()
{
    if (!IsSupportHeAac()) {
        return AV_ERR_OK;
    }
    ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    HeAACSampleRateTest(AAC_PROFILE_HE);
    HeAACSampleRateTest(AAC_PROFILE_HE_V2);
    return 0;
}
/**
 * @tc.name   ChannelCountV1
 * @tc.number ChannelCountV1
 * @tc.desc   ChannelCountV1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int32_t OHOS::AudioCodeCapiEncoderNdkTest::ChannelCountV1()
{
    if (!IsSupportHeAac()) {
        return AV_ERR_OK;
    }
    set<int32_t> supportedChannelCntSet = {1, 2, 3, 4, 5, 6, 8};
    ChannelCountTest(supportedChannelCntSet, AAC_PROFILE_HE);
    return 0;
}
/**
 * @tc.name   ChannelCountV2
 * @tc.number ChannelCountV2
 * @tc.desc   ChannelCountV2
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int32_t OHOS::AudioCodeCapiEncoderNdkTest::ChannelCountV2()
{
    if (!IsSupportHeAac()) {
        return AV_ERR_OK;
    }
    set<int32_t> supportedChannelCntSet = {2};
    ChannelCountTest(supportedChannelCntSet, AAC_PROFILE_HE_V2);
    return 0;
}
/**
 * @tc.name   ChannelLayoutV1
 * @tc.number ChannelLayoutV1
 * @tc.desc   ChannelLayoutV1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int32_t OHOS::AudioCodeCapiEncoderNdkTest::ChannelLayoutV1()
{
    if (!IsSupportHeAac()) {
        return AV_ERR_OK;
    }
    map<OH_AudioChannelLayout, int32_t> supportedLayoutMap = {
        {CH_LAYOUT_MONO, 1},
        {CH_LAYOUT_STEREO, 2},
        {CH_LAYOUT_SURROUND, 3},
        {CH_LAYOUT_4POINT0, 4},
        {CH_LAYOUT_5POINT0_BACK, 5},
        {CH_LAYOUT_5POINT1_BACK, 6},
        {CH_LAYOUT_7POINT1_WIDE_BACK, 8},
        {CH_LAYOUT_7POINT1, 8},
    };
    ChannelLayoutTest(supportedLayoutMap, AAC_PROFILE_HE);
    return 0;
}
/**
 * @tc.name   ChannelLayoutV2
 * @tc.number ChannelLayoutV2
 * @tc.desc   ChannelLayoutV2
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int32_t OHOS::AudioCodeCapiEncoderNdkTest::ChannelLayoutV2()
{
    if (!IsSupportHeAac()) {
        return AV_ERR_OK;
    }
    map<OH_AudioChannelLayout, int32_t> supportedLayoutMap = {
        {CH_LAYOUT_STEREO, 2},
    };
    ChannelLayoutTest(supportedLayoutMap, AAC_PROFILE_HE_V2);
    return 0;
}
/**
 * @tc.name   AacProfile
 * @tc.number AacProfile
 * @tc.desc   AacProfile
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int32_t OHOS::AudioCodeCapiEncoderNdkTest::AacProfile()
{
    ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    set<int32_t> supportedAacProfile = {AAC_PROFILE_LC};
    if (IsSupportHeAac()) {
        supportedAacProfile = {AAC_PROFILE_LC, AAC_PROFILE_HE, AAC_PROFILE_HE_V2};
    }
    for (const int32_t profile : supportedAacProfile) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profile);
        if (OH_AudioCodec_Configure(audioEnc_, format) != AV_ERR_OK) {
            return OHOS::RESULT_CONFIG_FAIL;
        }
        if (OH_AudioCodec_Reset(audioEnc_) != AV_ERR_OK) {
            return OHOS::RESULT_DESTROY_FAIL;
        }
    }
    return AV_ERR_OK;
}
